Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0540BCF9C69
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.36271.1727097256462135861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jLtxtxvK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71781f42f75so4125641b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097256; x=1727702056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDR6f8b9NVJ57/+zxVSD0+AlyXktCS2W4HrwApcUfMQ=;
        b=jLtxtxvK2SzApGQZIXYOLLgf8qSFdgnq3nyhPnX3mqgib7gCV0KZe2l5umDLXTlUfy
         2XvrRueylpT/lyVT8+DExLsMBIE0xU8RVnM13ZhPgFzpOlNt4yri/l6GhpSQfyfw+orA
         1EF2aRs11v0faMEMj0AZPukma5FbQ8mdBOndiE3/U3Zdku9SeA5nzAUWvI17s3+8u+MH
         zWje/k439QkaM9nye/cTip6OEXybD5BttieR43gKUJAD5mu8W/Ldx2VTHghPvmyXdSr4
         zuREREqSUcRiJzWgFdNpAJ/xbbLCxpGRkGnkfuTxTYaNspXXk2IeZ6Z9EB4pH7xzGC14
         bqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097256; x=1727702056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDR6f8b9NVJ57/+zxVSD0+AlyXktCS2W4HrwApcUfMQ=;
        b=xO8oiM25vHfM0TpikpvTGzS4jZydk0zF7ibHUrpkwXj0SZzlc54Gz9SPUgZhrBrSFg
         rXAaGNYgBhNIDPKS4ZaOtIssxcJqgcLScJq0iwwP/NAJ1pzhdW0ftNupLOOj47r4br1U
         INqFkyadbDIW1ENgURN5QFwMqUbfu9ACj15ICx0rZp1pNm90veM6jMTiYN7NZicgPIQJ
         /8sXez8WMcfDdYCciFIvsRVMyjNhF/gzG7H0cm0ES3j4Kjb0zCzu5xO4EhGRnHN0I1v7
         rW6hq2cRNRMj9N36qbIcpB9O+pbyW22JPM5dzKkq6TTJ6Ux7P0NSi2ZZeG5ZV8T9ea9b
         bFxQ==
X-Gm-Message-State: AOJu0Yxrz2zRxAphC7z1le6XkjqHF8knvkCitaAi8535k9jutuT4t+fp
	78Z5XKzqULHKxCN4cN+08nVp+20H9KccUpU4eGPDYBZqpDdv1UO4IlCcNiGpbEd6H+DbODPDJTA
	r+EI=
X-Google-Smtp-Source: AGHT+IEjBRb9SMPIJU2tQn7EPJapABy2/RAFf8ayMYYtUkjS0TYYKZXBtMpyCHBSgcMxnfxI0PYArw==
X-Received: by 2002:a05:6a20:d494:b0:1d3:420d:791f with SMTP id adf61e73a8af0-1d3420d7d26mr52157637.36.1727097255779;
        Mon, 23 Sep 2024 06:14:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] udev-extraconf: Add collect flag to mount
Date: Mon, 23 Sep 2024 06:13:49 -0700
Message-Id: <5dbc923acdab11eada37a4f7bba19e6d133ac931.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204814

From: Colin McAllister <colinmca242@gmail.com>

Adds extra "--collect" flag to the mount command within
automount_systemd. This is intended to fix an observed deadlock after
rapidly inserting and removing external media. This is because if the
mount command fails, the transient mount will enter a failed state. The
next time the media is inserted, automount_systemd bails because the
first consition finds that the file path for the failed transient mount
still exists. This leaves the external media unmounted and cannot be
mounted until the mount is fixed via systemctl or the device is
rebooted.

Adding "--collect" ensures that the transient mount is cleaned up after
entering a failed state, which ensures that the media can still be
mounted when it's re-inserted.

(From OE-Core rev: f0cda74d73eb8c14cd6f695f514108f1e94984a6)

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index b7e86dbc0e..a87619b181 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -83,7 +83,7 @@ automount_systemd() {
         ;;
     esac
 
-    if ! $MOUNT --no-block -t auto $DEVNAME "$MOUNT_BASE/$name"
+    if ! $MOUNT --collect --no-block -t auto $DEVNAME "$MOUNT_BASE/$name"
     then
         #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"$MOUNT_BASE/$name\" failed!"
         rm_dir "$MOUNT_BASE/$name"
-- 
2.34.1


