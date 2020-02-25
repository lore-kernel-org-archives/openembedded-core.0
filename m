Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id D6FA86131F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:43:54 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id d5so763723pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 21:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jIjqlgDwHEymKR+/NMxj9GISHh1tltOa576T2317XIY=;
	b=N8eqK8jULkTBmyiU4rVogR9XZh0SsR6Et7lAKpHpfT1i5UsKZigsFcsu7Wl2EKTnHQ
	uNTV+BuuKbTz+2WEpdRof85+vOCwJ14zkj2wzzLXm/+mayc/x0S5QsqNEAPBw5pJL+39
	lnEV4+lAH27uQdcSHbfL/1kWMSZVDQwRfYO14/xiCxLJhJXXlFNbJeqVGUo+yKzpYXcm
	pfnyg6U4wj4n5p/N3SK6BQWnYPa1HbPblhbK/XlJ0arYG1mzf+hn+Q8k9AF8wLy+Bt+0
	ot6w7ZFuAugnqmwEWFrILFGVI7hYrFEKjdyhVJ5f+HUUGIOVGeZIN8pkFXYTpASatG94
	KnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jIjqlgDwHEymKR+/NMxj9GISHh1tltOa576T2317XIY=;
	b=qQJkw/NleGDVSfSvgyMOuecGqHr+Ki6ZSZKOhe7FdGnelF/FPl2gSKFBtDnRxMOjZV
	Npjf/UKkeQtrxAYEtf6myEOkW3zg10lH/5G6/6Je51Z1ISv5GcmrPWmbSSAulRbJ0Z+v
	l/TLpiVyz85A+r7OPaKage1hqZ8hjxncKxo15MiuwkLGlz7n+2c7FBV2i7TWvtyWYdUW
	Ocwnn4V/03LO29XmQNWHV3IC+Z/6aITFOsJ1OLVVRFd2qjXjxfR1Q0Of//C14imSzUyz
	+puMi/KdlxFJRTcZ1yQP6R+jFdW4nOLpe3M7ktISUQn7QklxnkCZT8NoEFLrOjun8exZ
	c6tQ==
X-Gm-Message-State: APjAAAWfVrhiNzM6kvRuFXRIft4LpivpYxs6hMI4oTDOJRXOGlL2p6xU
	PaRKDF13DjvTJIO1oYCav3p46CCkNGc=
X-Google-Smtp-Source: APXvYqwNxXBKG51JwOHnS8Hlg7qWiNMQgJXED8I78c6QlmGL4Hh25MHOtxUruDoeU622K09bMlv0vw==
X-Received: by 2002:a17:902:8b8a:: with SMTP id
	ay10mr54280823plb.288.1582609435720; 
	Mon, 24 Feb 2020 21:43:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	b18sm15196494pfb.116.2020.02.24.21.43.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 21:43:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 21:44:06 -0800
Message-Id: <20200225054406.867243-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] mime,mime-xdg: Conflict with allarch
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
X-List-Received-Date: Tue, 25 Feb 2020 05:43:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mime and mime-xdb classes add dependencies ( both runtime and buildtime
) on target packages, therefore recipes using allarch should not inherit
mime/mime-xdg or vice-versa, this fixes subtle sstate mismatches

[YOCTO #13805]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/mime-xdg.bbclass | 5 +++++
 meta/classes/mime.bbclass     | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/classes/mime-xdg.bbclass b/meta/classes/mime-xdg.bbclass
index 63169e990d..c175291814 100644
--- a/meta/classes/mime-xdg.bbclass
+++ b/meta/classes/mime-xdg.bbclass
@@ -14,6 +14,11 @@ DESKTOPDIR = "${datadir}/applications"
 # skipped for MIME_XDG_PACKAGES not empty
 MIME_XDG_PACKAGES ?= ""
 
+python __anonymous() {
+    if bb.data.inherits_class('allarch', d):
+        bb.fatal("allarch and mime-xdg can not be inherited together")
+}
+
 mime_xdg_postinst() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_desktop_database ${PKG} \
diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index c9072adf3b..f4ccac7bd4 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -6,6 +6,11 @@ DEPENDS += "${@bb.utils.contains('BPN', 'shared-mime-info', '', 'shared-mime-inf
 PACKAGE_WRITE_DEPS += "shared-mime-info-native"
 MIMEDIR = "${datadir}/mime"
 
+python __anonymous() {
+    if bb.data.inherits_class('allarch', d):
+        bb.fatal("allarch and mime can not be inherited together")
+}
+
 mime_postinst() {
 if [ "x$D" != "x" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_mime_database ${PKG} \
-- 
2.25.1


