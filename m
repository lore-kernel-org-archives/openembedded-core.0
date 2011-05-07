Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNP-0006tS-Sq
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:36 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so1800424pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FmCnqUKVQ8vKoaR2W6iGO1boqYmeESgE9K3hpr/GfrE=;
	b=xh356GDkILMTITRrcpHxni8ObBallNm3xEYlwSQea4uE9hP2f4ANqBrSi2JSnD4XX+
	ZR6u9YYxBvobt+Lesrp+Wyk+jugsF+uguNcJ78m2Cv+5N4gxP8hCROLNovdAM5eirolQ
	RJ+effN0CGGRhqavNeeAgCzePkNriTDxWcOHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PVf1zrC2sYH7sTEmifnPsXi5hUgVzAuS3a+AJpvm54Ivua/TmZVoH/uNaH8a/cJY45
	XACV5KHOUwUf8k7mXOIj0GwsCFWpZxiA3k7ag/RB3mS7nAA4j/rvzsEZdnq4bjW8VhoE
	qhAVoiL8kXwBedb9k8wjPb9aEF3/IDUPrLdas=
Received: by 10.68.62.3 with SMTP id u3mr6424248pbr.321.1304754836086;
	Sat, 07 May 2011 00:53:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm2139129pbd.66.2011.05.07.00.53.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:53:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:53:52 -0700
Message-Id: <2ff29e9c43bab269964622dacfaf18daebe7486e.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
Subject: [PATCH 5/8] libgalago_0.5.2.bb: Fix compile for uclibc
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
X-List-Received-Date: Sat, 07 May 2011 07:56:36 -0000

uclibc targets may not have gettext but this package
still needs config.rpath during regenerating configury
so we provide it when libc is uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
index 6d9f76b..3a47620 100644
--- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
+++ b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
@@ -18,3 +18,7 @@ PR = "r2"
 inherit autotools pkgconfig gettext
 
 EXTRA_OECONF = "--disable-tests --disable-check"
+
+do_configure_prepend_libc-uclibc() {
+        touch ${S}/config.rpath
+}
-- 
1.7.4.1



