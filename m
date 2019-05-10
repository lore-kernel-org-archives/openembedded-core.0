Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1440A7E0EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 21:54:55 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r4so9317209wro.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 14:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=X7sxWL/tCl4jF+JeOUz+srdq1kW7clp8Q3RfOcfNaJk=;
	b=XBGJbHCjCJNznE62zXX1TBieaUHhur7hxBU5AGO9jU2PDDCMYJuUiSiJmpbsXWO9JE
	qA/3q3JDIWipm+3hd50DU7c33Z5yW+2d+ozluplcdKFFbbgvhOuduYcZ5KX6N24nOXcw
	QTijZ9V873Xg3EmsokASrsKLGI9sCmoY800gRgGKuNcY0YJPxf59DvPTlueBBkwezEXc
	5U5Go+LHAFonFs3ENxugtUDhakSy7GdldkHXDFnNERFh1UAc8wDuRDVBN35ju7cImsUy
	LYLDm39NgWJvIs8c62pMPltVjBE9wEPTpvEjGPXyKJW9CSNOynIbQK2nKhUJ/gc2VVzf
	4P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X7sxWL/tCl4jF+JeOUz+srdq1kW7clp8Q3RfOcfNaJk=;
	b=KQl6Bj4aaQgiQ6AW7lZ0HPLC6EkKgPf3FIQz8IxFKX+0yQEKAY0c6J0R3L/22WzLMa
	gF5ZFlqGJZNzlov1luyfCfhYGDoh/Plw8JNDb/aZbwkC/jWiuTMxebx29seBeMiq94r+
	QF0wekSd9qx+abqggDz+aQqBdv7Np/LeBP5xpizM15hcWxuaX39stMMmzxRl5vRCh/Kq
	MXOoRxs7Ezjf3gg9K5zsh20WqvVQPP526suHNgeTec6sTzMC7hjxM0F1NBY1dua494NU
	vuAu6xeYsZMXjErGfyLPpTp5NwYOLClu14xoXQ+As2RXmXEKlMC5/JSuPj74QgzrmYrR
	fqSg==
X-Gm-Message-State: APjAAAWEtkmWMA5Z9oF7DaMO0XQvYxaU+nlE0Luwb8jYiSlzU5MPt8az
	4tCvenFfrF751nzq1hby1Hg4awgT
X-Google-Smtp-Source: APXvYqyuJJleMtK52bZQnwiCr8EN0l5I003gwSkTa8J9sKivDBSCRd/DPDKsFPIBRDTju6u907q1+A==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr571403wrn.222.1557525296418;
	Fri, 10 May 2019 14:54:56 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 4sm7066404wmi.4.2019.05.10.14.54.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 May 2019 14:54:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 21:55:00 +0000
Message-Id: <20190510215500.18914-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Fri, 10 May 2019 21:54:56 -0000

* gnutls from meta-gplv2 isn't new enough for this version of glib-networking:
  meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls' ['>= 3.4.6'] found '3.3.30'

* disabling gnutls PACKAGECONFIG isn't an option either:
  meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled. Please enable at least one TLS backend

* add an option to replace gnutls with openssl

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
index 09af229d69..e2b4cffb2b 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
@@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
 PACKAGECONFIG ??= "gnutls"
 
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
+PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
 
 EXTRA_OEMESON = "-Dgnome_proxy=disabled"
-- 
2.17.1


