Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9539C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:26:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5538.1788326813857541590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=brTQZjKX;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso5794805e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326812; x=1788931612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TAUiBCEx2A8dHZUFbjnRFSc9fQ154dlp3li6sDcWtE8=;
        b=brTQZjKXPs0d/CIwVoN+W0GWcvMJQlZGqt8wJhK51+V6hs+aWLT/4VVlKlBQ/zfrIX
         0giBqxPcJ0dzqebCYWBS9z2J4uKBG4X+FPLU6T3NMyNB8CrMoZxPFyxxmDW1fpvgcV4X
         KubKfytcvv9KN2L7UYTxLuOHTKqHp0kJTE3yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326812; x=1788931612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TAUiBCEx2A8dHZUFbjnRFSc9fQ154dlp3li6sDcWtE8=;
        b=lIu1T2RzrYUSfcNt+J4On+F6ASQB1KC1URnQJSopsTDi99EBeTr83XvpSznnic8x0N
         qYibgiHT0dFVVSSP24qFwzqOoj3l5/M9uQjRqoDmrzUVxfgC0GmVBY7B60S5kd8TVrLo
         vxqApDJXrKTSyQMSUEbWHhDVPZ4aB/m9LCkWegPSw3WM2pWwaysuuK5CaSGlVGidV9+P
         aiI5Ap9Bd595I257R+M6FXxiTNrbaYWc8Yz8oaVbI+VJ+wXVFZk9J0Bik57d/WEG20GW
         v0XnmyRnmnqNJPRjWbydBLCVky3+K/DDNVwAMRPTNpl0F7Qh33rPiAfouv73XQfPUdEi
         FgoA==
X-Gm-Message-State: AFuF++lvdjwdjFd0b9GmJ7dOJpIAyI5QfVNARHxt1knu3WM+Ct9XJUpY
	7Q67QkL/9D5tzsxrv6pjRSWH5cBfK8/Cfz9sZpOeeTnt6Q47WjXmf7RYuUvYGNHb1ziQOwvATJM
	3YJ3f2VM=
X-Gm-Gg: AR+sD12sdqsroYyoHFy/nbJmjK5yB+N9SpB2K4GVb5YnL1oD/ObJHAILbsBf7oZluFO
	oTJ/pXG27qBqnu9onhUy5NHTN2mcjfad9YZhCGIb7cXPeJw7JCtEad8eCO6HKA/fjNTWcXIUXMV
	P6x6gSSVu8GmGcGd0sJlt3kUcu1pNQOX+LacLk0Jul+jlnglxaC3Yuofy2oL4Uz6Q3PE7BWKd4i
	kGR1sLL/c7m8oPLUepW/FyxYAQwSyXbZJjo+zcW5/E7i8IIv38H19HQAsLmu5igurqYaF/dq++T
	vunMfz6gqkmsYAK+o6oZaoCEWNajaq7NlpQvTrC8BIEaExyObPnirRix2jrFkKX/8iNzH83L84S
	B+n/Rf7xgLCF9tMl+xLPjGzTg9dVDZhY36y/JkM0CJGWmpRjJTg9wu+7o2eCcTjO8h9l+3MpK8X
	1RNrr9TVnuBccJjZCPJR4YnUwQHQ/qMoMV0Qi39iW+pZu0+c4xhH1uxOUnGbRlm66Cglb0JnZZN
	k7adOhIqob6pneGpg==
X-Received: by 2002:a05:600c:3f0b:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49ce7c316aemr7309535e9.8.1788326812059;
        Tue, 01 Sep 2026 22:26:52 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/27] perl: fix CVE-2026-13221
Date: Wed,  2 Sep 2026 07:25:28 +0200
Message-ID: <dd5aee19c57a18b1c403496190e832234afc3b4b.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244862

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

This patch applies the upstream fix as referenced in [1], using the
commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-13221
[2] https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c28c4c7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-13221.patch           | 75 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
new file mode 100644
index 00000000000..03396f3e434
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
@@ -0,0 +1,75 @@
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
+CVE: CVE-2026-13221
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c28c4c7]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ regcomp_study.c     | 10 ++++++++++
+ t/re/pat_advanced.t |  9 +++++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/regcomp_study.c b/regcomp_study.c
+index db7ab3a409..a1b2c3d4e5 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -1933,6 +1933,16 @@ Perl_study_chunk(pTHX_
+                             tail = regnext( tail );
+                         }
+ 
++                        /* The code below currently saves the difference from
++                         * start to finish in a 16-bit field, causing
++                         * GH #23388.  This defeats the design of batching
++                         * tries into chunks that each fit.  khw thinks it is
++                         * too late in the 5.44 cycle to relook at the design,
++                         * so for now anyway, don't make a trie that would
++                         * overflow */
++                        if (tail - startbranch >= U16_MAX) {
++                            continue;
++                        }
+ 
+                         DEBUG_TRIE_COMPILE_r({
+                             regprop(RExC_rx, RExC_mysv, tail, NULL, pRExC_state);
+diff --git a/t/re/pat_advanced.t b/t/re/pat_advanced.t
+index 398680838d..c9e389ecb3 100644
+--- a/t/re/pat_advanced.t
++++ b/t/re/pat_advanced.t
+@@ -4898,6 +4898,15 @@ EOF_DEBUG_OUT
+         $x =~ s/^[\x{0301}\x{030C}]+//;
+     }
+ 
++    { # GH #23388
++        fresh_perl_is(<<~'PROG', , "", {}, "Avoid trie overflow");
++            my $x = join "|", "aaa".."mzz";
++            my $y = join "|", "naa".."zzz";
++            use re 'Debug';
++            "fnord" =~ m/(?:$x)|(?:$y)/;
++            PROG
++    }
++
+ 
+     # !!! NOTE that tests that aren't at all likely to crash perl should go
+     # a ways above, above these last ones.  There's a comment there that, like
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index 9f4cc1c4044..8dccd34499b 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
+           file://CVE-2026-13221.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

