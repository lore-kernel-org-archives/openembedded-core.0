Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 751E87169F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 10:52:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 06A94600387
Message-ID: <1430477538.3318.9.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 01 May 2015 11:52:18 +0100
In-Reply-To: <1430336607-19925-1-git-send-email-armccurdy@gmail.com>
References: <1430336607-19925-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.16.1 (3.16.1-1.fc22) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [fido][PATCH] busybox: remove CVE-2014-9645 patch (already upstream in 1.23.x)
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
X-List-Received-Date: Fri, 01 May 2015 10:52:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-29 at 12:43 -0700, Andre McCurdy wrote:
> The CVE-2014-9645 fix was merged in Busybox prior to the 1.23.0
> release [1]. The fix was then reworked in Busybox 1.23.1, in such
> a way that the original change was no longer required [2].
> 
> Although oe-core's CVE-2014-9645 patch still applies cleanly to
> Busybox 1.23.1 and 1.23.2, applying it partially reverts the second
> version of the upstream fix.
> 
>   [1] http://git.busybox.net/busybox/commit/modutils/modprobe.c?h=1_2
> 3_stable&id=4e314faa0aecb66717418e9a47a4451aec59262b
>   [2] http://git.busybox.net/busybox/commit/modutils/modprobe.c?h=1_2
> 3_stable&id=1ecfe811fe2f70380170ef7d820e8150054e88ca
> 
> This is a fido (busybox 1.23.1) backport of the fix already in
> oe-core master (busybox 1.23.2):
> 
>   http://git.openembedded.org/openembedded
> -core/commit/?id=a753d3d8884b96baad5ed1a03335a81586420b86
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

Thanks for the patch Andre, this is queued in my fido-next branch on
poky-contrib[1].

Regards,

Joshua

1. http://git.yoctoproject.org/cgit/cgit.cgi/poky
-contrib/log/?h=joshuagl/fido-next

> ---
>  ..._busybox_reject_module_names_with_slashes.patch | 41 -----------
> -----------
>  meta/recipes-core/busybox/busybox_1.23.1.bb        |  1 -
>  2 files changed, 42 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2014
> -9645_busybox_reject_module_names_with_slashes.patch
> 
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2014
> -9645_busybox_reject_module_names_with_slashes.patch b/meta/recipes
> -core/busybox/busybox/CVE-2014
> -9645_busybox_reject_module_names_with_slashes.patch
> deleted file mode 100644
> index 4e76067..0000000
> --- a/meta/recipes-core/busybox/busybox/CVE-2014
> -9645_busybox_reject_module_names_with_slashes.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Upstream-status: Backport
> -http://git.busybox.net/busybox/commit/?id=4e314faa0aecb66717418e9a47
> a4451aec59262b
> -
> -CVE-2014-9645 fix.
> -
> -[YOCTO #7257]
> -
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> -
> -From 4e314faa0aecb66717418e9a47a4451aec59262b Mon Sep 17 00:00:00 
> 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Thu, 20 Nov 2014 17:24:33 +0000
> -Subject: modprobe,rmmod: reject module names with slashes
> -
> -function                                             old     new  
>  delta
> -add_probe                                             86     113   
>   +27
> -
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> ----
> -Index: busybox-1.22.1/modutils/modprobe.c
> -===================================================================
> ---- busybox-1.22.1.orig/modutils/modprobe.c
> -+++ busybox-1.22.1/modutils/modprobe.c
> -@@ -238,6 +238,17 @@ static void add_probe(const char *name)
> - {
> -     struct module_entry *m;
> - 
> -+    /*
> -+     * get_or_add_modentry() strips path from name and works
> -+     * on remaining basename.
> -+     * This would make "rmmod dir/name" and "modprobe dir/name"
> -+     * to work like "rmmod name" and "modprobe name",
> -+     * which is wrong, and can be abused via implicit 
> modprobing:
> -+     * "ifconfig /usbserial up" tries to modprobe netdev
> -/usbserial.
> -+     */
> -+    if (strchr(name, '/'))
> -+            bb_error_msg_and_die("malformed module name '%s'", 
> name);
> -+
> -     m = get_or_add_modentry(name);
> -     if (!(option_mask32 & (OPT_REMOVE | OPT_SHOW_DEPS))
> -      && (m->flags & MODULE_FLAG_LOADED)
> diff --git a/meta/recipes-core/busybox/busybox_1.23.1.bb 
> b/meta/recipes-core/busybox/busybox_1.23.1.bb
> index 1742390..7c3ed84 100644
> --- a/meta/recipes-core/busybox/busybox_1.23.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.23.1.bb
> @@ -30,7 +30,6 @@ SRC_URI = "
> http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>             file://login-utilities.cfg \
>             file://recognize_connmand.patch \
>             file://busybox-cross-menuconfig.patch \
> -           file://CVE-2014
> -9645_busybox_reject_module_names_with_slashes.patch \
>  "
>  
>  SRC_URI[tarball.md5sum] = "5c94d6301a964cd91619bd4d74605245"
> -- 
> 1.9.1
> 

