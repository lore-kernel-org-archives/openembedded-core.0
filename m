Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998DAD6555F
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 21:44:55 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.58076.1732657493400539111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 13:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i4HZhve0;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2967af48248so3246436fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732657492; x=1733262292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+bU0b9Gqp4oTYqysbKsT0om+cMs2xeSOCoUNthJ5fE=;
        b=i4HZhve0bQXmJbSGCB5bcVMRgaxM1XzLLHsKnrv/rkSKsPimzmYvVqFqadWLoyQoTV
         HUWvJUVFQqVAqt2wMh5asvC0pMlKbT7UlaEGHsBD9FIDij92gsijKtgz9MMsrnkMFPov
         0Xl94AMoQYryDDuifSJUTqGLzxt1+LeEX9VNzLgUcLjeOxSHXi/W2YbA0v6/X7mAXCJm
         l9dTVmOfCtS1VmWHBEPSniqIK2Hrr+SFhpsIrEfpj5LBWZy7NHgDdMCMS9xJ3Umit8bZ
         RVMyDj0r41D1RU2Ald2FWtXdH+SfFDQQHFCTUXPjvOxZ849idWkc7oGL23SUndumyNZm
         Rzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732657492; x=1733262292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+bU0b9Gqp4oTYqysbKsT0om+cMs2xeSOCoUNthJ5fE=;
        b=aC+XHSm1fpf/m7jgVFUuIKQzzGwpDAeF0z4dYiL5qBZAnj+pwFVA2zkrfjf+jWtiyO
         Io8mWR9LbEFnHo3ly0x3LMd2JUQNFUrgvq7yuynx4eAaLiRCRck0L6dsBz9sNflP+E/R
         9iiTNOOU/qVimdX2r7l8Vd/KO8ybEKEkVzEVo8nF/cTiETecvBW84EoqKvC8u+Fy9HbQ
         yuZmqaFyRFbPhGlRQTnt71vQmbXJwHb1j0zCk7wENoiy1EsPn/5ko8ajfAXDBmQgfArX
         /i/5IxZwHyCj3yNVKjnc7OnIwc+TYE6dGkAccyJZGbNtPQX27pqukQ9WEwirSBPyfhYk
         UU4Q==
X-Gm-Message-State: AOJu0YwrPcCDxp5+JE5JGAT6GjridkKOMKiqmqRbdtbLaGSNupj0IUMZ
	BKQfZUZSO50dKPOYAmCEIC2ZcMxHXid3r6PapmLioFqBKLMYVLWgQRLAlQ==
X-Gm-Gg: ASbGncvNg2lMvUf/b60AeN/GO1iEJWLM7uPso/ru0bh3ApUDMC7JfPr9kHqFGfxn/vt
	RImGZ4BHu6YiqPnAMuHNz0oEx1domQhIHb6y6SwdjTPYZthZ3iJ0SJzBQZ3A/BdFXC8/HLYIL6x
	DraqsXXJeWQmHFmP7n1El0vVYyFuT/MCF+KkSD/DeSGdfqKg5FK3JASig09rj+we6ZU7R1lCBli
	NcrBc1H6wGxuxTwDFXbTgsIzFDOqyaeO1LsUEX9XTMfMcrs
X-Google-Smtp-Source: AGHT+IEAHbKb/BJHoiQoOppzPT+N3fHx6apRP77JCbPkq4aiQS2aWzoVdTMVo+Ujfg3boISSTWWJ+g==
X-Received: by 2002:a05:6870:c07:b0:297:59a:8d38 with SMTP id 586e51a60fabf-29dc4302846mr360321fac.31.1732657491697;
        Tue, 26 Nov 2024 13:44:51 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d887962sm4325283fac.47.2024.11.26.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 13:44:50 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/go-vendor: Use UNPACKDIR instead of WORKDIR
Date: Tue, 26 Nov 2024 14:44:48 -0700
Message-ID: <20241126214448.2781380-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 21:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207885

modules.txt is provided using file:// in SRC_URI, therefore it will be
found in UNPACKDIR instead of WORKDIR

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/go-vendor.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 1bbb99ac794..38ea69ab50a 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -156,7 +156,7 @@ python do_go_vendor() {
                 shutil.copy2(rootdirLicese, subdirLicense)
 
     # Copy vendor manifest
-    modules_txt_src = os.path.join(d.getVar('WORKDIR'), "modules.txt")
+    modules_txt_src = os.path.join(d.getVar('UNPACKDIR'), "modules.txt")
     bb.debug(1, "cp %s --> %s" % (modules_txt_src, vendor_dir))
     shutil.copy2(modules_txt_src, vendor_dir)
 
-- 
2.47.1


