Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86F9C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 11:23:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.17401.1745925781078469246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 04:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hyNVRevf;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22c33e4fdb8so61784085ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 04:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1745925780; x=1746530580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRzHn+CG6yqrjbF8sK7/9ongvr5dv8hfr+WHtaNT8Ac=;
        b=hyNVRevf9lBaRO29NDTyYgaW05A9be8UbkbM67BYshqSGTGZ5YAyT7mQD66/Ewmgx6
         IiyCxHTgstrYRjAdTpUF+U1Zbd8z3sS+WqPfXLFFisvZmPrOnbBkvv7bH+GB/Iz+4pO3
         mxy6iwfzYrkAPJZCtmGAx8XHU4ChZuraVWlcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745925780; x=1746530580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRzHn+CG6yqrjbF8sK7/9ongvr5dv8hfr+WHtaNT8Ac=;
        b=xKHavjIbFieTPi69p/uiZle935n/P5GPFH1fKbwwZ5inJVl5I1vvYN2UEFt4iYBI7L
         DEveez1wQDKaRnVK/REImyPFhl6JGeTboCW73KoLI94byDTZh+hHlBNLbjreetg5MCl0
         5ulrcIwofKcr8AMGNaPhcI92M25789LQNwRUC5gckNHLPuuliJYP6Uh/9fI5WPFxvy/+
         6laGEYd7lCYLJPZmyZrlLj+CoEUeUMKDTaKFDAxKfabRBjOO6YOm/jddDP9ZqL+K3f8k
         uEiY0bh57HgajmUQizNG0CxQExUDAjkN+537a/jZ8HIpSaCCinH5bC07QvpYD+sFw+h4
         E2Nw==
X-Gm-Message-State: AOJu0YzjREl9awrRwZEmDTzsjAMF4SieHL1e25NUEVC6zv7u3gejBKI4
	5zSujD+KwVvPUCz2Op7DtnXpe1hCV365UkQPhLfvnHhp9/U0JRSEkidLuzIUEF+x1WAvsjWuzan
	E65M=
X-Gm-Gg: ASbGncvs34oX7BB67qQNqMWSUJUO1jP9Q2FL/cZLKFM8/B7tAMDJnEk9aLQtJ7Q8+bY
	tcLcyhaXR1ZSr/2diT8sJaCFYaVJtkLOIzC14Iu7vfYtLRnqZXPqT1SmZcRPtsbbf99Woqqe7Rn
	J1Ngbrlm/EoLxj/uWOO6+3CnAguagH2J3m/bo7XSaJHg/RIuVpx3prVmBSR+JkSlHhG/vhgPTsL
	ut+f71B8V5f3HXulBYSi7PTHC749pWv5GgobR6IeflRt3s1Osm8Xr6hBsDbIjxmAX8UQdexHhOn
	DMndgFSX7+/6nFK1y9ztlYWIIWB+adzUNJBuntOPhKQiZ4GCAa32
X-Google-Smtp-Source: AGHT+IFx1/Qd4ndGbudDRtblj+jLFc+BqDevILD+sZNLe+wJDPD/n9Xi409LK8H+nPZuzdIUjNLmew==
X-Received: by 2002:a17:903:1aaf:b0:224:78e:4eb4 with SMTP id d9443c01a7336-22de6066eb6mr44874845ad.39.1745925779645;
        Tue, 29 Apr 2025 04:22:59 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.224.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm9107266a91.12.2025.04.29.04.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 04:22:58 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] openssh: Fix CVE-2025-32728
Date: Tue, 29 Apr 2025 16:52:43 +0530
Message-Id: <20250429112243.106003-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 11:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215658

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/openssh/CVE-2025-32728.patch      | 44 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
new file mode 100644
index 0000000000..d992f78ed7
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-32728.patch
@@ -0,0 +1,44 @@
+From fc86875e6acb36401dfc1dfb6b628a9d1460f367 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 9 Apr 2025 07:00:03 +0000
+Subject: [PATCH] upstream: Fix logic error in DisableForwarding option. This
+ option
+
+was documented as disabling X11 and agent forwarding but it failed to do so.
+Spotted by Tim Rice.
+
+OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367]
+CVE: CVE-2025-32728
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ session.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/session.c b/session.c
+index e67d24d..625e97f 100644
+--- a/session.c
++++ b/session.c
+@@ -2182,7 +2182,8 @@ session_auth_agent_req(struct ssh *ssh, Session *s)
+ 	if ((r = sshpkt_get_end(ssh)) != 0)
+ 		sshpkt_fatal(ssh, r, "%s: parse packet", __func__);
+ 	if (!auth_opts->permit_agent_forwarding_flag ||
+-	    !options.allow_agent_forwarding) {
++	    !options.allow_agent_forwarding ||
++	    options.disable_forwarding) {
+ 		debug_f("agent forwarding disabled");
+ 		return 0;
+ 	}
+@@ -2568,7 +2569,7 @@ session_setup_x11fwd(struct ssh *ssh, Session *s)
+ 		ssh_packet_send_debug(ssh, "X11 forwarding disabled by key options.");
+ 		return 0;
+ 	}
+-	if (!options.x11_forwarding) {
++	if (!options.x11_forwarding || options.disable_forwarding) {
+ 		debug("X11 forwarding disabled in server configuration file.");
+ 		return 0;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 54b4d238eb..345051c8dc 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2023-51385.patch \
            file://CVE-2024-6387.patch \
            file://CVE-2025-26465.patch \
+           file://CVE-2025-32728.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.25.1


