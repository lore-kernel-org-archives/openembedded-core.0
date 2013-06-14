Return-Path: <net147@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5452C61AD1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 13:01:04 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id xa12so546226pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6vc+gtYsIPb1lLLlEkdpO0EwImXseaQDoEufJJ0JbiM=;
	b=AFjWeh6i2kWFwcAKiyT+/7R+fGbYAYpzx3/SKLnFF7MiHDiUQUmLPtRB4cbJUugoL4
	Oxjb+42d1fYShsix9bnXbuw9G4RVua/pGMBUTXD2rwyakNRrqDI3n82DCua3BhFj9aYR
	ndIHNpGu3HQxREaTdAXGQ77jgRU7XQHTbF1MQsSbQGj+9BMN6MFRSug9ULGytYfuvp4p
	lhf2t3m3VeYHt7IUMxIX8B5cge5v4FXB/cHsyBG155phOjYkuPeo4W6A7Ww/Ek4e0B8w
	xqBvRFBAw7FqDkh0cUVBWTItuDyFnol5YW+Q61WmHq6zucBfBbnNV17GM+LGLY/dW7gF
	8Aww==
X-Received: by 10.68.213.42 with SMTP id np10mr2451358pbc.37.1371214865301;
	Fri, 14 Jun 2013 06:01:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id pm7sm2230211pbb.31.2013.06.14.06.01.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 06:01:04 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2013 23:15:17 +1000
Message-Id: <1371215717-22843-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] qt4: disable gdb_dwarf_index
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
X-List-Received-Date: Fri, 14 Jun 2013 13:01:04 -0000

* qmake is trying to call native gdb and we don't depend on gdb-native
  (or even provide gdb-native)
* fixes errors like this:
  /bin/sh: gdb: command not found
  /bin/sh: line 0: test: -gt: unary operator expected

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-4.8.4/g++.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
index e58fb15..d34c62c 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
@@ -49,6 +49,9 @@ QMAKE_PCH_OUTPUT_EXT    = .gch
 QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
 QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
 
+# do not depend on gdb
+CONFIG -= gdb_dwarf_index
+
 # some linking helper...
 CONFIG += rpath_libdirs
 
-- 
1.8.3


