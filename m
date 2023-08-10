Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31653C04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:57 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.21323.1691683555996871980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BZvvyhJK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2680182bc21so634886a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683555; x=1692288355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+Lo+ht5t5NS9Ibo1nZgjsinLMZGtNgjDbmx1RBC+QY=;
        b=BZvvyhJKRodPrSHvMYBhsuI6/K96E2ZLdSCa9OVncGJnR1lohfBo71i//lgy76WK6R
         1eALUYoDeo31p3aLkgr8kg/8C+Htc+pzwpNklZCtj7CsdG5PJ+CBbkd8P8tyGFF9NnZR
         p2Qy7+UNAZw/GFStwHHLnl+G3J4QI9wgLmUc7nxCiG/0u5l8SYO95STxcrviXrkIE2Zi
         /53XpNiRlBQKVSoMIEwnRLWV71l3B2o9K6ctx62VNrs/sXx9IGnBihLJOLW2xrqFkmGu
         siRLpjhU5MYeUX1uPdAQOGoa8xc4oPYQxsc5hEIE2xpCPgDcma9cCd+ocDx5+tBHhEzG
         e+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683555; x=1692288355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+Lo+ht5t5NS9Ibo1nZgjsinLMZGtNgjDbmx1RBC+QY=;
        b=NeT9nx2sQ9lWQQUhHOOQI6v2Hy7AxoLc79nsbBT//+CO5HWsw2y4dKhFeHHQUsjgk0
         RGigy4Y8aqCdtX4Oni3yBt/oL8UTZ0s70G2rB24XqjG4YFqYVe92qAiflTz6TBltr2Qt
         eIQTDwQ3mptd/lgIAu8tTJ1eLgIuUnF3AZrL3z+XauikW0YTQ3vBc9T1k4aN9SKo8twr
         F3JymkPKSKI7TFEZSVoEUWYpKlrYg/uMD/yXUOX+Vjh+M7bRsI6TTLMpV+OUFbsGW+HI
         DIyiTSkXnL5Ux6+TcYWI6QAUBWEnShj19X0PtmxGB3PntG1XkCZqZ7J141dO2Vt31fHS
         uMwg==
X-Gm-Message-State: AOJu0YzWF93N+DVjGTDrlJ6luLvGcrfeSJPnpS++YrI/tWbS9XVG/1HA
	iYh83wVg0E5682jsArCZEx6NJt3x0KsPKuRmTQs=
X-Google-Smtp-Source: AGHT+IELst8zrAuwXWK4Ma0jseR78HFR2pOj8l7VZRtN2gqNoi5XgakXqU/bBMRwgsXMkgjRaYmz9g==
X-Received: by 2002:a17:90b:4c87:b0:263:f9c8:9d9e with SMTP id my7-20020a17090b4c8700b00263f9c89d9emr2211701pjb.46.1691683554937;
        Thu, 10 Aug 2023 09:05:54 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 32/37] selftest/cases/glibc.py: switch to using NFS over TCP
Date: Thu, 10 Aug 2023 06:04:31 -1000
Message-Id: <e138b648a56a0146588dc52edd9b44929ed8a73e.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185794

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
index c300aef913..924df6c5a6 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -45,7 +45,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
         with contextlib.ExitStack() as s:
             # use the base work dir, as the nfs mount, since the recipe directory may not exist
             tmpdir = get_bb_var("BASE_WORKDIR")
-            nfsport, mountport = s.enter_context(unfs_server(tmpdir))
+            nfsport, mountport = s.enter_context(unfs_server(tmpdir, udp = False))
 
             # build core-image-minimal with required packages
             default_installed_packages = [
@@ -74,7 +74,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
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


