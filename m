Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB44C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:28:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.44940.1669904889070158994
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cFr8IETd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id y4so1803646plb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4iAb9RzJjivxQAz+bpDbiGIqE2zFbAK3qkIU89jR3c=;
        b=cFr8IETdp4oxG6ztKJ6jyxVSeq8P6UaZVzrqafmMoBW9D/j2D7tcgVPvtU1NkMvsdC
         RhfH27LoX39HawEpg3ry11xomz1nuxWK1ksE76iOkjq/9L6sWK8iHMwPeOpwTHPXfcRl
         pYGwRw0GTWXKse+e3ga6DY+rLLR6/1ebCcuanM6JmY4IepMve4qSpYZlTO3U6WFdr8OO
         TmSwaj8Xt+ydvgZ68hakI3Sc86RQp0wy5Qx6aN6+8dgjUQh/hbg/rcOxfpCX3hYQTpRM
         T4OPWlJhhWy6eOfXtlsZLMTipZZQLNuNgb0XXEM0sbkdSBhwcmgqwTO6nEdbbcK2H7tU
         QyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4iAb9RzJjivxQAz+bpDbiGIqE2zFbAK3qkIU89jR3c=;
        b=zObduNKWautxOvaq3ngS37NMBKcvkP33buECbdCADHxXujHnsew6RWOsQqMr+kj1IO
         HIwEzGBQ60m5gopWbCa8n0yBbqAjt8Xgp1HFLs2Mnpw9kV2/0EWILB8f4OJrMFQZAkQ8
         ybowKXActdBVSs4AvlCi0yj/Gtu9vqS6iWVzB3iTuSIf+I5rrlLco0+RpfyXXFubd0FR
         FubjyhQg302JyYU8S2L2OVeaN9tw89kVeBa2EwKA0QhLv9ZLeH72K7jxTJv5J9jZJuf/
         mhI2dJtPDgZ25eGy62KXRXYmHMmAZTdjgvar98OCnoiySRD67SBo8kkxKCXKIwHQBCPR
         uqIg==
X-Gm-Message-State: ANoB5pn66Ipt9bYdQYNzeYDuBQB9fmPGOy0yoQtKb2tOZv2367Wm9S+O
	5G1rmliJA1U/DGP+s8f+E3wN6sVnobsuhIlzW9s=
X-Google-Smtp-Source: AA0mqf6GdhUzNw2Js7CgHCuR93Mj1g3bPxYS4It0tAP4K/nJBUXoGUAhoieOG+/VoCpN5RdrhozWFQ==
X-Received: by 2002:a17:90a:1090:b0:212:f52e:55c9 with SMTP id c16-20020a17090a109000b00212f52e55c9mr75822239pja.56.1669904888110;
        Thu, 01 Dec 2022 06:28:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.28.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:28:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/23] sstatesig: emit more helpful error message when not finding sstate manifest
Date: Thu,  1 Dec 2022 04:27:14 -1000
Message-Id: <cb4ad96a5d71c0a7e7a24fe12f12c2fbe06ae119.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174106

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
index f5a77bea27..bbe28efa81 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -467,11 +467,15 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
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


