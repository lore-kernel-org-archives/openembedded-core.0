Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNTma-0005BE-6B
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 19:18:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Nov 2011 10:12:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="71461011"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 07 Nov 2011 10:12:41 -0800
Message-ID: <4EB81F99.4060807@linux.intel.com>
Date: Mon, 07 Nov 2011 10:12:41 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <6f165b27054e1895460b20a11d360ac52171ab7b>
	<1320235399-15434-1-git-send-email-dima_ch@emcraft.com>
In-Reply-To: <1320235399-15434-1-git-send-email-dima_ch@emcraft.com>
Subject: Re: [PATCH] tslib: fix the bug with loading libts-1.0.so
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 18:18:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 05:03 AM, Dmitry Cherukhin wrote:
> Touchpad did not work in the qtdemoE if the library libts-1.0.so was not loaded
> manually using the LD_PRELOAD variable. This problem was fixed in the tslib mainline
> https://github.com/kergoth/tslib after the 1.0 release. We just import the patch.
>
> Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> ---
>   .../tslib/0001-Link-plugins-against-libts.patch    |   57 ++++++++++++++++++++
>   meta/recipes-graphics/tslib/tslib_1.0.bb           |    3 +-
>   2 files changed, 59 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-graphics/tslib/tslib/0001-Link-plugins-against-libts.patch
>
> diff --git a/meta/recipes-graphics/tslib/tslib/0001-Link-plugins-against-libts.patch b/meta/recipes-graphics/tslib/tslib/0001-Link-plugins-against-libts.patch
> new file mode 100644
> index 0000000..c6b9f59
> --- /dev/null
> +++ b/meta/recipes-graphics/tslib/tslib/0001-Link-plugins-against-libts.patch
> @@ -0,0 +1,57 @@
> +From 9623bbedf4ff409e5036edfcfe52b2595932a6d7 Mon Sep 17 00:00:00 2001
> +From: Chris Larson<clarson@kergoth.com>
> +Date: Sat, 1 Nov 2008 20:46:07 +0000
> +Subject: [PATCH] Link plugins against libts
> +
> +Some plugins use tslib functions. Link those plugins against libts.
> +The problem is easy to see with LDFLAGS="-Wl,-no-undefined".
> +Without this change DirectFB in unable to use tslib because symbols
> +in the tslib plugins can't be resolved.
> +
> +Signed-off-by: Ville Syrjala<syrjala@sci.fi>
> +Signed-off-by: Chris Larson<clarson@kergoth.com>
> +
> +The patch was imported from git server git://github.com/kergoth/tslib.git
> +as of commit id 9623bbedf4ff409e5036edfcfe52b2595932a6d7.
> +
> +Upstream-Status: Accepted
> +Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
> +---
> + plugins/Makefile.am |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +diff --git a/plugins/Makefile.am b/plugins/Makefile.am
> +index 3b902c2..4c4ef8b 100644
> +--- a/plugins/Makefile.am
> ++++ b/plugins/Makefile.am
> +@@ -114,15 +114,19 @@ pluginexec_LTLIBRARIES = \
> +
> + variance_la_SOURCES	= variance.c
> + variance_la_LDFLAGS	= -module $(LTVSN)
> ++variance_la_LIBADD	= $(top_builddir)/src/libts.la
> +
> + dejitter_la_SOURCES	= dejitter.c
> + dejitter_la_LDFLAGS	= -module $(LTVSN)
> ++dejitter_la_LIBADD	= $(top_builddir)/src/libts.la
> +
> + linear_la_SOURCES	= linear.c
> + linear_la_LDFLAGS	= -module $(LTVSN)
> ++linear_la_LIBADD	= $(top_builddir)/src/libts.la
> +
> + pthres_la_SOURCES	= pthres.c
> + pthres_la_LDFLAGS	= -module $(LTVSN)
> ++pthres_la_LIBADD	= $(top_builddir)/src/libts.la
> +
> + # hw access
> + corgi_la_SOURCES	= corgi-raw.c
> +@@ -148,6 +152,7 @@ tatung_la_LDFLAGS	= -module $(LTVSN)
> +
> + input_la_SOURCES	= input-raw.c
> + input_la_LDFLAGS	= -module $(LTVSN)
> ++input_la_LIBADD		= $(top_builddir)/src/libts.la
> +
> + linear_h2200_la_SOURCES	= linear-h2200.c
> + linear_h2200_la_LDFLAGS	= -module $(LTVSN)
> +--
> +1.7.6.4
> +
> diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
> index ad9bfa7..b2315ff 100644
> --- a/meta/recipes-graphics/tslib/tslib_1.0.bb
> +++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
> @@ -10,10 +10,11 @@ SECTION = "base"
>   LICENSE = "LGPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
>
> -PR = "r18"
> +PR = "r19"
>
>   SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \
>              file://fix_version.patch \
> +           file://0001-Link-plugins-against-libts.patch \
>              file://ts.conf \
>              file://tslib.sh"
>
Merged into OE-Core

Thanks
	Sau!




