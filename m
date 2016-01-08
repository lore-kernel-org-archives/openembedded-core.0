Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id C38A075D4B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:39 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id 6so270213272qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/JMWb1fF8fJn97uqDvs/kshVNHoGEwBJW/9CSAoxEXc=;
	b=CZAtsTncd8mPGW/xmGcWlEHrSPqh1joSDnJbaSkkyyWD8FhlOwCap+KtJcBdClLJxZ
	0eLr88oJmCS11/Sy4k/kfhyW2NBTfmLIU/s/OgYD77mqnHNP7HfJSFmndGOBQXH2igFA
	d93ICRB9W8xvoAmqwXXbbDQqrwDmfPQJo4jBH8Y4mFd268a5bQeAE+i4oy2GV3SsX4/X
	2hVileOb4RjD6ykem99ejg3+0fq+ag8RUAGvHNlGH7BVhniZND+Fy/yloCfr/nTHoM15
	jx5P0opj8pFPH1/9Oouut2ng2vOpO+JasJ3PF3ZeN/HYZOxU/jj/vA9Jk/l6UWgdA8Mf
	+v4w==
X-Received: by 10.140.99.5 with SMTP id p5mr139136684qge.76.1452248380305;
	Fri, 08 Jan 2016 02:19:40 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:47 +0000
Message-Id: <fdd28ead535ba90b55b6fef1568e440d8266c173.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 19/53] gnutls: Link with libuargp on uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:40 -0000

uclibc has its own implementation for libargp

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 5bcfc9c..90597db 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,7 +1,7 @@
 SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "nettle libidn"
+DEPENDS = "nettle libidn virtual/libiconv"
 DEPENDS_append_libc-musl = " argp-standalone "
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
@@ -30,6 +30,7 @@ EXTRA_OECONF="--disable-rpath \
               --enable-openssl-compatibility \
               "
 LDFLAGS_append_libc-musl = " -largp "
+LDFLAGS_append_libc-uclibc = " -luargp "
 
 do_configure_prepend() {
 	for dir in . lib; do
-- 
2.7.0


