Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2A2C44506
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:30 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14782.1783866566168902837
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=dOvT9qIq;
 spf=pass (domain: underview.tech, ip: 74.125.224.54, mailfrom: vince@underview.tech)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664d78637f8so4152768d50.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866565; x=1784471365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZB56sPF6HXLkrQexTiEGWtEDUFkz7VbuMfCVba1w6PI=;
        b=dOvT9qIqCG6Ap+soXkc1ifdkBnGvjr2GcQIHfWq0h9SOSbqqTI5wcsZ6u+fhkxQ+06
         kvSCfIHzFJGo6w8o9eQNJHzGhlnTglGXvcO9yfPm56dJmNdTK/UElkjxCOIMeNIHjkym
         qUg1IAOBSMHx5OUSjsXovkW4mDPp2+mnfDWgolMruZDo68K0Dqdv+LP557N3b1tJha6D
         nuyBIfwagi3i4A4qfBy34GqLkyp0fq1nsN59sv/E85H1emPQkg/ubti04dQaavRLP2fY
         4iP2AJAcs51JCClGX+g2T6PDm85uLoSsM5/Z1D/T72oQzgMHdq6dy6UFLuK7H0XPbjmd
         BVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866565; x=1784471365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZB56sPF6HXLkrQexTiEGWtEDUFkz7VbuMfCVba1w6PI=;
        b=MQ76kIPkdUBrT4LVi66UwagDb3uyEHluvJ93X28Q62TzC7LcOpMvl1G8qqckWTOff8
         dvjHnSE0pbqNCWXtXULsDnE0JIjrldswvIhDeo4beQ53Ai1fMSufoY4tCt2k22FnOlAG
         HbkqdZY99h/HOX/Klp/WsgwCPPUhwjov3OVWlefW2QVuWGS4tGwCTjjOYlcefg+ch6dM
         7NzRbs3dp/42zGbUSo0MuBE3Tx+6uJoZqst4jls/BtF6lu74kqfsEyINjfG3tmC5YQ8g
         oxpgwm7HOR9Vw1EF/RccA6Rod804a3Q0iwxuK+vTDQLFqJY0sxntpmjl3YCq41T39DlB
         YUZA==
X-Gm-Message-State: AOJu0Yym4jhX5KqhYdP0PN9jm2iyn39aMimAT+VNnbNgYkSbK6Rbda0F
	3r0abhwsWnhNEsZun8b7oecgBDzf/7nq59NJF0B6f6kBzEpg0jCnkioPpvDbwKPTkzXS5UB14au
	Ic2LaCJE=
X-Gm-Gg: AfdE7cmDYLu9g01S+/rNqmMPQutC3233MPEddmjPTEb5QY2wvJff/+NCZkJPa5oKmtM
	Cnsxvusktkkqg+Zq92BLgqTGKAMy30otwd2Q4wcYAftEAdcf08AIRryZVRUmL9r/xadN1l2ucYj
	sMVfUX91zXXOtS6kQ+M32T/PNKujEGYut446ykOtTopac1sYIRayxiV0xqwB76i1+tLx0LfLlqr
	Btje+akJvq8vY4wz3hQe3XpfOqEX4JPO9VoGWZMuoqZbiKhW3KabVVYPKrtYlEOkb7jG6ecigJ6
	Wh01t4/qynIvQpv4k8YvkpTt64eEjIKfgYej7TzjH+buWPsP8y5BofzHKOMg6Hj9tVFZ+saWhE6
	HjmVzm96RTty21VchprX43CvQOWo41pvkXHEHvCT3dRmwL08hB67QuyHb4038T4agCSn+4hhswk
	CvdID6Bmu6d+yjwA==
X-Received: by 2002:a05:690c:4b8c:b0:80c:72a1:fca3 with SMTP id 00721157ae682-81e9005c21amr44075237b3.16.1783866565250;
        Sun, 12 Jul 2026 07:29:25 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:24 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 02/24] kernel: dont set WORKDIR if KERNEL_PACKAGE_NAME changes
Date: Sun, 12 Jul 2026 10:28:54 -0400
Message-ID: <20260712142916.2573370-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240768

Setting WORKDIR in the kernel recipes if
KERNEL_PACKAGE_NAME changes to the WORKDIR
of the recipe leads to other recipes such
as perf and make-mod-scripts build errors.
As they rely on globally set variables to
determine the location of the kernel-source.

Commit also removes KERNEL_PACKAGE_NAME variable
as it's set globally in bitbake.conf.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/classes-recipe/kernel.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 48e394b650..d8d44de27b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -12,7 +12,6 @@ COMPATIBLE_HOST = ".*-linux"
 REQUIRED_TUNE_FEATURES:riscv32 = "rv 32 i m a zicsr zifencei"
 REQUIRED_TUNE_FEATURES:riscv64 = "rv 64 i m a zicsr zifencei"
 
-KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "virtual/kernel"
@@ -67,18 +66,6 @@ python __anonymous () {
         bb.warn("Some packages (E.g. *-dev) might be missing due to "
                 "bug 11905 (variable KERNEL_PACKAGE_NAME == PN)")
 
-    # The default kernel recipe builds in a shared location defined by
-    # bitbake/distro confs: STAGING_KERNEL_DIR and STAGING_KERNEL_BUILDDIR.
-    # Set these variables to directories under ${WORKDIR} in alternate
-    # kernel recipes (I.e. where KERNEL_PACKAGE_NAME != kernel) so that they
-    # may build in parallel with the default kernel without clobbering.
-    if kpn != "kernel":
-        workdir = d.getVar("WORKDIR")
-        sourceDir = os.path.join(workdir, 'kernel-source')
-        artifactsDir = os.path.join(workdir, 'kernel-build-artifacts')
-        d.setVar("STAGING_KERNEL_DIR", sourceDir)
-        d.setVar("STAGING_KERNEL_BUILDDIR", artifactsDir)
-
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
     type = d.getVar('KERNEL_IMAGETYPE') or ""
     alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
-- 
2.43.0


