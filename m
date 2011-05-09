Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJVQW-0005fq-2l
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:43:28 +0200
Received: by mail-px0-f172.google.com with SMTP id 6so3954525pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 11:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FmCnqUKVQ8vKoaR2W6iGO1boqYmeESgE9K3hpr/GfrE=;
	b=cdrNIv1AhQ3mRZgiq4jHjZEVEoLLxrzKvbKlBbdzBvCVA1nIJfQ2B/6Aa2UGTLa0u8
	OHTPl5BE5/g2Gf63SPy3osvG2vrf1Lnl+4Y+QCKQirKUYGFVqYmPN29z9in+yX21m8l5
	f+Zvl8dvacyOAEy+N3pRb+YWNEps6ec1xoXZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VL8chadCLTWQYh8Pbzvs6iFnV+D4aMPqFLTsnJg1yHYRrfmvyaUpHqxW2kF3NVBpE3
	oxs3kMUAn/PLxX2Zg+8ifSxYxuBdohR7KHR8ux2xhpyskNsiAQhOHQtpO1GWOW7p8MNw
	Qji7X1khRRCJ3NZviA8szqGCZ9qgS8kyGgPh0=
Received: by 10.68.57.241 with SMTP id l17mr5516703pbq.85.1304966444070;
	Mon, 09 May 2011 11:40:44 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t7sm1581353pbj.63.2011.05.09.11.40.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 11:40:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon,  9 May 2011 11:40:37 -0700
Message-Id: <ac0fa903032e64503c78ee95089c40d2cdb8c837.1304966147.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304966147.git.raj.khem@gmail.com>
References: <cover.1304966147.git.raj.khem@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/6] libgalago_0.5.2.bb: Fix compile for uclibc
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
X-List-Received-Date: Mon, 09 May 2011 18:43:29 -0000

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



