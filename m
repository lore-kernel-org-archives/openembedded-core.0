Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.985.1623364895522515931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 15:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yd1of7rS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id c5so3941379wrq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YinSQ3jYZbUZ0mv5HTTCD/IQ45LLKhVYYA69Xw6EwIw=;
        b=Yd1of7rSDaY4BuKDSyB7KBtTlWwdFcLxIvqGomEarstkEgN1hi1A3hKTNXuSlB9BV8
         V92lk7SpxX4HeetKjgjN1AgY65OfGfSO7gL2NsfXh/azQhr+QdhyaXznmpP0BaWV/0at
         jCkkMtYHOJ8BkxwJLtiJL1qFHJa0kdgvig/Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YinSQ3jYZbUZ0mv5HTTCD/IQ45LLKhVYYA69Xw6EwIw=;
        b=Ysl5urPiuSePUxO0XphX/ijLOTM7euESFoSOufe4z5OIERsVwEUl+TeLBECVZaPOVf
         91l8TPh+N+qA5N58N9koXsheKh7efljloV/jVLwoYA7T4Prj1JN6rjcb4GEC4OxEnYfC
         g+zbPh8lOCnAYXJR8vdtM2X91+H6sNFzHzx2fCb+G1rEhMJzkehdjws3Mg0Rz4yBN86K
         mIoZ/3pOfpw6scNtfgufby+wimGgJAJinh5z/WPUInMlc1SQlm5xFPXtgqQnJm9LfqXg
         nytzTFDSgDab7w/8ok5ahZwxkcUuCX5dM2ZF4kVEZu2Ng/ItCPKgud5gnXbjh2bQfKiZ
         sRfQ==
X-Gm-Message-State: AOAM531asK/wFmsIfMSGd2KTdg257KlrKul+P6lN6NZeh0w+ZxDCaTMe
	CpVDYrBPEoMgkv3hdsIc7Kt3/FBz7R0ifA==
X-Google-Smtp-Source: ABdhPJx5JWQK9rV1VxUEy4PZozBVtEa81k4SlqkmjUFDOdXANJ1KjXEyxDr684q/vT1IZwxT5vJXMg==
X-Received: by 2002:a05:6000:1b8d:: with SMTP id r13mr647026wru.207.1623364893643;
        Thu, 10 Jun 2021 15:41:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:a367:b677:9781:a62b])
        by smtp.gmail.com with ESMTPSA id p5sm5039598wrd.25.2021.06.10.15.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 15:41:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemurunner: Increase startup timeout 120 -> 300
Date: Thu, 10 Jun 2021 23:41:32 +0100
Message-Id: <20210610224132.3167671-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610224132.3167671-1-richard.purdie@linuxfoundation.org>
References: <20210610224132.3167671-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We now spend time copying the VM image into a tmpfs and with IO load on the
system, the time + the boot time of the VM can take longer than 120s. Increase
the timeout to match the added overhead of copying the image file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 24af2fb20bb..5dc1a136e3b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -65,7 +65,7 @@ class QemuRunner:
         self.boot_patterns = boot_patterns
         self.tmpfsdir = tmpfsdir
 
-        self.runqemutime = 120
+        self.runqemutime = 300
         if not workdir:
             workdir = os.getcwd()
         self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
-- 
2.30.2

