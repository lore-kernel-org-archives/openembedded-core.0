Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 91253719F3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 13:34:41 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 12so4387615uas.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bbfflhwd9jd1IGOiaTUtF6v09dNHQU8c8VU6vqHhYhU=;
	b=PCvgIbHxBJpRP5KcLJ1yWW0x9Coo8mOmNbWspt8Z0GD+2SLEhkFUjQcIGl0Vav4/Mn
	EFUztRPpBjpXVoxt8iCEGMH41a10MB+kDnepJWzzT3dBU0XGa3sCxAK7WOcXX8/EJL3/
	PU01jnkLP4BzeNXBZVZovoxo0nVZj2lcxNWvJ47barHw3J0etd4M+C7b1WBflr+nkuOj
	m6iRGdHNYeUz79awmXQ3lSfHOxh8Rml3VG7D9dt8xqsCsKVL3BpqSjEZCLoKA8qqkoF2
	B2QnSD2gKNLF2ExRGlrdza4n81Fk0gY31KiVJmZO3EfFVGBnhpn3eYerimwiRsLEWPWY
	9Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bbfflhwd9jd1IGOiaTUtF6v09dNHQU8c8VU6vqHhYhU=;
	b=UpOADuNV/H/y3MgrVaDNxaV01L9ADRd1sxPshdmrGSDGXWelhNhfhPVZYnA0ZU+aF+
	euhfTpzfVRBS+N4C6AJmsgehjGYc8Uca38dunOcfy1n3sCPyHYk74PvIWPqLw2XQE6YU
	OqxslmWMY9KMaXkeIImBjQV8QEl1hi9IC6ll0GRGiuxDx8XJeFytmV8LNwNLpi3xc02G
	5OAco34kQfv7fqU1pyB0YyoyIbjKQcaqaRVJXRnWax5tosyfRuMXojI64orjY0VfByab
	5s+cBFjp5Lc5oFZBCIlsV3PWlEc8XEOyPcTuPgbO6sqA7cjU2Vhte6J6yv9JtQe6wiA5
	lOVQ==
X-Gm-Message-State: ABUngvc2PV/CjJ98eRd5cvVKAUQxmbodrDxZ4DtDm303R8tR4gGUNiihuJnFA4n9gj9xK38Bg0cdH/J9GDYS4w==
X-Received: by 10.176.85.152 with SMTP id v24mr19621132uaa.67.1477834482378;
	Sun, 30 Oct 2016 06:34:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Sun, 30 Oct 2016 06:34:41 -0700 (PDT)
In-Reply-To: <20161029084707.29652-1-raj.khem@gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sun, 30 Oct 2016 14:34:41 +0100
Message-ID: <CALbNGRSvqDHCA-3VPt379-Np29hZo-0ONbj=ZFd+Eew1K=4zFw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 30 Oct 2016 13:34:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 29, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
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
^ Split this into a second patch please you are changing two more or
less unrelated settings in one patch.
>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
>
>  EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
> @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>
>  # only search in the paths provided so cmake doesnt pick
>  # up libraries and tools from the native build machine
> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
^ Are you sure this doesn't break native builds? I am a bit scared: In
meta-qt5-extra I have lot's of native builds for build-helpers. KDE
guys seem to prefer this over shell scripts...

Andreas

