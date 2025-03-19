Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ECDC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:10:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.8831.1742393437699135687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vo8wy54/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2255003f4c6so124230645ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742393437; x=1742998237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTSHHKUrFgQ7nL6V05aNe2OLt6dKrBmP/ON4EaQm4NQ=;
        b=vo8wy54/MOXrIlLSOdd1Sq7bHOCfv6oq9eqPev6LSC72QEz4G7z1hj1eB+g1GZJ/gE
         4zoDqMUGW0jDQn2OdyLk6K9wa7+yiQI7azv1TAhXyqiZ3GFNoiYdo1H/UOnT60l/cK0i
         NnoTamrgh4H1ssc7Ke/MaaOy3JMRBz+3Vag054WcLnXnS7SsptU/1rDwGLL4RcErvbW9
         7vbdXhb/lHUJNGQFyyVusBKBOhD4J74AH5G25xtJ6o/pnMWm5WwCVRDFvEx75EAdvlTF
         8Isc5C48B/uiplXS/ziMcos++JnM/+LdwCS3gSAA7ZgGrkjw2/57o7ZeA5nefbwjbjR/
         jupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393437; x=1742998237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTSHHKUrFgQ7nL6V05aNe2OLt6dKrBmP/ON4EaQm4NQ=;
        b=hRRMmAthBV/v7TTHlk8EMFx6Sp/hs0zkmH4H0noEk0PVkdWW/12e9mdfH0OS5qELGL
         6ptHBjb46vTGRUw6m1OSBrTHV69mMQrULdMeArN84avoX+z2oQFQhkfcjxjYJ/5PHF48
         Lr0hMy39DN0Tq/9nLiemCWBFPbI3uzlnbwhO40oTRliAEJ0eZ5w/a6Vyk6m+XnMPhS1d
         bVRS46R7cDtyCde2pS1VsxhEnaFdzLlxR7Rp73KX9v3WOkBmY5FGByYN3Np/R+U/Rqr+
         6U2fZt+EAqD/cVtIPxMhU8NivSDRBrNQSBtxLVs3W0E33k/ZackQtUzvP4Sa4LTH3cJE
         JJ0w==
X-Gm-Message-State: AOJu0YyadcnSp+Uv9u3JWa9UPy/C0rLTkUzecae8aSliS7PquhrTN8t1
	UtxdqcX+24s7lHBu+3ZXOAD31+s3LAULlhgfNodT7bnHpwu2rnrKnIreny5lvH9wRNY4iGzFdlC
	P
X-Gm-Gg: ASbGncsScQBGvKp9Mmk6hs9xWtPEJvO844pd4NSCeWdnL2DGvvLvSEaD+zCmfaUTFHC
	1U7Td8vZFSwEowgTFeyHfwD7Dh1qF4FlvBYFORljecW6JeDLmXn9Bnv1lZswibwabQth86160pz
	uXG157eHhDtYQe1RsQkyjD2KJ7CRPBwp6J9BrK6OAcJ3ECSXXUrqd1MxYZDhG2wZqYLnd8Y/WEq
	ZxnkyEpj+kaRe7U7Umg4s/XDOYfKhWRuGCKgUF2MCsL2WIvaOrVyU88rWPs7jQ7d3NcJw8vs+1+
	uUmKHsNExUDxBsT23Fb1Vg07Dt1KZ99ZSr9e5RFbRN9fYKA=
X-Google-Smtp-Source: AGHT+IFSDZLF+M426ATu7L7zEGaFvqZG8+WWCOH3rqC8RCZGROfwqUhJkjOA96O9exlTfdplGKYg0g==
X-Received: by 2002:a05:6300:4046:b0:1f5:6a1a:329b with SMTP id adf61e73a8af0-1fbece41ea2mr6067667637.32.1742393436740;
        Wed, 19 Mar 2025 07:10:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b10e1sm11557214b3a.165.2025.03.19.07.10.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:10:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 1/4] openssh: patch CVE-2025-26466
Date: Wed, 19 Mar 2025 07:10:15 -0700
Message-ID: <ec3912dcaaab85f1ac8907aa5b0b536c32540ff1.1742392880.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742392880.git.steve@sakoman.com>
References: <cover.1742392880.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213335

From: Peter Marko <peter.marko@siemens.com>

Pick commit:
https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssh/openssh/CVE-2025-26466.patch      | 36 +++++++++++++++++++
 .../openssh/openssh_9.8p1.bb                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
new file mode 100644
index 0000000000..1c81515638
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
@@ -0,0 +1,36 @@
+From 6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:12 +0000
+Subject: [PATCH 1/2] upstream: Don't reply to PING in preauth phase or during
+ KEX
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: c656ac4abd1504389d1733d85152044b15830217
+
+CVE: CVE-2025-26466
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ packet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/packet.c b/packet.c
+index 486f85157..9dea2cfc5 100644
+--- a/packet.c
++++ b/packet.c
+@@ -1865,6 +1865,14 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
index 83145dbd18..3d6cb9f245 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-Cast-to-sockaddr-in-systemd-interface.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
+           file://CVE-2025-26466.patch \
            "
 SRC_URI[sha256sum] = "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
 
-- 
2.43.0


