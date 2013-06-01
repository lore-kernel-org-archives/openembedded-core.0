Return-Path: <net147@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1299A620C2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2013 14:11:58 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id rp8so3654544pbb.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2013 07:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=iyO83gS458++HGoZFK6fKyOa4/N/Ar0Z0VGgRyij0IQ=;
	b=degESH+fyCAXwk3vu7agsGSv0O7LAuBjdxC4qKUh6viqAFIJ8BydnyNUAQWuHNsTIh
	tLE/RKLRSif+M05PCjpH8MaDaOzlN8FdrdgflSZUEvyOoWTSpfDTCfcsEfuBofadMG/m
	NyPVwRuzA1Mzwr56nDmiciPCfJHX1uZPJZPKz6qpXSxdlG1wYApp3xyxi74aSIOM/CFu
	P5hoSnEeC8ZPJXlQwbWD9RcQznEJYi0WusYlnMUEc+VYm0xNl1/c6ve5eRWMg6KB/8lu
	fSDLU1ZDo9fGkxQGvF3kQOkdfCJaQpSsNGV91ysnvAWridVSYUP1doc8NL7FT3a394Pq
	rFXw==
X-Received: by 10.66.13.8 with SMTP id d8mr9780389pac.4.1370095919094;
	Sat, 01 Jun 2013 07:11:59 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id pl9sm33158297pbc.5.2013.06.01.07.11.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 01 Jun 2013 07:11:58 -0700 (PDT)
Message-ID: <51AA0007.6040408@gmail.com>
Date: Sun, 02 Jun 2013 00:07:03 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1370012830.git.ross.burton@intel.com>
	<cc029e7ce7962745138abce9b4c949b31e08b781.1370012830.git.ross.burton@intel.com>
In-Reply-To: <cc029e7ce7962745138abce9b4c949b31e08b781.1370012830.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] mesa: upgrade to 9.1.3
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
X-List-Received-Date: Sat, 01 Jun 2013 14:11:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/06/2013 1:08 AM, Ross Burton wrote:
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
>   meta/recipes-graphics/mesa/mesa_9.1.3.bb           |   14 +
>   9 files changed, 415 insertions(+), 811 deletions(-)
>   delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
>   create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
>   create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
>   delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
>   create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.3.bb
configure: WARNING: unrecognized options: --disable-glu, --disable-glw, 
--disable-glut

Regards,
Jonathan

