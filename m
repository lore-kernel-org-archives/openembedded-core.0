Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86505C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:34:25 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.11908.1642772063665097865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1
 header.b=Y3bLV5/e;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81,
 mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642772063; x=1674308063;
  h=from:to:cc:subject:date:message-id;
  bh=WX1LoWEkVfORnG+YyEtaMlGRQnaiZas7LULmrjSC+IM=;
  b=Y3bLV5/e9wQXeOY+KP6M011JnPRXqFb+YKwKW7HCdfhMTJuIb870cXEI
   vjAlPzqzx7h3wzwVBATbj5/BJoFYHvKheGJGjSdp+H+OwjMw5KNoPTtm0
   e1bNqLwzXCwJkIlNHIJxGQT8p2dDsxYFo+dFKiVpNDXoGPNCZQAaw5uNY
   NBHasjezeRKubCnieWuKq2nJoTj3bSFi+3EV4di9c34KpU9T56wnTi+6O
   eU5FpD3BAq0S4Ce1MvCBpRNeiD38A3gL6Pjzq4By5P6FrB8f/c+dRbDkZ
   sAF4JByczB6D3hXhuwoVOre7/gMb1pwXySri7pIHP86A44Ysb+CJPb4kj
   g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200";
   d="scan'208";a="21641245"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jan 2022 14:34:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 21 Jan 2022 14:34:20 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 21 Jan 2022 14:34:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642772060; x=1674308060;
  h=from:to:cc:subject:date:message-id;
  bh=WX1LoWEkVfORnG+YyEtaMlGRQnaiZas7LULmrjSC+IM=;
  b=qkpk5bqGTM0l2vmcgSMM1c1kSkiXa2EpSCyhDF5T82+dAd4tF46pT+39
   eb1tYDFKqrZ0n5BRI9u0oBAlAp48XxUro9SFvcY1+yrWKyrr6W5cHq4fi
   v/PTK9BHNKflZi6McBaF7Gb3TfgR3ej9jWV+WSeiaAQVq+MQy0BxehZET
   0/lsOqf/sBGtsQb1ib5/UF/KfQGsLQ6ZguLIZjL4HoKxd+u6vS6AAPd2x
   DWw+/1fDQWx3VCqhT0droSjlQkfOVMOc2a8NMNNN7yfRJFnHslm/PjJ8G
   he46ImMRIzq2GpMHjyezzSS0ZZV4cR6voO19F0iKGlSXgXmJuCiL6sfnK
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200";
   d="scan'208";a="21641244"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jan 2022 14:34:20 +0100
Received: from niebel-ws.tq-net.de (unknown [10.123.49.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AAA97280065;
	Fri, 21 Jan 2022 14:34:20 +0100 (CET)
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [meta-oe][PATCH] kmscube: depend on virtual/libgbm
Date: Fri, 21 Jan 2022 14:34:13 +0100
Message-Id: <20220121133414.31021-1-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 13:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160826

From: Markus Niebel <Markus.Niebel@tq-group.com>

when using vendor supplied OpenGL stacks no virtual/libgbm may be
provided. An example for this is the Vivante stack for i.MX6.
To get better error message in such cases, add dependency.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 54993be89e..68cbe8c9fb 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
+DEPENDS = "virtual/libgbm"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-- 
2.17.1


