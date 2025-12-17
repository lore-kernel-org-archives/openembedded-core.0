Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4FDD65C75
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 16:05:48 +0000 (UTC)
Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18126.1765987545212409182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=fxJaO2Mp;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.151, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 83CF0761AFE
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:44 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-108-123-201.trex-nlb.outbound.svc.cluster.local [100.108.123.201])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8815F76175C
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765987544;
	b=5FT8lAtPrRd/rFl3PW9yy5ek7AazitpNfV3Hc1DPOWB/McovkJ+M7nwjUZdS91r7qgBqUp
	edC2a6h1cXV58fpHbBYpZz1/LTvjxtrnl+KMVQQnkK2OMRomck9biG/ZPmFtFHY2/OfX56
	vKfF6IT72t55eZYAj5Gyyy1HQG9oVv/iPHlau8++LmO4xzW6GUdt/W0HTQJiZURQqgyoQR
	Bz6RozByP8eS6NOlUaIHhpA8yFG9UtJz8Tg87i+dsrvG8J0XDLd/xwJxEMqCVZMqMq2IyT
	4E/DUXQhjPIqi3DmU2jwgDRmezpuOCcPL1o4/nCIlheLG3GJz394XpWRoEXUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765987544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=cYm2MPDf/+6ta151HZ0xSD32+Zd8um9xZCnK7GpHgtM=;
	b=Nyjny78dVGaljho4poVVcyYHcUZnm6uoEAisYV0xqwhdbcEY4vOOs0t5DITg/gkx2/6gNv
	OG1ToY4E0bWKx7W8Ev3t/x2CkM79EBO+KTQYZIhL/V67muyruJWmlK5+6jMSzqnJzR9VG/
	pJiX3F1PFjLG0+rcEttjjbNMxQ7w+K2MLHwg7xmzxcuczon6cZZYqNTnRnoMpz2lYxyZHu
	zN+E/3fpbyFddfM7kVYJTdTalY6afj+pVMpQ/VjvL8pLVn1nugvYwM3LuSpRyTHuP94GyO
	iNWCUvlKwRv31SOziMjTli3bpaAFsinG7zSFy3S8JFSpQ6YQK+g44cUEBBpEzg==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-r97t4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Oafish-Hook: 330ae8c75fc6758b_1765987544293_572581919
X-MC-Loop-Signature: 1765987544293:2012065204
X-MC-Ingress-Time: 1765987544292
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.123.201 (trex/7.1.3);
	Wed, 17 Dec 2025 16:05:44 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWdts3zcCz1xrM;
	Wed, 17 Dec 2025 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765987541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cYm2MPDf/+6ta151HZ0xSD32+Zd8um9xZCnK7GpHgtM=;
	b=fxJaO2Mp4cVW1Jxilmo3+z20zhlAKf+Pp8M83FmE+73JlV1H7I2+xU67Rxqd1SQaale3g0
	5V7qE5BkG26mtNbjqKwYKg/GjGNUJSjG8bxEajUfBoA1OnGiIDMSQG34idWgDTqSNmj4is
	XhK234a2UxpIw1SZ7hH29kOzFSWaBnUij7+EEjfJEBKsJymKwdS0YiWzO7WdIfkvjGhQ96
	MmyMMQvX4Sa4eLeP9bwmxdWLmxp5d7vPmydbjNQxyls7q2Vb5yuia3DuC34Ks2FLWEHZG8
	BxdQfdrriJGQHByMkBLyi0iQM2MxQkvPnQrvG1Q62fxaY8vGo1AKfU6pSSXhlA==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 0/5] ALSA 1.2.15 updates
Message-ID: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 16:05:41 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6942d4d5 a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=mfol1SR9xXMMmcQWT1AA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfDc5LZ14kB+PbxItEAMLQNvrcAbWvTsoOhbCF4aCs3XkOoOGvyYo07rD8YOzfMgsB5BmOt6fMliwNWUP4KvXbW+aOXt18hM4kdox2Y/K0eeCztq2YZCR MCqCIRMlwTvI6jXUYNakg3FgiuwLyqs36BvKVI/Mpou2TuAC1zPpW+8jG4dZRyxiUPFIW4E1XIJixNoDHUnd0sywATtSzXuu/q4vYC0q3C/XJ63IyRz8A8Jh 0Du70LJoYiW3jPI+jmrNNXIGn/EIWp+JQns+bVBprcDbCnscFtzpWDLsPGcUA+re0uwGDyqVm7WsPsrcb/1Yq2qjictB19BRxFYa2TYzKjZfBNgC3vKBukuv nrkfhZa/
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228066

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

These changes update alsa-lib, alsa-utils, alsa-tools
and alsa-ucm-conf to the latest version: 1.2.15

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
 ...a-utils_1.2.14.bb =3D> alsa-utils_1.2.15.bb} |  7 +--
 7 files changed, 99 insertions(+), 18 deletions(-)
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
s_1.2.15.bb} (96%)


