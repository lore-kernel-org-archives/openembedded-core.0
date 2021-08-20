Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.5306.1629503724396543375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 16:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=en9JycyZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id r2so10757663pgl.10
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 16:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ENku7pnq5LtlB3Z4nKXPlxf7J92jNNg7/uO1fA4tDA=;
        b=en9JycyZNszyLPi3MPSd96LEI9K+lE+9qeo/kkiDVi94ABxVRR44Lb7foP5cJO1ksK
         8me6UHlhPs6laIQsUNcSCIaTfPKY57pPSJf6JKLscLBcwjVhfGyH9Wr9QDjnEcMB83ir
         qtVNj+exIAxVLzbsvwct4q6d8cuVHRn62ayUf773iZTd/DtX/GGpmli6swZd13dzKfvn
         FwUvpop3VjH6kFl8HXU0UNp+YK9KL23cZ32PTsv0SpnTlqCe5ojmF3tXckESmS/rEy2A
         OwQ2YTCrtcF2b7homapcgC33gw9yszW5Hxj/ze8qtyI+igFr9qrrtGw0/T1+A9R7buAe
         1Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ENku7pnq5LtlB3Z4nKXPlxf7J92jNNg7/uO1fA4tDA=;
        b=a/JJ/GFeOVn24+OPVVbX0MXR01SXY+4onE+TVXqzEg/+YO2VrlXb+1Vf/KnKG/Ekyg
         TTlqp0zfXfFXzT8+X7mK1YQJCT1usDwqhJbqXmhTiKGecjGQKnPJLhprs/vXAnElmPws
         ObxCfQQ+GuV7ChQBxTb21Y8DxpGM1RvPp3b5qXvQfbIcI8xj+0xwsxiOTtC27NzzO094
         GtElpGIQoK3WXWjaT40ZfdNyGYt7Q5yDpsolS18deLqxyIMDw1LYFAw2jV8A1yhhcfBV
         aGjViAAiTa/x0NiVnnNK/TMtOiOeSxK0LNLHCFQA5cDFYXOAvgR8hEbZ2xp10GaydtQ2
         /wlw==
X-Gm-Message-State: AOAM532028JWsZAo4nm+4HWOOS5U2JbOaTLVPCsTkNGWiiDOysZa0hm9
	sEvc8tMPWOFGwkA7eG8MQwJ0Mwlh77I=
X-Google-Smtp-Source: ABdhPJzJTUIR3Rt9RDYo+kOmKYuaXxBYDtdHLpMWRoyN42sLOP2RUb3s/9GgyMMSqgg1tqzGczGglw==
X-Received: by 2002:a63:7cb:: with SMTP id 194mr21204578pgh.308.1629503723879;
        Fri, 20 Aug 2021 16:55:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id i11sm9634705pgo.25.2021.08.20.16.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:55:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 4/7] qemu: Security fix for CVE-2020-29443
Date: Fri, 20 Aug 2021 16:55:16 -0700
Message-Id: <20210820235519.593218-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820235519.593218-1-akuster808@gmail.com>
References: <20210820235519.593218-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: Qemu.org
MR: 109315
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=813212288970c39b1800f63e83ac6e96588095c6
ChangeID: c0296e285169cc937cc9758c9d84ac690297ee54
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-29443.patch            | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 76bfb4fcf9..bd1a83955f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -59,6 +59,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-25624_1.patch \
            file://CVE-2020-25624_2.patch \
            file://CVE-2020-25625.patch \
+           file://CVE-2020-29443.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
new file mode 100644
index 0000000000..1528d5c2fd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
@@ -0,0 +1,45 @@
+From 813212288970c39b1800f63e83ac6e96588095c6 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 1 Dec 2020 13:09:26 +0100
+Subject: [PATCH] ide: atapi: assert that the buffer pointer is in range
+
+A case was reported where s->io_buffer_index can be out of range.
+The report skimped on the details but it seems to be triggered
+by s->lba == -1 on the READ/READ CD paths (e.g. by sending an
+ATAPI command with LBA = 0xFFFFFFFF).  For now paper over it
+with assertions.  The first one ensures that there is no overflow
+when incrementing s->io_buffer_index, the second checks for the
+buffer overrun.
+
+Note that the buffer overrun is only a read, so I am not sure
+if the assertion failure is actually less harmful than the overrun.
+
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Message-id: 20201201120926.56559-1-pbonzini@redhat.com
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport
+CVE: CVE-2020-29443
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/ide/atapi.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
+index 14a2b0bb2f..e79157863f 100644
+--- a/hw/ide/atapi.c
++++ b/hw/ide/atapi.c
+@@ -276,6 +276,8 @@ void ide_atapi_cmd_reply_end(IDEState *s)
+         s->packet_transfer_size -= size;
+         s->elementary_transfer_size -= size;
+         s->io_buffer_index += size;
++        assert(size <= s->io_buffer_total_len);
++        assert(s->io_buffer_index <= s->io_buffer_total_len);
+ 
+         /* Some adapters process PIO data right away.  In that case, we need
+          * to avoid mutual recursion between ide_transfer_start
+-- 
+2.25.1
+
-- 
2.25.1

