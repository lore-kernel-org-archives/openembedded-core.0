Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96DAE67817
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:43:53 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85112.1766425430347356426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=nTS84woV;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.14, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 647E47E2B65
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:49 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.108.184.12])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A52497E29AD
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766425429;
	b=tjHUIcubrJHUwKH+7Jo263D0iBtxKRIkssz9mwhDw2nQuAZkT2f4STj59Zn8SkXirTJLvm
	50eFM5PCUpjU9mvkaatpRvY0ukj7PnK1TM4Yi/RUIFuNkDjB6EjhD3LxfEHeIBsKLHjkaT
	o3gg0E9cQ5krWx8FG9V013yji/oZ7N/FSVSCRpwAioM0kkwvWG+ezEU1bCzQUg6qC6GK1B
	9Oj8mx88T15HcZ/RezU7rbG19FW+yfUJ+5ulrNxdWiMv7ATdIQiUm8qSF5q51KsonRJ7DT
	NwB2xJnw/ISkLGoLHKA+SIOFhSky9S6Yh8n9DzBa/M6ii4W9wbP9ZcNP53EWHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766425429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=6d9LsbAt9fbwvy5PQwaaEG260ksZcSywvExEoiJqWZ0=;
	b=lL3C2BMs/VExbB2MKjpwcZWaaK2ZdcMBBN7g/w1xzHsfJ4i/a8dMCIL0apE8RX6dCzX/XS
	LXtlqETYQOYDpcMDrTvktB4M+0RWaY0MgFVhTMvMjGLsPHWa5on94Rt/A16goVY8MFAc4D
	ekh1F8Yk8C8IEiRMNq6JAo0CbvNTTQo9oBJB7L2zuMoxnRM7ot/AZUblyyGSmUs0fBgqcL
	sBFcHQfTbU9H3bMX5XujbV07qsde9JkSACvyY9qNSds49+31wH+b/nYKlARV7H0sKJMA7u
	oUxN44gmRn+/0bPcr1F6CUj7do8Ldh/77UODsiAeQBVNy1gP3+989JcvZzlojg==
ARC-Authentication-Results: i=1;
	rspamd-55cdcc6c54-tfwjt;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Stupid-Broad: 6bf01a5043b330e6_1766425429232_462094789
X-MC-Loop-Signature: 1766425429232:3083799408
X-MC-Ingress-Time: 1766425429232
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.184.12 (trex/7.1.3);
	Mon, 22 Dec 2025 17:43:49 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7586:fd48:8d48:80a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dZlqk1hWXz1y1P;
	Mon, 22 Dec 2025 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766425426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6d9LsbAt9fbwvy5PQwaaEG260ksZcSywvExEoiJqWZ0=;
	b=nTS84woVp8slhUrhn6/rdKWiImfyRTpGLnWoOUlpSiqA5bJiAEQoN3BD1txqVi20QX0EXh
	wQLFjqWhrH7WPqm+PZxJbKSyxlAWRjvDVFSCikVjRFbEjMCKaquM7CzLmpHV+n6lgE+0To
	6b7a4XtCdXl8RvQntOJXiI2EswRyLN0Y60gPHJkD1fN1kfUQR2ZME6JRzz3goock6w4Ty0
	clNlRY9ARNFFoiLLucaApr1SGed4h8fiinMXxvXcvaME6tEFEizTKIesccH7VsAfahWOoU
	fmZYLm7Hl2TpMDhAHVaGqMNNZ2uJZO/Z406DcRaX7x6VphNxdSljy68E9MCk3A==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 0/5] ALSA 1.2.15 updates
Message-ID: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 17:43:46 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=69498352 a=myaG3V0YOm9nx1Em8mk9ug==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=zmyMrk7-zwGhE0VjVG8A:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfKghSp26lwEApGV1QbtMtOIZMrlt1pazoGA7qwBFkoWRdxrr18IYQIssQGAoQo8YyeyO+Ar3pmb729aGsoIC3GvW0oMsdo+o8AfXyntXnjs/ik0yMXAK nqKBPqzbvFGPb3/YYIA6pQFCg6vT8dR1hDQDL8ZYvkIisEfVsgceuFL4l6SPVWD8rFiH3YjUSlUSaUucRa42cK63VtPEM3Ypm5/CB3oBBZ1p3Fp7jFjTBUfU OxeAh1/gOlWM1itu8y1gj+3CHmp+RZwHk14YNAVKWbCIeX2Yp7PBNwnUVMxu2Yho5k5hjfjKLR7POg3elESYoS3bXkbtatxTXLSGCIeRQGdOpYeHF6cMsGty V0j82kfw
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228316

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

These changes update alsa-lib, alsa-utils, alsa-tools
and alsa-ucm-conf to the latest version: 1.2.15

Changes in V3:
- alsa-utils: keep this line in the recipe
  EXTRA_OECONF =3D "--disable-rst2man"
  It looks unnecessary, but will try to remove through
  a later commit.

Changes in V2:
- alsa-lib: add this patch from upstream for uclibc:
  https://github.com/alsa-project/alsa-lib/commit/a068cf08ad67447893b707c=
ddfce31c9cafee643

Michael Opdenacker (5):
  alsa-lib: upgrade 1.2.14 -> 1.2.15
  alsa-utils: upgrade 1.2.14 -> 1.2.15
  alsa-tools: upgrade 1.2.14 -> 1.2.15
  alsa-ucm-conf: upgrade 1.2.14 -> 1.2.15
  maintainers.inc: update e-mail address

 meta/conf/distro/include/maintainers.inc      | 22 ++++----
 ...use-closefrom-instead-of-close_range.patch | 50 +++++++++++++++++++
 ...{alsa-lib_1.2.14.bb =3D> alsa-lib_1.2.15.bb} |  5 +-
 ...a-tools_1.2.14.bb =3D> alsa-tools_1.2.15.bb} |  2 +-
 ...conf_1.2.14.bb =3D> alsa-ucm-conf_1.2.15.bb} |  2 +-
 ...sactl-fix-build-when-in-subdirectory.patch | 29 +++++++++++
 ...a-utils_1.2.14.bb =3D> alsa-utils_1.2.15.bb} |  5 +-
 7 files changed, 98 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm=
-use-closefrom-instead-of-close_range.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.14.bb =3D> alsa-lib_1.=
2.15.bb} (89%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.14.bb =3D> alsa-tool=
s_1.2.15.bb} (97%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.14.bb =3D> alsa-u=
cm-conf_1.2.15.bb} (89%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-a=
lsactl-fix-build-when-in-subdirectory.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.14.bb =3D> alsa-util=
s_1.2.15.bb} (97%)


