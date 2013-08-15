Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id BBDBC6B8BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:00 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so183451ead.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8lc7PwHC4zeSRm4MoNtGH//c9QsEEKP42/UT5qzYx7k=;
	b=jP7jpcgqSdFBH4dx3+manYip/JHQy/vTBxEM0YsPX1GSCNCJsnHMOC7004ayqyxtsr
	WxrMEyzPfkS4EPeqmGiT9rlOizlKzku6b8+/l8AOuirf0Nn1XRspKBHhYojyk/wRCiVn
	Il8u/wECGccURrr6T1LyOOL+6hNDGFFuczdWZpUvriWAdEQ2PVzip2OQFe7bppCUR9S7
	3nmaMU7VSGdeCj/SasACR76t9qlp1mXqLxNF4yLgGAPQXRUKXtaUHDdLCerNqwACbwzE
	9tbCM8maRxm1NV+gIaOUWl4JIB13Xc0U73g4DKsYt953UhzI5Oh85Tye5pUMwQ5R0J7m
	cxmg==
X-Received: by 10.14.251.10 with SMTP id a10mr247549ees.76.1376551381218;
	Thu, 15 Aug 2013 00:23:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm81968605eeb.11.2013.08.15.00.23.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:17 +0200
Message-Id: <9aecf76e5bfc11053c5f9ea83c79023cc04c0717.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 06/33] libpam: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:01 -0000

* missing dependency on pkgconfig-native was causing
  that PKG_CHECK_MODULES(DBUS, dbus-1) stayed unexpanded in
  configure script:
  checking for dbm_store in -lndbm... no
  libpam/1.1.6-r2/Linux-PAM-1.1.6/configure:
  line 14217: syntax error near unexpected token `libtirpc,'
  libpam/1.1.6-r2/Linux-PAM-1.1.6/configure:
  line 14217: `      PKG_CHECK_MODULES(libtirpc, libtirpc,'
  Configure failed. The contents of all config.log files follows to aid
  debugging

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 79fe022..ba377ad 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -38,7 +38,7 @@ PR = "r2"
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
-- 
1.8.3.2


