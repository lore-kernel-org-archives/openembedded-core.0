Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2243CC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:35:47 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31232.1787816137004701396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HlSNt6F9;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caed617615so19972275ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787816136; x=1788420936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JRNkQ6OtAlms1an8mczNjXuO/+OdiK+Ro/kF/+MJ9bY=;
        b=HlSNt6F9PLhN6OB98EU7bZardJDGERpHOLdEAJnyc28kaDDZSbQRo4gScSSvv/V2+Q
         DGVnPLOiqIdEBTIE77AniKpbuEBj/bgy2J23XJLn3db87XlS147QiaetXVABi6J+f6KD
         AVZGAiBL+fqYbn3WALLILp1dN2YU4kTb6EhdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816136; x=1788420936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JRNkQ6OtAlms1an8mczNjXuO/+OdiK+Ro/kF/+MJ9bY=;
        b=daQpiiELJbVACsVYR5YI+DOd41wFEvgP0GjmOwroReqCGocfoMs4yL6AwZYETT4Wut
         blHlt1dGj30T9kR2HTA3NanhZ7WL1enKz9g3aR4bzaQqcDeH3Cw57ATpD4V6cRAhgkth
         CLDB0I0ayCcgXNaugTDGOZAnzdZV6yd/LgbTUVGNJwbMNi6xazk+dByWkshfe+zzv/wB
         R6hjEQ8oWUpNFlpmIoopYXTLrLjeQ93UEqj5la6SRAbhZVpE5ma3qSpW3ROtbhdsBa+u
         GK2hcZlfEvpY6EHpbqgx+42+6ZZ+/jPO5dIzqOLjOhq60EFSqNhtBI09uFCw/FsaVJr+
         ZdsA==
X-Gm-Message-State: AFuF++mlp6r3bxzEb3U4QPAh1daiNw8yOejrFo/FCgoJakGO8k0O9dgv
	lmUVVx465o1V84iTY1cxg7p7WdtG3HIT3gt2laT77NCrmANSYn84bVrTC1yRqIsQihycn17+Cin
	c4eNj
X-Gm-Gg: AR+sD11G04seCLekkT5qCTlkPLFdO7PiMDFSnV7QE0DrVtA8oV1zKx609I5IISMklnK
	d0AvCFGxc8b6rRclal37F1V1lKjIZ0CrNgtbqUeV4NrBIwIpYLQ8D2J4u84Oyx0xqUwe0/Wno95
	T9rHDpD1JbPEyu/tJztU5N/sarlPcvJhjbZRYVq2iV3CHcMEDF8B/fRbC+wC2tMX1LVCwb0H3sB
	XYm5Vpbx8QxJkzxEqFIGLP6bjSzXQBskXK4u/nlYp1SwmgyyXPz2XQgabg2E+n0W7ldEINiSUtq
	Hqm64BFFddfrChYpr1R5aZZ2zx5ICKLGeK3R4uE1N1+LVNOV0fRuyox2t/yVvkTMru18r5ejAAP
	3zVAiMecxMFJPYLY/LzZZ1E0d3j3EcM05cDev3E25QwyLrtEQWo20llSf0jmQc1qyHo81FaVbJl
	AcmhqtxguRNMkVweSNnZXW9uOMel+zc1pwz+jc9ljORQP6h8Rsf76PVDv623FLupWGxGq6WG0=
X-Received: by 2002:a17:903:8cc:b0:2d7:b5a:b1bb with SMTP id d9443c01a7336-2d70b5ab28dmr244386315ad.8.1787816136232;
        Thu, 27 Aug 2026 00:35:36 -0700 (PDT)
Received: from MVIN00352.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm23139110eec.8.2026.08.27.00.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:35:34 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 1/3] perl: Fix CVE-2026-13221
Date: Thu, 27 Aug 2026 13:05:23 +0530
Message-ID: <20260827073525.640848-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244465

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-13221
[2] https://security-tracker.debian.org/tracker/CVE-2026-13221

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../perl/files/CVE-2026-13221.patch           | 76 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
new file mode 100644
index 0000000000..211aabd7ef
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
@@ -0,0 +1,76 @@
+From 03f74bbbd3a68350d926ee93d56ee4808c28c4c7 Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Thu, 26 Mar 2026 10:13:49 -0600
+Subject: [PATCH] regcomp_study: Don't create a trie that would overflow
+
+This addresses GH #23388
+
+The design of the trie compiling code is to batch extra long tries into
+smaller chunks that fit into whatever limitations there are.  However,
+this ticket shows that that isn't always being done.
+
+In this case, a bunch of branches that have TAIL operands can be
+combined together, and the final TAIL is used.  And the code requires
+that the delta between the first branch and this final TAIL fit into a
+16-bit field.  That is the root cause of this bug.
+
+I'm not familiar enough with the trie construction code to easily
+understand why the final tail needs to be used here.  So this patch
+simply doesn't optimize a sequence of branches into a trie that would
+overflow.
+
+This could be revisited by someone who knows more about this than I, or
+earlier in the development cycle.
+
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c28c4c7]
+CVE: CVE-2026-13221
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ regcomp_study.c     | 10 ++++++++++
+ t/re/pat_advanced.t |  9 +++++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/regcomp_study.c b/regcomp_study.c
+index 05f1b01..644fbfe 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -1841,6 +1841,16 @@ Perl_study_chunk(pTHX_
+                             tail = regnext( tail );
+                         }
+ 
++			/* The code below currently saves the difference from
++			 * start to finish in a 16-bit field, causing
++			 * GH #23388.  This defeats the design of batching
++			 * tries into chunks that each fit.  khw thinks it is
++			 * too late in the 5.44 cycle to relook at the design,
++			 * so for now anyway, don't make a trie that would
++			 * overflow */
++			if (tail - startbranch >= U16_MAX) {
++			    continue;
++			}
+ 
+                         DEBUG_TRIE_COMPILE_r({
+                             regprop(RExC_rx, RExC_mysv, tail, NULL, pRExC_state);
+diff --git a/t/re/pat_advanced.t b/t/re/pat_advanced.t
+index 4d62f62..a3460fc 100644
+--- a/t/re/pat_advanced.t
++++ b/t/re/pat_advanced.t
+@@ -2713,6 +2713,15 @@ EOF_DEBUG_OUT
+         $x =~ s/^[\x{0301}\x{030C}]+//;
+     }
+ 
++    { # GH #23388
++	fresh_perl_is(<<~'PROG', , "", {}, "Avoid trie overflow");
++	    my $x = join "|", "aaa".."mzz";
++	    my $y = join "|", "naa".."zzz";
++	    use re 'Debug';
++	    "fnord" =~ m/(?:$x)|(?:$y)/;
++	    PROG
++    }
++
+ 
+     # !!! NOTE that tests that aren't at all likely to crash perl should go
+     # a ways above, above these last ones.  There's a comment there that, like
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 1833b7a352..1a3451b747 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
+           file://CVE-2026-13221.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


