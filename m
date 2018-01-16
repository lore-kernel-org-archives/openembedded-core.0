Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF97C71B1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 20:05:53 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id f11so6064365wre.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PIiR4YzLM5PuyjK7DPdo6Ym3Tv11tbu0tEd76ckiRcg=;
	b=ZCWxU3kTbKEapMV3mZnA1zzNQJCXvLsQn0KnZLmqSRWg3qjrysocJQ1HJeRuZ+zKVq
	OXwFYljsg39VjzWuprz9KZW8JZwNUNVZYY0eFiD7RmUnolDhsHdg3xsDkCsEdKD02S40
	UFIWqFP3cIJnKRhRlfYHfIVTQJawojn3nkzy0xViS9MeGcWjuXLj+M2FGplfkARzkL/I
	HSQDouDO0299uYJdDKYV32MrrZewpnBU2jUU6lxJT/2QL7Z2LposM3bQG6ogslXgXiHu
	DuDRdl+irSYOYdgkP3AWc7qj833OZH7XajQneiY8naMfqOB96b0SEK5/mjzSgfT/OTYa
	q3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PIiR4YzLM5PuyjK7DPdo6Ym3Tv11tbu0tEd76ckiRcg=;
	b=biqI9Z0CILY8Ijy4fdJ98zAwLP0cGsshhro2uJbGzBubbdARkJ55PiFlpksovIyQCg
	JyyV0nyRFlC916qC3lcF6gzwjzFS9qaVQE2J6+6zMn13gjPK0QwvOWp8n0UWwo7HC2TX
	l4kD5WbUu/9N8xeV5JQRG28SFsElx3LeHI0Ay7ewCCbPz/575MolzcJ+cWhNH1mqGRXe
	Fu6Cm44JJuOzoQYuF2jDEBEn20bZTF397H32Oj0KDKFV3IiluB5r2Bf6lPwafx3/Ygpz
	/6C3G0t7MNsg5QDdtXWa04Q5d0xsNi+d/66a+itfE79+sZYxbxsZM901ks42Ju5zUOP4
	Kukw==
X-Gm-Message-State: AKwxytcYjwuUjtIuheOkFA4ooGq4XTvdmPgPcr3TpnMgkL05TeGKU1kF
	LBrhy/G5CCgpKPsuazhMlqHOBgvW
X-Google-Smtp-Source: ACJfBosRpAHUcjHkga+bPPkw2uxtf5VV6erNKccNGQZ5vhxSnGsiGIPUAlg2XWlelpVbjKyzuMdE7Q==
X-Received: by 10.223.160.23 with SMTP id k23mr365550wrk.116.1516133154324;
	Tue, 16 Jan 2018 12:05:54 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k40sm2517686wre.71.2018.01.16.12.05.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 12:05:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2018 20:05:50 +0000
Message-Id: <20180116200550.16731-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python-pygobject: skip the package if gobject-introspection is disabled
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
X-List-Received-Date: Tue, 16 Jan 2018 20:05:54 -0000

This package simply produced obscure errors if gobject-introspection is
disabled, so refuse to build in that situation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.26.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
index 0405b44f177..b12d5174446 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.26.1.bb
@@ -17,7 +17,6 @@ SRC_URI[sha256sum] = "f5577b9b9c70cabb9a60d81b855d488b767c66f867432e7fb64aa7269b
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-
 PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
 
 # python3-pycairo is checked on configuration -> DEPENDS
@@ -28,3 +27,8 @@ RDEPENDS_${PN} += "python3-setuptools python3-importlib"
 
 BBCLASSEXTEND = "native"
 PACKAGECONFIG_class-native = ""
+
+python () {
+    if d.getVar("GI_DATA_ENABLED") != "True":
+        raise bb.parse.SkipPackage("gobject-introspection won't work, disabling recipe")
+}
-- 
2.11.0


