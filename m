Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765CFC531D4
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5531.1784741050970209589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hwSgtiIh;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495590dde14so38695265e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741049; x=1785345849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hxcUQ+JLXYcAmNC661rjRNPor+j/9u+doopY7l+xCI0=;
        b=hwSgtiIhmki2+7rB2jU9mKR30778O6/SrsOgVD9vbf5v96gduFt9mc27s66GuE8usV
         /xyCeapEZhfJfe1+OaqWwKLmaVWE20q+2qgIVHKgmyhpKWkjmWJpsK4kMxDpP6FGFp/V
         1oITa/VOeM/8270FiNTTVFpuIfgsQui5u2fTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741049; x=1785345849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hxcUQ+JLXYcAmNC661rjRNPor+j/9u+doopY7l+xCI0=;
        b=gtLRH9H1Y2fGneNXPoWU47G78PsZ4RgK+VZ5CDRQcmChurlr93RxaAac8r6OWKEVxf
         FMUxrg/oJNuP2d1ZlY+Ssi0K3umw5+/5+sARH9vKpbNFij33NGYP5CSgBrL3oGXHq3LC
         hyPCGWA7Sk2JTU8RIYU96jTxInJVS7teL/SA3xM87kuB/vCyGrLQsCDOmG/+VCzm1Y/C
         7LuqrjV3FOX9f1S8VxbWBXoXrWhfxXIrbx0E07Q1kH0YyvaaFc68YnVoY4HAJ8oMzJQh
         AbIf3TmRuVBbcRFai/nnYmdr+NyMIag2ZOanJkNqcdCIkXAjAWpthxh2j8ipVpchwYwD
         m23A==
X-Gm-Message-State: AOJu0YxaEizKuJsMcxzVOP/IkdaV+QfpznSdMBscTxQp4KNInuRBSnCC
	Rxnf8WTx5vOnSp6IWG2Mc61kuroiX4lSNVZqKVculOpMoh+3/ftCWlZVOV6RfpM8byg90OxtpYH
	ggcbRzQw=
X-Gm-Gg: AR+sD13ViU/O1bW5za1hIcQeQVyZtkBFsoVf52d+Ot78mP5D3sMTns3xtxklYi2cOdy
	OEaGXjtWDdxMCDLDIPDpRjUh59DIyzWEH8zuGfS1ZkKAKdW7sLxXyk3eEXnm3wkvmW+vcU5L5Iz
	WuzNgWJeozirGeRzwi5tMcHHytyzMEg41Bt2YqZXxwz7WKbTVh7Ev5H1lTWpv3l0cxOyI1ldoZG
	ItZAP/t7p76CnQbDPxj1oJjZXYrVCHf1TT2qwfz2x+Lveg76DQCjH5u8X9wqaB0Fg2rIJH/Q+bi
	Bnvt7cQ+9a4CaVmc8ftTVgGL8FpBda6uXzHnm7E3kIadI9h38HcVTQLKOTpBrEzJ/LoLIJjDUgG
	ht9b+00DLQb+VlF/QbvXXM4Q+C/J9PXn9dMXPQRTw7BWNH6rQOQJRUObq5I6XgWYfCkX7wnjQuD
	6wD/c9OKqARbck7GfF8WQTJL8cFqr1dVbQI12XFVRJXO0gSkBjkOsZLkNjfun+hE8pG6eqNUp23
	BoU65qDxbzg
X-Received: by 2002:a05:600c:138c:b0:495:6788:c229 with SMTP id 5b1f17b1804b1-4956788c359mr84542665e9.4.1784741049213;
        Wed, 22 Jul 2026 10:24:09 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/27] openssh: Fix CVE-2026-59999
Date: Wed, 22 Jul 2026 19:23:33 +0200
Message-ID: <ff1c51a47cf2b000ee7b4e100e0d6fa659ed6daf.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241729

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream OpenSSH 10.4p1 backport for
CVE-2026-59999. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753
[2] https://www.cve.org/CVERecord?id=CVE-2026-59999

Signed-off-by: Devansh Patel <devanshp@cisco.com>
[YC: patch referenced at https://ubuntu.com/security/CVE-2026-59999]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-59999.patch      | 38 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
new file mode 100644
index 00000000000..5907a991b9a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
@@ -0,0 +1,38 @@
+From a83dd105dc407d95c42140ea6f04a1e247aaf2f9 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Sun, 31 May 2026 04:47:29 +0000
+Subject: [PATCH] upstream: DisableForwarding=yes didn't override
+ PermitTunnel=yes
+
+Reported independently by Huzaifa Sidhpurwala of Redhat and Marko
+Jevtic; ok markus@
+
+OpenBSD-Commit-ID: b5c13f0746cf079b21f8deba47407fad49ccbf4c
+
+CVE: CVE-2026-59999
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/8dfe7ed6e2fd988de08df508355a196b956b2753]
+
+Backport Changes:
+- Omitted the upstream OpenBSD revision-only hunk in serverloop.c and
+  retained the Wrynose OpenSSH 10.3p1 revision because this stable
+  backport carries only the functional security change.
+
+(cherry picked from commit 8dfe7ed6e2fd988de08df508355a196b956b2753)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ serverloop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/serverloop.c b/serverloop.c
+index 8e63480ec..42c3ce9fe 100644
+--- a/serverloop.c
++++ b/serverloop.c
+@@ -523,7 +523,7 @@ server_request_tun(struct ssh *ssh)
+ 		ssh_packet_send_debug(ssh, "Unsupported tunnel device mode.");
+ 		return NULL;
+ 	}
+-	if ((options.permit_tun & mode) == 0) {
++	if ((options.permit_tun & mode) == 0 || options.disable_forwarding) {
+ 		ssh_packet_send_debug(ssh, "Server has rejected tunnel device "
+ 		    "forwarding");
+ 		return NULL;
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 8669d080b6e..53704a0cc7e 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://run-ptest \
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
+           file://CVE-2026-59999.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 

