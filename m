Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2BE6BF67
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 18:10:17 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 07A112A5D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 20:10:14 +0200 (CEST)
Message-ID: <5224D4A7.6080703@pseudoterminal.org>
Date: Mon, 02 Sep 2013 20:10:47 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1378138412-10373-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1378138412-10373-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] eglinfo: add recipes for x11 and fb backends
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
X-List-Received-Date: Mon, 02 Sep 2013 18:10:17 -0000
Content-Type: multipart/alternative;
	boundary="------------080803070002060001030401"

--------------080803070002060001030401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-09-02 18:13, Ross Burton wrote:

Oh, nice to see my utility here again I have to admit, this was one of 
the first recipes I ever wrote. Somebody mentioned concerns about it 
being machine-specific. I think this is the case if EGLINFO_DEVICE is 
set to anything other than "generic". I faced a similar situation with 
the GStreamer 1.0 OpenMAX plugins, and solved this with python code: 
https://github.com/dv1/meta-gstreamer1.0/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc#L20 

So, if EGLINFO_DEVICE is not set to generic, PACKAGE_ARCH is 
automatically set to MACHINE_ARCH. I would introduce this in the recipe, 
but do not have the time right now, unfortunately

The other concern is Wayland support. There isn't any yet.

> eglinfo is a small utility for printing out information about EGL as well
> as about its client APIs, OpenGL / OpenGLES 1.x / OpenGLES 2.x / OpenVG.
>
> Recipe originally by Carlos Rafael Giani <dv@pseudoterminal.org>.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb  |   11 ++++++++
>   meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb |    8 ++++++
>   meta/recipes-graphics/eglinfo/eglinfo.inc        |   32 
> ++++++++++++++++++++++
>   3 files changed, 51 insertions(+)
>   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
>   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
>   create mode 100644 meta/recipes-graphics/eglinfo/eglinfo.inc
>
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb 
> b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> new file mode 100644
> index 0000000..65b265f
> --- /dev/null
> +++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> @@ -0,0 +1,11 @@
> +EGLINFO_PLATFORM ?= "fb"
> +EGLINFO_BINARY_NAME ?= "eglinfo-fb"
> +
> +# .bbappend files in BSP meta layers can add EGLINFO_DEVICE
> +# values if necessary. eglinfo.inc contains default values for
> +# the currently supported devices.
> +# Consult the eglinfo README.md for details
> +
> +include eglinfo.inc
> +
> +SUMMARY += "(Framebuffer version)"
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb 
> b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> new file mode 100644
> index 0000000..18fc893
> --- /dev/null
> +++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> @@ -0,0 +1,8 @@
> +EGLINFO_PLATFORM ?= "x11"
> +EGLINFO_BINARY_NAME ?= "eglinfo-x11"
> +
> +include eglinfo.inc
> +
> +DEPENDS += "virtual/libx11"
> +
> +SUMMARY += "(X11 version)"
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc 
> b/meta/recipes-graphics/eglinfo/eglinfo.inc
> new file mode 100644
> index 0000000..d53d0ff
> --- /dev/null
> +++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
> @@ -0,0 +1,32 @@
> +SUMMARY = "Utility for printing information EGL and its client APIs 
> (OpenGL, OpenGL ES, OpenVG)"
> +SECTION = "graphics"
> +LICENSE = "Zlib"
> +HOMEPAGE = "https://github.com/dv1/eglinfo"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"
> +
> +DEPENDS = "virtual/egl"
> +
> +SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
> +SRCREV = "4a49ff59545d9b6a8222badab64115f89d3a6774"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit waf
> +
> +# BSP layers should add .bbappend files for the -x11 and -fb .bb 
> recipes,
> +# which append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS
> +# not doing that here, since some platforms might not have OpenGL ES 
> or OpenVG support
> +# (in that case, the eglinfo build scripts automatically disable the 
> relevant code paths)
> +
> +EGLINFO_DEVICE ?= "generic"
> +EGLINFO_DEVICE_raspberrypi ?= "raspberrypi"
> +EGLINFO_DEVICE_beagleboard ?= "beagleboard"
> +EGLINFO_DEVICE_mx6 ?= "imx6"
> +
> +EXTRA_OECONF = "--platform=${EGLINFO_PLATFORM} \
> +                --device=${EGLINFO_DEVICE} \
> +                --sysroot ${STAGING_DIR_TARGET}"
> +
> +do_install_append() {
> +    mv ${D}/${bindir}/eglinfo ${D}/${bindir}/${EGLINFO_BINARY_NAME}
> +}


--------------080803070002060001030401
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 12px;" lang="x-western">On 2013-09-02 18:13, Ross
      Burton wrote:
      <br>
      <br>
      Oh, nice to see my utility here again <span class="moz-smiley-s1"
        title=":)"></span> I have to admit, this was one of the first
      recipes I ever wrote. Somebody mentioned concerns about it being
      machine-specific. I think this is the case if EGLINFO_DEVICE is
      set to anything other than "generic". I faced a similar situation
      with the GStreamer 1.0 OpenMAX plugins, and solved this with
      python code: <a class="moz-txt-link-freetext"
