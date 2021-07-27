Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.9190.1627380142593136997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 03:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=LOzw45G1;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from [IPv6:2001:a61:60f0:5401:b590:659d:d2ca:effd] (unknown [IPv6:2001:a61:60f0:5401:b590:659d:d2ca:effd])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5935583431;
	Tue, 27 Jul 2021 12:02:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1627380139;
	bh=/8FzivYKKkKiXA1I6QpE/J4rI9Jm6cX+NcLiyTmWOpE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=LOzw45G1/zSnOW4EGntoq9lprOErLiI8hxeyy2kfQc4IDuQseizLfj9KCKVtuOA23
	 WfETD7GKSPFxClOr7G7+fF1RQ1fEWaBMDu/tTdqXAUjwBHLNjjOeLmrhYkNphMxMiW
	 OrZwoHaZEPXEu3Vyb5L7mQaylJa7LRk12RKn4ztLlgzQRraJLTA2FXjIc+WlCSaEfd
	 +JTCrFiijYFIoBdZ06+Gom2FQEaq+Yvfb6QtrZXpkICU3//5AiUqqM+24XffKlq+Vz
	 Bueboor70hMWmJ5cpJUGU8CMtr5gypRbemataMGJema1MP/9d+MS9LLSryzP3G71Ih
	 hgkejrrqX3w0w==
Subject: Re: [OE-core] [PATCH] mtd-utils: upgrade 2.1.2 -> 2.1.3
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stefano Babic <sbabic@denx.de>
Cc: openembedded-core@lists.openembedded.org
References: <20210726074440.52571-1-sbabic@denx.de>
 <YP8+/JVDT2dHOkQ8@piout.net>
From: "Stefano Babic" <sbabic@denx.de>
Message-ID: <410060e6-0ebc-7cac-d00d-5e2d6b8f7a37@denx.de>
Date: Tue, 27 Jul 2021 12:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP8+/JVDT2dHOkQ8@piout.net>
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

Hi Alexandre,

On 27.07.21 01:02, Alexandre Belloni wrote:
> Hello Stefano,
> 
> On 26/07/2021 09:44:40+0200, Stefano Babic wrote:
>> Signed-off-by: Stefano Babic <sbabic@denx.de>
>> ---
>>   meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>> index 105a68dad8..66c27e0ce1 100644
>> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
>> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>> @@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
>>   DEPENDS = "zlib e2fsprogs util-linux"
>>   RDEPENDS_mtd-utils-tests += "bash"
>>   
>> -PV = "2.1.2"
>> +PV = "2.1.3"
>>   
> 
> This fails with:
> ERROR: mtd-utils-native-2.1.3-r0 do_configure: QA Issue: mtd-utils-native: configure was passed unrecognised options: --enable-install-tests [unknown-configure-option]
> ERROR: mtd-utils-native-2.1.3-r0 do_configure: Fatal QA errors found, failing task.
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/x86_64-linux/mtd-utils-native/2.1.3-r0/temp/log.do_configure.3957515
> NOTE: recipe mtd-utils-native-2.1.3-r0: task do_configure: Failed
> ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_configure) failed with exit code '1'

Thanks. In fact, I see that 2.1.3 drop the configuration 
--enable-install-tests. I send a V2 dropping the configuration option, 
adding David Gstir in case I am missing something else.

Regards,
Stefano

> 
> See:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3761/steps/11/logs/stdio
> 
>> -SRCREV = "7b986779342021bda87c04da3bf729718736d8ab"
>> +SRCREV = "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
>>   SRC_URI = "git://git.infradead.org/mtd-utils.git \
>>              file://add-exclusion-to-mkfs-jffs2-git-2.patch \
>>              "
>> -- 
>> 2.25.1
>>
> 
>>
>>
>>
> 
> 
> 
> 
> 
> 


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================
