Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8C267F881
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 03:19:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA73JwYa023538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Nov 2019 19:19:59 -0800
Received: from [128.224.158.218] (128.224.158.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 6 Nov 2019 19:19:58 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20191106103252.60923-1-zhixiong.chi@windriver.com>
	<00c1eec5eca9c2b85aa83c21d272073cf6331f12.camel@linuxfoundation.org>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <54de00eb-99a7-7ddc-d164-e02ab99ee049@windriver.com>
Date: Thu, 7 Nov 2019 11:20:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <00c1eec5eca9c2b85aa83c21d272073cf6331f12.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] libtirpc: create the symbol link for rpc header files
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
X-List-Received-Date: Thu, 07 Nov 2019 03:19:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry, I will send the V3 to use the relative link.

Thanks.


On 2019年11月07日 05:43, Richard Purdie wrote:
> On Wed, 2019-11-06 at 02:32 -0800, Zhixiong Chi wrote:
>> Since the Sun RPC is deprecated in glibc, the rpc header files
>> are not provided any more, but it allows alternative RPC
>> implementations, such as TIRPC or rpcsvc-proto, to be used.
>>
>> So we create the symbol link for rpc header files for tirpc to
>> be more compatible with the glibc version and the application usage.
>>
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
>> +                ln -sf ${includedir}/tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
>> +            fi
>> +        done
>> +        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
>> +            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
>> +                ln -sf ${includedir}/tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
>> +            fi
>> +        done
>> +        ln -sf  ${includedir}/tirpc/netconfig.h ${D}/${includedir}/netconfig.h
>> +
>>   }
> bitbake libtirpc-native shows lots (31) of:
>
> ERROR: libtirpc-native-1.1.4-r0 do_populate_sysroot: sstate found an absolute path symlink /media/build1/poky/build/tmp/work/x86_64-linux/libtirpc-native/1.1.4-r0/sysroot-destdir/media/build1/poky/build/tmp/work/x86_64-linux/libtirpc-native/1.1.4-r0/recipe-sysroot-native/usr/include/netconfig.h pointing at /media/build1/poky/build/tmp/work/x86_64-linux/libtirpc-native/1.1.4-r0/recipe-sysroot-native/usr/include/tirpc/netconfig.h. Please replace this with a relative link.
>
> Cheers,
>
> Richard
>
>

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


