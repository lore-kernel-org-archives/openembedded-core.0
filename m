Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 099DD79007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:04:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y2-v6so1321672wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=+pVAOyOdSfu1x9shCXoyKAe7pfPpeOiDg3A4qsJbtw8=;
	b=Ki/JXNz8a4hkqA16arapm0v0zxb5dN4NxsH79rWdLn/2KVjwXaRp+95sidYysY0gow
	lYvnUjIKVMni40aU3YzlOjOC4Ez+krAYuiBAT4Y6NmsCpN+doh0SFX/H6aaZqmGzJmpG
	lmfrNg8A6J6AcX+/0B/OSp6VBAzniHhp5E3Kq2PwsrJhzvkJLEKpdTrVl5C9HD/IKeHE
	BiBGYKR9Axucek4gNra05eBxbmNnld/QL86i7ihPA5ghbEDXJO8PFlNJZUnFmzkOTD6V
	SL63MhwL3h+bv/psM0T7PQhcs1AD/L4VK61qPq05uHCLGm6rVwMEFoUBVxZUn7hfxG6y
	bUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=+pVAOyOdSfu1x9shCXoyKAe7pfPpeOiDg3A4qsJbtw8=;
	b=nPnMM5I9XoxeOATAbH8WtvK3L8y/+S3Y0olKp0LCRJQeKeomqzlZOckDqSN3xnnc8q
	o92/W3r7pi+0TDo8bY+EYudhaqIklGUCYWh3qzHGch3tAUuwmbc4LO72BgQHT1KcLY/0
	0GnkSz7mLtfEsXsYhe2Rk7+rbglVtTf3ZsTBauuCRtFXvcN69xWvap+/nmSOWEhU5HPx
	sjFBj+XS2vUfYCwVR/1c6B7rtouNa1Vb4thwPpz4hPl1SZ2/sN+FeCDIojBqMtIqwk0r
	xk6vAV+fsE9FcmldTiV8wAa4HWQiB1xHFgrLD0WU9MWolY7rEHF+UbIQZzaG18GZshw2
	Dffg==
X-Gm-Message-State: APzg51Ct5LpYMz+5hEqJBpl8uwJHlbwnJd/aM8rqNto4XyIOlZSkYELK
	I1JSZ5jJ7MzhfqwMQPtQOKwNtuMA
X-Google-Smtp-Source: ANB0VdbsE7CIe6ApxI9BKdA4bdKZM6zFov2MSr2w/H+4DcWzhvGA7uJ6d9eZFGEfIg21bJR4L18gJQ==
X-Received: by 2002:a1c:a60e:: with SMTP id
	p14-v6mr1892693wme.64.1534928670598; 
	Wed, 22 Aug 2018 02:04:30 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	v5-v6sm1093753wru.60.2018.08.22.02.04.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Aug 2018 02:04:29 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 11:04:23 +0200
Message-Id: <20180822090424.14573-1-sno@netbsd.org>
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
X-List-Received-Date: Wed, 22 Aug 2018 09:04:30 -0000

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


