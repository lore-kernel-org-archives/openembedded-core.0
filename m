Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id D52996C29F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 10:34:50 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e3-v6so12701613wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 02:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=KCybKveEbu7OlZs7JxWu201hHq88f9XEVAJBz6KP2QQ=;
	b=EjLSvIsRuvCHKRfbDrMdUra3sQPs/EdxcT5G3Jd0sfNJpTjHYUc/DK2x0zbXMvDX8y
	PWn4LVi7pfgvDwe9d+0kxADl5+EtUv1I2aS/7d/IsLzCZih1TKbfJA/4cDxytzrIE+I7
	JalT46FlJEs7Qqeja/pT2xIbNOabJQ9ePzRxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KCybKveEbu7OlZs7JxWu201hHq88f9XEVAJBz6KP2QQ=;
	b=H4x6Qm3ENFdMG0hgaDXAdSMFvT4V+TW5Bpc9xH6U709/Ln9NyfCYSpP6rybeI/X4/W
	JwZ7+z95a0+lf9F1wIKp3rRGe5OIDvHcIXuqRo6tYYC6jfuzfMAj/8e2OUYU8T+skbqU
	t55pn4r2S5Q9i8Uyzo1ZNPMSf3MJag1TrJlOcSjRmhwPG8yBvtzoPwARof7jR1CcmMZK
	x9GZOAIDKI++J6fD8IkqLsif7tY2i4xG5yfeXuUv37C3mPgOIEhEZZiguTn8WcjZszlY
	zddsR2K9aSrRv8qG/381NujE+rntcQMNbJP8dFmLDarBJvj+kcfVWKWEzTS9W1msUrDU
	qx6w==
X-Gm-Message-State: AGRZ1gL56G8vK21sjCuwkIPvlieF9ueRFpTYzsSuIaF6LDhPDU+NBb7c
	0c039AxyX+omrEWT6/1d7Vi2rUbJdOo=
X-Google-Smtp-Source: AJdET5eXbiQKqM55Rdy46vVDtbc1eAyJEK1zSe470qRbEz3clSlSuCLAr5EYC2dfgOU3VEDrieIfkQ==
X-Received: by 2002:adf:a386:: with SMTP id
	l6-v6mr4755368wrb.110.1542105290913; 
	Tue, 13 Nov 2018 02:34:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o126-v6sm9054147wmo.3.2018.11.13.02.34.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 02:34:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 10:34:49 +0000
Message-Id: <20181113103449.27055-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] [rocko] python-3.5: Fix manifest to handle reprlib correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2018 10:34:51 -0000

The current line is looking for py files in __pycache__ which is incorrect.
Fix it to correctly include the right files (modelled after ${PN}-signal).

Patch isn't relavent to later releases since manifest generation changed
significantly.

[YOCTO #12831]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 0260e87e75f..710b22eaa38 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -194,7 +194,7 @@ FILES_${PN}-readline="${libdir}/python3.5/lib-dynload/readline.*.so ${libdir}/py
 
 SUMMARY_${PN}-reprlib="Python alternate repr() implementation"
 RDEPENDS_${PN}-reprlib="${PN}-core"
-FILES_${PN}-reprlib="${libdir}/python3.5/reprlib.py ${libdir}/python3.5/__pycache__/reprlib.py "
+FILES_${PN}-reprlib="${libdir}/python3.5/reprlib.* ${libdir}/python3.5/__pycache__/reprlib.* "
 
 SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 6352f8f1207..750d4fc7548 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -371,7 +371,7 @@ if __name__ == "__main__":
     "lib-dynload/readline.*.so rlcompleter.*" )
 
     m.addPackage( "${PN}-reprlib", "Python alternate repr() implementation", "${PN}-core",
-    "reprlib.py" )
+    "reprlib.*" )
 
     m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.*.so" )
-- 
2.17.1


