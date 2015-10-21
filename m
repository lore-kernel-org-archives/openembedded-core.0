Return-Path: <psidhu@gateworks.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 39261607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 15:45:04 +0000 (UTC)
Received: by padhk11 with SMTP id hk11so58198970pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bqhnHfgYJFdwzxQ/qYbJPEjJbLU66deVFohtmBJ4coA=;
	b=AlpFYWHlPtKRJZachnJOqV2J9lnQvn7aAhmHJz7WgVYj2FNrxCVftpmBES0MVhTQMk
	EG8vpeKebT+2QZzmSWElN7WVGRouA2f03EnqGGFQMWgWmThJEZK2sm/JuwAEHiTJspB/
	w3kKRNEjkmFLtFl3XndBYpmSVxBrjcLeDgIyC/F1d+ZPR6Uw0yyVKvtZOWePzwOHzbU4
	G2g2hgp0+Gj13TcjhSAZqkKgLTHUZXbR4CiZfFzI0T8y15QO55pkbFG68a2SKumLvpi9
	4MV7uFU4LRcNRNKes+Lia8YD5jvEzizHywwg+WHa+Kd3q+r8A2g0WwaCCqlnQq8trxdF
	PN5g==
X-Gm-Message-State: ALoCoQlR1CeR7HEegEqUR/PpEd5xUseKXHqi9HQZk9Ne0xqH32n+SAy2bQ4gFAH67ZXb9Vg8+Yxu
X-Received: by 10.66.150.161 with SMTP id uj1mr11378252pab.148.1445442304891; 
	Wed, 21 Oct 2015 08:45:04 -0700 (PDT)
Received: from psidhu.gw (68-189-91-139.static.snlo.ca.charter.com.
	[68.189.91.139]) by smtp.gmail.com with ESMTPSA id
	ix1sm9826097pbd.40.2015.10.21.08.45.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Oct 2015 08:45:04 -0700 (PDT)
From: Pushpal Sidhu <psidhu@gateworks.com>
To: alexander.kanavin@linux.intel.com
Date: Wed, 21 Oct 2015 08:44:47 -0700
Message-Id: <1445442287-11355-1-git-send-email-psidhu@gateworks.com>
X-Mailer: git-send-email 2.6.2
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] gnome-desktop: add xkeyboard-config dependency
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
X-List-Received-Date: Wed, 21 Oct 2015 15:45:09 -0000

gnome-desktop will fail during do_configure if xkeyboard-config had not already
been built. Please see the following for the error:

| configure: error: Package requirements (gdk-pixbuf-2.0 >= 2.21.3
|                                  gtk+-3.0 >= 3.3.6
|                                  glib-2.0 >= 2.38.0
|                                  gio-2.0 >= 2.38.0
|                                  gsettings-desktop-schemas >= 3.5.91
|                                  xrandr >= 1.3
|                                  xext >= 1.1
|                                  xkeyboard-config
|                                  iso-codes) were not met:
|
| No package 'xkeyboard-config' found

Add dependency of xkeyboard-config to this to resolve this issue.

Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
---
 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
index aa11fa2..3765697 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
@@ -10,7 +10,7 @@ inherit gnome pkgconfig
 SRC_URI[archive.md5sum] = "ab5bf4cc94ad63639f42adcc1542b1f0"
 SRC_URI[archive.sha256sum] = "3a8f196b46eb9dbd3ba2afb8fb5fef6a8825539d449a02181311242e22227bd0"
 
-DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification iso-codes"
+DEPENDS += "gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 gnome-doc-utils gnome-common startup-notification xkeyboard-config iso-codes"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.6.2


