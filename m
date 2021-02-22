Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.29970.1613962334012723019
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 18:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=c6yMqBZa;
 spf=pass (domain: konsulko.com, ip: 209.85.222.180, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f180.google.com with SMTP id x124so245979qkc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 18:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bOctp+gJLv2cooZnPReYPxQHT/NhW2++WLa36wkiMiw=;
        b=c6yMqBZa381M2KVx9ioC3PsU+q5g/Mvn6gnN9yxE4F+r7U2B2s7z35HvUbBuNvwLe8
         jVLjqvG7SObytpLd6XVbgmwQu3LBbab9fDfpsNlhGInFWfuCNDCCeenr4RmZqBBfaZhG
         j5RtWggJm27BIbuksFVZNv4Kbxgkq8bCXGkpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bOctp+gJLv2cooZnPReYPxQHT/NhW2++WLa36wkiMiw=;
        b=r7euzSzNp/sa6Mnz+xNCrhD1i6pDq/9OPTvyVbcXlvmegMObHCNZBDHF30wIUIsDXB
         3gLZLWuiuHaA5rroHmKjT8gH+Qp9JX/rj8XHS9LQucT/BptxKvfMmLAUKNlHdr1DvyZq
         GOsHx4ab6x2A4sQBb1jJRWFGadB9v2rwcCsR1pP/TPj5fBEkjK1iduB0hJhC3ImCAmBm
         v01nM3Lk3WpSPBKPXSCiqSMKHMd3/UajbMRhNawlyISnCTbOtOLzj+2eT76HmOr7G6Iu
         asZhAgwGXEbjc+gdIqyPrJp88PZYRXdgfo1/OyjGuXHds8YifrytHaeVQERfy7PwOCVi
         +hng==
X-Gm-Message-State: AOAM531QSi8uJ9hJLQlWEVcoIJ1+GuN9V57MfNFyefULQPbO525IQogY
	g3oKGaynYgOso7RtPXspuXLMop5llM5v0Q==
X-Google-Smtp-Source: ABdhPJx7kb99j486PXNuyPLOZAXJR8BjiJxRuqLIcgKYEm5GEDGYAbGGheJAGlKgaii4RockZ0MG5g==
X-Received: by 2002:a37:6744:: with SMTP id b65mr19292362qkc.148.1613962332795;
        Sun, 21 Feb 2021 18:52:12 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from ghidorah.spiteful.org (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id 184sm7526338qkd.119.2021.02.21.18.52.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 18:52:12 -0800 (PST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [master][gatesgarth][dunfell][PATCH] screen: fix CVE-2021-26937
Date: Sun, 21 Feb 2021 21:52:06 -0500
Message-Id: <20210222025206.1239939-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Apply patch from Debian to fix CVE-2021-26937.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../screen/screen/CVE-2021-26937.patch        | 68 +++++++++++++++++++
 meta/recipes-extended/screen/screen_4.8.0.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2021-26937.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2021-26937.patch b/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
new file mode 100644
index 0000000000..983b35c1b0
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2021-26937.patch
@@ -0,0 +1,68 @@
+Description: [CVE-2021-26937] Fix out of bounds array access
+Author: Michael Schröder <mls@suse.de>
+Bug-Debian: https://bugs.debian.org/982435
+Bug: https://savannah.gnu.org/bugs/?60030
+Bug: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00000.html
+Bug-OSS-Security: https://www.openwall.com/lists/oss-security/2021/02/09/3
+Origin: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00010.html
+
+CVE: CVE-2021-26937
+Upstream-Status: Pending
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+
+--- a/encoding.c
++++ b/encoding.c
+@@ -43,7 +43,7 @@
+ # ifdef UTF8
+ static int   recode_char __P((int, int, int));
+ static int   recode_char_to_encoding __P((int, int));
+-static void  comb_tofront __P((int, int));
++static void  comb_tofront __P((int));
+ #  ifdef DW_CHARS
+ static int   recode_char_dw __P((int, int *, int, int));
+ static int   recode_char_dw_to_encoding __P((int, int *, int));
+@@ -1263,6 +1263,8 @@
+     {0x30000, 0x3FFFD},
+   };
+ 
++  if (c >= 0xdf00 && c <= 0xdfff)
++    return 1;          /* dw combining sequence */
+   return ((bisearch(c, wide, sizeof(wide) / sizeof(struct interval) - 1)) ||
+           (cjkwidth &&
+            bisearch(c, ambiguous,
+@@ -1330,11 +1332,12 @@
+ }
+ 
+ static void
+-comb_tofront(root, i)
+-int root, i;
++comb_tofront(i)
++int i;
+ {
+   for (;;)
+     {
++      int root = i >= 0x700 ? 0x801 : 0x800;
+       debug1("bring to front: %x\n", i);
+       combchars[combchars[i]->prev]->next = combchars[i]->next;
+       combchars[combchars[i]->next]->prev = combchars[i]->prev;
+@@ -1396,9 +1399,9 @@
+     {
+       /* full, recycle old entry */
+       if (c1 >= 0xd800 && c1 < 0xe000)
+-        comb_tofront(root, c1 - 0xd800);
++        comb_tofront(c1 - 0xd800);
+       i = combchars[root]->prev;
+-      if (c1 == i + 0xd800)
++      if (i == 0x800 || i == 0x801 || c1 == i + 0xd800)
+ 	{
+ 	  /* completely full, can't recycle */
+ 	  debug("utf8_handle_comp: completely full!\n");
+@@ -1422,7 +1425,7 @@
+   mc->font  = (i >> 8) + 0xd8;
+   mc->fontx = 0;
+   debug3("combinig char %x %x -> %x\n", c1, c, i + 0xd800);
+-  comb_tofront(root, i);
++  comb_tofront(i);
+ }
+ 
+ #else /* !UTF8 */
diff --git a/meta/recipes-extended/screen/screen_4.8.0.bb b/meta/recipes-extended/screen/screen_4.8.0.bb
index 4772eb6c7a..fe640c262b 100644
--- a/meta/recipes-extended/screen/screen_4.8.0.bb
+++ b/meta/recipes-extended/screen/screen_4.8.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
+           file://CVE-2021-26937.patch \
           "
 
 SRC_URI[md5sum] = "d276213d3acd10339cd37848b8c4ab1e"
-- 
2.26.2

