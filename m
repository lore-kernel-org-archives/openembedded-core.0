Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6980DE6ADF9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88504.1766436300412219407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAidGHzV;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so2154197a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436299; x=1767041099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F0jSWGmw9eDw856WkqD5nJqVynfFBUsBy6CWWzGkDTQ=;
        b=cAidGHzV4gijltQPbHws5GJmnhX11UWJyx7la7I+WydsxqY0OD6pxW9klgu/2LbWP/
         PZtW/agGO6E0/9/b7ghrZ/ADAU2t50Zo8jdUHEz+mG73NILuLKPO1RIwZc/mat2F37Wz
         748MfpMF+kGPA1zRAkll+UrMeNp5OokwClDJxHTZh97lRAVu5icf/F/KiYbPBXAZO54A
         KnERsl9v6ZBAKYzC0BnHQ98qJdeizPC87QMu9CdyFMbnN72gWBpL7+zIYl9M1xggFWYH
         mTl/WOZNedUrYIxBd8ivCTPmCI7iaa5dAeOerKnXRY3izzW0f5+6cKm4VXatDqn4Xlsv
         IJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436299; x=1767041099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0jSWGmw9eDw856WkqD5nJqVynfFBUsBy6CWWzGkDTQ=;
        b=KU0n9ug2f4PAm6rUj9SJ2NNYvQh0kMyZe5WwX+lwAWFW8zkAkjyhVMMtlI/IkhMGGw
         SjzDKi0H6cHGKe+A24oiuVEjyYCFZJYVuiEJX2dxceSyRK0GxRiywjB702rzG4m7rMQy
         LN3V5GYmWdxjxPagz1W8/v+sKPGJagfThapFwlSMMGclyoZJexKKQcRGwTCLY6ha1HDB
         KXB5dkTNjQkLWu/Odu274TtrzGRm/u+w5soVbJHxuZ2Q/jmB7/mjKuWz8hiBv+cYT/h3
         UeTtXQP5UmGDMx7W3yv+F6ZGVklzBwBEHPRmy8vyerwRr3BOXtslSwyI9FlCtH1+QUbr
         Ecvw==
X-Gm-Message-State: AOJu0YwquWXH1SpAkW6A/XoKy0jXWGDMOQA7Z0khbmDyl0YUM7fuSHIJ
	bTZuhBC9gdYjgDOMpkFQkY/F/wDRGDsbFe110yoveemTKVUDu5H/ParYFQpYrQ==
X-Gm-Gg: AY/fxX6QXDFtx0OgNgx+EEfMoLHkke30clLJGtm8yimkuUtQ+M7MkrkpWxuldNIzMmw
	Lq1cgoEZFHtwVchDsVfvytvTx20Few8eezn29skP5ecDdE0HP78g2bTHNxHTmzBP/EbfxU7zJPm
	Z6uaJVpZ9iymWlnyNkmXrUui69pEvGQt1ylVhEFa1DhyE/e1a75Pud3LfaOsZI6cdpHF9cxJgag
	HxmDtCbyZcItA5IjOkcZN4obCtbSVTqG9was0Kwtb3ffqOoCUa9qwZaIPmlnIPoCkVL9RY9ymRq
	3i63Mr72C/WuotOYsWDSMVXmJvaAophYovjNNMr5DCiPSOvM9OQsvAOBvHEkiN5mRIpIwfez3rV
	3iq2gMdoCRJO5h2tYUnvv8sz7fe3REGY4lKh325NR+VvddTL9GVc8yrXTDQ1uvqhFEmjTKZ7CHk
	sr+rQoHrpMO71DU85dNUw9QLB16QJF9pADSHo22gpTVZHVbwg=
X-Google-Smtp-Source: AGHT+IHGdq7Ucy8zshD1W29vwZQYY0PYg5P49XouZExTDn+hgusyhaGWFmBBOTZqALkLha8NT1uQhw==
X-Received: by 2002:a17:907:3f99:b0:b76:f090:768c with SMTP id a640c23a62f3a-b803704ffe2mr1288673966b.30.1766436298556;
        Mon, 22 Dec 2025 12:44:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:44:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/15] sysstat: upgrade 12.7.8 -> 12.7.9
Date: Mon, 22 Dec 2025 21:44:19 +0100
Message-ID: <20251222204455.2284529-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228426

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-configure.in-remove-check-for-chkconfig.patch     | 7 ++-----
 .../sysstat/{sysstat_12.7.8.bb => sysstat_12.7.9.bb}       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.8.bb => sysstat_12.7.9.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 84383f955f..431a60aee1 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,4 +1,4 @@
-From 1590cc614aaf0fb81cd804414d6c9d5a9227352c Mon Sep 17 00:00:00 2001
+From f41b0253d1583f7e1286fa2f29393c3d3f5183b4 Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
 Subject: [PATCH] configure.ac: remove check for chkconfig
@@ -13,7 +13,7 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 48b9a31..cedeb43 100644
+index 8b5f9b73..910ebd5a 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
@@ -26,6 +26,3 @@ index 48b9a31..cedeb43 100644
  
  # Check for systemd
  AC_CHECK_PROG(PKG_CONFIG, pkg-config, pkg-config)
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.8.bb b/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.8.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.9.bb
index 2194dfc956..3a06078e0e 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.8.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master;tag
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "5841596edf7f5e53288cb56400e0c0c1da5f2415"
+SRCREV = "b8f987807e7c7ba5c1b2ca8b7b1e9d80e61bce6c"
 
 DEPENDS += "base-passwd"
 
-- 
2.47.3


