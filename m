Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DF7C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.8985.1645178825129024173
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E3qgCxFu;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d27so13658449wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6NI780j21Y6gcQrr2si6kaVWRmoFdfjs3nPdEEZ5Xl4=;
        b=E3qgCxFuBAd+aPuyhg3Ep1Xg2WinpLDo1+OoWsvI9ReU3+OYbwt/15G+YmOrWcyncz
         fMtX4rSRjIPUtvANCisvp7mXWSie4w98D7ZDf9eqfWqBA7tzkaWWJy6U0C4v2xOguFD6
         wuno7VttxVDYYezqu/rfrBQ31kJjWcvcSCaWYCvUdgPvi+tN9wO/FA4vY2nlhr7GTVH6
         Rv27l1nt+RBmOpWbAsJTRsHaQqgQrikfQw3gjqwL9HQnupUrTeBN4p6qbmnkj5+Fcvzn
         CXXUwU2y5I6mVlAxDgBftAMbvn7YK7QUgB70X1wW90AcewNR5GVC6MvD+QBgnW3CPt3X
         N+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NI780j21Y6gcQrr2si6kaVWRmoFdfjs3nPdEEZ5Xl4=;
        b=Kt77iAE3ldIyx4o2YPb4CJbXbtdF+Hbdj+cXUeu9TISng5DwX/b3mF2E8z8TBb/QZJ
         YymXiz+T9RtaHB2y3dgx0eDmpsGp91PMluBN2bxif/shwqSXAmNJb3Sa9p8AfF4JjX5Q
         8KI131EFFvWagJCJXEmry6s8Xu5P6lJw9l/m3b7vbHJrITtKe5saLAjk+FNOClgazmte
         sTXC7bpejlS2S7OSosxJX3zhBptw33UhoLxLCBOTWwrXNj1dan3mR+ES1KoE+Y6w68wF
         E4L+F4rSlMXafps14Ma562aT/WZQcT2i2DlSdUhFL54fVD0ARwa223pgSQ3LoMnNOrxG
         +wkA==
X-Gm-Message-State: AOAM5332mCvzXwiwrIlM8gF0y/6msAKJPm/6JuXAzyh10O59svlHiU/h
	yYhIEjhRRYVoOMrrqjtQaCyDAwtPriY=
X-Google-Smtp-Source: 
 ABdhPJxUUvFHMYSrKiNMK1s5qLMPKechAL56SmaRvTCABHyCr7+W4g4E/UdtzNx6EehROt5w0ITDHA==
X-Received: by 2002:a5d:6f0a:0:b0:1e4:a354:a7e with SMTP id
 ay10-20020a5d6f0a000000b001e4a3540a7emr5370814wrb.423.1645178823629;
        Fri, 18 Feb 2022 02:07:03 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:07:03 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 45/46][dunfell] grub: avoid a NULL pointer dereference
Date: Fri, 18 Feb 2022 11:05:53 +0100
Message-Id: <20220218100554.1315511-46-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161933

This patch adds a fix for a NULL pointer dereference in grub's
commands/ls. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...ire-device_name-is-not-NULL-before-p.patch | 33 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch

diff --git a/meta/recipes-bsp/grub/files/0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch b/meta/recipes-bsp/grub/files/0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch
new file mode 100644
index 0000000000..5a327fe1d2
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch
@@ -0,0 +1,33 @@
+From dd82f98fa642907817f59aeaf3761b786898df85 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Mon, 11 Jan 2021 16:57:37 +1100
+Subject: [PATCH] commands/ls: Require device_name is not NULL before printing
+
+This can be triggered with:
+  ls -l (0 0*)
+and causes a NULL deref in grub_normal_print_device_info().
+
+I'm not sure if there's any implication with the IEEE 1275 platform.
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=6afbe6063c95b827372f9ec310c9fc7461311eb1]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/commands/ls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/commands/ls.c b/grub-core/commands/ls.c
+index 5b7491a..326d2d6 100644
+--- a/grub-core/commands/ls.c
++++ b/grub-core/commands/ls.c
+@@ -196,7 +196,7 @@ grub_ls_list_files (char *dirname, int longlist, int all, int human)
+       goto fail;
+     }
+ 
+-  if (! *path)
++  if (! *path && device_name)
+     {
+       if (grub_errno == GRUB_ERR_UNKNOWN_FS)
+ 	grub_errno = GRUB_ERR_NONE;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 84b8b8d1be..0454b09d52 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -91,6 +91,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch \
            file://0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch \
            file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
+           file://0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


