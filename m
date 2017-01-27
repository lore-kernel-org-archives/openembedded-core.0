Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8BAED700F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 06:51:39 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id x1so70577273lff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 22:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9zM3f05pVeEObKwkZhxnSTzsVf81/tyPZGuCvhrYaT0=;
	b=jZnexQa87q9pYS6lDDvfdNnb085tvjhsBVRNTLk8TUcIx30br6rQ8DJaK7bBOuV8bM
	xtXMD37qn2lG4NdZ+/Ha5RpstKF1JzG/BX+D3N5eG2xuvFgQlBXVcvXfRQ8TtOiNw2GW
	WMAWKJ8sBqQbE4hl1Zh/pmTOLjjmPZvbZXMbs5cPnXyilIcZkI0/ASTFyjY/YUh89wPY
	cAABDeo/mqVc0HIyFJ7jgogWMVvaH/4AVKIBYMvbPW1jzIbcwvdfw8rmvR8TpHkjg8Q6
	GF29NFfEc34hOfbWkvR8CHqf5Agdb4AWgcJoRv2kEAnVOHlJi9jMF37z9Dhe1sMMlL+t
	Fcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9zM3f05pVeEObKwkZhxnSTzsVf81/tyPZGuCvhrYaT0=;
	b=Zy9sYiJ1976oPcVBbbpRxLxiqh7q4V5vRTsuZyDXxNqQcP/nPSOe/lSU6HkyvjPtAa
	Sk0mLVTdce4OLp7dkuLjoP4sWTF/Dt3aXD6+FBPXdeRDAeREZzgOouM3MN1/8A19T9p6
	efLWYKcfKAoA/oYio7pkswRUQofOeSKmQWMgYYpKj+uTqz+oQPSHsLTl4oXV2RyHUEAG
	RBfd2gXFz34uPv5K3NYv3eTZBqVHET6xb5axINCDBdz+zs5qjmp9r2xdpxT+FRRlMhXZ
	WPNNIKFT9zkuLkGteeCSHDwO4D5Djh82fzKVHixesja9Slr53PTSFa1tWmFypTsal4L6
	QL7w==
X-Gm-Message-State: AIkVDXIwmbgJdxfxED0R2dX5pcsutwhlfk3hrRxuNi2/owO9Tu+N5MggRc8tXZ81wIp4Tg==
X-Received: by 10.25.67.83 with SMTP id m19mr1799657lfj.24.1485499898718;
	Thu, 26 Jan 2017 22:51:38 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	28sm1053394ljw.17.2017.01.26.22.51.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 22:51:37 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 07:51:37 +0100
Message-Id: <1485499897-15737-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic/partionedfs: Avoid reserving space for non-existing ext. partition
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
X-List-Received-Date: Fri, 27 Jan 2017 06:51:41 -0000

We don't need the gap that the extended partition occupies if we
already know that we have less than five partitions. Saves up to one
full alignment of space.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/utils/partitionedfs.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 721d514..9db6d56 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -131,6 +131,10 @@ class Image():
 
         self._partitions_layed_out = True
 
+        # The number of primary and logical partitions. Extended partition and
+        # partitions not listed in the table are not included.
+        num_real_partitions = len([p for p in self.partitions if not p['no_table']])
+
         # Go through partitions in the order they are added in .ks file
         for num in range(len(self.partitions)):
             part = self.partitions[num]
@@ -162,7 +166,7 @@ class Image():
                 # Skip one sector required for the partitioning scheme overhead
                 disk['offset'] += overhead
 
-            if disk['realpart'] > 3:
+            if disk['realpart'] > 3 and num_real_partitions > 4:
                 # Reserve a sector for EBR for every logical partition
                 # before alignment is performed.
                 if ptable_format == "msdos":
@@ -202,7 +206,7 @@ class Image():
 
             if disk['ptable_format'] == "msdos":
                 # only count the partitions that are in partition table
-                if len([p for p in self.partitions if not p['no_table']]) > 4:
+                if num_real_partitions > 4:
                     if disk['realpart'] > 3:
                         part['type'] = 'logical'
                         part['num'] = disk['realpart'] + 1
-- 
2.7.4


