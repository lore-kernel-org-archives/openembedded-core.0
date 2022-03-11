Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F55C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:59:46 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.7897.1647017985380271305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Sj5aoYQ7;
 spf=pass (domain: linaro.org, ip: 209.85.160.171,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f171.google.com with SMTP id v14so3456016qta.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A090djiaN9dz+blep93GbQ3eoF/qRBBTMJqTtOpurFY=;
        b=Sj5aoYQ7uNDjqpzlCJqQztIsbLgrUPRfgDbwEs14MgpT2UJ20OE3nANomNEhb5IbFO
         Xq3OF++SybJI8wzAlH1YnU5vVHi054YBS9i49zPpyP1fhQmkZyHDflqq/SfxVTFmRuGc
         DkTacmP+fGLJzoqnRRJF8nCoS6CgCZiETrn8OaG4kkgmCjNBnKTi8Dj/PyqMUye6eTqL
         MxCib51HQND2iazffep3FAyLEUvebKkPM7YRin2akpXgu4QiADXUykPcrQdwIiE0U5Xq
         WQUOeJ3j3ZO2WoBnO1AuivS3UKnl7KOmJYe+ghaWOGdbQw/8eQtGYN5UFGcdo+eYId7Y
         XWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A090djiaN9dz+blep93GbQ3eoF/qRBBTMJqTtOpurFY=;
        b=R0DMZq9+6ebtmDyI+gcNYTKxus6tPfb1h3YVLYL4d63BxrHRZywQKLahiIQtLRLspN
         3Q+Jj3PqHpdWCujppT8aHv07o6C4KvVzAbwjBPq4d0fFpQRzasLt4m0Aa0RE5KrE3Cdl
         MLddI0LqEBazwNYZWWYr3bygOFD34oqljgrhhzan0bdfjfxDGGLTRbrIMu3XqYPC7eNp
         vyrnND0DaWeekCDo6SudCuYYHiOwzQev68GI91r3y2WzdBc+8kjBmRBEeZdtc2vODfnO
         qQ7guDtyPFcPDTNrjehAMvtE9U1L6aE/znZvF1p1YZ9kNTKB0K8FU4k+mxS9LkDThjJm
         GeIg==
X-Gm-Message-State: AOAM5311JAYis5FVx0Hgwi9hmBWXduy3QbPQUu6SqltoTe139t++lNrR
	o+CBsmQeGSOek1A+OKVhm1BqDU/SiGgfog==
X-Google-Smtp-Source: 
 ABdhPJzJ2zZGpg5vfW1oRN7gTv/f4KB8De4Wx8DCfAYXG37tzl6aK0VE6kKNkx0YoWg03RuKa09igw==
X-Received: by 2002:a05:622a:195:b0:2e1:bce1:712b with SMTP id
 s21-20020a05622a019500b002e1bce1712bmr2645633qtw.114.1647017984448;
        Fri, 11 Mar 2022 08:59:44 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 b126-20020a376784000000b0067d21404704sm4066370qkc.131.2022.03.11.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 08:59:44 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: tony.tascioglu@windriver.com,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [RFC PATCH 1/2] libxml2: move to gitlab.gnome.org
Date: Fri, 11 Mar 2022 11:58:54 -0500
Message-Id: <20220311165855.3477645-2-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
References: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 16:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163061

The project has migrated from www.xmlsoft.org to gitlab.gnome.org.
Update the homepage accordingly, and use gnomebase to construct the
download URL, rather than including it in SRC_URI explicitly.

Note that the download is now in .xz format rather than .gz, so the
sha256sum is updated accordingly. Post-decompression tarballs are
identical, so there is no change to the libxml2 code.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-core/libxml/libxml2_2.9.12.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-core/libxml/libxml2_2.9.12.bb
index a7939c9713..3508733cc0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -1,6 +1,6 @@
 SUMMARY = "XML C Parser Library and Toolkit"
 DESCRIPTION = "The XML Parser Library allows for manipulation of XML files.  Libxml2 exports Push and Pull type parser interfaces for both XML and HTML.  It can do DTD validation at parse time, on a parsed document instance or with an arbitrary DTD.  Libxml2 includes complete XPath, XPointer and Xinclude implementations.  It also has a SAX like interface, which is designed to be compatible with Expat."
-HOMEPAGE = "http://www.xmlsoft.org/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
 
 DEPENDS = "zlib virtual/libiconv"
 
-SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
-           http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
+inherit gnomebase
+
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
            file://libxml-64bit.patch \
            file://runtest.patch \
            file://run-ptest \
@@ -24,7 +25,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0002-Work-around-lxml-API-abuse.patch \
            "
 
-SRC_URI[libtar.sha256sum] = "c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92"
+SRC_URI[archive.sha256sum] = "28a92f6ab1f311acf5e478564c49088ef0ac77090d9c719bbc5d518f1fe62eb9"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.25.1


