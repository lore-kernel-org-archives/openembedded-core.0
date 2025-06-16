Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1942CC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 11:56:25 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.23905.1750052845337057783
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 22:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mx5KbgJ5;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2fc93728b2so3214953a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750052844; x=1750657644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HMDvsj6uLAVhVYuajS2Nv1tQAxbk8ZJT5mY+ixK/+m4=;
        b=Mx5KbgJ5LusfJwoar8HcgAOhoCIAhpg4WqYyFZ94oqV+cOwKKeKRPUyL8+mWv5habT
         qTMvJEMNBikIliIrd/Le3WZl4s6BauC1NnsEAbFFgOzzEWZ0IZDu2ej6yq/oroUQiWVg
         LBSbRJ9iSvwD91Adz50cEm4C3CHYSFqPEF+0xNITqm5ZqKDjx0GA2oHsXy9PBeq7MrRo
         jea9IdK92ztXuaoenn/+u3tjFydOJ73xAa3g5U6YZ2IZBDPxw4LdkfNxp7mFG73kMpbo
         YnGL+DiLy7mRn9v85MphYVz+T/aBHdCDireppD6KZyWSDmr6dNqYz6nUk8aPx5+hXRlh
         hkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750052844; x=1750657644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMDvsj6uLAVhVYuajS2Nv1tQAxbk8ZJT5mY+ixK/+m4=;
        b=atgWkMc3epvuf1KmZn/5gY0IUtEHTSBefE//MU0yy/p4jwUuNxH0oORf+DkKucWuA5
         RzJQ8BUmrg1dQtKL/iniHTm9sM7cL78AyjhbydgLydWLF/kel8lRu1uABQ28Ur8ZZwg/
         rK5yllABQ91UZvhtDxnyuOLSJ01Hnqq4kouHMekq2dKzjYf1nNznzjNTezNgxppnrSgN
         Z76Vq6rz+Dc1JGsW67N1j1QXUE5C/2rlfFgtH4OAbolg5YuUNdJtOn6T77XLqinZZbZy
         bmkjh3GZUVPqR4S0VP1H7PtexyLsC09Cy727lspQLDs5mkuzeMIHPvDnluH85GdduHr+
         cxxw==
X-Gm-Message-State: AOJu0Yw0oxyoYAFPP0OJCJ4eair9tmh2ddjdetbEZb6/b1PAm1abX7Qd
	+YJ1fWwDBHpcGOrm1DU7aEDA1MUjuvNZBnoM/fx8TcMcxSmAvj99oycrq7YgRM7Z
X-Gm-Gg: ASbGncvUCMMhRqKnkdwgH1BdueE28jUxLrG/pnmDgHY7ILPtjjPSq3OMEYFocgf5UhO
	wqEjpOQeTfwtRlkCYVnNdbKA/bYKcH9ZiFiDv5pS88Bq6yqVr7QzmtUuprcDgn/KJUVLXKnLxIJ
	jwXDIfwaSXIERqGB/1T/Seev8Jxg7kw8DUK7PthAcIQB0bFQ6/VYFNFDXi6ss2hwpojKW8ZVhjs
	k2kq7RUpJi7e2t1HCNfHnZTYn3KXrBZFFC6h1n+4tEpz5TVZ7up0lqppaMk7OI3dgggrwg0Ugsb
	S6DOvdf3wOjIIlgf32XDeRQWmKbUuKSPd7czyTWs8a2AJGFSWqenodyRqKYpMpeKcsM=
X-Google-Smtp-Source: AGHT+IFmD/pMpaacrFxxgY/SAPRjnVK89Rcc3CFdejdFlLz6InK6QL4LdBVR/TJ2sT1PWFDiqcJoBw==
X-Received: by 2002:a05:6a21:6481:b0:21c:faa4:9ab9 with SMTP id adf61e73a8af0-21fbd631592mr12170352637.22.1750052844423;
        Sun, 15 Jun 2025 22:47:24 -0700 (PDT)
Received: from LL-3450L.kpit.com ([2405:201:6807:8e5:486a:d246:6c6e:6f5e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000604dsm5836981b3a.46.2025.06.15.22.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 22:47:24 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: denis@denix.org
Subject: [[kirkstone][PATCH]] xz: Update LICENSE variable for xz packages
Date: Mon, 16 Jun 2025 11:16:59 +0530
Message-Id: <20250616054659.3501263-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218817

From: aszh07 <mail2szahir@gmail.com>

Update LICENSE defined for xz packages to match the license
information provided in the xz COPYING file.

The License information from PACKAGERS file of xz mentions
packages with lzma files are in public domain.They ask to
use GPLv2+, if only it's not possible to mention "PD and GPLv2+".

Include PD license with GPLv2 to packages with lzma content:
xz-dev package contains lzma header
xz-doc package contains lzma man pages
xz packages contains lzma binaries

Links: https://github.com/tukaani-project/xz/blob/v5.4.6/COPYING
       https://github.com/tukaani-project/xz/blob/v5.4.6/PACKAGERS

(From OE-Core rev: d511c41dac048fbdd93a54136e93b0623a18a83d)

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e5b955def5d9f305f5aba2c68b73287c03fd163)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xz/xz_5.2.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
index 7f889e4367..938c659008 100644
--- a/meta/recipes-extended/xz/xz_5.2.6.bb
+++ b/meta/recipes-extended/xz/xz_5.2.6.bb
@@ -9,10 +9,10 @@ SECTION = "base"
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and PD.
 LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
-LICENSE:${PN} = "GPL-2.0-or-later"
-LICENSE:${PN}-dev = "GPL-2.0-or-later"
+LICENSE:${PN} = "PD & GPL-2.0-or-later"
+LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "GPL-2.0-or-later"
+LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
-- 
2.34.1


