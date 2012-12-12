Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TikgQ-0008Ut-TD
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 12:41:02 +0100
Received: by mail-wg0-f41.google.com with SMTP id ds1so1732540wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=yuDpLaUEiHIs+KPXTga9Blviu6u8ntVd7uN3NA4Vfwo=;
	b=IoxvwiFK2SzxXYqEa48rB39xwYlGHEqwQ8No47wHUE6j9B9nK7LiV/ItJbrwlH36RD
	kqAzdcsnMUGPTzJ2M/kpefBAbgslx7xGJUSAlGvQ5NC35zyjEv2z4ePrZkZmpGesLsdW
	Wo7w72Y0/FDB8tAgMTg+PovytaxsMVDnatT2KIuadvo5Un6gLDOocUbH8vsBf+Jpyd81
	vm4IR3TqtcOMiE823NwInzf95BczUBzqkVnb1x92onnx2bXI+h6hnEK6W2mpqL5lxRho
	V/seYFlm1JEj3Tyy/51MxwxaZvxz54dY2yrojqdyCdO91qGmiB6N/e6NP0mAJ7j6yXCi
	tieQ==
Received: by 10.194.81.228 with SMTP id d4mr1289407wjy.22.1355311589490;
	Wed, 12 Dec 2012 03:26:29 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id w5sm2773399wif.11.2012.12.12.03.26.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 03:26:28 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 16:26:12 +0500
Message-Id: <1355311572-10461-2-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355311572-10461-1-git-send-email-fahad_usman@mentor.com>
References: <1355311572-10461-1-git-send-email-fahad_usman@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH 2/2] iperf: pass in target path vars
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 11:41:03 -0000

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
71748b54694f4ffe2d598da71f641969df1417c0

slightly modified the patch to apply it on .bb file instead of .bbappend

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 8d1b232..e89a7c3 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -73,6 +73,17 @@ EXTRA_OEMAKE = \
 EXTRA_OEMAKE += "\
 	'CFLAGS=${CFLAGS}' \
 	'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
+	\
+	'prefix=${prefix}' \
+	'bindir=${bindir}' \
+	'sharedir=${datadir}' \
+	'sysconfdir=${sysconfdir}' \
+	'perfexecdir=${libexecdir}/perf-core' \
+	\
+	'ETC_PERFCONFIG=${@oe.path.relative(prefix, sysconfdir)}' \
+	'sharedir=${@oe.path.relative(prefix, datadir)}' \
+	'mandir=${@oe.path.relative(prefix, mandir)}' \
+	'infodir=${@oe.path.relative(prefix, infodir)}' \
 "
 
 do_compile() {
-- 
1.7.9.5



