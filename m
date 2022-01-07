Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1369BC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 11:17:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.5182.1641554276458788467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 03:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HAO0J4eJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id v6so10400456wra.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 03:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NgRPTw/md5ZlORow8Hvg0nQIwn+B1GyWlrgTQty96G4=;
        b=HAO0J4eJV4+ITSsP47ECOkbm27sKkoM9i+PWaJcYBsSq1xXe0lnphkg3Vh65ggvnr5
         ZnehQUE/AefT3HYsym93/pqIcbba+UfWnceskiCTD3ldjJ/qtf1ze0/5zzoTezJtS5Ec
         ylecUYJbwm+yNx6ofLMpEtx7RSnmMjuCapdmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NgRPTw/md5ZlORow8Hvg0nQIwn+B1GyWlrgTQty96G4=;
        b=DS/giUBHEc7ftRW5skxxNsgtmF3vgrpFD8yNh+dryCGt8zMwbot5WVUHggu855FrsW
         ZaAIjanQ4U0uWh0uFbB4m8mxEYYZM3vvlv5SLA7oAe6hke8pxBnbN5QSDEv8JxDz2v6E
         AFgKw2FQyxiwb3GS4HcXekkB6Wv2eXh+RrehD5Nmgq7gJYAA+XhxgjTokj4SBGFBQVTa
         7B7XZpWWYB0jXaqlvv/f/z9aMmTPK7H8Bu1J23hGwA20Ja7EplnY4JOh5/w7DqyZiw8B
         nLd7m7kknAkmqMx23+ZIJN3cMxTZGRbwpMl6XADbxAPBlmqQmZv8RJMqlRPrt9Y3vP9f
         fe+A==
X-Gm-Message-State: AOAM5316FhNtHxdnKYjwbXjAdGbyqmWG/vfbuB1ckbJl3eG0xzAQNPj+
	Lq4z9bEiOZzQgmc8r/PCpORhWMYEeP7yow==
X-Google-Smtp-Source: 
 ABdhPJzHqCX/nHiMDrXLP3Bohm6oxHNipSMX/LG52vVvDFZWzeVHBZNBHxa7Vv7snPQRwZR2UhanoQ==
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr7556323wrh.417.1641554274583;
        Fri, 07 Jan 2022 03:17:54 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 l19sm3803656wme.33.2022.01.07.03.17.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 03:17:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "qemu.bbclass: drop OLDEST_KERNEL reference"
Date: Fri,  7 Jan 2022 11:17:53 +0000
Message-Id: <20220107111753.1500432-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 11:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160253

This patch was merged on the basis that it wasn't needed with recent versions
of qemu. That isn't true and has been showen to cause failures for aarch64 on
centos7 hosts. Revert the patch as we'll need a different solution.

This reverts commit 94b371e1c9e3cea787d70d6d7a09f7d3d69a30aa.
---
 meta/classes/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 333202b7c47..01a7b86ae1a 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
-- 
2.32.0


