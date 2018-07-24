Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5A271AC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 07:30:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6O7Ub1Q002192
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2018 00:30:37 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 24 Jul 2018 00:30:36 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20180723190928.27368-1-raj.khem@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
Date: Tue, 24 Jul 2018 15:34:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180723190928.27368-1-raj.khem@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Tue, 24 Jul 2018 07:30:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

The comments in security-flags.inc also needs to be modified to remove 
'poky-lsb' info.

I'd suggest we still put it into distro conf file (poky.conf) instead of 
defaultsetup.conf, because defaultsetup.conf is included by 
bitbake.conf. I think things in defaultsetup.conf should be necessary 
default values to build things out. I don't think security flags is 
necessary to build things out.

Also, I got a question when I just looked at this file.
Do you think we should adjust CFLAGS and LDFALGS in security_flags.inc 
instead of the current TARGET_CC_ARCH and TARGET_LDFLAGS? We are naming 
variables to SECURITY_CFLAGS and SECURITY_LDFLAGS, it seems that they 
belong to CFLAGS and LDFLAGS naturally. But I'm not sure about it.

Best Regards,
Chen Qi


On 07/24/2018 03:09 AM, Khem Raj wrote:
> This has been an opt-in for so long, some distributions e.g.
> poky-lsb uses it by default however, since most of linux
> distros have started to default to these settings for security
> enhancements, time has come for OE to make it default too
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/conf/distro/defaultsetup.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> index ca2f9178d2..352e279596 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -1,6 +1,7 @@
>   include conf/distro/include/default-providers.inc
>   include conf/distro/include/default-versions.inc
>   include conf/distro/include/default-distrovars.inc
> +require conf/distro/include/security_flags.inc
>   include conf/distro/include/world-broken.inc
>   
>   TCMODE ?= "default"



