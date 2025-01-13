Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA23E7719E
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 11:16:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.12482.1736755895905830903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 00:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytedance.com header.s=google header.b=WuTivib6;
 spf=pass (domain: bytedance.com, ip: 209.85.214.174, mailfrom: yulei.sh@bytedance.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21619108a6bso66577035ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 00:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736755894; x=1737360694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Luh8bOp3xGh3BclDqPWsTvHiQfCvGpb4yikdojdqazc=;
        b=WuTivib6P0qsRqcjUl+9WU6eo7xM9hm0KaIGYeR7j3Fk3NUq5ofPpH2Q5Z2kfc7KBj
         Nnsu+mysH4l9bDMmsOO8txmLfNTsHrNvJZ1nXh/TN5aMuL4JjkaXA506/WZX6Y6a7mmC
         h7rtNowBlCqP0aAewLg3lf6SBDiZdKBkp9OJwEqktsqb2LspIMwLhMv9jbr1Oq45+/l2
         iodkcZ5sI5PiHGLL7vIwrRHhesQonsQaTA+YbTAS9NkToS4Zxx1ZJ/cKptZqbhwNjDvf
         /DlhzjjTdYlLZcPUncx/aqVv+5h90lVG/xZugpX2/7eR/d8sRaCCxAsGFoyxFzwNvB0o
         WXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736755894; x=1737360694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Luh8bOp3xGh3BclDqPWsTvHiQfCvGpb4yikdojdqazc=;
        b=YI//LMclDYT+zENpUX+qNJDoerkKnOmLOimfA5V8y0puYEK0Ou3BdDvYnE+Mk9gw2H
         hRsOFJgRzgu5o84P0UigtL1bykauMUuSC3seesnnbrfrteWPN2nvKmHuK0uioUgINd+i
         uxueI0gXU63aq09ZbIeAB0r3f8XiugPbE3gj/4RIqgoW7WbUHWyWHU8JQgIxAFROvhXY
         SAAsorWRkQcbrphD/bLmZSLV9Z8uGQIFOo/Shxl9Ykc5yP1etB+lds3AaJ71dr2wUA10
         U70sxmaxQ9qQWBOCMNnPfaiiuUoW5RherG2Vf9vYlpEyhKwA/ppo+RzgvZk1//RmAjeQ
         +sCg==
X-Gm-Message-State: AOJu0YyG6zNmmCcfj0wVQHkwYTcdn1oDkNr3D57JEwbIbWADBR27P+g6
	PlLT9suBVsM7ACDelWQ9+gQRZ3/fCqXv0QHK0lyWKMLQhJpWg799bG8F6ixgBoTRQChJnqT56uo
	Oj3g=
X-Gm-Gg: ASbGncu34qnZ4hXyE40brWLb/w1la0wP4m0oTxa+64EXEY8fFbUjVV40fJJu/V1WAJy
	mMlkVOwldOWeoRub7WkkoVK26MaOG/6kX+X5HsVqyAhsaJSNb2ORm2ZJuS7E9pUK+N3Y7JnlGqW
	Ue4Ey+QwUC34Hj2R6giQa9fmj1VOMZMhbeyWcO6g++teyHbrowPe1sbXwBLTK23i7rCf02lhBYw
	gpqnzxoff2V4VXVu9OsT6Cs8ovNLALWw8IKtkb1QBv9FCfuDEN+uFkY24Y=
X-Google-Smtp-Source: AGHT+IFmvKIKzV3Kq/079MrOjUIHPB7XM/EJ+UlGhAf+2/zKYzy7VXozsJEYUpM7zgffspV+dGWlxQ==
X-Received: by 2002:a05:6a21:8906:b0:1e8:a374:ced7 with SMTP id adf61e73a8af0-1e8a374d2c4mr20859424637.23.1736755894579;
        Mon, 13 Jan 2025 00:11:34 -0800 (PST)
Received: from localhost ([106.38.221.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a553csm5283902b3a.158.2025.01.13.00.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:11:34 -0800 (PST)
From: "Lei YU" <yulei.sh@bytedance.com>
To: openembedded-core@lists.openembedded.org
Cc: Lei YU <yulei.sh@bytedance.com>
Subject: [meta-oe][PATCH] systemd: PACKAGECONFIG mountfsd and nsresourced
Date: Mon, 13 Jan 2025 08:11:20 +0000
Message-ID: <20250113081120.3889517-1-yulei.sh@bytedance.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 11:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209709

systemd v256 introduces `mountfsd` and `nsresourced` as meson options,
make them PACKAGECONFIG so recipes could enable or disable the feature
by selecting PACKAGECONFIGs.

Signed-off-by: Lei YU <yulei.sh@bytedance.com>
---
 meta/recipes-core/systemd/systemd_257.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_257.1.bb b/meta/recipes-core/systemd/systemd_257.1.bb
index 8330157fb6..e7dae83957 100644
--- a/meta/recipes-core/systemd/systemd_257.1.bb
+++ b/meta/recipes-core/systemd/systemd_257.1.bb
@@ -179,7 +179,9 @@ PACKAGECONFIG[lz4] = "-Dlz4=enabled,-Dlz4=disabled,lz4"
 PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
 PACKAGECONFIG[manpages] = "-Dman=enabled,-Dman=disabled,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=enabled,-Dmicrohttpd=disabled,libmicrohttpd"
+PACKAGECONFIG[mountfsd] = "-Dmountfsd=true,-Dmountfsd=false"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
+PACKAGECONFIG[nsresourced] = "-Dnsresourced=true,-Dnsresourced=false"
 PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[no-dns-fallback] = "-Ddns-servers="
 PACKAGECONFIG[no-ntp-fallback] = "-Dntp-servers="

