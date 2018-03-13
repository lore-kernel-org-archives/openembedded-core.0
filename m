Return-Path: <jpmv27@yahoo.com>
Received: from sonic317-28.consmr.mail.bf2.yahoo.com
	(sonic317-28.consmr.mail.bf2.yahoo.com [74.6.129.83])
	by mail.openembedded.org (Postfix) with ESMTP id 24EF377BD2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 21:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1520976182; bh=CQ5/MahfHNLyajoHEKe/pRg4GxcYo8FYtpn1LxO5WVE=;
	h=From:To:Cc:Subject:Date:From:Subject;
	b=e/HtfvMKOQ4KrrkHCVys5lXJrWSCwqVD5f/Kk2jolfaE1FueuY6+WEAaOh/YLhskZWVQJgEBmESjhq2AxyxeFlq+B8CrLlBpxezwQYCye/imGXCE0Gp+D2P76ayFRQk+jtBpvcNcXOIJmNX136TP7VTFL9d+RNPIQ+Fal6DL/qm4ZD/edTW1et2CkU5SDrXxt+GU1x7mZJdD6LB2CpTT2Eu82HjfEbn0pI03kmGtbB5GbaEkSEBjMeQYCtuB4WPOZa7ymqxKNnY5HVNaNmxdnTrBlF6v3TANdBDogDJh2qb6CaftHf36GtIEL5BJ9e76kvqurDxcHVN3cxsyj/nc8A==
X-YMail-OSG: MfrG5jwVM1k9YVmk4EnJbvyoKi8Rw3y6gemPaZn1XyWNXhaMgKqNykCX4DlniIK
	jjV.gQtR0XyqFFzF743zd9JIFLKmpDY.xg0nVvOW..mFzxDaY7vu7owG3W_MUh67XPtweDWx84XR
	ctNVvjhoyhkK71YV_.kvVniBBY.7DfcdOq_EEL2BcQVjsgyQ2WcT87XbyHk2Smicx5m4adBVxWG1
	Gt1nb4mxvpQ0dwAbH4oPb4n9ZIWK6kmlcgX3h2PWRE.o2zREQECm4R0XdierwnPH.BcGh7jF1gtr
	wVz4caXzN7d8i8DcYfzD4rzD.nir10vr0Dh3B6oIFejr8nskNAO3mxjHpypo0mfFCCTcEaH4QDld
	Ad8DIYQn85OX3gIW.A1zwp3YcGyCIphMZvt3fxfhMX1ujYefbZvGlxkZv_ArfAg84nkW.sD4l3bs
	nOB_hX0T3a9OzPjAmMzGRE3tDfIGOrTY45itoVU9JWcl7c4xeQGnM4TwkH0KYc4R1ajoWu3Hw_M6
	AASuBFKrr1FnwqGh7rGM-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.bf2.yahoo.com with HTTP;
	Tue, 13 Mar 2018 21:23:02 +0000
Received: from CPE000db93f888c-CM001404556d28.cpe.net.cable.rogers.com (EHLO
	thor.int.jpmvrealtime.com) ([99.246.128.134])
	by smtp427.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	92bba12ff9dfc80ef696e14806e2fa36; 
	Tue, 13 Mar 2018 21:23:01 +0000 (UTC)
From: Martin Vuille <jpmv27@yahoo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 17:22:57 -0400
Message-Id: <20180313212257.9634-1-jpmv27@yahoo.com>
X-Mailer: git-send-email 2.13.6
Subject: [morty][PATCH v2] rpm: fix failure to report file conflicts
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
X-List-Received-Date: Tue, 13 Mar 2018 21:23:01 -0000

Signed-off-by: Martin Vuille <jpmv27@yahoo.com>
---
 .../rpm-fix-failure-to-report-file-conflicts.patch | 44 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch
new file mode 100644
index 0000000000..3b0d36d21a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-failure-to-report-file-conflicts.patch
@@ -0,0 +1,44 @@
+Problem: Conflicts between two packages trying to install different versions
+         of the same file are not detected. Both copies of the file are
+         installed and the build is not deterministic because a different
+         outcome results depending on which package is installed last.
+
+Cause:   All conflicts are treated as color conflicts, even when the files
+         are not ELF files. And one of the ways that these conflicts are
+         handled is to install both conflicting files and letting the one
+         installed last win.
+
+Fix:     Backport from upstream (see function handleColorConflict in
+         lib/transaction.c). Only treat as a color conflict when both of the
+         conflicting files have a color and they do not both have the same
+         color. Do not handle color conflicts by installing both conflicting
+         files.
+
+Upstream-Status: Backport
+
+Signed-off-by: Martin Vuille <jpmv27@yahoo.com>
+
+--- a/lib/transaction.c
++++ b/lib/transaction.c
+@@ -411,7 +411,7 @@ assert(otherFi != NULL);
+ 
+ 		rConflicts = reportConflicts;
+ 		/* Resolve file conflicts to prefer Elf64 (if not forced) ... */
+-		if (tscolor != 0) {
++		if (tscolor != 0 && FColor != 0 && oFColor != 0 && FColor != oFColor) {
+ 		    if (FColor & prefcolor) {
+ 			/* ... last file of preferred colour is installed ... */
+ 			if (!iosmFileActionSkipped((iosmFileAction) fi->actions[i])) {
+@@ -431,12 +431,6 @@ assert(otherFi != NULL);
+ 			    otherFi->actions[otherFileNum] = FA_CREATE;
+ 			fi->actions[i] = FA_SKIPCOLOR;
+ 			rConflicts = 0;
+-		    } else
+-		    {
+-			/* ... otherwise, do both, last in wins. */
+-			otherFi->actions[otherFileNum] = FA_CREATE;
+-			fi->actions[i] = FA_CREATE;
+-			rConflicts = 0;
+ 		    }
+ 		    done = 1;
+ 		}
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 497af8e055..296f6b8a97 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -120,6 +120,7 @@ SRC_URI += " \
 	   file://0001-system.h-query.c-support-nosignature.patch \
 	   file://rpm-ensure-rpm2cpio-call-rpm-relocation-code.patch \
 	   file://0001-macros-add-_gpg_sign_cmd_extra_args.patch \
+	   file://rpm-fix-failure-to-report-file-conflicts.patch \
 "
 
 # OE specific changes
-- 
2.13.6


