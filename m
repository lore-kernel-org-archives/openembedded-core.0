Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A38C47079
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 18:41:32 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.25075.1704825683220122896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 10:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQDTdT6f;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28c0565df34so1731160a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 10:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704825682; x=1705430482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNWQWqPTSk1bRkWwiKoZV5wiuQ3aEmvlQfCkva5fe/E=;
        b=LQDTdT6fOVr61gKz/z5qSeApV26AfsaDMrsj0e7uOlAD8FBfne6o0hcRkqkcljp0NE
         VBHfeQBxZdnICocqESCjydhuSk639iVNbfC/GZqXT1oZBpKNScaySEJUOJ9xKn4SgUkc
         /v5FdFSa3j2DoyDbdlyyTV5utYhhv4IYyOgMiDFiOjtSDn+jGCI8SBQWkYaCjusAfSLI
         XoT5w34hjsRydg9WgAst5h7qWFJ/1Qrps+3FOJ3YAi4iHEWXw1d/7akDEtAOTF7m3BiO
         eZdXK/aj2kphn1J08TiR+SmyU0YIo5qBFdulubV1XIgFudJhCaMwIA9SeF8pVecmMHQ1
         zyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704825682; x=1705430482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNWQWqPTSk1bRkWwiKoZV5wiuQ3aEmvlQfCkva5fe/E=;
        b=qOXCYPagn0ZEnT5tQZg1No0mmG/nMq5hF4nzVVealqfO0neJXIubFwQK439FBWYRHL
         vvCSVIQ4PvlPA6lXOdexfyGMsgtpiik7iSQ7MQdYG9XTZtIAfBW9jqEvoeEboecgxg9S
         BYT4BiFjT625w0CuhVyh2DPyVOMA2medDXigDzI5EcOO2Y4d5vrDGNHbXOLYk9BlgMHC
         DFbvsvtj4ZQj+oTTZK+TfSc8ZLtJTLXmTx51Xh0ZFBEiZNFovj/maQWfZgk17K8Q31Lp
         CwbreMA12k3ybmxqLo4FGRvQcyxFKsboMSznk7tFubjQdSjlASRBQXWmavgo6cx2bV8v
         0ucg==
X-Gm-Message-State: AOJu0Yzp72UH09CR71PS+UyTIEa2I5ZHUIoanCcghoECERuvdWs660Ux
	hQYKQ17Vc0EGxsAk/CEBBvydAsuU+4HwsQ==
X-Google-Smtp-Source: AGHT+IFyctSnae+QjbmceafilkJC8BosspMaB9CTlU9HeWGag5rtzs5kQuTlATqgDSeRm2HjrhSbjw==
X-Received: by 2002:a17:90b:3101:b0:28a:fd40:1650 with SMTP id gc1-20020a17090b310100b0028afd401650mr2938669pjb.25.1704825682299;
        Tue, 09 Jan 2024 10:41:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8c5f])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902b10900b001d04c097d32sm2090335plr.270.2024.01.09.10.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:41:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] opkg-utils: Backport fix to drop --numeric-owner parameter
Date: Tue,  9 Jan 2024 10:40:05 -0800
Message-ID: <20240109184005.1774148-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 18:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193475

It fixes the issue with different GIDs during ipk creation and image
creation time

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-numeric-owner-parameter-overzealou.patch | 34 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.6.3.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch
new file mode 100644
index 00000000000..0cdeb9574a9
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch
@@ -0,0 +1,34 @@
+From 19c2c6a14c8760c3595f5dc6cc89cde85fbdbac1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
+Date: Tue, 9 Jan 2024 09:20:55 +0100
+Subject: [PATCH] opkg-build: remove `--numeric-owner` parameter overzealously
+ added
+
+In some corner cases this parameter has been added overzealously.
+All discussion on this topic can be read in here:
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=15334
+
+Upstream-Status: Backport [https://git.yoctoproject.org/opkg-utils/commit/?id=68a969f0e867ace0d94faf8ebe7c7bb67f59d386]
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ opkg-build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/opkg-build b/opkg-build
+index 6edd938..0582958 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -337,7 +337,7 @@ export LANG=C
+ export LC_ALL=C
+ ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | sort > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --numeric-owner --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
++( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data.tar.$cext )
+ ( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion $mtime_args -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/control.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
index b509227e1a6..e138bc24afd 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
@@ -9,6 +9,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            file://0001-update-alternatives-correctly-match-priority.patch \
+           file://0001-opkg-build-remove-numeric-owner-parameter-overzealou.patch \
            "
 SRCREV = "589880d01969eb9af1e66120e731d43193504718"
 
-- 
2.43.0


