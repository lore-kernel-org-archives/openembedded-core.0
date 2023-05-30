Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BADCC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 10:33:11 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.6565.1685442787130079329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 03:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=eW9O1nbF;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d2f99c8c3so3088609b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685442786; x=1688034786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9a/XFyZYsftLYQGrUXgyVVbRvQ6+i19pp9jb1DX4P0=;
        b=eW9O1nbFkEsP1nCr0cGl8V0/7wXvu1xuteh70GeHOlT/E5kBMRjcUmPBqUmCAHsLgX
         I4/Od/fxrmoqm+lj1O6TNrmLE+qyL6LqBAhzJSYYN9XZVi6SCImvGgzmfOL9FBu6PZHK
         7+kJcvFKKqgp7CpRgW4vbyY/vci9OkgxGKsIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685442786; x=1688034786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9a/XFyZYsftLYQGrUXgyVVbRvQ6+i19pp9jb1DX4P0=;
        b=I9HzmyoN+mTYT/gABPFm6+vgc3CA8t46oJWIalk0Is1vyfMeALXV/pb0TnVrIN9SPm
         5ZznmpHgUw6pn+IcihOBcAGHPekTFu4VC+eZCCu/Yc2iyGT6QiuTAjHGNjzhSe2svXA2
         TA4HtE+NV8G6tn+VIDX6o8ctdEHc8ECiBC093eBEK6JQlvn7/YeSXSooZmXWV3tiYC2j
         SWUJ1ija0J6Ll1aTI0bsrW2eq3+a4k1ELLYWcWn8hHnPbFc0qXMougsK4eSxN5krZZZl
         EpPFGdmIWOx5stEVGPueGAltoiLIkhLa+aKYB9w97RAtXWzXa4TQtV8LwNL5fgwvY3/t
         QsMQ==
X-Gm-Message-State: AC+VfDzSnoCxJeReSYzmfa3DCqgJtamcQc6LAFIj8rhOdZdqFIprJBTH
	/HDEY81PzBYKsrZYEShgvKvKzzYxSsF9JhDFGtg=
X-Google-Smtp-Source: ACHHUZ7XY9otGqoog8dxavCzAtGuPjL23x7vE7aQRxZXqKwgaAopIYN8OwnNGQwAAxZrH6ZHDAC+lw==
X-Received: by 2002:aa7:88cf:0:b0:64a:f730:1552 with SMTP id k15-20020aa788cf000000b0064af7301552mr2167109pff.19.1685442786053;
        Tue, 30 May 2023 03:33:06 -0700 (PDT)
Received: from MVIN00020.mvista.com ([122.173.162.191])
        by smtp.gmail.com with ESMTPSA id n14-20020aa7904e000000b00640dbf177b8sm1372531pfo.37.2023.05.30.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:33:05 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] ghostscript: Fix CVE-2023-28879
Date: Tue, 30 May 2023 16:00:47 +0530
Message-Id: <20230530103047.13088-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 10:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181912

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;h=37ed5022cecd584de868933b5b60da2e995b3179]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../ghostscript/CVE-2023-28879.patch          | 54 +++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch
new file mode 100644
index 0000000000..852f2459f7
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch
@@ -0,0 +1,54 @@
+From 37ed5022cecd584de868933b5b60da2e995b3179 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Fri, 24 Mar 2023 13:19:57 +0000
+Subject: [PATCH] Graphics library - prevent buffer overrun in (T)BCP encoding
+
+Bug #706494 "Buffer Overflow in s_xBCPE_process"
+
+As described in detail in the bug report, if the write buffer is filled
+to one byte less than full, and we then try to write an escaped
+character, we overrun the buffer because we don't check before
+writing two bytes to it.
+
+This just checks if we have two bytes before starting to write an
+escaped character and exits if we don't (replacing the consumed byte
+of the input).
+
+Up for further discussion; why do we even permit a BCP encoding filter
+anyway ? I think we should remove this, at least when SAFER is true.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;h=37ed5022cecd584de868933b5b60da2e995b3179]
+CVE: CVE-2023-28879
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/sbcp.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/base/sbcp.c b/base/sbcp.c
+index 6b0383c..90784b5 100644
+--- a/base/sbcp.c
++++ b/base/sbcp.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2019 Artifex Software, Inc.
++/* Copyright (C) 2001-2023 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -50,6 +50,14 @@ s_xBCPE_process(stream_state * st, stream_cursor_read * pr,
+         byte ch = *++p;
+ 
+         if (ch <= 31 && escaped[ch]) {
++            /* Make sure we have space to store two characters in the write buffer,
++	     * if we don't then exit without consuming the input character, we'll process
++	     * that on the next time round.
++	     */
++            if (pw->limit - q < 2) {
++                p--;
++                break;
++            }
+             if (p == rlimit) {
+                 p--;
+                 break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index a829d4b4ae..57f0b51ad3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -39,6 +39,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2021-3781_1.patch \
                 file://CVE-2021-3781_2.patch \
                 file://CVE-2021-3781_3.patch \
+                file://CVE-2023-28879.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


