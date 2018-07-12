Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA6C460069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 20:19:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6CKJUtp026133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jul 2018 13:19:31 -0700 (PDT)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 12 Jul 2018 13:19:29 -0700
To: Andreas Oberritter <obi@opendreambox.org>,
	<openembedded-core@lists.openembedded.org>, "Bai, Haiqing"
	<Haiqing.Bai@windriver.com>
References: <20180711060118.30193-1-Haiqing.Bai@windriver.com>
	<20180711104111.722b3643@t460p>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <7f9f423d-07ca-2085-c0fc-c9a51ee53d62@windriver.com>
Date: Thu, 12 Jul 2018 16:19:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180711104111.722b3643@t460p>
X-Originating-IP: [172.25.44.2]
Subject: Re: [PATCH] iproute2: create symbol link '/bin/ip' to '/sbin/ip.iproute2'
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
X-List-Received-Date: Thu, 12 Jul 2018 20:19:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/11/2018 04:41 AM, Andreas Oberritter wrote:
> On Wed, 11 Jul 2018 14:01:17 +0800
> Haiqing Bai <Haiqing.Bai@windriver.com> wrote:
> 
>> Some applications which depend on iproute/iproute2 need to
>> run '/sbin/ip.iproute2' through the symbol link '/bin/ip'
>> e.g ifupdown.
> 
> Update-alternatives is supposed to create this link already.

I assume that update-alternatives is creating
    /sbin/ip -> /sbin/ip.iproute2
but for some reason ipupdown is looking for
    /bin/ip

Is that right Haiqing ?

Why not fix ifupdown?

../Randy

> 
>>
>> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
>> ---
>>   meta/recipes-connectivity/iproute2/iproute2.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
>> index 4fbfec6f08..71d04a1021 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>> @@ -29,6 +29,8 @@ do_configure_append () {
>>   do_install () {
>>       oe_runmake DESTDIR=${D} install
>>       mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
>> +    install -d ${D}${base_bindir}
>> +    ln -s ${base_sbindir}/ip.iproute2 ${D}${base_bindir}/ip
>>       install -d ${D}${datadir}
>>       mv ${D}/share/* ${D}${datadir}/ || true
>>       rm ${D}/share -rf || true
> 


-- 
# Randy MacLeod
# Wind River Linux

