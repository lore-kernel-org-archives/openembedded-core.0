Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14032C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:04 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.10122.1633357263278647899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3nGAPBBS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id p1so8573442pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rd15DqnDYm5JRwtYXUcKGM/WCv7XKA2qsd/Tpb4FnFQ=;
        b=3nGAPBBSsuBt80J90xovjBH2nbf1M/NMCPezmybFdmuufe9VgFzV36mkzCNprLWfsD
         5fzr8gnfFbXnSuBByVu5SVkKw+pmF+YQUwQZ9qaBjmf6I+M4t1g7tWnqmfvRVzIOZnAR
         71JLhBiykyWPUFn8NzCFNa4llMP4oXRVIZsR40bgh6yyhxVQiVu/xUFJPmjZhS0uqwr6
         +DG6SlERVgJpHJCIciw4IqidgXtQ8fiaroMwJIeQlkIAJexh4GON3jWtMCx5fjnWz5WL
         ZwSLTX58RBBoLV3xhIdxL7zwHZhtLN6Zsu56ScCkM+HFiXQFeqsdfriv3lywnyD7an7Q
         6rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rd15DqnDYm5JRwtYXUcKGM/WCv7XKA2qsd/Tpb4FnFQ=;
        b=VLeHsGfIfTX17yDlgqKMEX4+2gFASyM7yPqPz+mdHmG+/MXFKKyfTF1SvgsIyFQrmN
         q9ZePrGjDRmPj7hWdqjyZry7krXeozCTWJ3xRzg74vYh07VLmkxrEouyhJt5/R0fTk0K
         m5goKmuOzY46WzjPaOVETR17DXhWAthJrc1WSs00feQQ2/f922r2XYJufizU+GtFr0rb
         7AN/pYrUYO6kSLVdfGa+0tDm0upVahcKdyDkzb44kVeZPoDDinBUVi1Fq8BcK+gJxgOn
         UmTx5VZgQjRo+k+0cYq1pUs7vNx+mKveqXu93AKS103irKaIlr/TGXr8YsdP2wYejg/1
         vMmA==
X-Gm-Message-State: AOAM532sOfj67pzxziESOTkTtW5QXDd14susDaMjgrhtiU4gm0OTI7ct
	sJiVMEzc4sDry9oM0lQMZcQalqqOewiTc8hw9Xs=
X-Google-Smtp-Source: 
 ABdhPJzFmUMc+tN2Areua7sut8wue8rkUMKOgsJ91Hhd6XmmCPGjSnHDMvoPVqS9iaohSyiJ71LU7w==
X-Received: by 2002:a63:ef58:: with SMTP id
 c24mr10922208pgk.299.1633357262289;
        Mon, 04 Oct 2021 07:21:02 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/15] openssh: Fix CVE-2021-28041
Date: Mon,  4 Oct 2021 04:18:30 -1000
Message-Id: 
 <969e14a6849a4ec9030d09059e8d81dce0ff0c49.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156595

From: sana kazi <sanakazisk19@gmail.com>

Added patch to fix CVE-2021-28041.

Link:
http://archive.ubuntu.com/ubuntu/pool/main/o/openssh/openssh_8.2p1-4ubuntu0.3.debian.tar.xz

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


