Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.298.1592258522781469280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 15:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=de+lxVSR;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: danismostlikely@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id fc4so8547267qvb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 15:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vASjh6cvwGsPVkyjfdXuxqn7H9bzlMmCc39Tbxtjlbo=;
        b=de+lxVSRbQtOLKWRLN6zAxJwYZeBSVWmmJthJBjen6xzvFgSPJUJx7/VstjKkfhBTI
         A22ykqdJmX34OD2UFDXHHQCOJvT1oJBN43ncfkwzzYnirM4i5b0xjED2Vjf2y7/eINeB
         zW1SovIgRgFfJ0em+yOoI39BnJ5j/enCYwz7nJxMLExaWLeNVs6mrB9kFaI5eBQiCs76
         /SDiTeiBUW9u6jSQsaVN3b19UiLrO5D5piqgHxjbJqf8QrK3Zu04RGMev4z7mIA142Uq
         Qp7HvW5D4t4VMPD6VIGaKhj/vAjRj1oQReLXIlhNh9oCov/pCYiofE4RnskqV6HxsTzY
         uq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vASjh6cvwGsPVkyjfdXuxqn7H9bzlMmCc39Tbxtjlbo=;
        b=hGUqcvCeiswIGFJfamDKf0vYAbSYY1HWM1Gto+8TJg7qJVjCiuDMojTtEY7rMkCOV3
         wcAsnyKZdqKp3IsZiyxmLOuSDjqrruyMp6yB/AP8gADGddKqipqmLzZfruUHkC7jYNVP
         pEuUBnuLH6JQTPO+o6pgBy0jW+2lH54oD2lgLX4PsJhVyA8PcrGQ092JzY785q59GMY3
         yIFuAutZpaKHvXXY7NKHMgl8AhqDASTpwqzdVBbIZqf4tfN7ltNs/kEQYGce5i7pjnND
         jSghPs5SsmhljwDFmMmDe9EOsnRSrNMwG0k8IkhgybhHDWADThi8WZbJ9DM9W2BOX4U4
         pJvw==
X-Gm-Message-State: AOAM533VRx5HSS93wIUBgR/0MX9gzXEKNZrcKHX367h1ztGlJtlmSKBz
	BSsAgLPhGYybojfNvdkV2OZjXSS5VXI=
X-Google-Smtp-Source: ABdhPJzZaSdZ9/7uv1Ku7PfV/JqtENVCCKWvMzbPPdxO9k7IbD7AG2hE/vf2RnKIBV0rCFpvRg4QNw==
X-Received: by 2002:ad4:472f:: with SMTP id l15mr26744835qvz.52.1592258521797;
        Mon, 15 Jun 2020 15:02:01 -0700 (PDT)
Return-Path: <danismostlikely@gmail.com>
Received: from nebuchadnezzar.local ([2001:470:30f3:1:bafd:2698:c02f:136a])
        by smtp.gmail.com with ESMTPSA id 79sm12200056qkf.48.2020.06.15.15.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 15:02:01 -0700 (PDT)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danismostlikely@gmail.com>,
	Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/4] devtool-source.bbclass: Do not export _PYTHON_SYSCONFIGDATA_NAME
Date: Mon, 15 Jun 2020 16:01:40 -0600
Message-Id: <20200615220143.4018104-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200615220143.4018104-1-danismostlikely@gmail.com>
References: <20200615220143.4018104-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

This varialbe is set to help python3 running inside the build
environment. Unset it so that devtool can fetch recipes that inherit
python3native.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/devtool-source.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 280d6009f3..4032e59b0c 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -46,6 +46,9 @@ python() {
     d.setVar('STAMPS_DIR', os.path.join(tempdir, 'stamps'))
     d.setVar('T', os.path.join(tempdir, 'temp'))
 
+    if bb.data.inherits_class('python3native', d):
+        d.setVarFlag('_PYTHON_SYSCONFIGDATA_NAME', 'export', 0)
+
     # Hook in pre/postfuncs
     is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
     if is_kernel_yocto:
-- 
2.27.0

