Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6D3C3DA4A
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 13:10:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.78184.1733663453616913299
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 05:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U5qXEDBW;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a766b475so34278545e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 05:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733663451; x=1734268251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWhR6ta7ARaKY7e0/uxCseGpMy3+a6dqCGSpTbwVMRk=;
        b=U5qXEDBW9Ysds9iPoFko+68J4jLhgKrESE4uhByE+rcfL3giuFsttaqN7Fnue7S+TA
         0XAifkWajt1zWOdiSL0E7NoQC8fecw/MopQlQuUK8WYnTe5J58EBRwgs+x4HtaK+OETd
         5pj/r3AFrybeTKl23PLqHkIQgtjU2vKSdFoBDN4sQJkKY2yorG3dr7fKIH+CMRDYYQa0
         M7ZluYNHaODhlC/sqTyB8WU/ZzE9MENE40MXCrH5UFOQOfhyiuaRJYf3XWTrxdWilKPD
         nq3fJ9xrzn34QLChGoWdw7ovc+X+DEhtLhYqoTY9GrN3ylby4wPtzgxVG9ImCDk1H/XD
         3IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663451; x=1734268251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWhR6ta7ARaKY7e0/uxCseGpMy3+a6dqCGSpTbwVMRk=;
        b=NrS1AL0dJcuDYHMF8FsKyspZRKpkJUol/h2UDIA1I9DakhoBueqxotco7HYRMk9hxz
         2A9+2Q2C7ZlwTiITvOhlH2T62yd0+Bnr3tZa9702CzV2TmWjG1M4kiCD7rbK01JhOaQr
         ay4WtALLRljG448SBvmPrpgfOoRKTp4wh2oTuXsDTSqH+5MhEF8eSqHLcQGXhr0hUoOL
         /xjSrvSyAZMW5AiaMB1eZFQkPAE/VcWwfvQyP3lqCZbkYZgDYIRwYa7y6B0z/837nRWZ
         RERy3iA7DnjlVVkun4i/in5wvHUNw3Zd5R2fToaljoFtg2SbB+JJMa4DpA4OAnHHic67
         E2zg==
X-Gm-Message-State: AOJu0YzZt9SgsqNl0pdbfTkq7Lq96CH3Qg/yk6uXn0e+7I24g//c4n6j
	7cPtIvev2MEw/nAXndbTJW1cngBDe/zfo6NQNYXI3rmawPMN7d6offQrK7Z+
X-Gm-Gg: ASbGnctOC4WPnD8hHJRBjGw7yIneRLYMQPf2yWyQ8c00//x9+IpCb5qwbR+H1MOjdk4
	8tnN1MjUxUYvZuvUdRmz8QxdAenDqkAHnE22jG475EQfnf3kh19H2hPI/LNuu/pFYDEafLLdTqe
	iPRqOp9Vf+IorwoQnmpRpO9r8rwp/oCq8leGVrsF9iOaVtFK7bYKkPFjPgBlR4yY3hUfwBT/TnU
	yy64TlauwyJmk46fVkXLcxW9eFB98E/I1By8c0VjQjdkJJgQcBqH/8+ECsoykjVngKy1GyVtS8=
X-Google-Smtp-Source: AGHT+IGE1C2loIXI0nwLAVgGGU3QicMb/U0K4jkjQEQLTAFCaokbnSyqI0RO7LzZMK6r9qFfsTAYNA==
X-Received: by 2002:a05:6000:717:b0:385:f6b9:e762 with SMTP id ffacd0b85a97d-3862b3e7545mr6234239f8f.36.1733663451338;
        Sun, 08 Dec 2024 05:10:51 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862a4ae481sm7522689f8f.25.2024.12.08.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:10:50 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 4/4] dnf: drop python3-iniparse from DEPENDS and RDEPENDS
Date: Sun,  8 Dec 2024 13:10:34 +0000
Message-ID: <20241208131034.4696-5-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208131034.4696-1-gudni.m.g@gmail.com>
References: <20241208131034.4696-1-gudni.m.g@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 13:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208458

python3-iniparse dependency was dropped 2019, see the
following commit as reference:
https://github.com/rpm-software-management/dnf/pull/1329/commits/d7d0e0e2f9d8c7d021c794821ad0b56a39ebc01f

When looking at the Git history, this happened around tag 4.2.1

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dnf/dnf_4.19.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
index 37a2cc7de2..9c7c59818e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -27,7 +27,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
 
-DEPENDS += "libdnf librepo libcomps python3-iniparse"
+DEPENDS += "libdnf librepo libcomps"
 
 # manpages generation requires http://www.sphinx-doc.org/
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
@@ -49,7 +49,6 @@ RDEPENDS:${PN} += " \
   python3-sqlite3 \
   python3-compression \
   python3-rpm \
-  python3-iniparse \
   python3-json \
   python3-curses \
   python3-misc \
-- 
2.43.0


