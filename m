Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9B65876FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 22:51:04 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so39724905wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1pk8QLEeUaV6fUNp0XM0Z3pKH/T4ZRCBHQHV8etFJDA=;
	b=ZUct0fivfqqHsYGt7pe5KaaS2FCCyAJlvw29qo+MnqfT3KqLauSgyy11AuQn/6stIE
	ZHBNqmmeb+sFUNi4j8sdUdd39XIrPQmbAaPNehoJxUfYv8yP+S/W/6JLJ0l1i9SR05pQ
	WjUAkAY3ow4RX4gU0xrGRB0WM9kUu383TGKUtcKwM1xZbX9DDzsXiqeC7kfrLIox1OZM
	RzHqpO3S+t+LNMnQdqRIrumiy9EkmgdhGm55dfI7GupL//RrltcUvBpVRkuLuvqOQBev
	zAlGaid7pAzGO6+RF72P2NsHBbwXbR9qHjCHt4EHygIwm3Kn8vtWUiQ50uZll9GGiAtZ
	wnBA==
X-Gm-Message-State: ALoCoQlUFSTpcCv2bR9zcOwDR2b94ZfXbFHx+gPNzicuv7APa/7ifpczkaXiyAnglKvLOk8CmNgc
X-Received: by 10.194.117.133 with SMTP id ke5mr8860371wjb.116.1443221464210; 
	Fri, 25 Sep 2015 15:51:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	pu6sm5466526wjc.34.2015.09.25.15.51.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 15:51:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 23:43:55 +0100
Message-Id: <1443221035-18523-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] gtk-icon-cache/pixbufcache: don't set GDK_PIXBUF_MODULEDIR
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
X-List-Received-Date: Fri, 25 Sep 2015 22:51:04 -0000

In normal use gdk-pixbuf knows where to find its own loaders and explicitly
stating this will cause work in the future if the ABI version changes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass | 2 +-
 meta/classes/pixbufcache.bbclass    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index b005ab2..6195fa4 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -11,7 +11,7 @@ if [ "x$D" != "x" ]; then
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
-	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders ${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
+	${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 	for icondir in /usr/share/icons/* ; do
 		if [ -d $icondir ] ; then
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 18fd9fa..dbe11e1 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -15,7 +15,7 @@ if [ "x$D" != "x" ]; then
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
-	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders ${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
+	${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
 	if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
 		for icondir in /usr/share/icons/*; do
-- 
2.1.4


