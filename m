Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 704D37CDF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:20:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id h18so272383wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/2oV7x80mIThXwDcqcpI8unBuSXfo/ktQfsSwItDyeE=;
	b=F4plxVE8twLUasb3lGykV9Q/c843fBvTF4QPmoNzS9BLcFU1NnptmjaPpnfUkVRKC1
	gZ9uE2AtrsPWLdm+xdovQI6ywaT9MxBFN/sIbJQJ70aDGDp/rMyHxfWIBvrtmIjofWr0
	QiDpopQT4i11IeLRlwMp/IoQwbOI5UnfrJMvFe3tkIbx8ial7Bqbogm9CWd2Z3J90uRj
	W8Z55/lvfCZfryWSkqeSGd1oCCCcagxuL0bEwN+QaLD2KGTmYmFRgutee1C4Ktl9cipS
	mDpZfVMGpw1XYxRqUbuF8zGeajeXq9QbgJYaFFAgZT+tRxddYedPN60k3TXrElOfFf+j
	TqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/2oV7x80mIThXwDcqcpI8unBuSXfo/ktQfsSwItDyeE=;
	b=oHbhUbxTvaMs2y7kds57wTcead5RIXnUgic3VM1VmZ00mF9zLdFaoZ+3x+D6RMHKtl
	CTB9pkqP/iQIy1Oy/OK+PQkkvr3O791fIdMH40o30KyxdK4CQoLvyPYtGiUPR1WhjJxX
	OeVrzP4gMwkmnDd3JXBO+yL4IuRJMV0axOHLZ3ehPzxcFP4os2XqthWnlNy5+Uz+LBtK
	yMhQ7/K3jckGOHPV2/uFsWYb5Tjl7yeJaYTNNPK2ThKAQ3Q9VW/ayryApHG3iz867hHD
	JiLqzn++AU8qntTbS5ZiidUtEdUExRs+RrMjb3vc+ftscHFZmZ75Yw0Op5h2aV4oG1Kq
	SWLg==
X-Gm-Message-State: APjAAAUu52vZBobNPwoW55UsSC8NulR0YKLMgLWuEJyF/XyIeSsfYQCb
	0CAM5FIQ7ZgFGRrE2YbJiKKCcLV9Qi4=
X-Google-Smtp-Source: APXvYqwTjZ8sMxKaU4AEc1poDF/lVs3E7fmKMiP/YQs55DtkLobErNy77MEF619rG34htzukSpkj4A==
X-Received: by 2002:a1c:a004:: with SMTP id j4mr17882332wme.143.1553696407932; 
	Wed, 27 Mar 2019 07:20:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id h84sm225758wmf.15.2019.03.27.07.20.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:20:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 14:20:05 +0000
Message-Id: <20190327142005.17453-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] asciidoc: use Python 3 port
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
X-List-Received-Date: Wed, 27 Mar 2019 14:20:07 -0000

There's a sort-of-official port of asciidoc to Python 3.  Whilst the official
replacement is asciidoctor which is rewritten in Ruby, this is a fairly trivial
swap and removes Python 2 from core-image-sato builds entirely.

Moving forward we should evaluate asciidoctor, but that can wait.

Change the RDEPENDS so that python3 is only a dependency for target and
nativesdk builds, for native this can use the host python3.

Remove redundant DESTDIR export that isn't needed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index 38164d55735..d0d15171ac4 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -8,17 +8,20 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
 
-SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "c59018f105be8d022714b826b0be130a"
-SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0"
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
+SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
+PV .= "+py3-git${SRCPV}"
 
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/asciidoc/files/"
+DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
 
+S = "${WORKDIR}/git"
+
+# Not using automake
 inherit autotools-brokensep
+CLEANBROKEN = "1"
 
-export DESTDIR = "${D}"
-DEPENDS_class-native = "docbook-xml-dtd4-native"
-RDEPENDS_${PN} += "python" 
-BBCLASSEXTEND = "native"
+# target and nativesdk needs python3, but for native we can use the host.
+RDEPENDS_${PN} += "python3"
+RDEPENDS_remove_class-native = "python3"
 
-CLEANBROKEN = "1"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


