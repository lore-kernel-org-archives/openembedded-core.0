Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F16C98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:34 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2819.1790154690899509076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dEtjWp7a;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so4669395e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154689; x=1790759489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ULBQA17OEzhA1G8hbuORzyXr+QsNnBcp7HcQPUKDBEk=;
        b=dEtjWp7a59TVusQ8lTNSaWB3FubLlTp4hEZobxDYpi/Mg1w/gA/OMnyodfSiGkJOhT
         Xv+vndVw7VKZulIGQ1FgPRYiWVrNNCEEhhtJD20xyFUnPfwmiH6XOtdHWBfOjiNUb8Xk
         RHqLbRbl8/lgH3m2Ma5eosQ94p/vD5a71uWLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154689; x=1790759489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ULBQA17OEzhA1G8hbuORzyXr+QsNnBcp7HcQPUKDBEk=;
        b=uORUQvyBorfapB3QxiPJNuUvWDypNX1Y4zur0c2KD0HW/sdPekeWcBZI4nfEAcXlQi
         S+PAQTjHeNZJyH07szr1LLBrXTftjL2H6sa1c+nmxuojLCiYCSg+a4JRSJEzlulPim6S
         H4LOYLvllOOwRoDo/Fxwa0IEID+HgUjgCuwlmlKf25G80AAKD6YtWCmO+9v/QdTAXu28
         3L8DL9HbhLCvc2UncOSiFvO2yDkSvl4QJ02sz1PiRa+7xmbvBTYP5KzDxpar1t3jv22O
         tjUPChvCv+aavOud/8Twj1Oz77pUzcnsJTZT+2BQOJRoZbP6UlEbR2C3pRooSyen4cq6
         eDHA==
X-Gm-Message-State: AFuF++mecOm+vdAhX/ixBsdxG36HSvyALTB/HC9u25m8kJDq0QSYdKbt
	Ayo65yFCtD4tr+88Z3fa+0K3o19Hphz4lM/7ABtT8QdmiKqIpOirOfAJ1Dbb1OMy+bXsXC5mqE0
	afYX1110=
X-Gm-Gg: AYBFou1ECtgzijUOy76KOUP/rLnnqofkuIsa9E95aaMa8suXiQPjbgKWHOY5HqCcOcl
	2tFeWWRG1bIvPKiJ93S5+MTGa4HukiVybfs2PtiZULLZSJChiwo5C0niP1Qw/hac9NyGap0SFka
	4xrk3bkKbvfeyhCYavED0mjmzUsClTr48fp2yCwufC5vG8CX2hWJOO/BVybyLng19o8wtE3wccR
	fdv+lR0N8DKbpey49PomqUPyuTAevb5nl5sikaOJbRqndhczzli1hQ7GXl0us/Nk1ndn4s/uZmc
	84GlYyRzsi6J64+vJ97HsJy0xp84fsMIz40f9KpDkNwkupiHYJgohfGeFHHNLqVuuzI11VH7Blf
	1oRTfOh9AvXBwUJNrxUl83YRKwSMdpQaFrZhRhl0AaUSRqlpMxq46V/NH47yz7QkR2Rpn9cQjSP
	2kG2KpfpR2OpBEV/5Ur9fIDGIO0g6IphuhWskoqmR0ibUpJ4YlEExqu+suNRJOp46YR/FDKRBfs
	+XeLBlCiyksHWNapZAjS3ULg4wsQA/ap5qtvnTuf+k+dV47rteudFow4nxOHs2rtAAwIMr6
X-Received: by 2002:a05:600c:4e93:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49fdee0a952mr24646705e9.3.1790154689137;
        Wed, 23 Sep 2026 02:11:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/48] perl: Fix CVE-2026-19487
Date: Wed, 23 Sep 2026 11:10:12 +0200
Message-ID: <1453227f21f0cf3d769582dc10ca34f0169dd41d.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246472

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Backport fix for CVE-2026-19487 - AHO-CORASICK regex engine bug

