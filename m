Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53554C19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 07:44:16 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.26889.1740901447909105537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 23:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EvHBapPY;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390e702d481so1409482f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 23:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740901445; x=1741506245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W73YAwKwWBIBJ7ZuejuZw8jwBFnMxlpeWoV8SesKxCI=;
        b=EvHBapPYxP9tDrlJYU4D3h9NwjCY9qBrbu1uUuoseXZsySAe00dHr/mLKVHq81iM7k
         HMoPQAaGKXlhYRMp6sZ/VD6MjFHvuUjmryQd/5g0NupcR9TI09wgagcfCEsiMq99YcZE
         qJ+2KAV3nwhp8jodJXj9v3T1b78cePcTr5a5ijpstgqGLCKntm+RT6Ree0jKzZwndoEh
         G9o3C7M8sP7Y+FLn2Dqbn3yyfnNvOJL5tWTSA1QxtewfIW7RAxub9I4tumbDKUAIJDMk
         ZyE5gN6ID/I1rNSMbXbv8KrBNAqfF9slesXZAQ8DJdLScc8aaTHu8ryAzMjPINH5G9LS
         TTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740901445; x=1741506245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W73YAwKwWBIBJ7ZuejuZw8jwBFnMxlpeWoV8SesKxCI=;
        b=VWb+w7+aWxn3NM3ZU2JnqWEhDGrYg6MdQcN4kQmeaisvY3BkHU1w1fUJdwmTQSylfp
         ei2RQ2NGGsNh9wr9U6w2R0+x3rQkOi/ODHkkW5Itg007BdE86UfEn07as38ylgmqek+G
         6gKOytSeKY0ahYToMgpYbnCCAbgKf4v8LLeFBL658rGIOtl7b1rSvboycWxWEzEildB0
         tLk+7EMPg4oNEB90qzzbofEHHDacmTsQKEmf0NvrYsFhnbsV0lrtwDJpIOOGoClJncMD
         0A45EhJq82ksv0XOJIv4Mx6JUODTf1DNySzDZRT0riu+n4okfNVWuef6oL1lPXYR/j3E
         OXNw==
X-Gm-Message-State: AOJu0YznnPovxHJx3PUFRUDGNn7TyCIf7rFJ22eHGR8a7C/vVnu78T+8
	aWYyRIBUObjesNhALV5x956RYkb2I3qlgXgxPLn3UB9ZcgCGN9MOp8NjRSu3
X-Gm-Gg: ASbGnctmJk/oy+o+H2qlhJLfRFP8ZALZLxsqaOLROuW+vO3fhP+ZlWxLR6KytucZ0cI
	v8dbeG5pPub8LGudIT6SA/jLJOqTJCvlV8nvxpReEKUxiem3woDU1AjFAdbcqBMvoB8Q6QmokVV
	tAARxDxImxBTaXh3XVSPIH3QEREmoRuQGieCMU84SlvAwSvsex8B/Ncvoj82KpDU9pwmtA9UBhR
	Fvn2Duzul/nNZRDNLOP6cQMcOlQ9a2ob5O/4qqOkEK7jRi65bQDB8tEOiQcAStU4oQ/9fjro7df
	SNFEtRWn4yvalKlEKVJHiY0IU0VI/pzX2vLMsaM91UY18aSptnDuK2uRbf5RH/5ngBJoYWG/nsX
	yiCQOXNqHkXA=
X-Google-Smtp-Source: AGHT+IHdrylBXc8cSVm0cNYxQuAp/X+DGfPowbPguyv5eTgKIt+1X/hbas5TpzVPz6J1b9X+SWsO4A==
X-Received: by 2002:a05:6000:188c:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-390ec7c6a8emr6632242f8f.5.1740901445395;
        Sat, 01 Mar 2025 23:44:05 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a72d5sm10765076f8f.31.2025.03.01.23.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 23:44:04 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core] boost: Use PN/BPN for naming of packages
Date: Sun,  2 Mar 2025 07:43:35 +0000
Message-Id: <20250302074334.1775-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 07:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212187

boost-test and boost-serialization were hardcoded, switch to the ${PN} form.
Also lookup ${BPN} when generating split package names. With these changes,
generating an explicitly versioned boost package (e.g. "boost-1.82") alongside
the main boost package ("boost") can be done by copying/renaming the older
recipe. This is useful when upstream code hasn't yet been ported to newer
boost and an older version is required.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 77105aa1fa13..458dfa9ac2fb 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -69,7 +69,7 @@ python __anonymous () {
     mlprefix = d.getVar("MLPREFIX")
     for lib in d.getVar('BOOST_LIBS').split():
         extras.append("--with-%s" % lib)
-        pkg = "boost-%s" % (lib.replace("_", "-"))
+        pkg = "%s-%s" % (d.getVar("BPN"), lib.replace("_", "-"))
         if "-native" in pn:
             pkg = pkg + "-native"
         packages.append(mlprefix + pkg)
@@ -86,9 +86,9 @@ python __anonymous () {
 FILES:${PN}-graph_parallel = "${libdir}/libboost_graph_parallel.so.*"
 FILES:${PN}-locale = "${libdir}/libboost_locale.so.*"
 FILES:${PN}-mpi = "${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*"
-FILES:boost-serialization = "${libdir}/libboost_serialization*.so.* \
+FILES:${PN}-serialization = "${libdir}/libboost_serialization*.so.* \
 	${libdir}/libboost_wserialization*.so.*"
-FILES:boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
+FILES:${PN}-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
 	${libdir}/libboost_unit_test_framework*.so.*"
 
 # -dev last to pick up the remaining stuff

