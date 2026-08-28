Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB101C61DD6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3033.1787945887126664874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OyxUYOV+;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so10720835e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945885; x=1788550685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=46H8bE/VPQoxH3VwpWBUi423HWWbnuf90mUn1sK76Jw=;
        b=OyxUYOV+WRTOryu/rDmiM3MIwWNXuIf3g2GSZMOdGpj5ZHHBdRoa01VE+0QEM38ndf
         XMiqGP9+OZHgi0n0yJkRZmbJn+J7q3wsM233qAHFu8mkMxmYqC2BNueheua9kieMCIFf
         S8qiSgl4s1Evdy2liZ37B7SO9mSiabkXRDKYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945885; x=1788550685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=46H8bE/VPQoxH3VwpWBUi423HWWbnuf90mUn1sK76Jw=;
        b=sT4BFWfWqXOfXJeRCsCH+F8D3NymA8WejnMSjUtbeR+3bbt0Cosb8/DkHgDjRPuNSN
         y82Xe3uYUeKS2aC2ULJz4rPEoSdjROuQMetvcL1NoldGExIYHTKnGSoe279LyU1E5ooe
         UpUyCkIZKtbLwqYtfGZsJEkILqozA4QKrcgB9YHZwrK2Dnwl2ZpwIOZeNaHfF0/Zk0KO
         TLE+Wb/OH8hIELFAn7s/wxypR5Koe7N7gdCs6/8q3WUstMHKDo5k5JKaHvjCzcjQPUYr
         8IXHTLSyy5JzluomWyONe6uxCAo0RiLw/u5SbmHBLioLOxv7jsr6KS3AZDqYPQbcjVMR
         Ixfg==
X-Gm-Message-State: AFuF++n1oMDxeOKeUckCwtYBUnwgNDkXZIDNLpYT9JSLLlFO86Gveb5t
	hE45hWCYLCtij7N+YembE6x2hMwRTE19S+AzFWyXwKWvF1RiVqn4kyno5KJmu6KtXkLKwQNHe15
	cciPZBsg=
X-Gm-Gg: AR+sD1226GfEdCnPtMhEHV12TuStvtWyj2EcDn7nTZ2h/BR4kD1mqbBDF+V2aei6XNP
	JraFkIFDzX2Wor2Qc2IebhA9n6PRBeGTgGxRTJyC+XdDN1h0CDIoE/6tI5wVyknquKnds4atOnb
	Q3dKhdEqUQ1/JvxQIEXKuQDmlZmGZvnVw6LmXQxLSYAbYDAkz12pat8GoI8x4HgSkyVdStIi4xf
	8ZXpRfTm6hlT5HRUXCcunwbyYDe7iiBEL8cVSrauozYcw4ygSOwJ+gW/6xUeRySTV0K9Gjhb7Z7
	uhF508SlC+zhf8MOzT5KrufsjY7NW3yX1GZR6RxDG98FdICjWPYPj14CxfabD4IqUzGeMxOwUgt
	j9cvNSDXXKVqLVm+y+ua29TV+CQbEo/etUqNL48IuyD0bWlylwxd8ZJPEXgXtqIi2Xz3Fvkudkg
	2JtFAWSock6WYbXpYPoWJtPWfvmen7hcSJ9A7WN8MHvOWhR8eT4qDF9fmzelraE0gSBC3PRNNeV
	CrckVGnc8ig9iyrDRXH/RnkdMdKi/vxoBnRodbqNvpOSnI6c3Zjc/75OfUvGfE7gTjg24/N5xg=
X-Received: by 2002:a05:600c:4443:b0:499:d63b:a6da with SMTP id 5b1f17b1804b1-49b91c17149mr118966165e9.2.1787945885270;
        Fri, 28 Aug 2026 12:38:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/56] perl: fix CVE-2026-13221
Date: Fri, 28 Aug 2026 21:35:12 +0200
Message-ID: <2ec91404e838b6384dee41c3bd5c77b192eef837.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244563

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

This patch applies the upstream fix as referenced in [1], using the
commit shown in [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-13221
[2] https://github.com/Perl/perl5/commit/03f74bbbd3a68350d926ee93d56ee4808c28c4c7

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-13221.patch           | 75 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  1 +
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
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index 1833b7a352d..1a3451b747d 100644
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

