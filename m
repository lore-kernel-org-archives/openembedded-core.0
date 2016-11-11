Return-Path: <philip.balister@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 82A9771A0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 17:52:28 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id n34so1319592qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=JW5dhMV0BT1mNUO0t340dt0xO2qy7fBfUUSvSq5PTGs=;
	b=Obpes25/XzoI9wt8dC0VqMWz1n6Xe85EH8S96fs+vMZ19G0zMnjIW2GKc9a4KvDwyX
	WTqo9m3DcU/2rTR2N8V6ERrKrhYA8ef1foSnmc3msAKl3xbCwuYvM9SlkwdAAWF+asoX
	28n5XekHtO+4WEcUJjDaePbQ+46U8a3IrSPbReNr9vcHHJZQttSJbvNvtOGd9/SGBCQP
	8TWFq0NN++LcJcXIQ6syJcf5ToQltqeenRFD9i+5lAqYor48HiHZrCuVIHq/rt25PWxj
	ClqQaNMaMpfVULNwHRzCtguPLryN4hqPon0tw63OdtfI+sCycpFDFwoZ/gBDxZYZTBm0
	AwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=JW5dhMV0BT1mNUO0t340dt0xO2qy7fBfUUSvSq5PTGs=;
	b=PY//OFoOxxHgVW05pgFyrGvRf4G2dSk9eHG4IPM4i5FcRnDv/q8CZMpUWEXyYuWVxD
	SHyjqIuvFLjwSgOnS0slcK8ae53KHojIdZ+mdrxHFqHrmkuHCWwp1V7aRo8fBKELX2uJ
	KxVIEQVTK2Wt1HKIZKHhbbTYf2X+E0r51Yly562DQvVt1FF6URzZ8rG1MaD21Z1+bS35
	GczvrPreGWGyldirRHFOBJzYBlx0sYwm0qe/J7Ypchiirkr7TcrGXJQyGzMxFkBrNy+c
	0zduD9cmJptbtHYfg2gq1stQwfwjje6YEltcD+DqjGajGWvkdS01h/YKERfConUU30WY
	x5yQ==
X-Gm-Message-State: ABUngveLRKYx8gj0LyYNus06cd/jlaFKu7+PIP2Hnpa70zOBCUoPKJf74xvkruMs2alp3A==
X-Received: by 10.200.49.106 with SMTP id h39mr4460011qtb.69.1478886750035;
	Fri, 11 Nov 2016 09:52:30 -0800 (PST)
Received: from thuvia.localdomain
	(pool-108-44-116-162.ronkva.east.verizon.net. [108.44.116.162])
	by smtp.gmail.com with ESMTPSA id t7sm5898904qtd.13.2016.11.11.09.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Nov 2016 09:52:29 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2016 12:52:13 -0500
Message-Id: <1478886733-27782-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: Fix rootfs_size variable not found error.
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
X-List-Received-Date: Fri, 11 Nov 2016 17:52:29 -0000

Commit 1ba6101ceaee354816e690d44bc9a5dd8dcf4011 introduced the runtime
error. Thi scommit should fix it. Tested with an sd card build with
an ext4 file system.

Signed-off-by: Philip Balister <philip@balister.org>
---
 scripts/lib/wic/partition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 89c33ab..dc85b42 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -308,7 +308,7 @@ class Partition():
         Prepare an empty ext2/3/4 partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         extra_imagecmd = "-i 8192"
 
@@ -326,7 +326,7 @@ class Partition():
         Prepare an empty btrfs partition.
         """
         with open(rootfs, 'w') as sparse:
-            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
+            os.ftruncate(sparse.fileno(), self.size * 1024)
 
         label_str = ""
         if self.label:
-- 
2.7.4


