Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQ2iq-0001ip-7s
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 22:33:56 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 13:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138608835"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2012 13:24:09 -0700
Message-ID: <4FA2E968.4010305@linux.intel.com>
Date: Thu, 03 May 2012 13:24:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<f42d908150e61fe8209ab1e0c3bc3d9a171b22d9.1336023730.git.Martin.Jansa@gmail.com>
In-Reply-To: <f42d908150e61fe8209ab1e0c3bc3d9a171b22d9.1336023730.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 5/5] gtk-engines: fix build with glib-2.32
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
X-List-Received-Date: Thu, 03 May 2012 20:33:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2012 10:42 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../gtk-engines/gtk-engines-2.20.2/glib-2.32.patch |   23 ++++++++++++++++++++
>   .../gtk-engines/gtk-engines_2.20.2.bb              |    3 +-
>   2 files changed, 25 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
>
> diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
> new file mode 100644
> index 0000000..f0b878d
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
> @@ -0,0 +1,23 @@
> +From 8d49a386f467cbf8e0842d2218126f643e50f834 Mon Sep 17 00:00:00 2001
> +From: Dominique Leuenberger<dimstar@opensuse.org>
> +Date: Sun, 27 Nov 2011 14:24:57 +0000
> +Subject: Fix build with glib 2.31: Only glib.h can be #include'd. Fixes bug #664914
> +
> +Upstream-Status: Backport
> +
> +---
> +diff --git a/engines/clearlooks/src/animation.c b/engines/clearlooks/src/animation.c
> +index 1f7a41f..56a9286 100644
> +--- a/engines/clearlooks/src/animation.c
> ++++ b/engines/clearlooks/src/animation.c
> +@@ -28,7 +28,7 @@
> + #include "animation.h"
> +
> + #ifdef HAVE_WORKING_ANIMATION
> +-#include<glib/gtimer.h>
> ++#include<glib.h>
> +
> + struct _AnimationInfo {
> + 	GTimer *timer;
> +--
> +cgit v0.9.0.2
> diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
> index 3ca6e81..5b8ee88 100644
> --- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
> +++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>   SECTION = "x11/base"
>   DEPENDS = "gtk+"
>
> -PR = "r1"
> +PR = "r2"
>
>   PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
>
> @@ -39,5 +39,6 @@ python populate_packages_prepend() {
>   	# TODO: mark theme packages as arch all
>   }
>
> +SRC_URI += "file://glib-2.32.patch"
>   SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
>   SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"

Merged into OE-Core

Along with 3/4 and 4/4 from earlier

Thanks
	Sau!


