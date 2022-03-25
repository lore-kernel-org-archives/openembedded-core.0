Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB622C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:40:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.526.1648233641892488686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 11:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SDvH+v37;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 p26-20020a05600c1d9a00b0038ccbff1951so3234738wms.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OEFTYqAdLPPimwA2Dbt0aVHaUbNsIGNXBeyYMDlrnJc=;
        b=SDvH+v37fTdt3v8w0uWc5L04ynEyWZx1Cnbn6ckMNHf9J/Ejw/qib3C4RCHGTMwlTN
         j2hlQ6JT8WqoyE8at693/NYStXeOFC7gw7xxo8bZE4h+Ccrqs8XcYaNa+hV91zadqsik
         CC++q1iFNiFST6gKnd+J9mLfNmuP5KcuG7wGM/W08XkW7uRBlebUfHaxqQFvABzl7vRu
         ZoKQMik5aAt2SZRFQS1jR2JdihRfluKHN/xo7lCNF1pDjPrKnPUB4QpehFdVF+Xka3nz
         T8li92ir6V7mJSfmDfQOJ4ubgclpYv3azZiXwhj+xUSpliPdLYwRr0Lt+3HYwEqg+him
         n+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OEFTYqAdLPPimwA2Dbt0aVHaUbNsIGNXBeyYMDlrnJc=;
        b=xLBPtKzAIi6UphkVhCveqVkbZZ4QtIjHQxdTYO5D2ejTWSCIJSFC5cmdrj7qapp8P1
         2txEB6EYew0KyrHtZ12o6lET0UhlJ1YcJAg/tgImTZ2iUJtWqtROnJN1TEFamGqZqFHJ
         pSG8EWEK/5RfLUs8lnxHuM0qzqR7DTv47qMn3We4a/CYhODdX/XoCLZHU0QEJE0YmMDD
         TatczftHN7p8bLOKaF3mCCCSg+mEOrwU2pLOp9MO6up1KPTRsF8faoN0tN/SI1rCWD9d
         9btgd63pLJUFBLAWJf1kAxwIFkSqXrZiR4EB5kAdHJQqTfO/zE/6G6/Kmc0eD3+NIV2v
         7UYg==
X-Gm-Message-State: AOAM533L0phdEw2XRAL3Bho3i77cXJ/XxdawNA9HEJu7YLqOgeKb/EZ7
	P8RW43EJz1Wh61Ijc6XLuxD/Gur+dK0=
X-Google-Smtp-Source: 
 ABdhPJxuR/QkTWzAeEw4sNdp5kZQZNjYVNrcB+8lSeNUk0Ku2HiIfUQmKEHSKHD125ktC/cOe7OqKg==
X-Received: by 2002:a05:600c:500e:b0:38c:6d79:d5ac with SMTP id
 n14-20020a05600c500e00b0038c6d79d5acmr21458575wmr.42.1648233639979;
        Fri, 25 Mar 2022 11:40:39 -0700 (PDT)
Received: from localhost ([2a01:4b00:f41a:3600:360b:9754:2e3a:c344])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a056000136800b00203e740c7desm5718101wrz.71.2022.03.25.11.40.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 11:40:39 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] mount-copybind: add MOUNT_COPYBIND_AVOID_OVERLAYFS env
 var to skip OverlayFS
Date: Fri, 25 Mar 2022 18:40:32 +0000
Message-Id: <20220325184032.1880706-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325184032.1880706-1-luca.boccassi@gmail.com>
References: <20220325184032.1880706-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 18:40:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163650

From: Luca Boccassi <luca.boccassi@microsoft.com>

In some cases we don't want to even attempt to set up OverlayFS, for
example because SELinux in enforcing mode would kill the process
attempting to use the mount. See:

https://lore.kernel.org/all/CA+FmFJBDwt52Z-dVGfuUcnRMiMtGPhK4cCQJ=J_fg0r3x-b6ng@mail.gmail.com/T/#mef98aa406324096d1889d3d467251f30456f403c

If MOUNT_COPYBIND_AVOID_OVERLAYFS=1 is set, skip directly to copy and
bind mount.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/volatile-binds/files/mount-copybind | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/recipes-core/volatile-binds/files/mount-copybind
index 8bbb406b3a..ddc4357615 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -2,6 +2,9 @@
 #
 # Perform a bind mount, copying existing files as we do so to ensure the
 # overlaid path has the necessary content.
+# If the target is a directory and overlayfs is available (and the environment
+# variable MOUNT_COPYBIND_AVOID_OVERLAYFS=1 is not set), then an overlay mount
+# will be attempted first.
 
 if [ $# -lt 2 ]; then
     echo >&2 "Usage: $0 spec mountpoint [OPTIONS]"
@@ -51,7 +54,7 @@ if [ -d "$mountpoint" ]; then
             mountcontext=",rootcontext=$(matchpathcon -n "$mountpoint")"
         fi
     fi
-    if ! mount -t overlay overlay -olowerdir="$mountpoint",upperdir="$spec",workdir="$overlay_workdir""$mountcontext" "$mountpoint" > /dev/null 2>&1; then
+    if [ "$MOUNT_COPYBIND_AVOID_OVERLAYFS" = 1 ] || ! mount -t overlay overlay -olowerdir="$mountpoint",upperdir="$spec",workdir="$overlay_workdir""$mountcontext" "$mountpoint" > /dev/null 2>&1; then
 
         if [ "$specdir_existed" != "yes" ]; then
             cp -aPR "$mountpoint"/. "$spec/"
-- 
2.34.1


