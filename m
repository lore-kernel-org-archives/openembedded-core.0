Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C466C0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:44 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.51802.1661624798408283960
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Pu2k0NLG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id r22so4224286pgm.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=JIAE0y3z8UFGsxW/Wznxz4atkGhpCy6lk4sjszs69aw=;
        b=Pu2k0NLGZ5/+9P4Kohxw5GUQhwnGJlsUnlSTaIEBd79EE+Vi1IWrSW/bPuxsV4FnWE
         eHODqATBrZr7VbuqV6THTWMsL72S1HsXq2ThBv2/MSXgqGnhYDaiKVsUeCdGjsciWqbC
         jqK2GxZLqHj7GtRoxV2QEMrqUnAawijpA0GUpke6YcxE+reK4tyFtMr5aS0tiR5I+42T
         M4wO5zd+jnRBOGzFruNOS6N3s27AY5N5dWrK48IvqYe/sdwaiIVkIRmeWZSFQYzxWnRI
         XG7P+4geERVL3Hid6ObMCYWPWRTODE4xP606tVzj9YDQkOoJF05m6zZ0U92VKtRsRqGG
         LbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=JIAE0y3z8UFGsxW/Wznxz4atkGhpCy6lk4sjszs69aw=;
        b=d3iv64MlcL0OAFE08N1aTf5TvcLRmgPhz6OJhIND4eNo0SZQqKLAWsfSuXkR3DS2I/
         mSQoTGNT0TyVbtHfCa/iRx3vymrBu31zikBPVjZXalDWZXHBy8Xaph1gJl/cTRfhXGLQ
         ycAOP5pqEUNLWl+4l/Jqx+uRscVMqgCDVVZUt0vgyc0tl2nMoxQj55SwR/aUYfytm0Ty
         xrxomTL6ZEDLtYTkzCg1UdZ/ohjPryqiSNccP5hMyx75RCL0hnS23dE/iMBUA5d6VN84
         4QsJfZyUZJPwVPsT0NNAg6nnEtDzNajzFrT6WrDEJxbwvoPdbezoGZrMksGm/Xko9h7U
         GSJg==
X-Gm-Message-State: ACgBeo3Eo+rKV3VdO+IfFB0721CN3SZJdhK+7ntOsvfNBrRz/lQgdQT6
	hvAn1NJ9XHZoPF/z8RJYIzR0EFPtkDKbSWAQ
X-Google-Smtp-Source: 
 AA6agR4iBwu5XnEDbF3G5XRr+IG+Knku+qP/mlfVO7itDeFByUcGx20Y03AxawJIFgeSXLBn1w5gPA==
X-Received: by 2002:aa7:8653:0:b0:52d:6fc3:1e41 with SMTP id
 a19-20020aa78653000000b0052d6fc31e41mr9429445pfo.13.1661624797328;
        Sat, 27 Aug 2022 11:26:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/24] package_rpm: Do not replace square
 brackets in %files
Date: Sat, 27 Aug 2022 08:25:40 -1000
Message-Id: 
 <29570dd3333ade04b020fc5813276aad32d26dfb.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169957

From: Pavel Zhukov <pavel@zhukoff.net>

This reverts commit f95adb749619e70920c6cc6cd01c6d02cd348fd8.
At some point RPM stopped treating "[]?" characters in quoted text as a glob
This causes rpmbuild error [1] in oe-core if package contains filenames
with such characters [Yocto #13746]. Reverting commit which replaces "[]" with "?"
fixes the issue.
It should be safe now becuase rpm tries to use filename directly if not
found by glob [2].

[1]
| error: File not found: /mnt/builds/yocto/build/build/tmp/work/core2-64-poky-linux/testrpm/0.0.1-r0/package/42 All-Time Classics (E) ?v1.1?.cht
|     File not found: /mnt/builds/yocto/build/build/tmp/work/core2-64-poky-linux/testrpm/0.0.1-r0/package/42 All-Time Classics (E) ?v1.1?.cht
|

[2] https://github.com/rpm-software-management/rpm/commit/c16c70cbd6b31cd93541d5c22d23ba98d212ad3d

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9916212b4810280108107d94cd2c0cd3e07ae6ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package_rpm.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e9ff1f7e65..bbbef3793f 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -193,8 +193,6 @@ python write_specfile () {
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
             path = path.replace("%", "%%%%%%%%")
-            path = path.replace("[", "?")
-            path = path.replace("]", "?")
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
@@ -214,8 +212,6 @@ python write_specfile () {
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
                     dir = dir.replace("%", "%%%%%%%%")
-                    dir = dir.replace("[", "?")
-                    dir = dir.replace("]", "?")
                     # All packages own the directories their files are in...
                     target.append('%dir "' + path + '/' + dir + '"')
             else:
@@ -230,8 +226,6 @@ python write_specfile () {
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
                 file = file.replace("%", "%%%%%%%%")
-                file = file.replace("[", "?")
-                file = file.replace("]", "?")
                 if conffiles.count(path + '/' + file):
                     target.append('%config "' + path + '/' + file + '"')
                 else:
-- 
2.25.1


