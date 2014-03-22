Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3EE6FA6F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Mar 2014 22:41:53 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so10496193ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Mar 2014 15:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=cp9y+96VPl244RZVY+VApJf+xUFRVoz7o0uh4RQPeAc=;
	b=wwnDnFYLWXCSv061cC59g6lxQW/x4/QcRhCIzvjCFaNMnPIoxjIO2fxEfZulbCxTGV
	rSv+dCRN3aKjnTSQtnK8gvIArfuYDPh3rlhz/Ul7Ddb+ls6zH80sG++j9xhG4c5qkw2t
	xg0WMNjz3ZNBA1IFmfFvT7h+ihCvcJVagwfODEXzRsY3d+6j+S99hQcNB/4W0WmZb9kp
	5dSQ7Uwa6F3N+BnXs/56+6BdG5trKx8/+KEIu8/eK6+FPhVhT+6MxzK8QN2B+O50+uW5
	Ei5/vOEY5HpN4dBze9+IyFg3js1VH4CbSq4z+6I0c1y7mPo/xcQlD8scgRwZ45b2r7Ly
	f43A==
X-Received: by 10.236.18.227 with SMTP id l63mr173351yhl.101.1395528114405;
	Sat, 22 Mar 2014 15:41:54 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id e70sm15436692yhk.9.2014.03.22.15.41.52
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Mar 2014 15:41:53 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Mar 2014 19:41:36 -0300
Message-Id: <1395528096-4664-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395158745-9424-2-git-send-email-joaohf@gmail.com>
References: <1395158745-9424-2-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] wic: Add SD/MMC-Cards support to '--ondisk' param
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
X-List-Received-Date: Sat, 22 Mar 2014 22:41:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The special case when wic is set up to use SD/MMC-Cards in place
of sdX disks is not handled properly.

Append 'p' to the rootdev when disk is SD/MMC-Cards fix this situation.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 changes since previous version:

  * add Signed-off-by

 scripts/lib/mic/imager/direct.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index f8c300c..1f2f8fc 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -345,10 +345,14 @@ class DirectImageCreator(BaseImageCreator):
         parts = self._get_parts()
         for num, p in enumerate(parts, 1):
             if p.mountpoint == "/":
+                part = ''
+                if p.disk.startswith('mmcblk'):
+                    part = 'p'
+
                 if self._ptable_format == 'msdos' and num > 3:
-                    rootdev = "/dev/%s%-d" % (p.disk, num + 1)
+                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num + 1)
                 else:
-                    rootdev = "/dev/%s%-d" % (p.disk, num)
+                    rootdev = "/dev/%s%s%-d" % (p.disk, part, num)
                 root_part_uuid = p.part_type
 
         return (rootdev, root_part_uuid)
-- 
1.8.3.2