href="https://github.com/dv1/meta-gstreamer1.0/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc#L20">https://github.com/dv1/meta-gstreamer1.0/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc#L20</a>
      <br>
      So, if EGLINFO_DEVICE is not set to generic, PACKAGE_ARCH is
      automatically set to MACHINE_ARCH. I would introduce this in the
      recipe, but do not have the time right now, unfortunately <span
        class="moz-smiley-s2" title=":("></span>
      <br>
      <br>
      The other concern is Wayland support. There isn't any yet.
      <br>
      <br>
      <blockquote type="cite" style="color: #000000;">eglinfo is a small
        utility for printing out information about EGL as well
        <br>
        as about its client APIs, OpenGL / OpenGLES 1.x / OpenGLES 2.x /
        OpenVG.
        <br>
        <br>
        Recipe originally by Carlos Rafael Giani <a
          class="moz-txt-link-rfc2396E"
          href="mailto:dv@pseudoterminal.org">&lt;dv@pseudoterminal.org&gt;</a>.
        <br>
        <br>
        Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E"
          href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb&nbsp; |&nbsp;&nbsp; 11
        ++++++++
        <br>
        &nbsp; meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb |&nbsp;&nbsp;&nbsp; 8 ++++++
        <br>
        &nbsp; meta/recipes-graphics/eglinfo/eglinfo.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 32
        ++++++++++++++++++++++
        <br>
        &nbsp; 3 files changed, 51 insertions(+)
        <br>
        &nbsp; create mode 100644
        meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
        <br>
        &nbsp; create mode 100644
        meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
        <br>
        &nbsp; create mode 100644 meta/recipes-graphics/eglinfo/eglinfo.inc
        <br>
        <br>
        diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
        b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
        <br>
        new file mode 100644
        <br>
        index 0000000..65b265f
        <br>
        --- /dev/null
        <br>
        +++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
        <br>
        @@ -0,0 +1,11 @@
        <br>
        +EGLINFO_PLATFORM ?= "fb"
        <br>
        +EGLINFO_BINARY_NAME ?= "eglinfo-fb"
        <br>
        +
        <br>
        +# .bbappend files in BSP meta layers can add EGLINFO_DEVICE
        <br>
        +# values if necessary. eglinfo.inc contains default values for
        <br>
        +# the currently supported devices.
        <br>
        +# Consult the eglinfo README.md for details
        <br>
        +
        <br>
        +include eglinfo.inc
        <br>
        +
        <br>
        +SUMMARY += "(Framebuffer version)"
        <br>
        diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
        b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
        <br>
        new file mode 100644
        <br>
        index 0000000..18fc893
        <br>
        --- /dev/null
        <br>
        +++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
        <br>
        @@ -0,0 +1,8 @@
        <br>
        +EGLINFO_PLATFORM ?= "x11"
        <br>
        +EGLINFO_BINARY_NAME ?= "eglinfo-x11"
        <br>
        +
        <br>
        +include eglinfo.inc
        <br>
        +
        <br>
        +DEPENDS += "virtual/libx11"
        <br>
        +
        <br>
        +SUMMARY += "(X11 version)"
        <br>
        diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc
        b/meta/recipes-graphics/eglinfo/eglinfo.inc
        <br>
        new file mode 100644
        <br>
        index 0000000..d53d0ff
        <br>
        --- /dev/null
        <br>
        +++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
        <br>
        @@ -0,0 +1,32 @@
        <br>
        +SUMMARY = "Utility for printing information EGL and its client
        APIs (OpenGL, OpenGL ES, OpenVG)"
        <br>
        +SECTION = "graphics"
        <br>
        +LICENSE = "Zlib"
        <br>
        +HOMEPAGE = <a class="moz-txt-link-rfc2396E"
          href="https://github.com/dv1/eglinfo">"https://github.com/dv1/eglinfo"</a>
        <br>
        +LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E"
          href="file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c">"file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"</a>
        <br>
        +
        <br>
        +DEPENDS = "virtual/egl"
        <br>
        +
        <br>
        +SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
        <br>
        +SRCREV = "4a49ff59545d9b6a8222badab64115f89d3a6774"
        <br>
        +
        <br>
        +S = "${WORKDIR}/git"
        <br>
        +
        <br>
        +inherit waf
        <br>
        +
        <br>
        +# BSP layers should add .bbappend files for the -x11 and -fb
        .bb recipes,
        <br>
        +# which append the respective EGL/OpenGLES/OpenVG libraries to
        DEPENDS
        <br>
        +# not doing that here, since some platforms might not have
        OpenGL ES or OpenVG support
        <br>
        +# (in that case, the eglinfo build scripts automatically
        disable the relevant code paths)
        <br>
        +
        <br>
        +EGLINFO_DEVICE ?= "generic"
        <br>
        +EGLINFO_DEVICE_raspberrypi ?= "raspberrypi"
        <br>
        +EGLINFO_DEVICE_beagleboard ?= "beagleboard"
        <br>
        +EGLINFO_DEVICE_mx6 ?= "imx6"
        <br>
        +
        <br>
        +EXTRA_OECONF = "--platform=${EGLINFO_PLATFORM} \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --device=${EGLINFO_DEVICE} \
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --sysroot ${STAGING_DIR_TARGET}"
        <br>
        +
        <br>
        +do_install_append() {
        <br>
        +&nbsp;&nbsp;&nbsp; mv ${D}/${bindir}/eglinfo
        ${D}/${bindir}/${EGLINFO_BINARY_NAME}
        <br>
        +}
        <br>
      </blockquote>
      <br>
    </div>
  </body>
</html>

--------------080803070002060001030401--
