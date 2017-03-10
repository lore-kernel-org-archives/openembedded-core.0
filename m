Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7184477720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 13:16:41 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id j90so40819090lfk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 05:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rtIPGXvOAQ6peG2IrwLg2wcGw9fiDzb9Pbm6UOQG/Fo=;
	b=x33zxAX5Tn06fx71HrgAEeyvh5nZumFPUo8/CdDFTSuAhtIZ1ULcCcCwcN+0S+tUrK
	ChYhfdslcZHa1mpi6zBmHUPOMQPVOhCOwOqVpkBkrg/ELToW3SiUgbblmP228DPHrj+W
	Z43ABXH0zx6og8Glh+T1Dsc22g88V3NY3tFzWxc8P3P3XRbHKinZNtB+NI+tWGr8hG/U
	dG6la1cVFCV+GimppRD8WRec05ltBl1o92xhRR9B9fFbs/x1ZgsFqvGA99GNCE1zZa5Q
	ZCnqidg3P9qnJdozMZXPSFcGZp1HVpErJcVhwVFByL33i4TAIywy/7FQWjEgh0Vg54CK
	p7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rtIPGXvOAQ6peG2IrwLg2wcGw9fiDzb9Pbm6UOQG/Fo=;
	b=pafk5dMsLZEV/EXZdKYlqJtnxifIwVK77gSg64veO6XImbSJrzZmWEKUC70BGxbHm0
	CregHZRW+MFS2cxMWBUhwrN1/4uD0LhHfDJwO+djjo4reZikdf0E8bo2pRJZBFzoEkEa
	3BZ4Ya8lgxXYwhnxz3TQp4dKvOnB+ZaFFOhA6uRzSuNAsgjdv1s4d7wnhMNe0a6HGC74
	RsXdJ2P5NcXKRXHbLaUCh4fqy2+wcKQYOlmBhUEyJjR6dngaEayMn7FwUPrNIYyFbEC5
	XnUXi3MoKPsVEmkU20KXoQNfhhtWbNEEk7iwGMWI3bJljgssKW0+eT3Tw8TP1xDpwGDl
	1OBQ==
X-Gm-Message-State: AMke39kc1QhoXqqjQTSEqvaFbKbxpmCMt7vlzaxmOqlLcWCrxd1dQyIcrUz4PB/QKa8MWA==
X-Received: by 10.46.71.207 with SMTP id u198mr6080023lja.42.1489151802158;
	Fri, 10 Mar 2017 05:16:42 -0800 (PST)
Received: from kristian-Mender-T460s.cfengine.com ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	a63sm1853764lfa.22.2017.03.10.05.16.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Mar 2017 05:16:41 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: ed.bartosh@linux.intel.com,
	OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Mar 2017 14:16:27 +0100
Message-Id: <1489151787-13834-2-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489151787-13834-1-git-send-email-kristian.amlie@mender.io>
References: <2f34f5fc-ae61-d25a-2d55-5061158344e4@mender.io>
	<1489151787-13834-1-git-send-email-kristian.amlie@mender.io>
Subject: [PATCH v3] wic/partionedfs: Avoid reserving space for non-existing ext. partition
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
X-List-Received-Date: Fri, 10 Mar 2017 13:16:41 -0000

We don't need the gap that the extended partition occupies if we
already know that we have less than five partitions. Saves up to one
full alignment of space.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/plugins/imager/direct.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index b7e324a..5fbed56 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -344,6 +344,10 @@ class PartitionedImage():
 
         logger.debug("Assigning %s partitions to disks", self.ptable_format)
 
+        # The number of primary and logical partitions. Extended partition and
+        # partitions not listed in the table are not included.
+        num_real_partitions = len([p for p in self.partitions if not p.no_table])
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


