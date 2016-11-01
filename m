Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26001719CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:28:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p190so17577786wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eWdMuL5LaX5sJMUk0q08edAgxmYV/CWCJ+IxgMc4fGA=;
	b=A/SdS6j2kEYKbtSdWvO6mW0fSlUozM+4niAw8AZy2ivrliiRZUuk/UKFvEFXLOJ/TU
	M0g68EShH0BFp4ImrzBWi0OeCtqVG6RejXxazty+lgQzi/J7Iyt0USEIv0LqAgNFSMis
	0AR77Yz5jwdZy4FG7t3FYWFZpdcrpVBp5MgyjtpmJORGGqQReQ49LzzPs30crqsoZeN4
	kAedUseQ8Dgdw53rHp/hZJrXV1lJk2lQU1HT5/n0XKKTx7EPz8xu5ahAlRGWXTw7AgZf
	vSt0IHqyuuSn2Eslxio/Bzy8HSy1grfbPvj9FFcOmyQdPV3KLCi0aFTFCs5b/MbPeWHv
	zz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eWdMuL5LaX5sJMUk0q08edAgxmYV/CWCJ+IxgMc4fGA=;
	b=XdDFJ+bBUiUo2P+anXIBXQ8//DaAHFwwktDn5JyPkT2LQC3tvA0tRCPoMS9tRB5/wg
	8fHeH0XnQeJPZcd1uob4lvqYt9o7nSIvUZu3TbaLVkFMr26WI/yGMf7Ijj+IZucipLcB
	vn8X6+jVi9970CjCPWqFGcGCNOjhkVc6q91TNG8Jl45EENFm8Jy2rv6J2aiHSsrhgTb0
	TVI1y4uKCdAJaPOAkswzRz/t2b1QTpUCmhZWKOpEQ6uvg3KXacz0fQaH7Z6H7auAEaKZ
	MlJQWTGSOfmWyc39d6m4KLzmLJHT/9mprvFvcW1XrukNGzYyf9ecEi1HYguK8MPoKr4I
	4MGQ==
X-Gm-Message-State: ABUngvdjB4YknfNPRiGUVtJrcSdTf8Yo72RbptUsvU4R3ZJiznm4DStep5sLMqqZtkOF1JfuAdfvlP0IiVIn9w==
X-Received: by 10.28.27.23 with SMTP id b23mr2960696wmb.82.1478024896088; Tue,
	01 Nov 2016 11:28:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.155.103 with HTTP; Tue, 1 Nov 2016 11:28:15 -0700 (PDT)
In-Reply-To: <20161029084707.29652-1-raj.khem@gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 1 Nov 2016 11:28:15 -0700
Message-ID: <CAJ86T=Xw0qavJpud1YSSU94dQgYp=3tueYq59Z-jFatbhTjM0Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Exclude native sysroot from CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Tue, 01 Nov 2016 18:28:16 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 29, 2016 at 1:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This has been cause of issue where we were getting both usr/include
> dirs ( from target as well as native sysroot) added to compiler
> flags.
>
> CXX_INCLUDES in final flags.cmake would include
> -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
> most of the time it would work since headers are mostly
> common but netflix package failed to compile since one of
> the headers was including curl headers which it could not
> find in target sysroot and it went to next include path
> and found it in native sysroot which is not what we want
> when doing cross compile.
>
> As per https://cmake.org/Wiki/CMake_Cross_Compiling
> never search for programs in target sysroot but search
> for packages,libs,includes only.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/cmake.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 3e762de..3e8df37 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??= ""
>  OECMAKE_EXTRA_ROOT_PATH ?= ""
>
>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target = "NEVER"

Using the _class-target over-ride looks odd. Perhaps making "NEVER"
the default and adding over-rides for the classes which need "ONLY"
(if there are any?) would make this clearer?

>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
>
>  EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
> @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>
>  # only search in the paths provided so cmake doesnt pick
>  # up libraries and tools from the native build machine
> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>  set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
>  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

