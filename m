Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D623FCDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:43 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.51174.1697234015370640623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vAHACnMA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c9e06f058bso16491755ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234014; x=1697838814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dloikt7380rj+S/SxNq/ezfzKccD/U1fVvxoUfz9Sc=;
        b=vAHACnMADkXFEOADSDeuEqgcLbaOFeZmZuHDvC9grXl+C7omdf5c58QpdG5Ga09AFn
         WYWKPaadgrtcPLMWfmQpizheFPpqNbPWVKB3u8GhfiTgOcC7alAES8cgu33T6Xf8ipqI
         RIvJGMi149u9vtEKApBpbx1zfpqRBgbGlIt2S/XCCgwi0Jptq2cQZS97hxtPMtQv6sa+
         /iUZKNzeiMdxo6R1Wg802Ix8mO340Dy3IitRbxEQSVdg6YJ0WJG2gSLwos2J4RG2LIil
         OTQfFkU3u9zXNCEqlFbrcs4Wr2mzaeD93uUhHBjxKO6B0hePxme10L2e5P9xp2DnZiu8
         Cdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234014; x=1697838814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dloikt7380rj+S/SxNq/ezfzKccD/U1fVvxoUfz9Sc=;
        b=Y3R946JdoEiT6V/nRzMnDS3bi30ereuk9OGD1PjAtfXlhGCmZ+kOI+yqM04eNMobRx
         Z7goS2BrzcUQ3OdFG9hUn1vTiW/EDULDS2ghmkkDtvi4MnNXNF3YzGkky3MohiT4g2UO
         6tVXn3R+ENE65tRzgk9RMuaRawh6TVgOxaeiezvDx8Qb5EsqW5zil3mJYBTtyx+d7rkg
         6iqhcBITcT2q/sZHbd3F87zFrohZIM5qok8qf5g3J+w7K/wQ5iSxo3PM4h+U1iIP1tth
         GjtXcFYOFjAMLDwqt9w1Ppxou7T//iSzLbN1znX6oMdIEviZilTOfD1bf05Y/IFoASbg
         8qWg==
X-Gm-Message-State: AOJu0YyIBLrFEh9NL8w012R5+UMvknEp0IcnC/p4UjU9VEXpApC6BWlF
	BHV3T7Rga7dBxL05aMYSzocqw9UJc45IRjkvJIQ=
X-Google-Smtp-Source: AGHT+IEBDk48GOIV5PEODMJLqu56lfvg7qyQuGm5iPS0+hL139JMa30SaaLbNovvy4K2FQoCtCyaFg==
X-Received: by 2002:a17:903:22c6:b0:1c5:9d00:be84 with SMTP id y6-20020a17090322c600b001c59d00be84mr1894891plg.33.1697234014549;
        Fri, 13 Oct 2023 14:53:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/27] oeqa dnf_runtime.py: fix HTTP server IP address and port
Date: Fri, 13 Oct 2023 11:52:42 -1000
Message-Id: <68f0100b779bac1788818320f8aa64d79e3db3c2.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189095

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Use correct HTTPService parameters like apt.py when setting up the repo
server. These work with qemu tun and slirp networking. Fixes test
failure with slirp networking when executing testimage.bbclass
selftests "oe-selftest -r runtime_test.TestImage".

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
(cherry picked from commit 764424df2f4b6bf0e89fb20b4253a7601468f70d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 64a3502370..d2f0f88f7d 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -10,7 +10,8 @@ class DnfSelftest(DnfTest):
         import tempfile
         cls.temp_dir = tempfile.TemporaryDirectory(prefix="oeqa-remotefeeds-")
         cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-rootfs-repo'),
-                                      cls.tc.target.server_ip)
+                                      '0.0.0.0', port=cls.tc.target.server_port,
+                                      logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
-- 
2.34.1


