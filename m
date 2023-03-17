Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D72C76195
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:59 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.470.1679092974810280827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=O1lpGeJM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso9051424pjf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XHJ96AVAl9HEUR+01m7Sx9tx0/uMboAIABbmWQPK+g4=;
        b=O1lpGeJMtP7XeoRz9ru07DywBfexB25oss9ahm6gMxc31QEsWQVVlVUSkDDn7DauWt
         QsDXlgLdesvdBO19eqnwlYKMiDegO2ZYI6UxSbz5cS6J5kduKowOCEVBtmIQy/IuK28S
         IZeYQ01FT7zaFfV9D/y9V7rLMX2Ek4TtXa3hX+t4VVF8tBM6Sx1eJiRvCCJkBgL8m48/
         8uydb4NmCfyRCNV3IOEPldlSkU+EKCjZ1EU6I6AqgkOnpXu0D0wM1pmx7b8KV9jx7Kdh
         1pgjiyLbt82RgeD42oTbG7PrgkrBkAtNmrqqUsPAZqzC6K1tRIAuxT0VhTIxYGqH4+eL
         +sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHJ96AVAl9HEUR+01m7Sx9tx0/uMboAIABbmWQPK+g4=;
        b=ZM75lx7TM7TFiO3fFrnVz41YvZGFLp9y+hZ9J3aUZLD1mDiSrwyRYjlQ7T9TS47MJR
         rjh+GeMYBXiabIgdk6UWTD6c+5IUIbGEctbVrHKpaSxm0KPwPriWuZF2rC1oK1FhfhtT
         +9ColLglkqSQFvSUChDtJ0mugASdIycyCd+R37ex98MXE1NZwuJLivP5duqdtLghcQkS
         y5AhL43nLQOyOyL6W93I1Zq6B3TgC8CzkHsOuhl1aeLX/VyW7BTrV854O3T4UYW+zbZS
         uh0os9irMTRLgiCAh+f2jlLa0FpUuUBL6mZr0Pp2a/7UmuQgj1K50XeS8vtwNqECGT2f
         QAQw==
X-Gm-Message-State: AO0yUKUzuOh4FCpZo/N8Ytm3LDcg9XH7DTofU/snzufAI05YAc6MvGLH
	URIlrv5qdgdgtpAvUpYbc/ghu3iUX2A39s1uvWs=
X-Google-Smtp-Source: AK7set/DAJ3QHyeePEEnqhV1xSn+xNJSL2F2N1axks9Z5gzkLfOmeiSjURdbu3hvLkILGHQYE3iYrA==
X-Received: by 2002:a17:902:ecc9:b0:19e:5cc3:828f with SMTP id a9-20020a170902ecc900b0019e5cc3828fmr10681408plh.27.1679092973880;
        Fri, 17 Mar 2023 15:42:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/21] mdadm: Fix testcase 06wrmostly
Date: Fri, 17 Mar 2023 12:42:20 -1000
Message-Id: <9c73484cb12f39662a8f10027a55c63b95373066.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178767

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix the failure of the 06wrmostly test.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=41edf6f45895193f4a523cb0a08d639c9ff9ccc9

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-Fix-optional-write-behind-parameter.patch | 45 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
new file mode 100644
index 0000000000..186d1e76f2
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
@@ -0,0 +1,45 @@
+From 41edf6f45895193f4a523cb0a08d639c9ff9ccc9 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:12 -0600
+Subject: [PATCH] mdadm: Fix optional --write-behind parameter
+
+The commit noted below changed the behaviour of --write-behind to
+require an argument. This broke the 06wrmostly test with the error:
+
+  mdadm: Invalid value for maximum outstanding write-behind writes: (null).
+         Must be between 0 and 16383.
+
+To fix this, check if optarg is NULL before parising it, as the origial
+code did.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=41edf6f45895193f4a523cb0a08d639c9ff9ccc9]
+
+Fixes: 60815698c0ac ("Refactor parse_num and use it to parse optarg.")
+Cc: Mateusz Grzonka <mateusz.grzonka@intel.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ mdadm.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/mdadm.c b/mdadm.c
+index d0c5e6de..56722ed9 100644
+--- a/mdadm.c
++++ b/mdadm.c
+@@ -1201,8 +1201,9 @@ int main(int argc, char *argv[])
+ 		case O(BUILD, WriteBehind):
+ 		case O(CREATE, WriteBehind):
+ 			s.write_behind = DEFAULT_MAX_WRITE_BEHIND;
+-			if (parse_num(&s.write_behind, optarg) != 0 ||
+-			s.write_behind < 0 || s.write_behind > 16383) {
++			if (optarg &&
++			    (parse_num(&s.write_behind, optarg) != 0 ||
++			     s.write_behind < 0 || s.write_behind > 16383)) {
+ 				pr_err("Invalid value for maximum outstanding write-behind writes: %s.\n\tMust be between 0 and 16383.\n",
+ 						optarg);
+ 				exit(2);
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 19035caaec..be08d512d7 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            file://0001-Makefile-install-mdcheck.patch \
+           file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.34.1


