Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8893C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:34:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4963.1786530840479072754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 03:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WmNMVaDg;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CCFA40D94;
	Wed, 12 Aug 2026 10:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E789C2BCF4;
	Wed, 12 Aug 2026 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786530839;
	bh=hP17CNYsmVbxuVrL+tbuKyRzQ0ecVPw7BRc11UphmFU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WmNMVaDgZRveNZO4v0bSP4dR7xOtNbo0e0hpvQexH8rOmJ2LStub+2efTP/D04Phi
	 xdLkM+PbJAeb6y54xjUT0JZftz53UTufl0JUh9xp4fNqIrtAONncjMOca2nz+Y8Jsw
	 gY93Sr/qAOC60aNJ2C60sRMwJPVjwIztVUZAOsWaFgu9mHTeRnZKs5E0npeUXb4CYP
	 n2f5PF92xSV4c5cgfap8ZNeuzAebbS7kV7cm1Je1yYQlTSpiXiAqCvo/rosw3dsNTV
	 sb1SvDUU5c4B+/Tfv9q6fC8ry8yCp/tPhy9CR6Iih5qRTnk6EAjIxJhmIvVvK553BG
	 pmPpzLzVmClTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8E0C5CFDB;
	Wed, 12 Aug 2026 10:33:59 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Date: Wed, 12 Aug 2026 12:33:45 +0200
Subject: [PATCH wrynose] volatile-binds: order systemd-timesyncd after
 /var/lib
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-backport_timesyncd-v1-1-c1fa5bc8e5c9@belden.com>
X-B4-Tracking: v=1; b=H4sIAAhMfGoC/yWMXQrCMBAGr1L22UAbsESvIiJp8lVXMSm78aeU3
 t2oj8Mws5BCGEr7ZiHBk5VzqtBtGgoXn84wHCuTbW3fus6awYfblKWcCt+hcwrR+N3Wux5uRAT
 VcBKM/P5ND/SSOWUFHf9CH8MVoXyXtK4fskh15X8AAAA=
X-Change-ID: 20260812-backport_timesyncd-a95a86e8fede
To: openembedded-core@lists.openembedded.org
Cc: esa.jaaskela@suomi24.fi, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Patrick Vogelaar <patrick.vogelaar@belden.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786530838; l=1917;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=6FOhyJqR2CFPF1BF78T38KQBpWYothYXTgr6AIq1q70=;
 b=9SdjAIgEFuFmK44nypfC1yD8R4c1v+t5U3O6CQ9wfokB4k7NA3fVNGl4QIFiu4fS0GuQ6r/zn
 QKTd6jcNX6LBpT+P9OC3TOORY4P8vDEcvvnASYWsgvshAapbu4rAa+1
X-Developer-Key: i=patrick.vogelaar@belden.com; a=ed25519;
 pk=w0QU8RmOR3hQv1DxMcz6KmySeE8yqbvO0xC1ZSSUNqY=
X-Endpoint-Received: by B4 Relay for patrick.vogelaar@belden.com/20240201
 with auth_id=125
X-Original-From: Patrick Vogelaar <patrick.vogelaar@belden.com>
Reply-To: patrick.vogelaar@belden.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243270

From: Esa Jaaskela <esa.jaaskela@suomi24.fi>

systemd-timesyncd stores its clock file under /var/lib/systemd/timesync,
so it can fail to save state if it starts before the volatile /var/lib
is mounted. Add it to the Before= and WantedBy= entries already used for
systemd-random-seed.service.

(cherry picked from commit 1b8d8c25e46f1df7079545f4297496426fd9d371)

Signed-off-by: Esa Jaaskela <esa.jaaskela@suomi24.fi>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 857bcc93ff..613e750c17 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -57,10 +57,11 @@ ${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
 END
 
     if [ -e "$var_lib_servicefile" ]; then
-        # As the seed is stored under /var/lib, ensure that this service runs
-        # after the volatile /var/lib is mounted.
-        sed -i -e "/^Before=/s/\$/ systemd-random-seed.service/" \
-               -e "/^WantedBy=/s/\$/ systemd-random-seed.service/" \
+        # The random seed and the timesyncd clock file are stored under
+        # /var/lib, so ensure that those services run after the volatile
+        # /var/lib is mounted.
+        sed -i -e "/^Before=/s/\$/ systemd-random-seed.service systemd-timesyncd.service/" \
+               -e "/^WantedBy=/s/\$/ systemd-random-seed.service systemd-timesyncd.service/" \
                "$var_lib_servicefile"
     fi
 }

---
base-commit: f09a0f28aeb54ddd90415dd458338e1565bb5a49
change-id: 20260812-backport_timesyncd-a95a86e8fede

Best regards,
--  
Patrick Vogelaar <patrick.vogelaar@belden.com>



