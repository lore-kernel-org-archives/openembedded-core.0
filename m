Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804C1C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 14:59:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.19164.1704293945920821953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 06:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KM+GQpTe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336788cb261so9457316f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 06:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704293944; x=1704898744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yd0Oeh0nkWB1h/mQPj7x/olfTgzYLiXlJIPPg3RgkeQ=;
        b=KM+GQpTeYe7tLRgz71S1lwGE6iiTon1LH30inBx6KhtnVWpW4fHPnnSY3dk5Zt+Qrh
         e6qRqRBphrvMu8AkT1d7J67tmAZPLqaKrEKH7WBweB0z7aG4MjDW+GN80l5jM4uo2y5A
         /xZTRA9j0B5qvFaiqNFYpQSJYka0ypvEPQ3JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293944; x=1704898744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yd0Oeh0nkWB1h/mQPj7x/olfTgzYLiXlJIPPg3RgkeQ=;
        b=ixT2Nu3o7JV6vEwf8PJ7BVrFJkNJWCxGsssoT1fZDL2B2prcUYcNgBticMGKSZx3Bc
         Yp5YQLTPaa1hJklw4QiKpoYM64/s6517Tv9rUWnLzY9ZqEjw6c1ZQlCkLKHkGd+ZugGn
         mub0C2IMkE0zGL4u8tdCOe0cJigcUGV+e+v72BCkQjdL08XwGntDv5Muu/jq6bBFiWP/
         LbXmmg2CGc0vFKZRyMQu4PW+ogz63XHx8nRXkB7ZGFpBO90y1xuUDe4ddjs9QiPseuxg
         HYpdiC0EbJQ9Bjm90jafda6YrQC+jYggcLJj8LRH1siCc+cLyOW68blJx1gIJ0DWkgP9
         nDlw==
X-Gm-Message-State: AOJu0Yw2VsQBAZJ9hCK2MouTFG9AMd881qkbMJ3e+WzLh/dzGyAI2Vqf
	44W7SjsdOjY1EKqxzfxIPUPmehWFnDsFFeEKL0na7MNRBSo=
X-Google-Smtp-Source: AGHT+IHZoScxm0MAAB1Y1+uCgC329rJ5ri5TBsETn8DVBozcU08At8JET2Wu6RHyt5Htg08Q8TysYg==
X-Received: by 2002:a5d:5988:0:b0:337:1d49:c03 with SMTP id n8-20020a5d5988000000b003371d490c03mr4958667wri.106.1704293944183;
        Wed, 03 Jan 2024 06:59:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a0e2:8719:e940:13c9])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d4612000000b003367bb8898dsm30992081wrq.66.2024.01.03.06.59.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:59:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] allarch: Fix allarch corner case
Date: Wed,  3 Jan 2024 14:58:59 +0000
Message-Id: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 14:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193288

Most of the allarch code is conditional and only set if the recipe remains marked
as allarch. The qemu wrapper handling is not handled in the same way however and
is unconditional.

Move the code to some slightly uglier inline python to allow it to be conditional
and match the way the rest of the code works.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/allarch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
index 9138f40ed84..e429b924370 100644
--- a/meta/classes-recipe/allarch.bbclass
+++ b/meta/classes-recipe/allarch.bbclass
@@ -63,9 +63,9 @@ python () {
         d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
         d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
         d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
+
+        d.setVar("qemu_wrapper_cmdline", "def qemu_wrapper_cmdline(data, rootfs_path, library_paths):\n    return 'false'")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
 
-def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
-    return 'false'
-- 
2.39.2


