Return-Path: <andrei@gherzan.ro>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2582761F47
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 18:49:01 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id x14so5368921ief.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 11:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+Xdng54rGX+0Yi/hTB5mdC+sBn95NInAh/b9ZnKLI1g=;
	b=i8aLl9/dRHTAdPOl5khiOlsZOM+djv6dyweivmNdwB7iHqkX3YS1fgWEJugKhjAPIX
	oLEjTMx4dnoXJ1AVjUFbHBcvEHzfdDRsxBzUTUe4Piw7SpCKPwmVSVPH3BueYH/Aom/w
	4nvxcTwTRGdnDrrlu1ws5pYRwMd5pCu5obYwmMK2MXH40Aa1gKokErRExaCyCeUEe0rP
	x28KauUaED8WH3UHtEpziUATtP6+4Y9JmzGK5RCjaKdSu8DsCuiwJBp9HT/MDkn5YzzW
	+8b1PmHpqYc2GLcKFn+NFNGTpVmDVQOBG0WDodoUc5mCx+/D/U+u82YriUFEQ+2FaJT+
	lu8w==
X-Gm-Message-State: ALoCoQltM1iJQui8XAolkFE88Plf3eZuhILhI3yEQnKHdL+TlZeS/1kxr3eDXbHGpgyh5jj2seqb
X-Received: by 10.50.13.10 with SMTP id d10mr7383337igc.56.1377542941862;
	Mon, 26 Aug 2013 11:49:01 -0700 (PDT)
Received: from otp-mmes-build2.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPSA id p5sm19293858igj.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 11:48:59 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2013 21:48:44 +0300
Message-Id: <1377542924-1605-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 1/1] eglibc: nscd support depends on OPTION_EGLIBC_INET
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
X-List-Received-Date: Mon, 26 Aug 2013 18:49:01 -0000

Add --disable-nscd if DISTRO_FEATURES does not contain ipv4. This features is
mapped to OPTION_EGLIBC_INET.
The default behavior is to activate nscd (if --disable-nscd is not passed to
configure script). But nscd depends on OPTION_EGLIBC_INET, so compilation will
fail if this option is not activated.

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-core/eglibc/eglibc_2.18.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
index 17b651f..771f3e7 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
@@ -79,6 +79,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-selinux \
                 --enable-obsolete-rpc \
                 --with-kconfig=${STAGING_BINDIR_NATIVE} \
+                ${@base_contains('DISTRO_FEATURES', 'ipv4', '', '--disable-nscd', d)} \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-- 
1.7.9.5


