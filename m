Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF0AC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 21:46:56 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.87535.1674769610533966928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 13:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NuywzH0i;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id h5-20020a17090a9c0500b0022bb85eb35dso3031346pjp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhVwHd3qgqZ9T1RPk7XtYd6axZ4tJiWqeVsUph3+2ec=;
        b=NuywzH0is4YjiADtSpizqAkvlof6S2jhPPzoXeLsupj0fxWC4yhNfM3GkOmqDYz+O1
         nO1JcrXVlFT/bw0OCYd5ugeMoXq+7ztbQ5YNx/Bal09q9MnYN7GhYf9JzkaotTnVS7vt
         ZMbSjhxdPI7zMdNJkR1wOnftUPMZSFr0weHl6Q2yxdm9keXFBdi1bqQHK4rm92MGzr0f
         Nyl6Rj/dKmIGm+lFharnJsQfNUQX+G+qzzdEjMr12bb94sHizpSb4uGPYaxCZeITCqSk
         WCEUDEhDgIdbo9ou2YrKuTFtxfSA7rTVsOAyebAdenPf9/4ZNBOjP0P16rhvwIzTG6bE
         +KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhVwHd3qgqZ9T1RPk7XtYd6axZ4tJiWqeVsUph3+2ec=;
        b=tW9TwNa6dPVatwVJIb2dKLMIaOIAAEaSEY2dRTSgD6Ng+rdsO1MyMui14+XgzGO/4S
         /m+oHu9xM303S0ULROmpjkvzTDVNvI0Slhhovf9gtTmB/WFWuktOv8YUY8SbxbP598Qh
         gNhkxP7mEEL2PgXR3lc8KY3jrMJ31y7R9gjyKodITbLyaqGeMqwHIW6IndcRDYZ8JLdg
         hIEEPAlVH6C/M0xn/VqPVXJa3fgsFE3fA8YHehrrieeXupgQwevIuE8u4KpiBGtnWF9j
         4vmYYPMoHRH7cAKycvhpfWwwPOBufSov+NagnGytGgTajBebZcbQK+tdhqeXv0OrF4um
         gaoA==
X-Gm-Message-State: AFqh2koM03slVNJpaxcaUQbuim9GwRaiW9Q9CbSg8EeK7WHuAqAx3bIF
	iRbQ3HOFkId1OWj92Iw85/TJE6sFmLJhbQ==
X-Google-Smtp-Source: AMrXdXsmR6gOUV7SZAYz3XIfOIzqXzhu1B94/vVC0DBT5JE77IOKwAR1F2o5xDEWYDYTrQoqkwvRGg==
X-Received: by 2002:a17:903:1cb:b0:194:d8b2:7a1b with SMTP id e11-20020a17090301cb00b00194d8b27a1bmr34823498plh.68.1674769609606;
        Thu, 26 Jan 2023 13:46:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709028f8100b001888cadf8f6sm1444496plo.49.2023.01.26.13.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 13:46:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH 2/2] busybox: Make provisions to disable sha256/sha1 accelaration on x86
Date: Thu, 26 Jan 2023 13:46:46 -0800
Message-Id: <20230126214646.3279607-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126214646.3279607-1-raj.khem@gmail.com>
References: <20230126214646.3279607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 21:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176429

busybox 1.36 has an ongoing regression on musl/i386 [1] we see same on
glibc systems too.
therefore avoid the affected code by disabling sha256/sha1 sum accelaration
meanwhile

CONFIG_SHA256_HWACCEL and CONFIG_SHA1_HWACCEL are enabled by default

[1] http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrej Valek <andrej.valek@siemens.com>
---
v2: Disable sha accels on glibc/x86 as well

 meta/recipes-core/busybox/busybox/sha1sum.cfg   | 1 -
 meta/recipes-core/busybox/busybox/sha256sum.cfg | 1 -
 meta/recipes-core/busybox/busybox/sha_accel.cfg | 2 ++
 meta/recipes-core/busybox/busybox_1.36.0.bb     | 3 ++-
 4 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/sha_accel.cfg

diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-core/busybox/busybox/sha1sum.cfg
index 01137a2486..afd4da4ea1 100644
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha1sum.cfg
@@ -1,3 +1,2 @@
 CONFIG_SHA1SUM=y
 CONFIG_SHA1_SMALL=3
-CONFIG_SHA1_HWACCEL=y
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes-core/busybox/busybox/sha256sum.cfg
index a5b0ab22d1..ce652ae4c6 100644
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ b/meta/recipes-core/busybox/busybox/sha256sum.cfg
@@ -1,2 +1 @@
 CONFIG_SHA256SUM=y
-CONFIG_SHA256_HWACCEL=y
diff --git a/meta/recipes-core/busybox/busybox/sha_accel.cfg b/meta/recipes-core/busybox/busybox/sha_accel.cfg
new file mode 100644
index 0000000000..8900305a11
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/sha_accel.cfg
@@ -0,0 +1,2 @@
+# CONFIG_SHA256_HWACCEL is not set
+# CONFIG_SHA1_HWACCEL is not set
diff --git a/meta/recipes-core/busybox/busybox_1.36.0.bb b/meta/recipes-core/busybox/busybox_1.36.0.bb
index e46d43e681..8014a5c7bf 100644
--- a/meta/recipes-core/busybox/busybox_1.36.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.0.bb
@@ -51,5 +51,6 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
-
+# TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
+SRC_URI:append:x86 = " file://sha_accel.cfg"
 SRC_URI[tarball.sha256sum] = "542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5"
-- 
2.39.1


