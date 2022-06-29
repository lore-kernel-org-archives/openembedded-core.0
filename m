Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7F0C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 05:54:32 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.8146.1656482061823827207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 22:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=a3H6GQmw;
 spf=pass (domain: mvista.com, ip: 209.85.216.45,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id l2so13486702pjf.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 22:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FcF4TZnFtgtiQH2r6txKMet2+JE/5cID1nzbV8Zt3A4=;
        b=a3H6GQmwGOyRCcc+fm8tgxa1KgmEPzpcEDEPWr5df6iLV8XWSFvuKtZq91GLw1R/NQ
         BMKHpBQbCDPZBknpEQUPcMR8B7bSbd+t0TntQkWBX0Ih1dVeLmEMLkkLgql0+NuClv+W
         ZD4ZjOqsM+RqtRvK+akR+UvqNA7uVY6xgiQqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FcF4TZnFtgtiQH2r6txKMet2+JE/5cID1nzbV8Zt3A4=;
        b=fC0kbHXBe1poI8bcvi3PRrpA0bZtaAWWQw0SZExvo7Yck/bTrKQkayXAe2TwgPOrjn
         o439PijppWY0JNm7Vr7MuJOtZ/ezQ1vDh8NV+ZSMFiTmzT05wwVlDe2txi7CHvuyacVX
         o3RvsHpISDnhIWtfLSpbXQzteeMo958JVStAU83QGibdgdNb2mULnsDjmQ6WVHNYisre
         kSI8UR9y4tWBAPZc203tUkmMWlv9QT0scMuzSnOwpUewuO9xsPEh+h3r0IW7dRJRAXAa
         wOfoF31vyjEF9jXDbopj0mnou1WjQuU9wIIhpiqQ8kQTGeEibb2m9pDkK8xbj23uNROI
         zbwA==
X-Gm-Message-State: AJIora+W0Ryz6LeckpvDYWixOMahGow/PlPFqkf47/ActJCn6Y9QF/eX
	n7HI5B7N9aXes7Z6Tz8hCUYB43lrkIaeOA==
X-Google-Smtp-Source: 
 AGRyM1vGCR6linyaUw0QbMiGch/KG0uiFnWEyHHYdJVx/TnRNLCLKtIQoFHCX9xsTNbew1z9dlnLIw==
X-Received: by 2002:a17:902:e84a:b0:16a:5435:b5fc with SMTP id
 t10-20020a170902e84a00b0016a5435b5fcmr9043600plg.119.1656482061012;
        Tue, 28 Jun 2022 22:54:21 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.82])
        by smtp.gmail.com with ESMTPSA id
 j13-20020a17090a738d00b001cd4989fec6sm1032236pjg.18.2022.06.28.22.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 22:54:20 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 29 Jun 2022 11:24:15 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] grub2: CVE-2021-3981 Incorrect permission in
 grub.cfg allow unprivileged user to read the file content
Date: Wed, 29 Jun 2022 11:24:07 +0530
Message-Id: <20220629055407.9146-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 05:54:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167367

Source: https://git.savannah.gnu.org/cgit/grub.git/
MR: 116495
Type: Security Fix
Disposition: Backport from https://git.savannah.gnu.org/cgit/grub.git/diff/util/grub-mkconfig.in?id=0adec29674561034771c13e446069b41ef41e4d4
ChangeID: fce3d59e50320bef247bb981352051b8f953a4fc
Description:
        CVE-2021-3981 grub2: Incorrect permission in grub.cfg allow unprivileged user to read the file content.

Affects "grub2 < 2.06"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../grub/files/CVE-2021-3981.patch            | 32 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3981.patch b/meta/recipes-bsp/grub/files/CVE-2021-3981.patch
new file mode 100644
index 0000000000..e27027ea65
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3981.patch
@@ -0,0 +1,32 @@
+From 67740c43c9326956ea5cd6be77f813b5499a56a5 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 27 Jun 2022 10:15:29 +0530
+Subject: [PATCH] CVE-2021-3981
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/diff/util/grub-mkconfig.in?id=0adec29674561034771c13e446069b41ef41e4d4]
+CVE: CVE-2021-3981
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ util/grub-mkconfig.in | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
+index 9f477ff..ead94a6 100644
+--- a/util/grub-mkconfig.in
++++ b/util/grub-mkconfig.in
+@@ -287,7 +287,11 @@ and /etc/grub.d/* files or please file a bug report with
+     exit 1
+   else
+     # none of the children aborted with error, install the new grub.cfg
+-    mv -f ${grub_cfg}.new ${grub_cfg}
++    oldumask=$(umask)
++    umask 077
++    cat ${grub_cfg}.new > ${grub_cfg}
++    umask $oldumask
++    rm -f ${grub_cfg}.new
+   fi
+ fi
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0d3f6d05da..9e98d8249d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -95,6 +95,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
            file://0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch \
            file://0046-script-execute-Avoid-crash-when-using-outside-a-func.patch \
+           file://CVE-2021-3981.patch\
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


