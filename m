Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7800732E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 19:17:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1AJHuwF017443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Feb 2015 11:17:56 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 11:17:56 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Feb 2015 14:17:38 -0500
Message-ID: <1423595858-24970-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1423595858-24970-1-git-send-email-paul.gortmaker@windriver.com>
References: <1423595858-24970-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] git: add basic tab completion support
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
X-List-Received-Date: Tue, 10 Feb 2015 19:18:00 -0000
Content-Type: text/plain

Trying to use git w/o tab completion is especially annoying if
you are used to using it elsewhere -- "whatchanged" is simply
too annoying to type out in full more than once.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-devtools/git/git.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 59f1c00521fc..53e2ba9aac01 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -38,6 +38,8 @@ do_install () {
 	install -t ${D}/${mandir}/man1 ${WORKDIR}/man1/*
 	install -t ${D}/${mandir}/man5 ${WORKDIR}/man5/*
 	install -t ${D}/${mandir}/man7 ${WORKDIR}/man7/*
+	install -d ${D}/${datadir}/bash-completion/completions/
+	install -m 644 ${S}/contrib/completion/git-completion.bash ${D}/${datadir}/bash-completion/completions/git
 }
 
 perl_native_fixup () {
@@ -95,6 +97,10 @@ PERLTOOLS = " \
     ${datadir}/git-core/templates/hooks/pre-rebase.sample \
 "
 
+# Basic tab completion support
+PACKAGES =+ "${PN}-bash-completion"
+FILES_${PN}-bash-completion = "${datadir}/bash-completion/completions/*"
+
 # Git tools requiring perl
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
-- 
2.2.1


