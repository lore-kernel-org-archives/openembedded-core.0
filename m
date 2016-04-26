Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E3C506011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 573DE2E128
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 00c0lnNv8TXi
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id ADD232E113
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 980A81516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 8D5ED145B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8B9BA109F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3QJo0Bf022771
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3QJo0Hk022770
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2016 21:50:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 21:49:58 +0200
Message-Id: <80df31c476967370f13a104cc5a777cd5127ef1b.1461700116.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1461700116.git.pkj@axis.com>
References: <cover.1461700116.git.pkj@axis.com>
In-Reply-To: <cover.1461700116.git.pkj@axis.com>
References: <cover.1461700116.git.pkj@axis.com>
Subject: [PATCH 1/1] metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo
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
X-List-Received-Date: Tue, 26 Apr 2016 19:50:04 -0000

The functions base_detect_revision() and base_detect_branch() try to
extract SCM meta information from the path returned by
base_get_scmbasepath(), which currently returns ${COREBASE}. However,
making the assumption that ${COREBASE} contains SCM meta information
can be false. It is true for Poky, but not necessarily other
environments. A better option is to look for the SCM meta information
based on the meta layer.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/metadata_scm.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 0f7f423..2e6fac2 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -4,8 +4,7 @@ METADATA_REVISION ?= "${@base_detect_revision(d)}"
 def base_detect_revision(d):
     path = base_get_scmbasepath(d)
 
-    scms = [base_get_metadata_git_revision, \
-            base_get_metadata_svn_revision]
+    scms = [base_get_metadata_git_revision]
 
     for scm in scms:
         rev = scm(path, d)
@@ -27,7 +26,7 @@ def base_detect_branch(d):
     return "<unknown>"
 
 def base_get_scmbasepath(d):
-    return d.getVar( 'COREBASE', True)
+    return os.path.join(d.getVar('COREBASE', True), 'meta')
 
 def base_get_metadata_monotone_branch(path, d):
     monotone_branch = "<unknown>"
-- 
2.1.0


