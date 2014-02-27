Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F0DD06E7D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 20:51:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Feb 2014 12:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,557,1389772800"; d="scan'208";a="483134277"
Received: from unknown (HELO [10.255.14.50]) ([10.255.14.50])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2014 12:51:20 -0800
Message-ID: <530FA547.9020504@linux.intel.com>
Date: Thu, 27 Feb 2014 22:51:19 +0200
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: =?UTF-8?B?U8OpYmFzdGllbiBNZW5uZXRyaWVy?= <s.mennetrier@innotis.org>, 
	openembedded-core@lists.openembedded.org
References: <1393509724-26931-1-git-send-email-s.mennetrier@innotis.org>
In-Reply-To: <1393509724-26931-1-git-send-email-s.mennetrier@innotis.org>
Subject: Re: [PATCH] libomxil: Fix link issue for gst-omx
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
X-List-Received-Date: Thu, 27 Feb 2014 20:51:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/27/2014 04:02 PM, Sébastien Mennetrier wrote:
> gst-omx element can not load due to a missing symbol.
> Missing symbol RM_Deinit.
>
> Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
> ---
>   .../libomxil/libomxil-0.9.3/dynamicloader-linking.patch       | 11 +++++++++++
>   meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb            |  3 ++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
>
> diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
> new file mode 100644
> index 0000000..c0fa6d8
> --- /dev/null
> +++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch

This patch needs a Upstream-Status and Signed-off-by: tag

Sau!

> @@ -0,0 +1,11 @@
> +--- a/src/dynamic_loader/Makefile.am	2014-02-25 15:29:10.128549636 +0100
> ++++ b/src/dynamic_loader/Makefile.am	2014-02-25 15:30:15.756548808 +0100
> +@@ -3,7 +3,7 @@
> + omxdynamicloader_LTLIBRARIES = libomxdynamicloader.la
> + libomxdynamicloader_la_SOURCES = ste_dynamic_component_loader.c ste_dynamic_component_loader.h
> +
> +-libomxdynamicloader_la_LDFLAGS =
> ++libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(top_builddir)/src/.libs
> + libomxdynamicloader_la_CFLAGS = -I$(top_srcdir)/include \
> + 			-I$(top_srcdir)/src \
> + 			-I$(top_srcdir)/src/base \
> diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> index f6c6a16..4a7633d 100644
> --- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> +++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
>   SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
>              file://configure-fix.patch \
>              file://parallel-make.patch \
> -           file://makefile-docdir-fix.patch"
> +           file://makefile-docdir-fix.patch \
> +           file://dynamicloader-linking.patch"
>
>   SRC_URI[md5sum] = "a1de827fdb75c02c84e55f740ca27cb8"
>   SRC_URI[sha256sum] = "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
>

