Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FF5CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:23 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6136.1780698863078199412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dBovAclJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1658825f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698861; x=1781303661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKW4QvfOlDZrOt49jEMnrue6YQnB2qAOj3zUSwmrJ20=;
        b=dBovAclJudNYquik68IfS9IBpfw8dwjk7vWb06F+dKGkU+U/ferJLho3DcUVRfF0NY
         M2ysUMSqok19OHFUKx6wDL/bggO7KuPc1eEGlaO5gSNckgYB14l/D/NAnPfkb9nwKYtx
         rzPl4KFRxFoe+TB9huS6aasYmVarm/OBW9ws0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698861; x=1781303661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tKW4QvfOlDZrOt49jEMnrue6YQnB2qAOj3zUSwmrJ20=;
        b=b4TDKPTvPxQPA5BQSRs24sDA6/iqiWfKfJXuMsEQeExH7K4+ylGVyAx901BThog+6i
         m442SRk0nN8HOJXR/P1oEvw8wfgBQEMddFerXOgbVXTYTADnfFjA5l5+HUGxWcPVWAvE
         LRYv/6doPa45mCe6CSumujubTzgF+uirbjJgAVPQpajfNHoRuYTkBksFJv8d3aJVYRgI
         I4VKx+GdiDWiFUYrh2AygiioKnSLEVPd7B/QgZZi6NMNnJH2IDAxSAjyAst+BfsCq/qs
         iVHjg/fGz4Sa0gHsc2pUHABDcTfjKQtNmq7DrS6Fowgik6M/EAuoRRsW8wAxg6PUBBt+
         PMIA==
X-Gm-Message-State: AOJu0YwvdMlAcPWlHzlRpr59Flu14ffC/f7nxEVFCS4qByoTEVBWzL34
	X1+H69z7ByOLtSMzbO8qST+mO5LMDTgkS6ST/+CxmJPOXWhlc3p6i9udv37b0rV0h+m4Sklff/9
	sBk73
X-Gm-Gg: Acq92OEe7J6MOvy8zHVSRklM4OJBIcSPSfETwfTOOUWE2DXM338oDyKjxwknKi91waj
	jB74iZQWVLXY/Hd6w1s7cEU1WmR7wF5bjuZ+6m4jX3XPB2uVkvPiAMhrBWpTYHq7165v2B2jvPE
	AIP8OpGTEig0Ss2nxqmnPlB4gBfH9YZMJP5ZM44P2uubrGkFoKTaDliCNUgiY95lST1YwP9uf9i
	TlusanavVl8T51zYfCYgt1AnG3cuy6tYG/eknWCWdNh3e4kRMbSJei+hKlC0VnaSe5F4wa0gx2Z
	KGC3Bc4Wzp7fUJPL0xMkzLyOiSmdJeCdkiTPS9VHOjsywI8rLGOg71XJZcgezp5xDQfPBtGIWVy
	NnSYNUGJaIbdu6lfs/c7Z+SczHxdpmJa+gGLpeB33Lb0PMEo3UfwdorncW0DMEw1oit3sq3SYvz
	iIUWVFdiJ0Qz/YBixJ6Oe3PYhi6vG/Iff8rG0t845tHTlCrpolK+JixCS63WPz1JRsns0ief/zz
	CUzeL5g67HJVM8uwLdUKRHEh6I4AeHFgGyNNjA=
X-Received: by 2002:a05:6000:54f:b0:45e:b21e:f840 with SMTP id ffacd0b85a97d-460304ec0e8mr7892994f8f.8.1780698861491;
        Fri, 05 Jun 2026 15:34:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/25] openssh: patch CVE-2026-35388
Date: Sat,  6 Jun 2026 00:34:00 +0200
Message-ID: <f8786d027cdf04072fb5f716135127c334dbea6e.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238202

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch from [1] matching CVE description in [2] and change described
in release note [3].

[1] https://github.com/openssh/openssh-portable/commit/c805b97b67c774e0bf922ffb29dfbcda9d7b5add

[2] https://security-tracker.debian.org/tracker/CVE-2026-35388

[3] https://www.openssh.org/releasenotes.html#10.3p1

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-35388.patch      | 47 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch
new file mode 100644
index 00000000000..d5afe2538f9
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35388.patch
@@ -0,0 +1,47 @@
+From be42fe5ce64f2798048161a891083ef12780ca2a Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 2 Apr 2026 07:39:57 +0000
+Subject: [PATCH] upstream: add missing askpass check when using
+
+ControlMaster=ask/autoask and "ssh -O proxy ..."; reported by Michalis
+Vasileiadis
+
+OpenBSD-Commit-ID: 8dd7b9b96534e9a8726916b96d36bed466d3836a
+
+CVE: CVE-2026-35388
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/c805b97b67c774e0bf922ffb29dfbcda9d7b5add]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ mux.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/mux.c b/mux.c
+index d598a17e2..c841feb79 100644
+--- a/mux.c
++++ b/mux.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: mux.c,v 1.101 2023/11/23 03:37:05 dtucker Exp $ */
++/* $OpenBSD: mux.c,v 1.113 2026/04/02 07:39:57 djm Exp $ */
+ /*
+  * Copyright (c) 2002-2008 Damien Miller <djm@openbsd.org>
+  *
+@@ -1137,6 +1137,16 @@ mux_master_process_proxy(struct ssh *ssh, u_int rid,
+ 
+ 	debug_f("channel %d: proxy request", c->self);
+ 
++	if (options.control_master == SSHCTL_MASTER_ASK ||
++	    options.control_master == SSHCTL_MASTER_AUTO_ASK) {
++		if (!ask_permission("Allow multiplex proxy connection?")) {
++			debug2_f("proxy refused by user");
++			reply_error(reply, MUX_S_PERMISSION_DENIED, rid,
++			    "Permission denied");
++			return 0;
++		}
++	}
++
+ 	c->mux_rcb = channel_proxy_downstream;
+ 	if ((r = sshbuf_put_u32(reply, MUX_S_PROXY)) != 0 ||
+ 	    (r = sshbuf_put_u32(reply, rid)) != 0)
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 9267bbd2c94..a1b5d4a5535 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-61984.patch \
            file://CVE-2026-35385.patch \
            file://CVE-2026-35387.patch \
+           file://CVE-2026-35388.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

