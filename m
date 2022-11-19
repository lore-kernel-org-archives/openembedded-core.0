Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3044CC4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:09 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.30671.1668892563684850806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=h1d2+cdX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 130so7926285pgc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vrtv6u3aJT3EQ+meoTWMAeWYQ6JNyE7BY99lhxjfLwQ=;
        b=h1d2+cdX+t6GyF69cXmrWOafdvaTu037KYpum/6fTagUqrWFyxAChIvs50HI9+hHM/
         F6Rpfzf1q4v/Jmfk3YIZlBYwnz4+pAuz3YHAPLrx7gkqymE6FUsVTcTHlg7asPNsSSEf
         FyZrlbsYBLhQDB4+740qg7c6nRFUCIfc1NOwHIkWu3wcC2ZYjjosDKa8hyeDo5ik/xVP
         0uPrnh0heF4b0LsHgCHoMiquw+T4DER6mP4SiVlpNnwo901GpkwCTjF3smCUyG2VIlgu
         8oz8/9qymNAls4W6MFgRqAjsCcVilnKiQYdbTGkaP8ckkU1/R4iW8yok2OH+UvW/f8eL
         MbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vrtv6u3aJT3EQ+meoTWMAeWYQ6JNyE7BY99lhxjfLwQ=;
        b=K94CSAOX5RgjmfSiYonCnXYIcV/gFZrBLfKP9/MdfGroOADPNFHOHUYJiw3Eo3M2Xw
         nsVpbjl6bC+laaBdhQDWDDUHlcPMs1n2sguJ+Tob1l89eHJLRhT+kT3vi9g4HH1PMazz
         q6HxvQCfGffZMaRJjJxcbJerhKaaXqYUr8USJfUt1JYHLptx5KTx5mSvogeYXRmJLj0K
         RJQnWZo2Qsc2/kAWBG0BoRZglFOIAWN7hbxzt7o/It6IWEKd991VCbguqOqqRhA1Uoxv
         ItepG5EKJJ/KO63O0d60980wFLgwmmHRVgE16tJfOBGH2v1Pelok3zy0Np3QmzHsBIot
         itZA==
X-Gm-Message-State: ANoB5plQmcexxSE5M4tL8a3hZOi6EoVrZ/uTLNpST47VYEul9SxktRNB
	CsQQ4HBmvPznMiTfsXetFgl1If5tnv9yK9xNshU=
X-Google-Smtp-Source: AA0mqf6vCQELMQYPlCzCNYdbykvgvJpyQGaXz5wcVnCPipO6IKSO95csibhPjEcbbfEIbJd2KMjUOQ==
X-Received: by 2002:a63:602:0:b0:439:ac9b:34ee with SMTP id 2-20020a630602000000b00439ac9b34eemr11993330pgg.437.1668892562558;
        Sat, 19 Nov 2022 13:16:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 21/35] oeqa/runtime/dnf: rewrite test_dnf_installroot_usrmerge
Date: Sat, 19 Nov 2022 11:15:00 -1000
Message-Id: <6f5e10d682be54a70456c4cea9abbde4add1fead.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173561

From: Ross Burton <ross.burton@arm.com>

This test doesn't get exercised on the autobuilder and so it was broken:
specifically some of the ln commands silently fail and the chroot isn't
usable.

Rewrite the test case to correctly construct a chroot so the test can
pass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb6ebb9956a42df3ed8681aec9aedf340b12f934)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 32 +++++++++++-------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 410d456bdf..3ccb18ce83 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -147,29 +147,21 @@ class DnfRepoTest(DnfTest):
         rootpath = '/home/root/chroot/test'
         #Copy necessary files to avoid errors with not yet installed tools on
         #installroot directory.
-        self.target.run('mkdir -p %s/etc' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, rootpath), 1500)
-        self.target.run('ln -sf -r %s/usr/bin %s/bin'  % (rootpath, rootpath), 1500)
-        self.target.run('ln -sf -r %s/usr/sbin %s/sbin'  % (rootpath, rootpath), 1500)
-        self.target.run('mkdir -p %s/dev' % rootpath, 1500)
+        self.target.run('mkdir -p %s/etc' % rootpath)
+        self.target.run('mkdir -p %s/usr/bin %s/usr/sbin' % (rootpath, rootpath))
+        self.target.run('ln -sf usr/bin %s/bin'  % (rootpath))
+        self.target.run('ln -sf usr/sbin %s/sbin'  % (rootpath))
+        self.target.run('mkdir -p %s/dev' % rootpath)
         #Handle different architectures lib dirs
-        self.target.run('mkdir -p %s/usr/lib' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/libx32' % rootpath, 1500)
-        self.target.run('mkdir -p %s/usr/lib64' % rootpath, 1500)
-        self.target.run('cp /lib/libtinfo.so.5 %s/usr/lib' % rootpath, 1500)
-        self.target.run('cp /libx32/libtinfo.so.5 %s/usr/libx32' % rootpath, 1500)
-        self.target.run('cp /lib64/libtinfo.so.5 %s/usr/lib64' % rootpath, 1500)
-        self.target.run('ln -sf -r %s/lib %s/usr/lib' % (rootpath,rootpath), 1500)
-        self.target.run('ln -sf -r %s/libx32 %s/usr/libx32' % (rootpath,rootpath), 1500)
-        self.target.run('ln -sf -r %s/lib64 %s/usr/lib64' % (rootpath,rootpath), 1500)
-        self.target.run('cp -r /etc/rpm %s/etc' % rootpath, 1500)
-        self.target.run('cp -r /etc/dnf %s/etc' % rootpath, 1500)
-        self.target.run('cp /bin/sh %s/bin' % rootpath, 1500)
-        self.target.run('mount -o bind /dev %s/dev/' % rootpath, 1500)
+        self.target.run("for l in /lib*; do mkdir -p %s/usr/$l; ln -s usr/$l %s/$l; done" % (rootpath, rootpath))
+        self.target.run('cp -r /etc/rpm %s/etc' % rootpath)
+        self.target.run('cp -r /etc/dnf %s/etc' % rootpath)
+        self.target.run('cp /bin/busybox %s/bin/sh' % rootpath)
+        self.target.run('mount -o bind /dev %s/dev/' % rootpath)
         self.dnf_with_repo('install --installroot=%s -v -y --rpmverbosity=debug busybox' % rootpath)
-        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath, 1500)
+        status, output = self.target.run('test -e %s/var/cache/dnf' % rootpath)
         self.assertEqual(0, status, output)
-        status, output = self.target.run('test -e %s/bin/busybox' % rootpath, 1500)
+        status, output = self.target.run('test -e %s/bin/busybox' % rootpath)
         self.assertEqual(0, status, output)
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
-- 
2.25.1


