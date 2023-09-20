Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0547CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 05:30:50 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.30551.1695187849382782526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 22:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OdHC3+1U;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-578d0d94986so658484a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 22:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695187848; x=1695792648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSnQ0vc7qD33eccBxN1TDjgAH/mj6qxw7x/kLoYzcu4=;
        b=OdHC3+1UnTHYTk9MxCvavLVHtH1tEkW8Jrm5QBiIkvW3wSBdAmhgvPOjXCE6fiMnsm
         qJ5+dC7gKRQyFTXMIq9MfDA7qUkQdLoTNWC9X/X4iieCq2Ai3zoSlYyol/NBxcsZcfwf
         qgBipQKUIV2ZOWexzmHgW1ZgcZwbk6ZLbExQ8+t3lNrSrskC32XaunFtpP0p85s+HR9H
         dZCuuOxvi0sm+y0+gIE/IHhE1QOufT+FJL0Bq9I2t7b0/3H7oKS2+Xy9opFG/O5bKWgk
         exChCp/VgTxxA2G2s2Yk0k4t0ra2A2UlURYMm2NEugZKlw1B5uhwLAnC+zmisT2faBjm
         8FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695187848; x=1695792648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSnQ0vc7qD33eccBxN1TDjgAH/mj6qxw7x/kLoYzcu4=;
        b=EsHqRSmwsYPAPPpHUvzTNlNO/Y0QCnfWIB/oSrfhaA4JAM4zUElo3YcPaNpiLWfldx
         p3pvVC5wHoh3XGMtlk1fdNQWCS3UkbnrmXs8JHsFP/sZX8ewYjQb6jQz7WweLore8bDG
         hHGhvxBLP+p+T5B+KbCe/CUx7c6C5WdYL4SZtRXdj1QvL4wbXXCEuBYGoHrLsL/GkpwG
         FeTkFEvN8JUFkAxrKVtcTd833QVVRRw4Kbs5BXYyGkOrCc6B4w1ZnfJxveELOwnsp3I2
         oRLlRXarsiM6iIEuw8VKoU0eKV/OPbu9qsA/Z5ripyKp6X8a31fifSfIVB8ladJzcV/W
         Y0OQ==
X-Gm-Message-State: AOJu0YwP5PkjAbIJgf5/d46K3sW4TL5uwDxDATkpFMFSFSCBh4UDpE8p
	BvxMWTsQhuHQyP49IFJXnSl9g+sJGaE=
X-Google-Smtp-Source: AGHT+IGxV7ZgMew2GpIYvx9sqUet0RholrtRyitxLZFdMDWq78LKletiI7QPjar9MpbGQsg71boPAA==
X-Received: by 2002:a05:6a20:160d:b0:15a:3b83:24d1 with SMTP id l13-20020a056a20160d00b0015a3b8324d1mr2043873pzj.18.1695187848209;
        Tue, 19 Sep 2023 22:30:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id 15-20020aa7910f000000b00682a61fa525sm9691085pfh.91.2023.09.19.22.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:30:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sed: Disable error_at_line detection
Date: Tue, 19 Sep 2023 22:30:44 -0700
Message-ID: <20230920053044.1682323-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187888

Lets use the error implementation from gnulib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sed/sed_4.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended/sed/sed_4.9.bb
index c4d89c34b2a..45552f94877 100644
--- a/meta/recipes-extended/sed/sed_4.9.bb
+++ b/meta/recipes-extended/sed/sed_4.9.bb
@@ -20,8 +20,8 @@ PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 RDEPENDS:${PN}-ptest += "make gawk perl perl-module-filehandle perl-module-file-compare perl-module-file-find perl-module-file-temp perl-module-file-stat"
 RRECOMMENDS:${PN}-ptest:append:libc-glibc = " locale-base-ru-ru locale-base-en-us locale-base-el-gr.iso-8859-7"
 
-EXTRA_OECONF = "--disable-acl \
-               "
+EXTRA_OECONF = "--disable-acl"
+EXTRA_OECONF:append:libc-musl = " ac_cv_lib_error_at_line=no"
 
 do_install () {
 	autotools_do_install
-- 
2.42.0


