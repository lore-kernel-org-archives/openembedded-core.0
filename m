Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4AA579CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 10:52:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so84001899wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lk5L0Aw5J5kjYYSp5b0bI08XEHHErr4qxK4+yRDxX2M=;
	b=fjU8+6r455qz6k3gRApqSATjW1TWVjA8VlmoJS3pjHKsoGkYMc11/mMke6bWn68U8+
	4feRdEa4gF2EagRPT+dzYWVYPHLd4lQrb+Vot9JMzQrCxRqVQaOtTskH/Go/yQWOTwal
	RBpBzngmQu7UTRcTdNgrCA1f4c//lRkFyffNKhe9BViSoQMQHxgd+4//B7RmLM2ajSSY
	xkRyyAU8iZZmcDwIKFB/xwyZhbwn4RR3caEWf6mnAiQV8qcvDO8BxY6MFDNF+3ZtclG1
	I5NQchuGCae9EABzwpc5I1F4oMY9pUK0Ch+gT9a3cyBHfnfQ0wZYFj82iosoHJvofU4f
	fqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lk5L0Aw5J5kjYYSp5b0bI08XEHHErr4qxK4+yRDxX2M=;
	b=OKZUeEKe1zRO4iSw8kPtyave5VPuf8kXOc9VG2WDvzpmhvz0HuE99KCteccsZsANYb
	1TZaA4D6G8I6l4fpDetQ0kV59txLRcM+CCdSNJkNLBXTTiM9OTH8qnyPcGFTjMT90WCO
	bNmamV5CQcpqb3OaGn5++Jxcn6S31Jhj6ZRmB8Oi31QtzL5tI4lWUCTVSI7o8VzX5/6n
	jDxagkUTJzRZvQtDdBBHOe/xL5cMr1v29/9m6DvsLqs3YNCxhvYxzMbHELU/LLe5M0IA
	WCxUR4h6JLuocYd7rzlfZUzpfWRBp3E6BARzBtR5ginv9NlFq18LVJyqBAT8NxPRr9f8
	uBvw==
X-Gm-Message-State: APjAAAUWzAqm0/phQx+2Z5L2srHpxPmSV8kIVw9dZ86MOKlftAJwb6ee
	9rW78KG+Ne/L3AVbmOX99m8HT/XR
X-Google-Smtp-Source: APXvYqyFHwFlzcc3QpGGX02iIaVy5EfhXQd6efMMLlKsG5DFO32dbxY/lg2P4kSHKhe0BDlJsnycew==
X-Received: by 2002:adf:9f0e:: with SMTP id l14mr20583172wrf.23.1565002355040; 
	Mon, 05 Aug 2019 03:52:35 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	o11sm79589302wmh.37.2019.08.05.03.52.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 03:52:34 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 11:52:32 +0100
Message-Id: <20190805105232.16148-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Mon, 05 Aug 2019 10:52:35 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

python3-setuptools is necessary to build pygobject but not to run it, as
also documented by the upstream packaging guide:

https://gitlab.gnome.org/GNOME/pygobject/blob/master/docs/packagingguide.rst

Move it to DEPENDS to shrink the runtime dependency chain, as setuptools
includes scripts to download other packages, which might not be desired on
a minimal image.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.32.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
index 05688be603..58a251f8eb 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
-DEPENDS += "python3 glib-2.0"
+DEPENDS += "python3 python3-setuptools glib-2.0"
 
 SRCNAME="pygobject"
 
@@ -27,7 +27,5 @@ PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wa
 # we don't link against python3-pycairo -> RDEPENDS
 PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
 
-RDEPENDS_${PN} += "python3-setuptools"
-
 BBCLASSEXTEND = "native"
 PACKAGECONFIG_class-native = ""
-- 
2.20.1


