Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 88D336F5B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:41:07 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id rr13so4377790pbb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZNTQD0gjL7moeRG520N7BKVPvwXBzuCVDzQuTeHoTzo=;
	b=AckEi5nHtbHxeJJSDDFwQl7WvY6g+F2on0Sn8JAHzsmq/ajxraDdpwP8LH0qwVKljs
	50v0xO2GoiCiUFMyIfzWBBS+V10EePGdxaK7/ZNvioU01tH607IprRFHm51hawh//uU2
	/e1yDH7SFFS4N9van8zzRirsBzyhbMzGPDhtSlzQjV8IhMNW+z6yEzHxX94uNaNAy+h5
	URtHPQZfZP9/R8tToTuhbqjyYedkzoS4enBIlS2+Fks89JuMilDyjUYMXIlElkUeJwyO
	Zjvme7qKSac4O03sL6BhV+3oMYtqlEkgAHYshP8yn7VfWrrHlRRCwHPFjrRBMjuaWIzc
	YUWA==
X-Received: by 10.68.197.66 with SMTP id is2mr18297788pbc.96.1394948469085;
	Sat, 15 Mar 2014 22:41:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vo1sm51397193pab.32.2014.03.15.22.41.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:41:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:28 -0700
Message-Id: <88b735f562f6dafde6c85e95171c39206009e2a0.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
References: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] gnutls: Link in pthread explicitly for uclibc
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:08 -0000

Otherwise we end up with missing symbols from libpthread

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 39aaec1..25ec3a6 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -44,4 +44,6 @@ FILES_${PN}-extra = "${libdir}/libgnutls-extra.so.*"
 FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
 
+LDFLAGS_append_libc-uclibc += " -pthread"
+
 BBCLASSEXTEND = "native"
-- 
1.9.0


