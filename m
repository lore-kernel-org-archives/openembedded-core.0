Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 453E47318C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 01:28:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7O1Sjqo016311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:28:45 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 23 Aug 2016 18:28:44 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2016 09:27:07 +0800
Message-ID: <f20b9c7e821936eab36d19670ae1a6273db7ea74.1472001956.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472001956.git.kai.kang@windriver.com>
References: <cover.1472001956.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bind: enable threads support and use epoll
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
X-List-Received-Date: Wed, 24 Aug 2016 01:28:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Disable threads support for bind is inherited from legacy openembedded.
And all libc's support proper threading on Linux now, so enable threads
support for bind.

But static libraries cause package dhcp fails to compile after enable
threads support. So enable to build shared libraries rather than static
libs to fix the failure.

Options devpoll and epoll are configured to choose most preferable
multiplex method for unix socket. The priorities are: epoll > poll >
select. When set '--enable-epoll', it just defines a var and include
header file that is available for cross compile. So use epoll for bind.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
index a99f0dd..04e8e4a 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
@@ -31,9 +31,9 @@ SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
 SRC_URI[sha256sum] = "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
-EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
-                 --disable-devpoll --disable-epoll --with-gost=no \
-                 --with-gssapi=no --with-ecdsa=yes \
+EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --with-libtool \
+                 --enable-threads --disable-devpoll --enable-epoll \
+                 --with-gost=no --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_LIBDIR}/.. \
                "
-- 
2.9.3


