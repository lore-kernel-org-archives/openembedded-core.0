Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6291.1792608386324542224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 11:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=RUNkudoU;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: m.felsch@pengutronix.de)
Received: from dude06.red.stw.pengutronix.de (dude06.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::5c])
	(Authenticated sender: relay-from-dude06.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2757C201CE0;
	Wed, 21 Oct 2026 20:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792608380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX1waLBOdRvf8gW7w470LpkPNceT80OeB8HMVpT3CG4=;
	b=RUNkudoUQR0FTu4I9KYrI/xRtWf9n5RDZ3KQnrcv1zW5hD4mvmwQW1quzU5YP5UdlGd/Ay
	WoiXawktakFZRI4R2vpu5Y9J12WnnrQUWKcCoUnpDAYKABStzyWeFg+DRP6WfHBjgGRlK/
	odU6rw6HEBzmlSUUdgbgxfc9NRos2CvkkICec/IfvjS7M5klR0pkWL/URhiudtbtDf3YTE
	2GHiXrVS9A4kXmvT1Hz68ZtssScpsE8CFbZgXR3W3BSyRDiyUw6x8YJ/xTdX2JYklEEUrj
	uZ20qoJfBfHrCuFtQC0i5wNrgR2gkTkY+U2HiVJsRM+aT47ThrzZurnHDfU+mg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792608380; a=rsa-sha256;
	cv=none;
	b=ATVDlLhZZQTcx9X2XxOz7w4LevJOnldjf/TgLGaitgg0ybSysV9Ah6+66Bl39cPKqyYjuE
	tFUeFderB2aHz8xSQnQEypgRiCiSLGJHzZmG7PFiJp3ro3aftS8nT8AMaVdQY72CbgvSMo
	c7eKQ3w4uXOO0e0upqdtNopwUdDi6xaV9NplQhuIpqzvMky8VjWvJI40C1Sk6WkySjAL2G
	oJCxlH0iSABoXxE4vA7ato/oF3YWJDKsigwy8P58iiWYR/TYI7VVMA5DU5hC5+Fif/ganL
	RLlqtFGC25XmYKTBiOhLd+5nBAloNyDZMsEcKvS0ncT6rvZHUTmrLdnlfI4F8w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude06.red.stw.pengutronix.de smtp.mailfrom=m.felsch@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792608380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX1waLBOdRvf8gW7w470LpkPNceT80OeB8HMVpT3CG4=;
	b=OE+dJt9YK0264jZGQj/9VLsS/uH2PoKa10afG6yhgj30lLCCZPlzbQm/1DZz+QpC6gvaB9
	Nh8uZMtjgAIxnXCybMWv3O5xaJxNqdPaUOlSZkPAMO5k9XHYt6x+NK6sJvU4L6oVQ8EYX6
	i+W0k/GRGirhe21D3jgAGrGNKdQJAqLBcDI1guczyCHguRyjzoXcOKMXsci+UfdOtCYR3r
	h+TGQso0lj8mBNsykFAPZba8t58cJGCMXQtB/jw4c6dh4eSYr0dfrAyIiO0Ci2emn5RgaQ
	tHkn0cfbt7VevPmkyqsbSbjwGTKUba4LSGbZf0e3pENcplp3ZXL5NVk5qpCCcQ==
Received: from dude06.red.stw.pengutronix.de (localhost [IPv6:::1])
	by dude06.red.stw.pengutronix.de (Postfix) with ESMTP id 0A903640BC5;
	Wed, 21 Oct 2026 20:46:20 +0200 (CEST)
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Wed, 21 Oct 2026 20:46:16 +0200
Subject: [PATCH 1/2] classes/cargo-update-recipe-crates: fix unreachable
 Cargo.lock check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-mfe-multi-cargo-lock-files-v1-1-d3510d4ad963@pengutronix.de>
References: <20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de>
In-Reply-To: <20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 18:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248407

The 'crates is None' check can never trigger since crates is always
initialised to the header string. Use the previously unused 'found'
flag to detect a run where no Cargo.lock yielded any crates.io crate
and fail the task in that case instead of silently writing an empty
crate list.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index e62039208c161cf0f2f6fc56ba5ef2e9c807de5f..0767b566ee287d11dc2e1e6d0aeea0a0d3b225b8 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -75,8 +75,9 @@ python do_update_crates() {
                 c = get_crates(cargo_lock_path)
                 if c is not None:
                     crates += c
+                    found = True
 
-    if crates is None:
+    if not found:
         raise ValueError(f"Unable to find any Cargo.lock in {cargo_lock_src_dir}")
 
     target_file = d.expand("${THISDIR}/${BPN}-crates.inc")

-- 
2.47.3

