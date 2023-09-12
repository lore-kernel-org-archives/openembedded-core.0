Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21391CA0EE8
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:54:09 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.25685.1694526840950275764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CHao8DfU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c337aeefbdso51467545ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526840; x=1695131640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8LMa7ahoZXwret8ysTootmVsZRBZ5Fx1RBsxt9oLAQ=;
        b=CHao8DfU+aV8cH31vJW6iSTca2BJvX2vTlnEx0oBqtZSBQVgAz4e7uicyDIU7D4SnG
         MTfk/7Y0KnKcAfournhIa2OwaJAKzgyOBlkoM6PCTg68w1co79Yvk7TvOC201O8QIyda
         /Rzc6zvM5pfqyKagxyZegmyHGNCVZPAxqjXEPCh1YBhT2/EiwGPjDEsKYyP+JgabtYzt
         SC5wUEdYh7SXW8pUNs73ZuXGOGqy/hML91qYfM7fdhQGm1uSZJ93/wMbqs6rtQCrEqXS
         ZWntB3cYqeip123UIzSbAq/5JQ7kG3smZ5jdhLzIPp6cVQxABwh1Nqmc0ChN7LCaC9W4
         iqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526840; x=1695131640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8LMa7ahoZXwret8ysTootmVsZRBZ5Fx1RBsxt9oLAQ=;
        b=JRsz81z/jCo5yHCdHvwpj2F4wzQyIVbXQUlgCAnd/qdEururSfGw460OmGzpOGtbE1
         sWKwpMB0aN60Uqd9MNKbaLhG0Zt0icvYnCdah8MvTV1GNLdyUHJfGtt4SwxD5ncq+FHu
         s+kRJ1pgY5QnR+0mmS4uIr1Zmf4XYHuqsVB4mKyaUweKiqCLn9Oe8OlVyCLxEDdlGh4/
         E9VjYXVVONlWkFAhqLJkch8myUqhgpgwkMw56VM8EXQbiGJzWBDE6P16dAz/4apYiKZ3
         XEGIJeK/X2AmrAzX7/LHX0nQZDf5AiDqCVVbsq7wSUUQjhSx77/lgoHtT+8NOyK651ek
         dfiA==
X-Gm-Message-State: AOJu0YyAKK4e1LEQz5GjLBHBYdfX++GavDlk/Qup4zBDff73cThLcmJi
	vA/k6geEEzQYFD1lQ7w6PZyO4m3pd4wnLliUYUo=
X-Google-Smtp-Source: AGHT+IHSbcivs3GNpj6bxzMjppS1XaAWlatuben2OZs9HbcbkILZyyoEQmhCTshFO33Rn2a5NkZ0SQ==
X-Received: by 2002:a17:903:2348:b0:1c2:584:51c8 with SMTP id c8-20020a170903234800b001c2058451c8mr16638375plh.12.1694526840118;
        Tue, 12 Sep 2023 06:54:00 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] selftest/cases/glibc.py: switch to using NFS over TCP
Date: Tue, 12 Sep 2023 03:53:21 -1000
Message-Id: <1f35336edf13496432fb68e7e048a5c137fc3e47.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187527

From: Anuj Mittal <anuj.mittal@intel.com>

This provides a more reliable test execution when running tests that
write a large buffer/file and significantly reduces the localedata test
failures.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97a7612e3959bc9c75116a4e696f47cc31aea75d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index f2ed822bf3..c1f6e4c1fb 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -41,7 +41,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         with contextlib.ExitStack() as s:
             # use the base work dir, as the nfs mount, since the recipe directory may not exist
             tmpdir = get_bb_var("BASE_WORKDIR")
-            nfsport, mountport = s.enter_context(unfs_server(tmpdir))
+            nfsport, mountport = s.enter_context(unfs_server(tmpdir, udp = False))
 
             # build core-image-minimal with required packages
             default_installed_packages = [
@@ -70,7 +70,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # setup nfs mount
             if qemu.run("mkdir -p \"{0}\"".format(tmpdir))[0] != 0:
                 raise Exception("Failed to setup NFS mount directory on target")
-            mountcmd = "mount -o noac,nfsvers=3,port={0},udp,mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
+            mountcmd = "mount -o noac,nfsvers=3,port={0},mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
             status, output = qemu.run(mountcmd)
             if status != 0:
                 raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))
-- 
2.34.1


