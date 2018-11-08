Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 156CE79F42
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 15:32:52 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 124-v6so1712219wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 07:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=ywM0iwESrbi6pGOhD+UhE/MfzNC3QIjusgwvFjM9KTg=;
	b=ZCOfU7oBA+I3OR2ZPMs85aXSMp++LZXy0sVkllJIM9hxyx1j+hZLGvjftLLkESPNaG
	UWbQHBcZr/fWIY+3xrbp9pQapMJQMve7gH6JoHVZhG8tN2vAS87h5NVhpBevrpbNBTG7
	51/OjDisiLAbSF2bLq6SJXA6TfO57NBJn6bYzueV1kgYXAcwph/qggOrmZwBPGHgsuZg
	bHpIHdzoXrBRjjM4DqZIrj8Scb1QFsVGnAroeJN73SnU/VMVCBz4sjew/7KOkwVwjUAt
	MAm2JZiyM4jL/cy2STP028/3m7ZTgdDGKp8Pqgp67u1hHB8Zx/hEccH50O/S3sXhD9Vm
	MCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=ywM0iwESrbi6pGOhD+UhE/MfzNC3QIjusgwvFjM9KTg=;
	b=Re4I75nNBG5a6savwjhkpWttq8W0M/z7icZoImrwdmBL5Un05V4wFEbxUps6BcTJLH
	tJyjSCjZ7U5sQjO00bQzm54pAyx4gpeIWDRK/+Gv5iJSkPLVnQQbHzIyTe2i8eGlWxEN
	N3rM8J/4UWlQNZ7bvxN9KmX0pk3gqhf7WJ8t2rj0E6QfTAyV2HWZefHt9qn3zvI51f4m
	dKmvrlIruiW6jTxzCsWbZzuskTYgWG/QOqbDmu8F8G885CfR6V8t8wHiTN+OqYbMPUZj
	H+FW4Qg9Eo3hGJvSiv0pgqoWnwXEakCoFVjem/zp8NKIqilS3XVFcZ+O53Mj9Ia3rJ0e
	bH8g==
X-Gm-Message-State: AGRZ1gJo0+iEFiSd+eRVpfhhdyo7wOY58C6l58PW5mBrJr+j3uroDV5l
	BS6AGjhfAt23GyR6sfWHqUxp+PKP
X-Google-Smtp-Source: AJdET5eifdG2QF4U5gzwXDhdfi6oyqPOyOv6xyZvrpHri9SbUhJIU7xozsDIROdie1MNjzlEGs8+dw==
X-Received: by 2002:a1c:3b06:: with SMTP id i6-v6mr1571940wma.18.1541691173386;
	Thu, 08 Nov 2018 07:32:53 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	t77-v6sm7021640wme.18.2018.11.08.07.32.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 07:32:52 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Nov 2018 16:32:42 +0100
Message-Id: <20181108153242.15679-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] cpan.bbclass: avoid newer MakeMaker run perl.real
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
X-List-Received-Date: Thu, 08 Nov 2018 15:32:53 -0000

In newer versions of ExtUtils::MakeMaker, the location of the perl
binary to run is determined differently which results in finding
${bindir}/perl.real instead of ${bindir}/perl

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index a5bc301898..511fe3fb92 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -16,7 +16,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
 
 cpan_do_configure () {
-	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 ${EXTRA_CPANFLAGS}
+	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 PERL=$(which perl) ${EXTRA_CPANFLAGS}
 
 	# Makefile.PLs can exit with success without generating a
 	# Makefile, e.g. in cases of missing configure time
-- 
2.17.1


