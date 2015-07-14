Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E5BE665C98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:30:37 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so6495364iec.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 01:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FQ2ST7rEbKiJYyTe9G2mMGd7KfTvZWy8WjwBEKE6ENM=;
	b=PPahs78xOV2CHonzKN0sq2ayNwUOwk5cM14l1lmqt2z9MgKWnXVcdqv4yVzUDmn0WF
	8aGrkD4ziB5GRzFDW4qUCXPpECj3XKhCNrjd+D+6wETywjNSRT3jo6EsHLscs0ERdAvA
	NVsjQKrWU9UIXUCiGhJsersggRyUX2KnaQ6WMJ97wDjSwd4On4Y3Iom08v//gWjfeFbv
	gwa5gaArsi89I8blxmuURmqG6eqCl/ZEhrSLGTVgR2cQ7d5YtFBBx/3I7sLT6xhrNj4S
	Qbhcl3Jc1Ay5LuXUp5RltWRbqqSi8B4Dnxnbj5dn5nvwsgjrk4yrzR9nHjgS/qxfeesS
	2rug==
X-Received: by 10.50.43.131 with SMTP id w3mr1590128igl.8.1436862637208;
	Tue, 14 Jul 2015 01:30:37 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id a2sm612048igx.3.2015.07.14.01.30.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 01:30:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 01:30:30 -0700
Message-Id: <1436862630-29062-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] grep: use internal regex library with musl-libc
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
X-List-Received-Date: Tue, 14 Jul 2015 08:30:38 -0000

musl does not have the GNU regex API provided by glibc.

  http://wiki.musl-libc.org/wiki/Functional_differences_from_glibc#Regular_expressions

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/grep/grep_2.5.1a.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 34d081b..5a2da28 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -23,8 +23,11 @@ SRC_URI[sha256sum] = "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92b
 
 inherit autotools gettext texinfo
 
+EXTRA_OECONF_INCLUDED_REGEX = "--without-included-regex"
+EXTRA_OECONF_INCLUDED_REGEX_libc-musl = "--with-included-regex"
+
 EXTRA_OECONF = "--disable-perl-regexp \
-                --without-included-regex"
+                ${EXTRA_OECONF_INCLUDED_REGEX}"
 
 CFLAGS += "-D PROTOTYPES"
 do_configure_prepend () {
-- 
1.9.1