Includes 5 regression test cases in t/re/re_tests.

Tested by running re/pat.t on qemux86-64 target:
1267/1267 tests passed (only pre-existing TODOs as expected failures).

NVD: https://nvd.nist.gov/vuln/detail/CVE-2026-19487
Upstream-commit: https://github.com/Perl/perl5/commit/1a21abacaf6f684928bae8baaa153733c8c238eb

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-19487.patch           | 66 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-19487.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-19487.patch b/meta/recipes-devtools/perl/files/CVE-2026-19487.patch
new file mode 100644
index 00000000000..86feedcda46
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-19487.patch
@@ -0,0 +1,66 @@
+From 46014ec220989897d7ea53ccc780cea767cc0862 Mon Sep 17 00:00:00 2001
+From: Yves Orton <demerphq@gmail.com>
+Date: Fri, 7 Feb 2025 10:06:10 +0100
+Subject: [PATCH] regexec.c - Fix GH 22892 - AHO-CORASICK edge case issue
+
+In some circumstances the AHO-CORASICK logic wasn't matching properly
+when there were two possibilities whose proper prefix matches a proper
+suffix of a third possibilty, and one of those possibilities was shorter
+than the other.
+
+This was because we were NOT resetting the 'failed' flag properly.
+This bug must be rare because it took more than a decade for anyone
+to notice.
+
+This patch fixes the problem by resetting the failed flag after a
+successful transition.
+
+A good example of this problem is as follows:
+
+    "ABCDE" =~ m/ABCF|BCDE|C/
+
+This should match 'BCDE' and not 'C'. Because of the flag issue we were
+matching 'C' instead.
+
+This fixes https://github.com/Perl/perl5/issues/22892
+
+Note: t/re/re_tests hunk adjusted for 5.38.4 context (line numbers and
+surrounding test data differ from upstream which targets a newer perl).
+
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/1a21abacaf6f684928bae8baaa153733c8c238eb]
+CVE: CVE-2026-19487
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ regexec.c     | 1 +
+ t/re/re_tests | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/regexec.c b/regexec.c
+index e96b622..1eb59bb 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3406,6 +3406,7 @@ S_find_byclass(pTHX_ regexp * prog, const regnode *c, char *s,
+                             {
+                                 DEBUG_TRIE_EXECUTE_r(
+                                     Perl_re_printf( aTHX_ " - legal\n"));
++                                failed = 0;
+                                 state = tmp;
+                                 break;
+                             }
+diff --git a/t/re/re_tests b/t/re/re_tests
+index 10da625..eefa579 100644
+--- a/t/re/re_tests
++++ b/t/re/re_tests
+@@ -2157,6 +2157,12 @@ AB\s+\x{100}	AB \x{100}X	y	-	-
+ /^(xa|(?:[Z=])*\1a){2}$/	xa=xaaa	n	-	-	# GH 10073 - RT72020
+ /^(xa|(?:[Z=]|zzzz)*\1a){2}$/	xa=xaaa	n	-	-	# GH 10073 - RT72020
+ 
++ABCF|BCDE|C	ABCDEX	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCDE|C	ABCDX	y	$&	C	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCDE|C(G)	ABCDE	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCDE|C[Gg]	ABCDE	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++ABCF|BCD[Ee]|C[Gg]	ABCDE	y	$&	BCDE	-	# GH 22892 - AHO-CORASICK bug
++
+ # Keep these lines at the end of the file
+ # pat	string	y/n/etc	expr	expected-expr	skip-reason	comment
+ # vim: softtabstop=0 noexpandtab
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index b86c58f5402..8ce5d3f5d00 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://CVE-2026-57432-01.patch \
            file://CVE-2026-57432-02.patch \
            file://CVE-2025-40909.patch \
+           file://CVE-2026-19487.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

