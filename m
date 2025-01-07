Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CDAE77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 22:22:46 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.5216.1736288557895136275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 14:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZhhqCpjc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385df53e559so12553867f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 14:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736288556; x=1736893356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMAHUowB2kwgqErG9b72iFvKPUWV53pFTX+jNBlSyzs=;
        b=ZhhqCpjcKiur8heepaamofsrp7hawSVH6HLqtvk0QRyacDWJzkYvDKa4oPQiZGV1+1
         sfu9afzgYfP+mYcYwAp36Sx5j7w5RtzCAC8t2B2XvyPCJwWl+FULiirApsRHfgI1PPeW
         vpCEtxOfYEl+NB1JjOrtDRPoZblYV58b+vNS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288556; x=1736893356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMAHUowB2kwgqErG9b72iFvKPUWV53pFTX+jNBlSyzs=;
        b=DFk990vDjYFS+jRdE5Nh81vb7jswMftRwZLb5FcZC16J4cKrLYDzcXNvmU+eHaNv2I
         m2VKpHnsFNlEmTrRyGkz1BoaEouxujKqOvEmvwAS33yD52pyfoFM2S2YG3KA9r0vAdrR
         BOItEkQpuCD3sjNZF3fFmUctXlBAJQgylA/DuGexoVC6u3HV1cjXGk+fFICEsw8IwJyY
         LMJBHPZL/xOAuBd1w0LsejLQ8H5QUZ4goqg7vKtsoWg2fuPPQxz9yfCGDeo/7JpuvDiu
         w33ibmCKZ4a2X46tZEjB7QXeEvA5hvLZXmGFXAvEb7JHGKXAaRVAiQnVKrPN3Zvb8fJu
         GJGA==
X-Gm-Message-State: AOJu0YzSaUNSZV2UsWnjtQKykX9GHkBZCyPi0X4lFaxbhYHaBOXzW5ir
	e8s02yvXOJPaBffI0qDpdS9ek8D/zPS4R5h0SOCTLNi4eOcgSnR9qtOnKiC/LQecurECs3imuSO
	cbuM=
X-Gm-Gg: ASbGncszOyPwm4LPoQyAtcLqUGokkKN2H59TXrTulPj0zLqSRZlQ/Inxu9pPcrb6eOd
	J9avrqKxoc+mUt+nWkfvD2fa6kBpQTceveNV8JaJXHDhneptueX+7pbVkkQShKOkzpUnWR08X/J
	kd4PnGRSdyuVYAGKhO722Qp9rBUVQzcSfRHYblgkLJmtSHugtcaMTc9yvWYyfe3AdI1em5wvG6w
	qLbxTR0g8jzcjpNnbrX86qlY6nfnHokO1R9K55CMuafoWEn0XjPylXVO0IqxCmIF8EzZSmlP5SS
	6HVrUbDs/w==
X-Google-Smtp-Source: AGHT+IHCd5wZdK5txqZtRxxxhA8VfmhQ5eSoLHP+7A4ONLN2/r1xvZVYG9tjBewoeoWJ3CsFcnzn6g==
X-Received: by 2002:a5d:5e8a:0:b0:386:3918:16b1 with SMTP id ffacd0b85a97d-38a8730fc4bmr208929f8f.39.1736288555930;
        Tue, 07 Jan 2025 14:22:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:f113:f9ed:a6de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8330e0sm50609664f8f.34.2025.01.07.14.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:22:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Berger <oecore.mailinglist@gmail.com>
Subject: [PATCH] go-vendor: Fix absolute paths issue
Date: Tue,  7 Jan 2025 22:22:34 +0000
Message-ID: <20250107222234.3519959-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 22:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209504

When building with the class, avoid errors like:

"sstate found an absolute path symlink /xxx/vendor pointing at
/xxx/import/vendor. Please replace this with a relative link."

Use relative symlinks instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/go-vendor.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclass
index 12667b2d60c..45feec4d23e 100644
--- a/meta/classes/go-vendor.bbclass
+++ b/meta/classes/go-vendor.bbclass
@@ -70,7 +70,7 @@ python do_go_vendor() {
     if os.path.exists(vendor_dir):
         # Nothing to do except re-establish link to actual vendor folder
         if not os.path.exists(linkname):
-            os.symlink(vendor_dir, linkname)
+            oe.path.relsymlink(vendor_dir, linkname)
         return
 
     bb.utils.mkdirhier(vendor_dir)
@@ -202,10 +202,10 @@ python do_go_vendor() {
         symlink_target = os.path.join(source_dir, *['src', go_import, replaced_path])
         symlink_name = os.path.join(vendor_dir, vendored_name)
         bb.debug(1, "vendored name %s, symlink name %s" % (vendored_name, symlink_name))
-        os.symlink(symlink_target, symlink_name)
+        oe.path.relsymlink(symlink_target, symlink_name)
 
     # Create a symlink to the actual directory
-    os.symlink(vendor_dir, linkname)
+    oe.path.relsymlink(vendor_dir, linkname)
 }
 
 addtask go_vendor before do_patch after do_unpack

