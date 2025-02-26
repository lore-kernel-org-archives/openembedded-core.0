Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E234FC19776
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 06:51:08 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.696.1740552661517008523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 22:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZ7mlnpJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220d132f16dso98744725ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 22:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740552660; x=1741157460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDO5kO2iZeLXeQstXmTTDbmztL4eKlxYTzMULxeaGaI=;
        b=AZ7mlnpJu+T3vVzK1zJIvjAMH0EmkBPsN/IapvrNeSNqQow2z3WgpA8AYvG0Va7RyR
         MnC7QRgjCQkkVrUndz8TP36RcU6i+i6RUmNtsD4r/8ndVVnXX8S2Ma941VZs807I05YG
         raIjl9rPfAyzNAl9PJjFl6KWwqG5gdjVMcgePjRogSt4jzrNpZikd3Obegc+cGg1WKU3
         Enmx4qeZv61qqVQLQXJ+O3WibaebpEv8oQ5MB7VRdj/lapOho5Aa5xGWH51qPE3TZsYL
         +KB4DchTQ4AEi6M1oRepCEPtKqp+bi3bnqzn49D09lEynOQ2XbpYpbGAyxMmBPgBS9AX
         N0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740552660; x=1741157460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDO5kO2iZeLXeQstXmTTDbmztL4eKlxYTzMULxeaGaI=;
        b=gO0B+fowcRQSWx4jYPIGs+hDBhNCItwaDlwT98twazQKEJojrwK8Ef5FbrHlHdH6m3
         6/51MI0iuHg6uF/ZyCevWwOdrfHqJMAOzOVaWUh3sDXPbqr+hV7bdyuSlmR/3vK53p7T
         X43CZHPCDPxR4CJd/2+MepgvRVBlAFzHww46LNrBkmX3EDQi2icCXLNn1BriWn9w1jxo
         5V4rL+FAlGaEyEycXn68g5wZJiixQWDw64prUkDh2r9VQ+DKijILhrugpkc4q4iaMu4u
         L5BvDOEJVF20Zu8pDGb0TeaI3mlZbkUDjfs5mkata4aUJl9qXbFFESv+S68BT0lLEInO
         ZMsw==
X-Gm-Message-State: AOJu0Yzek13WSZEoVt8z8fmHpbTB3D8muCvse0gBM5ZdpBsF4+3A+3MQ
	iUM0w7O+LSCxdb4jy8/X9JeNzYdzJU9FuhbvZPJRg0BNP4x7wF6Dh9VOCw==
X-Gm-Gg: ASbGncvnZcta1PW/1hAUTXwU+X/X1tRKmkNsZQx5VKnaxPY04T/QCi2Qc1nRdWDzWbH
	tSK+fInbVHiISQCmblkKPXdeO+ve/tj3WEvuv/1PxhfTi2mtUvC7a9b3tbHbnZ7HB5FDT3Se4lX
	PsOO0Uglja3SsUybQUepkHDJbeah1V2cnZ8TcBkHxuRIydTrtITi4xYc+nuBC9310snuUixiZdc
	u53B7aPNB1DSgKjzhRnStE2K8u5gM5x2QzgfANEQ50Yc1l4FehWUFSu3e8e+xgpkGjn5HNFmuBJ
	GhQ0Lind5MURCxYLpc2QF13bTuZnqbMrSw==
X-Google-Smtp-Source: AGHT+IEBOIo/RZhSQA8Da4ur5jnBtmGIxf4peemT33PQQzTcCh7Z94Cnh7WuojQWf6VY78PcY6E1ZA==
X-Received: by 2002:a05:6a00:3c8b:b0:72a:bcc2:eefb with SMTP id d2e1a72fcca58-7348bd9221amr3100104b3a.2.1740552660406;
        Tue, 25 Feb 2025 22:51:00 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.59.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9addsm2773615b3a.97.2025.02.25.22.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 22:50:59 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Moritz Haase <Moritz.Haase@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH] meta: Enable '-o pipefail' for the SDK installer
Date: Wed, 26 Feb 2025 12:20:18 +0530
Message-Id: <20250226065018.365531-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 06:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211943

From: Moritz Haase <Moritz.Haase@bmw.de>

When testing a Yocto SDK installer on Alpine 3.21, we recently ended up with a
broken SDK. One of the commands the relocation script calls in a piped
multi-command chain failed (see [0]), but the installer did not realize that -
since it doesn't use 'set -o pipefail'. Thus, the error was never reported to
the user and the installer claimed to have set up the SDK correctly - which
wasn't the case.

Given that the SDK installer is a POSIX-compliant shell script and that the
'pipefail' option used to be missing from the standard, it's not surprising that
it isn't used. Thankfully however, in June of 2024, a new version of POSIX
(POSIX.1-2024) was released - and that one finally includes the 'pipefail'
option (see [1]). A number of shells already support it, so let's enable it if
available to make the SDK installer more robust.

The change has been tested locally using SDK installers for internal projects,
based on both Kirkstone and Scarthgap.

[0]: https://gitlab.alpinelinux.org/alpine/aports/-/issues/16797
[1]: https://pubs.opengroup.org/onlinepubs/9799919799.2024edition/utilities/V3_chap02.html#set

(From OE-Core rev: 1cb4b41c7faf77fcc347b1276d86d4288968c926)

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10dce263f0230f94a44a017b5614811e696c5ce9)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta/files/toolchain-shar-extract.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 3b4647fca7..29c52e3b13 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,6 +1,11 @@
 #!/bin/sh
 
 export LC_ALL=en_US.UTF-8
+
+# The pipefail option is now part of POSIX (POSIX.1-2024) and available in more
+# and more shells. Enable it if available to make the SDK installer more robust.
+(set -o pipefail 2> /dev/null) && set -o pipefail
+
 #Make sure at least one python is installed
 INIT_PYTHON=$(which python3 2>/dev/null )
 [ -z "$INIT_PYTHON" ] && INIT_PYTHON=$(which python2 2>/dev/null)
-- 
2.25.1


