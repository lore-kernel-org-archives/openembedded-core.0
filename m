Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2207.1592418515238316596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 11:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05HISUfO020371
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 17 Jun 2020 11:28:31 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 17 Jun
 2020 11:28:30 -0700
Subject: Re: [OE-core] [PATCH] xinit: add xterm to RDEPENDS
To: Changqing Li <changqing.li@windriver.com>
References: <20200617040731.1195528-1-changqing.li@windriver.com>
 <c3582a8864dbda0acefd9128f6d6d5cdddf33a85.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
Message-ID: <65e89c4e-22b4-493d-e214-78753d5ba0ba@windriver.com>
Date: Wed, 17 Jun 2020 14:28:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c3582a8864dbda0acefd9128f6d6d5cdddf33a85.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-06-17 6:51 a.m., Richard Purdie wrote:
> On Wed, 2020-06-17 at 12:07 +0800, Changqing Li wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> startx RDEPENDS on xterm, fix below error:
>> /etc/X11/xinit/xinitrc: line 55: exec: xterm: not found
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
>> index c9e28d9bba..5f8c370c59 100644
>> --- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
>> +++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
>> @@ -19,4 +19,4 @@ SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
>>   
>>   EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
>>   
>> -RDEPENDS_${PN} += "util-linux-mcookie"
>> +RDEPENDS_${PN} += "util-linux-mcookie xterm"
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/2015
> 
> ERROR: Nothing RPROVIDES 'xterm' (but /home/pokybuild/yocto-worker/qemux86-64-x32/build/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb RDEPENDS on or otherwise requires it)


xterm is in meta-oe. It seems to be a bit out of date:
   https://invisible-mirror.net/archives/xterm/
so please update to version 356

While we could pull xterm into oe-core, it's old crufty code
with several dependencies on similarily crufty libraries:
   https://layers.openembedded.org/layerindex/recipe/5041/

It would be better to understand why startx wants it and
use rxvt perhaps. People have been trying to get rid of
xterm and libxaw for many, many years. It seems that xinit
does have configure time support to specify what app to use
instead of xterm:

$ git blame configure.ac | grep xterm | \
sed -e 's/                //'
0a063866 (Kevin E Martin 2005-11-15 04:05:59 +0000  \
   47) DEFAULT_XTERM=xterm
0a063866 (Kevin E Martin 2005-11-15 04:05:59 +0000  \
   74) AC_ARG_WITH(xterm,
0a063866 (Kevin E Martin 2005-11-15 04:05:59 +0000  \
   75) 	 AS_HELP_STRING([--with-xterm=XTERM], [Path to xterm]),

and that 'feature' has survived. Can you see if we use rxvt by default
and have a PACKAGECONFIG to use xterm optionally?

../Randy

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
