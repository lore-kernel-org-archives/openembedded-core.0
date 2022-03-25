Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47FAC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:40:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.525.1648233640288767185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 11:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AzPcC3FW;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id j18so11998949wrd.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BtpXE/UhnAudEJ4ftYPuBIB4TKxgGNJnhMyPIEJbM2M=;
        b=AzPcC3FWv9yy6PyCuwlFl3iT8lNvXPLp3vZNGQoTIcJPwqEQlGsnbNLWagDsKkk8J6
         7eCAXf0Etnr+PeURbX9aUewI3phVNFXqMGE8aqr8dsQP0J2R3i6MeTPKbVXAqlWhanK5
         ThYzDw/ojT2B7cE6mRPusXSPxI49VD2NBVhXq6Mo4FDTZ03bws2Bmh1ocuN0QunR3btA
         JFBu0gP8XqpjNERgPry/vb9gWOAUR3TLvP1RAOD3PdgEHjQnqFH6pX1CoMBoPd2q2A5o
         J2AGjuJaiHFEm+VCfER1wTH1CA4bnQ752gza8hM8FJ+qGWIz8v6nrVp8jzlzsCUTwUq2
         0YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BtpXE/UhnAudEJ4ftYPuBIB4TKxgGNJnhMyPIEJbM2M=;
        b=O3wacOC1HUgD+405oSU8PT/zZxH+A1zZRC37FZ0i/66sCDExts/+OuYzreRCXu27iq
         oqjzbAW6idArQRaa4yyl/Qilvr0DpHi8+AYSE27e4ojF9tLzMZXD4g7XXtxc3pobL64g
         Zfvb1eM5BgUfIVzMg8CAKPfUgsUASe8PjTQRmJVE6AUWc5FSfg4M4d5Hclgni246/j/j
         btz0r/7aiEUEy5cZ2fsq0yNTTZFzpZBgqez0cDMAaWzD2/tFhHziFs+hkMLJjcN1wZGI
         QOijzz33KeIWepekH4fC8oWL+URFwVfLYf6ayg16kcSueeN+1CO9JlWX6DhClbC+6ggS
         gzfQ==
X-Gm-Message-State: AOAM530ZsY4AelmxZpxowLGTBTzcpb6jCU6iFK+cAmudgpEwl+cs4Btp
	CETN+hgB23sAqz13XVcVf1G448aXzeA=
X-Google-Smtp-Source: 
 ABdhPJwjuE2lFsxGxnxUpDr1RWCf4Uk/FEF4SDJDlda4AnpY/UClXHIW+Z4Oxht6eWUM/YPhySz5GQ==
X-Received: by 2002:a5d:5986:0:b0:205:87ae:9b08 with SMTP id
 n6-20020a5d5986000000b0020587ae9b08mr10370910wri.652.1648233638315;
        Fri, 25 Mar 2022 11:40:38 -0700 (PDT)
Received: from localhost ([2a01:4b00:f41a:3600:360b:9754:2e3a:c344])
        by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b0038cf335720dsm450953wmq.43.2022.03.25.11.40.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 11:40:37 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mount-copybind: fix shellcheck warning
Date: Fri, 25 Mar 2022 18:40:31 +0000
Message-Id: <20220325184032.1880706-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 18:40:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163649

From: Luca Boccassi <bluca@debian.org>

$ shellcheck meta/recipes-core/volatile-binds/files/mount-copybind

In meta/recipes-core/volatile-binds/files/mount-copybind line 54:
            mountcontext=",rootcontext=$(matchpathcon -n $mountpoint)"
                                                         ^---------^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
            mountcontext=",rootcontext=$(matchpathcon -n "$mountpoint")"

For more information:
  https://www.shellcheck.net/wiki/SC2086 -- Double quote to prevent globbing ...

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/volatile-binds/files/mount-copybind | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta/recipes-core/volatile-binds/files/mount-copybind
index aad022c6e4..8bbb406b3a 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -48,7 +48,7 @@ if [ -d "$mountpoint" ]; then
     # If that fails, fall back to slower copy.
     if command -v selinuxenabled > /dev/null 2>&1; then
         if selinuxenabled; then
-            mountcontext=",rootcontext=$(matchpathcon -n $mountpoint)"
+            mountcontext=",rootcontext=$(matchpathcon -n "$mountpoint")"
         fi
     fi
     if ! mount -t overlay overlay -olowerdir="$mountpoint",upperdir="$spec",workdir="$overlay_workdir""$mountcontext" "$mountpoint" > /dev/null 2>&1; then
-- 
2.34.1


