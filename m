Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id D29DC7950F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 14:43:34 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id e12-v6so20616606iok.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 07:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AUFOJsthUS4e3T4O/ImVjSb4buiNM9sCqEEGGeolYVU=;
	b=bttpuF4wwYMPc6FMW4cHFVLDQtE9UeQ4KzUHKUVB770srLeO6rf1WbGBO56kKydlL9
	Ccle6C6pepGEAu4E6TkkhrRU0euS9Hnm6jn6raGcm7WJMXBVk0c1Cy35yYBXrySP1Tio
	SiC0oZWNcCoWOLcYwF1MkIDXiOeN1TKdhSOg5COZzEVrXzhBCQhhc5cqeNzNhCZYvfGl
	muOlcKAHsYZAXMHCGuX7ydxXeGdfrh5eFI2DYTsQubCq6+FpPWL9FEBbs3VyU6nivdnA
	YpLk1E3lxV8j6dHjv8jIyrBZF9jrf42LNJesBtTW8VmHBln2h9cKR0nWwMGwXq7JwLSd
	GEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AUFOJsthUS4e3T4O/ImVjSb4buiNM9sCqEEGGeolYVU=;
	b=V1K9aZ/7EHFNg6vF/zDikk8vWDe2pUBIrjKXyltuwD7zuMKDImHnPcUTgw4UWFqMQE
	OmP37fhPBO/I3Uj+iSTEuVUl1zzU/ewxgvhuAd+K7H22BYMj20MaXt+2Aic+CAY6lq56
	TQYo9tBDVXKUq94JRWgDDSpo6FWLSx4UwTDnqur0snV/Penx3Sc33oSa2zaobYgmLOHr
	hJ6r6RV1NlZbzf2aQ6KR0iFWSFIYVbyx8tBTuQP+jiWlD4MQsxq/Ny/n37+sNyldfzRE
	AG2ZZm0ONynA3Lg7MgMMYXNwu1EYmu/esSrvYgueykQSbWE3/mx1f33zT4X7lenOiR6s
	fG6w==
X-Gm-Message-State: ABuFfojkNRSnCjhs4JJ7lJve+jcKz9TK7vrUbSBiWcwy0WWvbQI6eIw/
	TnCLQHMbirqHeHedGbxPaMqKfBXl
X-Google-Smtp-Source: ACcGV62QTdClSvMV3wRq7uuyArUNMgjmgbtXi+uRqsJaDrHmu+yB/VyeuILgAetH6np6DKrVarprnA==
X-Received: by 2002:a6b:a188:: with SMTP id
	k130-v6mr1208690ioe.128.1537886615019; 
	Tue, 25 Sep 2018 07:43:35 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	m123-v6sm1019365itg.29.2018.09.25.07.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 07:43:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 09:43:20 -0500
Message-Id: <20180925144320.29517-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [master][sumo][PATCH] rootfs.py: Install -src packages when PACKAGE_DEBUG_SPLIT_STYLE is "debug-with-srcpkg"
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
X-List-Received-Date: Tue, 25 Sep 2018 14:43:35 -0000

When the source packages are created, they need to be included in the
debug image created when IMAGE_GEN_DEBUGFS = "1" for it to be usable for
debugging.

[YOCTO #12930]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/rootfs.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index cdb86f7715a..48588a46ae7 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -144,6 +144,10 @@ class Rootfs(object, metaclass=ABCMeta):
         bb.note("  Install complementary '*-dbg' packages...")
         self.pm.install_complementary('*-dbg')
 
+        if self.d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg':
+            bb.note("  Install complementary '*-src' packages...")
+            self.pm.install_complementary('*-src')
+
         bb.note("  Rename debug rootfs...")
         try:
             shutil.rmtree(self.image_rootfs + '-dbg')
-- 
2.17.1


