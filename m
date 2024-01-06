Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A447FC46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 22:48:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.4864.1704581331502506020
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jan 2024 14:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XmKVpwrO;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e7c6f0487so643959e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Jan 2024 14:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704581329; x=1705186129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJBHZAkgUjHQbi37up7ud7ARNGzkWdLCCjBqev3gny0=;
        b=XmKVpwrOyTr9RVscpp+MvuSRIK0wFakDQOcDIeTw3Zoy02TxS3S38bwJXoaBuoIRYO
         V7AMTT1tWaLmsMDvhzFO4yBmQZHOv0NNarXFyZBESLsAeVjwIS7pAU+UPiX+E4UnSdkO
         NUQudAznAvZzp/HwBkuJ3HxaAN5joP9EJUjAnsdfrrwGmSU3NOdqPId1TNfI4Wz20wdx
         WsPVH7x7QKEHo04QT6ZEh5K5g+9sbpSz70T3CkOx4/qcKoiuEN4ECG3VEO+n3VuScVDN
         tIuA/6/G99dKxE9YQt6WTh7QBJbvA7jnrswECUnaAUtty73i2Ujsbvec2t5M84t15OJh
         q6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704581329; x=1705186129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJBHZAkgUjHQbi37up7ud7ARNGzkWdLCCjBqev3gny0=;
        b=ib0JNUj0SDsmtWwArtQbv6vN1uIzPcxmnTAzuUlGLwDcKh1eUF7t5x8cffsYtHwPq5
         S3Jscg3EORhJ1J+kp6rJFlf6ThFsZpXN3jpfZE1ZPcF+UuIq+UtfSx6/fcvK95NpMuYx
         mE1iASbrlrfa5ZWW6P2xXNYrohwQntojoc4np+UpUAqjyClfmKwjIkEp27Pez0n7BLCj
         3W7xkq1EXGnQAA9u3pOzE8/iVYLzU7oJnqttRcLgGvet/M3Khfg8GlfnDKEX9/LMzpgl
         Nf6lNWzEqW50+AQHZzZia0VU08KrwZnucxXrL+1nfb+CGcDq7L6nepukGnRbbi8XfZ+J
         HIeg==
X-Gm-Message-State: AOJu0Yxntl0uZG95Ixzmc8ui0uMwHNFgD4bCx6eF2I4H2HQoUQNjShJm
	ixOtWEqeMOlZfrACydy+KW4Nzm2I21Y=
X-Google-Smtp-Source: AGHT+IExSxnyIHIraYm90Vubw6CIQHAIiunNNxnl28twi9rhQBHxJORmVm+mDRS8Dx81c2jAWWkeZw==
X-Received: by 2002:a05:6512:12cc:b0:50e:384c:d6ab with SMTP id p12-20020a05651212cc00b0050e384cd6abmr428180lfg.35.1704581328816;
        Sat, 06 Jan 2024 14:48:48 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id b1-20020ac25621000000b0050e8d5504e1sm641485lff.294.2024.01.06.14.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jan 2024 14:48:48 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] qemu.bbclass: fix a python TypeError
Date: Sat,  6 Jan 2024 23:48:45 +0100
Message-Id: <20240106224845.319201-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jan 2024 22:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193382

From: Ming Liu <liu.ming50@gmail.com>

QEMU_OPTIONS can be empty which will trigger a exception TypeError:
| can only concatenate str (not "NoneType") to str

fix it by setting a empty string.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index 874b15127c..e556a3189e 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -34,7 +34,7 @@ def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
     if qemu_binary == "qemu-allarch":
         qemu_binary = "qemuwrapper"
 
-    qemu_options = data.getVar("QEMU_OPTIONS")    
+    qemu_options = data.getVar("QEMU_OPTIONS") or "" 
 
     return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
-- 
2.34.1


