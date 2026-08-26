Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB804C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7894.1787733249382918537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jkg5rrG/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 867D14E413CA
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 55304604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB69F11C7AC7C;
	Wed, 26 Aug 2026 10:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZVzX1MsweyVCtTvce9AtBLRSltSTd+VQLidV/NuWjDM=;
	b=jkg5rrG/ILjvLYvx95dHEjOg0qXhAGnfVBLso2SdU+skE/H8DhwYf33L0ibOtb4/FAAT1M
	507BIun0kHIGOkYpQ2NawZrKvGJR29q/3qmqcm1G5UfmDcUKRp81fu59reC9OiVmW9Ipfc
	LeBHEByrocLKOEimmvbbyo8h4JYVQrPB+vo5i3jW4O3NVwXII3PO+QCKHptjKvxKVGFWdU
	DGp0X7WROF1QKMn67YUOEx2rQnxe03P0vpL8Lnyt08c39OKjOgqAHdDL5xGLsaoGPXMVfn
	uoDmg1oGrBy2NMSa/nfTMAP3e6EiurUwmMt3wwy/4TA+u76syx7Zx7tJYVXrjg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:41 +0200
Subject: [PATCH 2/8] libslirp: upgrade 4.9.3 -> 4.9.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-2-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=1440;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=upmAMOFh9ni5L1NR7nASmBWrEnNKsjC4crt5c9qb8hc=;
 b=jSBhcfotLhEtvfgVaTWRipNtfifggQbJM8S0jeyTPGqWQNnLMXesjzDXmdp0ggsdEFbR1al2t
 E9zAsCVlkxsCRZGuPS4y6bazcmRlp7kHJMKSa8L79Pn7PA8i+cOUcc5
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244370

Changelog:

  - Fix information leak on fragmented packets with different header lengths

  - Fix reporting oob output #95
  - Fix buffer trimming to ip6-announced length #96

  - slirp: permit guestfwd to vhost_addr/vnameserver_addr #81 #140
  - oob: cap urgent data count to what is actually available #93 (CVE-2026-9539)

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../recipes-connectivity/slirp/{libslirp_4.9.3.bb => libslirp_4.9.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
similarity index 92%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
index be13cbc1fcbd..79a24f303784 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
+SRCREV = "d09dc9a70360ee7838acccbd234ab83f3b9b37a5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"

-- 
2.47.3


