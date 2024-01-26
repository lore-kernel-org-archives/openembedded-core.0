Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61134C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 22:52:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.3853.1706309550520088347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 14:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zwc+TfDU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so948409f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706309548; x=1706914348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIgHgIzPDU2P9v5tlRUZufa34qq7/DCFVzfKc6dCPCI=;
        b=Zwc+TfDUZ2qL9qGfyt5BZnREh6SSo+Lttm4PYPACe1s6qJvbI1bY6YiFNCxkPSl2+Y
         023STU9A+o60qyHVIjx+81PnkanmsBKJ8tpkbMQsdpSrbCOcfwXebOCGfBBSAR1gINWA
         Bw5htgoF7gXMOx8GGqbQPWW526FnMlecJ/blg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706309548; x=1706914348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIgHgIzPDU2P9v5tlRUZufa34qq7/DCFVzfKc6dCPCI=;
        b=YX+MR2ugPCExVvXSDCtZb+e7J3c8GrA4P970mIxK9kTe07MuwtzcvIrjYlNefFn9+D
         hNVQQNDIouAyObYi2FFqq75TNDqqnid1rDnkpieHCtZ3Xvzv5HRnMEuD1g+J2odIW20F
         6JpzBJGBb4pimMtlffvw/ILuUfwtVnVpVLZU+8KNmjCk0g/XgU1pdxKJBqf9jIEfGR9p
         W/1a+jeKhyolZKFsBmwtax5Yu1Lnp5Pn8TyJc6VD+8pEwsOWfriiJq4BNAUUj/ve4ieI
         CjLPJPakNtCCyzTrbtYc+FryeKFaJIj0ZNonxTIhEro5WGzUHKU0IWLji6KT/lR0TUL2
         bDBQ==
X-Gm-Message-State: AOJu0Yw4zeb9TG423Lj2r+edEZ1SNolI28liBCAABabEq/VtFRbsDY8f
	orCKCwyo3M5mnfF4UTpFb9GvNWdPpI5SLQQ/KNoq4X/6Un0XyecSH2qbiNGjuZhI3HcBC/7l7Ls
	n
X-Google-Smtp-Source: AGHT+IHcnyqBjHWiKt9AOspt8h2LINHaVW11v81dU7wi98fl6WgCK8j46nQTLgh6wpnthgtQOzPAHg==
X-Received: by 2002:a05:6000:d81:b0:336:b937:3d0e with SMTP id dv1-20020a0560000d8100b00336b9373d0emr303283wrb.14.1706309547768;
        Fri, 26 Jan 2024 14:52:27 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ee6c:4446:dc4d:c2a6])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b003395642bc9bsm2122677wrp.117.2024.01.26.14.52.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:52:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/qemurunner: Handle rare shutdown race
Date: Fri, 26 Jan 2024 22:52:26 +0000
Message-Id: <20240126225226.1168107-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 22:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194407

The pid file can disappear when qemu is shutting down leading to a
file not found race before it is read.

Tweak the code to handle this and fix a rare but annoying race error
case.

[YOCTO #15036]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 7273bbc3dbf..277cd328484 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -630,8 +630,12 @@ class QemuRunner:
             # so it's possible that the file has been created but the content is empty
             pidfile_timeout = time.time() + 3
             while time.time() < pidfile_timeout:
-                with open(self.qemu_pidfile, 'r') as f:
-                    qemu_pid = f.read().strip()
+                try:
+                    with open(self.qemu_pidfile, 'r') as f:
+                        qemu_pid = f.read().strip()
+                except FileNotFoundError:
+                    # Can be used to detect shutdown so the pid file can disappear
+                    return False
                 # file created but not yet written contents
                 if not qemu_pid:
                     time.sleep(0.5)
-- 
2.40.1


