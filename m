Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A24D3A68D
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.1973.1730228422008082951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U9EIGwfn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso120349b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228421; x=1730833221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQPnmP12rzNfvQ3AZ6gVlcyc4dn8GQjqnmmcr55xZKo=;
        b=U9EIGwfnMw/ejCjKVwP9LA29JvfiMpEXWFZf6Ek9evq88LgFDFPs6lMCkNoZz8gHUw
         84OK20qbkCrr+gdT1G41iaknJxddWZQ9eMVooMUeTbI8wpjC4Ap7PVTC23ZgjV7UjvZL
         x7XEhUWuNUPTgG92gvdurF6RSz0zu/0bgiCs9THeVeJ+YybmMzgs/EgGtxtEkkig7X9Y
         rd7MhfeufM2wp/b0bnz289nSRRk7r6Zqzh5O30vWch5SOlbTjAVjCldqcGaIABDdbBd4
         r4VzvhMz5hViEc91SDW4OYwrPN+ovHTJMxFEWLJcy4EMYG145hUrL6c6JWAWBxbWZjTx
         nVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228421; x=1730833221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQPnmP12rzNfvQ3AZ6gVlcyc4dn8GQjqnmmcr55xZKo=;
        b=taRmTUkUhgtOZXvGD3b6c4EF49JYgqmz/lGirHz8wRxXeFJ8g2ZHVbLa9BBb+rtJYi
         rePMxM+9obEIB/R9/W4y1TBl+d44BTFVViwn0I/TkYAdzO3iyc5TZazehnIfPQUvKTri
         Tfc5G4uH6ZDXvHgG7S6IA1PvsyqWS/VAKJK3qcWJemK659v+WtszLtUESJlXTOnPqcwa
         fWM8sfaYVshfXOtsqG7/mH5FzRMlRmqQ/N4/hV4XK56pz++EGe+0IQ6aiZZkm2spkPJq
         4d57wCCrUqpU48thaItLEZSnoMN7YETe30GiEOiXumzBng+qoLqbKaItHYX3U8K9SpTc
         5/MA==
X-Gm-Message-State: AOJu0YxPmwU7I/8vqOJfw31Vepg2kR3agM/QV1JkMUxrT7eHA7mVVGAa
	9DOrbQnz0lmivSeaxl4pS1OklomPZDeA3NjEmiY4OpHum9GPweLGsaj5cnsKxsQzc4p12TAGlFr
	+
X-Google-Smtp-Source: AGHT+IGfJ41F3p0HcF/3tetjhU+EmVzZWfLIS1561erTxwGQDlEWqZ9LMnnRkdZWwb5LTp5PG4oH1w==
X-Received: by 2002:a05:6a20:9f96:b0:1c8:de01:e7e5 with SMTP id adf61e73a8af0-1d9e1f46f1emr4231326637.15.1730228420514;
        Tue, 29 Oct 2024 12:00:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/19] nativesdk-intercept: Fix bad intercept chgrp/chown logic
Date: Tue, 29 Oct 2024 11:59:45 -0700
Message-Id: <ed009b5d58914582c0770222115fc5c5a16bf16d.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206522

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

Running either of these ends up corrupting the os.execv args.

If we run:
./scripts/nativesdk-intercept/chown -R foo:foo bar

The loop here ends up missing the conversion of foo:foo to root:root because
it sees sys.argv[0] and assumes that it's the user:group argument and that we
should convert that. We end up a os.execv(path, args) that have the following
args:

['root:root', '-R', 'foo:foo', 'bar']

As os.execv ignores args[0], we can just populate it with sys.argv[0] and then
loop through sys.argv[1:]. As both chgrp and chown would have either flags and
USER[:GROUP] next, this fixes the issue.

(Backported from OE-Core rev: 2a75f647ec7696d353f4b09099d777ba53f34d36)

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/nativesdk-intercept/chgrp | 5 ++++-
 scripts/nativesdk-intercept/chown | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/nativesdk-intercept/chgrp b/scripts/nativesdk-intercept/chgrp
index 30cc417d3a..f8ae84b8b3 100755
--- a/scripts/nativesdk-intercept/chgrp
+++ b/scripts/nativesdk-intercept/chgrp
@@ -14,7 +14,10 @@ real_chgrp = shutil.which('chgrp', path=path)
 args = list()
 
 found = False
-for i in sys.argv:
+
+args.append(real_chgrp)
+
+for i in sys.argv[1:]:
     if i.startswith("-"):
         args.append(i)
         continue
diff --git a/scripts/nativesdk-intercept/chown b/scripts/nativesdk-intercept/chown
index 3914b3e384..0805ceb70a 100755
--- a/scripts/nativesdk-intercept/chown
+++ b/scripts/nativesdk-intercept/chown
@@ -14,7 +14,10 @@ real_chown = shutil.which('chown', path=path)
 args = list()
 
 found = False
-for i in sys.argv:
+
+args.append(real_chown)
+
+for i in sys.argv[1:]:
     if i.startswith("-"):
         args.append(i)
         continue
-- 
2.34.1


