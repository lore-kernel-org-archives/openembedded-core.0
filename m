Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1C7C4707B
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.151546.1703864774567838767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ioIvlVLl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d43df785c2so14938935ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864774; x=1704469574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQOTxCpdnXMFDMWjwVUgSlQ+MAhdWYK3wyltJQoywwU=;
        b=ioIvlVLl+8fCrrt3mHZpjUdwlznp0RyARL+D7qm/JjCznD8+3WEQ7Ti+d2v/o6YowP
         6Ta3q0Tmuqa8FMOA5ISd4vy64ziF+w0IhCa715dF6FQ2hiH4nFA6s7+wbKPFt6rq8lkD
         2oHk/shmyrOu1OtbMQbRuTp1ZgRRmU1qrrMiTREGlwzHEFlNU2K/KqgmYA1GDA+A1MiL
         hg0KTRpWNWk7G3NAGioLJdl04MXVb9W4AqvJrFHkRIOkVQJ3rqx0di8uLKlXiijUx11u
         +2Wavqn1sCiMm2Tyb03ZS9ek6N1esw5hvGA93pF5VnU4Bb69z40whFIid1uE9acURxnI
         2/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864774; x=1704469574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQOTxCpdnXMFDMWjwVUgSlQ+MAhdWYK3wyltJQoywwU=;
        b=HzFN3mYVstHhH2MLOtHcF3KsyWy4FYQwIClE4rhXS64N2Ijiis3SUzMjx85BB7Nohu
         TLHgAXsWRAzv0gI+lGZRjdZDdSK0loxDbXFqQAWRIjZCglShlY+yPCKsjOQNNQBOg6+7
         xSvC4QG6EvGg2J1JhiXbK5R4F9oqcQVXUph9MUApsLUrzKkCTsh0KuShsNrpURCJ4Elq
         aIuyVcCUCT0IpD0HQZxjY32iof3m5uSWrsW2PIlLZhH+9SW3fOc/00LadLRQev+JXxjk
         jmnzvr/NWDNp5QVcw/O+F7/FQiE3/DdvNPbPGVNZmGHTiNY1JI7196gnStkH2zZHEMfu
         TLqw==
X-Gm-Message-State: AOJu0YzSlkGJ83sg6O/I0o1g5opbVqjugbyLAvB/40i4FCpPm9iPZtIK
	utzD9LPZEKkBuSd0iPv/i381ZyVa65/Q+BRa89vQmJmF8/3gpg==
X-Google-Smtp-Source: AGHT+IGtpZMaNUqA4HbzotiFm2weqOUQTfFOJEoyWUKyvp442kpBsflssypBYMoXeN+dg4H+rI1PHg==
X-Received: by 2002:a17:902:b496:b0:1d4:9225:a88f with SMTP id y22-20020a170902b49600b001d49225a88fmr1427109plr.13.1703864773711;
        Fri, 29 Dec 2023 07:46:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 38/41] patchtest: shorten patch signed-off-by test output
Date: Fri, 29 Dec 2023 05:44:52 -1000
Message-Id: <f6a6af896dd1968eded614b0c519dc375eff407a.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193055

From: Trevor Gamblin <tgamblin@baylibre.com>

The patch Signed-off-by test's output line is excessively long, and can
trigger a failsafe in the patchtest automated service's email content
generation. Shorten the output by reducing redundant phrasing and using
os.path.basename to get only the failing patch's name, not the entire
path, as the submitter should have a good idea of where it is located
regardless.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc7546ded87dd44a988d7a23f1d7645094b5cdd4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index 65d0f930b0..d7187a0cb1 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -6,6 +6,7 @@
 #
 
 import base
+import os
 import parse_signed_off_by
 import parse_upstream_status
 import pyparsing
@@ -87,7 +88,7 @@ class TestPatch(base.Base):
                 if TestPatch.prog.search_string(payload):
                     break
             else:
-                self.fail('A patch file has been added without a Signed-off-by tag. Sign off the added patch file (%s)' % newpatch.path)
+                self.fail('A patch file has been added without a Signed-off-by tag: \'%s\'' % os.path.basename(newpatch.path))
 
     def test_cve_tag_format(self):
         for commit in TestPatch.commits:
-- 
2.34.1


