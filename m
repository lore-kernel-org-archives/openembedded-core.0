Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.2609.1629576623624255263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 13:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X08a+7/q;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: o.kranz.88@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id z9so19324721wrh.10
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUta+vzQg7p9cJVYAaLsVsbqXJzFJVFnMz0zILWmrXQ=;
        b=X08a+7/qhsRALlhINO72eSKJMRpjecMzuRdF/W4oe9ZVby6X9hEi73+2sHh7qbZcrv
         lLstlB0h/2x33N1TSQ5Fi9kq7A9Y1nvTeNdXN7vcrZrIhQyWmEFFLOAHQnNoc5HjsqI/
         41515/OuaeEq7YwoDKE95TSRp0tmhw48YqeuLxWjd9Z4KPRqMZYigj53E/7vIsrVGQ5R
         p4JvB3nCE7hGPZRbjcQ/azs1zW521fdhiKKKKn3CyyNnepGdN/nZLeiekLBqSwkfQKDK
         paaOzu7W67fTg6BIu5cXTosNGRNQKFNvoqGJEr1GNy6aJBlQgLVESn6xJDUfi0oaMEya
         xQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUta+vzQg7p9cJVYAaLsVsbqXJzFJVFnMz0zILWmrXQ=;
        b=OVDN8WxFMc7BHVtG5DUYmW5Sqe7tWai34Ck7z/32yr7N3cf6/MH4GAaMoQNuKOGGSc
         agMJcIACRrfRaPC8PeUvgl5e9cc9ABl4dEI3D1ggzNoFmR0vIRBR8CmscDosDi31O9oa
         f1kvOKwYrIhp0kVAvCrVLhpIOASCZe7ZvmgEQnYvGli+I7cfnDB6mVLY2vNYhj13BGY7
         VbCQP/T0/4gWNxcecG7yWPI5Ktbb/pLBmYAweomhKqFD/gMGuigdij3/XtLj7o+GywTu
         g8Ozm09gaLGlcaM3P12N7tMHnKzsilhKPjSyNU0MQdHmGJ+L4JjiKsW2f62jyF3Skv1g
         z/eg==
X-Gm-Message-State: AOAM532E6mwy5RqFsdUisACMPI5sM+jzf2oqdbJMSEjVbYSb79o3Sd6P
	VwPOADU0f/waSftK9h6Tq+AB7tEmjko=
X-Google-Smtp-Source: ABdhPJz3m1KAyJJ4xmDwvUJggjFgMmpMld2u7ObJxvAhaTNWpzgzJgVd50PiEnEX5a84fJEhjxfFRQ==
X-Received: by 2002:a5d:64ca:: with SMTP id f10mr5358232wri.225.1629576621911;
        Sat, 21 Aug 2021 13:10:21 -0700 (PDT)
Return-Path: <o.kranz.88@gmail.com>
Received: from bigbox.lan (p54ab5306.dip0.t-ipconnect.de. [84.171.83.6])
        by smtp.googlemail.com with ESMTPSA id e3sm10026749wro.15.2021.08.21.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 13:10:21 -0700 (PDT)
From: "Oliver Kranz" <o.kranz.88@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Oliver Kranz <o.kranz.88@gmail.com>
Subject: [PATCH] goarch.bbclass: Disable GO_DYNLINK by default
Date: Sat, 21 Aug 2021 22:09:20 +0200
Message-Id: <20210821200919.3064381-1-o.kranz.88@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static linking has the following benefits:
 - go-md2man (-> podman) compiles
 - imagesize reduces, combined linking overhead needs
    to be > 37643776 (go-runtime) for dynamic linking
    to be beneficial
 - reflects the default golang setup

User can still enable it, if they needs to.
docker-ce, k3s, skopeo are ignoring the flag anyways.

Signed-off-by: Oliver Kranz <o.kranz.88@gmail.com>
---
 meta/classes/goarch.bbclass | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 92fec16b82..6e9128e44a 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -31,15 +31,7 @@ BASE_GOARM:armv5 = '5'
 
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
-GO_DYNLINK = ""
-GO_DYNLINK:arm ?= "1"
-GO_DYNLINK:aarch64 ?= "1"
-GO_DYNLINK:x86 ?= "1"
-GO_DYNLINK:x86-64 ?= "1"
-GO_DYNLINK:powerpc64 ?= "1"
-GO_DYNLINK:powerpc64le ?= "1"
-GO_DYNLINK:class-native ?= ""
-GO_DYNLINK:class-nativesdk = ""
+GO_DYNLINK ?= ""
 
 # define here because everybody inherits this class
 #
-- 
2.32.0

