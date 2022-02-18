Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7D7C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:05 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.8984.1645178824218536901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jotc4KNB;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id f3so13494004wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cBEf0jwh2Jmdlj65M3J9HnLmTfm6BZhZaQUQT1ZoryU=;
        b=Jotc4KNBlKEYrDS15vLO4eo9fAeE/o3k6dt5rMTWmf74okNkLPwGdN92cAdjCSFtaK
         bpvxQ0rHX08hxU6LUUK13Aw5Y3SJRh4wgvc1c34OqiwGW+Xnhi9/NIv1WtRTLBcKKeBK
         92vSsS1u+sl0EbttzjvhorR2zerMJChhG45xRjng/ryqXBiIabxvGC1/ZC1Tis9wJKDr
         ji4SYifK3NO7gjcP9GL4ZMA/owMr/nE/vFR2es9+fUey+Gz/4Uca4lXoG29lfhz3iQSo
         E0zFRyNQoju1RlxrIZsl1wIbjbP1M0KxKepJhp22p4MEl2/o7LweUl1fKAWXTeZ4iKD8
         9diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cBEf0jwh2Jmdlj65M3J9HnLmTfm6BZhZaQUQT1ZoryU=;
        b=zjdDRIdTq0L7OIEaT0BhFhxfvWJO2X+I5+nWwvTOCpGhUzw+kU7cLXvRGRjE6R/7RP
         R55XA3RXYxZvh2YlDC49cbQQCTyoqm2XlvvFduTqTh6mFyUoCuy4hK8ErU9qHDcM3VyH
         KSKdNzFg8NKwiyWk6Sus84c1Q5FStoksewdTdn6WXN4zA++KC4ArBR36mSjqqN2XO8dc
         koWlCf8K6Pi9OI8VQ5Awu+5fwYAjgdzTLPnnlMPkogd3zNK0ETh1xkAUFiIzbiecVeeU
         MKLIoPV9zyvHzXNXMO3cHeg5iMvVEO/Tfsn/JexY/r8t7u4nHjegf0iT7sHnaQDyFMQ7
         QPtw==
X-Gm-Message-State: AOAM53184HkDFW8bNBiHYXcsSGxIWXGwel2XILe3LobbHAzr30euDr0W
	mGQ+D867jF5XW2lOBnl65kk=
X-Google-Smtp-Source: 
 ABdhPJwjNQEEaX+nYm/V4aY4uQGSjnKIGzFcAwTzBvGK2mHqf8jqjZPlFMhAwECy7Rc7jn7c56A7cw==
X-Received: by 2002:adf:816c:0:b0:1e6:88a9:eb6c with SMTP id
 99-20020adf816c000000b001e688a9eb6cmr5383027wrm.645.1645178822737;
        Fri, 18 Feb 2022 02:07:02 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:07:02 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 44/46][dunfell] grub: add a fix for a NULL pointer dereference
Date: Fri, 18 Feb 2022 11:05:52 +0100
Message-Id: <20220218100554.1315511-45-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161932

This patch adds a fix for a NULL pointer dereference in grub's
script/execute. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ix-NULL-dereference-in-grub_script_e.patch | 28 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch

diff --git a/meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch b/meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
new file mode 100644
index 0000000000..b279222fff
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
@@ -0,0 +1,28 @@
+From f5fb56954e5926ced42a980c3e0842ffd5fea2aa Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 3 Apr 2020 23:05:13 +1100
+Subject: [PATCH] script/execute: Fix NULL dereference in
+ grub_script_execute_cmdline()
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=41ae93b2e6c75453514629bcfe684300e3aec0ce]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/script/execute.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
+index 7e028e1..5ea2aef 100644
+--- a/grub-core/script/execute.c
++++ b/grub-core/script/execute.c
+@@ -940,7 +940,7 @@ grub_script_execute_cmdline (struct grub_script_cmd *cmd)
+   struct grub_script_argv argv = { 0, 0, 0 };
+ 
+   /* Lookup the command.  */
+-  if (grub_script_arglist_to_argv (cmdline->arglist, &argv) || ! argv.args[0])
++  if (grub_script_arglist_to_argv (cmdline->arglist, &argv) || ! argv.args || ! argv.args[0])
+     return grub_errno;
+ 
+   for (i = 0; i < argv.argc; i++)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2f230065b2..84b8b8d1be 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -90,6 +90,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
            file://0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch \
            file://0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch \
+           file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


