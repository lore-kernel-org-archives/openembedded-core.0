Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 021827F2F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 11:47:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id s15so2101580wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bckWdXqXFZT0iMLhxmq955Ih0yNBxaq33LK9MAPKHiw=;
	b=nXiuYiNJojhDzGJGpL+Ewlgyfx2Km2vsJA96YVPtj6jKq4FI+kMthKpYg/hpbvboOn
	TyonZhqDWYCkqnbrA/X/UOIRaUoW94ptKHVy3L4d3aDfo0HlaJOMHHQYpXm1bX8wnzE2
	KP/gF8v0OZEF0g/aR3EnOMKanhCL5Ar/tgvv76JWZY6CzZH7gRw8ISDBdzOx1cbXkTWe
	IPqZY84cc3JNqKe3IQBGuZ+C9M6+3YZkzvXC3wZtMOz14MKM3SjJnYnzY79/2pYuMYP1
	dp37B0stIk9qIPvDl2ppRAAtQbmZfQ8oJAKWVDtDBGmRW/3wOb8NnGZADj/zATZc4F7o
	2ZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bckWdXqXFZT0iMLhxmq955Ih0yNBxaq33LK9MAPKHiw=;
	b=IGUnq9KLMXcoaOqdhdvl+7kPyguSuIz/9beQAfaVP+VUeDpZzeig682TCVXneG/aPe
	RfWWlXVaci+Zb+YH0WfWGDOS8IwvNgTmFHCnme+BCkzdr6o+27JGvoX61BEUoK3k5WO9
	aHsMHyUOSVl4ob2sfBak0oQFZeEP0P9oWLLRR+QOifXRH6u3XvM6pRCD1LFRjB5xIKyZ
	WjEHQL//dRPfkubeRIUx0AnhBzbwkU/gTXcJO0gC3TMLJ7KRDOkJTfClXBqiyqtwU6u5
	37AFlHnqrhJTfgv04J8EYzRwVI0PL9g10wMmpCIZMQvlGgjn0OwZrEmV36rMp9KpJStT
	uBnQ==
X-Gm-Message-State: APjAAAWE1wjp9vNpr3TAeCdLLMBfHnMykDhK1srvHjnNkb0dagv96DeI
	N7kqZv31CD/00auUdm340p2mSK5N
X-Google-Smtp-Source: APXvYqy5hAFmc0pNsPbVFYtzcnP6lY26jIogsaCdPtBZtByIoqSxrMYd5u4upKOe7FGaaf3hQZw/RQ==
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr3893412wme.157.1565264832008;
	Thu, 08 Aug 2019 04:47:12 -0700 (PDT)
Received: from localhost ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id
	b5sm77277518wru.69.2019.08.08.04.47.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 04:47:10 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 12:47:01 +0100
Message-Id: <20190808114701.20464-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805105232.16148-1-luca.boccassi@gmail.com>
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 11:47:12 -0000
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
v2: use -native suffix as requested during the code review

 meta/recipes-devtools/python/python3-pygobject_3.32.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
index 05688be603..9e4ce31d8c 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
-DEPENDS += "python3 glib-2.0"
+DEPENDS += "python3 python3-setuptools-native glib-2.0"
 
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


