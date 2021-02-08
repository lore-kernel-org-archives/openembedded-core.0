Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.35347.1612792523230377693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lhGjBvKK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id 63so14256028oty.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O6mZsb6gApVwBuL44kM2YsS1kaeQnjhStM0TQLMfEYQ=;
        b=lhGjBvKKtZxIt5FlcM/tlHi84DtI/bkn8ti049msvxUg/pharRQgjLoYpw+Q/JtDCH
         uFOO20F1sXzwlb7QLkT/czMvF26uhiG5E4V1n8YWty8efGfne59izb2Gahqu7JQZ7KwT
         /UYQSjKSYMCtqIE2qOfRXxI2zhEJP8WkcIThiHEy40rlnMxCIZpuK6UZZRSpu6/IA2NT
         oF1MavIgP0PHwV9JeuZMtMoaCDcrmdcrnxzim6Yf/GSiCSlVH7qZku8rszwTiwHi9aqN
         3OL97BHSDW097AYZEUx3N94Fy0Zt9/juOS5gTq3GQhtW42NZkaqx1TLdIVjzjb2hQ9ri
         UyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O6mZsb6gApVwBuL44kM2YsS1kaeQnjhStM0TQLMfEYQ=;
        b=E1zkHlh3As/wg+LshqZnPmHlJyP7KThv+KUaHqWwNRojSbUlQ1QpYOx2GiwFl4sxpc
         1HgLXsYNufOeyVFI4hHW7voRdIgexMujAsTfAcuTb0Go838thQRBq7UzAobuLqrYS0sl
         frdysrNqC7fiVuhAOHkB9eoWd62sbS4x/2mokVgQbsVDsgm7a+18SqF0WU9l2AHWezvf
         +CNZYdN9Kxv4g26JYsf7gxBcddbk34HMEXA6LnskNhbZWk/Ud1YphfaZTG21Qe31Jhs1
         mKkk4ekjja+j9yn0J51muYdFgmsUwK6mE8AjoqLl7TKWLOWttADh/iQl5TJeJZZAbzEv
         dcpQ==
X-Gm-Message-State: AOAM531zum0FQVwrR6Wis5OHZO+bbjpmImRQKcGVJ1Afg/rJOAa2aHy7
	4M1BBVynxS94KvoBClYvcuS2UkBQGJxYkaq+Iso=
X-Google-Smtp-Source: ABdhPJxDKGIGskqIaxW9V5vmaCk1rtAv9Xxmeed/cEvS+oWb5DjvHRRL4rROzkT69VlaZhU3nuRJSg==
X-Received: by 2002:a9d:7d10:: with SMTP id v16mr12598613otn.54.1612792522184;
        Mon, 08 Feb 2021 05:55:22 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.55.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:55:21 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/28] lib/oe/patch.py: Ignore scissors line on applying patch
Date: Mon,  8 Feb 2021 03:52:14 -1000
Message-Id: <5175b8f38472a4bff724d91e363b1fb78c5ede5f.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

The "devtool modify" could remove message body before scissors line, so
patches re-generated from git tree were incorrectly modified.
Adding --no-scissors to "git am" invocation to prevent this behaviour.

[YOCTO #12674]

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13ea33fbd197b9ee3cf913d9995617115f22798f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 7ca2e28b1f..7cd8436da5 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -512,7 +512,7 @@ class GitApplyTree(PatchTree):
             try:
                 shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self.commitemail)
-                shellcmd += ["am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
+                shellcmd += ["am", "-3", "--keep-cr", "--no-scissors", "-p%s" % patch['strippath']]
                 return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at the end
-- 
2.25.1

