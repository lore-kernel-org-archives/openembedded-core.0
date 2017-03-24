Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE7177BA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490365082; x=1521901082;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mzXD8bjOJ9HM4sjQM2ik7T0eMex+w+HhZFC3M1jMZ/g=;
	b=aEsK9S2vAZgRJSV5vCzTk5ZjQTfffPiK4QEjsA5SygOBcvsHoYEZhzJN
	eLpvbkwtmjqS/gJrAtIL3tMf3/mMxw==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="1146511858"
Received: from mlehtone-mac02.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2017 07:17:38 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:17:27 +0200
Message-Id: <1490365050-11776-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/6] scripts/oe-git-archive: fix pushing
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
X-List-Received-Date: Fri, 24 Mar 2017 14:18:01 -0000

Git arguments were badly laid out.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-git-archive | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 117118b..aef4ba1 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -231,9 +231,10 @@ def main(argv=None):
         # Push data to remote
         if args.push:
             cmd = ['push', '--tags']
+            # If no remote is given we push with the default settings from
+            # gitconfig
             if args.push is not True:
-                cmd.extend(['--repo', args.push])
-                cmd.append(branch_name)
+                cmd.extend([args.push, branch_name])
             log.info("Pushing data to remote")
             data_repo.run_cmd(cmd)
 
-- 
2.6.6


