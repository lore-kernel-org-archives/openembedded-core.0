Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Oct 2019 21:21:34 UTC
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [91.198.250.252])
	by mail.openembedded.org (Postfix) with ESMTP id AB99560125
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:21:34 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-u-107.mailbox.org (Postfix) with ESMTPS id 472ksl4zV6zKmld
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 22:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:mime-version:date:date:message-id:subject:subject
	:from:from:received; s=mail20150812; t=1572383781; bh=jaQL+WX65Z
	Q8NOrXQfOeYAuFmtLqelzDk+wgIzqvdZs=; b=ggZKQThv9jxs2FsyiEthqNagl/
	hCWTW8ousY20tPMYkPEkRZZXqy7JEOULU1F7VxNjPNiVje1DYZbj7xC8DRrvBE6w
	UQ2/yl7fhteI8CrkcyqatMW3EmLwULdAKBD5xfh2i88ePERCYbb5c06YPlj2KU1e
	PYdjP7oDRk5HD+3E1jhhldVyed4xXxsCumJkdzTr+BFxku/bu6Q3IgtPuzw7k3T9
	XlobcjZu2O285xi7jSjLiqygjCH8mlfhfyZTL96oph+P/8PJO22EQ22BWxL2qOwP
	b5GCUNLDiPVoaAgaaeD1xBbiAcTk6jh4shHcPF2Q9cZCT1lKoiz0mOYK5nFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1572383785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=zGLFZqxj5fyA7cn1P9jXuqvS+HhoskBT+e9D6RXerkU=;
	b=b1wToSON7R/AduFIEqTDYJG27kNMFxS5WF2TkK3UUMZFoaxHDpPqsZ3M2WQSzR7lkdGDBT
	4rOwjFw1izqufvcfTPqr4VNP27Rswwwz24B1mvbo0G7GCmtCn3EMjfXquhCwtvvdU6jd6V
	22s5LMT0Qet5a0yGwDJolvVZy+kprCgWqtaRfwuISfPXu2ef3XgzUDQFeefOm3NAuN5Wce
	9c+LZGcxAohe8gRXmTSYfJGzArntTKEtNEA3gRDZlm4TD8cJGSzW75CY/gAHifFSdDEoGA
	b9AxjZ4ZXU/lqoQq9VsgaihoCtElVUVP1vT9SWrvg9UdlmUHI2x1ju7WoZXu0g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id 7iaY1Gdvf5mh
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 22:16:21 +0100 (CET)
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <fdc2e1e6-364f-ec9e-dcb7-f983dc514743@mailbox.org>
Date: Tue, 29 Oct 2019 22:16:21 +0100
MIME-Version: 1.0
Subject: [RFC] Transitioning GStreamer 1.0 recipes to meson
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
X-List-Received-Date: Tue, 29 Oct 2019 21:21:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello all,

I have managed to transition most GStreamer recipes to meson. The 
patches can be found here: 
https://github.com/OSSystems/meta-gstreamer1.0/tree/transition-to-meson

The only recipe that still uses autotools is gst-validate, and that's 
because the tarball does not contain meson scripts. This is a known 
issue. https://gitlab.freedesktop.org/gstreamer/gst-devtools/issues/28

Overall, this worked well in my test builds, both on an i.MX6 machine 
and in a qemux86-64 VM.


Please note that this requires the 1.16.0 -> 1.16.1 changes I posted to 
the mailing list a few days ago.


Noteworthy changes:

- A lot of autotools/M4 related patches are just gone. Well, obviously 
:) But it is surprising just how much fewer patches there are now.

- gstreamer1.0-libav no longer builds its own FFmpeg copy. This was done 
in the past because there were no stable versioned FFmpeg releases. They 
do exist now, so in meson based builds, gst-libav just builds the actual 
plugin code, meaning that the build time is much shorter, most of the 
recipe code (and all of the patches) are gone (because they were FFmpeg 
specific), and the libgstlibav.so binary in /usr/lib/gstreamer-1.0/ is 
much smaller. This also means that FFmpeg specials do not have to be 
added both to the FFmpeg and to the gstreamer1.0-libav recipe anymore.

