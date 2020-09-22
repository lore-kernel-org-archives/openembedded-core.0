Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.2781.1600735507068243806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 17:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pIgWmMAt;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id z26so19100222oih.12
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 17:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=USLDguo3xxMQR7EH1n908VfVpybtRULAfESxEewCb/w=;
        b=pIgWmMAtYhdYxDCSkXl0E2zTZ3Rbukqw/ZRl3wSXHBl1rtrAGIGN4h/dphLKKeMuEz
         eF4hfRbT4Dpwuz7EawzCBoPEPyunmYYzDVtovBQvFfI0x1jqzww0TjnMy3Dc5n1BBN56
         gUGlE0nHURR/VXiypa72SjO16zLLIrpiO/NypHPrCDsxcTS+I+DIBZtn2ztjfk+JWtoG
         fKW6HBSOxawEowuDxqze1hil9u/CX2kDaNEC7MIJt6MQ19vto0VfOvfiU4j5WkLcHX4N
         E3Z/7SaLoiEoCetRoQKbNuE0H8R0Z2f1L2HVxtVgjqbcTFWi5ZMWt24EzO3kn1Cn9Fei
         VyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=USLDguo3xxMQR7EH1n908VfVpybtRULAfESxEewCb/w=;
        b=gEkDw24Y0fIEL8eZ4nte77a3AQ/9qv9oPvAeAXSktP6n5oGOY5fMcomi/wjpPTttDy
         QrRoQRhP5yWD26fbBw7UtHP241Yo1nrIRymOhS+DtsfcsYGkuGElU801/F840U3uUmA8
         UdJbtLq1jJUuCHPAqQULnAa30++mearP5vmvcbTG7ccBig8mU/SqnY/+T+Bz24dcStUK
         81VDrSiYiQ67cHS+0zLJtM6v3SyzwcUNjGAkXWfNjUrM9pxZTxNWKZAlbtlh3JExxqsm
         WANEgcDgo+gC1gsyuYLUi9tQAkmIet6myC459/fx3hCRd9KDJrlHN8G1Savv0EXIMhEE
         pZuQ==
X-Gm-Message-State: AOAM5322Lrx9fk8Uzt+pO/BkPEz/M0752vGQq/nJvznGz3sWJZ1xQfcC
	h9HsCpO7Mu7x2LSh3+25Q+1bCvhVfSs=
X-Google-Smtp-Source: ABdhPJwswrFlnNpvEYJpbb6MHYDFtlzvu2IDwjZJwEQTAlgH88JW54Suo5BpNMHqswTRZsFtvxA7GA==
X-Received: by 2002:aca:4203:: with SMTP id p3mr1149453oia.50.1600735506116;
        Mon, 21 Sep 2020 17:45:06 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id a13sm7075369oib.35.2020.09.21.17.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:45:05 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com,
	raj.khem@gmail.com,
	richard.purdie@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC] openssh: Start key generation in multi-user mode
Date: Mon, 21 Sep 2020 19:44:55 -0500
Message-Id: <20200922004455.21335-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sshkeygen uses a lot of CPU time which delays booting (especially in
the case where no SSH connection is going to happen), but we also want
to be proactive about generating it early so that the first SSH login
doesn't have to wait a long time.

Starting the key generation when the sockets are created (which is
pretty early in the boot process) slows down the boot due to high CPU
usage, so as a compromise start it no later than multi-user mode when
things have typically settled down. Note that if an SSH connection comes
in before multi-user.target is reached, key generation will be started
immediately.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd.socket        | 1 -
 meta/recipes-connectivity/openssh/openssh/sshd@.service      | 1 +
 .../recipes-connectivity/openssh/openssh/sshdgenkeys.service | 5 +++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.socket b/meta/recipes-connectivity/openssh/openssh/sshd.socket
index 8d76d62309..12c39b26b5 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd.socket
+++ b/meta/recipes-connectivity/openssh/openssh/sshd.socket
@@ -1,6 +1,5 @@
 [Unit]
 Conflicts=sshd.service
-Wants=sshdgenkeys.service
 
 [Socket]
 ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
index 9d9965e624..40fd38730a 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=OpenSSH Per-Connection Daemon
+Wants=sshdgenkeys.service
 After=sshdgenkeys.service
 
 [Service]
diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index fd81793d51..52617ec275 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -7,3 +7,8 @@ ExecStart=@LIBEXECDIR@/sshd_check_keys
 Type=oneshot
 RemainAfterExit=yes
 Nice=10
+
+[Install]
+# Start key generation no later than multi-user mode so that we can hopefully
+# have it generated before the first SSH connection
+WantedBy=multi-user.target
-- 
2.28.0

