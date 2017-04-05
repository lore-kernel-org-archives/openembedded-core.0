Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B4AFE72F74
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491417998; x=1522953998;
	h=from:to:cc:subject:date:message-id;
	bh=PLYREND5TunT3lU+QQ1RnB+T/ME2ia0KFSRnBX6GB6o=;
	b=WlNLaN5D/Kwo8C9WCh8ElJf+QYM5G1sJQh9UI91iFX4o7I+WyZnSEDtm
	yT4A+EIv0FOoSwA1yctQNVvboAZxyg==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 11:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,280,1488873600"; d="scan'208";a="85178240"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2017 11:46:37 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 11:46:35 -0700
Message-Id: <921ba47f33a3a6d2941e805378408531e0cb510c.1491417681.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1491417681.git.mariano.lopez@linux.intel.com>
References: <cover.1491417681.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1491417681.git.mariano.lopez@linux.intel.com>
References: <cover.1491417681.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] package_ipk.bbclass: Replace empty lines in DESCRIPTION with '.'
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
X-List-Received-Date: Wed, 05 Apr 2017 18:46:36 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

opkg uses empty lines as separator for next package and if an ipk file was
packaged with empty lines in DESCRIPTION opkg won't be able to handle such ipk
file, this happens at execution time.

This commit will replace empty lines in DESCRIPTION with a '.' when generating
an ipk package to avoid this issue.

[YOCTO #10677]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/package_ipk.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index fa47385..c7cec9d 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -145,7 +145,11 @@ python do_package_ipk () {
                         # We don't limit the width when manually indent, but we do
                         # need the textwrap.fill() to set the initial_indent and
                         # subsequent_indent, so set a large width
-                        ctrlfile.write('%s\n' % textwrap.fill(t.strip(), width=100000, initial_indent=' ', subsequent_indent=' '))
+                        line = textwrap.fill(t.strip(),
+                                             width=100000,
+                                             initial_indent=' ',
+                                             subsequent_indent=' ') or '.'
+                        ctrlfile.write('%s\n' % line)
                 else:
                     # Auto indent
                     ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
-- 
2.10.2


