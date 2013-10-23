Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8096CEE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 09:25:22 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id vb8so499578obc.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 02:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QMfwRAPGK56XfJXOBn0szpzXqaud6sIlBs0SrB47rlo=;
	b=j2jB21ar2pI1RdfWDwv8awJP1wC2v2BvZT/OyT9VXk6wluGHFBqA8XGFHRf7a0+3VS
	3nbut0TzSvmx4QtcKJKZfpKWFmKL2jvwo+gGfjWmmzbsH8kwpR14uV1nuNlFTgIr6KpU
	9QIRp0anyBmnM4xT48DXZZxohJMdNBjoBe4h02wjzcke1rMMym7+WFYYAiewtXwICA5S
	waii6k7iFEMOpOuH8jXPySa6sBoAj6XQ0mY3ZpLI78p78xrJx/xqQFcvIpqt8GElrq4D
	CNIlmK7ggKdeJTR23ELnvZLsgYyBnU1tisumaIYQLNPuQn/+1SEyftBY2FDVyR2JPuiZ
	DewA==
X-Gm-Message-State: ALoCoQlHGKUoPABbeCXK4SqYi/H+x9rHwdIpV3Kr7lrG42LGlxKeWyrTicSDPfoQsWXdm95j4MoY
X-Received: by 10.182.53.138 with SMTP id b10mr556696obp.66.1382520324051;
	Wed, 23 Oct 2013 02:25:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Wed, 23 Oct 2013 02:25:03 -0700 (PDT)
In-Reply-To: <CAJTo0LarVcibeP+x93G1fVVh0xvSs7E3qBY-OHhRnsYL3VzGrA@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
	<CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
	<CAP71Wjx-yoVSyqONwZsTWe5WNNac2nauCuxTNy81n3Ln5qJTzQ@mail.gmail.com>
	<CAJTo0LarVcibeP+x93G1fVVh0xvSs7E3qBY-OHhRnsYL3VzGrA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 23 Oct 2013 11:25:03 +0200
Message-ID: <CAP71Wjz1RWNPNfx58g+FsvDuk7U=zSH57LSpjPbMJ+O2ZPUL6w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Haifeng Yan <haifeng.yan@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 23 Oct 2013 09:25:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 23, 2013 at 11:00 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 October 2013 09:53, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>> i am still not convinced that we should treat GL and GLES with a
>> single 'DISTRO_FEATURE' since they aren't 'equivalent' features. I
>> understand we need a mechanism to say if the platforms has 'graphics'
>> support, and for some recipes 'graphics' is enough, but especially for
>> libsdl this isn't enough since on GLES platforms we don't want
>> --enable-video-opengl to be enabled since that is a GL feature, not
>> GLES.
>
> I don't think anyone thinks that the current opengl feature is
> sufficient but there hasn't been a good enough alternative just yet.
> Are you proposing that the "opengl" distro feature is re-purposed as
> "OpenGL", and we add "opengles" for "OpenGLES".  Does this need to be
> GLES-version-specific, what about EGL, and what about machines which
> can support multiple drivers/GPU hardware?

well, that's more or less what I had said in that thread earlier. e.g.
make opengl vs opengles 2 distinct "DISTRO_FEATURE". at least what's
sure now, is that currently it is broken, libsdl is the only instance
we have noticed the problem, there could be more, not sure.

i agree that we could easily extend the number of combos... but we
could start 'small' and add new 'feature' whenever needed. the problem
is probably even more subtle... right now opengl is a DISTRO_FEATURE
to say globally if the 'distro/stack' we build has some sort of
graphics.. if we start getting into EGL, GLX, and GL/GLES versions
then we start going into machine features.

a quick grep (in the layers i use) reveals that the situation isn't
really too good ;-)

-- meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:PACKAGECONFIG
??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl',
'openglesv2', d)}"
-- meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:
   ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl',
'--enable-gles', d)} \

here, we use opengl distro feature to switch between GL and GLES

-- meta-qt5/recipes-qt/qt5/qtbase.inc:PACKAGECONFIG_GL ?=
"${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"

here, opengl is used to enable GL , nothing about GLES. in our layer,
we have added a .bbapend with this to get Qt to work:

# By default, qtbase.inc PACKAGECONFIG_GL is either "gl" (if DISTRO_FEATURES
# includes "opengl") or empty (if it doesn't). Over-ride and force to "gles2".
PACKAGECONFIG_GL = "gles2"

-- openembedded-core/meta/conf/machine/include/ia32-base.inc:
 ${@base_contains('DISTRO_FEATURES', 'opengl',
'xserver-xorg-extension-glx', '', d)} \

here, used to enable GLX

-- openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb:
       ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
'', d)} \
-- openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb:
            ${@base_contains('DISTRO_FEATURES', 'opengl',
'--enable-video-opengl', '--disable-video-opengl', d)} \

here to enable GL features, incompatible with GLES.

-- openembedded-core/meta/recipes-graphics/wayland/weston_1.1.0.bb:
               ${@base_contains('DISTRO_FEATURES', 'opengles2',
'gles', '', d)} \

here, we have an instance of opengles2, which we discussed already.
that's the only place where we have that, and you agreed it was a bug.

-- openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb:PACKAGECONFIG
??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '',
d)}"
-- openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc:PACKAGECONFIG
??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri dri2
glx', '', d)}"

to enable GLX/DRI

-- openembedded-core/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb:DEPENDS
+= " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
'', d)}"

another instance, like libsdl which would break on GLES only platform.

-- openembedded-core/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb:
           ${@base_contains('DISTRO_FEATURES', 'opengl',
'--enable-webgl', '--disable-webgl', d)} \

here to enable WebGL

So i think given these examples, it's difficult to 'define' what
opengl DISTRO_FEATURE means. it is used for many different things, so
maybe this isn't the 'right level of abstraction'. what do you think?


ps: sorry, i have the feeling that gmail is going to mess up very
badly with the formatting of this email...

