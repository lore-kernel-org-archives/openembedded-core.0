Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec13@gmail.com>) id 1TbqZS-0007Fe-Lp
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 11:33:18 +0100
Received: by mail-vc0-f175.google.com with SMTP id m8so4966640vcd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 02:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=owBB+2tbuDtJaKURtkHrQAVNS6+7VIWE+5dV1iNxT00=;
	b=HCxCNg6SRYoM0Vc1wtYINgWUx0d9/MSjRDHpEyWIdXfLyZNB2tkN5+M+219eCGzDea
	TR7OsvFYFz5eHmF9ADShAE8IedJnkggM9sqw83eMW2M6o4AxGDRU7U3V7+WM66r+Use+
	tpNSgIGJFSrtZP3zitK28gMedPRofEZWB6+W9zR+e/6N44TXySAkKNOioUPdEEx2psXR
	+LKKMazRwDkWS1F01JbykEWx1CuKqPsxNQMODsSom1/ZXmHa4W1/65OdlKyDWq94kuYE
	gGNvir+6ioJmOrMYPVugkp+m8zIYvoUVkZfluPCwg6F3u/UosEaz9uDN0+nwhPs11N+i
	shBg==
Received: by 10.220.119.196 with SMTP id a4mr5254545vcr.19.1353665950858; Fri,
	23 Nov 2012 02:19:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Fri, 23 Nov 2012 02:18:50 -0800 (PST)
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Fri, 23 Nov 2012 11:18:50 +0100
Message-ID: <CAOT3miLTTjGDPTj=dbNgnTvKXSg3bc+CL5nu8ASfEgMtxZBdHg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Fixes for xserver and omap* drivers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 10:33:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

On Fri, Nov 23, 2012 at 1:47 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Martin Jansa (4):
>   xf86-video-omap: add xf86driproto dependency, drop --enable-neon and
>     improve DESCRIPTION
>   xserver-xorg: disable dri2 too when building without glx
>     PACKAGECONFIG
>   xf86-video-omapfb: revive driver which actually works and is tested
>     on real devices
>   xf86-video-omap: drop RPROVIDES/RREPLACES/RCONFLICTS

so, I have tested this serie on pandaboard, using meta-ti layer for
the BSP and poky (i used master-next branch which has these patches).
I have tested with a couple of patches that I sent to meta-ti to
revert the xf86-video-omap that we had in meta-ti. For the reference,
i tested with this:
https://github.com/ndechesne/meta-ti/commits/test_new_xf-v-o (my new
patches aren't merged yet in master).

i tested with xf86-video-omap, not -omapfb, and with a v3.4 kernel
which I know has a working omapdrm driver.

it all looks good, the driver is loaded, and I tested resolution
change, as well as rotation , both with xrandr command (i tested
core-image-x11 image).

many thanks for sorting this out...

i have some questions... xf86-video-omap now clearly depends on opengl
DISTRO_FEATURE (since dri cannot be disabled) for the xserver build.
So if i build oe-core + meta-ti, it won't build as the xserver is
built without dri/glx support there, and then xf86-video-omap won't
build.
 - how should we handle that? it doesn't sound quite right to enfore a
DISTRO feature in a recipe... but is it possible to have a check for
opengl in the recipe? that would avoid a more cryptic build error..
 - how can I make an oe-core+meta-ti to build for Panda with this
video driver? e.g. where should I set this DISTRO_FEATURE in meta-ti,
outside of 'poky' distro, e.g. in a BSP layer?. I recall that we have
this in the xserver recipe:

PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl',
'glx', '', d)}"
PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
                      --disable-dri --disable-dri2 --disable-glx,\
                      xf86driproto dri2proto mesa-dri"

thx


