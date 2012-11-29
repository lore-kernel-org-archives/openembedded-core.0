Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Te8kx-0005ss-DQ
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 19:22:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2012 10:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,186,1355126400"; d="scan'208";a="256748088"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.127])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2012 10:08:21 -0800
Message-ID: <50B7A494.8080009@linux.intel.com>
Date: Thu, 29 Nov 2012 10:08:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
References: <1354007897-16888-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1354007897-16888-1-git-send-email-schnitzeltony@googlemail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: do not prelight GtkButton in touchscreen mode
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
X-List-Received-Date: Thu, 29 Nov 2012 18:22:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/2012 01:18 AM, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   ...utton-do-not-prelight-in-touchscreen-mode.patch |   48 ++++++++++++++++++++
>   meta/recipes-gnome/gtk+/gtk+_2.24.13.bb            |    3 +-
>   2 files changed, 50 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
> new file mode 100644
> index 0000000..671fd2f
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
> @@ -0,0 +1,48 @@
> +From d1f7a894674dfdd6769f1bbae31eb1a69e451a5c Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> +Date: Fri, 16 Nov 2012 22:07:28 +0100
> +Subject: [PATCH] GtkButton: do not prelight in touchscreen mode
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Code was copied from GtkToggleButton.
> +
> +Upstream-status: pending [1]

Proper tag format is Upstream-Status:

Thanks
	Sau!

> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=689138
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> +---
> + gtk/gtkbutton.c |    8 ++++++--
> + 1 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/gtk/gtkbutton.c b/gtk/gtkbutton.c
> +index f472007..1beb1b6 100644
> +--- a/gtk/gtkbutton.c
> ++++ b/gtk/gtkbutton.c
> +@@ -2079,15 +2079,19 @@ _gtk_button_set_depressed (GtkButton *button,
> + static void
> + gtk_button_update_state (GtkButton *button)
> + {
> +-  gboolean depressed;
> ++  gboolean depressed, touchscreen;
> +   GtkStateType new_state;
> +
> ++  g_object_get (gtk_widget_get_settings (GTK_WIDGET (button)),
> ++                "gtk-touchscreen-mode", &touchscreen,
> ++                NULL);
> ++
> +   if (button->activate_timeout)
> +     depressed = button->depress_on_activate;
> +   else
> +     depressed = button->in_button && button->button_down;
> +
> +-  if (button->in_button && (!button->button_down || !depressed))
> ++  if (!touchscreen && button->in_button && (!button->button_down || !depressed))
> +     new_state = GTK_STATE_PRELIGHT;
> +   else
> +     new_state = depressed ? GTK_STATE_ACTIVE : GTK_STATE_NORMAL;
> +--
> +1.7.6.5
> +
> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
> index b358b7f..bc88284 100644
> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
> @@ -13,6 +13,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
>              file://toggle-font.diff;striplevel=0 \
>              file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
>              file://doc-fixes.patch \
> +           file://0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch \
>   	  "
>
>   # TO MERGE
> @@ -27,7 +28,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
>   #        file://combo-arrow-size.patch;striplevel=0
>   #            file://configurefix.patch
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI[md5sum] = "e949406751df51e1e40e85628005a069"
>   SRC_URI[sha256sum] = "35e1a01e46b02970b02ee9f299390d0aa57c1215ad2667bcd584b72f4ea6513d"
>


