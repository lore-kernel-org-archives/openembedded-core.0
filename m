Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309F8C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:59 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.437.1679092967976679208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vhkjyeGR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso10573039pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpTI0uabQXxOlDPx+uYBsScMza6+sPhplfO6KBdXSi8=;
        b=vhkjyeGRm+z53R2V6Zic+SSD9oet2FBuBwuyrPOvPK4N9CA9ZcJQCP9R9dY5Ht9sOH
         Pmebufok287hmz7QUKa1WVKN3V5YGbJm1DtWJ/43mcJevXv1+3i6/QVmUX3WHT7eAL0X
         mZI4CX7Nw6tCTA4Eljs+NmWvZdMJQSaxqSYJ7DDlshRqaKw1tKaLWrQd0UsLbs/DlJT5
         46RE2at9GfsVxaWbVGP3fWr/Bn0IdHhx35lW8t3fygAXmVQ2D7iZLOswTJ4uT2ozGDUX
         Elp6Edu1K2Xe7aZa6TMUXuJMsA5DS/R4j2AoOd9uU6/HzaPS/DooHha/eIoO1NL52br0
         u8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpTI0uabQXxOlDPx+uYBsScMza6+sPhplfO6KBdXSi8=;
        b=MUEYDw/6/TL0fVebpueBpFVF8iWuuO+aI8Py9vl0HhFMStBriZD3+Y+JoY+xV+EIew
         65M0QcJeLHWUzg5MEv0Dr4mgd4oFu8ObsYPbRLBGpN1axOCiBDr+X/5ESREYwea5paFO
         r9QBGWkhy93p6nHs68WgzmJhbNWnhIE9pb5VxWBCi7f98qPKo4UY7W8AWI9YLlRsZZUb
         2Lq8Md5N/vMZIpzO+Vn/7FZc7wpW6/SHPDVBGuixCr7XT8ajG98Hx+ViPnsKZl+7OWw9
         aJrVLl9i2W8G1QMp4Ss2SeXfjiV7rGRJQMFaGpY2uCRddP/PkSUX8ZutsoL5EmHozwGg
         h3Cw==
X-Gm-Message-State: AO0yUKWlleG2VjggIRlXCeCSfJzO49UysAA73DdRUGfO/bGLGjWSfo9z
	lodhsH5oTadISBaluCW0u8FohYW/TfiBpO8Tq/0=
X-Google-Smtp-Source: AK7set8GHqm9pn10UTD6Si800HtNE+rbpUdDrXUZZbJdpk+gn3vd+1k+5mU4HJs6TIz154B0SitHBg==
X-Received: by 2002:a17:902:ec8d:b0:1a1:9020:f9c7 with SMTP id x13-20020a170902ec8d00b001a19020f9c7mr9244564plg.44.1679092968709;
        Fri, 17 Mar 2023 15:42:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/21] python3-git: fix indent error
Date: Fri, 17 Mar 2023 12:42:17 -1000
Message-Id: <48633d8920210e55e0b9ee3004f0502f9f0eec48.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178764

From: Kai Kang <kai.kang@windriver.com>

It fails to import anything from git/remote.py:

  File "/path_to/python3-git-native/3.1.27-r0/GitPython-3.1.27/git/remote.py", line 700
    url = Git.polish_url(url)
    ^
IndentationError: unexpected indent

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
index e3e66ec450..a017369f37 100644
--- a/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
+++ b/meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
@@ -291,7 +291,7 @@ index 59681bc..cea6b99 100644
          scmd = 'add'
          kwargs['insert_kwargs_after'] = scmd
 -        repo.git.remote(scmd, name, Git.polish_url(url), **kwargs)
-+         url = Git.polish_url(url)
++        url = Git.polish_url(url)
 +        if not allow_unsafe_protocols:
 +            Git.check_unsafe_protocols(url)
 +        repo.git.remote(scmd, "--", name, url, **kwargs)
-- 
2.34.1


