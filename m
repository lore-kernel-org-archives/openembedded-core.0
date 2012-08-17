Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T2IX2-0007BT-1i
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 11:07:52 +0200
Received: by bkcik5 with SMTP id ik5so1902521bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=mH9PlipzvwTfPK/48N11j/pDIsuxBb11vWBPLllofVQ=;
	b=nerDWZ7hLl1dDm73sP/j7793tCDgXK4/5Qo6K4seqNjxgfTYxc2232clhvjjB7B4jD
	EQMJisDhlAh7Ce0d82/trjrblFSwTXH7+pDldLbD9ovx4Yr+o9Z3Z+yJjwTKvInrhRqt
	aqjyFZow/Pb/LIfk9M7ldMeeYHE6OhLuHb/2NqlKCBHZjqMB9uX+8PlBHBhtpOmIN4yv
	xUOR7DxaINIphb7H5/V1yAnBVMqJsKfMLi/TXjo5m4sHVXD0V+NHY2PkOF8CuehPTcFp
	4pTP5opqjcZsCyMCaR5zDvXci9QSoedf0jwm4BXy/RtQJNs0A7f//yKm87nOOimG+uu5
	vMjA==
Received: by 10.204.149.217 with SMTP id u25mr1557432bkv.107.1345193753507;
	Fri, 17 Aug 2012 01:55:53 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id he8sm3311868bkc.3.2012.08.17.01.55.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 01:55:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 10:55:16 +0200
Message-Id: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH 1/2] webkit-gtk: workaround races with make 3.82 by rerunning make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 09:07:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
index dd43811..afd3a7a 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
@@ -81,6 +81,23 @@ do_configure_append() {
 	done
 }
 
+# dirty hack for gnu make 3.82 race condition
+do_compile() {
+    if [ x"$MAKE" = x ]; then MAKE=make; fi
+    bbnote make ${PARALLEL_MAKE} "$@"
+    for error_count in 1 2 3; do
+        bbnote "Number of trials: $error_count"
+        exit_code=0
+        make ${PARALLEL_MAKE} "$@" || exit_code=1
+        if [ $exit_code = 0 ]; then
+            break
+        fi
+    done
+    if [ ! $exit_code = 0 ]; then
+        die "oe_runmake failed"
+    fi
+}
+
 do_install_append() {
 	rmdir ${D}${libexecdir}
 }
-- 
1.7.6.5



