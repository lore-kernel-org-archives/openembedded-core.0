Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD98C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:57 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.21322.1691683554054472324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=U0ppDrrc;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-34914684b62so3851415ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683553; x=1692288353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rduigeOPIGcQiRCXbqb7FVfF80SUuNL7OFCDzB4INWg=;
        b=U0ppDrrcr05McM6vtYNSYZBX0zId7Zl04Zyy6y72kPQ2SBQP8lA4ZPTFKjWuWU1ky7
         M3ZHQJ0iLmXHXDC+TxY/Mx6AYtj49/ntxq1VpHYenqVqE3ZEDyG6NX2XotXzUrhnSC7N
         rgM9s1J2dq4iLr65GIjFJQYc2f122sJEnZ9jlosp/C94t6H9LsCyx72Ftl1HUZ+pPrPu
         r1HOrkLS7cOS+1z0Viar15bQteRUuuIDGlofdUl16YLrD3KeUGLRk57UdWJg1gNDH9th
         PLedvsKX+mRM2lNxUmH9OsXF7kl13HLuT47snEwU0OaXtlulALDbP4lCeG5LkDL3RY7R
         gphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683553; x=1692288353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rduigeOPIGcQiRCXbqb7FVfF80SUuNL7OFCDzB4INWg=;
        b=TsfcmFC0GKpaXaxmcy3+lw3JLgIt2JOvgTd7F66Uh4jqDvOFdIZHNhlbJwlDSFDKel
         vKuuJktkCqgUHdBkLxcsfhN7BLZD2BAZ0F1XcxtTxRj/2Cz84Ln82Omjz73PZpF9ZFyV
         UL+pcwSBYrdQDl4vMjUePH2Oh61J9u6n6UHFPEojcj/FWdgbi0oelRG3pkIFmfsaAK70
         7PNgVl6vysVLvhTglhP8uj+5IpaFpV51XcABI8k2zukfUygTz5doX6+kfMWFrsQinV38
         F2MwsIVmTmgbSTvJ2VHaK7NzNjGN7/IbrcARTvXMl2CGintnTTByt/qMAK7Vungjihas
         CbTQ==
X-Gm-Message-State: AOJu0YwK7KXr7PpvrDPZUz9mU0GimonlQgt9p9TcfygfqVnlnSe9xwiC
	G++OChCO+YzHLMNmIsZT0q6qsJKDjBVCq/lwT8M=
X-Google-Smtp-Source: AGHT+IGSDs549FUtwf9iTEti3dBwx4mmJ0zVjCrJFuE0dBD4hQl/Bl0ORsV33XxZo1NXrM5whdvcJA==
X-Received: by 2002:a05:6e02:1a4f:b0:348:1a1d:79a5 with SMTP id u15-20020a056e021a4f00b003481a1d79a5mr4361929ilv.15.1691683552924;
        Thu, 10 Aug 2023 09:05:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 31/37] oeqa/utils/nfs: allow requesting non-udp ports
Date: Thu, 10 Aug 2023 06:04:30 -1000
Message-Id: <a177ce907ec7a044659ec49c679e66f49cd71c43.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185793

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
index b66ed42a58..903469bfee 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -12,7 +12,7 @@ from oeqa.utils.commands import bitbake, get_bb_var, Command
 from oeqa.utils.network import get_free_port
 
 @contextlib.contextmanager
-def unfs_server(directory, logger = None):
+def unfs_server(directory, logger = None, udp = True):
     unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
     if not os.path.exists(os.path.join(unfs_sysroot, "usr", "bin", "unfsd")):
         # build native tool
@@ -26,7 +26,7 @@ def unfs_server(directory, logger = None):
             exports.write("{0} (rw,no_root_squash,no_all_squash,insecure)\n".format(directory).encode())
 
         # find some ports for the server
-        nfsport, mountport = get_free_port(udp = True), get_free_port(udp = True)
+        nfsport, mountport = get_free_port(udp), get_free_port(udp)
 
         nenv = dict(os.environ)
         nenv['PATH'] = "{0}/sbin:{0}/usr/sbin:{0}/usr/bin:".format(unfs_sysroot) + nenv.get('PATH', '')
-- 
2.34.1


