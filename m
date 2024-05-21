Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5ACC25B78
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.1254.1716311093704911566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rEkPlUwT;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-792bd1f5b28so390052285a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311092; x=1716915892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7kxppOgVCMG01ezd1Q/rgEFLLq8fm5bGoCh2q0HnIg=;
        b=rEkPlUwTocWt0pR8MbAhecdvHL23zbpRLpkWCWZr+L02S4fs9OC6tGsRvaIPaZNnqv
         11j6+dcK1asywjs8WDa+55UXsSXe+QF1dQ/7MYf+8Fm9EtVi+oSBrMZuA0913NL0o2yr
         k5ty8juvU6e0bFSn023QvHKfhvmJe6kBhUKZYnK9FyvE2lnAyhspFXup3CZ1ljMtb5v7
         hhXhBsQK+fPGKx8IBCbXgvMAUyb2kFPdYgkP98R/C1cP2R7PIJJP/jwcQF6ohoVRLjWN
         aUxa7QIaJg1eKz9f8zQj1/rZ1Qxc0KsHwOQ3097yr6BBNt0kHXHGfsXvpyTHaHWniccJ
         MUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311092; x=1716915892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7kxppOgVCMG01ezd1Q/rgEFLLq8fm5bGoCh2q0HnIg=;
        b=ruBmAiTGb+g2On1c2cAfZvjUs/NKYV7bphSqdML3vRKytPxR6tMKme6BZakat/x1Or
         snnQ1eW5zgDBUTDuAXgp+y8dl6YCODk5TAmBsFqG6EU/hePJ+9NM69XZApNfo7UVFvdP
         UJF0mkGDXiTJDLrUQLwZICFCxMVFMIVX+UTj1wmgm/iO2jRlPavgfkCt/ivxdcA3TSKZ
         FCMJ1fZ5ABngvjubC/mouguGS1AdqeNSk91qGBthiozYOzHbDTZnl7aoPLZPQiFmxZ5G
         F/C0SCE/vJ/fQcs4nZiROFnF3kC0tjDvwh+OWQad4t8ufbZ37I4/C2JtLgqCtmTVe8g2
         l/wA==
X-Gm-Message-State: AOJu0YxqDZ/dNc8JdlfaWiImNWjL2uYtcutMaPVrMpgQtmJb/kaaq3gF
	FYzlpsaoal4KtxeTq0tQh5BspXsAUQ8uL9SvomFfKowuZOxZRtkMFuS3VGV5OCP6D6tNIIt4Mfg
	k
X-Google-Smtp-Source: AGHT+IEUV7FE0l299WllBCPGLFhXOPFgTg13r1fDkmTB4lYqpBh5wZO6CqAUDK0I+aZu5xTw2GKSlw==
X-Received: by 2002:a05:620a:b16:b0:792:c42b:edc1 with SMTP id af79cd13be357-792c75aee49mr3242571185a.39.1716311092638;
        Tue, 21 May 2024 10:04:52 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:52 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 08/10] python3-sphinx: upgrade 7.2.6 -> 7.3.7
Date: Tue, 21 May 2024 13:04:43 -0400
Message-ID: <20240521170445.1892398-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199664

License-Update: Update copyright year, add .rst extension

There are many changes brought in by this uprev, in particular with the
major release 7.3.0, which contains many bugfixes and new features. Changelog:
https://www.sphinx-doc.org/en/master/changes.html#release-7-3-7-released-apr-19-2024

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-sphinx_7.2.6.bb => python3-sphinx_7.3.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.2.6.bb => python3-sphinx_7.3.7.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.2.6.bb b/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
index f4ed0720ff6..a1cae2abc00 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.2.6.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb6ac1b115a1ed24a12d9f15b633993"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b6c681698874edd2eb9eaff7cc9de642"
 
-SRC_URI[sha256sum] = "9a5160e1ea90688d5963ba09a2dcd8bdd526620edbb65c328728f1b2228d5ab5"
+SRC_URI[sha256sum] = "a4a7db75ed37531c05002d56ed6948d4c42f473a36f46e1382b0bd76ca9627bc"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.45.1


