Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E50CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:11:18 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.166619.1712754670493697911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KESyX47y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ed2dc03df6so2858190b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712754670; x=1713359470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPv0w3RSB36SeXxmiWi1BExfmamHxrEV7pCHcYjXP9Q=;
        b=KESyX47y+fKmVJ5JrxZRdVjSG9xla5cMQPltWyG0KYRgskuhmzPTUpol1BqhZjN/O3
         qjPqjpt0iO/+iaY8NF8CYsqJwVxXY6Iv2IivOx8aiTTQBfGAD1M2xZaNGuJfj2wJDJbS
         udCnsuDiU6U/wgek5Pt3/eBritbR77nHAUWkgygn0wE1EyjjPh6sXyvSIiwPPFYjSNJp
         e5elqWrc4BDtQBWLEwUfX2zcD5I3l9jUCLgegR5WDnTJnkhJP7XnJs9FVpZm+1fsXttL
         DuSjtkvh4/luHFeF7tYf85NCi55pPfebxsildg2YQJFVDTe3hPq39oxAmmGtDv201T8Q
         fSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754670; x=1713359470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPv0w3RSB36SeXxmiWi1BExfmamHxrEV7pCHcYjXP9Q=;
        b=qjpWy8qGiMIi/F9XPGh9r7BIuSySP1eUq7Rx4X7Z1S9f77xk71/b0AN3MPZGwo7llb
         1lygAIBMMqMVldw4/d/ihLspgBNMmbhpYxwdFwm5w5HGk9qncKmX9Ok0nCDbeMwyAV+C
         Gx/BWk2suylHlVuxTyLnYWT7dZFgsd6tiWgAcDakveKJnTlE/047c7jvdGm9ENcRyp5E
         Y6kfOtYalvYpWk2qpTOCKF+25QTkUl7Ao8dAlEPbyXABD5ep3O8/Ttveog6w91oAECb7
         6Vc52Y7XcENISEf85hn+EkGNR1vhIcIznqMWqMnDaX0gv/kGZcqRP3p75ui1yDtjRlH7
         lSdA==
X-Gm-Message-State: AOJu0YzjRihlPhdhqDdJDnG6CFN9EV6NuwS9QVCKA/nHzyavRFDS1Roh
	B+Bn40peRviXSAHgOrHekSA7HrKF8d+fcd70S1l7anQnKFwoNaVQMmFfFBmtiFdh7BiZVhVdHQh
	diig=
X-Google-Smtp-Source: AGHT+IGBrbohS9t+CHjOqHoAU/vT0HPL1/CxKOd+sMaNUy889zXXklxJujecOPCo4T0gtmJnxiycTw==
X-Received: by 2002:a05:6a00:1915:b0:6ed:1c7:8c61 with SMTP id y21-20020a056a00191500b006ed01c78c61mr2876662pfi.12.1712754669770;
        Wed, 10 Apr 2024 06:11:09 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b006ed0199bd57sm10054887pfd.177.2024.04.10.06.11.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:11:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] xserver-xorg: Backport fix for CVE-2024-31081
Date: Wed, 10 Apr 2024 06:10:56 -0700
Message-Id: <bfda6a90f99f3051172e28c4a6c049d745ed5cb8.1712754495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712754495.git.steve@sakoman.com>
References: <cover.1712754495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198096

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2024-31081.patch         | 47 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch
new file mode 100644
index 0000000000..d2c551a0e5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch
@@ -0,0 +1,47 @@
+From 3e77295f888c67fc7645db5d0c00926a29ffecee Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 18:56:27 -0700
+Subject: [PATCH] Xi: ProcXIPassiveGrabDevice needs to use unswapped length to
+ send reply
+
+CVE-2024-31081
+
+Fixes: d220d6907 ("Xi: add GrabButton and GrabKeysym code.")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/3e77295f888c67fc7645db5d0c00926a29ffecee]
+CVE: CVE-2024-31081
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ Xi/xipassivegrab.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/xipassivegrab.c b/Xi/xipassivegrab.c
+index c9ac2f8553..896233bec2 100644
+--- a/Xi/xipassivegrab.c
++++ b/Xi/xipassivegrab.c
+@@ -93,6 +93,7 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+     GrabParameters param;
+     void *tmp;
+     int mask_len;
++    uint32_t length;
+ 
+     REQUEST(xXIPassiveGrabDeviceReq);
+     REQUEST_FIXED_SIZE(xXIPassiveGrabDeviceReq,
+@@ -247,9 +248,11 @@ ProcXIPassiveGrabDevice(ClientPtr client)
+         }
+     }
+ 
++    /* save the value before SRepXIPassiveGrabDevice swaps it */
++    length = rep.length;
+     WriteReplyToClient(client, sizeof(rep), &rep);
+     if (rep.num_modifiers)
+-        WriteToClient(client, rep.length * 4, modifiers_failed);
++        WriteToClient(client, length * 4, modifiers_failed);
+ 
+  out:
+     free(modifiers_failed);
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index d6c6c5bd45..ade250542f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-21886-2.patch \
            file://CVE-2024-0408.patch \
            file://CVE-2024-0409.patch \
+           file://CVE-2024-31081.patch \
 "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.34.1


