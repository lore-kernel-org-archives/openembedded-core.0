Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC014EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 06:33:38 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.15646.1688625212469970970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 23:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=Do2aGDKd;
 spf=pass (domain: mvista.com, ip: 209.85.167.181, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-39ca120c103so399705b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 23:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688625211; x=1691217211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=il3XvZFOCDyXe25UpgsYZEk4zsX5vaLgWLMdRjdv7EA=;
        b=Do2aGDKdVN4AyLqxll8w33KkEozdspkyjBWSvkqB7aSKp8X5wTKzHORXKJiNECwo89
         bopenbI5UBvDkuD1LrwK/36FQyEZuenoYoXQxNC9IgDiPMcF/3BcDWUkUXqUW6C1VWkk
         fi9SnX9j8XSp6a0BJIUqTVfSiAwwTOw4+kmnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688625211; x=1691217211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=il3XvZFOCDyXe25UpgsYZEk4zsX5vaLgWLMdRjdv7EA=;
        b=eE6cqkGyQVP6K3S8+cM5gj26GyVUek3PnjnFDBXgPxgtuN+Xk4BAflgiOKhNVfL0Sl
         LLDnetdn+xpE9xcGpTtF2uP2aS0NRG28fBcjV1rBIuAUig0VJ8Dyqku35nsMWjaX6w8N
         gUWn21F6VcHWGuebVgJy5Era3YQ9Gyk2+Ld89mNDomVhK/NyqJNy9HiaK/QFHQo+do7t
         L+D3cHY1k5dBZBS7DiUwepBH0XZNJx4ZVJVz42+RlOfUCNvs5px+cH1Nl6XQXiaCQ+xz
         CRdSaXuLvYh881KhF49KgdJctDKCF4jUaVrgE/hGpC++IvPVg8K/19BPWrR1dVf+8F3E
         vwIw==
X-Gm-Message-State: ABy/qLb/7mW8qgvkQ4afOKEslbL8SHIGHVe1BJrrZBsOijPldCojutx+
	waRgja67RFcqzks+jWZjBjmfCzlEZ99LdoQCuZKMaQ==
X-Google-Smtp-Source: APBJJlElLMH05O5LbboqUZ5ipGRkiS5Dj/8HgMmXyf2UYXU3RiKh3MzaF/SnRQD+/JytiW6yIo0hig==
X-Received: by 2002:a05:6808:1407:b0:398:268a:1d00 with SMTP id w7-20020a056808140700b00398268a1d00mr847458oiv.51.1688625211566;
        Wed, 05 Jul 2023 23:33:31 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.194])
        by smtp.gmail.com with ESMTPSA id om7-20020a17090b3a8700b0025c1cfdb93esm594448pjb.13.2023.07.05.23.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 23:33:31 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 06 Jul 2023 12:03:26 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] grub2: CVE-2021-20225 Heap out-of-bounds write in short form option parser
Date: Thu,  6 Jul 2023 12:03:24 +0530
Message-Id: <20230706063324.125030-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183914

Upstream-Status: Backport [https://launchpad.net/debian/+source/grub2/2.02+dfsg1-20+deb10u4/]

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../grub/files/CVE-2021-20225.patch           | 57 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-20225.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-20225.patch b/meta/recipes-bsp/grub/files/CVE-2021-20225.patch
new file mode 100644
index 0000000000..7764f3c09d
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-20225.patch
@@ -0,0 +1,57 @@
+From a37238099c88de04fa43d9f15583ba33c2ec43f4 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 22 Jan 2021 16:07:29 +1100
+Subject: lib/arg: Block repeated short options that require an argument
+
+Fuzzing found the following crash:
+
+  search -hhhhhhhhhhhhhf
+
+We didn't allocate enough option space for 13 hints because the
+allocation code counts the number of discrete arguments (i.e. argc).
+However, the shortopt parsing code will happily keep processing
+a combination of short options without checking if those short
+options require an argument. This means you can easily end writing
+past the allocated option space.
+
+This fixes a OOB write which can cause heap corruption.
+
+Fixes: CVE-2021-20225
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://launchpad.net/debian/+source/grub2/2.02+dfsg1-20+deb10u4/]
+CVE: CVE-2021-20225
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/lib/arg.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/grub-core/lib/arg.c b/grub-core/lib/arg.c
+index 3288609..537c5e9 100644
+--- a/grub-core/lib/arg.c
++++ b/grub-core/lib/arg.c
+@@ -299,6 +299,19 @@ grub_arg_parse (grub_extcmd_t cmd, int argc, char **argv,
+ 		 it can have an argument value.  */
+ 	      if (*curshort)
+ 		{
++		  /*
++		   * Only permit further short opts if this one doesn't
++		   * require a value.
++		   */
++		  if (opt->type != ARG_TYPE_NONE &&
++		      !(opt->flags & GRUB_ARG_OPTION_OPTIONAL))
++		    {
++		      grub_error (GRUB_ERR_BAD_ARGUMENT,
++				  N_("missing mandatory option for `%s'"),
++				  opt->longarg);
++		      goto fail;
++		    }
++
+ 		  if (parse_option (cmd, opt, 0, usr) || grub_errno)
+ 		    goto fail;
+ 		}
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index cb79f2212b..9da18a2adc 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -107,6 +107,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-2601.patch \
            file://CVE-2022-3775.patch \
            file://CVE-2020-27749.patch \
+           file://CVE-2021-20225.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


