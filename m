Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F53C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 13:35:14 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web12.11738.1642772111861493672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 05:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=mNjQzv6t;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81,
 mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642772112; x=1674308112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WX1LoWEkVfORnG+YyEtaMlGRQnaiZas7LULmrjSC+IM=;
  b=mNjQzv6tqGnGuEH/EVkhqV05tpbHIWQeCqAKFnsawD96Lr/pvqwUOPU0
   Y/EHdPq2ck965kk2CiTSN9gUmQEEZ7aixR9Z0MdYEDE7T8C0N09nJ+qIF
   /BQAq/9WT69c2j2IAKLJOJJORkdIYQ/hU+DCNCr479IDRpWR+D9hKUv8g
   thVohsQus9+5LnlEvTTkkp4hKniLq5VS8JXitYg9Gsj7l8oUomnXzmy7F
   wQYWL9dVFgKpaiFETOArPD6bam1kAa2LLbPdallRMO8RdbB3eS0GefeV6
   hmUe+YoVPTrew4sVp0uGyWgQUX46GhzAxf/5Uywqk3hQ1Zm1KBLOs8J05
   g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200";
   d="scan'208";a="21641268"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jan 2022 14:35:09 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 21 Jan 2022 14:35:09 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 21 Jan 2022 14:35:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642772109; x=1674308109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WX1LoWEkVfORnG+YyEtaMlGRQnaiZas7LULmrjSC+IM=;
  b=Sw58A1R+iNQuNHgBVEZrFNBeNAvsFq+3E8cyv7aQXJPBEB4BxK/uE/YH
   F5rSrZLNT0YD7fNvJpIE0p0UIQEhdBvMsBBp8+YnyhMzeh6qReXKw1zHZ
   mNQs/g/IB36wvF2EzmnZ6je79O5UOClM2WbfaBJqgacGZmkQJW7eqJF0Y
   q9GG8s+v52j0SdJLHWYw8MbCAim+rU6j0ovvu0L8PUG3/D93sRyNkGY06
   v7YyZ7ydT3fSt3CS85ro+HA4V7GIuCVA5+xvOFf2GY1XrL3bECpSascc7
   KXkORfBmplogwmWKVJbwy8on6rYast38ur6eviPMkWoU6FZf7mn542SMU
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200";
   d="scan'208";a="21641267"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jan 2022 14:35:09 +0100
Received: from niebel-ws.tq-net.de (unknown [10.123.49.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C6CB280065;
	Fri, 21 Jan 2022 14:35:09 +0100 (CET)
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH] kmscube: depend on virtual/libgbm
Date: Fri, 21 Jan 2022 14:34:14 +0100
Message-Id: <20220121133414.31021-2-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220121133414.31021-1-Markus.Niebel@ew.tq-group.com>
References: <20220121133414.31021-1-Markus.Niebel@ew.tq-group.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 13:35:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160827

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


