Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8E26FC96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 14:05:11 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so10370934wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 07:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Byj/jQlXqePWoWh7YA1Hw5A24ap8bJRyNeJeTZhZlOQ=;
	b=CrCpXunPuW1nqu9fgk6ghSPaRSd80DF7fQuU6AAJT9JipoDflJ5r9XVSTj81acEbCu
	QyFOqMJR7pbdjCuHHCPBbS4l/wHvCgrYDBFy9DV1F4uTDU+bHOz+wmbUTNOi+Wu1Z6n7
	TjOGOh76cB9/m0l+rtYcJd0uy4X1b/LoubUczfzJ5L0iDI5uorl4N+NSr/BsWWO/Jovu
	kh5MKOPmdwSoUrlPenYHmPubQky1TKx6OBCeYrO0STZoU0tB5p2Dry1Mqcu43zCPgcwx
	bvJdAzZnBTen35gttjLMSNMIJMr8dn5qavJjYrtDyZP8dcZNtrKLTbabMYTr/7dWgIuh
	fH+g==
X-Gm-Message-State: ALoCoQnDn11kTnsdIkUxLcO81y67V39f448jDl+c8GM3D90aVPLOk9LF+b1PO5TGLzahth76YVtu
X-Received: by 10.180.86.202 with SMTP id r10mr30039553wiz.6.1408716312069;
	Fri, 22 Aug 2014 07:05:12 -0700 (PDT)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id
	pl7sm11947561wjc.43.2014.08.22.07.05.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Aug 2014 07:05:10 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
From: "root@myhostname" <lpapp@kde.org>
X-Google-Original-From: "root@myhostname" <root@pol-lx-007.polatis.com>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Fri, 22 Aug 2014 15:05:04 +0100
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 15:05:03 +0100
Message-Id: <1408716303-32264-1-git-send-email-root@pol-lx-007.polatis.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] ptest-runner: return 1 instead of zero if any test fails
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
X-List-Received-Date: Fri, 22 Aug 2014 14:05:15 -0000

From: Laszlo Papp <lpapp@kde.org>

It is better to know this information from the exit code rather than parsing
test specific outputs.

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-support/ptest-runner/files/ptest-runner | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
index 3342413..c618f11 100644
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -1,5 +1,5 @@
 #!/bin/sh
-
+ANYFAILED=no
 echo "START: $0"
 
 for libdir in /usr/lib*
@@ -15,9 +15,13 @@ do
         date "+%Y-%m-%dT%H:%M"
         echo "BEGIN: $x"
         cd "$x"
-        ./run-ptest
+        ./run-ptest || ANYFAILED=yes
         echo "END: $x"
         date "+%Y-%m-%dT%H:%M"
     done
 done
 echo "STOP: $0"
+if [ "$ANYFAILED" = "yes"  ]; then
+    exit 1
+fi
+exit 0
-- 
2.0.4


