Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40126C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:58:25 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18122.1786017497774059921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CZyHAJqU;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8efcef23d21so13241576d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786017497; x=1786622297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IjlafHalfevDhddibPTjN1ZUYZi4OJ9ByMPv/HiL07o=;
        b=CZyHAJqUyM5HyYvuVvmoRZgL2qDq/Mj+Itq4IKRfBIqN3xR56Ps4dr8SU4Vp6iNA7I
         j9VsPJkzGEpbqjln6ajtQvNGphZU9U+tj+BdsIbYD8rS8usIGufnLPGGxrfos6ALme7l
         qB5oQ+lWCaXoSEVJJV8v1ENp2RM64TDXqT0qIn35Rpwgji5IGw2h2qcMf+5PJpoeFRTN
         E0oqEh1CON/ksThdm9rvmmtBhpIt4Ji544HzJ0uiEI6uKqMNkerwOehDA0Vl2l/Ju1tN
         VTrvkZqwl5ulm73KjfnXcDPBj3z0hyVA9zCuO/NQzMTuBUgewJOcDmUrqCJ+wYiIxOmd
         Gurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786017497; x=1786622297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IjlafHalfevDhddibPTjN1ZUYZi4OJ9ByMPv/HiL07o=;
        b=hq3jonPHqmQkI2iWTyYxCEzFIEf88SPbIXQkKSkwooqixT2W1lAj1poKofbf0oiKvd
         S+mdqUtddjNuat0rz4PsZHtuW0Spig1E9gtkRLzPlzLb1LYoSgdISlmq5kMoi/9Cuax6
         mgtJJqd6USV0po69Y1UoTvlq4Dj1ctse8BVC32q/t0XRoiirYFsFHsH/RplKuz7PJPOZ
         SOk3Hf8SIaRBVChFpJMBnzDNzABmT8mo7MVnfYMrzrk9yo4/NxENvWbgLJ/Of85AbHQ3
         JXkB77odUMscD0F/34W1hoV67QlZEN0yuyks29jaDm+v2fdvxdroLuLRniFZ1oP9nxga
         lNpQ==
X-Gm-Message-State: AOJu0Yy+lHcMKJYh4ONQgQcoqj29mVSqNdBxG/hinrm/0wSoxY46QnGq
	KjR5xXCglS1aEEA1K4DV8XSLH6QrLO219R39/HmbMpPgymLBpL7utNBdwuRNTReW
X-Gm-Gg: AR+sD12kgsv/oPpB/Eo0XSIdi/Lhx9mAjsb5yxIpfakkN97kEP1x3KygZ+9w436UQTN
	S7YOluIwEeTJrJLZMuJGWNQ/SZ6pCAS1wGtP9JZ58u3JpTpf2d8zPV+EZjpctdrZtiocdQWMdN0
	Q30+AuruprWk3XfvvXSnDndKmUypshRZB6j11hICQ6YTcyXEeVgq27JyIMwBNGMRIiPAArY5Hwz
	6y7YiKt5wdevvFcC6qNFcQtkzW8mWXgzNRM4saSPmjXPFytZ7DgcoshOzpNuHaPKSchmhp76Q9g
	oPNVxOVZD9XaXlKsAEtRMcf4Jjf4SNiEVaoPu5GcVFpmnIZLIry40wUGVzJFrm4qmmbGuSUgz3n
	z1YtDB9Z7bGvWSk5Jl84CRSQomPur5+sXC5SMwbF8R8gMmbVJF2FFfTkAYWGcccd2Qh6TNguehR
	s+uRNx3JQmA/oGjwInCgh2NIQF8ec11XloxByKGfOdAIV2Su3m1SqDd4/5SfHoowAjf65hGY7VQ
	/Cgf4NrOXDQBXyqt8kVPEyPrhOeYB75+NT6wq8LyQ==
X-Received: by 2002:a05:6214:2b93:b0:8ee:f0ac:b9f with SMTP id 6a1803df08f44-9088125b14emr164288286d6.21.1786017496600;
        Thu, 06 Aug 2026 04:58:16 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9088008fddcsm50298356d6.25.2026.08.06.04.58.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:58:15 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] ruby: scrub build host paths from rbconfig.rb for nativesdk too
Date: Thu,  6 Aug 2026 07:58:09 -0400
Message-ID: <20260806115809.3765164-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242936

rbconfig.rb records the flags ruby was configured with, which include the
recipe sysroot, the hosttools directory and the debug prefix map, all of
them paths on the machine that did the build. The recipe removes them,
but only for class-target, so a nativesdk build ships them.

Nothing noticed because nativesdk-ruby has not been installed into an
SDK before. Doing so fails do_package_qa outright:

  QA Issue: File .../rbconfig.rb in package nativesdk-ruby contains
  reference to TMPDIR [buildpaths]

Move the scrubbing into a function and call it for class-nativesdk as
well as class-target.

Deliberately not for class-native. A native rbconfig.rb names paths
inside the native sysroot, and those are correct: stripping them leaves
the file pointing at the build host's /usr, which breaks every recipe
that builds anything with ruby-native. With the scrub applied to native,
DLDFLAGS becomes

  -L/usr/lib -L/lib -Wl,-rpath,/usr/lib ...

and CFLAGS becomes -isystem/usr/include. Nothing packages a native
rbconfig.rb, so there is no reason to touch it.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-devtools/ruby/ruby_4.0.6.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.6.bb b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
index 13b6746bbeb3..2bbe434f196a 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
@@ -78,7 +78,7 @@ EXTRA_OECONF:append:libc-musl = "\
 
 PARALLEL_MAKEINST = ""
 
-do_install:append:class-target () {
+ruby_scrub_rbconfig () {
     rbconfig_rb=`find ${D} -name rbconfig.rb`
     # Remove build host directories
     sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
@@ -97,6 +97,16 @@ do_install:append:class-target () {
     find ${D} -name gem_make.out -delete
 }
 
+# Not for class-native: those paths point into the native sysroot and are
+# correct there, and scrubbing them leaves ruby-native naming the host's /usr.
+do_install:append:class-target () {
+    ruby_scrub_rbconfig
+}
+
+do_install:append:class-nativesdk () {
+    ruby_scrub_rbconfig
+}
+
 do_install_ptest () {
     cp -rf ${S}/test ${D}${PTEST_PATH}/
     install -D ${S}/tool/test/init.rb ${D}${PTEST_PATH}/tool/test/init.rb
-- 
2.50.0.173.g8b6f19ccfc3a


