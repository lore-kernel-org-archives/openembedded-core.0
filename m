Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 42C9965CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:06:29 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 16191F81188; Fri, 17 Jul 2015 04:06:30 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 35E37F81188;
	Fri, 17 Jul 2015 04:06:29 -0600 (MDT)
Message-ID: <55A8D3B2.9090404@mlbassoc.com>
Date: Fri, 17 Jul 2015 04:06:42 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1437115061-1635-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1437115061-1635-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] gtk+: Fix bug in gtk-demo
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
X-List-Received-Date: Fri, 17 Jul 2015 10:06:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-17 00:37, Li xin wrote:
> Modify gtkrc.c,otherwise the input-methods can not be enabled in gtk-demo.

This comment doesn't really explain why this [radical] change
in pathname is needed, it just says what you have done.

>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>   meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch | 30 ++++++++++++++++++++++
>   meta/recipes-gnome/gtk+/gtk+_2.24.28.bb            |  1 +
>   2 files changed, 31 insertions(+)
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch b/meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch
> new file mode 100644
> index 0000000..59a707c
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+/gtkrc.c-Bug-fix.patch
> @@ -0,0 +1,30 @@
> +From 3080e6d55f12b5ba453723f295653c1696c4ad44 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Wed, 15 Jul 2015 20:05:05 +0900
> +Subject: [PATCH] gtkrc.c: Bug fix
> +
> +Modify gtkrc.c, otherwise the input-methods can not be enabled in gtk-demo.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + gtk/gtkrc.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gtk/gtkrc.c b/gtk/gtkrc.c
> +index 50b2563..4e6b618 100644
> +--- a/gtk/gtkrc.c
> ++++ b/gtk/gtkrc.c
> +@@ -450,7 +450,7 @@ gtk_rc_get_im_module_file (void)
> +       if (im_module_file)
> + 	result = g_strdup (im_module_file);
> +       else
> +-        result = gtk_rc_make_default_dir ("immodules.cache");
> ++        result = g_build_filename (GTK_SYSCONFDIR, "gtk-2.0", "gtk.immodules", NULL);
> +     }
> +
> +   return result;
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
> index e343773..9576670 100644
> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.28.bb
> @@ -10,6 +10,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
>              file://toggle-font.diff;striplevel=0 \
>              file://doc-fixes.patch \
>              file://strict-prototypes.patch \
> +           file://gtkrc.c-Bug-fix.patch \
>   	  "
>
>   SRC_URI[md5sum] = "bfacf87b2ea67e4e5c7866a9003e6526"
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

