Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQy0-0003kl-0n
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:04 +0200
Received: by pxi1 with SMTP id 1so1933668pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=dSys24jpJwxxxfp2TUC2gTu+3r/PlrEOV/F+CrBrmDQ=;
	b=Xj1XZ5nJlEBjz/oWdYhC8v+BPW1srAHJ7aEb1B+Xn3c0X7K2MYCVw91bCEUZMMo3v/
	fOPSmjX8EAH+AW0SSfnfpy+gj4uSI/+LdRdHL8rIIfQZZg2N0Qimc7rIgEt0z24YcURC
	+Vs920BOdXM/YzVl+lG5xvpJEO6oTIYQOWw/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mLR3mvEHnMZm28D8hhrowF6Aoyjedvzq+VqdazGkTsy6Hs8QxN7Hq0C8qyCVkG+HhL
	q73pC9ATsGfRsu0MMwPWR/tIk628rYSkxwf77HkBAZqP/VPHXUX1rGkLNY3CwYr0s+lL
	bHnVFiXRERnsrVzB4FhX6n2ZqBMuwXBCJIkCQ=
Received: by 10.68.59.1 with SMTP id v1mr7151458pbq.291.1303757673684;
	Mon, 25 Apr 2011 11:54:33 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u8sm1798335pbm.78.2011.04.25.11.54.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:27 -0700
Message-Id: <3dffaaff83e2874214aaeb430ba47fa9b8a7b625.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303757256.git.raj.khem@gmail.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
Subject: [PATCH 02/17] insane.bbclass: Move code to add function to tasks toward the end
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2011 18:57:04 -0000

Cosmetic change to make syntax highlighters happy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 22a5086..98acf7f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -554,9 +554,6 @@ python do_package_qa () {
 }
 
 
-# The Staging Func, to check all staging
-#addtask qa_staging after do_populate_sysroot before do_build
-do_populate_sysroot[postfuncs] += "do_qa_staging "
 python do_qa_staging() {
     bb.note("QA checking staging")
 
@@ -564,10 +561,6 @@ python do_qa_staging() {
         bb.fatal("QA staging was broken by the package built above")
 }
 
-# Check broken config.log files, for packages requiring Gettext which don't
-# have it in DEPENDS and for correct LIC_FILES_CHKSUM
-#addtask qa_configure after do_configure before do_compile
-do_configure[postfuncs] += "do_qa_configure "
 python do_qa_configure() {
     configs = []
     workdir = bb.data.getVar('WORKDIR', d, True)
@@ -603,3 +596,11 @@ Missing inherit gettext?""" % config)
     if not package_qa_check_license(workdir, d):
         bb.fatal("Licensing Error: LIC_FILES_CHKSUM does not match, please fix")
 }
+# The Staging Func, to check all staging
+#addtask qa_staging after do_populate_sysroot before do_build
+do_populate_sysroot[postfuncs] += "do_qa_staging "
+
+# Check broken config.log files, for packages requiring Gettext which don't
+# have it in DEPENDS and for correct LIC_FILES_CHKSUM
+#addtask qa_configure after do_configure before do_compile
+do_configure[postfuncs] += "do_qa_configure "
-- 
1.7.4.1



