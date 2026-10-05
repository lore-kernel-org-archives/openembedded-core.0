Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A425CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 06:54:22 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14298.1791183257385111840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2026 23:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=owQAb/+J;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1072166f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2026 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183256; x=1791788056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3gccItvNWzO5JNQBdwXVSFGHQoDqY4ZeNMrUIYhewA=;
        b=owQAb/+JIzwEaJp+QK/rVJnJD+oIa5Ca6ZAdguRmlWSErnMujUg3iravtiVhDrCWIP
         Ut4Hfq1pJzAXhP3Fy+knbVe4er3dmQ/Fkpjip3ejGENfM2KqiNQvWZHtQRFb/VDhHxYV
         SESEyOu7aAYcbgoRBdu44ERQaA0kpB5mj4AudQCdGVvuZnPVs9/LRbnOcgVAE1meAw9w
         q3UCuFgrbXwAe3mPu6gZnSXDTGUjwUFXyxTN1FBbKwejrjpWS0aYjign5XaqagjSxc2j
         ukPCO4pm0arBVagGO+714KoSL4ECozB65f13VOxnnC+STpRqcq+U5DFhWhXwOFFtYLoG
         k9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183256; x=1791788056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u3gccItvNWzO5JNQBdwXVSFGHQoDqY4ZeNMrUIYhewA=;
        b=W0eV8zetJd64nZ6dFwNnSDzq7Uyk0425TvzY6tDdm+My+Ysi6kTHPbY5sSSjgQLCyF
         0LT4JNJrZONmUjHoHUFrw9WirJFEkf3F90ZXsstwE/9Bdw0KM4FZ4HYoJUBwM7EFAEtd
         0DHz2/aIMTMr33qfv8Hb5oJ0jI9qK6l+7OAPoWQzRmInVrsfw2y+WZm8uobMTVSrw+8D
         reG2wuTJE7F51qXjKGK/8jDmM1vqysrKtXNQZNtoxTwg0jdbOjxLI94z3/ESLhE75Hq/
         vcRZnMdmNO0DIhVpa2CBpTWU7vAS0IczzZpw48e+KoFCkDRHbpnavxi4Pv82FmYltS4n
         mHYQ==
X-Gm-Message-State: AFq9FYKlsdixR7RZwvf/Yo+sTLny0mE0vAVTOpLcwOIOScmLJKu6M0MN
	/SMzFGGUYV3wHOQjeisBT3U9txIPuqX+aCWVPJG+BQQ4YzAgQlJ+EqAqzExzWw==
X-Gm-Gg: AYBFou3Hpt4LkLg3py2fJJbMK6l+bJ4Ki+E9pNmjlhQOtzNB9RpCgRy8Gyo0GcAMaM/
	ZcwdAGVqq/qInlp6vQv6Bd905rQMpFjwUiGbgOT91ET2PQ1z0bXRQQ2JHEvYz3KshU49mNzTv1U
	xmYcT3lUlSt3QSmRpKKy/xJWo9GCMp5B/YJKojkCSoQR+etPL0pEffoeCj/djR52A/nEpg/v6Kj
	xfTZehxInRFEO5BL0c6njZqi2iuJT1ZPNRMjtLjvL9RqTIxxh46Rt4q7wmRRIVdDTRcJanys9/D
	mnACE2UFwMW/GKogDpuZGkylBxO9zW1dOQM+ALDYBXQ1XZBHaKXu8GTCMHnm2IkFPU/lnjYqosl
	nbDFQb+KkGaOdJK9/5pGtKu7QwN/1pmmGpGUyfrakTIY3d20JZwrm7YnO0cP3OBtpLXs4E5A3DY
	CHXzWQnCtnEATflHInhZJssKo1YgzkENM77bkx4cSpsm4fLwfHuS+08gesAb3crMOpqRfmaa5qp
	cZGZ9bAbEwbvKAmuE6FZI28KDBeNtH9cmdcFPR+EOvpUWVC+dwuiv/lHGVQrT+naoWLGA==
X-Received: by 2002:a5d:64c8:0:b0:488:8232:d16e with SMTP id ffacd0b85a97d-48c47fff875mr11399958f8f.45.1791183255632;
        Sun, 04 Oct 2026 23:54:15 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm1487592f8f.41.2026.10.04.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:54:15 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH 3/3] sstate-cache-management: drop unused functions
Date: Mon,  5 Oct 2026 07:53:25 +0100
Message-ID: <20261005065322.30522-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005065322.30522-2-alex.kiernan@gmail.com>
References: <20261005065322.30522-2-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 06:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247219

find_archs() and find_tasks() were implemented when converting from
sstate-cache-management.sh; neither have ever been used, so drop them.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 scripts/sstate-cache-management.py | 44 ------------------------------
 1 file changed, 44 deletions(-)

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
index c361c3d5a07f..e77f0b0efb60 100755
--- a/scripts/sstate-cache-management.py
+++ b/scripts/sstate-cache-management.py
@@ -63,50 +63,6 @@ class SstateEntry:
         return self.match.group(name)
 
 
-# this is what's in the original script; as far as I can tell, it's an
-# implementation artefact which we don't need?
-def find_archs():
-    # all_archs
-    builder_arch = os.uname().machine
-
-    # FIXME
-    layer_paths = [Path("../..")]
-
-    tune_archs = set()
-    re_tune = re.compile(r'AVAILTUNES .*=.*"(.*)"')
-    for path in layer_paths:
-        for tunefile in [
-            p for p in path.glob("meta*/conf/machine/include/**/*") if p.is_file()
-        ]:
-            with open(tunefile) as f:
-                for line in f:
-                    m = re_tune.match(line)
-                    if m:
-                        tune_archs.update(m.group(1).split())
-
-    # all_machines
-    machine_archs = set()
-    for path in layer_paths:
-        for machine_file in path.glob("meta*/conf/machine/*.conf"):
-            machine_archs.add(machine_file.parts[-1][:-5])
-
-    extra_archs = set()
-    all_archs = (
-        set(
-            arch.replace("-", "_")
-            for arch in machine_archs | tune_archs | set(["allarch", builder_arch])
-        )
-        | extra_archs
-    )
-
-    print(all_archs)
-
-
-# again, not needed?
-def find_tasks():
-    print(set([p.bb_task for p in paths]))
-
-
 def collect_sstate_paths(args):
     def scandir(path, paths):
         # Assume everything is a directory; by not checking we avoid needing an

