Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBC2C53200
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7143.1785054616611097516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1+vyXFmQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so19392985e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054615; x=1785659415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/bmvOhS7hWuDqtZKpL4QQxP4IG4heKQ8vH6ILyZrl9c=;
        b=1+vyXFmQLNOTxxwCf9rvNz9whlLjOwoQIQoBQlcfPkSHK909EZWqiYF47o6gge1hlx
         Mq4MeMkc+f9JxpMGWP/nZ2Zce+yr3RSnYcxvFcHgb7nqC+j4SeRNU4D0xDnC5+qjXmG1
         47nUiMAGSp7SIAlysTcaC1I0g8AYb3SKKKYZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054615; x=1785659415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/bmvOhS7hWuDqtZKpL4QQxP4IG4heKQ8vH6ILyZrl9c=;
        b=SBg4xQfC9N2uSmySvzA7/UwhydTl6XvywndzFhfU7Q0Wmp+Lr+NO0T5MRxTvZjcUxB
         CJnmmq0HvW16S0KGsQxSXChB/7OL+aDjLp///jZk1ikXmH0zA/iNfEV7YpOKcnmeDCet
         5+Dz1bMX0ZoUtyn7lXneV0QmFtSXvC2naJa/MC28LQU7fVQqN2ZaLb6BVMpKNoVJd4ev
         DvZoJiMh7UdAqwRXzxDT27OqtM/hqlfrYD5TgJ+qLaU5OgwgTLi7jMDh96T4/WGPMdPh
         H3JjuacZ/wb5jIZfcEwauzdd9xcVu9p0sPcy5jFaoZQ4xm7o3hntxgNPHQPzhEgmQLO8
         +mEQ==
X-Gm-Message-State: AOJu0YyY7juvTazFNM/CFLn0DouowZk4aLzMF/SpS5vcnl8njXj8KKk4
	D3cS11CY0T6d8TKBwvlDgmbzMBbjLDVTpMduyzQh7AbwJtTha5G7vpcfCvpRdPoOPZnNicx2Xap
	05HxZrJ4=
X-Gm-Gg: AR+sD13LNfW3f4CgJCHZajbrTvkOxLLIlxUK4rK4iSmg2ZjeqvdlB9VNtlF//h5Pluo
	AvXP0IotEpRXXjnj4FEFk0aTjRD0KWRBC0MnVN+BntiNPANuCexqCgyTx8QmiO3Tu0pRJ1tcaVb
	UxwTgnICD++LMyTkknqwIR1xGkBb+QSK0FXZFUc9Itoab+eJa+fVLzRkY5GVuSjovkk9kNgng0k
	Nv9A8K2mQoVXreLZ2nlACnr1qmzcmz2egrhuNZrHFZnJ5lROIazUu0JGeWsQA77TkmDP2dWfPSH
	VcwBC4N62yIYUOedd7UI5HtPo0cq0LoV6fJ6oj0Rw9zhs12olqYyNGnaO79u2EIsHDNsPAsdwaa
	fZ21lBa7211FemPnta933Zejbjl2guOGKkWLbbb11Ts1+GCwu0T1IZ3OMMXK9e2Gi0c71hVPifA
	V9GSwqbwZfeyDqTmp1cCajGLXoI9MguDzeOxh2d3sqDBbiaXQKqaer7aNeHHRDDovPe6ZtDrr30
	h8VlQ==
X-Received: by 2002:a05:600c:3216:b0:495:4d2e:53d9 with SMTP id 5b1f17b1804b1-496b56f323fmr30036065e9.12.1785054614814;
        Sun, 26 Jul 2026 01:30:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/31] openssh: Fix CVE-2026-59995
Date: Sun, 26 Jul 2026 10:29:33 +0200
Message-ID: <9967952fbfcb130477521324bc9899dafc277439.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241991

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4 backport for
CVE-2026-59995. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-59995

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59995.patch      | 42 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
new file mode 100644
index 00000000000..9b6fee198ff
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
@@ -0,0 +1,42 @@
+From b340eaa274a7e7dffea03bcb62169249bbddab37 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Mon, 29 Jun 2026 01:47:21 +0000
+Subject: [PATCH] upstream: avoid download to server-controlled path when
+ performing
+
+download on the commandline. From Swival scanner
+
+CVE: CVE-2026-59995
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1b39f39657d2e58f8ec57341581a39bbf0be645b]
+
+Backport Changes:
+- Retained the Scarthgap sftp.c OpenBSD revision identifier because the
+  10.4 identifier does not describe the older source baseline.
+
+OpenBSD-Commit-ID: d1b2c44305fdfe6d51eed9ecc727e59478bf311f
+(cherry picked from commit 1b39f39657d2e58f8ec57341581a39bbf0be645b)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ sftp.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/sftp.c b/sftp.c
+index c609b4153..487e53976 100644
+--- a/sftp.c
++++ b/sftp.c
+@@ -2268,13 +2268,8 @@ interactive_loop(struct sftp_conn *conn, char *file1, char *file2)
+ 				return (-1);
+ 			}
+ 		} else {
+-			/* XXX this is wrong wrt quoting */
+-			snprintf(cmd, sizeof cmd, "get%s %s%s%s",
+-			    global_aflag ? " -a" : "", dir,
+-			    file2 == NULL ? "" : " ",
+-			    file2 == NULL ? "" : file2);
+-			err = parse_dispatch_command(conn, cmd,
+-			    &remote_path, startdir, 1, 0);
++			err = process_get(conn, dir, file2, remote_path, 0, 0,
++			    global_aflag, 0);
+ 			free(dir);
+ 			free(startdir);
+ 			free(remote_path);
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 8f44d4b9878..37f4dc20dd9 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-59999.patch \
            file://CVE-2026-59997.patch \
            file://CVE-2026-59996.patch \
+           file://CVE-2026-59995.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 

