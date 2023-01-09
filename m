Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DB2C61DB3
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 19:34:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.82836.1673292852295738974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 11:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xwql9bc+;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9so10636533pll.9
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 11:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/5inulhLpr6oBb9KhqPuPJi2YdfqnrLUCOa+/YjK/c=;
        b=Xwql9bc+rtwNMw7fB/M4AC1TGbZ+QBAeOVaVWFSI2nLAGphwSpApLodz5w0iepl7Mj
         GX7Fy6lskX+Q/8Davg1IHj2rzcNVpIgTIdqKVuZcxkgK8Rhrejkhh/itH3MIjxBWvfaC
         tRde5zjtuvFdlcgLTYJdmacd7lX1lmKdfbabEMWZTnQOl74VJMEkgAgmg6nWdhlgGgU5
         9wfkAeA2P9OfxPXwKXRudyJLPxSXl+aYb/R3PZTCkeEc+BZ3g2VcO3l5BZqJzHAXMF5N
         QTeo3O1qVQllmUZlFDeF35ClCSWbjOZMUWD3vCktHvTCRgJTmeWKb5xkszu5cQNbbkds
         KU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/5inulhLpr6oBb9KhqPuPJi2YdfqnrLUCOa+/YjK/c=;
        b=wM5S12JTdqhCr2NuGXmAcKuWWhq6xLte3ic4Jt0e3019DUTVS5XvqTp0txQ/8gEH2U
         yTcP16RT6LGib/cbiPSHzt3XSfCYEfETccnSplpQyAR0jRutdf/XPu1PwEproW9r6naM
         RSeYAv94Q2L5FegDqBhR90OwzmjBUsWHDNKl7wiW6R07sPyxyGNLwp2QFr+Im1tgH2AB
         702IAOoHzq58KMbed2rBEM7sREJmCeDyj2f7u+47nU2OWbYuIWZpleaBjgKRmYDtz2FL
         lxCzXEe11XSLtIMvkfMjoPAUGhBTA2fnqCPt+jkwqAjrYr4sMGjKfG1O7nX9sEr92nAp
         H8xA==
X-Gm-Message-State: AFqh2kri0uwh7mnVee/YtV6u3yoPpfu1yjdxhqUr7uawLHPl/2PqCZqc
	8zr7kisC1gC54bHXJqR1/czxX8mjObN2Lw==
X-Google-Smtp-Source: AMrXdXvIpe3jplEUbEcf2fPY9f6nK5XiSUS2+DjyNsAMO84tLBUn9exozSqtV8xUftb5cYjrSO5/DA==
X-Received: by 2002:a17:902:6b89:b0:18f:6cb:1730 with SMTP id p9-20020a1709026b8900b0018f06cb1730mr65502046plk.26.1673292851420;
        Mon, 09 Jan 2023 11:34:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b0017ec1b1bf9fsm6413236plp.217.2023.01.09.11.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:34:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrej Valek <andrej.valek@siemens.com>
Subject: [PATCH] busybox: Make provisions to disable sha256/sha1 accelaration on x86
Date: Mon,  9 Jan 2023 11:34:08 -0800
Message-Id: <20230109193408.3895155-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 19:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175696

busybox 1.36 has an ongoing regression on musl/i386 [1]
therefore avoid the affected code by disabling sha256/sha1 sum accelaration
meanwhile

CONFIG_SHA256_HWACCEL and CONFIG_SHA1_HWACCEL are enabled by default

[1] http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrej Valek <andrej.valek@siemens.com>
---
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
index e46d43e681..160d2fb4d1 100644
--- a/meta/recipes-core/busybox/busybox_1.36.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.0.bb
@@ -51,5 +51,6 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
-
+# TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
+SRC_URI:append:libc-musl:x86 = " file://sha_accel.cfg"
 SRC_URI[tarball.sha256sum] = "542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5"
-- 
2.39.0


