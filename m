Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9DABC78267
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 03:41:47 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id v14so6456671pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 20:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fF0Yz8Rhz17lha3vXPqyumuR5qGesiSbp/3ShpTAjZA=;
	b=LEeSuEyHbuahHoUYVBbUBJlZQHrnsnkEJ+Ppez6xrYeyZvNLUYV5tvMmDc1Os1bSga
	8qTNyhti3mFgS72TmK+2OzXWqv5/jl/FkHo+53U5oH3ZvNEZ+kGOwF7Xhts7aOmEqeik
	IENdDpyPJq7U91jkuVswCHW4+lea1v2TrZK8DkEd/4CvHrqAdiqJWAonamYwfBwTlTae
	1G0FGg0agXRuxnXFJImj0K97TP2yI5HWheI+vueIN9VO4+4x1rU/21BiJFFkCUG5eYxI
	ya2Nq7YAuvPYB0E7CvdTW7rpo7hRKDrs+/WyAA7ee+r9zaQEKgy6s2j9VYCULrcFNEoN
	uCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fF0Yz8Rhz17lha3vXPqyumuR5qGesiSbp/3ShpTAjZA=;
	b=o78C/g/alFX+5gX2NgqKKnR/YEOGzZqc/Pq57mZ9tTknoSKv7/WoW/Fu8g3G1TQ+DP
	IepDw134v2D6TmPvDE2GM0qn5FiY86sHju1wdXFZw0nAmD6GbsgYXLTtyBXJVZ0IycQ/
	j1ypk+80JlkRo5mU5w91bXZvE0lKHUg93rxPCIO7u+R+6rLvnS1qKRD+bencAfO1wK4z
	rJuibYAjv3YG77j6X22uzLbOzGTM81iXshaYWRHcAYYAJ0+4DVeSpoE8xGPw6IgJ0idF
	Rv5DcobWJtTc7FPrTKt2HKG0FFEO8l+Ka5/eZkSUqmJUZouaRw7eEaZroBaxPTUk5XVB
	B59w==
X-Gm-Message-State: AODbwcBgJFgnBYPBOQN+dYT6BtnfSBFeRoAnvozOqLHmhxeJnX3WylcW
	41F1arsqsGwHAVz2
X-Received: by 10.84.174.131 with SMTP id r3mr22802975plb.90.1496979708551;
	Thu, 08 Jun 2017 20:41:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	z64sm12587357pfd.20.2017.06.08.20.41.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 20:41:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 20:41:34 -0700
Message-Id: <c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1496979431.git.raj.khem@gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 09 Jun 2017 03:41:48 -0000

Fixes

WARNING: pulseaudio-10.0-r0 do_package_qa: QA Issue: ELF binary '/mnt/a/oe/build/tmp/work/i586-bec-linux-musl/pulseaudio/10.0-r0/packages-split/pulseaudio-server/usr/bin/pulseaudio' has relocations in .text [textrel]

This also makes bitbake -c testimage core-image-sato (hardened)
build to pass all tests

Fixes

AssertionError: 1 != 0 : Log: /mnt/a/oe/build/tmp/work/qemux86-bec-linux-musl/core-image-sato/1.0-r0/dmesg_output.log
-----------------------
Central error: [   20.726960] pulseaudio[729]: segfault at 80052b6c ip b771b4fc sp bfc97940 error 7 in libc.so[b76b6000+97000]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
index f3a85737fc..3ea35e592a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
 SRC_URI[md5sum] = "4950d2799bf55ab91f6b7f990b7f0971"
 SRC_URI[sha256sum] = "a3186824de9f0d2095ded5d0d0db0405dc73133983c2fbb37291547e37462f57"
 
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
+
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-- 
2.13.1


