Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.61415.1600092742705226814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ucUM49HV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id z17so3891893pgc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MU87kiBipR51KjovRpiJ8H/TFg0wYfembppFL6n6ihc=;
        b=ucUM49HVVg02acqq1+Eu6oTNUcAweeSKGya+rE0Y/xJVerHCGODGuUtOrgAqFhovB2
         DMurF0pQ4mXFnB9rF/UXENalIAYoiJXSj2W+W9yjHXxDi+LN/0JdFuCdmmInPZP9bgqP
         9+Z+xxvQFnvQPPaAs1DXX49JujwNbyZ0/x6HT+XGqIeQeyBUhQzjN1oeKibKMi7vu8uF
         eBjfd4Qnk3ut9oJ7T1OVw5iNzVxxIL/HNYhnlisgFYDQVmayqIurusxn9OREAN4KfKE7
         +kNCPkwkRmIx2G+G45NlyNtrNA/CgcvW3fllWO6MERWuWyvFqJouLPYrxQDZyzwLPcZr
         Ikow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MU87kiBipR51KjovRpiJ8H/TFg0wYfembppFL6n6ihc=;
        b=qkfT7ztqZuzfApxyTUBxiaRgSMBqRWKM1H57CzmKzry2Cb/CZgHEBDO7Dd6+SgUtjD
         VDs+dhCvtplpOQix7D52CQs+uMQLX1rk8AKptTvRNDQvSiI0yR92feUQ5bEaXXcsvqsi
         qraOWZI5X3ISZ81y2FJNegQdT6W2JCk6UNjujAZCSK1IWK5cA9e+jORkCbUC6V0oIrhw
         Tbqotba8m7Pr1jdjDfZN7c7i6vPuyO/shZX2WC63XQRx/Co39F3LiAGrCq0ZF/TFQcFy
         q/1OzE3qqDtz2JyX7Ighd5lsXB4fah8lEexlubaI1SFgwoI/sXYRu4rgFjHLrD7611e1
         1W3g==
X-Gm-Message-State: AOAM531z0TDxD596iVXNxjeA6jnBojm0zjctkhz0emPMTUHeyaTwCu+v
	w17VR4/k8lnnY5rGG9bzIqMgRAChZ+0nLawj+R4=
X-Google-Smtp-Source: ABdhPJwP8WdokbKKiSuQG1S8aElo/3Kg0/ve4yDEfY6OqCTYsoGDCOeDh6VrdpyejvSXhj8ZPkoz+A==
X-Received: by 2002:a17:902:a715:b029:d0:89f3:28cf with SMTP id w21-20020a170902a715b02900d089f328cfmr14567389plq.11.1600092741871;
        Mon, 14 Sep 2020 07:12:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/24] autoconf: consolidate DEPENDS
Date: Mon, 14 Sep 2020 04:11:26 -1000
Message-Id: <32902a2763a7557d52bf27f3717b8f9b27275284.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Depending on nativesdk- varients in a nativesdk build isn't correct, so
just collapse the DEPENDS down and let bitbake do the right thing (which
is leaving them as -native).

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4864167ad4ed4c57e49f2aa5e7c58383bddb052b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 2c87bf8296..36a48d9116 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -5,9 +5,8 @@ file that lists the operating system features that the package can use, in the f
 LICENSE = "GPLv3"
 HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
-DEPENDS += "m4-native"
-DEPENDS_class-native = "m4-native gnu-config-native"
-DEPENDS_class-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
+DEPENDS = "m4-native gnu-config-native"
+
 RDEPENDS_${PN} = "m4 gnu-config \
 		  perl \
 		  perl-module-bytes \
-- 
2.17.1

