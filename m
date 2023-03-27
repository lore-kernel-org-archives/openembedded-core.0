Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8B8C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 16:01:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.39655.1679932856629112625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 09:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pwRLCkem;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id d17so9315418wrb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679932855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jEb3XNupxLoycl93AJnnfsfnGdlafXlHrSejKdp+Je4=;
        b=pwRLCkemxmjeoeDdwIbohQoX9sTd0kppTvXKNEtQNNBSQ45535RmEiaei3EgLTqGzU
         gqFi3L/SgsQgdwqaxqEgj2dej9hbym/PAJzBHXH2feDvL5TqcW4hTmNuBms9OS4n7lWZ
         zTcMEauUIQXGoiyZSob9+G+IKssxKJxO99htohkFYy91lfCryggBswtylZZVYanY8IGk
         sOm+bzOL1tCLBnWx2BNoTYRpf+2gsQmT0cmTX6gAx0baD3MDk0Va5MBEGEk8Gdtyr6q4
         /iU1FG4SADM5UmJszOfybcY9A8lZZW+EjXwSnx+psiwAwJZADPNnHc0AJfYmX99dNr+W
         +qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679932855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEb3XNupxLoycl93AJnnfsfnGdlafXlHrSejKdp+Je4=;
        b=DnfITEI9uZ99wBXOK0P0zMsADJHGWho3CIWqkYgt7/zuA3LJhWanSAEJhnRMtjTc2Q
         E+djmzuGJRlsCiVIsySR8nL2WIRJUOf7e3kXp89R3FT43lYwYRZFPv0HPagvDT6PK8z6
         GssvFOZRTXDTG+TvLlw1t/pVHaosLUGG4HwO5IwxFEDJujeUnNEzbMFZQwbQzTRVCyFw
         qLF3n4FkQMVjhDq0IAZoHkGXgotijt0crOjtc34yulO9OGBsqglyQAh1TLYS3S7vnLJ2
         71EiNZC/lF6XgjPyVLBjTXomuwVXWJw3PpYyfHbNK+rL1xJlVG1MgjMT0tnRhuqLbcLM
         7VRQ==
X-Gm-Message-State: AAQBX9etQELwKEovJocCp2KIWGEEIOyj4N/C3VNdr14a1V3aHim6a6Sf
	JSDnSRyU4NM4GNpDv4F6gPQp6mBI/x1STw==
X-Google-Smtp-Source: AKy350ZgnZshAPi2n65GECLWSB66lhy3sD6NlPGNXggvPl7GPnrg8OTQp0+gTfEqbDyQd9GSTBcG6g==
X-Received: by 2002:adf:f8d2:0:b0:2d7:452f:79ec with SMTP id f18-20020adff8d2000000b002d7452f79ecmr8440646wrq.7.1679932854713;
        Mon, 27 Mar 2023 09:00:54 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id p10-20020a056000018a00b002c3f9404c45sm25686533wrx.7.2023.03.27.09.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:00:54 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH] ReproducibleTests: split different from missing
Date: Mon, 27 Mar 2023 16:00:37 +0000
Message-Id: <20230327160037.487808-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 16:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179167

When we provide sstate_targets recipes they are reported as missing
which is not quite correct because they are proveided to cut build/debugging time.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index f4dd779842..cd7aa8aafa 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -292,9 +292,13 @@ class ReproducibleTests(OESelftestTestCase):
                         self.copy_file(d.reference, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.reference)]))
                         self.copy_file(d.test, '/'.join([save_dir, 'packages-excluded', strip_topdir(d.test)]))
 
-                if result.missing or result.different:
-                    fails.append("The following %s packages are missing or different and not in exclusion list: %s" %
-                            (c, '\n'.join(r.test for r in (result.missing + result.different))))
+                if result.different:
+                    fails.append("The following %s packages are different and not in exclusion list:\n%s" %
+                            (c, '\n'.join(r.test for r in (result.different))))
+
+                if result.missing and len(self.sstate_targets) == 0:
+                    fails.append("The following %s packages are missing and not in exclusion list:\n%s" %
+                            (c, '\n'.join(r.test for r in (result.missing))))
 
         # Clean up empty directories
         if self.save_results:
-- 
2.34.1


