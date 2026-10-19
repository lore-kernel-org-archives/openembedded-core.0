Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3806CCF2DB
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 09:23:49 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30485.1792401820858935724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 02:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=BMvNDRvx;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CC4452004FF;
	Mon, 19 Oct 2026 11:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792401816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ABXHGpkOZhxk5bVhfEwAHXyDxrc8RIvUwDvfc6J38yM=;
	b=BMvNDRvxXJaqZaunhbegb0Wl7hR9CwJNAIL3adJgFN3AwxqwZYHCmLg9VP5P5iuMqXExL6
	CGobyDSMr4B3spSM9oC0Ufz2p51yn4MScrUSc3DsaBQrkye0QjgdtLbYVj/Ja/8ohU/TW3
	GhwdoUA9R6KIyB+P8ChyRh9UxFFLPCfADCrLhgmT2YeqD+FFYSeY2sJg55o8v+wgo4+WhL
	nXQPzhzX4hbAeEIF2Z1CUF/umu6abGjFuVRgt9AtI4bR2uluZ3qlbVbvsvYbkAJFArDYry
	ku+4crnBEt5mMoNZ4ksK6Ac2QkGUWtKkaFstKTANtsbpZJSQPQvbndEYwpjONw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792401816; a=rsa-sha256;
	cv=none;
	b=G/gbfyiYwvMwH3oYynSvVU3JgYy5AkQCyNZ+CFO71J1H6nYUuGaPJay0+yPRKHerSmJPkh
	V8WZXTmnaTl159kbR5yiW6qiDbFSoao2jYd/XICxIee2rqHljfyKHuREeQlud50+CxiR01
	yHAEVf3xmN+JOovZbY/axL/6mROGPVqdJsrgj/LJy/FqVW+D84tyI8KqQHz9JSjYz4dgZn
	J6wtvgswM1B5/k0yP3umT86q+Nd30wuYOSGlNCLPmgM3cbQ5N5VnWOD4Ko1AeAZfUd/mu9
	eRvOpdnTn6Btsvpfa0FN+Wi4igxQIQLQ78O9IqMLB2ER70/72FbPSbzeRim0JA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=l.stach@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792401816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ABXHGpkOZhxk5bVhfEwAHXyDxrc8RIvUwDvfc6J38yM=;
	b=ZDkoUGa2hns6MCUZMp+wOsXwvRaSuasRnVS9p0JMtqeAEC8WQBZDOizpF/GXWygjOAmIGs
	dfH0Du4zqxwnpno4/C3/ySMJUGOU9WGddDa5ZwQQQeTsWjCMqZCDzy6OSrJj+ZLmUrXYjU
	b7ulk6hsCylCPDE0YGbibA91zVhXdq/5hSzFC49cG40cLpqMg4L5AcrH2GgzS3U9XWtsh8
	2DDmuvjyD5uaq30Q05dSaTS0KBPQTVIFbodotoF6EgN9GsZKZdyfCFx4k8GH2mx0JbILJ+
	vvFE81Jhz+zdGqKvCTuedcdDNUxrt0zk2L4uWuq8YaolNq/x2YYRkMbSzG0B4g==
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <l.stach@pengutronix.de>)
	id 1xIjai-000Cc9-2J;
	Mon, 19 Oct 2026 11:23:36 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [wrynose][PATCH] barebox: inherit upstream-stable-release-point
Date: Mon, 19 Oct 2026 11:23:36 +0200
Message-ID: <20261019092336.1342944-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 09:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248152

Barebox uses a vYYYY.MM.stable versioning scheme, with the stable
releases only carrying bug and security fixes. Thus we can use
the upstream-stable-release-point class to mark those releases as
suitable for inclusion in the oe-core stable series.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
Same patch that has already been applied to master.
---
 meta/recipes-bsp/barebox/barebox.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/barebox/barebox.bb b/meta/recipes-bsp/bareb=
ox/barebox.bb
index a48d97941cc0..583fde5d187e 100644
--- a/meta/recipes-bsp/barebox/barebox.bb
+++ b/meta/recipes-bsp/barebox/barebox.bb
@@ -6,5 +6,5 @@ Linux kernel driver API for making driver porting easier,=
 \
 and a subset of the POSIX C library for writing more command-line utilit=
ies."
=20
 require barebox-common.inc
-inherit barebox
+inherit barebox upstream-stable-release-point
=20
--=20
2.47.3


