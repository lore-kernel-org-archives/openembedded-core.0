Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3FCCA0EEB
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:59 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.25455.1694526838782899176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yAD8Mjs1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bf5c314a57so40038645ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526838; x=1695131638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOf4b9Go+eizTKuvoCpL2wTEtGXbXCEI037EdTGBevA=;
        b=yAD8Mjs14UE+MRLxAAPDKQ/pKgykqMcV53ToHpf/pvdKmvOp0GovITpDmXroVuZtUs
         lTcnS+gpVcGupDNXJ69J2+U0KB/GSeN9fQW1JA8DOYHzmAze1oPK8ZcVBtFQzvbevdjM
         oOmbxD8npVYIoS85cKWIuTYrvDipPh7F7HFmrJq9OXsk9bEMgiibnw94ME9Vf93pltCP
         GK7jYfnqNYcpb8+imW0lvTDHuDzLD4y3jhyt3udH6TFxGm5PZ51JXKMyAaBYskqx7I45
         bGrpYW09+iClPMzom3cPAHocAd6RF5uJdKSzHYsVhg07TCZx9UEOTYcZhisRpSLssDPW
         JZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526838; x=1695131638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOf4b9Go+eizTKuvoCpL2wTEtGXbXCEI037EdTGBevA=;
        b=DG4CTZLsIO2hIPWZwYB/G9cJuMiA3uVZByTFkZVTXUGv6WFwyTYSPSQfRMEtKo0oD3
         o3szkjjSrQUYAzr0zi2nr0qV9XpmFR9TtPi1c7ih9WO/0zDQcuQvDHXiynyOlRlnDAXa
         mI3E4+XT2PFgm5kMa2fthGDCVL04KcjmGFg4/u7QHzL5fomhbUVDWQhMi2Jzq6j/w7XJ
         tLwTVW3KDQ1jpbaBN+oFSWw+vtJ6P8L4LsHW/rqB9N6PLPpxnX7pSjZE4+NgVhDlmN4a
         wrLp0hvh/Dnb26Xqy2klx1+i4+jel5cGSA3EOuufLI4+GkTigKJECKED4b1Cu6+pAKCS
         f/Qw==
X-Gm-Message-State: AOJu0Yxsgiz9evofCY53TiEvlFGkoS1uUtqLP0QWrDtCqpI6lUD1/ciI
	gVqB3nNnX4aqfde2q9+ThLTIRAx/tdOzxs1E6t4=
X-Google-Smtp-Source: AGHT+IG0GWU0ii/w2w0iZzkUBQUMPGSjXoWXTnQEiIZeYbeobUv8ciSuhvOtgOnP12M8Gf40j7Jnjw==
X-Received: by 2002:a17:902:c1c4:b0:1c1:e53a:c2f with SMTP id c4-20020a170902c1c400b001c1e53a0c2fmr10754839plc.27.1694526837825;
        Tue, 12 Sep 2023 06:53:57 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] oeqa/utils/nfs: allow requesting non-udp ports
Date: Tue, 12 Sep 2023 03:53:20 -1000
Message-Id: <148e009374dcbd2101223cf33f2ff69c75895b71.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187526

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


