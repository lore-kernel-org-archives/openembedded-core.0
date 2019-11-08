Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A37317FA47
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 04:50:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA84oZhc025607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Nov 2019 20:50:35 -0800 (PST)
Received: from [128.224.158.218] (128.224.158.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 7 Nov 2019 20:50:34 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20191107033029.95107-1-zhixiong.chi@windriver.com>
	<CAMKF1sqch6TtcwfA_FRZY=VPBTw_ueA6EVapDK9wegEjmNVteA@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <c61ead91-97a7-10e9-cf04-2d34c3a95479@windriver.com>
Date: Fri, 8 Nov 2019 12:51:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqch6TtcwfA_FRZY=VPBTw_ueA6EVapDK9wegEjmNVteA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libtirpc: create the symbol link for rpc header files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Nov 2019 04:50:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2019年11月08日 09:33, Khem Raj wrote:
> On Wed, Nov 6, 2019 at 9:54 PM Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
>> Since the Sun RPC is deprecated in glibc, the rpc header files
>> are not provided any more, but it allows alternative RPC
>> implementations, such as TIRPC or rpcsvc-proto, to be used.
>>
>> So we create the symbol link for rpc header files for tirpc to
>> be more compatible with the glibc version and the application usage.
>>
> https://errors.yoctoproject.org/Errors/Details/275527/
>
> seems to be related to this update
It seems the root cause is that gtkwave configure find the rpc/types.h 
and rpc/xdr.h because
of the commit "libtirpc: create the symbol link for rpc header files",
but it hasn't the option "--with-tirpc". So the RPC_LDADD still uses 
"-lrpc" other than "-ltirpc".
So I will generate update patch to add the option for gtkwave and send it to
meta-openembedded layer.

Thanks.

>
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> ---
>>   meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
>> index e73ffe7b17..a284521c1e 100644
>> --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
>> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
>> @@ -23,6 +23,20 @@ EXTRA_OECONF = "--disable-gssapi"
>>
>>   do_install_append() {
>>           chown root:root ${D}${sysconfdir}/netconfig
>> +        install -d ${D}${includedir}/rpc
>> +        install -d ${D}${includedir}/rpcsvc
>> +        for link_header in ${D}${includedir}/tirpc/rpc/*; do
>> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
>> +                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
>> +            fi
>> +        done
>> +        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
>> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
>> +                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
>> +            fi
>> +        done
>> +        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
>> +
>>   }
>>
>>   BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.23.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


