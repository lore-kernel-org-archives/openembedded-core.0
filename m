Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B95E10A3D9C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46601.1774529494164867167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gKbI0hCk;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so11217675e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529492; x=1775134292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=gKbI0hCkyXEKqq51vxVIwCyxo8hFWjFyZFCm9PvJT0E/5kHK3exJH8TMFXl0xJCBZl
         Gth6L2aF1QuPOht1Q83Kdp5EorJJj3H+Ov7qyemDcpNQ/nJCMLK/kMnjLe54lYfGUqSg
         Cxo8xau46+X81jEzak5l7KwL9hvklEc4sal9CX92mJutST4cgjxIYcKmiu7+PVAaPMgp
         E3RU6yXy1xd2gGekwDzP5Aqa2fkti+c0DauFXVPlqSlJOXjeuTPpxaIPxV7wo/bProQv
         ZOPfamE/9WQpc/4WyyQLeEndypknyqY6xEgIfDGVRAG3BDr2kBS1u9VXgf/phqXru4gF
         YxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529492; x=1775134292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/fy7bOJBzaaTfUTEmgSvjzdr/zfZur/Mb98ZPMPNFcA=;
        b=kUjNzZDntkZhR+1js+TRcLc3m3VUtJOKcPihL+TT/iSSFvhPh6wczIsXAaVqS9X6/3
         od1gYUU4kjsneBQhnEKhitlbqm+J58UdQl9NoF/lyvhQmHmbImDaTvOzvQsA4z/S9xKF
         UC/h6SIiGPAqt2bniykYUFoDaH9w/oH+gkV8JaoOmrQeMYWsT+VZkk2M7c0Jh53aHSTE
         O0bo8ozgKycvmedyCPl09yeA14zdpINgA3jv8bDeEflqjDUbyyntEZcKTsVKDEtW06Q+
         gcvbEUQiLpq2BtzSLqNq49BY1aX/Q9vsRVs4HRZrc+qtTbn6YqmYLtCAxdCO6wgCl0LM
         s6fw==
X-Gm-Message-State: AOJu0Yz2sMU2r2vQsNd2TPz/YGeC1NrtOdf9UR1X2XHWg07/MMdanNrX
	C4TwMHOEZk5NcmNpTYDtB1JM3QEiVBaaVF/Uk/MkFA879hwfP/EdoTG0N/i+YQ==
X-Gm-Gg: ATEYQzzY+QfmH1QFfoH+Fi+KR5/Qp9TUr2Lwu2qQ6yyoJUkH3SWl7OWhmJZgKdvFiQu
	Au1Cc1dM5lTExa7ao9NVxUNGKIriT3T7KfoWVtstvPeFxf3BR3aMNQHxqhhdFdQqtddsP7+KMHw
	kKw39a6PSocMIxiXQ9c6Gf0RbJQ/XBm2VSeJdZInIMz+u1OrrymFXFXuBt2m9yjdtVBZou6K6TP
	xUEn4CTA1Xq46H4Y2yAJySUf9JfNtn824yQ2OBO0Rj416GUhauuDooymK4jrOxc4W0vnU9+8tPW
	J4PMj8ZBgah0rnfkdq1NoNAozO8AI8lNHdxhqaS2bGUELhUGgihltgWSWZjZ6zo/BBX0gxEpF7C
	iZWZ7iMpYPMirccFO/7t+RpoinHehzR7Kh4rCpzqFG9uYSVpUS152RwPv3AzZkZqjQjMGFQhwH0
	kIjrd9ooC+EsmBhQ==
X-Received: by 2002:a05:600c:524e:b0:486:d76c:fa51 with SMTP id 5b1f17b1804b1-48716071a07mr115548185e9.27.1774529492285;
        Thu, 26 Mar 2026 05:51:32 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:31 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 12/13] hwlatdetect: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 13:42:33 +0100
Message-ID: <20260326125113.1853869-13-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233997

Instead of custom constructing the python directory,
use PYTHON_DIR for consistency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..d37909cd87 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 require rt-tests.inc
 inherit python3-dir
 
-EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
+EXTRA_OEMAKE += "PYLIB=${libdir}/${PYTHON_DIR}/dist-packages"
 
 do_compile() {
 	oe_runmake hwlatdetect
@@ -18,9 +18,9 @@ do_install() {
         oe_runmake install_hwlatdetect DESTDIR=${D} SBINDIR=${sbindir} \
 	           MANDIR=${mandir} INCLUDEDIR=${includedir}
 
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py
+        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py
 }
 
-FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
+FILES:${PN} += "${libdir}/${PYTHON_DIR}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
 RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
-- 
2.53.0


