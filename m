Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E629C41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:34:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.60354.1716212048870955421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hgf6yvS2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1edc696df2bso7644115ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212048; x=1716816848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3vzDIos21vne9tgYsRbqhaHf+UBl+F5KAg1lrB7snI=;
        b=hgf6yvS233eviEffOaKZ8o5cC4TSg4PhojaHLAy9Kd1KiWT9t4pJ3YcA40AcZyP5xp
         IMekeKf50VdTyO3N7wmw8dr7YrASa3ESvZgESpALDkg5uwcsHcjZ00dPRxL4fdKt7Ayv
         ZaC625kZnH3cgL6f7WA8HmuJJcLoZwIAHMxj51ucTp92l1Kr1ZAF9l0w5FlOpjjrhYq/
         yhiahxi++bd6fiNyUCH8YNKdPQmx7/ddza99Afq0o8MfiJFOxBoadURweZ0gIl+fi0r3
         jonPNAirqbFzCds4rjrOvaEZdsJiDKanxiwLIH/ReqYzE5QAEg7Vhx3bhDj5/PGIcQzP
         wBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212048; x=1716816848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3vzDIos21vne9tgYsRbqhaHf+UBl+F5KAg1lrB7snI=;
        b=VWzjAPLeG+rmN3dfNlG1ZL6wamFcW9PYvBjN3HsjrgekyerSARlJAWlT1OrvN4oaag
         iQ7SozBqYDUUdM5nANxuJahz/LvUOTkS2qVVwbOA/S7e/kJWeIjIHS8Kr0/qMw/9rlSf
         iXmM5HmclV7Ctxk07OgMolgU14k+BCc0WemjanTh3XoFblqYP/cELKkDYEE/ssOQJULc
         DBpbar41rXipygr07bKpJV5qmDnj1XQRL/T7WVhtEPkcY5C4Nd8RDtJqDxZQPmquiOvy
         cRS/Hg/dknPWymsJbtytTgxtmMVSyixyUCraDnSx5qe+lquKcCYPiSV/4+4/EcAf3NMj
         f6Iw==
X-Gm-Message-State: AOJu0YyCSu4ydM/UOLP1hOL5yfC72zScCwPqgNCjJoEZDGErvy+RXY2e
	e/ZmMC/KfV5FeRaZgCYUFQy+ihMoj7NoeF+2XyLsIvnqs05a+ifJECojBkvRpZ8ehsDYqY/ntcu
	o
X-Google-Smtp-Source: AGHT+IHSP6e6/aIPhPGuH4xNuYy+NfKU9OoXTWQ7BD53Lz9aJuRKCGGavDvkQ8yUJ08wKpRcuVPyZw==
X-Received: by 2002:a05:6a21:32a7:b0:1a7:2924:7317 with SMTP id adf61e73a8af0-1afde1b266bmr35517281637.49.1716212048063;
        Mon, 20 May 2024 06:34:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.34.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:34:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/21] selftest/classes: add localpkgfeed class
Date: Mon, 20 May 2024 06:33:31 -0700
Message-Id: <00e4eb179b6bd4fca2499d997c60889c3d7ff632.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199591

From: Ross Burton <ross.burton@arm.com>

This class can be used to construct a subset of a deployed package feed
for use in tests which iterate the deploy directory, and as such a huge
feed of 30K+ packages can result in very slow tests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5486d6ad32457f09c104d5dd31314bd570912d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/classes/localpkgfeed.bbclass | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-selftest/classes/localpkgfeed.bbclass

diff --git a/meta-selftest/classes/localpkgfeed.bbclass b/meta-selftest/classes/localpkgfeed.bbclass
new file mode 100644
index 0000000000..b796375e55
--- /dev/null
+++ b/meta-selftest/classes/localpkgfeed.bbclass
@@ -0,0 +1,27 @@
+# Create a subset of the package feed that just contain the
+# packages depended on by this recipe.
+
+LOCALPKGFEED_DIR = "${WORKDIR}/localpkgfeed"
+
+addtask localpkgfeed after do_build
+do_localpkgfeed[cleandirs] = "${LOCALPKGFEED_DIR}"
+do_localpkgfeed[nostamp] = "1"
+
+def get_packaging_class(d):
+    package_class = d.getVar("PACKAGE_CLASSES").split()[0]
+    return package_class.replace("package_", "")
+
+python () {
+    packaging = get_packaging_class(d)
+    d.setVarFlag("do_localpkgfeed", "rdeptask", "do_package_write_" + packaging)
+}
+
+python do_localpkgfeed() {
+    import oe.package_manager
+
+    packaging = get_packaging_class(d)
+    deploydir = d.getVar("DEPLOY_DIR_" + packaging.upper())
+    task = "package_write_" + packaging
+
+    oe.package_manager.create_packages_dir(d, d.getVar("LOCALPKGFEED_DIR"), deploydir, task, True, True)
+}
-- 
2.34.1


