Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318EAC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:29 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.7307.1654699228435722956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5Rp+KkhE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id d129so19060170pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IaO/VR/GXKnaMfzMz4L2RpEo74Xmt/57IiMMRW3eUAU=;
        b=5Rp+KkhEMKMXTMbs29TUHG7bN5yistp4d3qDI4rqz2G8sBziykvqLMqm2pbGCscsWb
         7PBBeeDt5smHOXMSqfWJdxQ3fgt/hacPaawucTYlgei5PmNdoMSVVA1iYA+beZvSPQWu
         i8IXdFLFM5FUK9NPOlwbzx3ig09FO1m8EfvBdRzLUy3JQtDEduWNKE8PXzv3D1wwkzLr
         JkerxIhIPEPG6zoelyVwtwwkakStXzscqgU01XJz9jEkvn0/CIBZV/qVGj4udgB/8Cay
         F/r7bKnSPmkty2l96nwrRP6nDPgx9G2MuB5wTLm5H2xxOVIJ4TRkhRcdHdRZJT6E277D
         G3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IaO/VR/GXKnaMfzMz4L2RpEo74Xmt/57IiMMRW3eUAU=;
        b=A/4krLm53xvlXEw/2BLkQmmtLSntdFqOB9KiFPvj/MM1SGyf9e/rO2BZBLsllxwXEH
         e/EScWYKqwtf6MFbucRAijxuwibM4Ts63CjBnsuz3uMIsJgey7wJF0QJiMB88ukh6dED
         is9BNZo3wwhnfltcy0vvOHjh//nTCXyia5kqzPCj8SczuIVmhAIzH1HHLDeeLDh3rvut
         6IQQpqG8wDLuu1v1Y97qRgvFtTCXjSxJZV0KkOOtGWZHav5mz8HtLpWXQmu4nGJgcHmT
         EjAAwZjg8eEM8C98R7GD0FORMhnOhB7oP2ZmdHTPxm14DLzkBG+pb7T6fqYchriJ7K78
         ER3w==
X-Gm-Message-State: AOAM533WBf4KGYoiMcbEu2hYUuiiBMZ3aHdOTKDX3YZFcU84kFPidrEo
	iOldx9XxPXRJI363BDiDvZKoWZ8Llu0Yn01K
X-Google-Smtp-Source: 
 ABdhPJx5VLDEo0qYeVRaEYiY59UbayGx1u8IpqUfJaK71RCRt0FrQIngy84VF58m5Pq57txvaiBlsQ==
X-Received: by 2002:aa7:88cb:0:b0:51c:2627:2c03 with SMTP id
 k11-20020aa788cb000000b0051c26272c03mr14018355pff.63.1654699227350;
        Wed, 08 Jun 2022 07:40:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/22] patch.py: make sure that patches/series
 file exists before quilt pop
Date: Wed,  8 Jun 2022 04:39:26 -1000
Message-Id: 
 <5323f0951923f201b0ad8f78aa3f42b8c3c97a17.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166724

From: Martin Jansa <Martin.Jansa@gmail.com>

* Since quilt upgrade to 0.67 some recipes sometimes fail in do_patch with
  errors like:

  ERROR: Applying patch 'GPLv2.patch' on target directory '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/keymaps/1.0-r31'
  CmdError('quilt --quiltrc /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/keymaps/1.0-r31/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout:
  stderr: File series fully applied, ends at patch GPLv2.patch
  ')

* It affects only recipes with S = "${WORKDIR}", which wipe only
  ${S}/patches, because in other cases whole ${S} is wiped when
  do_unpack is re-executed.

* It was originally added in:
  https://git.openembedded.org/openembedded-core/commit/?id=5fe5e6a15f26f23f0c5b863fafad7a0d382a55e2

  since then it was extended to wipe whole ${S} when ${S} != ${WORKDIR} in:
  https://git.openembedded.org/openembedded-core/commit/?id=5fe5e6a15f26f23f0c5b863fafad7a0d382a55e2
  https://git.openembedded.org/openembedded-core/commit/?id=eccae514b71394ffaed8fc45dea7942152a334a1

  this is now causing issues to quilt-0.67 because it checks that
  ${S}/patches/series exists during 'quilt pop -a -f' which we call
  from QuiltTree.Clean to undo patches possibly already applied
  in ${S} in previous do_patch execution.

* There are couple recipes affected by this e.g. keymaps (.patch already
  removed in oe-core), makedevs (.patch removal sent to ML yesterday
  https://lists.openembedded.org/g/openembedded-core/message/166172),
  devmem2
  (https://lists.openembedded.org/g/openembedded-devel/message/97270), but
  there are other recipes with S = "${WORKDIR}" where you can trigger this
  e.g. by having a .patch file in DISTRO layer .bbappend (e.g. tzdata with
  webOS
  https://github.com/webosose/meta-webosose/blob/06e5298d9f5c47679b679081d9930f8d1c776142/meta-webos/recipes-extended/tzdata/tzdata.bbappend#L10)

  This do_patch issue is caused by:
  https://git.savannah.nongnu.org/cgit/quilt.git/commit/?id=8b39a960afcf45cd4f5804ae62b6b0656bdb191d
  introduced in kirkstone with:
  https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=fa71afcee9ab42198c619333b77a15bd2ae02b20

  The shortest sequence to reproduce this is just
  bitbake keymaps -c patch
  bitbake keymaps -c unpack -f
  bitbake keymaps -c patch
  with
  https://git.openembedded.org/openembedded-core/commit/?id=17d981005a0c0c97702ad88602b7181b69bcc9eb
  reverted.

  And the change in quilt behavior is causing QuiltTree.Clean (quilt pop -a -f) in:
  https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/patch.py?id=17d981005a0c0c97702ad88602b7181b69bcc9eb#n601

  to silently fail with "No series file found" before undoing the
  patches in ${S} and then quilt push failing, because all the
  patches are _still_ applied in ${S}.

  Removing ".pc" doesn't help, because we really
  need quilt's help to undo the patches (in this case to delete COPYING
  file from WORKDIR before applying the .patch which tries to add it
  again), because do_unpack cannot just wipe S and start over (because S
  == WORKDIR) - nor selectively removing the files listed in SRC_URI,
  because COPYING file isn't listed there.

  Using skip_series_check in 'quilt pop' (partially reverting the change
  from upstream) does fix this as well and it's simple one line patch
  (just adding skip_series_check=1 in pop.in), but might be difficult
  to upstream, because it's this strange OE specific behavior that we
  remove 'patches' directory and then still need quilt pop to work.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9d36882044b1c633d8611a77df54cd68c9bee25)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 9034fcae03..95b915a6ab 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -598,6 +598,8 @@ class QuiltTree(PatchSet):
 
     def Clean(self):
         try:
+            # make sure that patches/series file exists before quilt pop to keep quilt-0.67 happy
+            open(os.path.join(self.dir, "patches","series"), 'a').close()
             self._runcmd(["pop", "-a", "-f"])
             oe.path.remove(os.path.join(self.dir, "patches","series"))
         except Exception:
-- 
2.25.1


