Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id E91D9759B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:46 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id 6so270214878qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LHqXhiQFtSdLpPh5h07VV4fwPEvZisdw8UQOENhOcw8=;
	b=l3KtvZXyBzjnKqWVEz5JgnHaIrJKsOfFb5N7k3wzhCPNxomSWmW5kZvFGo3V5xyGOP
	1MYMkVer7aaygpRjW8YrfvTkIZcyNtrASQqbfRSIP7nhgfslGb26OWLWEQntPSmYqOXd
	5Ils7BueGAPg8aXPHQ+6ytEWQLGNQAsAGArNI8ZrHSutwPwqyOoecbFZCIpHSmZ1MHh5
	BtqaS0+RSxOSxBoPrVlf72qdUr02NrYuFIiFkMo/OSK1jWKDCg2b3a7Vr6jpXVeXksv/
	oFCjOfnbA+v21Q4WoSiT6WxRwLCd2OMv1OWulCr7YTafBNvHcxSxfzfgCjJUqMGrkxXK
	Skmw==
X-Received: by 10.140.218.72 with SMTP id o69mr15689720qhb.22.1452248387418;
	Fri, 08 Jan 2016 02:19:47 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:58 +0000
Message-Id: <aa131735726856532f21d5f3264251679ca7d030.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 30/53] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:47 -0000

From: Kai Kang <kai.kang@windriver.com>

This reverts commit fcd7494b347423185c883b2897c4908929843a71.

It uses command glib-genmarshal to build glib-2.0 which is from
glibc-2.0-native. If the command doesn't exist on host, build fails
with error:

| /bin/sh: --prefix=test_marshal: command not found
| make[4]: *** [testmarshal.c] Error 127

So add the dependency back.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 86f7e0e..8e4dcd7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -17,10 +17,10 @@ SECTION = "libs"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "virtual/libiconv libffi zlib"
-DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' glib-2.0-native dbus', '', d)}"
+DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
+DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
-DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib"
+DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib ${BPN}-native"
 
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
-- 
2.7.0


