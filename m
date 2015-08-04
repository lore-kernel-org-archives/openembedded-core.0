Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id B7BA976541
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 16:24:15 +0000 (UTC)
Received: by ioea135 with SMTP id a135so22228516ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 09:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ak5bRsNZo4//FhU3NFwofXNzlEqoBDj5VCixe3+4Hk4=;
	b=NRGQqckrQYwAps//XrXAoSbVc0D3zWwpboyeNbwkTqx/FoHA7mSzsTnYtPV0WFZa3P
	caHgfORX1qP0iDoX2nX+KqbxOnLRGDpE31lnq7/AYih3zzTd4D5gQdNte7tfjmuh3iXD
	gItH4K0sQ6XGZ4FvNJYcqNHETR88jwAtFlDDkojxEhkyeLnl4cqE8vuSfSmkYgzl/YZV
	7h4NDQCuFiWyAn/6iVq1gXw04sxR9CBxl1uBJQktHi4Q74DoBueZcM7lYv3ykBsO9u81
	ZFyPF8Me7oItVXwpOSsQkjPY8OFYParHyg6NdnIdiXlBOPEll66jCGHXrXP/SafJFox9
	7Hww==
X-Gm-Message-State: ALoCoQlNMhFoyJ3FL31Mmltf4ry+bPPE5i2Wi2u8Xz1gFJVNibz3QTLvnSFNKio6Yh/tyh5Ejh1D
X-Received: by 10.107.130.11 with SMTP id e11mr4535494iod.156.1438705454515;
	Tue, 04 Aug 2015 09:24:14 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8CA2B.dip0.t-ipconnect.de.
	[93.232.202.43]) by smtp.gmail.com with ESMTPSA id
	ii1sm1400785igb.10.2015.08.04.09.24.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Aug 2015 09:24:14 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 18:24:00 +0200
Message-Id: <cf4cee667e2c9ae29392c2619dd4816ddf388c5e.1438705086.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438705086.git.patrick.ohly@intel.com>
References: <cover.1438705086.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1438705086.git.patrick.ohly@intel.com>
References: <cover.1438705086.git.patrick.ohly@intel.com>
Subject: [PATCH 2/2] combo-layer: fix action_pull for unknown branch
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
X-List-Received-Date: Tue, 04 Aug 2015 16:24:16 -0000

When reconfiguring the branch to something not already fetched,
action_pull fails with
   error: pathspec '<new branch name>' did not match any file(s) known to git.

It is the "git checkout" which fails like that. To solve this,
try the faster "git checkout + git pull" first and only if that fails,
fall back to the slow "git fetch + git checkout".

In the conf.hard_reset case, do the checkout always after the git fetch.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 7380f5b..7435a17 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -586,13 +586,25 @@ def action_pull(conf, args):
         ldir = repo['local_repo_dir']
         branch = repo.get('branch', "master")
         logger.info("update branch %s of component repo %s in %s ..." % (branch, name, ldir))
-        runcmd("git checkout %s" % branch, ldir)
         if not conf.hard_reset:
-            output=runcmd("git pull --ff-only", ldir)
-            logger.info(output)
+            # Try to pull only the configured branch. Beware that this may fail
+            # when the branch is currently unknown (for example, after reconfiguring
+            # combo-layer). In that case we need to fetch everything and try the check out
+            # and pull again.
+            try:
+                runcmd("git checkout %s" % branch, ldir, printerr=False)
+            except subprocess.CalledProcessError:
+                output=runcmd("git fetch", ldir)
+                logger.info(output)
+                runcmd("git checkout %s" % branch, ldir)
+                runcmd("git pull --ff-only", ldir)
+            else:
+                output=runcmd("git pull --ff-only", ldir)
+                logger.info(output)
         else:
             output=runcmd("git fetch", ldir)
             logger.info(output)
+            runcmd("git checkout %s" % branch, ldir)
             runcmd("git reset --hard FETCH_HEAD", ldir)
 
 def action_update(conf, args):
-- 
2.1.4


