Return-Path: <george.refseth@remarkable.no>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2509CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 13:07:41 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7962.1779109659220963003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 06:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@remarkable.no header.s=google header.b=Km43oBSo;
 spf=pass (domain: remarkable.no, ip: 209.85.218.52, mailfrom: george.refseth@remarkable.no)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bccd251d622so394633566b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1779109657; x=1779714457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kBW631x/n/2oir7zA8w/QA83ucXEg64ThtZi6vZrbu4=;
        b=Km43oBSoFPj9imHE0PuJmshzsLMQM0eHppjVyy6CNFo34RLXTHElVH5pZUl5AowQDD
         NQIN1tZOBHEc44AO/kjxPjpOyTJ7BKq5pTlrW6ZlsIOJ2juCKMhCKeDMMfPc91l7h+b8
         pfn3N9u62fmg52oKF3I0qoUx6/IRrUHfbtxkBc62CUw6i4ktpjiT+eZ5WV4kz/Hq/0RR
         TL95AfVSLmA+PTfMCdPjhIFDcZ1NKDEHD/XDyT1/lhPY/Le9cVDhxMKnL7ErjFh5g2iC
         qP3o4ddb8tEP1yWXIZEHoVaRXSrfHxvkPfMqFmGW2h3Jg5qquyQj9RmLJtm0oxEwmOlS
         ibrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109657; x=1779714457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBW631x/n/2oir7zA8w/QA83ucXEg64ThtZi6vZrbu4=;
        b=NMCuH3PNHizycmX1t9Q6okoDSzhRPjvrd4gVR2uL85stZ8Je+IxPYvpvyAXoNbWFHF
         UIRMrwJnIe/a3amDP7YNwqjY8upTANUcXuSuugoCo+8XxGeR8O5OHMlR1uNdzJ5KaGW0
         3yf06/iwezZemBUfn+Gz1Li34d0layLqXTWl0Fo191WqYoYhg0/Om1fgHlDEODL7lKvs
         zRXX4Epk+PHLe8CqbQ7UfYSQc41ixvp6pe1AEXqyEtN8v/eevh9G71RRTjFVOO+6gur/
         I7mQASOLnkOl8CN/lQjNUrfP14whSyIua7hJ2YAs4nZKN78vfpucJaluKOId1p+BWi3N
         nXdw==
X-Gm-Message-State: AOJu0YyxfcfdCRqii9ZpREjK0ogUYY9pE+0UoEtTM578CR+12pP3VKLq
	eAb27C0zUjImmu/C3Ykblg0hzBXak7LRdACalkksQN/gMYzGuA++EWWtKyM69ABEwYchBwJ9hdL
	fVFnTcpTIFw==
X-Gm-Gg: Acq92OEHPzsB4vJL1Xf+mZD699iPo0xliaHb3+HNqCahZzHCAekVRfnTv36L+pPzUcq
	mKgmeyIyzrb/475OWjxVQ7ue3B7BF324WlT/IU098DoipaEWZDd6LxJCAzGnYwPRXbs/McThwpd
	J+bZOLC0zoVOaUNbKMyBI92+svAhxKhz3JZmGZz0UUMWuTxWZh6u9k4kPPrMztlaVXlAzqJCITa
	sBlBomASz0tbNQNFo1qRpJqPKEIvXjQiCiYA4ppdOTiHj2s1WQHrqjCe4cmFrWRYAXOi2UpZZOY
	bC3cGqY+zzZHEo01wMs7+J4kROp8pBceMgsYpHwXxteJ3IQR4JM/4AcyVrkHvZsvv8fATZ47Vsi
	W37q8LGfSJPDfUyptTF1Q3ZOVrQ4kF8q2ZAAzg/i56EbnlQOD3+QLlcbZMXgI+2Es2FKBMF+2CW
	krwnFTF0udAOpm2Kl0Ywc2fQzq4hS2j2DX7XR/prug12pCww==
X-Received: by 2002:a17:907:3c86:b0:bd7:bbae:2169 with SMTP id a640c23a62f3a-bd7bbae68ccmr235292466b.35.1779109657290;
        Mon, 18 May 2026 06:07:37 -0700 (PDT)
Received: from rfz-hpz.prod.rem.lan ([213.52.63.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4dec855sm567633166b.37.2026.05.18.06.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:07:36 -0700 (PDT)
From: george.refseth@remarkable.no
To: openembedded-core@lists.openembedded.org
Cc: George Refseth <george.refseth@remarkable.no>,
	Erik Wierich <erik@riscstar.com>
Subject: [PATCH] cargo_common.bbclass: add subdir argument to git dependency to let cargo find crate
Date: Mon, 18 May 2026 15:07:30 +0200
Message-ID: <20260518130730.1480629-1-george.refseth@remarkable.no>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 13:07:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237244

From: George Refseth <george.refseth@remarkable.no>

When git referenced crate dependency dependens on (root) workspace virtual
manifest, when patching path the path to the folder containing the crate
within the referenced repo need to be added to the patching process.
A subdir argument is added to address this need.

Example usage when repo contains an api crate defining the api for org/repo:
SRC_URI:append = "git://git@github.com/<org>/<repo>.git;name=api;destsuffix=repo-api;subdir=crates/api;type=git-dependency"

Cc: Erik Wierich <erik@riscstar.com>
Signed-off-by: George Refseth <george.refseth@remarkable.no>
---
 meta/classes-recipe/cargo_common.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 0d3edfe4a7..c1fe6a24ed 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -154,6 +154,9 @@ python cargo_common_do_patch_paths() {
                     repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
                 else:
                     repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
+                subdir = ud.parm.get('subdir')
+                if subdir is not None:
+                    destsuffix = os.path.join(destsuffix, subdir)
                 path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
                 patches.setdefault(repo, []).append(path)
 

