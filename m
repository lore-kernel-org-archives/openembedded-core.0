Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C421C3DA66
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.13104.1692801444550981080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=BpMZVtXL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a520dba33so2568867b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801443; x=1693406243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CP6ZREY/FezkRXL31nd+v5SUDFOuxoE0W0NY7hafMPo=;
        b=BpMZVtXLNUX0OQE11uSIH4h1djt5j2Uro/i5qHS6viMwbvmfQZXV17fYWyg3beGIqY
         +VB9qFXyPAdDq19V87HFx2gNLU0VlXsJ7BFlk7XdXbQfywW8Jsgteh1mN0Ov/CsN8Z/i
         BSXSRKE30SbvwSTnazVXSPvoXDcojsnwLW9dTne95KocAhkI0s25gLGUzMNgiItYTn63
         P7AQlvejJj1SYtGgzggZ5O318E58ascbeIsVWVQyynvj3UaEsE6Ixxjkfp9ouJhN+Tod
         uzycXpyMu11OUaPtPDDaLePaoES53TjP0hFRBTu6vZjOmv/YS6xKaOWS+jSu6eRLv94S
         OD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801443; x=1693406243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP6ZREY/FezkRXL31nd+v5SUDFOuxoE0W0NY7hafMPo=;
        b=XlP8qcKad2FNt468Yy7J6rQ4vj7ynbV9HgEluddbvBA7a4m0FiiktjHeH2U+usCxUz
         s0oPYo4OuLKrvFsS2d9JDxly/8WS47DjgjIDJ2DmQKGMJCJUPJt5C3EuvSgBxI/2r1r7
         fKvWRkWRkyB7ZFcX/vpd1FIzCFp5nN2Np4soA7Rares+z/aGbNabEqWHX0MihNSSqgvc
         M6cM+BR+WY8BBQrKSxTuX5wKs2uocJ7giOC+NgVLHsjeeOBUcVqjj6wZDvmb+1W4SEwN
         5/reuTmy++rTonMqmehqojA7VwKHz/tqiidkpQHeBYtcWpU7sBJsmgwMe2OC8mn0eXOo
         S4gA==
X-Gm-Message-State: AOJu0YyiwMunxg+at12wqpoK0frZYerV30ljQes8R71o9bRsadoPhEve
	Zj82LvpJAZxQFq/+UswpV+75DE1BOjilessiGB8=
X-Google-Smtp-Source: AGHT+IFFvbQD/tzykwKe1ILacjOtpFvphs6ljOkpik15z7cmAu8XFZvfvhHWjViTWh8GDBp2E5CZdQ==
X-Received: by 2002:a05:6a20:1444:b0:149:424e:b26a with SMTP id a4-20020a056a20144400b00149424eb26amr9296469pzi.19.1692801443400;
        Wed, 23 Aug 2023 07:37:23 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/36] selftest/cases/glibc.py: switch to using NFS over TCP
Date: Wed, 23 Aug 2023 04:36:01 -1000
Message-Id: <8d0c669d3d04cf5bc645978afb22ba6c3f3d53e6.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186612

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
index fdda6f3ecf..f42593a27f 100644
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


