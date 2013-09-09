Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF2660FE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 13:18:16 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id db12so3322629veb.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 06:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/0FJ6atuJF4pDI0IOSuRCLsz0TeXyoq5V54GFDitYaA=;
	b=EQtI4SVF380iPwAh4KyoWIC88eRx0JcuWXalBj9AYFCrACOb5ptIoVXeg7gIj4X1Hw
	fjxEngGV0VtUV1mxoDDQ1KaNFbALrF1A3GL1NOZU5M8kjaPxXEXSlYF/SdgV5jx31CWY
	zC8EiPbo08CYUewspSFD1xNcDSzreIPLASRfZb8qGeqGNL4swGFpLHJkrrL/i2xcJ2tS
	8mw3WyoFGoasn1ALB3bkl0k5MXC1c1cDrKnkahRcrxQpMCvsGnsVpI6WxmBTfdMjsRkC
	pthiehUINYnrKHOYpAZ67Bxov1m/OKmgUf9IvKMxBye6SyDeuhb1VLL8/1uXrlI9G4ZP
	1YpA==
X-Gm-Message-State: ALoCoQk5H7MnDBLNhEOwJN7GgsAeN4lrosq5sH94eSLozCcz39ihXdJTv6DeBBwjtn8HAh17A8mC
X-Received: by 10.220.174.200 with SMTP id u8mr17600867vcz.6.1378732697901;
	Mon, 09 Sep 2013 06:18:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 9 Sep 2013 06:17:57 -0700 (PDT)
In-Reply-To: <CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
	<CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Sep 2013 14:17:57 +0100
Message-ID: <CAJTo0La3MjAB65jaHwzk8aqgPP8AHhEz_3ky8AWGu07ACFcHnQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Mon, 09 Sep 2013 13:18:16 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2013 13:40, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> how about gl vs gles?

The problem of any patch that touches the opengl distro feature is
that it causes this discussion, because the semantics of it are rather
vague to say the least!

> i have been trying to understand over the last couple of days whether or not
> 'opengl' in DISTRO_FEATURES means OpenGL and OpenGLES. I don't think it's
> clearly indicated anywhere.

My personal opinion is it means "enable support for the OpenGL
collection of APIs, include OpenGL, GLES and/or EGL".  Last year there
was a patch series from the early Wayland enabling that added machine
features for each form of GL, but that wasn't finished or merged (not
entirely required).

> in libsdl recipe, we have this:
>
> DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '',
> d)} \
>            ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
> '', d)} \
>
> and in EXTRA_OECONF we add this:
> ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl',
> '--disable-video-opengl', d)} \
>
> which tends to make me think that 'opengl' means 'OpenGL', not OpenGLES. I
> am building for ARM platforms with GLes support, but no GL support. I
> initially had 'opengl' in DISTRO_FEATURES, but we ended with mesa being
> pulled in because of libsdl, which was wrong. So we now removed 'opengl'
> from our DISTRO_FEATURES list. (note we have our own EGL/GLes library for
> GPU, so we don't want mesa at all).

OpenGL-wrangling aside, that's a pretty good example of where
PACKAGECONFIG should be used so your configuration can easily tweak
SDL without changing distro features.

> In weston recipe, we have this:
> ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)}
>
> so, that seems to imply that opengles2 is now a 'new' DISTRO_FEATURES, but
> it's only used once (looking at oe-core and meta-oe).

Not sure what I was thinking there, potentially a bad search and
replace.  As you say its the only instance of that feature.  Patch
incoming to fix that.

I'm happy for DISTRO_FEATURES to be vague and just mean the GL
collection instead of specific implementations, because OpenGL/GLX vs
GLESv2/EGL etc is a machine-specific feature and encoding that into
DISTRO_FEATURES would mean changing the distro features when the
machine changes, which is obviously wrong.  We may need some
machine-level hints as to the GL feature set available for recipes
that don't probe at runtime.

Ross

