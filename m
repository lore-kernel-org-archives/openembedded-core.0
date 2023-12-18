Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A3FC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:58:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.50532.1702922288242530697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DeUOTJ7f;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3d0faf262so4810165ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702922287; x=1703527087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7cEyKnTNOLremY3PD7PKxuxxo6JYQP3ZFhIdLNsO5I=;
        b=DeUOTJ7f5q9kTzhCv2HWgDscogH/4Pbjju985AaOocAkt/MSBnob0+tgcdBWUEhgEA
         yDFA+xO1lOfgJ+Fs7rFMgTX2zcOCGzv20dgzleKtFodOWj8ap8ue+ZyCsPSRFfQ7/GAT
         58fLoG3kSmZCD/PnMQhy/451551FZRnY3MUwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702922287; x=1703527087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7cEyKnTNOLremY3PD7PKxuxxo6JYQP3ZFhIdLNsO5I=;
        b=hlP6EudlkYGGwun+ZV0njj71ThgLUW04qFKL2/jSF8z+xgfZiPdtXmGLgD8iuWEzrC
         V3bgGFbg2naRwCw4BaFiLbzUbpa9mrHop+pZR0CbtTzlURWyMeu/Uu3qoMG6DoDPRMdV
         ZXbOBC/qmVCItJzi/X1QWBDmhMd4IlJ3nqZaeqhHHMxJ1pcVVx4g7wu1+UQRgiTlNgTb
         Eni5nTdpXG9GzAMTQdON3rgNgXkDDmqG3hEEDRodE8poh8ZauST62QiieEoUJmMXTblu
         VM0jldklA1AXftDc7mXCopgs68e98lZxrAiZvkSERAZPnXxHkCNIQjUbpA8X5nHdBJZt
         J6WQ==
X-Gm-Message-State: AOJu0YwaI1XS/XKyB02rbr6b4DjWpoAtb3LF8R8RyEniXAiN5ynOePtN
	rgYKeU7yjTqbzixxaqPB5/Uz5vIreUoxytlvRG4=
X-Google-Smtp-Source: AGHT+IFG4BoxZXnOE2PSw5zBZF+n794FSkRTs51HzC+9Q8BKgjOBwrmn6+pSPsmDx1itbDThbPqRsQ==
X-Received: by 2002:a17:902:64c9:b0:1d3:b342:2a4c with SMTP id y9-20020a17090264c900b001d3b3422a4cmr2509610pli.73.1702922286945;
        Mon, 18 Dec 2023 09:58:06 -0800 (PST)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id r15-20020a170903020f00b001cf5d0e7e05sm19300522plh.109.2023.12.18.09.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:58:05 -0800 (PST)
Received: by brown (sSMTP sendmail emulation); Mon, 18 Dec 2023 09:57:58 -0800
From: jpuhlman@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [PATCH v2] create-spdx-2.2: combine spdx can try to write before dir creation
Date: Mon, 18 Dec 2023 09:57:56 -0800
Message-Id: <20231218175756.3622411-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 17:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192673

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

On occasion a file is attmpeded to be opened prior to the
creation of the spdx_workdir. Create the directory before
the open, just in case.

File: '/build/layers/poky/meta/classes/create-spdx-2.2.bbclass', lineno: 1081, function: combine_spdx
     1077:        )
     1078:
     1079:    image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
     1080:
 *** 1081:    with image_spdx_path.open("wb") as f:
     1082:        doc.to_json(f, sort_keys=True, indent=get_json_indent(d))

Add stringify of value passed as spdx_workdir

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index b0aef80db1..47c2366c7a 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -1075,7 +1075,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
             "%s:%s" % (runtime_ref.externalDocumentId, runtime_doc.SPDXID),
             comment="Runtime dependencies for %s" % name
         )
-
+    bb.utils.mkdirhier(str(spdx_workdir))
     image_spdx_path = spdx_workdir / (rootfs_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
-- 
2.31.1


