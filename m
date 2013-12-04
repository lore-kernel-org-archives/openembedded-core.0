Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id C09846DEE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 17:32:43 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so10693453ead.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xvAsJnuzxIqUckk7KQWJG3Kg8N/ktj2gmI/IsDS8Bi4=;
	b=FzTw6kwBS/7RqnlmDupkicHTN2/n84z1ninjC+v5m9ee7ykgQfkHFdGqD27T8ZHVb3
	dAQg5Yhk4FGMw2oPokHBVdXBswNnQQwnddXHpx8SKxR/LOBrae0wd5+qiPJQf1i0xi+6
	Kx9WvrV5dr9YQnfbB/o8CMInhnpfW4jC9kyAsoQW2rB7v5wC5rL5m1bK5hYiy4nwtS58
	WJQSn/Aw7FO7xDmeMV7RsWg3C591Dfh3ifWMgNf4vf7xUGtUGTeKFPf0pXQykbFTxvLT
	GU0s4QWKEcHbuAGezWkD+xpbbcLsHSFmbosLoP8dvqmW1ZN/G6DXFZ9sQUtcH9h7UlRs
	TCCA==
X-Received: by 10.15.101.9 with SMTP id bo9mr26408889eeb.32.1386178362681;
	Wed, 04 Dec 2013 09:32:42 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm73347362eef.16.2013.12.04.09.32.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 09:32:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 18:32:43 +0100
Message-Id: <1386178363-14590-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <20131203155502.GE3714@jama>
References: <20131203155502.GE3714@jama>
Subject: [PATCHv2] cpan-base: Add vardepvalue to get_perl_version function
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
X-List-Received-Date: Wed, 04 Dec 2013 17:32:44 -0000

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
index 7e1e8d0..aa502d5 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -10,6 +10,9 @@ RDEPENDS_${PN} += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
 PERL_OWN_DIR = "${@["", "/perl-native"][(bb.data.inherits_class('native', d))]}"
 
 # Determine the staged version of perl from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+get_perl_version[vardepvalue] = "${PERL_OWN_DIR}"
 def get_perl_version(d):
     import re
     cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
-- 
1.8.4.3


