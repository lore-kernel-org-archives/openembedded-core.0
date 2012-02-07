Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Runs0-0000JD-0d
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 17:26:16 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Feb 2012 08:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="107368076"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by orsmga002.jf.intel.com with ESMTP; 07 Feb 2012 08:17:50 -0800
Message-ID: <4F314EAE.5090704@linux.intel.com>
Date: Tue, 07 Feb 2012 08:17:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328214053-6737-1-git-send-email-tworaz666@gmail.com>
In-Reply-To: <1328214053-6737-1-git-send-email-tworaz666@gmail.com>
Subject: Re: [PATCH] gtk+: Add patch for iconview segfault.
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
X-List-Received-Date: Tue, 07 Feb 2012 16:26:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2012 12:20 PM, Peter Tworek wrote:
> https://bugzilla.gnome.org/show_bug.cgi?id=663138
>
> * Run tested on netbookpro.
> * Resolves problem with lxapperance crashing on startup.
>
> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
> ---
>   .../gtk+-2.24.8/gtk_icon_view_layout-crash.patch   |   30 ++++++++++++++++++++
>   meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    3 +-
>   2 files changed, 32 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch
> new file mode 100644
> index 0000000..3ca24d5
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+-2.24.8/gtk_icon_view_layout-crash.patch
> @@ -0,0 +1,30 @@
> +From 5c3bb1839cac52828756f9ddb98f49d586853991 Mon Sep 17 00:00:00 2001
> +From: Cosimo Cecchi<cosimoc@gnome.org>
> +Date: Wed, 16 Nov 2011 22:38:45 +0000
> +Subject: Revert "iconview: layout items immediately when setting a GtkTreeModel"
> +
> +It makes GtkIconView segfault on GTK 2.24.
> +
> +gtk_icon_view_expose() calls gtk_icon_view_layout() first thing if
> +there's a layout queued anyway, so we wouldn't end up in the same
> +situation causing the crash the original patch is supposed to fix.
> +
> +This reverts commit 5a03f4a6a50237d86959f596dda143dfc2f040d1.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=663138

This patch is missing a Upstream-Status: entry, and a Signed-off-by:

Please see
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks

	Sau!

> +---
> +diff --git a/gtk/gtkiconview.c b/gtk/gtkiconview.c
> +index 62877fa..54b3f3b 100644
> +--- a/gtk/gtkiconview.c
> ++++ b/gtk/gtkiconview.c
> +@@ -5423,7 +5423,7 @@ gtk_icon_view_set_model (GtkIconView *icon_view,
> +
> +       gtk_icon_view_build_items (icon_view);
> +
> +-      gtk_icon_view_layout (icon_view);
> ++      gtk_icon_view_queue_layout (icon_view);
> +     }
> +
> +   g_object_notify (G_OBJECT (icon_view), "model");
> +--
> +cgit v0.9.0.2
> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
> index ec827a7..4e5b66f 100644
> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
> @@ -13,6 +13,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>              file://toggle-font.diff;striplevel=0 \
>              file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
>              file://doc-fixes.patch \
> +           file://gtk_icon_view_layout-crash.patch \
>   	  "
>
>   # TO MERGE
> @@ -27,7 +28,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>   #        file://combo-arrow-size.patch;striplevel=0
>   #            file://configurefix.patch
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
>   SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"


