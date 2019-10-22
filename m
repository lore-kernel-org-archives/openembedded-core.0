Return-Path: <nick.owens@eero.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 66B967F7C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 23:59:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q21so11661620pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 16:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=/y3h8Ga6O3iex3TXgnuBrlSBgZVqIj4MtfzHoYdA2oc=;
	b=O0Vrh8UidEzIv2+x0G8zKSAxQ7bBPNA+1JLv9BgYQj5fvkaigIe5gBMqzveDvxqa5N
	rU+JSpTRDkP8L6DEKfjTwTslrKL/FYzPpqbdiod1LxBOY9Q23z+XfM0f+dnOlZnoyPgt
	srewywKrdQyagEq1UVCcKg2Tnhfzqdd4ooWtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/y3h8Ga6O3iex3TXgnuBrlSBgZVqIj4MtfzHoYdA2oc=;
	b=AHyP1pjq0wL0bgoGsDM5cgLf7qLz5bGnB9q2louknABpGMUydw7DFYjZWW5Sx6sjIX
	bcHfu3ho4GhSFbMVk+N4Y4LSXo3+BsGrXXjZzY3rS6y4urV6s8nAT0MNmwOY9vspqpxF
	eODEQKbcXE5ShsOFWD9bVgZuN9SfKuRtiej38H6Rfbq9Ka+67QvERdIKTlbwrrerFez1
	rsklwjA09iID8yx3d5P/F30yV7m3Bg2aVvw1qekrvD0nNFXQiHyPpbXDKgnpXJGoLLFG
	EBW2GOcooiQEo59rfBPH+5eGk2s0mvIGAramcUDmkeZwsSmXM//nWOeIBRQMPGrPYJOh
	OHzw==
X-Gm-Message-State: APjAAAUKMgbHacZYGIbpRg9Vej4q25oKfF/xKuOit/ux8MFlos3i4Uvu
	+zwe4GzzEqVzFggqDuln1iH1mWU7YA0=
X-Google-Smtp-Source: APXvYqxyBV1HLbGWhKTC3ZxDL3lp1mLz+k7y7fam5BeNPCemn+MdxXdn8DtD3cfoI8RluvZDB92q4Q==
X-Received: by 2002:a17:90a:a889:: with SMTP id
	h9mr7963918pjq.61.1571788799151; 
	Tue, 22 Oct 2019 16:59:59 -0700 (PDT)
Received: from ufdc85a1e077f5b.ant.amazon.com
	(c-73-92-46-121.hsd1.ca.comcast.net. [73.92.46.121])
	by smtp.googlemail.com with ESMTPSA id
	g7sm34459268pfm.176.2019.10.22.16.59.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 16:59:58 -0700 (PDT)
From: Nick Owens <nick.owens@eero.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 16:59:35 -0700
Message-Id: <20191022235935.19461-1-nick.owens@eero.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] distutils: pass along parallel make flags to setup.py build
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
X-List-Received-Date: Tue, 22 Oct 2019 23:59:58 -0000

parallel builds for native code in python modules was added about 5
years ago. distutils understands '-j N', so just pass along
${PARALLEL_MAKE} to setup.py build.

Signed-off-by: Nick Owens <nick.owens@eero.com>
---
 meta/classes/distutils.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index b5c9c2fbbd..d60f7083ef 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -23,7 +23,7 @@ distutils_do_compile() {
          NO_FETCH_BUILD=1 \
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${PARALLEL_MAKE} ${DISTUTILS_BUILD_ARGS} || \
          bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 
-- 
2.17.1


