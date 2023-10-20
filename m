Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9411C25B40
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:09 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.58046.1697817129372727633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cEX4bFdk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cace3e142eso3891815ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817128; x=1698421928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LC+AmC0mROVn/n5Jx3UYQ+ZeF81UHR7mNHJqhEuEc/w=;
        b=cEX4bFdkVaByeU2684kWKsKWEqyesM2ksvUqOT3AjUtFG3oCEpQL+ZUDNwgLk6sw2J
         SoEuKDuBYpWlC0vcjm8NK+mljBZlQZQliatjI2YvDD6HK+b9eR9aXVZKb9OOn8Mrns9n
         7MGuu+AiDCdTGqFaChiGS35+i/cq+/zf6lScnfpOTWDgXPeZuJWXhOy9OwUbdtD/usZ6
         FuIjxq+6ycCVSFQOrwpj8vGRiF5ytyRMeCDE7dkeYnj18Hq/2/nHGgtNMbEL+gAJeOoD
         YquBcu0ELdKIiMFnMKaEndje3WB59R19r0w+7VhO9BkbWmE84ycaQ2qnMljU52m4MRxi
         uiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817128; x=1698421928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LC+AmC0mROVn/n5Jx3UYQ+ZeF81UHR7mNHJqhEuEc/w=;
        b=epmEofIuzndVltl8VthOmqUJAsp9eXOyB/+z35WnzdT9+KVSv8G2WHBCcZrCjCGkRI
         /lgVYHFFspnCBx0vAldY2zwLzRYPyjnJqk0ipaIc+Dn3Aux+3Q1LQZOLzkQgW/RuU3IC
         qGPuLN1ilZYKfhyriaN8evSOZG6SHmjAX61E+D+OVu9KUcpeAERjyl7W8PtfXtojEE4B
         AgGtVRigKdOYMpVwT7rewbwavzyCECe9NmITH4Gf1+qE0ncryRkQAyysymlgGQVnO8YZ
         b+cCiEm2eaz3B7LwR94u/S6pdkLVjfrNx2GCeUqLvYQv+wh2b/HCMxj35hn66L0g/GAT
         YX/w==
X-Gm-Message-State: AOJu0Yy6CPEWmvPiSRlfKZMlfPp6crspgTJ5uAvsN/LIw05Zd/Jnf3K7
	Y0ny1RDY/lYqDQwcL0FaLmvj6HyQnY/ZAtiEHXY=
X-Google-Smtp-Source: AGHT+IFnVBxSwrflwRGXLd4tLxWnsjaSI/4lbUf+swnVaHRYq+iPETqQ7QQ7zY8Kza9s9BhhjR5CUw==
X-Received: by 2002:a17:902:e88e:b0:1c5:f7e2:c5e0 with SMTP id w14-20020a170902e88e00b001c5f7e2c5e0mr2547771plg.51.1697817128567;
        Fri, 20 Oct 2023 08:52:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/24] oeqa/selftest: Fix broken symlink removal handling
Date: Fri, 20 Oct 2023 05:51:21 -1000
Message-Id: <830412641abe8c7a3ad5eb1709c8372c796a7760.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189564

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The test above this removal correctly looks at symlinks however to
remove a symlink we should call unlink(), not remove(). This avoids
some build failures/tracebacks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbdb6e73b0f52bc5f9429aca47802d51edbbc834)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 39325f4b72..3fb357f8eb 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -427,7 +427,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
             output_link = os.path.join(os.path.dirname(args.output_log),
                     "%s-results.log" % self.name)
             if os.path.lexists(output_link):
-                os.remove(output_link)
+                os.unlink(output_link)
             os.symlink(args.output_log, output_link)
 
         return rc
-- 
2.34.1


