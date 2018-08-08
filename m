Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB2778D97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:58:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y2-v6so3285926wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=+pVAOyOdSfu1x9shCXoyKAe7pfPpeOiDg3A4qsJbtw8=;
	b=K2eOoCQARdaO+8psGHLs6Lrv9KU+Yo8xGx9vtcJHdHSylufgkZyZ62LfDUKzctIHh6
	GLrm5oazR9cvIEZ1AVYXAHheUZgkVxa04OS89nRlfp9ANfQFmGdlsm3MzOehhqN8Lazw
	ekhssPjuRpRdmKTK5N4WSHnFh8GczHvWA9+NpmjeYGtBgyaHWSW1H1Hcu0ULeOyJLVrA
	hvEptSTo+4eO1aQ2B69l1KkIz0u2qYzJoQbK48w5rsyRZC8HQGtdcqoRZJpm8BrDPWXK
	Zae+b/PDBmmNQz4oPLTtOJfWWJ4o3tTKSDVSXTyWYL3y51b3cqfvze2CTkaVoiXH7kSz
	fwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=+pVAOyOdSfu1x9shCXoyKAe7pfPpeOiDg3A4qsJbtw8=;
	b=jdRNYsa2PmPMrpd3AJnY1yMabzAigEyyKwUiBusuft2b5nHP3slUEiDI/lb3oKTRed
	v3PHsPsLYMPB2cr/6+BwA4Om8ehlXuR4CqKBTmG0X/l/3RmsdQv7Ad6GnvheEV1DrRXr
	m8OcKuaai1IiXpvLX+CGjORoQXOstZeKZB9HdiVUi7MgnjNFcxZqkLtp5bfam7d8T1up
	1oEPo9V2lrf/KBFKwXtZBZg+HF4CwuTytJgu4BF2LG5AJQdlkfwBDyt5I5nipDU0R/KB
	hg08e9NCF+ysJpYR4oqGFs4HDp1GdAiCAfj6SHBebiwXOzhKUHQSRg2eZ9JgvbBe+nR3
	OyIw==
X-Gm-Message-State: AOUpUlFKdTnPbbrLBYzx53/+iwqsFxbuhLe71ctjjwii59qUaDdb97jZ
	I2ABUSYotj7BeSR3F0lvnP3OpDI0
X-Google-Smtp-Source: AA+uWPxNvVTz9oTe1nW9JXavQmhd3b2FwiTK3KETvaRGm7gY/h8eJLFzePy+0WMAuJzPrfAk84c5Ag==
X-Received: by 2002:a1c:a989:: with SMTP id
	s131-v6mr2482634wme.136.1533743889722; 
	Wed, 08 Aug 2018 08:58:09 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	r12-v6sm13000187wmh.0.2018.08.08.08.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 08:58:08 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 17:58:02 +0200
Message-Id: <20180808155803.32738-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH 1/2] cpan.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Wed, 08 Aug 2018 15:58:09 -0000

The modern the time, the improvements in ExtUtils::MakeMaker.

Nowadays, .packlist and perllocal.pod aren't touched anymore when appropriate
flags set during configure stage. Controlling the flags globally avoids
dual-life recipes need share patching.

Further: remove prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong (search
order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} contains core
libpath only ...

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 8e079e0d55..926c6358a6 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -16,8 +16,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
 
 cpan_do_configure () {
-	export PERL5LIB="${PERL_ARCHLIB}"
-	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor ${EXTRA_CPANFLAGS}
+	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 ${EXTRA_CPANFLAGS}
 
 	# Makefile.PLs can exit with success without generating a
 	# Makefile, e.g. in cases of missing configure time
-- 
2.17.1


