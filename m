Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SW9uC-0006SU-HJ
	for openembedded-core@lists.openembedded.org;
	Sun, 20 May 2012 19:26:56 +0200
Received: by wgbdr1 with SMTP id dr1so3727745wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 10:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=NJ8PBaN+cT5CfpPn+UMtMYIAaktOR5OWVfKDFttAX3w=;
	b=H/bJ5QlH/p4JYpSOWu9dia8fWaG5d/zLQho+bQmhCgHiX7pTeIHEKFueH0tp03j9Ui
	fe7YFcha2CW5n8k/oU8JIZtK94mj7zkDd1RSD1B5Vmgcg1TrWWq0wGxDlB1Wq62Z+WMO
	mxjzFUg8Rz0F8LmZG4p8APSEhn8AsXdqIYpIxP5JN9V8kVfALOV1NxwXhYcUVjmivX2m
	OlD7BUKmL8tYAevfr+EdTA2i1ykxoxRaPusWn3t5HP4NcNe4dxGNjs5zqECzizf+0CGg
	xQkEC1XlWhnCq3i5rltpCftMR4NFPmlD+DKhDTT12qcVlG2Z/gHyrbXilZ2stl3dIWuH
	6FtA==
Received: by 10.180.104.231 with SMTP id gh7mr18041801wib.10.1337534209802;
	Sun, 20 May 2012 10:16:49 -0700 (PDT)
Received: from localhost.localdomain ([79.117.116.178])
	by mx.google.com with ESMTPS id f19sm30003112wiw.11.2012.05.20.10.16.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 10:16:49 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:16:35 +0300
Message-Id: <1337534195-5184-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkWRdul15GuEnXKkXEEO8CMAqmjgYG/iv+9KrnqKILGYMFUQfNn3w73ncAplErcoMFS8H+Q
Subject: [PATCH] bb/fetch2/__init__.py: Don't try to compute checksums for directories
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
X-List-Received-Date: Sun, 20 May 2012 17:26:57 -0000

In this way we avoid failing the build while trying to fetch local
directories.

[YOCTO #2475]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 bitbake/lib/bb/fetch2/__init__.py |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index 9864595..e3ac4d2 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -671,6 +671,11 @@ class FetchMethod(object):
         """
         Is localpath something that can be represented by a checksum?
         """
+
+        # We cannot compute checksums for directories
+        if os.path.isdir(urldata.localpath) == True:
+            return False
+
         return True
 
     def recommends_checksum(self, urldata):
-- 
1.7.9.5



