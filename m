Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52094.1795434408824655750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 03:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=BwNGfl+7;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1795434406;
	bh=t8mJK89IczexHCdWYBDjiKUaDmi+SRGYy3sSUjUgUmU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BwNGfl+7BDS9pchpXmOaVY6S4xnNikRVFC/xJ85L8aJj6NvBg2vkxx9SWhNtj5vjp
	 ApCu3iwG+lW7gH3xRRBfhvGkyNBv3wVzoxnP2ebCYoOLced76hhmwtj+DTevMaYh1G
	 797Eqyms2qm3jC5sU5bwTKKgq67EhcVpV2MLIov9buiAB8AuvhRoKm0+XVxl4yVdzi
	 FtUz6ZDFGbrugvgg3Ruze3nhk1QCOtvUXvOpxwmJoMO/wm49sdibenZUemL8RSnNaC
	 Y/T9aItIjY2BWicKGf8lZxTpJe9yoiC1jVzX1t/Mcz94wipc/a67ICvUmZ8yg5k7+i
	 E4UY/TqJRsRaQ==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 1281A5F7AC;
	Mon, 23 Nov 2026 12:46:46 +0100 (CET)
Message-ID: <dc59b7a4-34c2-43e8-a22a-21737b3eade4@emlix.com>
Date: Mon, 23 Nov 2026 12:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] staging: allow special handling of
 initial-recipes also for native
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20261119055929.3286725-1-joerg.vehlow@emlix.com>
 <a16193f4de16a23bd5f89ec3ece8ee96de8a8ffa.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=B6rg_Vehlow?= <joerg.vehlow@emlix.com>
In-Reply-To: <a16193f4de16a23bd5f89ec3ece8ee96de8a8ffa.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 1.4.6 at mx1.emlix.com
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 11:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250905

Hi Richard

On 23.11.2026 12:39, Richard Purdie wrote:
> On Thu, 2026-11-19 at 06:59 +0100, Joerg Vehlow via openembedded-core wrote:
>> Sometimes a native recipe also needs bootstrapping (e.g. for ada,
>> rust or go)
>> -inital-native recipes are already handled different in bitbake.conf
>> (both suffixes are stripped).
>> During staging for the esdk these packages should also not be staged
>> in the sysroot as they might conflict like libgcc-initial does.
> 
> initial recipes are target/nativesdk only as far as I know. Where are
> you seeing these -initial-native recipes? Our rust build process
> doesn't have them, nor does go as far as I can tell?

You are right, there is no recipe that currently produces initial-native 
packages. But we implemented ada and gprbuild support, which is a bit 
tricky, because like go and rust it uses ada and gprbuild to bootstrap.
Ada is even more tricky, because it is not possible (at least not 
simple) to build a cross gcc with ada support using a different gcc 
version as the host compiler.
For that reason we have a recipe, that fetches a prebuilt gcc with ada 
support (from alire) and uses that to build gcc-cross. By definition the 
recipe that fetches the prebuilt gcc is a native package, but also an 
inital package, hence initial-native.
Fro gprbuild something similar applies, an initial version is build 
using the prebuilt gcc and that initial version then build the real 
gprbuild used for cross compilation. So we also have a 
gprbuild-initial-native recipe.

For the esdk these native packages are not required and shouldn't be 
staged, just like other initial-packages.

I hope that clarifies the use case, even if it does not apply to what 
openembedded is currently delivering.

> 
> Cheers,
> 
> Richard

