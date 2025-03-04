Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A399C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 04:07:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.14800.1741061241509014899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 20:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kRNuOqsE;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fef5c978ccso3057837a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 20:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741061240; x=1741666040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eiupJiKPlG8eH/Q9/jSvjciO/XTyfaphplrC7Ma0Vlk=;
        b=kRNuOqsEiY/Z+6LrhriV9aN90GzugKqCxWNfjhXlWzEf2MMDf8QZMrc9pY9TfA6eBu
         bOgVM0wdEbdZxYEUKdsTP9wSwO8MTc4TnmV7PWz2VurNRHHXEC2Knl6VHgLV0ryg1iqH
         sDubKNkPnnK4HKJY6WOcAv7NYP5EXVeEIGQrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741061240; x=1741666040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiupJiKPlG8eH/Q9/jSvjciO/XTyfaphplrC7Ma0Vlk=;
        b=btpxK0bplK2hcUOs8W4dBuC+En2NeN/4O6yGXLiiYk5TA2n1zZ8+vmkyjWEY/taNBA
         Md2SIJgQzy15W1JjufR41BbFErOPSRTdRjTuF1WkwRlz9Kuj95eV6xazEvxXXGYAkEAR
         dCgkbMlrV6PLE2vGVEmE2Dp41CLgycTaRaAjAum/quYiI+Qiw4PEI50HjBNe9oHxyyqk
         xr8/FCh80OWTTejHHGZ/T+hhO4RKyMsbUJsDzX803PYs2vSReh0g7pREZ1gqYc3bVDmi
         cerNmr27MkrKkeT/u4RGo0Pk2c89cxTg2vD5QdYW2TiDBzFFLjNAG4GJ3Ury0/vWYCHj
         mbqA==
X-Gm-Message-State: AOJu0Yw/fOBs3p2SN0Zm23AkyZlJCyd7hoAsrve8ZZXBzQIJrlPgod4d
	LkNc9nPOL2rQvdChTMVigMIJVjsmd6CbH/G7xK6kp5mDs+mH/bL/n48YcEyABJTHwtu0COWqjDm
	07So=
X-Gm-Gg: ASbGncsG6pwBMLfuQ6kEdq23JHaw0l1zMLh6FR90CwM6RzzzCc+FdwoXEB+YvefOrcv
	oGnRZ4fLr9mi4GEhV5IU4u0Apls9gp1ySrugpOxFGE0p00pqgyUrvsfmeNNFCsnfG8b88IwiYmc
	ZC6RTY97n7xL7IA+oTcIQzBtDvHUrD485S+PCOBuOUURkFTrgsY0Ry+1pMiVUk8GeBRAbAtyuV/
	LLkZmP7IxcPyCuaFeXwL/dVBTKi+IJDZDbP5fuO4o9tNjxSjKT0QRNf6CTPJ6QT+U1Z8TF65ZiV
	Z2L1om+BWK5mtpvYv+7WyexF9Okd78B1VjqxxqgPXfhkPwCKH5nwXA==
X-Google-Smtp-Source: AGHT+IHVN/zn2Lu3rN0VN6UxFNo/QVbeRQaOdeBrDBqNaY0+NuiQr+k6a4qciW0gug7Fl6XToB844Q==
X-Received: by 2002:a05:6a20:7343:b0:1ee:b8ec:7062 with SMTP id adf61e73a8af0-1f2f4d1a451mr21539091637.25.1741061239023;
        Mon, 03 Mar 2025 20:07:19 -0800 (PST)
Received: from MVIN00020.mvista.com ([49.207.225.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736290957f1sm7230765b3a.67.2025.03.03.20.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 20:07:18 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] openssh: Fix CVE-2025-26466
Date: Tue,  4 Mar 2025 09:36:58 +0530
Message-Id: <20250304040658.36572-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212227

From: Vijay Anusuri <vanusuri@mvista.com>

sshd(8) in OpenSSH versions 9.5p1 to 9.9p1
  (inclusive) is vulnerable to a memory/CPU denial-of-service related
  to the handling of SSH2_MSG_PING packets. This condition may be
  mitigated using the existing PerSourcePenalties feature.

Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/openssh/CVE-2025-26466.patch      | 38 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
new file mode 100644
index 0000000000..27b2fa7143
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
@@ -0,0 +1,38 @@
+From 6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:12 +0000
+Subject: [PATCH] upstream: Don't reply to PING in preauth phase or during KEX
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: c656ac4abd1504389d1733d85152044b15830217
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2]
+CVE: CVE-2025-26466
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ packet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/packet.c b/packet.c
+index beb214f..aeab98c 100644
+--- a/packet.c
++++ b/packet.c
+@@ -1773,6 +1773,14 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ 			if ((r = sshpkt_get_string_direct(ssh, &d, &len)) != 0)
+ 				return r;
+ 			DBG(debug("Received SSH2_MSG_PING len %zu", len));
++			if (!ssh->state->after_authentication) {
++				DBG(debug("Won't reply to PING in preauth"));
++				break;
++			}
++			if (ssh_packet_is_rekeying(ssh)) {
++				DBG(debug("Won't reply to PING during KEX"));
++				break;
++			}
+ 			if ((r = sshpkt_start(ssh, SSH2_MSG_PONG)) != 0 ||
+ 			    (r = sshpkt_put_string(ssh, d, len)) != 0 ||
+ 			    (r = sshpkt_send(ssh)) != 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index a8ba67e360..ea5face097 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2024-6387.patch \
            file://CVE-2024-39894.patch \
            file://0001-Fix-missing-header-for-systemd-notification.patch \
+           file://CVE-2025-26466.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.25.1


