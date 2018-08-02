Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 97BEC74FAD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 21:23:08 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id s7-v6so5618956itb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 14:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XXgy80+Iq6qXQ0bHnS8rSLauxnoAF7StyzzeU4ml6+A=;
	b=L7JOsTgS4QMZu3tCCpnSm7IA/g1SCRHaq3rY62LLh+OYUUnq4ZW4SJgq0R4O0HNhh2
	1Syq6ZZCj35tBRRJhQfwIdCfjApZ3UFEXdsNtBot412snVKeflJkVOFOFKr6bn3DuTgK
	DZY0gWjJhI+nNQOXQuan9uL4qAM1ZbBEoPZ0/xHnjCbz4EEf4fmdaWC65xBmmQdAjTzt
	UqHaz9smmBvCK679xieKi2tr1beKaiHkXXQYR1j8mrFuB91gkZqmvvI15jPGHySsdqDo
	m+A8Sfw4HQ5SJQwsU/zYzFKguNxun4WwOMQG5bIfcZ8EXHqfTLSTceDnDqJDm+7VDj8R
	PQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XXgy80+Iq6qXQ0bHnS8rSLauxnoAF7StyzzeU4ml6+A=;
	b=jQhJW/I+ZDyhOa2kN1ZvmQwdNsQt0Rmm5DFjdbMXjby5Qumn3PghIbvX0799Xcm5/g
	gThlmn/udRv53QIh2YsUwscQfk/4WDqftSthlK8SfvTtpN1FeIZd3wDmx3F223/BUIiA
	8+5ai4jyYecTMctHKf/FQ8KfjeDY5o4doabF/wLtvCOsB/D4VFfkV5TbjgFmjyy6X5qf
	5qC3IPdNTJKfyKdejXmKTIyTZ+3mLiQ7wkNMXfq7t3sYjYANIUFX3an+yrn6/ieuR6if
	bP8C+q97v/G8/3AMKOYcp5vMAd0bAaE8QpKygKNC4jKZIKd46WbPq4KOwz6rExVfERFz
	5vrg==
X-Gm-Message-State: AOUpUlHo1z843dTDNzmcMIkXrWNfcSn3CVH4/qj1s9K25zdktUAgo/jz
	Z7IwTPCp0ei3MnYQmJj0f6mAOn4b
X-Google-Smtp-Source: AAOMgpcU6muXCpB91RhfKSQUgCB5aFW88/QbDjcD3C3svxyDB7f4TSCy22ngrldXoJGTdHXBdcBLKA==
X-Received: by 2002:a24:3095:: with SMTP id
	q143-v6mr4106022itq.73.1533244989413; 
	Thu, 02 Aug 2018 14:23:09 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	b129-v6sm1943199ioa.75.2018.08.02.14.23.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Aug 2018 14:23:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2018 16:22:00 -0500
Message-Id: <20180802212200.1522-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Tanu Kaskinen <tanuk@iki.fi>
Subject: [PATCH] alsa-lib: Allow empty alsa-lib package for SDK
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
X-List-Received-Date: Thu, 02 Aug 2018 21:23:08 -0000

Without ALLOW_EMPTY, the empty alsa-lib package (which gets culled)
makes it fairly difficult to create an image that has libasound, then
create an SDK from that image that has the proper development files.

If there is no alsa-lib package, the only way to get libasound on a
target image is to do:

 IMAGE_INSTALL += "libasound"

This however causes a problem because all of the development files that
would be desired in the SDK are located in alsa-lib-dev, which won't be
included (because alsa-lib wasn't included). Without ALLOW_EMPTY_${PN},
it is not possible to do:

 IMAGE_INSTALL += "alsa-lib"

because the package is empty and gets culled. Adding the ALLOW_EMPTY and
then making alsa-lib RDEPEND on libasound solves this problem and allows
alsa-lib to be installed on the target and have the correct development
files in the SDK

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
index 6364e9eafaa..581655c5349 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
@@ -24,6 +24,13 @@ FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
 
+# Create an alsa-lib package even though it is empty and make it RDEPEND on
+# libasound for target builds. This makes it possible to sanely create a image
+# that has libasound and then generate an SDK from that image that has
+# alsa-lib-dev
+ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN}_class-target = "libasound"
+
 RDEPENDS_libasound = "alsa-conf"
 
 # alsa-lib gets automatically added to alsa-lib-dev dependencies, but the
-- 
2.17.1


