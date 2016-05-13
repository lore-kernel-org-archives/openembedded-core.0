Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9F3E6FF01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 23:50:00 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id yl2so9510249pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+IrbnELQ29GyGwMvsvpdRjM2IpvEVjoveSZlN/6dwkI=;
	b=UmjiFQrtoDYzV/fsseRQk7/fyHNF6W2vT/ZoZ9MD+lm2PHL8ECSwXmiPBY2wJ+zP5I
	o6L5edoJB8Ex2UnhRFDxE02ZVoEzwx1P8i/sYOCJ4bjs36ZLrdlNtyi4jGZyTdDhEWhv
	qefrBYYb7Cj6/SkI2RicrRvIrjlIzCBSPi3Ttwz95JAd3WBrLvg+QQ/Hocfsox3AFMG+
	g3ay9xOL8/AyPyNtWKqL6klOzGDAQ4krwzYEphxYkNJ8kGBr/+Yl8yjud5lylhhEncq8
	q/v41+xZYi0e1b8qVfROC/hZS+voEjbml3dmyd3xqyIUxhY6V88dRxVqiY8R4cinSY6L
	qY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+IrbnELQ29GyGwMvsvpdRjM2IpvEVjoveSZlN/6dwkI=;
	b=Y46ndcVp+iduUwwDlcqAedmmHJKKMZQoB4i6cKq94AdjMqBGl8lI8MvDbNsuU1/1x4
	pEg2Dj4Lvdxr6o0gbKSWGDX7RzznrAElmIL10JpZMzo02PSoN6m/c5NbfgcHlQshSYto
	Mj81ghDqfmy0mX/tCbj3CfJMTxriMwDEiMhhJK9a3d1d39JG/AgnFSuGhyjuY4pSf2xo
	tNqYznjRvTgn6COr1KU7Xv63s/I3j4m+HdL8IAlvUkGDDEyDonBYBtt0xbd8GAZ4jYjS
	dZeZ8jpU/5ktUfAQQ18Vhps4Osfse4Hb0GIDwTk0ciucKUnftsSAUesCUnUTvCFc9tyX
	OSVQ==
X-Gm-Message-State: AOPr4FWG3WmBOD5BdQ8wRVPI8ufPw6Wjpf+G3bC0q66nTkpdSxbRxbsnhe5wLOMOab+dVw==
X-Received: by 10.66.230.195 with SMTP id ta3mr27229610pac.150.1463183401348; 
	Fri, 13 May 2016 16:50:01 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o2sm29876606pfi.85.2016.05.13.16.49.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 16:50:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 13 May 2016 16:49:58 -0700
Message-Id: <1463183398-30980-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Joshua Lock <joshua.g.lock@intel.com>, Armin Kuster <akuster@mvista.com>
Subject: [jethro][PATCH] openssl: prevent ABI break from earlier jethro releases
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
X-List-Received-Date: Fri, 13 May 2016 23:50:02 -0000

From: Joshua Lock <joshua.g.lock@intel.com>

The backported upgrade to 1.0.2h included an updated GNU LD
version-script which results in an ABI change. In order to try and
respect ABI for existing binaries built against fido this commit
partially reverts the version-script to maintain the existing ABI
and instead only add the new symbols required by 1.0.2h.

Suggested-by: Martin Jansa <martin.jansa@gmail.com>
(From OE-Core rev: 480db6be99f9a53d8657b31b846f0079ee1a124f)

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssl/debian1.0.2/version-script.patch       | 31 +++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
index 29f11a2..f53efdb 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
@@ -15,8 +15,8 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld	2014-02-24 22:19:08.601827266 +0100
-@@ -0,0 +1,4608 @@
-+OPENSSL_1.0.2d {
+@@ -0,0 +1,4621 @@
++OPENSSL_1.0.0 {
 +	global:
 +		BIO_f_ssl;
 +		BIO_new_buffer_ssl_connect;
@@ -4314,6 +4314,14 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		CRYPTO_cbc128_decrypt;
 +		CRYPTO_cfb128_encrypt;
 +		CRYPTO_cfb128_8_encrypt;
++
++	local:
++		*;
++};
++
++
++OPENSSL_1.0.1 {
++	global:
 +		SSL_renegotiate_abbreviated;
 +		TLSv1_1_method;
 +		TLSv1_1_client_method;
@@ -4475,7 +4483,15 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		BIO_s_datagram_sctp;
 +		BIO_dgram_is_sctp;
 +		BIO_dgram_sctp_notification_cb;
++} OPENSSL_1.0.0;
++
++OPENSSL_1.0.1d {
++	global:
 +		CRYPTO_memcmp;
++} OPENSSL_1.0.1;
++
++OPENSSL_1.0.2 {
++	global:
 +		SSL_CTX_set_alpn_protos;
 +		SSL_set_alpn_protos;
 +		SSL_CTX_set_alpn_select_cb;
@@ -4613,23 +4629,20 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		BUF_strnlen;
 +		sk_deep_copy;
 +		SSL_test_functions;
-+
-+	local:
-+		*;
-+};
++} OPENSSL_1.0.1d;
 +
 +OPENSSL_1.0.2g {
 +       global:
 +               SRP_VBASE_get1_by_user;
 +               SRP_user_pwd_free;
-+} OPENSSL_1.0.2d;
++} OPENSSL_1.0.2;
 +
 Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld	2014-02-24 21:02:30.000000000 +0100
 @@ -0,0 +1,10 @@
-+OPENSSL_1.0.2 {
++OPENSSL_1.0.0 {
 +	global:
 +		bind_engine;
 +		v_check;
@@ -4644,7 +4657,7 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld	2014-02-24 21:02:30.000000000 +0100
 @@ -0,0 +1,10 @@
-+OPENSSL_1.0.2 {
++OPENSSL_1.0.0 {
 +	global:
 +		bind_engine;
 +		v_check;
-- 
2.3.5


