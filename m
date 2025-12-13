Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E987D5AE7A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:19 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2921.1765620134138429453
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G6Ew8hyr;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2956d816c10so23689895ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620133; x=1766224933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgHeObSjtPF5TIsCbe8JH4N7CsWcYLr/0lgmiTCoJ8A=;
        b=G6Ew8hyrtztOvg8AqWGgIMfMKQWvNefw7deXEfuTK14rZXYmok9ope/TEsZfLzhp5b
         CB4KmYLAjY9T97B9MnvWukP9NeI28JgvjyMtphK3tXA+5e6InHYZPrJX43yOrPuZp3p6
         jWaqWhtUF6odgkAE3d/y1x5pc0GlCkuOk9cu5qCXmMyvZOqa27NtiWW/wqoDmdi1N58y
         6Fnrv8LADt+20/SGVCKltxKSZu10PE8I1CR8ZfRhCEe4R8szNQuXD4g/IH1gcIZeMMaJ
         lSR3f9nmSS4uUOpNn1ttZa6mqSqmlPy7CHsNlwCP3N2ilXJ3Cd1FuqenmbnXsg8htWin
         TglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620133; x=1766224933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FgHeObSjtPF5TIsCbe8JH4N7CsWcYLr/0lgmiTCoJ8A=;
        b=qr1+YgGZsBSbFfzYNX0PqgG0FSTFntjhW/29ReeJZqgf7Pmu6krP6j92LhsLk7i3yR
         Jt9nfxbuQPSjh7GIOL3h0PeqyRWXZmPMFVOxInTNX3FZph00w8jrvGCUTLwa1ReNzwOI
         9VIX5AAbQcpvIG7HHOFwWIsGECSOE3y56GzxluKMU0vLVe4ioWvxhRkGG+0dPp/XQu6Z
         wYKzDsEaiftMc8G5TKooOcd/Juzvjyb8yi1y3cI6xeJqqkQ1jxZOZONZPE3nyBgks+A8
         iGoaSU6Bjdu28wQO4ekG978fv7Stydk1xP3OLa6eVg+BivuXDyvTk2z0W6PLf0dqg1J9
         J6Sg==
X-Gm-Message-State: AOJu0YyZQNuVw0t25fWq3BzAzOB5NqDtJa2l7MG1SfFvJG6y5ij7sEEo
	qAn0YLqyeFz36UGEL+tFthP5sYF9OLv7vDz9mWdI6vcrXrn75McR8XY/YhbymnRU
X-Gm-Gg: AY/fxX4yLh8eMwXMzrmwuZQMHoJWdytE4ZD5lbnBBq+bQAPuxuJWwr+judp4tN1Wq21
	ARmKleLKZC8Y/WbZ+CpPzY7NGKHzV9QtsP492Iey7g0Ufsa02mcjmxmbdnpEy2sf+FL8JMFDzRw
	QvkKTReGGd/o5FkH/VWTxf7irjf96p1KaEWhBzNxbRhl1hjlW0/7CLXuJM0Ug1VerhBb9bWoaGP
	5HA2aLVTns//Q5u9T0/rzATn4czueO2MLrnJa5NfiAWNemr8kOlii9a4PsZ/wU+BkcVKz3he39F
	olXdvxexZ2K19Oc2RHfXhoOHyAja7iVAbPFj2lyhGd9gwCpomd02wwu90cyRCyOEAbA6q1PzmzT
	FqqlXE48fOlJvX/LR5LvxY5uwaJo7sfYwyEljV781Kvmi+SFNxqL9vwUDFqsftYkhMEjXOMVW6h
	Unij+tR/J94KjlSKUAc8BYrBeY
X-Google-Smtp-Source: AGHT+IFX99kb3zM/GxZwFTAMAN3gqXJ5ZHqy/VF9Dg+m3r0VxCDt57B+XlhPKWQV1NXnarYSSEpZQQ==
X-Received: by 2002:a17:903:380d:b0:290:ac36:2ed6 with SMTP id d9443c01a7336-29f23b51002mr54896875ad.14.1765620133380;
        Sat, 13 Dec 2025 02:02:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 55/67] oeqa/sdk/cases/meson.py: fix assertion for multilib
Date: Sat, 13 Dec 2025 15:29:19 +0530
Message-ID: <20251213095931.2571498-55-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227673

From: Chen Qi <Qi.Chen@windriver.com>

In case of multilib, the values of CC and HOST_ARCH in self.td are
not valid for lib32. We need to use the env vars sourced by the
env script.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c08c605c91579d2d21711b77fac484077132ce5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/meson.py
index a809ca3a53..7419988922 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -39,11 +39,11 @@ class MesonTestBase(OESDKTestCase):
 
         # Check that the cross-compiler used is the one we set.
         data = json.loads(self._run(f"meson introspect --compilers {builddir}"))
-        self.assertIn(self.td.get("CC").split()[0], data["host"]["c"]["exelist"])
+        self.assertIn(self._run("echo $CC").split()[0], data["host"]["c"]["exelist"])
 
         # Check that the target architectures was set correctly.
         data = json.loads(self._run(f"meson introspect --machines {builddir}"))
-        self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
+        self.assertEqual(data["host"]["cpu"], self._run("echo -n $OECORE_MESON_HOST_CPU"))
 
         self._run(f"meson compile -C {builddir} -v")
 

