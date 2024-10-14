Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F20FD16258
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 12:27:46 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.53775.1728908862747775505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 05:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DB1QGVwu;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99f629a7aaso260558466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728908861; x=1729513661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxHgMxFnJpTxJkFJJ/Sm+GDTV49uKy0ERUBEn/dv1gM=;
        b=DB1QGVwu6WdPMXUbAkZOYHDQU/SbOoaQN9wHrpqtXC0RQ+19CBIsPktXrLh09jlE5v
         rM5EtpOvh73B2LWaTHRJdE+U4U8+ART8Ig6Rah08Zf0FSfOi7o0lLMqrFVKQyBnSjY8b
         YDhmqftzQj3fkSQtLQ3B9JyApMj5dQAA6pIKKizr5NO5VDe6FZU+qKsGoFVxFAfTpF99
         9hraqHyQbhfzZuP9JDEjVAs+c0iKIkw2kdlEOUfKciQGFH2xVx0kSc3JkwmDqVyJlUPx
         BsWHfCtbm44KA5u9PWrn8u/ajGVKYnQJ/Dvb/D2EMxdR28sTnCVLmFYkBvMLrf1xpI/P
         NChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728908861; x=1729513661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxHgMxFnJpTxJkFJJ/Sm+GDTV49uKy0ERUBEn/dv1gM=;
        b=Sff3gT31m0pRez7zw+9BfosNGh9mxWiuUOT7+56p/uVjcbAvsiLZzm9S3m316xDQfd
         1IP9iqczn1C/WXoXNCyicf5daGxYPjbIgIeoHGIXY5/jC9VNcNkTe4sfK04cV426EbFO
         u0zD+Kf/rAOjz5OX+kzLIh/IU+qdtjmynyMnDr9zdvKeV/vj8U0zx7vFwn/vH+9xRs4x
         21iCAgyyrXFhmAVhmfqSckU3FzISMmYvtLC8LMdiAtKPU9bi4tDgoxDm37UYOsxEWxdA
         K1m2oYHpYWVmqdZ4pC1ImpfCp2x6H1MUBjo+0NE5TCzoTsvT5qFTuD1+ziASN4geaHqo
         XtQQ==
X-Gm-Message-State: AOJu0YyOWARm3iFacatekWRGh0ZHUITyQgR6VvQtYBqtU3+zE/Kf8Avr
	FDwvCR8BwXHjbH6iMK+vldmFsp8e8vbw2hzt6j/aNYJSGFemXNKDRF+JqQ==
X-Google-Smtp-Source: AGHT+IGTEZyzfgXv+BEl7AoLJT5RLW2LEMAhrGkkCvijDlqkeeBlwUxrdpsjQg1lPsiP7YzOyKeN1g==
X-Received: by 2002:a17:906:c10e:b0:a8d:6372:2d38 with SMTP id a640c23a62f3a-a99a110a219mr1499814466b.18.1728908860924;
        Mon, 14 Oct 2024 05:27:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937260aefsm4873230a12.65.2024.10.14.05.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:27:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] fetch2/wget.py: use default wget user-agent in upstream version checks
Date: Mon, 14 Oct 2024 14:27:31 +0200
Message-Id: <20241014122732.2288752-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205764

From: Alexander Kanavin <alex@linutronix.de>

This has been set to various mozilla versions from this point onwards without
explanation or specific examples:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=ba06cc8943d021f406c3d292ce415b77319ca5c6

However, sourceforge has recently banned the current 'fake mozilla' version
we've been supplying, resulting in broken version checks:

alex@Zen2:/srv/storage/alex/yocto/build-test-sourceforge$ devtool check-upgrade-status gptfdisk
...
--2024-10-12 11:53:23--  https://sourceforge.net/projects/gptfdisk/files/gptfdisk/
Resolving sourceforge.net (sourceforge.net)... 172.64.150.145, 104.18.37.111, 2606:4700:4400::6812:256f, ...
Connecting to sourceforge.net (sourceforge.net)|172.64.150.145|:443... connected.
HTTP request sent, awaiting response... 403 Forbidden
2024-10-12 11:53:24 ERROR 403: Forbidden.

gptfdisk                  1.0.10          UNKNOWN_BROKEN  Alexander Kanavin <alex.kanavin@gmail.com>

On the other hand, using wget's default user-agent works just fine:

--2024-10-12 12:16:06--  https://sourceforge.net/projects/gptfdisk/files/gptfdisk/
Resolving sourceforge.net (sourceforge.net)... 104.18.37.111, 172.64.150.145, 2606:4700:4400::6812:256f, ...
Connecting to sourceforge.net (sourceforge.net)|104.18.37.111|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/fetch2/wget.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index e8b1292433f..493a5b62ee2 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -463,7 +463,7 @@ class Wget(FetchMethod):
         f = tempfile.NamedTemporaryFile()
         with tempfile.TemporaryDirectory(prefix="wget-index-") as workdir, tempfile.NamedTemporaryFile(dir=workdir, prefix="wget-listing-") as f:
             fetchcmd = self.basecmd
-            fetchcmd += " -O " + f.name + " --user-agent='" + self.user_agent + "' '" + uri + "'"
+            fetchcmd += " -O " + f.name + " '" + uri + "'"
             try:
                 self._runwget(ud, d, fetchcmd, True, workdir=workdir)
                 fetchresult = f.read()
-- 
2.39.5


