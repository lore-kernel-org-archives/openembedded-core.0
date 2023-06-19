Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D959EB64D8
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:55:50 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.22.1687143348848788779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=p4joEjGt;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so1826586a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143348; x=1689735348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkvQnMo6YzaC22xdRxbXukb8hb5+kHn4VJggUzfgmwo=;
        b=p4joEjGtFoM+hkbX+rQ4hCW0lcI0owAJw9zxBY33exIfNaTEbYa6TpGIrh0WLHWpHK
         bUOD3yti5mSezXwhv8i947Yjh5A5EKBazY0MYFf1RYOpcaeojVGkmVISqclqM+U352IS
         J9SCukvQJj/06XOs4iipM1pc7IKbRIVJTFPd9pofqNECtGaVMSP4F6wu6yZttQHSO/xJ
         jABABvjKRco3rjvJM5v+UHxwnFYtM1tm8iYKPV5rDUuHX6wWYq2f35ulVR4pdScvk1qv
         oif4ZPkU+GOx5cEe2c2P2/AcqqHSnMZc+fZ12JHazmwMv/1HihLgUo8q0gPMQQSJ2Nmd
         bYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143348; x=1689735348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkvQnMo6YzaC22xdRxbXukb8hb5+kHn4VJggUzfgmwo=;
        b=BdvCEoMHrJnYWNOEY7E5UCIBl/dKJ4RRZKcRtUmx9qh7KE4XHBYZw8rJ5vlp1Ipw6W
         LQcnXT3QtumiVEQrCCQX3g6sdFRLgaIQu86YBxtAY6TQV5/wTEQy8Kc7LDCNaUJ0Y/PP
         5xwan1S+SUu+xP/vq17GP1nh+HLLENSfYFRmpFOT2Vz2ILBoreQVIyVuCfeiUX3spLeB
         v1ANl+3iS5zlfFBiAY2yYZJsO3Ana3WisT4247Ruraaun3ZfIU7VjS9Xk1qZn9V2ixFP
         Gs5CPZzCMgR4ekN/CC49xz8S2R7DaAm3hKETEFsdNKrVRdz3j6Q+n8rQIr4Ufxr5Bm2h
         F2DA==
X-Gm-Message-State: AC+VfDzwovhRuanKJVTpVFJHscDeesDscNcd2qD6w6ymxzuZLEhlHrbq
	PH7SjyoT7MPiUqOSqRx9A/22vQnfnNkHSawKqjY=
X-Google-Smtp-Source: ACHHUZ7F+eGwv/zNC7c8gUoiUCGq7AH3r+OuxRE8mW3T6DI7zU/VKbss/WT+GL2ef+3dk3nO9cdA5g==
X-Received: by 2002:a05:6a21:3388:b0:121:3e28:19ee with SMTP id yy8-20020a056a21338800b001213e2819eemr4822446pzb.10.1687143347507;
        Sun, 18 Jun 2023 19:55:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.55.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:55:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/18] openssh: fix CVE-2023-28531
Date: Sun, 18 Jun 2023 16:55:21 -1000
Message-Id: <2da7a711ca396451b10f5d2084532f7ae6f65cbe.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183068

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2023-28531.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-destination-constraints-for-smartca.patch | 35 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch
new file mode 100644
index 0000000000..b4e7ce7ef6
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.patch
@@ -0,0 +1,35 @@
+From 91889b5a3e7554af474a21ce8e1ffd3eb1542f06 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 9 Mar 2023 06:58:26 +0000
+Subject: [PATCH] upstream: include destination constraints for smartcard keys
+ too.
+
+Spotted by Luci Stanescu; ok deraadt@ markus@
+
+OpenBSD-Commit-ID: add879fac6903a1cb1d1e42c4309e5359c3d870f
+
+CVE: CVE-2023-28531
+
+Upstream-Status: Backport [54ac4ab2b53ce9fcb66b8250dee91c070e4167ed]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ authfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/authfd.c b/authfd.c
+index 76e48aab..dca8e55b 100644
+--- a/authfd.c
++++ b/authfd.c
+@@ -665,7 +665,7 @@ ssh_update_card(int sock, int add, const char *reader_id, const char *pin,
+     struct dest_constraint **dest_constraints, size_t ndest_constraints)
+ {
+ 	struct sshbuf *msg;
+-	int r, constrained = (life || confirm);
++	int r, constrained = (life || confirm || dest_constraints);
+ 	u_char type;
+ 
+ 	if (add) {
+-- 
+2.37.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 1d53c2488b..b403b355a6 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
            file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch \
            file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
+           file://0001-upstream-include-destination-constraints-for-smartca.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.34.1