- gstreamer1.0-plugins.inc was replaced by 
gstreamer1.0-plugins-common.inc, and gst-plugins-package.inc by 
gstreamer1.0-plugins-packaging.inc . These names are clearer. 
gst-plugins-package.inc in particular was named that way because it used 
to be shared between GStreamer 0.10 and 1.0 recipes. Since the former 
are gone by now, there's no point in keeping that name.

- gstreamer1.0 ptest is now done differently. Originally, make was 
installed on the target and the Makefile was run by the run-ptest 
script. Now, gstreamer is patched to allow for installable tests that 
are accompanied by individual shell scripts that set up the necessary 
environment variables, along with .test files so that the 
gnome-desktop-testing test runner can be used in run-ptest to run the 
unit tests. This also makes it possible to inherit from ptest-gnome in 
the gstreamer1.0 recipe. The patch against gstreamer is necessary 
because by default, one runs the test by executing "meson test". I don't 
think installing meson along with all of the necessary meson.build 
scripts is a practical approach.

- OpenGL packageconfigs now work quite differently in 
gstreamer1.0-plugins-base, since the meson options distinguish between 
OpenGL APIs, platforms, and windowing systems.

- zlib in gstreamer1.0-plugins-base and -good is now required. I don't 
think this is a big deal, since it is also a dependency of GLib itself, 
so zlib has to be present on the rootfs anyway.


There are some TODOs left that I want to bring up here for discussion:

- The aforementioned PTest approach needs some review. Also, initially, 
I thought I'd have to add PTest support to several GStreamer recipes, 
which is why I isolated the ptest code in gstreamer1.0-ptest.inc . But 
it turned out that only the gstreamer1.0 recipe needs it. I am unsure if 
I should just merge that .inc into that recipe, since there's no reason 
why the tests from other recipes shouldn't be "ptest-ified" in the 
future. And then that .inc would be useful to have. (Tests from the 
plugin sets may be partially tough to run, since some of them create X11 
windows etc.)

- The code in gstreamer1.0-ptest.inc sets up run-ptest in a rather 
uncommon way, since that file has to be autogenerated.

- gstreamer1.0_1.16.1.bb and gstreamer1.0-plugins-common.inc both 
contain a "gettext_oemeson" function to set up meson NLS options. 
Ideally, this functionality would be part of the gettext bbclass itself. 
However, my bitbake/OE knowledge does not suffice to do that, since with 
meson, you want to be able to configure what the enable/disable flags 
should be ("enabled"/"disabled", "true"/"false" etc.); that's why for 
example the gtk-doc bbclass defines GTKDOC_MESON_OPTION, 
GTKDOC_MESON_ENABLE_FLAG, GTKDOC_MESON_DISABLE_FLAG. I am not sure how 
to combine such variables with this kind of custom python code, and 
still allow for customized values in other recipes. In other words, if I 
first get a "NLS_MESON_DISABLE_FLAG" value with getValue() in a modified 
gettext_oemeson function, then I might not get the value I expect, since 
it will get the initial value (the one set with ?=), not necessarily the 
one that is redefined by a recipe.

- The OpenGL packageconfigs are handled by a get_opengl_cmdline_list 
function in gstreamer1.0-plugins-base_1.16.1.bb . I did this so that a 
comma-separated list can be generated out of the packageconfigs that are 
(a) part of PACKAGECONFIG and (b) part of the newly added 
OPENGL_APIS/OPENGL_PLATFORMS/OPENGL_WINSYS lists. I do not know if 
there's a better approach for this. The intent is that other layers 
(most notably BSP layers) can add custom packageconfig names to these 
lists. One example would be OPENGL_WINSYS += "viv-fb" in meta-freescale. 
Another would be OPENGL_WINSYS += "dispmanx" in meta-raspberrypi.

- gstreamer1.0-python_1.16.1.bb currently has a problem in that the 
gst-python code tries to load /usr/lib/libpython3.7m.so. But, in a 
regular installation, only /usr/lib/libpython3.7m.so.1.0 would be 
availale. It is possible to adjust the libpython path & name during the 
build. But - what would it be adjusted to? How would the recipe know 
that "/usr/lib/libpython3.7m.so.1.0" is the correct choice? Or perhaps 
would it make sense to add the /usr/lib/libpython3.7m.so symlink to the 
regular (as in: non-dev) Python package?


cheers,

   Carlos


