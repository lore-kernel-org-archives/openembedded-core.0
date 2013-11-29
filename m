Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF706B049
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 22:52:29 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so7131358ead.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=N2qedU3iKEd0U/9JYPbBP2wQlSIZ20eopPX7/LTq8BU=;
	b=XaiO4tAzYWz00d+S7gWCDKb/WpBcRY2lYgM5uGRhLGWV6EndMFOZKRAD1ixddhs/7h
	rLPssA3vQMFY8xvB9f8nHQr7NRfklvE8rQ5TNujTq/LzAde9oYv9GnLsA0PgKBbrxI4+
	DwCkzgMVwzm+BB51MayOFC+ZcPTXhV7NPlZPvo+uOIn23qHFP79bxDuPVXnFVDbzcJ/r
	XGqwsVgz1gwxlpoopY83dgCFuBMmoux9Mr+d7SoH18TZIHlHUc9TTnOQI8mwviXuNZ9Z
	fyVNXy45PMDMZg4WQaJ8nH4KiVduj8kk63fOVMGvkRfYXyq3e1vpH75rIlm05W2LqTDY
	0FLQ==
X-Received: by 10.15.27.133 with SMTP id p5mr39703eeu.120.1385765548555;
	Fri, 29 Nov 2013 14:52:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e3sm8139336eeg.11.2013.11.29.14.52.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Nov 2013 14:52:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2013 23:52:29 +0100
Message-Id: <1385765549-20934-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] cpan-base: Add vardepvalue to get_perl_version function
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
X-List-Received-Date: Fri, 29 Nov 2013 22:52:30 -0000

* without this bitbake -S perf shows following error:
  ERROR: Bitbake's cached basehash does not match the one we just generated
    (/OE/oe-core/meta/recipes-kernel/perf/perf.bb.do_package)!
  if you run it twice, once without perl in sysroot and once with perl
  already built

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/cpan-base.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 7e1e8d0..609fde6 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -10,6 +10,9 @@ RDEPENDS_${PN} += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
 PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
 
 # Determine the staged version of perl from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+get_perl_version[vardepvalue] = "${STAGING_LIBDIR}${PERL_OWN_DIR}"
 def get_perl_version(d):
     import re
     cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
-- 
1.8.4.3


