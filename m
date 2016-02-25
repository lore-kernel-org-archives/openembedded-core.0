Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2A08560110
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 17:21:53 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fl4so35357146pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 09:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cOmqB+XHn8V5Y/0Yon2baC7FdYeeJMBZQitK4suqQDg=;
	b=Jr+2ah2bde7vpeJ1YWl+HUFe07/QtA82agi6AiOAdVdAu99WuHB3z7lwi6kP1gdobQ
	ARtk6w+lVUz8IgiNT/SD88Dn7un94SYYuvg8blDuY1xGGyRuG0JAS/UfzoCFgSWynXl5
	ahgWLxcA6TTXvzDeg5GkaGrXUeTYxef5aeh1QEflwx0FMPFt36h4y/62Pnx72h3NTyah
	rknW64LPDdQbcpVeX4EP45rj/ncSfz7jbYAVC9grfN+yxeizyO7yLfmv9V2ltm5XUeLg
	AHuRrp4MeHzlmGvXt9jzStBxB4V3NEYsHWJL9f82i+DgRz88hXtYwHcxc0Yk6SuBpnQL
	r/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cOmqB+XHn8V5Y/0Yon2baC7FdYeeJMBZQitK4suqQDg=;
	b=aZoWUMCY2iTajNPNqluIa+9/TRSyCGi9730tufljMxEWYAduqd7hk/YFiOwrCYPqcF
	YZN+RwKrbz5kitFvkMIgV2NE2z5jPorUU5Rvcm5v+mqzk8vkISM6cjE4ghLd9KGcZKAz
	BdLNEHTCoAn+XnzO5E5vTJFbNI+agMrWrQhplNbA0Kec9Kenq6KHUL2id2rq3Htn6kcu
	B/vaKI6EALPwEHoFXf/Cm5yfF/U5Goy39ZeK5S9WnLJVZADrG2Eq2RcxDPX9n9zYcbxk
	hDewXOYs8RP2217V8OxUg/1gEFwFV/NnsaEkQ6dH5NJdxOk0J44KXkR6Vyjek76Xy+eJ
	XVrg==
X-Gm-Message-State: AG10YORaIO38z//eI3h6y+Qujf/kKimXtFLT4Povg5nKHC6GHhUV2eJ1ZGRLXyBX5gsWRg==
X-Received: by 10.66.252.100 with SMTP id zr4mr63390488pac.111.1456420914504; 
	Thu, 25 Feb 2016 09:21:54 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	by3sm13588663pab.39.2016.02.25.09.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 09:21:53 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 10:21:49 -0700
Message-Id: <1456420909-9926-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] wic: don't throw away our created swap partition
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
X-List-Received-Date: Thu, 25 Feb 2016 17:21:54 -0000

From: Christopher Larson <chris_larson@mentor.com>

We were creating the partition, mkswap'ing it, and then not dd'ing it into
place in the final image, as source_file wasn't being set for swap partitions.
This would result in a swap partition that couldn't be enabled on target until
mkswap was run.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index eee25a4..a0e74aa 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -173,6 +173,7 @@ class Wic_PartData(FC4_PartData):
             if self.fstype and self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
+                self.source_file = "%s/fs.%s" % (cr_workdir, self.fstype)
             elif self.fstype:
                 rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
                                              self.lineno, self.fstype)
-- 
2.2.1


