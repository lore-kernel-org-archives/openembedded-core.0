Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2B7B78044
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 20:51:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1EKpsqM023167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Feb 2018 12:51:54 -0800 (PST)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 14 Feb 2018 12:51:41 -0800
To: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>,
	<openembedded-core@lists.openembedded.org>
References: <1518205787-575-1-git-send-email-carlos.rodriguez@ridgerun.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <aa9f0313-9b17-b8d9-6704-8df2563408f9@windriver.com>
Date: Wed, 14 Feb 2018 15:51:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518205787-575-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-oe][PATCH v2] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Wed, 14 Feb 2018 20:51:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-02-09 02:49 PM, Carlos Rodriguez wrote:
> GStreamer Daemon, also called gstd, is a GStreamer framework
> for controlling audio and video streaming using TCP connection
> messages. Qt applications, web interfaces, and GStreamer element
> test suites show different ways the framework can be utilized.
> GStreamer Daemon is gst-launch on steroids where you can create a
> GStreamer pipeline, play, pause, change speed, skip around, and
> even change element parameter settings all while the pipeline
> is active.

Probably also suitable for meta-openembedded/meta-multimedia.
The gst-* recipes are part of oe-core but new packages usually
get added to meta-openembedded since we try to keep oe-core small.

I did notice that you mentioned RidgeRun below in:
 > +DESCRIPTION = "RidgeRun Gstreamer Daemon 1.0"

While I appreciate they they are the primary authors, it's
likely a good idea to drop the company name from the recipe.

Thanks,
../Randy

> 
> Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
> ---
>   .../recipes-multimedia/gstreamer-1.0/gstd.inc      | 25 +++++++++
>   .../gstd/0001-gstd-yocto-compatibility.patch       | 63 ++++++++++++++++++++++
>   .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   |  3 ++
>   3 files changed, 91 insertions(+)
>   create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
>   create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
>   create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> 
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
> new file mode 100644
> index 0000000..3e23521
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "RidgeRun Gstreamer Daemon 1.0"
> +SUMMARY = "GStreamer framework for controlling audio and video streaming using TCP connection messages"
> +HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
> +SECTION = "multimedia"
> +LICENSE = "GPLv2+"
> +
> +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
> +
> +SRCBRANCH ?= "master"
> +SRCREV = "097a086a8606dcb368c7d38c7ec4fefc2497401b"
> +SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
> +	   file://0001-gstd-yocto-compatibility.patch"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG_CONFARGS = " \
> +	--disable-gtk-doc \
> +"
> +
> +inherit autotools pkgconfig gettext
> +
> +do_configure() {
> +${S}/autogen.sh
> +oe_runconf
> +}
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
> new file mode 100644
> index 0000000..ddc1831
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
> @@ -0,0 +1,63 @@
> +From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001
> +From: Carlos <carlos.rodriguez@ridgerun.com>
> +Date: Fri, 15 Dec 2017 10:14:05 -0600
> +Subject: [PATCH] gstd:yocto compatibility
> +
> +---
> + autogen.sh                      | 8 +++++++-
> + docs/reference/gstd/Makefile.am | 2 +-
> + gstd/Makefile.am                | 2 +-
> + 3 files changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/autogen.sh b/autogen.sh
> +index 66dbd42..793ee2f 100755
> +--- a/autogen.sh
> ++++ b/autogen.sh
> +@@ -21,7 +21,11 @@
> + # ACLOCAL, AUTOPOINT and/or LIBTOOLIZE to the right versions, or leave them
> + # unset and get the defaults
> +
> +-gtkdocize || exit 1
> ++test -n "$srcdir" || srcdir=`dirname "$0"`
> ++test -n "$srcdir" || srcdir=.
> ++
> ++olddir=`pwd`
> ++cd "$srcdir"
> +
> + autoreconf --verbose --force --install || {
> +  echo 'autogen.sh failed';
> +@@ -31,3 +35,5 @@ autoreconf --verbose --force --install || {
> + echo
> + echo "Now run './configure' with your system settings followed by 'make' to compile this module."
> + echo
> ++
> ++cd "$olddir"
> +diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makefile.am
> +index f860fa1..153a13b 100644
> +--- a/docs/reference/gstd/Makefile.am
> ++++ b/docs/reference/gstd/Makefile.am
> +@@ -66,7 +66,7 @@ GTKDOC_LIBS=$(top_builddir)/gstd/libgstd-core.la
> +
> +
> + # This includes the standard gtk-doc make rules, copied by gtkdocize.
> +-include $(top_srcdir)/docs/gtk-doc.make
> ++# include $(top_srcdir)/docs/gtk-doc.make
> +
> + # Comment this out if you want 'make check' to test you doc status
> + # and run some sanity checks
> +diff --git a/gstd/Makefile.am b/gstd/Makefile.am
> +index 13c551d..11fe202 100644
> +--- a/gstd/Makefile.am
> ++++ b/gstd/Makefile.am
> +@@ -49,7 +49,7 @@ bin_PROGRAMS = gstd
> +
> + gstd_SOURCES = gstd.c
> + gstd_CFLAGS = $(GST_CFLAGS) $(GIO_CFLAGS) $(GJSON_CFLAGS)
> +-gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS) -Wl,-rpath -Wl,$(libdir)
> ++gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS)
> + gstd_LDADD = libgstd-core.la
> +
> + gstdincludedir = $(includedir)/gstd
> +--
> +1.9.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> new file mode 100644
> index 0000000..94f6b57
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
> @@ -0,0 +1,3 @@
> +require gstd.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

