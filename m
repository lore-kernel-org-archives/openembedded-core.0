Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799E4CD98DC
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71828.1781274414992030957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kBww+t7E;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45efa80e0afso829410f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274413; x=1781879213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F3wAFRo1SRqGcgUgCGz/wqTdLaoF3jUY4SrXQdOc/Q=;
        b=kBww+t7E5zuPtXfzQHQDc28pHNwfP9BdQ0y3QrheQvceqKenri6zUg2dyExvh8sY/4
         Za6ubRJAYsc9H92+9OVjghUgu4LXlZV7BxmpkQ8HxJowuf0E0VEodfvTVSomv4IH7CrF
         LnUqgbSM3qtgdFu66ERk10HOZmp5s9cboVwPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274413; x=1781879213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F3wAFRo1SRqGcgUgCGz/wqTdLaoF3jUY4SrXQdOc/Q=;
        b=r84BVevsEY+/lf0IlU2QVucSpZWnx/urIRx95KiqSCI042VEoZtbbIv/sv/VmiU83N
         aohpTxdO/vtxSFZEZhoan+9poEgkOTyuYc1tftCwJBxTw1fxbdUdTY9s8umlIj1nMeS9
         DeFJWjJA/sCQITVl7yjEfXD/HR0f7TYVwDyToM4hqkxywVWiNeLCnDERAYXziksS3x+W
         fT/KG+eNNd+BJ3aVIG4nHqMzThVEfsJf48hV2gIiVDd2sG48OAF6djcACcnm9WR9XYAY
         NRUhNBjoOqrNjTgfBDyMpOKq+te24DEB+rZKaf217aEK9ZCJxXkDIPcb6U2iqCL33Iec
         wEOQ==
X-Gm-Message-State: AOJu0YxFhR7laQC8fHt3JWDkl797Sg2mLC+vVYpwl3FSehCqMlF2802+
	rqBwrH4QGfSxQUhueqWzCNjIoSie6gdoQgZled95xSJ7vGwdCWUfnaEdq8uvDxcIAMgTAajkM2h
	+1EdwRA==
X-Gm-Gg: Acq92OEke3gkQZeYel9nc7alIvtAQbP8hzFtgDkNKMB1NX+h0CAmtgmfD8M2UlNbs92
	k2r7oJh55Q8OB/XulPGfDagD9jZxi8+8+hAeQ7nLioWRxCV7tC1PDBo1DLAMLhH9xQUjOQLBArx
	hgm5q0VrXVDP6o2lEeBtbcSqlxgCKJ9lJyo/l9LeUgGj9POKMNCcChIbTVyCzSeOqiwSRQ3BRkz
	8A0+yJ+85Ncku248aC7fkQraK1f3tirLfnZ5k5JzQ3WhdzcA6ZTgki7V53OGiqktMtvS2xi0wdn
	pg9X9OSKOqbNmp9ZmFoKxANhPKDelyaRByzSfQ+fqgVg7g/HDcfzOF5iZjUkKn31D9sWt5Abiw0
	3Vi9N0Tnks+IR0Smw4CVw9vXtnoxgE0IkV131IHLePlBcfnDIhUr+m8az6QQVCuvGvLZ96DmotO
	z+yskY/gwWu0D/wtoQUQuwgaU=
X-Received: by 2002:a5d:5f85:0:b0:43b:5097:6f62 with SMTP id ffacd0b85a97d-4606dbf1645mr4868029f8f.36.1781274413145;
        Fri, 12 Jun 2026 07:26:53 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:52 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 21/21] meta/lib/oe/package.py: fix path to kernel sources in save_debugsources_info
Date: Fri, 12 Jun 2026 16:26:11 +0200
Message-ID: <5e138a5cfb868b2b545161cb2cc706ccde307512.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238643

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

This is no more than a backport of the current (i.e., from 'master')
version of this same chunk in save_debugsources_info(), where BP is used
instead of PF to form the path to the kernel sources.

This replacement in package.py is followed by a similar change in
meta/classes/create-spdx-2.2.bbclass, so that 'BP' is also used in
spdx_get_src() and we don't face any regressions in SPDX v2.2. As a
matter of fact, SPDX3 also uses 'BP' in get_patched_src() (from
spdx_common.py).

Overall, this backport ensures a coherence between Scarthgap and master,
namely regarding the how the kernel sources are provided by package.py
and consumed by SPDX v2.2 and 3.0.

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 meta/lib/oe/package.py               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 037193bb4b..61bad66ae0 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -933,7 +933,7 @@ def spdx_get_src(d):
             share_src = d.getVar('WORKDIR')
             d.setVar('WORKDIR', spdx_workdir)
             d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
-            src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
+            src_dir = spdx_workdir + "/" + d.getVar('BP')
             bb.utils.mkdirhier(src_dir)
             if bb.data.inherits_class('kernel',d):
                 share_src = d.getVar('STAGING_KERNEL_DIR')
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index ba0d326781..fc5185ced4 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1055,13 +1055,13 @@ def save_debugsources_info(debugsrcdir, sources_raw, d):
         # we format the sources as expected by spdx by replacing /usr/src/kernel/
         # into BP/
         kernel_src = d.getVar('KERNEL_SRC_PATH')
-        pf = d.getVar('PF')
+        bp = d.getVar('BP')
         sources_dict = {}
         for file, src_files in sources_raw:
             file_clean = file.replace(f"{workdir}/package/","")
             sources_clean = [
                 src.replace(f"{debugsrcdir}/{pn}/", "")
-                if not kernel_src else src.replace(f"{kernel_src}/", f"{pf}/")
+                if not kernel_src else src.replace(f"{kernel_src}/", f"{bp}/")
                 for src in src_files
                 if not any(keyword in src for keyword in ("<internal>", "<built-in>")) and not src.endswith("/")
             ]
-- 
2.53.0


