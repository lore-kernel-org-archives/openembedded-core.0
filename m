Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7BCC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:06 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.69595.1677430983419634588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zOUOvWAv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso2905147pjs.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/bAyshodnGAIvzSHijP9hZW3pv2nolKxDdNR7PsyEE=;
        b=zOUOvWAvQ5g3U+whHIt46woiyrC/Oehj3aOXe3AUT1onFyirsPiXkyaFloLhcIs5rw
         BYLtPuvPo+fVmJcV2da4MJp/EOio9OlZWOKUI++8fgOWq5LxICSZVJ3/BCJXxLpeBTgT
         2YRiwPjNW+wtUE4an5xbWQtiZJw9ujBHtHAxMYWNNXy+yuDWlTpUKIgqp+u70gHog8eo
         xbkytL4LQHHzc9uS8YCcaSssuB7FGaUBs1l06WBnMeJatjKsDHf3SltLXTjKuLEYm7/c
         Rz2MLW3Ih580GewWNn3W+ZiRRDsTZDNSwYhz0eZ4JZjmkY65H/pWtQpu5V1Mqx9RTmpx
         g9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/bAyshodnGAIvzSHijP9hZW3pv2nolKxDdNR7PsyEE=;
        b=eI3JBZHt8Mom+Nw72a9yrG2+IEeYxM1Bz0zxnYp/WSBB8G6rFx1LR4yL0SyJPn9OCl
         bSfhzvZhc++aM1OsQ8ob7qF5vJkwrmuAHUMEtZ92fEgNqj/FmAotJ9qYRBNUp44thWfq
         LVaJ8wXL8Lfsrk8vR7sWHGFaebLyueFPjOZDdHbtfH8K5vRFrp7TM0Mgn/re145mxr3L
         GViR3ZqPAeeS1QDHvr4vb65Him5UYlbW0DFUTtCVHRVbBHgEntn6wRwcFCxAP+23Gqka
         4jlTrwtINN5MVYILWMVLZgncaGhqZPnhJ/rb12PUmtcMPlXK60ZHaF7ic3aRDBrHcc37
         STbQ==
X-Gm-Message-State: AO0yUKULVdAwjSzluS7XWRRAXcG68eERa6Mu2dpR09QOYNo+UxD1d1pb
	KRVQyY5Hlz/2sK4dC5+xZLZI94e8v7Ych9jkKLs=
X-Google-Smtp-Source: AK7set/JMHctqLIpXMe3R7qudAyNOIqJ9FqSRzXTj5ix1s42GvuJI1uYl345LGjDrlfDVbJB4XaOlg==
X-Received: by 2002:a05:6a20:2d9a:b0:cb:77f0:9a27 with SMTP id bf26-20020a056a202d9a00b000cb77f09a27mr18232235pzb.24.1677430982452;
        Sun, 26 Feb 2023 09:03:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/28] sstatesig: Improve output hash calculation
Date: Sun, 26 Feb 2023 07:02:14 -1000
Message-Id: <f1f24e9dc4d4016702d40ec5567cf65d9c04000d.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177756

From: Mateusz Marciniec <mateuszmar2@gmail.com>

Symbolic links to the files are included during the output hash
calculation but symlinks to the directories are missed.
So if the new symlink to a directory was the only change made,
then the output hash won't change,
and the Hash Equivalence server may change unihash.
In the next run bitbake may use an older package from sstate-cache.

To fix this followlinks=True flag could be set for os.walk
but it can lead to infinite recursion if link points
to a parent directory of itself.
Also, all files from a directory to which symlink points
would be included in depsig file.
Therefore another solution was applied, I added code that will loop
through directories and process those that are symlinks.

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ee729163f31f26b1462a47e1e53f7a0f9de9b464)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index bf48aed7e1..fb4abe8241 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -662,6 +662,10 @@ def OEOuthashBasic(path, sigfile, task, d):
                 if f == 'fixmepath':
                     continue
                 process(os.path.join(root, f))
+
+            for dir in dirs:
+                if os.path.islink(os.path.join(root, dir)):
+                    process(os.path.join(root, dir))
     finally:
         os.chdir(prev_dir)
 
-- 
2.34.1


