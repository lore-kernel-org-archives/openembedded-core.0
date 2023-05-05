Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80C0C7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.30310.1683300013325128008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cTl3lTmO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-643465067d1so1509423b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300013; x=1685892013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHwklA8cT2CLum7jyPCxD1U1L1YqhIVoYST7pdp5qoQ=;
        b=cTl3lTmOacKGXtN/Q5k9FPeQLR+L0tzf7prXlArs6drbBrgpJW6Eq48w3mdtQYNFZV
         Y3U2eZPqufk+ycmwMiZysaAQyjTA+lWI+21/DYXfA+TQaK0NJ8xScNMvGEEV8dx4FS+4
         LKyQ1NTJP3HTfxL1ZWz4W2idesgYwJLEcoLE9x+GtzBDzOOMtg44nsMeta/qM04b1VlT
         AUEkSgwN6yl+RiIWMDged9WJGrZxrch4Q06Ylpf+pDs4rLVnr15x7VdhtSr1Cl4NNmDO
         nnQgRac5kQylv+EA2xRzY99+uoMwHZkhCEJ1qwND0Z8ueexGntbZKizI8f1rNH4hTqz/
         DflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300013; x=1685892013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHwklA8cT2CLum7jyPCxD1U1L1YqhIVoYST7pdp5qoQ=;
        b=jHHoQ4lrjKzqPNc6u5laBIPSzWGkLKuzD8v2OmR5I3rH7btw9OjKPmLpOXsdm2kd50
         ejUuiiv+NpYzIPNonQ/Qc8ta52A8Xo2NhKXtr3cR0/SWfLhKMQBJV2KjrQLUblS7f6lI
         ATHEquZkl0LiKt5XrSSKsHmJtV3rDX+CQOP5BKY3XysY+EACYK4Kzc+yAFnviLNNcQym
         USel1OzXe6KFbrb9kEPowgrHQtamb2GbwYbk9C+9gPqWD/6meLBxyAvczMlQuNmypmh/
         InXBAf+M8o9r7P2r1EYaW6NHSg9KMrEBD1Vwe9hNKMHjLJYUF8OrzGbVhqoKX48oJ80K
         osxQ==
X-Gm-Message-State: AC+VfDzA3RSqUVwdlnVOYbZjhgNiqQiApFnxTe4xryQrt7uhNU/wn6V/
	5Fiqzh6DtZcUNCaGwjyDv1oT0FBDCa0BfgMc/8o=
X-Google-Smtp-Source: ACHHUZ5+RGGT9tIRKtxoXO2zay0qaStwzK72/DPib4MSWDsdCIvtxGoeFR/3GQxgoqGLRrM857bKMw==
X-Received: by 2002:a05:6a21:99a5:b0:f0:515d:1742 with SMTP id ve37-20020a056a2199a500b000f0515d1742mr2555533pzb.53.1683300013321;
        Fri, 05 May 2023 08:20:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/35] apr: upgrade 1.7.2 -> 1.7.3
Date: Fri,  5 May 2023 05:19:17 -1000
Message-Id: <fbf46e497ee9500fb95f2b619e0024d03ad50c1f.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180926

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  *) apr-1-config: Fix crosscompiling detection in apr-1-config. PR 66510
  *) configure: Add --enable-sysv-shm to use SysV shared memory (shmget) if
     available.
  *) apr_socket_sendfile: Use WSAIoctl() to get TransmitFile function
     pointer on Windows.
  *) apr_dir_read: Do not request short file names on Windows 7
     and later.
  *) apr_file_gets: Optimize for buffered files on Windows.
  *) Fix a deadlock when writing to locked files opened with APR_FOPEN_APPEND
     on Windows. PR 50058.
  *) Don't seek to the end when opening files with APR_FOPEN_APPEND on Windows.
  *) apr_file_write: Optimize large writes to buffered files on Windows.
  *) apr_file_write: Optimize large reads from buffered files on Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1bee38556441fbff9a4e39942271001ec620416b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.3.bb} (98%)

diff --git a/meta/recipes-support/apr/apr_1.7.2.bb b/meta/recipes-support/apr/apr_1.7.3.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.2.bb
rename to meta/recipes-support/apr/apr_1.7.3.bb
index c9059c9921..9a93fe0967 100644
--- a/meta/recipes-support/apr/apr_1.7.2.bb
+++ b/meta/recipes-support/apr/apr_1.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            "
 
-SRC_URI[sha256sum] = "75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e"
+SRC_URI[sha256sum] = "455e218c060c474f2c834816873f6ed69c0cf0e4cfee54282cc93e8e989ee59e"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.34.1


