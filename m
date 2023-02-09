Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FF6C636D6
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 18:38:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.25010.1675967881808742541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 10:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dvNMae1k;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id c2so3053073qtw.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GTcemTCwk7apIuNbZ1E1EAiDk/7/jDGWx4f7Lwcz2i8=;
        b=dvNMae1kf85J8s8Rd3ODtLVIy55N6I87Redx1I1odhfdploz6cB2Q8yLAgcrX9iwaQ
         66soy0VykvOabkZ51Zmw45xhxMR9h25+StpcG2td4pb4ZbgznbwpEGvYKnNPsYZpC7vK
         lcB3GCZW/PC+XCfODMDMKN0dnUxZFO/KEeH6QHhX9XuqvFwjjWJR0+tUnx+ITkx15LZl
         psHUv+BJ99j46SeDGp1xjThyj5sSuCRJMd7gqJGChCxwio0OXQjeJzZL0Bg5rbFX8V9W
         mT7SRlMPObazelWNabbICOiKH5/7T34UiQEmb6Ky+C0hMvnISg394gCEnXQ6Zs1DKRYh
         //nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTcemTCwk7apIuNbZ1E1EAiDk/7/jDGWx4f7Lwcz2i8=;
        b=aowSvVKaEsZokjxg6nmNIH5+rEFGyx4HQAmhifj/BJjk2vV6z51o726lwK6oCE/d7Z
         1BLXmIkQafZBnm9g6CzWXs+OannbqBISaNG2x/dh5fe+Hqvk7OyJ8VJvjMCaAaq2eDxh
         JIFwaWweYgww8Dgwg4gQSdGoL33EuFeHq81KW9CTXFoKz9J1iiAUz6rRi4ikHUN0Vl+R
         4pSKeq3dpkjxhkQcK2LznstjPte4wasnlpait6PmzAaiWvadqX8QRwlU9AHRIqXq3Odn
         J15rjHGKvWB5GDtethhCMoH9tbH2FjMX7B1idhy9bA5thgAzswixCVWhD5r41xnSwvKY
         h24g==
X-Gm-Message-State: AO0yUKUbA3NLyhKeawhH3on+CtU//Zd24BJxJKF6QYMIBLneiCwtfPgX
	8jn7hDBW4kcAd0SYdPc1JhTF0ONg1kk=
X-Google-Smtp-Source: AK7set8nZfXsqBu/5k5+pRvnSVSt3JDtORiDw7kbBcS/HLHBszoiZSSNUTR8FsCIPPL81H06aOeeRw==
X-Received: by 2002:ac8:5949:0:b0:3b8:41f4:94e7 with SMTP id 9-20020ac85949000000b003b841f494e7mr19912219qtz.17.1675967880610;
        Thu, 09 Feb 2023 10:38:00 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id l67-20020a37bb46000000b0071d0f1d01easm1871845qkf.57.2023.02.09.10.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:37:59 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-dtschema: add dependency on pylibfdt
Date: Thu,  9 Feb 2023 13:37:55 -0500
Message-Id: <20230209183756.625-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 18:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176966

dt-schema has a dependency on pylibfdt.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../python/python3-dtschema_2023.1.bb              |  2 +-
 .../python/python3-pylibfdt_1.6.1.bb               | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
index 9767c95d3043..24bded9710a9 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
@@ -10,6 +10,6 @@ PYPI_PACKAGE = "dtschema"
 SRC_URI[sha256sum] = "8fc8c269e4c57e9d008af7b32cd33b77afd4ea1ac9552bcfa96b41b9e0c52586"
 
 DEPENDS += "python3-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
+RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987 python3-pylibfdt"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
new file mode 100644
index 000000000000..966f8f1413fb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "libfdt from the dtc project"
+HOMEPAGE = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "pylibfdt"
+
+SRC_URI[sha256sum] = "90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778"
+
+DEPENDS += "python3-setuptools-scm-native swig-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.36.0.rc2.17.g4027e30c53


