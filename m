Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496FFC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 13:38:05 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.55247.1656423476498347048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pLn55Ju8;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id cf14so17617934edb.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zM3mW2nCjruUY+YloHSyM6sApPvsk5eJGv11EVcXXLs=;
        b=pLn55Ju8AfabBuL3kpireM1R7KaxiXa98esIX7k+lgSHltmC6QlrR1rrnKyLpPBlsj
         N/6EE35q7Z3RxlpTUJhNbhhywG9jP16sUERoNJhAlK7ISQmtXghVWU3Y7XHCo96X2Lsv
         x8y9G1bKue3TbSVqn0XB8Hu0Q3eYQL0A/ZzT4VgC/JCRgApafM+s3qW0bd5ahXK7Grh4
         LkWNWSONd8aRaSQG75iCv5ppRJ67MBlDk8Nnp5Q0w/Cu9bPWUjiF5rGWPewVMfq5uSuH
         I0/cgieQ7S8FgCENb1EaiMjMBC5XBMqsyZROt1wubBmpMDdZ2UagVJenZUhFR8OJ7x8D
         JCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zM3mW2nCjruUY+YloHSyM6sApPvsk5eJGv11EVcXXLs=;
        b=Uv49fKGc7LDsehZsLmhGUhojh9MoAIDFjArVKkuYSj9rJT675ij/5Kf5EwohU8sfwh
         Q4A7jZn2dDVaFrqu4P0nYqN2z1FXbz5PjejmCsR2KDIO5CuSYb4cVoHd1icGrxb5/NRA
         lYtqyse32Nq0zueseuM76EHC1M9HB+JlHB0MXkytkw4T2yX7VKS4P1DH/poaPAVyAfjy
         XcJx6KV9EEi8dJPXdlovyqXMnbe6an1RJ2Jc9f+kRxOjRStKZmPXG8mPJdUtCcQwrQw5
         CVc0+jf31ucJ7OLrqzYXiseRVKGpZn1X5dB/ZHSZrGlzxgkn4H19cZGZ1GBoIrK2sSde
         SNyQ==
X-Gm-Message-State: AJIora9eGrY7kRfpn+wfQH2sbJhqbsjM0T3qauwpXYPdsv0LiBidvkx3
	emrOLqAqXG7HYeZAUSJun/E4UTwFYKQ=
X-Google-Smtp-Source: 
 AGRyM1siBXOx9O3VOFQ1RBqEMgEV3EytHzwQCQS9xofeXC3ObHT98UDkWGITPwl9BPpWjREHbFfitw==
X-Received: by 2002:a05:6402:498:b0:435:daf0:915b with SMTP id
 k24-20020a056402049800b00435daf0915bmr22843138edv.322.1656423474752;
        Tue, 28 Jun 2022 06:37:54 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a170906444d00b00722eeb368cesm6451853ejp.64.2022.06.28.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:37:54 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH 2/5] lib/oe/rootfs: create
 image_list_installed_packages_pn function
Date: Tue, 28 Jun 2022 15:37:10 +0200
Message-Id: <20220628133713.3390786-2-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628133713.3390786-1-davide.gardenal@huawei.com>
References: <20220628133713.3390786-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 13:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167340

image_list_installed_packages_pn has been taken from cve-check.bbclass
to make it available for other classes.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/lib/oe/rootfs.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9e6b411fb6..54a356102f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -393,6 +393,15 @@ def image_list_installed_packages(d, rootfs_dir=None):
     cls = importlib.import_module('oe.package_manager.' + img_type)
     return cls.PMPkgsList(d, rootfs_dir).list_pkgs()
 
+def image_list_installed_packages_pn(d):
+    recipies = set()
+    for pkg in list(image_list_installed_packages(d)):
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
+                                'runtime-reverse', pkg)
+        pkg_data = oe.packagedata.read_pkgdatafile(pkg_info)
+        recipies.add(pkg_data["PN"])
+    return recipies
+
 if __name__ == "__main__":
     """
     We should be able to run this as a standalone script, from outside bitbake
-- 
2.34.1


