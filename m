Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCF6C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:42:56 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.16170.1672594974455007334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4YMlAlxh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso24158076pjb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mRJtSoTeuqBaxXQe4yr5an1DqvD1VO257Ibxgk3xP8=;
        b=4YMlAlxhiBH1LqxsAkq47FayjeptZyOXapNsVSoC2RdLi9czqRSgX3Ip6qtdIWlx3o
         /XrjeK+ky7oqprYECh3XydMh3YRo41gM0WJY9rWgHr9T1mQTmmKLTMHVE723QqiQFGtm
         aPlO7aKSjZWIV0c8RRt7e16tyC4UfqqwEu7Z3uSGzTXQxsvZZT7yKIeJCFUkI+T284xh
         EMTmaxPgrb+lxgJ9Rf02WazKYKZt2S+mzXO5lIk7bwhIaDoV0uj46k0MO1/9OT6FoaxW
         3vu6uurw2QXlk44Y/MiKB2pLS2ms/fVNsQTF1kXnIvYrbTvcRP36emtXOUqI8prnpXsp
         7bFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mRJtSoTeuqBaxXQe4yr5an1DqvD1VO257Ibxgk3xP8=;
        b=hTucCN0ULHyoQkZL6iYCXYW1j24RBhqTHweffhjQ+bbnIh1FUtTRaCzJlvtG2MSryJ
         1FYRRdLWj3DbCw/TZPS1r6bn28p1GgUpyUCH8vjR2vozGUhwxW3wKpHCpjp8+xN0Hef2
         ThOKZpQ65M3fte6sU2v+0ejOf/AmQuVSRHmk12/r0E7fzG7ICCCj2ivphLDx45RRPulA
         NbxALKIaNzU89rOhlPoFnZkVIVGGWj0F/7MtMM0QPToLJe5BOq8+rIFenKiCJjr/LTqz
         tVpK6Ztv9Vtl8zG59tnagCxAOni6UJzZmAXiDyrcyf7j+aQ1LlsRcwO0z+T+T4D2Ly28
         zitw==
X-Gm-Message-State: AFqh2krLNld0fuT/+dN9xIqahOhS/Cxxji4q2QuQLHvNg9yLnG7ZfZaS
	c+N6iGe0nBdXEBHMRxxAJUE6oTT5KOAnkGRaNvg=
X-Google-Smtp-Source: AMrXdXsoSWrDFbmAhytoCPIf56vtGPcRdJp5eb/Wk7kZHxfRDnaH8rQ9/nGXvZLS9GkgQOfD34M7lw==
X-Received: by 2002:a17:902:e944:b0:189:d8fb:1523 with SMTP id b4-20020a170902e94400b00189d8fb1523mr46332040pll.36.1672594973503;
        Sun, 01 Jan 2023 09:42:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.42.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:42:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/18] libx11: fix CVE-2022-3555 memory leak in _XFreeX11XCBStructure() of xcb_disp.c
Date: Sun,  1 Jan 2023 07:42:20 -1000
Message-Id: <b379ebe9cab3a8abcd9ad39a6e7d3bc041fa06f1.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175222

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/libx11/CVE-2022-3555.patch       | 38 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
new file mode 100644
index 0000000000..855ce80e77
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
@@ -0,0 +1,38 @@
+From 8a368d808fec166b5fb3dfe6312aab22c7ee20af Mon Sep 17 00:00:00 2001
+From: Hodong <hodong@yozmos.com>
+Date: Thu, 20 Jan 2022 00:57:41 +0900
+Subject: [PATCH] Fix two memory leaks in _XFreeX11XCBStructure()
+
+Even when XCloseDisplay() was called, some memory was leaked.
+
+XCloseDisplay() calls _XFreeDisplayStructure(), which calls
+_XFreeX11XCBStructure().
+
+However, _XFreeX11XCBStructure() did not destroy the condition variables,
+resulting in the leaking of some 40 bytes.
+
+Signed-off-by: Hodong <hodong@yozmos.com>
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8a368d808fec166b5fb3dfe6312aab22c7ee20af]
+CVE:CVE-2022-3555
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/xcb_disp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/xcb_disp.c b/src/xcb_disp.c
+index 70a602f4..e9becee3 100644
+--- a/src/xcb_disp.c
++++ b/src/xcb_disp.c
+@@ -102,6 +102,8 @@ void _XFreeX11XCBStructure(Display *dpy)
+ 		dpy->xcb->pending_requests = tmp->next;
+ 		free(tmp);
+ 	}
++	xcondition_clear(dpy->xcb->event_notify);
++	xcondition_clear(dpy->xcb->reply_notify);
+ 	xcondition_free(dpy->xcb->event_notify);
+ 	xcondition_free(dpy->xcb->reply_notify);
+ 	Xfree(dpy->xcb);
+-- 
+2.18.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index 72ab1d4150..ad3fab1204 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://CVE-2020-14363.patch \
             file://CVE-2021-31535.patch \
             file://CVE-2022-3554.patch \
+            file://CVE-2022-3555.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.25.1


