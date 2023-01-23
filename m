Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B681C25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.34110.1674440565092418665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=QzZtb0Ej;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id z31so4655727pfw.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/O4dVqVAhkAdzhAGnuw3N1UV35kkFOqBhyLFO0lhch8=;
        b=QzZtb0Ejyb/mIC4z3B8iro0opOsBlSaxU1oxQ3EKKmMNH390X8Rl91VychlCUT5JwJ
         gEspTWE60b3qc8XzkbUo56zJl/w6MnKp9l/5t58EdNcPHOG2yapKqpqelAnBwDHLoSnn
         VK6x2FTgCti3csX7CueRCvAVYgCG0CY6jRBNNkSZrl+vdIQzsbiV76/4f7O0yHLLZeS0
         TfOoL55dY9yJK+nFYGSx0rg+Trgo8JY/D5M9Uf2fsFOdEom94zaDaUlZQ8JmfeN2/Uuq
         GptimA+1nUF34etT7xESPZeJxItwywN+AbMgr/fgg0+vnj4YXLR1L1TNbHymo3O263Qb
         rM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O4dVqVAhkAdzhAGnuw3N1UV35kkFOqBhyLFO0lhch8=;
        b=Ulj/LFWz9IhfL8G/u4SP5Ts0m2lEXjb2FzY+2858S/5v9ntzJcrg3JonFu0gmVJQ+A
         ltSExAVZh0rt9MJtNMYJVdm7dPtRLeZh2qn7UROjUsp2CpfvYsIF0arUT5P2gtxybS5p
         8UYqUIR4aCdWyaqny26HU/mGingxpaa3O5NjDYJUT5ZooVkxGXo8pyazyRTN3s9yYb2D
         hY3z1KFK2FwVbOAZrw1D7XtzW91g5uE9BbHrH9j5cO5E1B518HKI5yFHPgEFi2OoDyRb
         9cjmib6hyL0mWZfprSgAheDJGVnPZFjZcnDFqkASCqmkHNHXDh1VlMg33I29PwPutmZG
         JC9Q==
X-Gm-Message-State: AFqh2kqKvBezcag/YbodLWmqPTaRX3L6L8qVU8QJMjA0Vsm1DJ1jVcoU
	gaKxKjy0geClwV+D5hWAN4xjf7tEJoIiDj+NDnk=
X-Google-Smtp-Source: AMrXdXvsdLjKic2dpGSHKjNcyNcR5AFV1aHEV2zOy5lh1APdTXKQa17woOAPJABi0y0qwDgIOda5+g==
X-Received: by 2002:aa7:9569:0:b0:58b:97f2:2e3b with SMTP id x9-20020aa79569000000b0058b97f22e3bmr23701180pfq.1.1674440564066;
        Sun, 22 Jan 2023 18:22:44 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/32] lib/oe/reproducible: Use git log without gpg signature
Date: Sun, 22 Jan 2023 16:21:25 -1000
Message-Id: <3db6db22770515fe52d847bdafd6ec9809ab50e0.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176295

From: Benoît Mauduit <bmauduit@beneth.fr>

Previously, if "showSignature" is present in user gitconfig, parsing
of the timestamp will fail.

Ideally we should replace this command with a git plumbing command.

Signed-off-by: Benoît Mauduit <bmauduit@beneth.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3bd6f78f79b3d3e87d8db1e11f58d8021f929843)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 2e815df190..768fd4f19c 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -113,7 +113,8 @@ def get_source_date_epoch_from_git(d, sourcedir):
         return None
 
     bb.debug(1, "git repository: %s" % gitpath)
-    p = subprocess.run(['git', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'], check=True, stdout=subprocess.PIPE)
+    p = subprocess.run(['git', '-c', 'log.showSignature=false', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'],
+                       check=True, stdout=subprocess.PIPE)
     return int(p.stdout.decode('utf-8'))
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
-- 
2.25.1


