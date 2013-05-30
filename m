Return-Path: <net147@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id A16DD6A49F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:11:48 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id u11so420108pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zV5z0cuY8vcCoSNgoARbnFHrvcWScV+yUTIuzDyuthI=;
	b=1IQwPgVy0JOPlOgyurdxKpczHbbEqNAdXkGbdvb4rWfae8pxKLJ42bM4ns0wjG6BSi
	E3RIwB1FaIpmIFCYyysJY6tmLnErP1m2voEy68FiZ/hqTfARVZ5mR34SMkFYaI+NAIOY
	c9Jv5w8lnplPazVe6vsG2VE7IBHHmBHtLKKefF8HxLXytbTbmM6d2geMGSK3bM/0BqY0
	ihDkdprYRtXEcxmQOHaR/HaDdjZOzCjx7QQstEDql3pR7QmyQ8ywvaQbkyoav1AxWDgT
	AlZS7mO3Bn55JcfAMe7So5Mv0nJ+2vbH7LMlpwA7y26wDDF8UOLZw+wi+EDzm0nqz6vv
	9bew==
X-Received: by 10.66.11.164 with SMTP id r4mr8593433pab.221.1369923109319;
	Thu, 30 May 2013 07:11:49 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	at1sm42193524pbc.10.2013.05.30.07.11.46 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 07:11:48 -0700 (PDT)
Message-ID: <51A75D03.7040601@gmail.com>
Date: Fri, 31 May 2013 00:06:59 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1369922325.git.ross.burton@intel.com>
	<9f69a701378d78848eeccd84759014a4afed492d.1369922325.git.ross.burton@intel.com>
In-Reply-To: <9f69a701378d78848eeccd84759014a4afed492d.1369922325.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] mesa: upgrade to 9.1.2
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
X-List-Received-Date: Thu, 30 May 2013 14:11:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2013 12:00 AM, Ross Burton wrote:
> Merge mesa-PV.bb and mesa-PV.inc as the is no point to the split now we're only
> building one variant of Mesa.
>
> Drop 0002-cross-compile.patch isn't needed as libtool is used instead of mklib.
> However, as libtool is used instead of mklib add fix-glsl-cross.patch to work
> around build failures caused by the cross libtool being used to build host
> binaries.
>
> Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build correctly in
> a non-X11 environment.
>
> Drop dont-fail-if-libX11-isnt-installed.patch and
> fix-egl-compilation-without-x11-headers.patch as they were backports.
>
> license.html had some formatting and typo fixes, update the checksum.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   13 -
>   .../mesa/mesa/0002-cross-compile.patch             |   94 ---
>   ...ate-NativeDisplayType-depending-on-config.patch |  358 +++++++++++
>   meta/recipes-graphics/mesa/mesa/cross-glsl.patch   |  632 --------------------
>   .../mesa/dont-fail-if-libX11-isnt-installed.patch  |   36 --
>   .../fix-egl-compilation-without-x11-headers.patch  |   32 -
>   .../mesa/mesa/fix-glsl-cross.patch                 |   43 ++
>   meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 -
>   meta/recipes-graphics/mesa/mesa_9.1.2.bb           |   14 +
>   9 files changed, 415 insertions(+), 811 deletions(-)
>   delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
>   create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
>   create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
>   create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.2.bb
Note that the current upstream version of Mesa is 9.1.3 - 
http://lists.freedesktop.org/archives/mesa-announce/2013-May/000051.html

Regards,
Jonathan

