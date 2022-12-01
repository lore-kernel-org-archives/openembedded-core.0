Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634ECC4708D
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:23:52 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.44637.1669904623560068754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jLIE+Cgg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id k5so1986856pjo.5
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wyrd2370KTzoDTIBjFdFpMgOozafrUjJVKH49sIkdBc=;
        b=jLIE+CggbHZYxcRdSRGa9j1WQiUdoC/0DMpLXO/V5ZrZGEni8nqdYE8f48Bwntlcww
         eW6zjdVHUcUWVwhR+5l/zyf1sXm5C88R52nCfeQEKHzLeef+SpTfkoDn63526QdD7IfZ
         W0ZJNNR5A97BwMAw93HrZe9wOdGhmFiHbyWUWW32gPPHDPkszEcFBqgIBXaGpSnUq82l
         9HXBB0RSbs0blEmQCgMJuIZymH3r0424VI9yVHWAQO21gCW4CtsCezpfHXyKxgjiuauX
         xsIlM/yGTD+yWy+aQZqaPRrODfu17d84m8xLaF9pClne+Gm4+XuPmMOnhmSg5CW8CQjJ
         PfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wyrd2370KTzoDTIBjFdFpMgOozafrUjJVKH49sIkdBc=;
        b=t/TuuDwGzpSvxj1ORE14q27kqySZ872Du5Yt4bAVlPBAnWOuIQQNZ0IodMtdd0Pdao
         dxFNrpHynAHGGPv590+P4hjRYf61kaNxZcD8/H48w2is3hRX2d87pUAjQUIfTr6mLCOo
         tZ11Z/vb2i4+nwcJGn+Wg4z9NEF0bSIkRPVi/kmtw3KvjghOAaOsjdUqY1Q1T60l5/+s
         egM5Uuy8POEdJrzpI3sMf1DzKJEOijEejcDfn10TFQYxaJ8uMB5CJ+EFyo4PDL7gn/4G
         n1LhmpUMChPREpJJzJkzyH+PlalsScAt8Bt/0NIP5y0y6La3EUr5bJiLfA2moWm2i0Is
         UVCQ==
X-Gm-Message-State: ANoB5pk8NccdvDgIIsQGVkEsxO/V4MVWFKF5mdC1DdnU7hoznSoZhPxe
	oq5/vHPrexUCM7mhV806huLkBkdVuWoLuIdmgco=
X-Google-Smtp-Source: AA0mqf48g4I20UBvIUtMADYrmN5E8yxzOgKHqJm71R0iSP1CJocM7ILGEyCB6+jlH/Sgtcgw7TUTZg==
X-Received: by 2002:a17:902:9889:b0:182:e9dd:936d with SMTP id s9-20020a170902988900b00182e9dd936dmr49048239plp.6.1669904626461;
        Thu, 01 Dec 2022 06:23:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm3300615pfp.1.2022.12.01.06.23.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:23:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/22] sstatesig: emit more helpful error message when not finding sstate manifest
Date: Thu,  1 Dec 2022 04:22:49 -1000
Message-Id: <18f1a5554063b0cecd206abed6e57f397f7d1346.1669904433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904433.git.steve@sakoman.com>
References: <cover.1669904433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174082

From: Enrico Jörns <ejo@pengutronix.de>

Since oe-core commit 64b89f3c8fc31842256c482a3039d90d3f12c1cc
("sstatesig.py: make it fatal error when sstate manifest isn't found")
errors like:

| Manifest [..]/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-dbus.populate_sysroot not found in imx8mm_dummy cortexa53-mx8mm cortexa53 armv8a-crc armv8a aarch64 allarch x86_64_x86_64-nativesdk (variant '')?

are fatal now and cannot be ignored but must be debugged.

Unfortunately, the currently emitted error message is a bit imprecise
with telling the reader what has actually gone wrong.

This commit:

* adds the word 'sstate' to the error message to clarify the scope we
  are dealing with ('sstate manifests', since there are other manifests,
  too)
* does not randomly print the last manifest file searched for as THE
  manifest file that could not be found
  Instead, we print the name of the task the sstate was searched for
* adds the word 'multilib' to variant to make clear which variant we are
  talking about
* adds a separate line noting the searched pkgarchs and adds explicitly
  mentions this word ('pkgarchs')
* prints a list of ALL manifest file locations attempted
* removes the '?' at the end of the message since such errors indeed
  leave the question of what is the cause but the error message itself
  is more like a statement.

The result for the exact same issue as noted above then looks as
follows:

| The sstate manifest for task 'dbus:populate_sysroot' (multilib variant '') could not be found.
| The pkgarchs considered were: imx8mm_dummy, cortexa53-mx8mm, cortexa53, armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
| But none of these manifests exists:
|     [..]/tmp/sstate-control/manifest-imx8mm_dummy-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-cortexa53-mx8mm-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-cortexa53-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-armv8a-crc-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-armv8a-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-aarch64-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-allarch-dbus.populate_sysroot
|     [..]/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-dbus.populate_sysroot

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 735ec126ec219c7cb89cb05b0e433201bb7f59eb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/sstatesig.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index aa273df970..bf48aed7e1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -469,11 +469,15 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
         pkgarchs.append('allarch')
         pkgarchs.append('${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}')
 
+    searched_manifests = []
+
     for pkgarch in pkgarchs:
         manifest = d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" % (pkgarch, taskdata, taskname))
         if os.path.exists(manifest):
             return manifest, d2
-    bb.fatal("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
+        searched_manifests.append(manifest)
+    bb.fatal("The sstate manifest for task '%s:%s' (multilib variant '%s') could not be found.\nThe pkgarchs considered were: %s.\nBut none of these manifests exists:\n    %s"
+            % (taskdata, taskname, variant, d2.expand(", ".join(pkgarchs)),"\n    ".join(searched_manifests)))
     return None, d2
 
 def OEOuthashBasic(path, sigfile, task, d):
-- 
2.25.1


