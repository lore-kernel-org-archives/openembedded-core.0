Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9E49F776B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 15:29:39 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m27so49349384iti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cL94qf48NJ7dPdd97jCGSK86uXtNxF++Rfu39KN9DyU=;
	b=A8CMEodiY3n3FlqPhaxJMp/8hiuUWgISOL5l7ljqlpGNl/252Vm5bHV4In/EezT2w4
	kQfinrodW+mfr7X586ltCeA3zZKBsrerFtWweIjTAuSVvvGgl1lSY009BAwpEyVjcA1C
	IfhOyn3BZFz8S3+zIBc3VP++Ty7+Q8/vJQJNHzCTetmsv7fyRMMfegwGodVw+DuQ+BS3
	je2UPdluN7TuJpojF0X3LZ9kRlleAQsBBeVvQUMV67rOWo8KSmBO+sZWAhNH3tqn+UTc
	0p3b0uUWBrmcvdkXf39vhgECptLjWhKOanf5GTDnqHakiJcIaX6hKqzLgpiSC2hVFrsh
	zNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cL94qf48NJ7dPdd97jCGSK86uXtNxF++Rfu39KN9DyU=;
	b=EXcUaCOnb40cZ7ordjt7nTUXrPr2Ory1Tibc1HF1bS4AUwqcLcU6Qk5xp4KQepG4Hh
	cIBXIr1YbXs5HKg5GHyg7bMg7WDvhdaoXYPZqaC5ToRvAzKbZgQjuTeTKB2mgNYOYXZo
	kFMNbQOmSDo0ueLS8SwVay3YW55UQHpmcOclkguCPiY5zNRzmyX4vDj3zDG64rcR/YYB
	oqQ+QSTJbdzrnvMgR81ecpGaAkxKTBNrGN+BU0XKfvYeeN8emfXEm7iRjpRuNXIFV06p
	RXANH9PocAsnH02mf/Si1sjYAxGBgNB0Lkv+rZ1mx+MoUZEDdq2G2SvfTpy8S8oI4dUR
	jYPg==
X-Gm-Message-State: AFeK/H2YqbtVudcCDOmrqgd3Tzf/SJkj6N0rPpyhYaIoREsE1z/V4HSUic3njfK6zCcXdLHG
X-Received: by 10.36.142.2 with SMTP id h2mr17463907ite.22.1489505380233;
	Tue, 14 Mar 2017 08:29:40 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D70D.dip0.t-ipconnect.de.
	[93.232.215.13])
	by smtp.gmail.com with ESMTPSA id t90sm92869ioi.31.2017.03.14.08.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Mar 2017 08:29:39 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:29:32 +0100
Message-Id: <d7930253eb64c32753c41d661f7148e5e65eafd8.1489505343.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rm_work.bbclass: re-enable recursive do_rm_work_all
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
X-List-Received-Date: Tue, 14 Mar 2017 15:29:39 -0000

When rewriting the do_rm_work injection, do_rm_work_all had been
removed because it seemed obsolete, as do_build now always triggers
do_rm_work.

However, do_build does not get triggered for all recipes and thus
do_rm_work was not called for recipes that got built only
partially. For example, zlib depends indirectly on
zlib-native:do_populate_sysroot.  Because of that dependency,
zlib-native got compiled, but do_rm_work was never called for it.

Re-introducing do_rm_work_all fixes that by making do_build depend on
do_rm_work_all, which then recursively depends on do_rm_work of all
dependencies. This has the unintended side-effect that do_rm_work then
also triggers additional work (like do_populate_lic) that normally
doesn't need to be done for a build. This seems like the lesser evil,
compared to an incomplete cleanup because it mostly enables the
lighter tasks after do_populate_sysroot.

The real solution would be to have two kinds of relationships: a weak
ordering relationship ("if A and B are enabled, A must run before B,
but B can also run without A") and hard dependencies ("B cannot run
unless A has run before").

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rm_work.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 054c937..2490a69 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -102,6 +102,12 @@ do_rm_work () {
         rm -f $i
     done
 }
+do_rm_work_all () {
+    :
+}
+do_rm_work_all[recrdeptask] = "do_rm_work"
+do_rm_work_all[noexec] = "1"
+addtask rm_work_all after before do_build
 
 do_populate_sdk[postfuncs] += "rm_work_populatesdk"
 rm_work_populatesdk () {
@@ -138,9 +144,8 @@ python inject_rm_work() {
         # do_build inherits additional runtime dependencies on
         # other recipes and thus will typically run much later than completion of
         # work in the recipe itself.
-        deps = bb.build.preceedtask('do_build', True, d)
-        if 'do_build' in deps:
-            deps.remove('do_build')
+        deps = set(bb.build.preceedtask('do_build', True, d))
+        deps.difference_update(('do_build', 'do_rm_work_all'))
         # In practice, addtask() here merely updates the dependencies.
         bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
 }

base-commit: 477805b913a6c4b4b630e42f08cd9e59f1e4e254
-- 
git-series 0.9.1

