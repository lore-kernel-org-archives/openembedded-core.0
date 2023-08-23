Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AFEEE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.13095.1692801442361781761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MaD8gKEq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bf078d5fb7so38473905ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801441; x=1693406241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOf4b9Go+eizTKuvoCpL2wTEtGXbXCEI037EdTGBevA=;
        b=MaD8gKEqEI1vy+8wXSdFFxUNcee4XYxDPq+oBsgVBwv/EczofMKDBrYJzCkfIVO6BO
         YPgId2c2zzBAYWbNvV10na5kvhUVQffJkU++LfS3qyQaYZ+dIc3B98Q1HjAinC5oiitt
         A2v1gnaaPnpWJM8poqLxHaU27zz3nwkeIKULV6MYmDqatHKt89JE3SX5QLhGAd93f5lu
         dW+cSEWbUW5Hourdz4ELV3xAyqkF91ltjsJ4yLguDMMXCzoA7UgkK2HhHZLhw4znWTBE
         31k1mzaf3zgIEDazhtfZS6NYre3vkpoj1Za2FaddLP87HgmjLc4KKnWFhQy2ZGhhqwHz
         jaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801441; x=1693406241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOf4b9Go+eizTKuvoCpL2wTEtGXbXCEI037EdTGBevA=;
        b=Wdmqi6z+frd0s7ASlCRW2nivQGcKO/wK8XsusTHs2qYlo1gTzJEwypLGpCs4aoC7qe
         3T4otZyVDU3yZhGWDumOSzb7R8ui638oRNmtRNb0YFKT/r4ttoFlgqgzC0f3Hnxd6dCL
         R7qIJa8A5lrpuvvOpLqeEerMd8UrfsJXHklbPYSOZGqP32hfUYCjxiroHAUAnLRMbu2w
         a+QsrZX40CwZcNOqS+D1UBmYYGYTVsKig+k/lSN9aJ7nuzyYHxPseH+W8ON4MXIT24bZ
         ZSibmn6aoJjcJmN24WzIWLrjbytqLOMocKgy1HUywSf57LU+90V0pVz0ADpdAMLJSQv6
         vpWQ==
X-Gm-Message-State: AOJu0YzS0d0ty7Lb8vnWtm8xDmX8AdT0hYlj3XW5RuQHUk4KSxqfIrxX
	VnZ0YKEPxme2fkLw/BSBdTzb6l68JE1uxIJONgQ=
X-Google-Smtp-Source: AGHT+IGG95qMJBcsv+KfT2kqrD8e3SAkydBwKWkegn0OO3qXRmTdk5joSC5WsVoW/5xgWYVhuPF68A==
X-Received: by 2002:a17:902:e888:b0:1bd:edac:af44 with SMTP id w8-20020a170902e88800b001bdedacaf44mr11915450plg.51.1692801441470;
        Wed, 23 Aug 2023 07:37:21 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 30/36] oeqa/utils/nfs: allow requesting non-udp ports
Date: Wed, 23 Aug 2023 04:36:00 -1000
Message-Id: <2727a0cb8d026e0c47aedd91f7c02e24b056f37b.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186611

From: Anuj Mittal <anuj.mittal@intel.com>

Allows setting up NFS over TCP as well.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1ff9b9a3b7f7924aea67d2024581bea2e916036)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/nfs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index a37686c914..c9bac050a4 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -8,7 +8,7 @@ from oeqa.utils.commands import bitbake, get_bb_var, Command
 from oeqa.utils.network import get_free_port
 
 @contextlib.contextmanager
-def unfs_server(directory, logger = None):
+def unfs_server(directory, logger = None, udp = True):
     unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
     if not os.path.exists(os.path.join(unfs_sysroot, "usr", "bin", "unfsd")):
         # build native tool
@@ -22,7 +22,7 @@ def unfs_server(directory, logger = None):
             exports.write("{0} (rw,no_root_squash,no_all_squash,insecure)\n".format(directory).encode())
 
         # find some ports for the server
-        nfsport, mountport = get_free_port(udp = True), get_free_port(udp = True)
+        nfsport, mountport = get_free_port(udp), get_free_port(udp)
 
         nenv = dict(os.environ)
         nenv['PATH'] = "{0}/sbin:{0}/usr/sbin:{0}/usr/bin:".format(unfs_sysroot) + nenv.get('PATH', '')
-- 
2.34.1


