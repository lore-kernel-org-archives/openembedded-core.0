Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85C1C00144
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:56 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.14474.1658882511128432520
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qZDubBo7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id f11so14565891pgj.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NZkJb2lPSHnwRWykx+PuoaBjVQYHfFxdt6f9ouV/kIM=;
        b=qZDubBo74tf+40cC4O1rdF2MMGAEzMA1NAhO1/J8sGBETzjtip+oQdlu2Vm3zlyKhE
         JmgvRge0Q801fik1rp1IyOWg+trkHLxs3vzXkTaOiRn4VWUlXtTPWsJynic1PM320+FG
         6XBEUue/Mw0wH73Ks+22texXCD/rAoEsEV4VdteS6uBDS+OLja+8Vnzu72EgBJpxiHi3
         qMMAcwh2h6YApi8OMKCQIBY7xYo2H3GPEWHholz0oGvDcYr8gjcKnYrRmRV8PwOrmR5l
         u+PewLFc+8RW7Grmtzcg7hW91lrS24bcjA4h28i1DwhHzW5sbxHKaKeoD9t/7/lBptWg
         w/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NZkJb2lPSHnwRWykx+PuoaBjVQYHfFxdt6f9ouV/kIM=;
        b=XtaJhJG+rOeL+BYRVcXxUziF1Rc3fP2TRQ261XpWAXBYIta4RNMnXGktWyS9HvZD0F
         DQ90M90iBLN9Sxb5AnHV4Zu1hPbone0so7k9QohQn/pg6v2HnI/jkqL1Vp+yAty+Xslb
         SH94O1ZofjZqy26VQsepRdtxXbF3WSeTX3B611FkGFW1tjBd9F6u+t0I8V8+sLlKYhJ3
         XZZ4/OtHotxUU5B76QErxYYv7fVlpvDyfuljDwjKpTQnVZkrozRX/cC75TGyAKAclQmT
         1j4yFYaHPltjiCNxFJc1z5JGlUcyj4/uICoZdB+hswl5FoRWtT6d6vzv4uQ1vK8C6N9c
         P17A==
X-Gm-Message-State: AJIora+llcpt+aYEu9GLQv+HfhiNKPdgvmbyWCY7Byv1VRXGeWxog4cx
	h1LcOjj8lU1SqZ7LHSA7l2RK0qetOsbD7wdB
X-Google-Smtp-Source: 
 AGRyM1skK1mdFwk2fy+c16510hLohqECzaT+IRSx0unFUS8DiMPTcfElAnewZ5Ff7U2Lsri3io6j/A==
X-Received: by 2002:a05:6a00:244a:b0:52b:e9a8:cb14 with SMTP id
 d10-20020a056a00244a00b0052be9a8cb14mr16961614pfj.32.1658882510081;
        Tue, 26 Jul 2022 17:41:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] gcc: Backport a fix for gcc bug 105039
Date: Tue, 26 Jul 2022 14:40:45 -1000
Message-Id: 
 <943760dfb8036bd2f5e075bf0696f820fd6dc79d.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168537

From: Naveen <naveen.gowda@windriver.com>

Backport a fix from:
https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=9234cdca6ee88badfc00297e72f13dac4e540c79

which fixes rust recursion issues in the demangler.

Signed-off-by: Naveen <naveen.gowda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc        |  2 +-
 .../gcc/gcc/0030-rust-recursion-limit.patch   | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index acbb43a25f..2cebeb2bc8 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -59,7 +59,7 @@ SRC_URI = "\
            file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
            file://0029-Fix-install-path-of-linux64.h.patch \
-           \
+           file://0030-rust-recursion-limit.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch b/meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch
new file mode 100644
index 0000000000..bbe2f18f6f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch
@@ -0,0 +1,92 @@
+From 9234cdca6ee88badfc00297e72f13dac4e540c79 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 1 Jul 2022 15:58:52 +0100
+Subject: [PATCH] Add a recursion limit to the demangle_const function in the
+ Rust demangler.
+
+libiberty/
+	PR demangler/105039
+	* rust-demangle.c (demangle_const): Add recursion limit.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=9234cdca6ee88badfc00297e72f13dac4e540c79]
+---
+ libiberty/rust-demangle.c | 29 ++++++++++++++++++++---------
+ 1 file changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
+index bb58d900e27..36afcfae278 100644
+--- a/libiberty/rust-demangle.c
++++ b/libiberty/rust-demangle.c
+@@ -126,7 +126,7 @@ parse_integer_62 (struct rust_demangler *rdm)
+     return 0;
+ 
+   x = 0;
+-  while (!eat (rdm, '_'))
++  while (!eat (rdm, '_') && !rdm->errored)
+     {
+       c = next (rdm);
+       x *= 62;
+@@ -1148,6 +1148,15 @@ demangle_const (struct rust_demangler *rdm)
+   if (rdm->errored)
+     return;
+ 
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    {
++      ++ rdm->recursion;
++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
++	/* FIXME: There ought to be a way to report
++	   that the recursion limit has been reached.  */
++	goto fail_return;
++    }
++
+   if (eat (rdm, 'B'))
+     {
+       backref = parse_integer_62 (rdm);
+@@ -1158,7 +1167,7 @@ demangle_const (struct rust_demangler *rdm)
+           demangle_const (rdm);
+           rdm->next = old_next;
+         }
+-      return;
++      goto pass_return;
+     }
+ 
+   ty_tag = next (rdm);
+@@ -1167,7 +1176,7 @@ demangle_const (struct rust_demangler *rdm)
+     /* Placeholder. */
+     case 'p':
+       PRINT ("_");
+-      return;
++      goto pass_return;
+ 
+     /* Unsigned integer types. */
+     case 'h':
+@@ -1200,18 +1209,20 @@ demangle_const (struct rust_demangler *rdm)
+       break;
+ 
+     default:
+-      rdm->errored = 1;
+-      return;
++      goto fail_return;
+     }
+ 
+-  if (rdm->errored)
+-    return;
+-
+-  if (rdm->verbose)
++  if (!rdm->errored && rdm->verbose)
+     {
+       PRINT (": ");
+       PRINT (basic_type (ty_tag));
+     }
++
++ fail_return:
++  rdm->errored = 1;
++ pass_return:
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    -- rdm->recursion;
+ }
+ 
+ static void
+-- 
+2.31.1
+
-- 
2.25.1


