Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id DEAF87391A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:30:14 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id x1so6034890lff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pYOeADj6PE3dxlhe/hoUEwIdiyLAc5TTPbSxVyJmu6s=;
	b=Oxzq8VTGp6VO4woNYmMMEmd2o/A6AVqFknY4DC1veY4+ySFvtaFs2E9KrgCZthjlUl
	8ipWc6VLvU8um3kUYsIy0Evqr6VqQT3x44yfLm9rN2NdXFdiv6q9OcZRJTGuhGXp4qvL
	rDckCSE1Ou6z8jzdoo7Ypa1I2sT+/gua+G5cFtvnTtssxTWIMsPoamrgRT87NuA6QDY+
	zjVNEAy0ct2b+YfuYV+y0ZxT+QqF4ykTk8r70b+0Aq6IaWQdUUcRSRZa5W41+2NoFSym
	0qRmCa05eliEGToRxVFIKZSrmV07wFgoo36b2yg3VdQBi5HN7sTgFOgd9s+gvgpTu6zg
	LgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pYOeADj6PE3dxlhe/hoUEwIdiyLAc5TTPbSxVyJmu6s=;
	b=ozg3Sx+hGgfF3THjuAHnBtyXoBN+n9uTG/BmQBCggVR6/1Whlje9TqIi+PTsrmREVt
	a3BOBE4pQ4n9aJmcLpDyaXvT9wjh/YIQ/9lnhsr8DSub1fGgD/qjnFdPteRSEAwGt74C
	GOOpiFCY65Tj4QCNDdD7KKn1rZoDdaqybIwe524iKwxfYw+NRXLZ6GFL+rn4ivTKGQ6O
	gmBtPjV/SeVV+J79ZepuOtM7UUofm0JlT3YqIYV7vrluv0XpGonmmAC8/6enTSp7guWr
	zR5pjhkypzEwtggvE4cyKzenYg00nahM3KYAwaOuNkloOf6Mtaw0TcxL0umTFhOlVxCc
	56og==
X-Gm-Message-State: AMke39nOtPWVczT3plQ78o8hThxjFggI00/t7Vzro9ugYBToeSHExhngf+n3sPWwLJcJsg==
X-Received: by 10.25.196.136 with SMTP id u130mr463715lff.37.1487241014378;
	Thu, 16 Feb 2017 02:30:14 -0800 (PST)
Received: from kristian-mender.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	1sm1598130ljv.40.2017.02.16.02.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 02:30:13 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Feb 2017 11:30:12 +0100
Message-Id: <1487241012-8486-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LYBSzN4ga5qyMU=ZxAn6rYGye5vaTMHQ7MSeS25TsVXoQ@mail.gmail.com>
References: <CAJTo0LYBSzN4ga5qyMU=ZxAn6rYGye5vaTMHQ7MSeS25TsVXoQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 16 Feb 2017 10:30:15 -0000

We don't need the gap that the extended partition occupies if we
already know that we have less than five partitions. Saves up to one
full alignment of space.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/plugins/imager/direct.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 481d24d..bc2d620 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -344,6 +344,10 @@ class PartitionedImage():
 
         msger.debug("Assigning %s partitions to disks" % self.ptable_format)
 
+        # The number of primary and logical partitions. Extended partition and
+        # partitions not listed in the table are not included.
+        num_real_partitions = len([p for p in self.partitions if not p['no_table']])
+
         # Go through partitions in the order they are added in .ks file
         for num in range(len(self.partitions)):
             part = self.partitions[num]
@@ -369,7 +373,7 @@ class PartitionedImage():
                 # Skip one sector required for the partitioning scheme overhead
                 self.offset += overhead
 
-            if self.realpart > 3:
+            if self.realpart > 3 and num_real_partitions > 4:
                 # Reserve a sector for EBR for every logical partition
                 # before alignment is performed.
                 if self.ptable_format == "msdos":
@@ -408,7 +412,7 @@ class PartitionedImage():
 
             if self.ptable_format == "msdos":
                 # only count the partitions that are in partition table
-                if len([p for p in self.partitions if not p.no_table]) > 4:
+                if num_real_partitions > 4:
                     if self.realpart > 3:
                         part.type = 'logical'
                         part.num = self.realpart + 1
-- 
2.7.4


