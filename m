Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5107C64ED8
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:31:17 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.2086.1676399474776716960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 10:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=osvoChvl;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id t8so1358154qvr.5
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uymz/5sllMaseRuw2RkWERs1A3SGqh7YMhZqrlrIQk=;
        b=osvoChvlGTfcXEvXUIYiY4cuMw7Mzfk5rpmCEBZDcQmjvuD2FMDFZ7VGEdBMzFqR1P
         3VFDPv0pr2bYblf5PXhYJKqdHG57mv2WJedGGEWzlVDdvxrfy3zptAxPII4hLpjkcfdA
         wofLx9UOK5C/ZDOdXJ+ENVFq7KtxHqZY+lAJVMmSAixOOXDeTtOmnKZ17eXTnA3y1BSJ
         u64ya2iZeO6Hvk/esVr6uVpTSWEvKjnARXX4oS4BGVQ257ggaS47Ck/CJSH1cCMl6VJS
         Ef4NZkrG6+0U0lN/vbbTcGvtwYpgiuPz6tu7ThSv6zOdj0smRljGKw1TWuEzSR+bwnIn
         1OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uymz/5sllMaseRuw2RkWERs1A3SGqh7YMhZqrlrIQk=;
        b=uAUY9OFl/D8dGczAquc+LHlYB8mAQchE0/DBqxeAG5TyjivxBKvzfZvH529R13ghYM
         aeJtaPH8Se9hrWRgVEWBFBUaQ6qgpD1U4uXK4TIxiWEJyFGrePq3sfZfY8N5ULkGSKqh
         2XIvAD2d8DcL7vfqy8R/P0kPVhLH5VDR3QoNbQtQ8oby6a8G+P7w+K+iC2k53bLQOqs2
         AmOupEn7mxObLY7BSLQnVqFTYe75uLowA81/0NeF+kO1jN03haPrbXltzjY5QxrDhUws
         S7r3RKzjh/Zcec333172m7e8gmSCczoyg0U4Sa29pNgMa9r81GbL8RnhPAYq7ea1pomh
         H+Gw==
X-Gm-Message-State: AO0yUKWcLuOo3+X7Rkze+TGGgCqnvHD2l6iAU2gTAyxQnSn+WOdVUEmk
	iz669UExLzj5pWAAbP1e11gNAHfrovQ=
X-Google-Smtp-Source: AK7set9BGpSEujtwvP/BPvcZafMR0cz+s8HKvADYeHqc1w9LAP07hwFvqARSKlBmQHbdt0k97Mno4A==
X-Received: by 2002:a05:6214:c6e:b0:56e:ab46:c481 with SMTP id t14-20020a0562140c6e00b0056eab46c481mr761607qvj.20.1676399473477;
        Tue, 14 Feb 2023 10:31:13 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e7-20020a378207000000b0071a49ac0e05sm12184387qkd.111.2023.02.14.10.31.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 10:31:12 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/4] python3-yamllint: add
Date: Tue, 14 Feb 2023 13:31:00 -0500
Message-Id: <20230214183101.33761-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230214183101.33761-1-twoerner@gmail.com>
References: <20230214183101.33761-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 18:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177172

Add a recipe for yamllint, which is used in a kernel devshell for dtb
checking.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/conf/distro/include/maintainers.inc          |  1 +
 .../python/python3-yamllint_1.29.0.bb             | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-yamllint_1.29.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ec7ea90d16a6..02aa6cb1b2cf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -704,6 +704,7 @@ RECIPE_MAINTAINER:pn-python3-vcversioner = "Bruce Ashfield <bruce.ashfield@gmail
 RECIPE_MAINTAINER:pn-python3-wcwidth = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wheel = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-yamllint = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-zipp = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-devtools/python/python3-yamllint_1.29.0.bb b/meta/recipes-devtools/python/python3-yamllint_1.29.0.bb
new file mode 100644
index 000000000000..4125c485c610
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-yamllint_1.29.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "A linter for yaml files"
+HOMEPAGE = "https://github.com/adrienverge/yamllint"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "yamllint"
+
+SRC_URI[sha256sum] = "66a755d5fbcbb8831f1a9568676329b5bac82c37995bcc9afd048b6459f9fa48"
+
+DEPENDS += "python3-setuptools-scm-native"
+RDEPENDS:${PN} += "python3-pyyaml"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.36.0.rc2.17.g4027e30c53


