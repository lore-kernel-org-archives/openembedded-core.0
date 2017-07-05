Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44E3077972
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:05:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6585xvO016406
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:06:00 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:05:59 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jul 2017 15:58:14 +0800
Message-ID: <f66a80ddb1ba569ce0e27d561d776a260601ef3d.1499241206.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1499241206.git.kai.kang@windriver.com>
References: <cover.1499241206.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] openssl: disable weak ciphers
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
X-List-Received-Date: Wed, 05 Jul 2017 08:05:59 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Check distro feature 'openssl-no-weak-ciphers' to disable weak ciphers
provided by openssl:

* des
* ec
* ecdh
* ecdsa
* md2
* mdc2

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 3980ec2..69845df 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -52,6 +52,11 @@ RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
 # vulnerability
 EXTRA_OECONF = " -no-ssl3"
 
+WEAKCIPHERS = "${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', \
+               'no-des no-ec no-ecdh no-ecdsa no-md2 no-mdc2', '', d)}"
+EXTRA_OECONF_append_class-target = " ${WEAKCIPHERS}"
+EXTRA_OECONF_append_class-nativesdk = " ${WEAKCIPHERS}"
+
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
 }
-- 
2.10.1


