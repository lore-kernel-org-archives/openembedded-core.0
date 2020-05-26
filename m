Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.1188.1590530250625009763
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 14:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dO7AGaTW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e1so22043441wrt.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 14:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ujzqLy7hWuQnhgIIKyAeA3FMdNzhmoMUydDVD3lwFLY=;
        b=dO7AGaTWK/ZlCCT/jNonL5LS5CQRG8YwopVq3YQevSeh6dol+AztffrQrzSBe5tGov
         ZxiMKlz6OK4W9jM5jotAOW6yN93OH6DmEFxOjlb+D32cJ1z8GQDO0s89gwH36qT3Xg86
         wKGMyE2QfnVhZGVMZOaI8ZrbWVeszfLYetjAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ujzqLy7hWuQnhgIIKyAeA3FMdNzhmoMUydDVD3lwFLY=;
        b=tvVsTkbar17H09DBW4pZ29D0NiOGsZ2DuJsnlfi4yoPzQTqc2tNiulOjfV/wiXD0pr
         odSLJ4W+c8xorNfeHoYkGT51hUxuOtV90HzRcspgNczHB5V5123WLtMqA/xqPYE9GIIT
         dYQBqHHxPIoTQRkC+FGbGB74NBiB/5b8PbUmO/ch3f6dWdDZsTPq+uW7jqxQ8Dp6ABFE
         U1dU5QSJlwfJc3U6HQg0voj5GDfJr9hR+nryMOjRt1rGqttb4ToPgZZxKrtutcDnAzRn
         HYBbOyN8+ZFnS0PiSWrIdFxXBAvrIQRswlNlwyKcVfk6dcD3CbJqrTaQGNyWxx8ywuKQ
         mZkQ==
X-Gm-Message-State: AOAM531KjC1Kdvw/GY6+e45CIvBVzFYNiE49b1fPfZ7hs8cVGp5XAlyf
	q6S3ID6JD+ufhNeq5RQ8pRI8hTQXUNddlg==
X-Google-Smtp-Source: ABdhPJx3LcM3QQazn4ArU0ZkQVn9rQIIV5/Xd77NUZx0UcMLf5797V551eHyRGDWSnmslFfv8ioLug==
X-Received: by 2002:adf:aa9a:: with SMTP id h26mr13185629wrc.61.1590530248584;
        Tue, 26 May 2020 14:57:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z132sm901291wmc.29.2020.05.26.14.57.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 14:57:28 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] ltp: Add missing dependencies on coreutils, bc, e2fsprogs and gdb
Date: Tue, 26 May 2020 22:57:22 +0100
Message-Id: <20200526215725.992258-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
References: <20200526215725.992258-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the tests are run we see messages like:

/opt/ltp/testcases/bin/run_cpuctl_stress_test.sh: line 242: nice: command not found
/opt/ltp/testcases/bin/run_cpuctl_test_fj.sh: line 66: tac: command not found
vma05 1 TCONF: 'gdb' not found
memcg_failcnt 1 TCONF: 'bc' not found
Owner=nobody; perms=-rw-------; sudo: lsattr: command not found

so add missing dependencies to avoid these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ltp/ltp_20200515.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb b/meta/recipes-extended/ltp/ltp_20200515.bb
index 317a4e461a7..0304a40185b 100644
--- a/meta/recipes-extended/ltp/ltp_20200515.bb
+++ b/meta/recipes-extended/ltp/ltp_20200515.bb
@@ -77,13 +77,17 @@ do_install(){
 RDEPENDS_${PN} = "\
     attr \
     bash \
+    bc \
+    coreutils \
     cpio \
     cronie \
     curl \
+    e2fsprogs \
     e2fsprogs-mke2fs \
     expect \
     file \
     gawk \
+    gdb \
     gzip \
     iproute2 \
     ldd \
-- 
2.25.1

