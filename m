Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF333CF9C7A
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9309.1727246978484995218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z7V8AEax;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246979; x=1758782979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Z3Gnr7Cbyk2gx37iIoVZ1fcWPm+BUc5/Pwv46eDua0o=;
  b=Z7V8AEaxjqv4CJcy/qBsRCf3UqqeM3ZWSYTkGEoFp79XfOVo1STDM2s6
   gdx9yg4doocCj/MJ2Flvv4AP7VqTtIoROP5zZ/1tQ5/81Cp2SnlmvzeTA
   TFpQ8OTCW27XqGvoE5kJiBGALOhkBrsYfGTuXnOQBkfCLRwR+qbuW/RXx
   tYUGAyuXkAelzXOWK7UUqFrxdFzx4K5rfc9nEGEv2oe6IkFRTi5EzjN9N
   DpCMVqFsstmlE0n7Z6+N199g7z+sXJL/t/fUTKWhwbZamyvHOnJQDN4pI
   j/0cIgrdGZlwUH3owJ3r73aFTnYufayrnwAxMkiBLvPxRv4CkSpmMewe9
   A==;
X-CSE-ConnectionGUID: ldQq+NhdSf628/683TLwFw==
X-CSE-MsgGUID: +8DbU/EcTPqxiYwF6WewbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174735890"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174735890"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A4D4DC8B47
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E64E7D5047
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7430B20086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 245361A000A;
	Wed, 25 Sep 2024 14:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/47] epiphany: upgrade 46.3 -> 47.0
Date: Wed, 25 Sep 2024 14:48:37 +0800
Message-Id: <1727246960-20665-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--11.405500-10.000000
X-TMASE-MatchedRID: x6Z0l43VjRKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytOed0Eey3YOSxX
	wd9S2XGheNxt5D1jxfVEOP/MktCQ9lEBPhwy/Bo9M10nOFd6RPY/xRB6OGnb2hQZzv8cwfBdfFM
	IM6nuWIjJ4tcwPl28ZsXvtcPW9OZED4DLEak7WK2OjIrMSa2sR5Ry1HDTPOXalhoZR16K110IyZ
	Ynq1RP5wXZ2TPZY7CqIW8ijzbYbJjQ6SqGXI4HA8fIK2dgWYWGlwT0XposETVYfsHHDgAMI1AMz
	CWTI6vWHEwIYtH/TbZZ15EEfviVGWymsXpN1zOAIS9wVgGv9ZjTlIO7ZQZ9711OAfq6beiu4gNx
	kwiES2k32Er305xbD7eGzu49erBWcRZVcflu3NDfSQNpZkETVBKvFacTVVSJS/960Jlq0wbdWEJ
	eM/bmBP/LrbqaxYzfc47ciF3ZaNks0w7LCKZc9ovNlIrJDKnMhnCFIAQefshCdYTAgut6WD28dB
	zwO9dQgUZH4l5O/sPBDtmipifwMz5HUnRqFFqRA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqfoM
	GP+CwQi+t+0AiFaYmHuYMFu+jpUQSbmi+6Hy02xlpnlQFCyh30tCKdnhB58k4rY1r+vswgXvQkG
	i3tjz/cUt5lc1lLgOMB0shqXhHqQazmmPTzkLApHBEP2ulZSesQKOPEQiNmxju8tnJwKOTl7guH
	rAB6j
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204898

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fix crash when using Ctrl+D or Ctrl+Alt+D
 * Fix icon URL used for install web application dialog
 * Remove tab overview shortcut in web apps
 * Fix crashes in tab overview mode with no open tabs
 * Fix pluralization in privacy report dialog
 * Fix bookmark tag widget focus border
 * Revert key event handling changes due to problems with non-Latin keyboard layouts
 * Extract .xpi during web app installation
 * Show confirmation dialog when deleting web app
 * Allow exporting passwords to CSV and improve CSV import
 * Improve count of trackers in privacy report
 * Fix crash on close multiple tabs dialog
 * Many improvements to bookmarks sidebar and dialog
 * Add autofill support
 * Add bookmarks search bar
 * Improve sorting of bookmarks
 * Restore set image as wallpaper functionality under flatpak
 * New Window should always open a non-incognito window
 * Prompt for confirmation when installing a WebExtension
 * Add Ctrl+Shift+Delete shortcut for Clear Website Data
 * Add Privacy Report feature
 * Use GtkGraphicsOffload to maybe improve graphics performance in fullscreen mode
 * Replace bookmark properties popover with redesigned dialog
 * Disable Firefox Sync
 * Don't show reader mode button when page is loading
 * Revert address bar UI changes due to pango bug
 * Fix application mode when always start in incognito mode setting is enabled
 * Don't warn about failure to download favicon when creating web app
 * Fix crash when starting secondary instance
 * Fix crash when web process becomes unresponsive
 * Fix crash when closing window with context menu open
 * Fix crash on exit
 * Allow overriding fatal criticals using G_DEBUG= environment variable
 * Fix hiding of developer context menu actions
 * Fix a different crash when destroying window
 * Stop using various deprecated GTK APIs
 * Support importing passwords from CSV files
 * Reduce the size of the preferences dialog
 * Use modern libadwaita spinners
 * Fix yet another crash when destroying window
 * Improve autofill dialog UI
 * Update to highlight.js 11.10.0
 * Miscellaneous code robustness improvements
 * Load only one web process extension rather than two
 * Add fallback web app icon
 * Redesign the bookmarks UI to use sidebar instead of popover
 * Rearrange the window/hamburger menu
 * Adopt new floating bar style from nautilus
 * Focus address bar after deleting URL
 * Reenable search in preferences dialog
 * Make address bar dropdown suggestions selectable
 * WebExtensions: support runtime.getManifest() API
 * Modernize encoding dialog
 * Add preference to toggle navigation gestures
 * Fix about:overview improperly shown in address bar
 * Set brightness and contrast for dark reader mode
 * Add Not Now option to save password popover
 * Disable Home/End shortcuts in tab bar
 * Add delete action to text box context menu
 * Add additional debug info to about dialog
 * Don't display placeholder text in address bar when unfocused
 * Enable fatal criticals
 * Add Clear button to location entry
 * Fix set as default browser dialog in phosh
 * Improve UI of preferences dialog
 * Improve UI of about dialog
 * Improve UI of history dialog
 * Improve UI of certificate dialog
 * When not focused, display hostname centered in address bar
 * Always enable web inspector keyboard shortcut
 * Update use of libadwaita dialogs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../epiphany/{epiphany_46.3.bb => epiphany_47.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.3.bb => epiphany_47.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.3.bb b/meta/recipes-gnome/epiphany/epiphany_47.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_47.0.bb
index d9ad38d693..b3e295737d 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_47.0.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "a9e1ad206449117fc5ebe4d0177c1d7a2ff503d6b55019072a068ff2ab278656"
+SRC_URI[archive.sha256sum] = "8e38ee7f90fd6054f8aef0e7f505d53c4520742f5acd1f008282a47b2764affa"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


