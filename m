Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01675C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 14:22:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.50409.1740061355183765201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 06:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=271v2WGw;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: alexis.cellier@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f2f391864so569460f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 06:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1740061353; x=1740666153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHmwQnEDuk+rfZdU58QQISPBgC4j64e9enP/Og3ta0w=;
        b=271v2WGw8qMVQO257GWK8qgVWlqj5S8bHBrZzCMJA0HK37JSjLgSod2w+C+tai+A9n
         N42DQLR7eugzp7nSoKZ+PfXmAJzhOfCQs4Gag4R0EzDL6xupHUqtRzfTMMkDcUiyf21S
         4H3WZEnU2o/kS0QNPl3bXeP9XO5YERPKHTDHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061353; x=1740666153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHmwQnEDuk+rfZdU58QQISPBgC4j64e9enP/Og3ta0w=;
        b=WUXiIfmEG/Z5DpvjLzZXN1D4LMp8QJ4jbe6rr3CS6BOSCti/7i1Sx1sIs0EOLIr4zP
         aiSLYjui9+yXr4bvWvFJ1a55dNKE+w0Th1Y0O1O5Jr3Jk4wiEUrlcDOxBy942Yx1l8Om
         cpe8SY2IEFcY8KHKz3w5ltNM5i7sIB8xGSKqPITiV4F4rJypqnjEPR3cZuXVmH7tGECU
         J6k4tG0U0PtXfthTeYg60dggFxVeHQU+OoinkmEq8K8U/HLJqwmk191/0wUhvJAT0+e5
         3N8XSQR/BGIguQoIua78YRT2bbEICUySseZRHkBvPV/x4BZdsDzwH7VPpbwJP3FgCW+O
         a0zA==
X-Gm-Message-State: AOJu0YyVh+/NZBljb8+Bgskft7YlJCmuNrCMoa8dRu/J4mrFOFXSJ8Ih
	xlqZKrBkaC3VBnOpCRj6H9WD7w8t4XN268Er3/0uSg9SVPnwp/vD40rCvM5RrwSJHcyejLElZkA
	x
X-Gm-Gg: ASbGncu2pDHporwds9832fUqbLzWo/W+CEokvPg9BgA6m8JfCRo4mJEzYMRcD7HjQTP
	/+d+Vimx9ik92YkNp/H9bh4fbhj2bQGJP9hCqRnIT6sGzg7DHlEVdtM0EgQsvxPupqnhXmjf4rz
	iNdbC7WQ4G7ykH9SaVFleobLwbjjyvX4qye5l8zI0rq5QxcV17ndZDfXE/4h7G7IMqgyMwXjd3o
	KtjwJ/+i6IDu4rrGZNkK3Qv3sTi8bC5VMaHsZiHIisxt/PGm1eVCtiRnXu/WPiwUpik/wTb6Jxl
	ZL9D+/MLgIgAHdVCiGCtNwEbG3t+1yeENyvy8kWa6A==
X-Google-Smtp-Source: AGHT+IH0e/l1CwYEGx6AaLIgl2i4833FsjHPiZhtvg47iC3fx4SRnsMmlFuWBSllHlzGYCt8QTELqw==
X-Received: by 2002:a5d:5f4b:0:b0:38f:4e6e:22 with SMTP id ffacd0b85a97d-38f587f3ca4mr8618427f8f.48.1740061353568;
        Thu, 20 Feb 2025 06:22:33 -0800 (PST)
Received: from falke.. (176-147-181-65.abo.bbox.fr. [176.147.181.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm6160651f8f.21.2025.02.20.06.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:22:33 -0800 (PST)
From: Alexis Cellier <alexis.cellier@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexis Cellier <alexis.cellier@smile.fr>
Subject: [PATCH] systemd: Fix man page indices generation
Date: Thu, 20 Feb 2025 15:22:29 +0100
Message-ID: <20250220142229.1373538-1-alexis.cellier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 14:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211759

The dependency on python3-lxml-native was missing, so the generation of
man page indices was skipped (systemd.index and systemd.directives).

Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
---
 meta/recipes-core/systemd/systemd_257.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
index cdf72a5015..66065f28ce 100644
--- a/meta/recipes-core/systemd/systemd_257.3.bb
+++ b/meta/recipes-core/systemd/systemd_257.3.bb
@@ -178,7 +178,7 @@ PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
 PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
 PACKAGECONFIG[lz4] = "-Dlz4=enabled,-Dlz4=disabled,lz4"
 PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
-PACKAGECONFIG[manpages] = "-Dman=enabled,-Dman=disabled,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[manpages] = "-Dman=enabled,-Dman=disabled,python3-lxml-native libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[microhttpd] = "-Dmicrohttpd=enabled,-Dmicrohttpd=disabled,libmicrohttpd"
 PACKAGECONFIG[mountfsd] = "-Dmountfsd=true,-Dmountfsd=false"
 PACKAGECONFIG[myhostname] = "-Dnss-myhostname=true,-Dnss-myhostname=false,,libnss-myhostname"
-- 
2.48.1


