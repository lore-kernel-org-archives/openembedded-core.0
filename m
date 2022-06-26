Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8726DC43334
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 09:45:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.28512.1656236712028218058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iTpt1zUx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id k129so2264738wme.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cQpvyQ5LZPCBF6phB1WznzDEpCBFzdaJPz7JXWytWDk=;
        b=iTpt1zUx/vK5n9m7i64Vzy3oImAOga3aQ7f/r6ggcOsmh1ug4JISwV9GD24VgyKN/b
         3kSR06loMWlEDpkdpaQsB4X+KDC0veRYMinhYPFJIoy9nyQmN9UtT7WlNhHLwSqwWJI1
         PS70xzuEZHaS0yQkGLWjJY0FiXulyNEntNiqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cQpvyQ5LZPCBF6phB1WznzDEpCBFzdaJPz7JXWytWDk=;
        b=yShreYmEVmIQMsYjJ1Yqt9vtBz6AOX63D4CPciFxtsn1AgplR2kV238g+/LN5k1xN6
         XDyQrOu+wT+/3/ulVQoyVgKiX4JSTWHaxSulcadXL6s5OMV6zXWl0K6ybUHu+y/HPn3l
         8dwN+stQFvPO/6bnIEycNzHCN5c1pEZYV9TT0XdeOwZKa/sxs2u91GavqY9soJEa081F
         N1udolIWhEde60NJnM3Ywe+MgkgiRu2P02VhuSb3YllPqMFzJ4pNbJJ18tFaDDmf4NmM
         kWWtyUIu977/EVXikM+YAUnJhPs1snEiDw7fYayk38i6W7khWu465KmmWquKTiCyJDLH
         0W6w==
X-Gm-Message-State: AJIora9b+3ljAZlVipSWi7A42oUl3l/ZXfEXWEh/YRFAt4ByWSUqR4bi
	ZJQ7XBY0Uhq/vFHbkefTrhPVwQYIuCOxqA==
X-Google-Smtp-Source: 
 AGRyM1tKtS/9ZBcYEMUmruPIlT29iqsIOwOjjoXfeUAMX7OdWgkuWWfIvAMmbRUw6UiX2+DlnlKTBw==
X-Received: by 2002:a05:600c:17cf:b0:39c:4b79:78c9 with SMTP id
 y15-20020a05600c17cf00b0039c4b7978c9mr8601406wmo.96.1656236710239;
        Sun, 26 Jun 2022 02:45:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2873:558:fe47:ee6f])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm7305018wru.47.2022.06.26.02.45.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 02:45:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] bitbake.conf: Change -dev RDEPENDS to RRECOMMENDS
Date: Sun, 26 Jun 2022 10:45:05 +0100
Message-Id: <20220626094506.352336-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
References: <20220626094506.352336-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 09:45:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167305

Switch the default DEPENDS for ${PN}-dev to be a RRECOMMENDS instead. This
takes advantage of a change to complmentary package globbing to not follow
RRECOMMENDS and means and SDK for an image with both openssh and dropbear
compoments will now build successfully.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                    | 2 +-
 meta/lib/oeqa/selftest/cases/oescripts.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 40a893fe1c6..1d36aae8b35 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -350,7 +350,7 @@ FILES:${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
 SECTION:${PN}-dev = "devel"
 ALLOW_EMPTY:${PN}-dev = "1"
 DEV_PKG_DEPENDENCY = "${PN} (= ${EXTENDPKGV})"
-RDEPENDS:${PN}-dev = "${DEV_PKG_DEPENDENCY}"
+RRECOMMENDS:${PN}-dev = "${DEV_PKG_DEPENDENCY}"
 
 FILES:${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
 SECTION:${PN}-staticdev = "devel"
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index bd84f151cb3..d3a789a6a77 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -21,7 +21,7 @@ class BuildhistoryDiffTests(BuildhistoryBase):
         pkgv = result.output.rstrip()
         result = runCmd("buildhistory-diff -p %s" % get_bb_var('BUILDHISTORY_DIR'))
         expected_endlines = [
-            "xcursor-transparent-theme-dev: RDEPENDS: removed \"xcursor-transparent-theme (['= %s-r1'])\", added \"xcursor-transparent-theme (['= %s-r0'])\"" % (pkgv, pkgv),
+            "xcursor-transparent-theme-dev: RRECOMMENDS: removed \"xcursor-transparent-theme (['= %s-r1'])\", added \"xcursor-transparent-theme (['= %s-r0'])\"" % (pkgv, pkgv),
             "xcursor-transparent-theme-staticdev: RDEPENDS: removed \"xcursor-transparent-theme-dev (['= %s-r1'])\", added \"xcursor-transparent-theme-dev (['= %s-r0'])\"" % (pkgv, pkgv)
         ]
         for line in result.output.splitlines():
-- 
2.34.1


