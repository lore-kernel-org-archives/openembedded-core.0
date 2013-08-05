Return-Path: <tylerwhall@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD0386A458
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:25:26 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id g12so6400664oah.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gkPQzc7zaKjHrFs4uVivr5SKnMi+L0uPyYxyG8MNLVU=;
	b=VNs9MWECn2Gr4vFB0ozOZ10/HgBrXiv8TXGqg5lU77s6WzuzBgkKeA3KF7nIlEts3b
	2g25qaQzkWRwTV0e2xiUX7Be7IV2ghe7sUkWtZKADAJRVeGQEYwgUJRbDNhWZqmQRe+C
	UTc8ctDFdBcy2c+pk3EWQ+yhXR0HzCgoek/RQK+0aRz68nnhatQLc1L063urInEQYrlo
	xkXH/j4FJXVrcHp9H1ngicnA5Jjm7v4KP2cfDOpe/OtZM8Tb7uSatU1xEzFRu0NMBbP1
	Ry5EG8lLq+IyEsKcnIP6k93SacOrM9mI+9o/hc4BIrbCvAMToKkBowO5Kw64N0uN67Zn
	MCWw==
X-Received: by 10.60.131.171 with SMTP id on11mr14650422oeb.71.1375712727074; 
	Mon, 05 Aug 2013 07:25:27 -0700 (PDT)
Received: from localhost.localdomain (cpe-69-23-225-27.natcky.res.rr.com.
	[69.23.225.27])
	by mx.google.com with ESMTPSA id g1sm24311429oeq.6.2013.08.05.07.25.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 Aug 2013 07:25:25 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 10:25:20 -0400
Message-Id: <1375712720-16668-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] cpan-base: Don't use immediate expansion
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
X-List-Received-Date: Mon, 05 Aug 2013 14:25:26 -0000

PERLVERSION is derived from installed output in the sysroot, so it
should not be evaluated at parse time.

In an new workspace, the sequence

$ bitbake -S libxml-sax-perl
$ bitbake perl
$ bitbake -S libxml-sax-perl

generates different task hashes for libxml-sax-perl, and the error

ERROR: Bitbake's cached basehash does not match the one we just
generated (/bonus/scratch/tylerh/oe-core/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb.do_package)!

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 meta/classes/cpan-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index 7e1e8d0..d05863e 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -40,7 +40,7 @@ def is_target(d):
     return "no"
 
 PERLLIBDIRS := "${@perl_get_libdirs(d)}"
-PERLVERSION := "${@get_perl_version(d)}"
+PERLVERSION = "${@get_perl_version(d)}"
 
 FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
                     ${PERLLIBDIRS}/auto/*/*/.debug \
-- 
1.8.3.4


