Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 90D07607AF
	for <openembedded-core@openembedded.org>;
	Mon,  2 Mar 2020 05:39:58 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p11so3735054plq.10
	for <openembedded-core@openembedded.org>;
	Sun, 01 Mar 2020 21:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5p0gC972aowqEOCz9vGopB+o80zUT5lSSH4t54iCeO8=;
	b=hpPymsq7my5U7/oMH5eTw4s4lnlBch7Jfvex542eryIPb6uhYZc+gpY8HJBnIdT9WP
	e/PqmFhQLnUQW39vvcLn4W0vCxsmhkdDkD6cii/s9se+C+qhDTWuONJoCG1no9Uxa2uh
	TyNd0MMrT+YfRWjhqumYHNURh3xTap+vH7gEmV85NhTIQ3om3QRQLgqZnsShWNGc+aO9
	+xIi0nTyOZ5ka5YpdHrCo1qLJVbKl2+c0cWHzYdyLM9WEXig7CypKPxvm1FtwkS6iqgg
	YSJNCH9ZsZsgv/OzKRp4oo+R+mAHG6ve06aTM6a7itOer1pIvL6VM0UgrYKfI04DJ5O2
	BnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5p0gC972aowqEOCz9vGopB+o80zUT5lSSH4t54iCeO8=;
	b=DbuSyGo/qrpPhUcUwdRACYLJCPxl7ckiOtVT8LQ0jALEFWmnw0HbSihmneqpj85LyE
	+Rj0Jj+64LTNQXnEZznLPzvdmfcrxJJrsxX2ODBBt89Zw6Du2YFLuh4Bj95oowYBR7b3
	oY2nrVvfSQUKmx3Jlta7BEyVt7RdDkkaIl9ZK4iBGSn7oy1t/thdswl953VKXY1bGA8E
	mnR1O1KZTudmpi5TqtlPTiET+U55sO0CxtrFcKhvYoNMV4eIHnigIDlps3S33WqzMuhD
	K0w9hCNM+pz5qdTISKpFcduUqWjE5v8kTIUVUAXDMN/NAkHAE9oyvoGBBe8CwVHgeSpp
	7AMA==
X-Gm-Message-State: ANhLgQ3z4XI6Y7nemm7bGtMzven3w/XLB90f+pn6m6w6xhI3DlN+hffQ
	3hkLHjpEY5/91F/536M0O4ThleN7
X-Google-Smtp-Source: ADFU+vsEArQCWsoV8K7CoZicHCdZdrx7xpIdIk4DlV48N3SJ+xD8koFc5+TLX407r7l3eoOiYPzH1g==
X-Received: by 2002:a17:90a:fb92:: with SMTP id
	cp18mr1784460pjb.3.1583127598977; 
	Sun, 01 Mar 2020 21:39:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:49d:a952:8828:ae6a])
	by smtp.gmail.com with ESMTPSA id
	fh24sm10448670pjb.24.2020.03.01.21.39.57
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Mar 2020 21:39:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  1 Mar 2020 21:39:56 -0800
Message-Id: <20200302053956.10998-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wic/engine: lets display an error not a traceback
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
X-List-Received-Date: Mon, 02 Mar 2020 05:39:58 -0000

If the requested partition does not exist in this request "wic ls {path}:pnum"
display a nice message not a trackback

Also fix displaying the pnum and not "%s"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/engine.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 83c42c9987..9ff4394757 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -291,7 +291,7 @@ class Disk:
 
     def _get_part_image(self, pnum):
         if pnum not in self.partitions:
-            raise WicError("Partition %s is not in the image")
+            raise WicError("Partition %s is not in the image" % pnum)
         part = self.partitions[pnum]
         # check if fstype is supported
         for fstype in self.fstypes:
@@ -314,6 +314,9 @@ class Disk:
                     seek=self.partitions[pnum].start)
 
     def dir(self, pnum, path):
+        if pnum not in self.partitions:
+            raise WicError("Partition %s is not in the image" % pnum)
+
         if self.partitions[pnum].fstype.startswith('ext'):
             return exec_cmd("{} {} -R 'ls -l {}'".format(self.debugfs,
                                                          self._get_part_image(pnum),
-- 
2.17.1


