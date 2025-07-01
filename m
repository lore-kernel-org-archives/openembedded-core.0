Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04799C83F02
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:38:34 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.11123.1751377106301583479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V8Xjq4T+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31d578e774so6221609a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751377105; x=1751981905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcrFSlrD45i8aAvYxuvHx5fP46sqnU5nqAGmEZ4tiN8=;
        b=V8Xjq4T+YdToJlF+lLzfGxRHPS6CJ3NB5ZK1dmOCNNGwREzZl2fGSlEjEaZa52/imw
         nICrjQjHbcre+lk2AbXhteUaJt6eqgD9EB6QE1loAIHEqlZ8l9j1igxTgm2ukM+51NX8
         59k8vZzkcInwsICv62B4YID+3JVcQyKIfnIvm9wGFBkSb3a6GgLPH3SsWjQd/LlcPcd9
         76HdKYycCJ0iDU0fjaEL8KkX9cv12Po2VpFSm9+shnr+gRTD5lRhC17fmM6sv26MbEp7
         J1h/rrmNXIrT0lJfcBnkWHeUlOWqJKb/+c135qm9skaYxntBoqhYzNOsWrDNEDrE9G9U
         ufPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751377105; x=1751981905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcrFSlrD45i8aAvYxuvHx5fP46sqnU5nqAGmEZ4tiN8=;
        b=Nr1bnq+h5hQNAXH9E9KcTfZ81OvtLhWUeNB4wHre/1U8AE4kVkykAkAqZcpixBsSar
         npLtpLBzE0yBRGWUKJ31XfmgnfMYFaup3SK/YBcAIN6VyQSRhi2tk976FET/ZYYpKQYO
         afwEGl9Bc86Zo5Skdc2GQLUitF1Fp5MaXjGaixEGrGznpoRtXp2C6PCnZR9nIkYPJs0a
         dvyxaXCaZzKPS2GF5afOqnsBVsj22wCHBfpmC9F136vdPREvOl4pVLInJcT4kjRlvwxK
         5osYyh7NyVJW3oI7AZlNCN8Y/pUor9s7IEpJsF7jA3qvlRtTWsDrw0HaXfjjuc8jG4s1
         YElA==
X-Gm-Message-State: AOJu0Ywj7mX1Z919yWMHVZk0PyWBfEtVdyMOy/6hh4zI07my0NupA0Pe
	z5DLSJMQGqg42xUgU8osLyySUobzt4fjONVnvboB7RlKaJ96JjhhO4dv40k7XSQZwdhb7iNmsfC
	Q9aKI
X-Gm-Gg: ASbGncut6pypvNgYoSi9+uFzFYJ+62sMo1ju40L609rF0tQxhxchyBHBRDCtoUFuL8r
	pCG0eIagnL2SAyiRdEGVlxCRLzFuOxct/HGkmMcAjd9Mxp2dlBK++D1FqyXL82Wq7Bwz9IMegS6
	1f/CvtKVmIdGdEuKAYgHhGxulgbvstrZFpWcFY1YCrE9SZj2gfsDVfdf6RV8CKLU6ezijJwSYBe
	FsL44WmEI3uumwlE2CtAU900PrmHnkrxBywguE6DkfUmLAupXrzhnDvMifGC7NStDU1VBQlD/in
	kXOsEj+ftx7RdtFk8RkphMb2DYE4Ot9ddGbkByT7kidkHd2MdOehnw==
X-Google-Smtp-Source: AGHT+IF75Lpw01Ni9srCLknz/wR5+Ly88BIZ8xIQg/M4oF4Bwk7dmED1JYtqjoz9GTa8NNm2WNZDjw==
X-Received: by 2002:a17:90b:184e:b0:315:aa6d:f20e with SMTP id 98e67ed59e1d1-31939adb3d9mr4901106a91.4.1751377105414;
        Tue, 01 Jul 2025 06:38:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c152331fsm11466117a91.44.2025.07.01.06.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:38:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/11] package_rpm.bbclass: Remove empty build directory
Date: Tue,  1 Jul 2025 06:38:04 -0700
Message-ID: <c4f95abacdb7376f8f299679f3f0b2dd1dc28c27.1751376952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751376952.git.steve@sakoman.com>
References: <cover.1751376952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219577

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ bitbake acl
$ ls tmp/work/core2-64-poky-linux/acl/2.3.2/build/acl-2.3.2-build/

This empty directory is created by rpmbuild, just remove it like others above.

Note, master branch doesn't have this problem after upgrade to rpm 4.20.1, but
it's not easy to find which patch(es) fixed the problem, and the issues haven't
been fixed completely, there is still an empty SRPMS directory, so just remove
the build directory as others above.

If we don't fix this, there might be warnings when a recipe uses:

install -m 0644 ${B}/* ${DEPLOYDIR}/boot.bin-extracted/

install: omitting directory '${B}/xilinx-bootbin-1.0-build'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f383ed140e..c6541d141b 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -728,6 +728,7 @@ python do_package_rpm () {
 
     # rpm 4 creates various empty directories in _topdir, let's clean them up
     cleanupcmd = "rm -rf %s/BUILDROOT %s/SOURCES %s/SPECS %s/SRPMS" % (workdir, workdir, workdir, workdir)
+    cleanupcmd += " %s/%s-build" % (d.getVar('B'), d.getVar('P'))
 
     # Build the rpm package!
     d.setVar('BUILDSPEC', cmd + "\n" + cleanupcmd + "\n")
-- 
2.43.0


