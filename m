Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FC4C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:03:00 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6927.1790024575197172250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GHLOrHfk;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so19813005e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790024573; x=1790629373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KCSeE5gfqNfK6ZBWyYcWyIy6C8ofYDLfn7nAdDF2Ok=;
        b=GHLOrHfkwUO886jW7FdA3i2Ldkki/TIMCljfseH/WBNIm11jxNYQcRqVvxCljUnYpO
         yZh7ZluY/dB6lzsPloCbxTA5yMjBRWmACdHhdJyZBOP+u/uojVKDqrowGsOCLf2mN2Sl
         0iBo8M9JIHbQBLA9/UPCts+96T6dwtvgrR2Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024573; x=1790629373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KCSeE5gfqNfK6ZBWyYcWyIy6C8ofYDLfn7nAdDF2Ok=;
        b=UbPFRtNWBS5rIStXEsPdEG5W11tmFzeE2V3PbnIl36UNrVaKFPF3PWwcAzPVQNkEfb
         klPWZROyJFbOkxXQ6WWdFQYEY5XiruH/pZj7o2rZkxpIMR5dtdxkCd1FykZG0ZHsLbFK
         H2va7VF2wehblc8dqxC7j723SvS55Q+39wT4H6jOAhVjik2Yf59bRGEmkwF4gIQ6T0c0
         urZns5CZIHPozCKnLhFRunnhWdrEEjYQPvzJ8pXW9fEyVxJa7SYkGQoMsh8j24/MSAc0
         XOP7dzXn0l9A96YPAVZ99f086JnRIcf9+aniQNNP8JwBQi0sXicnmbnIy+VX/9DkqHMM
         t8Tw==
X-Gm-Message-State: AFuF++m4RxD+JtTDoPhCjS0O98MWhnXRNN+7tOtWSDG2MljLsTdi7aGv
	cl7w8s/TaCITjvp1w2AIAloaiMJ74Bc+pwdhCorFsDldBy/PwwM+jTrgH9uOKM/5mC/2p1enQcN
	T4uX1kc0=
X-Gm-Gg: AYBFou1PVQmNlhILM84a9g9eB0XL+842H8HPF/+X5+yVN6VQjJUPvWzoXLSCb8sUfGz
	huYZteBj4iufcM9LJh6utEbGBYTvPdcG6+B+qc8t4z1FVZjV46Nh1lOYNaup/LxzkU7TGVSkj6z
	1l3Uz/2HrMmOqIyqYShF71aNDAE3FA6ARjcddZBYM+srrhZqP8iHfd8T2S5F6e82FfAUjBYyY6y
	UXBr9IMcJ4rUeeR4KsN4T7dymH02f6evMjv9kRhCQuk41v8e6gf13Gt5dsNJIdF5985VjF3VhVm
	+0WyHSALSYR6FNq9H1ln53UWsu26/QIlXEf5tv79r6LkuqP6Qewd0ifjVMoi5AMU5F9NNBTRrrx
	XJ2AKC+c1lc7mNSGNMfstj8R8sPdUuJvJEfxX+ghA9UfOwYVVo2ikaHPrdBEE6mQhP/nXX1jyLs
	jAhxlZ5vI1Y8KTohPJ1CMMrOcIbhI15Nj6ox0nqJOQkt5YffXF1BH/278OzWZ/a4DUkeyO6qUtz
	lqlingCmvGc/nqTNUOht+y80ho90ZY5NGMICOqsXzgD+Q56hILr6H2s1+AXRjRAo9Z9wT4J1QUu
X-Received: by 2002:a05:600c:3550:b0:49e:7d74:7b7a with SMTP id 5b1f17b1804b1-49fc56db8f3mr157220635e9.6.1790024573202;
        Mon, 21 Sep 2026 14:02:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cc061fsm19029445e9.4.2026.09.21.14.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:02:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH v2] python3: skip ptest incompatible with ptest-runner >= 2.5.0
Date: Mon, 21 Sep 2026 23:02:08 +0200
Message-ID: <20260921210207.1127192-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246357

From: Yoann Congal <yoann.congal@smile.fr>

With ptest-runner >= 2.5.0, ptests run with PYTHONUNBUFFERED="1" envvar
to unbuffer the python output (to fix AB-INT timeout issues).
A python3 test, "test_cmd_line.test_non_interactive_output_buffering",
expects buffered output and fails on unbuffered output, skip it.
See https://github.com/python/cpython/issues/128377.

Note: upstream fix also skip it on PYTHONUNBUFFERED!=0:
https://github.com/python/cpython/commit/30268b5d2fbb1a5e6c876f0cdc4cbdb5d93315e6

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: use "--ignore <full test name>" that actually works
---
 meta/recipes-devtools/python/python3_3.12.14.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.12.14.bb b/meta/recipes-devtools/python/python3_3.12.14.bb
index 7ee32601cd3..14be125180b 100644
--- a/meta/recipes-devtools/python/python3_3.12.14.bb
+++ b/meta/recipes-devtools/python/python3_3.12.14.bb
@@ -260,6 +260,12 @@ SKIPPED_TESTS = " \
     --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
 "
 
+# With ptest-runner >= 2.5.0, ptests run with PYTHONUNBUFFERED="1" envvar.
+# test_cmd_line.test_non_interactive_output_buffering expects buffered ouput,
+# skip it.
+# See: https://github.com/python/cpython/issues/128377
+SKIPPED_TESTS += "--ignore test.test_cmd_line.CmdLineTest.test_non_interactive_output_buffering"
+
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \

