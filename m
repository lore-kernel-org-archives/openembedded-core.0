Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.6019.1609856802096291043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I/a/0GCd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id iq13so1776153pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CRmYGdjaCQKAf+S9xq8/v3SWOUrFbwC04PbeU9Z44VU=;
        b=I/a/0GCdoq+i6duZsLrzuVoMMHsszM4BldJHIwdoK95P90iQN8qG+PuxCGtyUrwjiL
         IBMYetvRZEsErTAaP+9pnQaTZ8DBX+q7iVvs5fzLsnqwQ1gddMza46Hzu/sAlmd9S6UG
         Xk+rEzT8Yddfe+wGzdtqdq+psOj1ut8U5Zxtv9g95hH3tFRLYtBnG8eJ1lvbs02cFJMd
         zz/9KPjMu+39mnnB3+tBSyAtc76wLceGJbFRRnWp7sDQ30sRT/LaNxw5jDCILSTt3xfI
         GomMxohWfAqrsN6YF3omVAx9cAmOzhF89ofYEAsqFYEGj3D4lGwNygwtHtWPRzwq+uhX
         h2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CRmYGdjaCQKAf+S9xq8/v3SWOUrFbwC04PbeU9Z44VU=;
        b=KErAysm4Rh66gJlDgC0jkuRhV1pnYjhHdnc80qSEdyidtwUjwMW18F9BKklHKRpddO
         gkLWxc1vtmc0XIreQlcx4zt1D8dLY0u5sTNYGEhpvZCy32gPb+g35DY7A+43Ki1pLZk7
         yRagTZqES2ZMmC43R4JCCykjSrWVRH7Ya6WeZ1NnvxD3F3rOjbfeGcwUaXr2RDC1xjNd
         4ZzLO5spkKcCEESlpSREIqV45l7y54DdpT2wD1pa2CsTVMeWpsLa0eeTw23B+p1n+s3C
         /09+BNhDolRNBn/wiOAQvItMFPcf9CXXBbeGA68+hL/78KTY5ro8qELIPI7Fv5tE++xU
         eLsQ==
X-Gm-Message-State: AOAM5324vgkwtFzgOB/XpGNGJ4HVY88NQmQLP6x62jyNRwn4xn0IG5Fj
	A6ZP0GfbdYkSQKZHFMCDsuBRMj/RudmBHl4wp+g=
X-Google-Smtp-Source: ABdhPJw9P5q5R3eEzZcDbtmkNT57B8Ze6Tw94PBUkSPVTGkTXxWusog+6NPYsSS6j3TSPFIC50sGDg==
X-Received: by 2002:a17:90a:fcc:: with SMTP id 70mr4217196pjz.168.1609856801332;
        Tue, 05 Jan 2021 06:26:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/30] patch: fix CVE-2019-20633
Date: Tue,  5 Jan 2021 04:23:55 -1000
Message-Id: <af4fbea9a1656bdf95d85831cae13cae3a60d5ee.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Scott Murray <scott.murray@konsulko.com>

* CVE detail: https://nvd.nist.gov/vuln/detail/CVE-2019-20633

* upstream tracking: https://savannah.gnu.org/bugs/index.php?56683

* Fixes potential for double free after incomplete fix for CVE-2018-6952
  - src/pch.c (another_hunk): Avoid invalid memory access in context format
    diffs.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be71dd2cc16a4c0d244a76a748f08ca0d9bfeba0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../patch/patch/CVE-2019-20633.patch          | 31 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch

diff --git a/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
new file mode 100644
index 0000000000..03988a179c
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
@@ -0,0 +1,31 @@
+From 15b158db3ae11cb835f2eb8d2eb48e09d1a4af48 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 15 Jul 2019 19:10:02 +0200
+Subject: Avoid invalid memory access in context format diffs
+
+* src/pch.c (another_hunk): Avoid invalid memory access in context format
+diffs.
+
+CVE: CVE-2019-20633
+Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=15b158db3ae11cb835f2eb8d2eb48e09d1a4af48]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+---
+ src/pch.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/pch.c b/src/pch.c
+index a500ad9..cb54e03 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -1328,6 +1328,7 @@ another_hunk (enum diff difftype, bool rev)
+ 		  ptrn_prefix_context = context;
+ 		ptrn_suffix_context = context;
+ 		if (repl_beginning
++		    || p_end <= 0
+ 		    || (p_end
+ 			!= p_ptrn_lines + 1 + (p_Char[p_end - 1] == '\n')))
+ 		  {
+-- 
+cgit v1.2.1
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index b5897b357a..1997af0c25 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
             file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
+            file://CVE-2019-20633.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.17.1

