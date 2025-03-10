Return-Path: <sofiane.hamam@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA991C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:11:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.33137.1741597888650862512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WU9eqsV7;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3690270f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741597887; x=1742202687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpZ9r8gV5FH4Z2i2ZOReMJHu1fWbbI3YqkULzGh+KNg=;
        b=WU9eqsV71mFm/tfH9RRAUAV18krNScQAt6idx10fJPMfLwRIy8cefkn/kaE5ACJoRc
         KgaYtl2QSjhPWFTxHSbSwDBu50GAE++KGQckxafQWL7nVYf24RQTSX0e4AsAtnJCQJXo
         h+w770sMkK+sQxogI4IAy47PMW9n9UGLcIClk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597887; x=1742202687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpZ9r8gV5FH4Z2i2ZOReMJHu1fWbbI3YqkULzGh+KNg=;
        b=wWxn47Du0+MeB91axkAi6pcl4bYU9eAzCesn3twwq3d1HesWibYxeV6YFq4U3nHKDU
         +6HXXmoyFs5DAvNpSVAZ4O/KwCr2x7/raZRo4BA/92lh4GI3ii1CBnSFg8NBZOiMnXCS
         5F7C8qFnPzROnTJbm3JFNyZ0PeMXte7JbSyNSw+9viHM48WnpGE5FxZWJGgS+9GoTDMS
         G/nK1L7SdI/ryTWBAxGQj1xuSq59XnDvMIkdmwDCfzdbRhlcKIgSNspMMD5BAtetG3uB
         xMFndmlsmIQiXDxVoq3Agf0Q96mcIzRVxiUihsKpNdHZqwcb7Tj1lEemC5wiNTq9zRbh
         l5pw==
X-Gm-Message-State: AOJu0YwIOx51qoDHF8hEPSfDqV7aw/oJX8maPErBnoLoPwEzhryxIva5
	OO75apTtySvSGDHrANMhu9Y2GlxUviSBdj4nClSQ8+at3Gta/a4wl8F5CzIfaiV4iaA8cmhFSZO
	t
X-Gm-Gg: ASbGnct3eK/n9usMb31OX900qzrNUs/ZA2pOwT9bNT5aCqAh/zA7qU0G2Bh3dbsQjNu
	/P1Ytjpq4AevyaND4ccZ6COWmgttnmCsMFYFtDd7tFcsQxZHo8nLXdaMNtUrnu4pl3oJJ114zVj
	4l6DQR9Fr4m23nvpTSeRkfk5+IKzfkRXQOcWddwIQfO6rUwDTRpDgyZPw5gW/+c0+CSx3wkD165
	Xby9sYP+dPnONfGeQ7rQrxeCzVotpg4AL2HChB0VRS4jowZ+/ofYz0UW/yhtsG9vGL2/iz2J5qR
	0mE890V0HnO9z87Pk5tV4HpiOoHY1CKr1RgGgZZOWFQCTHG84OryzZotuOKju/+ciOHgJBxvPu6
	91DHDR7MQGHfPuF/7lwhMUUHxSAqjTyW1aQ0biRV30qVb9es7JkTSJA==
X-Google-Smtp-Source: AGHT+IH62H+eBZSAOdroD939oa3NbHtqi6FEOMjMY/VFnbwWvx0Nrqf+eftLgFXeV0otd0wzUUe3ew==
X-Received: by 2002:a05:6000:1a86:b0:391:4f9:a048 with SMTP id ffacd0b85a97d-39132d095e2mr8349335f8f.4.1741597886926;
        Mon, 10 Mar 2025 02:11:26 -0700 (PDT)
Received: from FRSMI25-BPYTOP.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfbaa94sm14324107f8f.14.2025.03.10.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:11:26 -0700 (PDT)
From: Sofiane HAMAM <sofiane.hamam@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>
Subject: [PATCH] patchtest: Fix minor README typo
Date: Mon, 10 Mar 2025 10:10:40 +0100
Message-ID: <20250310091040.2986006-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212494

Fix minor typo in patchtest.README.

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 scripts/patchtest.README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/patchtest.README b/scripts/patchtest.README
index 816406ff54..3c1ee1af1d 100644
--- a/scripts/patchtest.README
+++ b/scripts/patchtest.README
@@ -69,7 +69,7 @@ the target project, but these parameters can be configured using the `--limit`,
 To run patchtest on the host, do the following:
 
 1. In openembedded-core/poky, do `source oe-init-build-env`
-2. Generate patch files from the target repository by doing `git-format patch -N`,
+2. Generate patch files from the target repository by doing `git format-patch -N`,
    where N is the number of patches starting at HEAD, or by using git-pw
    or patchtest-get-series
 3. Run patchtest on a patch file by doing the following:

