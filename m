Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA888788C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 09:53:12 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x7so2806678wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 01:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8v2OzRWtcmWIYZ/dKfmkOXxVVo0yNUccAwaNC+0muBU=;
	b=c/LQ6FU2u91eAno7nwB4rD2gkZ5CH26rXl9DTAoPYhbdT8NIqUHBCZ1G0kIzoVcB0B
	mHCk3Zhv+N0M4Mn2RffDXK77rCNNvyuT1CLthkj+KXQe3O8G9j+sK+gsNAls1i9aXoxS
	Zq6pT3Miufi+P5+YBF0F8eYJlTj8QPnfi5pyHRBEGXOuBnguTTdXQaYB+BYWiKbFzFii
	DszPhG0tEjmuOQHogzo1e23e/PlXvywmhOZu98iEabFH8BsfHbKChGs0/I69T/2zISTa
	l5Bu6MNwFWY7ViD0CDqMgNv9GC+A4gtQGGOvPqTwrBth+OZvxQt4wImXqlO47mTxjDA8
	78wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8v2OzRWtcmWIYZ/dKfmkOXxVVo0yNUccAwaNC+0muBU=;
	b=pQq9loPWiwt1O3cmcTk5Kf3mUYiPB/Nb+Y6Z7YRB/lXLcd8g+M1sK05LeLQ5pjbbtC
	dbwLft6RTBSc4b+N4avPxCDnb1va5KzY254emFjI2tzhM+O/mzwF/VXxm+JQJMZcLDEh
	DmRSZdo9CI3/3Rpc3TX3L7GleVINPSur1Idp9wE1fbEne+YKe4w3DjyP/JQi4LUY3psF
	+3WG9uZWeaRBsg2W75rMrJ/aSAciFqOwIGdV2j+M4vzMo2/jPyXg5osNpPAmIMORDbsZ
	bG/HjZsVs0jOFrpZaShHqypHN5udCFOLoW+AL3SWigp0KvhJ95dI4+6CBKaO7xItMlHA
	o7mQ==
X-Gm-Message-State: APf1xPBf00ke8qnYf+4Xv/LCH5/zRDsqWCVFiKOM8YHdTNc810NgAXg4
	AFe69SlSx/n45o7jH4UgGOZu+dYk
X-Google-Smtp-Source: AG47ELt9ytp02bN8JGnzBsTDYl0jCFoZjDtxudR2rUPiQ8RaUUdRWoNZGE/n2STvGVbH2nP2CCgBYw==
X-Received: by 10.80.159.1 with SMTP id b1mr35604676edf.132.1520589193372;
	Fri, 09 Mar 2018 01:53:13 -0800 (PST)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id h1sm615661edh.48.2018.03.09.01.53.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 01:53:12 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 10:53:09 +0100
Message-Id: <20180309095309.4867-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] ncurses: fix do_install failure when base_libdir has more than one level
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
X-List-Received-Date: Fri, 09 Mar 2018 09:53:13 -0000

Other sections of the .inc already use mkdir -p, so use it here as well.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 1f21cd4..106dcb0 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -227,7 +227,7 @@ do_install() {
         if [ ! -d "${D}${base_libdir}" ]; then
             # Setting base_libdir to libdir as is done in the -native
             # case will skip this code
-            mkdir ${D}${base_libdir}
+            mkdir -p ${D}${base_libdir}
             mv ${D}${libdir}/libncurses.so.* ${D}${base_libdir}
             ! ${ENABLE_WIDEC} || \
                 mv ${D}${libdir}/libncursesw.so.* ${D}${base_libdir}
-- 
2.9.5


