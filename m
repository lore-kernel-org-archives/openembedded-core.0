Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1BEC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 08:17:07 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.9594.1632989826436473592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JT1VmZ1u;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id k17so4294849pff.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=wYjRfHEvm2kaCuAFIjKLYcch5ZS3wBlvjvIYqQyguXs=;
        b=JT1VmZ1uJyrL6pn30JwPDflZMIj2kmZXl5lThYcgCCIPKnNLlhKHztgxVMowEfhrkE
         XYibbSPVgCnqjk/GmFrLBuQUMSX84MzhOe657TKDyX2Qb0fRF3sbITRt+xleZqKlvXOP
         5p7dcZ9SX/r/eEHnqN9e+BYCxYJoT5UzIC/cDU1aGAkVths6CP1OdMzo6BWR6olIo61o
         LuRzfeu0ZWj6S63F1Jgr1u4MWrx3vfqvPJUo0gyZoUM1k99hCzUeP/EILw7vBr78oRdn
         or+BCZPtCpuMk5u3pkJzbNw5x9B+sEtWaB89dsezxzGk5TSVhEKSFFdHzNhH76jD+bD4
         aj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wYjRfHEvm2kaCuAFIjKLYcch5ZS3wBlvjvIYqQyguXs=;
        b=rBkXhdxYTG7GaIm7UqOtWHgWYLEgEtyPjaeFl2tw0gmXDiRgCRvThYa4zV1pRPd00J
         a1K3QlwFsLyuQHVQTskVJuCObAROcGTpKsZRf4U2T+1ZfQKs0DNIUwzc/seNBqCeqA3K
         /9ieGR32pAve9CmDC4b1ncFLsSaFdfCeHszs74neuKTunB37HGG/pq5ndFkG1WdRJMTS
         5IxTK8+UOkgrwPrdLVD5b5+UOESyr5Z2A05n7R093bQexu9RMgy+tZ7Pne48KnJx5nuV
         V9VocXqYcGReXcfgTtq+oFNoduG7hLpQgIp+KPrDKa+41OVw0ZNiwTNyC6VqtbvBywNn
         eUBQ==
X-Gm-Message-State: AOAM531jJenUiwurlTWFQ+UuCCI+0fSLvf98sHWK/jf2syDQWpj92m4t
	w+koOLj6deKurM69cQ0gc06HdYLOIlxl9A==
X-Google-Smtp-Source: 
 ABdhPJwssjp8y0xbOJr4LaWCgQ7rBoaPgKfCGeg5KKw+b8xPEzOoT1kucRTCNP2OmT1f/As2Rr615w==
X-Received: by 2002:a63:4606:: with SMTP id t6mr3775754pga.388.1632989825540;
        Thu, 30 Sep 2021 01:17:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1b60:82b9:d167:5cb9:a4e8:da1e])
        by smtp.gmail.com with ESMTPSA id
 j20sm2042914pgb.2.2021.09.30.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 01:17:04 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][dunfell][PATCH] openssh: Fix CVE-2021-28041
Date: Thu, 30 Sep 2021 13:46:30 +0530
Message-Id: <20210930081630.10331-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 08:17:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156485

Added patch to fix CVE-2021-28041.

Link:
http://archive.ubuntu.com/ubuntu/pool/main/o/openssh/openssh_8.2p1-4ubuntu0.3.debian.tar.xz

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 .../openssh/openssh/CVE-2021-28041.patch      | 20 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-28041.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2021-28041.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-28041.patch
new file mode 100644
index 0000000000..9fd7e932d1
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-28041.patch
@@ -0,0 +1,20 @@
+Description: fix double-free memory corruption in ssh-agent
+Author: Marc Deslauriers <marc.deslauriers@canonical.com>
+Origin: minimal fix for https://github.com/openssh/openssh-portable/commit/e04fd6dde16de1cdc5a4d9946397ff60d96568db
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2021-28041
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/o/openssh/openssh_8.2p1-4ubuntu0.3.debian.tar.xz]
+Comment: No change in any hunk
+
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -496,6 +496,7 @@ process_add_identity(SocketEntry *e)
+				goto err;
+			}
+			free(ext_name);
++			ext_name = NULL;
+			break;
+		default:
+			error("%s: Unknown constraint %d", __func__, ctype);
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index 64a0a72a8f..5f03bdc877 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://CVE-2020-14145.patch \
+           file://CVE-2021-28041.patch \
            "
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
-- 
2.17.1


