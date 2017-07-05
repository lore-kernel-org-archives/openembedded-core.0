Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAE377972
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:06:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v65861RA011624
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:06:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:06:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jul 2017 15:58:15 +0800
Message-ID: <35164d05e9ab2505c931424d4b7c7b9fea9c65f8.1499241206.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1499241206.git.kai.kang@windriver.com>
References: <cover.1499241206.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bind: disable ecdsa if openssl doesn't support it
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
X-List-Received-Date: Wed, 05 Jul 2017 08:06:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Distro feature 'openssl-no-weak-ciphers' is introduced to disable
openssl weak ciphers support which include ecdsa. So configure bind
without ecdsa if openssl doesn't support it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index 7eb79b0..e10cffc 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -41,6 +41,7 @@ ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ye
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --disable-devpoll --enable-epoll --with-gost=no \
                  --with-gssapi=no --with-ecdsa=yes \
+                 --with-ecdsa=${@bb.utils.contains('DISTRO_FEATURES', 'openssl-no-weak-ciphers', 'no', 'yes', d)} \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
-- 
2.10.1


