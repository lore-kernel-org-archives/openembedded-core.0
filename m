Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id B7C3F7117E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 23:07:47 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id y20so77374ier.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=maBhaKx7xcQVAUPVifR/SBbbqRKNmOXinTiWPAbR8yo=;
	b=KEzI1azLXKwlwD+F/nmHGKBVLk3DaMMteuXDsDkTm9Vl6MGQc0LDgShf1LLsueW65L
	0F5A/lGHan0vwYaDuP96aS7J/Lu1hwCKIX36qnX5PGZAQiOer3vojimhbuqMzO3TRTGv
	nQ1PQVb0/D42aB7K4EmVHr2B0uk2LLvfIlKGZR6Z3Zf2wYGmZ1lVOZFSxO0huQg0ja8K
	c7RmT17GhYQ7F2ldiHBB/PwrseF6nXEL/B0/gyBG3BQFoqLns7Lct9puXgv7VMC07qEx
	kf7k/HOkj/K6uZwCowzmQI6a0d3koRVIqAmrUz5YNj7GLXAen3g8McVaQmIT3IuLlq5C
	0mJg==
X-Received: by 10.42.230.144 with SMTP id jm16mr8454327icb.68.1410995268295;
	Wed, 17 Sep 2014 16:07:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Wed, 17 Sep 2014 16:07:18 -0700 (PDT)
In-Reply-To: <1410964399-31077-1-git-send-email-philip@balister.org>
References: <1410964399-31077-1-git-send-email-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2014 16:07:18 -0700
Message-ID: <CAMKF1spggZ4tP2A6oOq_-mw9bPhrdYj9dWR9n5dr-5YNFyP_EQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass : Add support for cmake projects that use .S files.
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
X-List-Received-Date: Wed, 17 Sep 2014 23:07:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 17, 2014 at 7:33 AM, Philip Balister <philip@balister.org> wrote:
> UHD and GNU radio use the cmake build system. The toolchain file made
> from cmake.bbclass does not set the variable needs by cmake projects
> that use .S files. UHD added some .S files and these changes are required
> to build recent UHD.
>

I dont know if this is right thing to do in a generic bbclass. Since
some packages might use bare assembler to compiler assembly files

> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/classes/cmake.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index ab2adec..bfa5995 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -34,10 +34,13 @@ set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).
>  set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
>  set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>  set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> +set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
>  set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
>  set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
> +set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
>  set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
>  set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
> +set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "ASM FLAGS for release" )
>  set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>  set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

