Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 646B476FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 22:50:01 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so36940365wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CwDg1TwU8bpJKNXLlvp8DBk6YmqzrRW241rQOIF1al0=;
	b=KjeOkDiL08scw42LGCs5rl+6vKLFqIB86bhb8jOQXXD3J3TafV4jzonF+v5bRqW9ve
	1jnbDguCdUi1cmFTnlBUJJld2qkohy6P1LRbu5FT8k3AOdMNFU0tapUGV902dL2KE8lB
	PznIQAUhu2Ix33RMoo37VQMSpIBcF1p69M16vd5AxGeI9thPweYAKRdXJ/XFpk2/moJo
	6ETbw4V3HMBiEkPpBsGGa2nERteIZw1WUV0xyjEJOTi+Y629GMjtGplhf/le2wMDNwed
	epR2KFvh46u1N8Q7BzxfQkqoj2Jt+2UsgpTpZ/KwPvEBPn4to05lNFm7ul6i4kvzlCQW
	+/Dg==
X-Gm-Message-State: ALoCoQnN9GYLdBqJ7K+4NOb44zr1p/T+ZiT1z6gG1ZZFZ10QKsfssIPDM5VHR2FU2ty4h4uP157M
X-Received: by 10.180.87.37 with SMTP id u5mr6040078wiz.42.1443221401600;
	Fri, 25 Sep 2015 15:50:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id h8sm5367978wib.21.2015.09.25.15.50.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Sep 2015 15:50:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 23:42:56 +0100
Message-Id: <1443220976-18321-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk-icon-cache/pixbufcache: don't set GDK_PIXBUF_MODULEDIR
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
X-List-Received-Date: Fri, 25 Sep 2015 22:50:03 -0000

In normal use gdk-pixbuf knows where to find its own loaders and explicitly
stating this will cause work in the future if the ABI version changes.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-icon-cache.bbclass | 2 +-
 meta/classes/pixbufcache.bbclass    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index b005ab2..d9c6453 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -11,7 +11,7 @@ if [ "x$D" != "x" ]; then
 else
 
 	# Update the pixbuf loaders in case they haven't been registered yet
-	GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders ${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
+	loaders ${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders --update-cache
 
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


