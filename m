Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZu-0005c2-Ek
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:38 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DWhkJbEJbE99Ab2/3+EgyFgH+tkDph9rSS0671TueU8=;
	b=Sszz31DcZjgAj0S/iULMJZYDmmHKZWUORRaQCn7UbFgaSLWTaLwJnDGbuvTGwsfDvC
	nN0nocEb+ESujoWQD1T22P4J5JRR8b5DNLCBQnifCVwvP5v9kLlylcq6HFPprTVn0Lnh
	gBSiIBiGPAg6DC/cFcso5pMuu+dXoot1oDFegBP2wsSwWGESsVj9d297QZsjXG94mqy8
	xiPLaxb1ogZ8g9TvkvautQ88AHYyFgoVrDQ49eGOzWCdCybld1kUUYrD62aWQSxoVkER
	rOfqp8lAOoqMFmyVfCl4cvvXmWxPBsue7ZCDT/x+73uYyENc0TAZq3BrbryS3p3HPCo+
	8SdA==
Received: by 10.68.213.101 with SMTP id nr5mr63193070pbc.131.1337571393407;
	Sun, 20 May 2012 20:36:33 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:41 -0700
Message-Id: <da7f9093ad7aa4188cc3d420668b0bda7d950a0f.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 06/14] eglibc-2.15: Support mips64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 May 2012 03:46:39 -0000

Add mips64 to binary locale arches
Enabling ports in addons causes wrong
machtype to be chosen for mips64 and
it always chose mips32 which is wrong
for mips64 so enable all the addons
we have and we were enabling them anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-locale.inc |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 70c5cd1..6990569 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -20,7 +20,7 @@ ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-locale-nativesdk = "0"
 
 #enable locale generation on these arches
 # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips mips64"
 
 # set "1" to use cross-localedef for locale generation
 # set "0" for qemu emulation of native localedef for locale generation
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 340ec99..fa92670 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -68,7 +68,7 @@ export libc_cv_slibdir = "${base_libdir}"
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile --disable-debug --without-gd \
                 --enable-clocale=gnu \
-                --enable-add-ons=${GLIBC_ADDONS},ports \
+                --enable-add-ons \
                 --with-headers=${STAGING_INCDIR} \
                 --without-selinux \
                 ${GLIBC_EXTRA_OECONF}"
-- 
1.7.5.4



