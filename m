Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.397.1592848862251721808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rOFATFKp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id k15so13808365otp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=UPfbBLdGwnLS4C1cgKZET0qf6KmhNJXNhyPYv9iY4e4=;
        b=rOFATFKpbYaKzjfQB/gvwBhKU8UAV8pokwsv1xSG+OIuePkODvj1oxA3l0gvi6bmcO
         RWbClRvMyoMmnU8OM1qQFx3Eiz6thnwEWrHl16hhfRJNKueG/XVSO9w0mHF2RwSXOad3
         gViRoxfWfRruYG7WPYmiS2BJ95WBPncyvyP//C9RvTQ2LIEcaZX6DHL9l3nK+4jSOyo/
         0DgVu6nBgn735nHu+tbm/NmaYmkKp1Xe/trSGlFnDs7QjHIRl+JCXOjUgiQ6qgkCvMRF
         4oOa7hN4Nu5ArnFbSK9XnC9kfJ4heIB7yMeY9gExC2+rqmvd+nRnigFfLuTFt825TwH+
         77oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=UPfbBLdGwnLS4C1cgKZET0qf6KmhNJXNhyPYv9iY4e4=;
        b=t99w7Pssx+wuvLlJIANV5B6JV7yM/YdpjU59IxVtRsNBZabJZtHHMH8OjkvG539ey8
         /j1mF3GY5/IsRhKgvYTGqwvMEEuctcsXZso8xmX90OuJAZFAFRqNk9Rk3RVrc2hxYU4K
         zVa7BOgJa08xzeABQxw9L4Q9BcRAL5ppvHHW9Jya3FKGyBSWzII1qRnFjk511v0LYkbA
         6kHxLD9uw6bE9ql8OPt4fZAWRWGR5zwMZxDcekoNRt09ZkqY5HNMeSeivpGKuvvE2r/A
         YsOlbaiJYb1uJuh4bFg2ytOaTlcswGSuovofllN4XCizSRpRbZvDjr+pf3KRE6/Z1Lje
         oD9A==
X-Gm-Message-State: AOAM533GdISoRF66Hz3sXxQ/WGLJaKdn9hIk+oJs+bm0t+ALGVq+Um1X
	nZE4Cqn1yE+y86XtH+Lyq2fXpXhNbPF80A==
X-Google-Smtp-Source: ABdhPJyFx9oWFc1G3CIzc5sjNJZTZZujkmNx3kbd+7Wy0dzPKjlINaszC/wtLwMJqMQUgmwwQNtN8Q==
X-Received: by 2002:a05:6830:20cf:: with SMTP id z15mr15735008otq.248.1592848860753;
        Mon, 22 Jun 2020 11:01:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:01:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/33] buildhistory-collect-srcrevs: sort directories
Date: Mon, 22 Jun 2020 07:58:14 -1000
Message-Id: <9ca9c0fa320caeb2a1e7a60161c4db66dc0f2030.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

In order to allow consistent output of buildhistory-collect-srcrevs sort
the list of directories returned by os.walk. Otherwise the list of
SRCREVs is returned in an unspecified order.

We save the output of this command on build, so it creates smaller diffs
between builds.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d7cb207ad4ec3cd5a3064147d3c9b5a1730d0fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/buildhistory-collect-srcrevs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index c4d203ff4d..340bee78bb 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -59,6 +59,7 @@ def main():
 
     all_srcrevs = collections.defaultdict(list)
     for root, dirs, files in os.walk(options.buildhistory_dir):
+        dirs.sort()
         if '.git' in dirs:
             dirs.remove('.git')
         for fn in files:
-- 
2.17.1

