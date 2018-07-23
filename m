Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id AA94C74F4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 07:45:14 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id A5A12FEC;
	Mon, 23 Jul 2018 09:45:14 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180721092402.20271-1-dv@pseudoterminal.org>
	<20180721092402.20271-3-dv@pseudoterminal.org>
	<CA+chaQcf7g82QFVs-gizWtyn84SoLCL02tgFgdOo-A07utynxQ@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <bfdbe6e3-0636-e057-bacc-19205110e14d@pseudoterminal.org>
Date: Mon, 23 Jul 2018 09:45:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcf7g82QFVs-gizWtyn84SoLCL02tgFgdOo-A07utynxQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 3/6] gstreamer1.0-plugin-bad: Update packageconfigs
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
X-List-Received-Date: Mon, 23 Jul 2018 07:45:15 -0000
Content-Type: multipart/alternative;
	boundary="------------BE5B6C2EB88B9A4AE9027465"
Content-Language: en-US

--------------BE5B6C2EB88B9A4AE9027465
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Right, this is a typo. I meant to remove the packageconfig though. We 
already talked about this (neon being dead, the recipe having been 
explicitely removed a while ago).

Also, before I do a v5, I need an explanation for what happened with 
patchwork. I suspect it was the Umlaut encoding problem.


On 2018-07-23 09:42, Martin Jansa wrote:
> --disable-neon is already there from neon PACKAGECONFIG you shouldn't 
> add it in EXTRA_OECONF, the comment about dependency gone would also 
> make more sense above PACKAGECONFIG not above EXTRA_OECONF.
>
> On Sat, Jul 21, 2018 at 11:24 AM Carlos Rafael Giani 
> <dv@pseudoterminal.org <mailto:dv@pseudoterminal.org>> wrote:
>
>     * Add packageconfigs for gl, libde265, lcms2, openh264, tinyalsa,
>     ttml,
>       webrtc, webrtcdsp
>     * Add note about neon being dead (and --disable-neon config switch)
>     * Remove unnecessary gstglconfig.h line, since that file is no longer
>       part of -bad (it is in -base now)
>     * Update EXTRA_OECONF flags, since new plugins got added to -bad
>     * Add ttml to the default packageconfigs since its dependencies are
>       all in oe-core
>
>     Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org
>     <mailto:dv@pseudoterminal.org>>
>     ---
>      .../gstreamer1.0-plugins-bad_1.14.1.bb
>     <http://gstreamer1.0-plugins-bad_1.14.1.bb>       | 35
>     ++++++++++++++-----
>      1 file changed, 26 insertions(+), 9 deletions(-)
>
>     diff --git
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
>     <http://gstreamer1.0-plugins-bad_1.14.1.bb>
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
>     <http://gstreamer1.0-plugins-bad_1.14.1.bb>
>     index 0e477e5a9c..721df60b8d 100644
>     ---
>     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
>     <http://gstreamer1.0-plugins-bad_1.14.1.bb>
>     +++
>     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
>     <http://gstreamer1.0-plugins-bad_1.14.1.bb>
>     @@ -27,9 +27,14 @@ PACKAGECONFIG ??= " \
>          ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez',
>     '', d)} \
>          ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
>          ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland',
>     '', d)} \
>     -    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile
>     uvch264 webp \
>     +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>     +    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile ttml
>     uvch264 webp \
>      "
>
>     +# the gl packageconfig enables OpenGL elements that haven't been
>     ported
>     +# to -base yet. They depend on the gstgl library in -base, so we do
>     +# not add GL dependencies here, since these are taken care of in
>     -base.
>     +
>      PACKAGECONFIG[assrender]       =
>     "--enable-assrender,--disable-assrender,libass"
>      PACKAGECONFIG[bluez]           =
>     "--enable-bluez,--disable-bluez,${BLUEZ}"
>      PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
>     @@ -43,13 +48,17 @@ PACKAGECONFIG[faad]            =
>     "--enable-faad,--disable-faad,faad2"
>      PACKAGECONFIG[flite]           =
>     "--enable-flite,--disable-flite,flite-alsa"
>      PACKAGECONFIG[fluidsynth]      =
>     "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
>      PACKAGECONFIG[hls]             = "--enable-hls
>     --with-hls-crypto=nettle,--disable-hls,nettle"
>     +PACKAGECONFIG[gl]              = "--enable-gl,--disable-gl,"
>      PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
>     +PACKAGECONFIG[libde265]        =
>     "--enable-libde265,--disable-libde265,libde265"
>      PACKAGECONFIG[libmms]          =
>     "--enable-libmms,--disable-libmms,libmms"
>      PACKAGECONFIG[libssh2]         =
>     "--enable-libssh2,--disable-libssh2,libssh2"
>     +PACKAGECONFIG[lcms2]           =
>     "--enable-lcms2,--disable-lcms2,lcms"
>      PACKAGECONFIG[modplug]         =
>     "--enable-modplug,--disable-modplug,libmodplug"
>      PACKAGECONFIG[neon]            = "--enable-neon,--disable-neon,neon"
>      PACKAGECONFIG[openal]          =
>     "--enable-openal,--disable-openal,openal-soft"
>      PACKAGECONFIG[opencv]          =
>     "--enable-opencv,--disable-opencv,opencv"
>     +PACKAGECONFIG[openh264]        =
>     "--enable-openh264,--disable-openh264,openh264"
>      PACKAGECONFIG[openjpeg]        =
>     "--enable-openjpeg,--disable-openjpeg,openjpeg"
>      # the opus encoder/decoder elements are now in the -base package,
>      # but the opus parser remains in -bad
>     @@ -61,28 +70,38 @@ PACKAGECONFIG[sbc]             =
>     "--enable-sbc,--disable-sbc,sbc"
>      PACKAGECONFIG[smoothstreaming] =
>     "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
>      PACKAGECONFIG[sndfile]         =
>     "--enable-sndfile,--disable-sndfile,libsndfile1"
>      PACKAGECONFIG[srtp]            =
>     "--enable-srtp,--disable-srtp,libsrtp"
>     +PACKAGECONFIG[tinyalsa]        =
>     "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"
>     +PACKAGECONFIG[ttml]            =
>     "--enable-ttml,--disable-ttml,libxml2 pango cairo"
>      PACKAGECONFIG[uvch264]         =
>     "--enable-uvch264,--disable-uvch264,libusb1 libgudev"
>      PACKAGECONFIG[voaacenc]        =
>     "--enable-voaacenc,--disable-voaacenc,vo-aacenc"
>      PACKAGECONFIG[voamrwbenc]      =
>     "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"
>      PACKAGECONFIG[vulkan]          =
>     "--enable-vulkan,--disable-vulkan,vulkan"
>      PACKAGECONFIG[wayland]         =
>     "--enable-wayland,--disable-wayland,wayland-native wayland
>     wayland-protocols libdrm"
>      PACKAGECONFIG[webp]            =
>     "--enable-webp,--disable-webp,libwebp"
>     +PACKAGECONFIG[webrtc]          =
>     "--enable-webrtc,--disable-webrtc,libnice"
>     +PACKAGECONFIG[webrtcdsp]       =
>     "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-audio-processing"
>
>      # these plugins have no corresponding library in OE-core or
>     meta-openembedded:
>      #   openni2 winks direct3d directsound winscreencap acm
>     apple_media iqa
>     -#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm
>     kate ladspa libde265
>     -#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openh264 opensles
>     soundtouch spandsp
>     -#   spc teletextdec tinyalsa vdpau wasapi x265 zbar webrtcdsp
>     +#   android_media avc bs2b chromaprint daala dts fdkaac gme gsm
>     kate ladspa
>     +#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openmpt opensles
>     soundtouch
>     +#   spandsp spc teletextdec vdpau wasapi x265 zbar
>     +
>     +# these plugins have been removed from oe-core because their
>     upstream dependencies
>     +# are no longer maintained or available:
>     +#   neon
>
>      EXTRA_OECONF += " \
>          --enable-decklink \
>          --enable-dvb \
>          --enable-fbdev \
>     +    --enable-ipcpipeline \
>          --enable-netsim \
>          --enable-shm \
>          --enable-vcd \
>          --disable-acm \
>          --disable-android_media \
>     +    --disable-aom \
>          --disable-apple_media \
>          --disable-avc \
>          --disable-bs2b \
>     @@ -97,26 +116,25 @@ EXTRA_OECONF += " \
>          --disable-iqa \
>          --disable-kate \
>          --disable-ladspa \
>     -    --disable-libde265 \
>          --disable-lv2 \
>          --disable-mpeg2enc \
>          --disable-mplex \
>          --disable-msdk \
>          --disable-musepack \
>     +    --disable-neon \
>          --disable-nvenc \
>          --disable-ofa \
>          --disable-openexr \
>     -    --disable-openh264 \
>     +    --disable-openmpt \
>          --disable-openni2 \
>          --disable-opensles \
>          --disable-soundtouch \
>          --disable-spandsp \
>          --disable-spc \
>     +    --disable-srt \
>          --disable-teletextdec \
>     -    --disable-tinyalsa \
>          --disable-vdpau \
>          --disable-wasapi \
>     -    --disable-webrtcdsp \
>          --disable-wildmidi \
>          --disable-winks \
>          --disable-winscreencap \
>     @@ -130,7 +148,6 @@ export OPENCV_PREFIX =
>     "${STAGING_DIR_TARGET}${prefix}"
>      ARM_INSTRUCTION_SET_armv4 = "arm"
>      ARM_INSTRUCTION_SET_armv5 = "arm"
>
>     -FILES_${PN}-dev +=
>     "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
>      FILES_${PN}-freeverb +=
>     "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
>      FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
>      FILES_${PN}-voamrwbenc +=
>     "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
>     -- 
>     2.17.1
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------BE5B6C2EB88B9A4AE9027465
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Right, this is a typo. I meant to remove the packageconfig
      though. We already talked about this (neon being dead, the recipe
      having been explicitely removed a while ago).</p>
    <p>Also, before I do a v5, I need an explanation for what happened
      with patchwork. I suspect it was the Umlaut encoding problem.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2018-07-23 09:42, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQcf7g82QFVs-gizWtyn84SoLCL02tgFgdOo-A07utynxQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <div dir="ltr">--disable-neon is already there from neon
        PACKAGECONFIG you shouldn't add it in EXTRA_OECONF, the comment
        about dependency gone would also make more sense above
        PACKAGECONFIG not above EXTRA_OECONF.</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Sat, Jul 21, 2018 at 11:24 AM Carlos Rafael
          Giani &lt;<a href="mailto:dv@pseudoterminal.org"
            moz-do-not-send="true">dv@pseudoterminal.org</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">* Add
          packageconfigs for gl, libde265, lcms2, openh264, tinyalsa,
          ttml,<br>
            webrtc, webrtcdsp<br>
          * Add note about neon being dead (and --disable-neon config
          switch)<br>
          * Remove unnecessary gstglconfig.h line, since that file is no
          longer<br>
            part of -bad (it is in -base now)<br>
          * Update EXTRA_OECONF flags, since new plugins got added to
          -bad<br>
          * Add ttml to the default packageconfigs since its
          dependencies are<br>
            all in oe-core<br>
          <br>
          Signed-off-by: Carlos Rafael Giani &lt;<a
            href="mailto:dv@pseudoterminal.org" target="_blank"
            moz-do-not-send="true">dv@pseudoterminal.org</a>&gt;<br>
          ---<br>
           .../<a href="http://gstreamer1.0-plugins-bad_1.14.1.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">gstreamer1.0-plugins-bad_1.14.1.bb</a> 
                | 35 ++++++++++++++-----<br>
           1 file changed, 26 insertions(+), 9 deletions(-)<br>
          <br>
          diff --git a/meta/recipes-multimedia/gstreamer/<a
            href="http://gstreamer1.0-plugins-bad_1.14.1.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">gstreamer1.0-plugins-bad_1.14.1.bb</a>
          b/meta/recipes-multimedia/gstreamer/<a
            href="http://gstreamer1.0-plugins-bad_1.14.1.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">gstreamer1.0-plugins-bad_1.14.1.bb</a><br>
          index 0e477e5a9c..721df60b8d 100644<br>
          --- a/meta/recipes-multimedia/gstreamer/<a
            href="http://gstreamer1.0-plugins-bad_1.14.1.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">gstreamer1.0-plugins-bad_1.14.1.bb</a><br>
          +++ b/meta/recipes-multimedia/gstreamer/<a
            href="http://gstreamer1.0-plugins-bad_1.14.1.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">gstreamer1.0-plugins-bad_1.14.1.bb</a><br>
          @@ -27,9 +27,14 @@ PACKAGECONFIG ??= " \<br>
               ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth',
          'bluez', '', d)} \<br>
               ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan',
          d)} \<br>
               ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
          'wayland', '', d)} \<br>
          -    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile
          uvch264 webp \<br>
          +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl',
          '', d)} \<br>
          +    bz2 curl dash dtls hls rsvg sbc smoothstreaming sndfile
          ttml uvch264 webp \<br>
           "<br>
          <br>
          +# the gl packageconfig enables OpenGL elements that haven't
          been ported<br>
          +# to -base yet. They depend on the gstgl library in -base, so
          we do<br>
          +# not add GL dependencies here, since these are taken care of
          in -base.<br>
          +<br>
           PACKAGECONFIG[assrender]       =
          "--enable-assrender,--disable-assrender,libass"<br>
           PACKAGECONFIG[bluez]           =
          "--enable-bluez,--disable-bluez,${BLUEZ}"<br>
           PACKAGECONFIG[bz2]             =
          "--enable-bz2,--disable-bz2,bzip2"<br>
          @@ -43,13 +48,17 @@ PACKAGECONFIG[faad]            =
          "--enable-faad,--disable-faad,faad2"<br>
           PACKAGECONFIG[flite]           =
          "--enable-flite,--disable-flite,flite-alsa"<br>
           PACKAGECONFIG[fluidsynth]      =
          "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"<br>
           PACKAGECONFIG[hls]             = "--enable-hls
          --with-hls-crypto=nettle,--disable-hls,nettle"<br>
          +PACKAGECONFIG[gl]              = "--enable-gl,--disable-gl,"<br>
           PACKAGECONFIG[kms]             =
          "--enable-kms,--disable-kms,libdrm"<br>
          +PACKAGECONFIG[libde265]        =
          "--enable-libde265,--disable-libde265,libde265"<br>
           PACKAGECONFIG[libmms]          =
          "--enable-libmms,--disable-libmms,libmms"<br>
           PACKAGECONFIG[libssh2]         =
          "--enable-libssh2,--disable-libssh2,libssh2"<br>
          +PACKAGECONFIG[lcms2]           =
          "--enable-lcms2,--disable-lcms2,lcms"<br>
           PACKAGECONFIG[modplug]         =
          "--enable-modplug,--disable-modplug,libmodplug"<br>
           PACKAGECONFIG[neon]            =
          "--enable-neon,--disable-neon,neon"<br>
           PACKAGECONFIG[openal]          =
          "--enable-openal,--disable-openal,openal-soft"<br>
           PACKAGECONFIG[opencv]          =
          "--enable-opencv,--disable-opencv,opencv"<br>
          +PACKAGECONFIG[openh264]        =
          "--enable-openh264,--disable-openh264,openh264"<br>
           PACKAGECONFIG[openjpeg]        =
          "--enable-openjpeg,--disable-openjpeg,openjpeg"<br>
           # the opus encoder/decoder elements are now in the -base
          package,<br>
           # but the opus parser remains in -bad<br>
          @@ -61,28 +70,38 @@ PACKAGECONFIG[sbc]             =
          "--enable-sbc,--disable-sbc,sbc"<br>
           PACKAGECONFIG[smoothstreaming] =
          "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"<br>
           PACKAGECONFIG[sndfile]         =
          "--enable-sndfile,--disable-sndfile,libsndfile1"<br>
           PACKAGECONFIG[srtp]            =
          "--enable-srtp,--disable-srtp,libsrtp"<br>
          +PACKAGECONFIG[tinyalsa]        =
          "--enable-tinyalsa,--disable-tinyalsa,tinyalsa"<br>
          +PACKAGECONFIG[ttml]            =
          "--enable-ttml,--disable-ttml,libxml2 pango cairo"<br>
           PACKAGECONFIG[uvch264]         =
          "--enable-uvch264,--disable-uvch264,libusb1 libgudev"<br>
           PACKAGECONFIG[voaacenc]        =
          "--enable-voaacenc,--disable-voaacenc,vo-aacenc"<br>
           PACKAGECONFIG[voamrwbenc]      =
          "--enable-voamrwbenc,--disable-voamrwbenc,vo-amrwbenc"<br>
           PACKAGECONFIG[vulkan]          =
          "--enable-vulkan,--disable-vulkan,vulkan"<br>
           PACKAGECONFIG[wayland]         =
          "--enable-wayland,--disable-wayland,wayland-native wayland
          wayland-protocols libdrm"<br>
           PACKAGECONFIG[webp]            =
          "--enable-webp,--disable-webp,libwebp"<br>
          +PACKAGECONFIG[webrtc]          =
          "--enable-webrtc,--disable-webrtc,libnice"<br>
          +PACKAGECONFIG[webrtcdsp]       =
          "--enable-webrtcdsp,--disable-webrtcdsp,webrtc-audio-processing"<br>
          <br>
           # these plugins have no corresponding library in OE-core or
          meta-openembedded:<br>
           #   openni2 winks direct3d directsound winscreencap acm
          apple_media iqa<br>
          -#   android_media avc bs2b chromaprint daala dts fdkaac gme
          gsm kate ladspa libde265<br>
          -#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openh264
          opensles soundtouch spandsp<br>
          -#   spc teletextdec tinyalsa vdpau wasapi x265 zbar webrtcdsp<br>
          +#   android_media avc bs2b chromaprint daala dts fdkaac gme
          gsm kate ladspa<br>
          +#   lv2 mpeg2enc mplex msdk musepack nvenc ofa openmpt
          opensles soundtouch<br>
          +#   spandsp spc teletextdec vdpau wasapi x265 zbar<br>
          +<br>
          +# these plugins have been removed from oe-core because their
          upstream dependencies<br>
          +# are no longer maintained or available:<br>
          +#   neon<br>
          <br>
           EXTRA_OECONF += " \<br>
               --enable-decklink \<br>
               --enable-dvb \<br>
               --enable-fbdev \<br>
          +    --enable-ipcpipeline \<br>
               --enable-netsim \<br>
               --enable-shm \<br>
               --enable-vcd \<br>
               --disable-acm \<br>
               --disable-android_media \<br>
          +    --disable-aom \<br>
               --disable-apple_media \<br>
               --disable-avc \<br>
               --disable-bs2b \<br>
          @@ -97,26 +116,25 @@ EXTRA_OECONF += " \<br>
               --disable-iqa \<br>
               --disable-kate \<br>
               --disable-ladspa \<br>
          -    --disable-libde265 \<br>
               --disable-lv2 \<br>
               --disable-mpeg2enc \<br>
               --disable-mplex \<br>
               --disable-msdk \<br>
               --disable-musepack \<br>
          +    --disable-neon \<br>
               --disable-nvenc \<br>
               --disable-ofa \<br>
               --disable-openexr \<br>
          -    --disable-openh264 \<br>
          +    --disable-openmpt \<br>
               --disable-openni2 \<br>
               --disable-opensles \<br>
               --disable-soundtouch \<br>
               --disable-spandsp \<br>
               --disable-spc \<br>
          +    --disable-srt \<br>
               --disable-teletextdec \<br>
          -    --disable-tinyalsa \<br>
               --disable-vdpau \<br>
               --disable-wasapi \<br>
          -    --disable-webrtcdsp \<br>
               --disable-wildmidi \<br>
               --disable-winks \<br>
               --disable-winscreencap \<br>
          @@ -130,7 +148,6 @@ export OPENCV_PREFIX =
          "${STAGING_DIR_TARGET}${prefix}"<br>
           ARM_INSTRUCTION_SET_armv4 = "arm"<br>
           ARM_INSTRUCTION_SET_armv5 = "arm"<br>
          <br>
          -FILES_${PN}-dev +=
          "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"<br>
           FILES_${PN}-freeverb +=
          "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"<br>
           FILES_${PN}-opencv +=
          "${datadir}/gst-plugins-bad/${LIBV}/opencv*"<br>
           FILES_${PN}-voamrwbenc +=
          "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"<br>
          -- <br>
          2.17.1<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------BE5B6C2EB88B9A4AE9027465--
