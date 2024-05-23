Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E63C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:58:29 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10246.1716451103182456157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 00:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WUka9RCO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e576057c56so69403421fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716451101; x=1717055901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jec7pWwC/C/Kb50kvZ0uQxl+7OdV4/Qfk5k7OTUxsEk=;
        b=WUka9RCO9vce94Kn8/jIWx3cuTT3Wp3JNHOqjBmCsmjzRHYyZeX+4P8TXscmBz0+ds
         QQKgalxPZQiwTJv3JWZy+UWZQJAKLPPLMGC0ZJptpW01lPvKGEN9E6DqOIuSDzCkV/Fq
         L8YPpr2NLnUsNXCvfqanlvlvnl3YYDCVy9vv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451101; x=1717055901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jec7pWwC/C/Kb50kvZ0uQxl+7OdV4/Qfk5k7OTUxsEk=;
        b=PM5rbHlQ/ORA3D4ek7ASpO+UwaSKczX9Hg5+dlw6xY9Z1VTZArgyr16854MSeSyrvB
         Qy+dw9se75MJdOHXwOtZqL/BkcaD4/e/1sibJIlCvop9rRdmGxzVLzSHs6y5QD50N0fq
         Rp1kM+NrlyrB1B6qB9stFrsQwew4/Tz4DPoNuK+ImVt6meXUgfQ4FTeMmUji3Z62fs9p
         TN575+lDSy+XAfsu+ZWmZwdD23E9UO0g8NpSsCmucfismJt1ToVXlmx4tRvINGRP2hOj
         Tvi/uOH49CfI3Hr3iLghFtCVrlPL6DqudmBIvdKe7Sp3GGNZxG+k4BBzpOOK/Vcu3Qxs
         6UCw==
X-Gm-Message-State: AOJu0Yy6e7Q13dQHrvExETMPGdvhYHF53KHhGiL0Wwo8YgPsuF+PLebm
	HRk0I0jY3c093ZxZzrZPhHpCqhn9JFQ+tRRL8EQLkJwLvySHS2lWdml7/BZ3HEdsXesi/bmuM53
	4
X-Google-Smtp-Source: AGHT+IE1/MKaLGov67W6oK8cKbDBi13biUGobsEK5qnU7mMYSnfgO34/GxxjAexMlCNIT0IUAjNg+A==
X-Received: by 2002:a2e:9c94:0:b0:2e1:ec20:9ae5 with SMTP id 38308e7fff4ca-2e9495d40e5mr22080651fa.31.1716451101279;
        Thu, 23 May 2024 00:58:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bf06:e9d5:d26:9301])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f75acesm17120265e9.27.2024.05.23.00.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:58:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] base/bitbake.conf: Move S/B to PSEUDO_IGNORE_PATHS unconditionally
Date: Thu, 23 May 2024 08:58:16 +0100
Message-Id: <20240523075818.2307756-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
References: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 07:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199781

Now S and B can't be set to WORKDIR, add to PSEUDO_IGNORE_PATHS unconditionally
and simplify the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 5 -----
 meta/conf/bitbake.conf           | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 13e91b24a3b..4ac7bafefab 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -433,11 +433,6 @@ python () {
     if d.getVar("B")[-1] == '/':
         bb.warn("Recipe %s sets B variable with trailing slash '%s', remove it" % (d.getVar("PN"), d.getVar("B")))
 
-    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("S")):
-        d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
-    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("B")):
-        d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
-
     # To add a recipe to the skip list , set:
     #   SKIP_RECIPE[pn] = "message"
     pn = d.getVar('PN')
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 75c850760f6..3ef2deb088b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -752,7 +752,7 @@ PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
 PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR}"
 PSEUDO_IGNORE_PATHS .= ",${TMPDIR}/sstate-control,${TMPDIR}/buildstats,${TMPDIR}/sysroots-components,${TMPDIR}/pkgdata"
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/deploy-,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/pkgdata-sysroot"
-PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
+PSEUDO_IGNORE_PATHS .= ",${DEPLOY_DIR},${BUILDHISTORY_DIR},${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR},${S},${B}"
 
 export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
-- 
2.40.1


