Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE77C54741
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.71661.1724736240868782501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lN9GSee2;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37198a6da58so3523878f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736239; x=1725341039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0liCIMxk5Fa2FkO00fjs0aJXLxIblaJtSm8L4FbBJlo=;
        b=lN9GSee21hgrlPgfWJcrIVetT54hi392+DbEVkCBdt6fsAlBrMKqWsiTJ60AeI0wKa
         XLqF+wMZNx8TpvOUhlM9beKV84GGbwzSsLuzjz3HH+n6eIYFltDKgpVnsha44Gpc064P
         WYi6PXoGVt/LC1x7/qwP4JMAl0u1dDv6kFxihDgDLnnj57USxsk9It4XALgv1QadrHXh
         nYz3dxcma9e62YWMwNKn//C+W7F+asNAFSj1ouJyX8POQbiFtqrcOjN2w/HTzd4iv/dG
         M5Bc8LtRNtjq+ao6BZQrct2SQ3Hc4fPr3yGHiFAFclVycDmVvTN7uPCFLKcMIzqyjin6
         7kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736239; x=1725341039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0liCIMxk5Fa2FkO00fjs0aJXLxIblaJtSm8L4FbBJlo=;
        b=PV4j9iMrqMzkWpsJP5DSg7SNrg86TNGnlhHPBEUWh4ufM0cISv/tDNg/ix2oONTz8Z
         EZL6hNtshlaCvw6uu0kbj3nc6tMntgTGSuG1HLmYS8dqK/ugbeNMchqKZgtLiCPgeLZJ
         2GJ9uMGun5tl7yYYyD9boEqAwkGDh2f35BYxe8+cYLtlEnamkIdl4aRDKbOFlp3r2sRn
         ld3u93B8hpS/+Js7HFBn+0MAAyftXcZqTBeLI7GMBQtq8s7SaHRdcqGlA+jQtRw+U67H
         RnEWGrmPFuGkUgO5ZItljHiHY9nhgZIQJy2sgzGD8v9mSUvlqYAfHWiuAZwYpcO6aukJ
         JuhQ==
X-Gm-Message-State: AOJu0YxF7iXDr6O3zMlXDM6x5WkdRjuBj7J/0SzJQJcihVCzXkMLQv74
	OWeG9kG5RDwjAHxgOjoVsMc3iNwgVIEfJKA0P9WiI4D+6hoRQIiT7ht/Ig==
X-Google-Smtp-Source: AGHT+IFS1EWI9MEJtGgkVTeZu1/NTtEd1nljnEM8dAW9i9FSHA5Z+cg/L+e423H9Q3EiTc6CysrX2Q==
X-Received: by 2002:adf:f001:0:b0:371:7c68:7cd7 with SMTP id ffacd0b85a97d-373118e33d2mr9270472f8f.56.1724736239082;
        Mon, 26 Aug 2024 22:23:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:23:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/34] xmlto: check upstream version tags, not new commits
Date: Tue, 27 Aug 2024 07:23:23 +0200
Message-Id: <20240827052354.1319810-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203779

From: Alexander Kanavin <alex@linutronix.de>

With 0.0.29 upstream is tagging versions again.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
index 4e969fc12f4..1415e5d781c 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -7,7 +7,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRCREV = "74862a684907ada3d4ed2ce0f8111adf626e1456"
-UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.39.2


