Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CB6C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 19:03:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.12264.1641927791465861469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W/B8vbht;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so7060714pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 11:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=26qqQh9vvGC50KxITYv7uYQKn9gUX4x6dOagRQaM0a4=;
        b=W/B8vbht80GWw5krXizJL/FoRZBQXyWUvNntVFkRxwGSwwb0ptDUR6+Rrn+ZknnzmG
         2QgtxqKwal536pF9kYJKF5nBgh0jSHIA1Zxu+KQl7c4DZAyiFMnF+5A6NATc7GgHuvbh
         gUMNj+Hui+r7UZQyMX3G0cl0YzpPgidINXHxAEewi6565FGev8Rwz0XAvJnAUc2EEcME
         j49oNzsPJLSi5R20PYUbCEJeN/9jSBMhcylkmg1qYXMIDB78yD5RkcsYSwDsBxD663DP
         mZzVrQeXA53ynOMJwWDoJQxnl/D/EzyHL/eRGoZ8KzPJgErDcWF2FO/d0QWzNF9ZM7LU
         YztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26qqQh9vvGC50KxITYv7uYQKn9gUX4x6dOagRQaM0a4=;
        b=lJphSYgF9l/SXHSaLsCpRit43pn0ESgu7JkBU6WE1GgxNvMiMSAsSkdQsB7rSMjCqE
         6xiE9b19q7+ey1ft2BVkMOKgX+jElq7932lxcSIj/mKTnwSwOyMjHx5mGbnkF2eC5Kni
         n3tP66Ihxh1L7Ax+kvmigPMLBFsHToHuLgCMcHH/Uj7qU1N4Qf3uOsLIW4TIfZAY8lUW
         fa2bqJRtyB0ABiTvQFz3Ou95eE/bA8AZaIShJN7djekQmKzoGr/TxuvtheOpAidzoMH8
         //iHdsKS4rEQFfpUhNRbdaKoNkInkJe+XsffpD49InOj5YgGgZ5K5IGoSaegNXXMWDyV
         XRiA==
X-Gm-Message-State: AOAM533UAl2k9i5LeowtktoqyFVtRff0ucPt3GcnVAM10gf6qyo0Hfx6
	hyw4LZfGhx+c6Lb4OHDqau1XnaPCRns=
X-Google-Smtp-Source: 
 ABdhPJwuyr5tQ3ClltDmD6yBelzgoGwlpOJmqN3oHQ67j7Fayhn5giED580fV0RCxpVz+ThsjtJA4A==
X-Received: by 2002:a05:6a00:b8e:b0:4ba:cbf2:516e with SMTP id
 g14-20020a056a000b8e00b004bacbf2516emr5801391pfj.72.1641927790760;
        Tue, 11 Jan 2022 11:03:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:9b84:60d5:95c9:ae8b])
        by smtp.gmail.com with ESMTPSA id
 u3sm11509977pfk.82.2022.01.11.11.03.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:03:10 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 22/22] rootfs_rpm.bbclass: distutils -> sysconfig module
Date: Tue, 11 Jan 2022 11:01:31 -0800
Message-Id: 
 <ace4f5cf0d2d76f0d77bdad28eff060fae8760e0.1641920605.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1641920605.git.tim.orling@konsulko.com>
References: <cover.1641920605.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 19:03:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160458

Change a comment to reference our custom changes to the
sysconfig module, as dnf no longer uses distutils.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/rootfs_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 3d8d784f792..bec4d63ed6c 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -4,7 +4,7 @@
 
 ROOTFS_PKGMANAGE = "rpm dnf"
 
-# dnf is using our custom distutils, and so will fail without these
+# dnf is using our custom sysconfig module, and so will fail without these
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-- 
2.30.2


