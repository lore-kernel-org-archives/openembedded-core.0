Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FACCEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.61517.1688484640382976057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Fv0wtvjP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b8062c1ee1so45038295ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484639; x=1691076639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vD8W0Ei+buv/3UoGvu0p/oo1/+LvkPCP6vc7YgP4urE=;
        b=Fv0wtvjPDp/7bKF8CkOTbvh9bANTjpulSQlQmrK9Ah6zETBiOt58uh9jG9O/AG/IHj
         Qb0j9omKhxPYVDUjFGzpSfE6ciwz2OoezqnDDB7wc7cC6rH1f6jG2/wz9g+TdJphXLbh
         l/0AQF2ZdV4bb90Mtslb9OlWvAvK5ptwi6dYjvVFyh7Us/MvpYaRqwCvEJ8sKRiLKKb5
         lDFgtTCt/uzPwi4VEjdvNrcFnFBYDKscrCJBURjxWoNkZuMAmberMa1lZWgnwMwM5Vzw
         XHv4d8NK9Ze7FCag3mfEkfaIs/8gfrtNlxmAU4AXOZUxzZEaSSp6ApzgQjRxrpdgU5QS
         bUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484639; x=1691076639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vD8W0Ei+buv/3UoGvu0p/oo1/+LvkPCP6vc7YgP4urE=;
        b=HC8XJzKmoZNOwyMbVaXqy1qxVoN9C/obhYMeOi99PAC/0IVh69JCjI1uZoLirfBqBe
         yYb5v0kg2GTb9o/0QQhfQwHhHI1V48gQVAERAlIm0IrIkhi1BzzUR3A+ca9cSjgqfEwx
         VAwEBt+hCY8p9v3UWD0O2cFu+JDPjNVW2aZKbRSmmLc0Zt79aO23hCe/4IOlUkI0k5Tx
         3w/mYQNXZhY5EJh/8EQc0JWANF+jvrf4/mpk9oyebQVCrIk3w+gpPBtdg3wx44lLFcsJ
         ltSDgiRDNDNMYEze1EFHEbSepWgf782LH2Q++u05a+KXVNppdfU56o4/64oNKtyhw/+p
         9hAA==
X-Gm-Message-State: ABy/qLbYV11YJ/DXHJm801vNapgZYuxSHbWrtsWFcF6iJmsinth8C2gk
	fVczaMF420rzX1EwnQdTmJ0I7M5BBYXpOJGxQYAW8A==
X-Google-Smtp-Source: APBJJlEmGE1qJ5RLglvo1mgorKQrGEcCM0Fjgkk+RaLBDoa5ZqtHufh2mQi+CRISA/uMMSW0VyMveA==
X-Received: by 2002:a17:902:ee41:b0:1b3:d608:899a with SMTP id 1-20020a170902ee4100b001b3d608899amr12788326plo.68.1688484639505;
        Tue, 04 Jul 2023 08:30:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 30/30] rootfs-postcommands.bbclass: add post func remove_unused_dnf_log_lock
Date: Tue,  4 Jul 2023 05:29:32 -1000
Message-Id: <595fbe4c9ad25e52e88d7bcf1d1864fe5ec324a5.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183865

From: Changqing Li <changqing.li@windriver.com>

Remove log_lock.pid which maybe created during do_rootfs. In commit
[dnf: only write the log lock to root for native dnf],
native dnf changed to write log lock to root, and target dnf still
use /var/log, so log_lock.pid need to be removed post do_rootfs.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 690fa976aa..7538c8b0b5 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -49,6 +49,8 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
 
+ROOTFS_POSTPROCESS_COMMAND += 'remove_unused_dnf_log_lock;'
+
 inherit image-artifact-names
 
 # Sort the user and group entries in /etc by ID in order to make the content
@@ -276,6 +278,11 @@ empty_var_volatile () {
 	fi
 }
 
+remove_unused_dnf_log_lock() {
+	if [ -e ${IMAGE_ROOTFS}/log_lock.pid ]; then
+		rm -rf ${IMAGE_ROOTFS}/log_lock.pid
+	fi
+}
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
2.34.1


