Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C43C55173
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:29 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11.1785511699264626403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 08:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YYHdn51t;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: twoerner@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-738cdd667ceso272605137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511698; x=1786116498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aLaYOjkIf8RKBEr2gJQPI9Auqv7PWbYfgX1g0HCOi6A=;
        b=YYHdn51tM81ahqMw1bVZfVv/Z0NRaBCsbTjbtznWWbd4nbhOcEXLlDAmaiJ4+k25DR
         9PxV9+4SoAMIW96x1w5ir2/8O7ZuLfPZsDnMgc3vS4pKbPqynxertM1dR9jrdkIOoCo8
         VKzxdSJHWyRKM6lqWsp57sc0AXYQ3gcWZfyAMt7+tA4Z37hQ/WXSz0j54878IhbLWKhk
         gaQJ/2PlP/KMeWiP7NM+VwBVwyja4n/+x0gu2vkN01320pWHZmhQGaa+glqjxD/c7Lxi
         LJ4VKptZem5goZwYjlpxmTYCTx3IU9MhxYgrXCjpE0cTPnP6H0xARG+vpJzQNJK4Pogd
         sRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511698; x=1786116498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aLaYOjkIf8RKBEr2gJQPI9Auqv7PWbYfgX1g0HCOi6A=;
        b=dNm3KJOPnoP9xrg6kP1MajgrH2GnSt9hHcgQTBDXYAYdN8wtikDY7a5w3MiblBEkYp
         3RXjzA1glYTUWkt0ltGiNGEwpbLhpfOsF/phYibKtnZ0jGof5KG+QeBPjTt7VhqTqIE0
         2Os4hnnzbbTxNKYaf8bjbtG5wp0TI1hb3HvAJB2V9PFrptOVFN28qD8zCGHc4TGIYg+A
         7ifyUl6ingBTpJNuJqoxvCEenPbIkV5uNED+SP6W8ybSDClH/pd8D0F9vLk0tsbtahxv
         YPI0EabSGT1DH7PQiIjkSddwemOhHFw36HfmOFHSz+B5+ye2rLiQuMr/ISmCdao0dUQm
         rL4A==
X-Gm-Message-State: AOJu0Yxw6VOYxyJxi848c59U5/dsMfzxuWG6a+17pRRnD0sMLNu5H+LS
	cWNevdmXQK4KfuQxcCHSalj3bOl2Xnsl1LKuOYemXX606zQtCGkJu1hPOn2QMw==
X-Gm-Gg: AR+sD12vB8oZ5rxnvVAJYuoshM7N33UpJazYFyJN5PQ6dKU+L+3IsR+Os+gXjTwXMDa
	D0zC1vgzmHyU0OfUhFD1Ia9TS7DpxeMlG2/WkMbOCwvhDZE7orIh81d/p1Mjzk+K8n+CPzBbEyL
	gpSfF97ATeCcTsAgXb1aJKrTWzQvHtaJXYJCVn7uwdA0IcGUbFw8ddx2lTqJHw/gkYnVzWLCHs9
	B/REOogcAauxBtc853JDaY8wBTbalePYJka6TTiIAEZSsR8Q+o2fdmuNo0etsqcBf3qOTkkrTrK
	g82k+V+WXRImolcWPUy2FtWzucA4e9O3DhenUgUMsBLqH+W4SpGzKSobjQBhgqBCDR87QMTWp84
	7R35X/jxQHaQV/HU0/XyPFOr7q9h1K+bLCt4JBSTEL7EfV4h3A56/dK2lPTqKN9NUKkXOjj0Ipe
	cU2utNOcljeNXp1XuYJBf55sPBiCB+IQijtHEoWCqycG8xCS5hTx8s+wH0xkeGuQF8AtMf/YcTP
	BLu1ZMHouvARpTkNCmTHcK4/ETwmc8EVjlphyrRcg==
X-Received: by 2002:a05:6102:2d09:b0:737:783d:1900 with SMTP id ada2fe7eead31-75b23356ce8mr470591137.9.1785511698064;
        Fri, 31 Jul 2026 08:28:18 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759c9559116sm837007137.11.2026.07.31.08.28.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:28:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 3/6] wic: add runtime dependencies on the tools it invokes
Date: Fri, 31 Jul 2026 11:28:07 -0400
Message-ID: <20260731152810.2641327-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260731152810.2641327-1-twoerner@gmail.com>
References: <20260731152810.2641327-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 15:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242449

wic shells out to a range of host tools (parted, mkfs.*, mcopy, sfdisk,
and more) but, since the recipe was created, has declared none of them,
so an installed wic works only by chance depending on what the host
provides. Declare them as RDEPENDS so they are installed with wic.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v5:
- take the tool list from the shared conf/wic-helper-tools.inc
- drop the bootloader (grub, syslinux) RDEPENDS entirely; declare only
  the host tools wic runs
- trimmed the commit message; dropped the in-recipe comments

changes in v4:
- gate grub to x86 and aarch64; move syslinux into the same arch-gated
  appends
- also depend on syslinux-isolinux for isolinux.bin

changes in v3:
- list the tools on all variants rather than only the nativesdk variant

changes in v2:
- merge the tool list into the wic recipe as RDEPENDS; drop the separate
  .inc
---
 meta/conf/wic-helper-tools.inc        | 3 +++
 meta/recipes-support/wic/wic_0.3.1.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/conf/wic-helper-tools.inc b/meta/conf/wic-helper-tools.inc
index f3b2b698e2df..66f2f1b2bddc 100644
--- a/meta/conf/wic-helper-tools.inc
+++ b/meta/conf/wic-helper-tools.inc
@@ -14,3 +14,6 @@ WIC_HELPER_TOOLS ?= "\
 
 WIC_HELPER_TOOLS_NATIVE_ONLY ?= "cdrtools"
 WIC_HELPER_TOOLS_DEPENDS = "${@' '.join('%s-native' % t for t in (d.getVar('WIC_HELPER_TOOLS') + ' ' + d.getVar('WIC_HELPER_TOOLS_NATIVE_ONLY')).split())}"
+
+WIC_HELPER_TOOLS_PACKAGE_ONLY ?= "e2fsprogs-resize2fs"
+WIC_HELPER_TOOLS_RDEPENDS = "${WIC_HELPER_TOOLS} ${WIC_HELPER_TOOLS_PACKAGE_ONLY}"
diff --git a/meta/recipes-support/wic/wic_0.3.1.bb b/meta/recipes-support/wic/wic_0.3.1.bb
index d9b4cc05c4bd..d8b8c6905d87 100644
--- a/meta/recipes-support/wic/wic_0.3.1.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -10,11 +10,14 @@ CVE_PRODUCT = "yoctoproject:wic"
 
 inherit python_hatchling
 
+require conf/wic-helper-tools.inc
+
 RDEPENDS:${PN} += " \
     python3-core \
     python3-json \
     python3-logging \
     python3-misc \
+    ${WIC_HELPER_TOOLS_RDEPENDS} \
     "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.50.0.173.g8b6f19ccfc3a


