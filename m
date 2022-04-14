Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6303AC636F4
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.9618.1649927229057094061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cGwf0L8P;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D0A84C0006;
	Thu, 14 Apr 2022 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649927227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4YfXkLi6P2OtcIXQy+4OzanfuiIMGuxPrVFyzhnJmcM=;
	b=cGwf0L8PTJJcm7zjaDt93r5Qsmgb1ZifRasKkvEo1ThGdXNzRTa5Fwx3T/j0HsfLecIBz1
	X5XjEHnm2RNiCw0R+34/ZxsXtseQ3JQQ0MuMTJ7qMXYZYvOEEgmoWdLds+vIBj4S7TStYE
	YY6baj8cKgvr7NMPv64A8b0lERw3Kll8/Cldzbl4wGogqmsBcKDoEMymiKhyxAEUAwSFac
	84MxmJXWVIJ68A/K+IJ2njkFg7Y69LlGSGovaw3j0cZDurn5QyOEwI79d8mfLMZjuRA+q5
	A2+c5CzhqFtmAwbodjG+7Etia3OqiAEYGMujrKFBPnQvLDPksKvHIPswfDjKwQ==
Date: Thu, 14 Apr 2022 11:07:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, wangmy <wangmy@fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] adwaita-icon-theme: upgrade 41.0 -> 42.0
Message-ID: <YlfkOjbX7AMSXm1B@mail.local>
References: <20220414085710.2010223-1-alex@linutronix.de>
 <20220414085710.2010223-4-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414085710.2010223-4-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164401

Hello Alex,

This has been reverted in master and requires fixing

On 14/04/2022 10:57:10+0200, Alexander Kanavin wrote:
> From: wangmy <wangmy@fujitsu.com>
> 
> 0001-Don-t-use-AC_CANONICAL_HOST.patch
> refreshed for version 42.0
> 
> 0001-Run-installation-commands-as-shell-jobs.patch
> removed since it's included in 42.o
> 
> (From OE-Core rev: 17a08277854eb1e8776cf7790f6255ea68bf0568)
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../0001-Don-t-use-AC_CANONICAL_HOST.patch    |  6 +-
>  ...-installation-commands-as-shell-jobs.patch | 84 -------------------
>  ...eme_41.0.bb => adwaita-icon-theme_42.0.bb} |  7 +-
>  3 files changed, 5 insertions(+), 92 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
>  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_41.0.bb => adwaita-icon-theme_42.0.bb} (87%)
> 
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
> index 5afba3c644..32f98e049b 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
> @@ -1,4 +1,4 @@
> -From 63d97fefdbc90f5c68f67bdc30844776d9a1b720 Mon Sep 17 00:00:00 2001
> +From 15ffd817b3e334dc7c0508761c7ef417d76379c5 Mon Sep 17 00:00:00 2001
>  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Date: Tue, 30 May 2017 14:55:49 +0300
>  Subject: [PATCH] Don't use AC_CANONICAL_HOST
> @@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>   1 file changed, 1 deletion(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index f2659a5..1e8b016 100644
> +index 040975e..5f7b53a 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
>   
> - AC_INIT([adwaita-icon-theme], [41.0],
> + AC_INIT([adwaita-icon-theme], [42.0],
>           [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
>  -AC_CANONICAL_HOST
>   AC_CONFIG_MACRO_DIR([m4])
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
> deleted file mode 100644
> index a1d39cf558..0000000000
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Run-installation-commands-as-shell-jobs.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From 79da031e9811f3eef34b14cce419be93fea34319 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 13 Jun 2017 18:10:06 +0300
> -Subject: [PATCH] Run installation commands as shell jobs
> -
> -This greatly speeds up installation time on multi-core systems.
> -
> -Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/merge_requests/39]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - src/fullcolor/Makefile.am |  5 +++--
> - src/spinner/Makefile.am   |  7 ++++---
> - src/symbolic/Makefile.am  | 11 ++++++-----
> - 3 files changed, 13 insertions(+), 10 deletions(-)
> -
> -diff --git a/src/fullcolor/Makefile.am b/src/fullcolor/Makefile.am
> -index d73529b..b7d0808 100644
> ---- a/src/fullcolor/Makefile.am
> -+++ b/src/fullcolor/Makefile.am
> -@@ -9,9 +9,10 @@ install-data-local:
> - 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size && find . -name "*.png"`; do \
> - 			context="`dirname $$file`"; \
> - 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
> --			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
> -+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
> - 		done; \
> --	done;
> -+	done; \
> -+	wait
> - 
> - ## FIXME we should add a way to remove links generated by icon mapping
> - uninstall-local:
> -diff --git a/src/spinner/Makefile.am b/src/spinner/Makefile.am
> -index c14caf6..322dc0d 100644
> ---- a/src/spinner/Makefile.am
> -+++ b/src/spinner/Makefile.am
> -@@ -24,13 +24,14 @@ install-data-local:
> - 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
> - 		      context="`dirname $$file`"; \
> - 		      $(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
> --		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
> -+		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
> - 	      done; \
> - 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
> - 		context="`dirname $$file`"; \
> - 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
> --		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
> --	done
> -+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file & \
> -+	done; \
> -+	wait
> - 
> - uninstall-local:
> - 	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
> -diff --git a/src/symbolic/Makefile.am b/src/symbolic/Makefile.am
> -index 957c0ee..e1f8818 100644
> ---- a/src/symbolic/Makefile.am
> -+++ b/src/symbolic/Makefile.am
> -@@ -34,18 +34,19 @@ install-data-local:
> - 		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
> - 			context="`dirname $$file`"; \
> - 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
> --			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
> -+			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file & \
> - 		done; \
> --	done
> -+	done; \
> - 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
> - 		context="`dirname $$file`"; \
> - 		$(mkdir_p) $(DESTDIR)$(themedir)/scalable/$$context; \
> --		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file; \
> -+		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file & \
> - 		for size in $(symbolic_encode_sizes); do \
> - 			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
> --			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context; \
> -+			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context & \
> - 		done \
> --	done
> -+	done; \
> -+	wait
> - 
> - uninstall-local:
> - 	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
> similarity index 87%
> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
> index 46f9f4772c..c4f3b1c999 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_41.0.bb
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_42.0.bb
> @@ -12,12 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
>  
>  inherit allarch autotools pkgconfig gettext gtk-icon-cache gnomebase
>  
> -SRC_URI += " \
> -           file://0001-Don-t-use-AC_CANONICAL_HOST.patch \
> -           file://0001-Run-installation-commands-as-shell-jobs.patch \
> -           "
> +SRC_URI += " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
>  
> -SRC_URI[archive.sha256sum] = "ef5339d8c35fcad5d10481b70480803f0fa20b3d3cbc339238fcaceeaee01eba"
> +SRC_URI[archive.sha256sum] = "5e85b5adc8dee666900fcaf271ba717f7dcb9d0a03d96dae08f9cbd27e18b1e0"
>  
>  DEPENDS += "librsvg-native"
>  
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164400): https://lists.openembedded.org/g/openembedded-core/message/164400
> Mute This Topic: https://lists.openembedded.org/mt/90460267/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

