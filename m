Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12939.1795770235750845430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 01:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=HZ7EwE0k;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D64DC43684;
	Fri, 27 Nov 2026 08:54:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795769656;
	b=xkiJ3Q1n+eLbaJbWKYMpNjGuFEbKb1LMW6RmV99nP2THOils+K6rbWlUatJ4yNWBygBd
	 fZXDAiB6mJ93bzUVUcjyH+gwvRUB1Towp816uJpQWYBJjIwN250jbL1XujhUPd1UXdJ4+
	 uajR0/DQOmzigEYa4IqccwRvJVYClGXki3StlebXItfouPZz5G5rMxTMWHWzI7RP45H5B
	 xbp9Pi+M2F87h7Aw/TBsSX93pOlDloBKMriv4Fv/3vtN3s7zXqIqS3BYWalpotQ5aNiPR
	 EiOfbnY74YSnPGQBpRmTrtKTzKWrKb38PP+Uq48Di2f/5mihG+zCQXR1KfOo1KO8Ksw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795769656;
	h=DKIM-Signature:Received:From:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:
	 Subject:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=kuqOxnM5IWHN2revzjpRiHinhN0aByvT6CupOdpKmq8=;
	b=V7eM63HcvrpHFyRNZXZ3/WBvlsDem9Prz2wJ6Q/VQzUnJ5Rg9cqReHWzrTGIua79jAHM
	 jLBm1b8HMJBdFymtOnAy3vOeztOc2x3qXLYoWAbBMd7FJjxJtSL20nHTfNk1AeS6p5WmI
	 Vnbb6pn4FqBSSOWnUYEnRdvh6ng9HG0NWlRekueWRMW5GQKMVtCLSMaKviTNcpa+qwPOq
	 1yMNbFc+6/eMHr6obWZbFBSsV7f4YLS58uoASIncX2DT+bjw36cFk0EpfHBW2bkVZRVZE
	 ijKz+bU7bfy21lWU1cBaVfbDoVkxLIjefviK/gH9bIAHXVj8ZtMogIRvQsltlUfL75w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71E901F00899;
	Fri, 27 Nov 2026 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769656;
	bh=kuqOxnM5IWHN2revzjpRiHinhN0aByvT6CupOdpKmq8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HZ7EwE0kqs1+ZvzqNR+sEtWJikhLguRlnR4ZMAMqhGaJSc2jveOx3C7W9SOtBbias
	 3p/Zd0HGIMTz2xMbpU742WmotNtuG9ssXDD22sNzcO+rl7n4/HNEOaMTreYHG4lIur
	 3Hi0qMS/0vMWyAUpQnNSMHWRStPtKR35G+qinKX/p7Q4Bk6uqRKB9RLpEIXTYoaJfq
	 AaWQB6KnYVK86Q38cLECo0n+Avu0g0QnPOuwWuqKa4AOrJ3QKriwFt6mHWY5FjKePh
	 rkyzJUskatTUZC8yg2BGbYew2aSO2MdPEdCBrX/rIa3ma0TmpkuzKb0yMC5IC8zEdS
	 SZdYZdfahEdvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F404A4B666;
	Fri, 27 Nov 2026 08:54:05 +0000 (UTC)
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 08:52:44 +0000
Message-Id: <20261127-yoc1s-ffmpeg-v1-0-f01fec79468b@certik.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANxECWsC/yWMSw4CIRBErzLptSRAdD5exbgApvkYBUKj0Uzm7
 oIu61XV24CwBCQ4DxsUfAUKKbYgDgMYr6JDFtaWQXI5CiEn9klGELP2kdExsZzmcTrOC+cK2iU
 XtOH9012AjCrVO5Xh+q/oqW9oatf1sVaETBcVje+IMK41pTvrHPb9C7oZCvubAAAA
X-Change-ID: 20261127-yoc1s-ffmpeg-19586748900a
Subject: [scarthgap][PATCH 0/7] ffmpeg: backport seven security fixes
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769564; l=1956;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=+GiepgD4KymWaju/DEF38E1uqESug8md6EBjxCGlDwk=;
 b=SQhEgVkysTAgEhXzlhcHZe4QqVZMu0AeJPY5kU944iupyayOJ6Pye/1Soa9gGfZfmT5TnjSak
 EDLCswIiZ2xAcd7tWkIncHdNP8ffXkv0bP7XRfyNzf0rsu4VOz11Iov
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251366

Backport seven upstream FFmpeg fixes to Scarthgap's FFmpeg 6.1.4.

Tested: git am on current OE-Core Scarthgap and zero-fuzz SRC_URI
application. Reused Pilot-YOC1 sandbox results for the same FFmpeg
recipe and patch stack: baseline and patched BitBake builds, patched
do_patch, and 1,520 passing patched FATE tests with FATE_SAMPLES empty.

The backports and test runs were prepared with AI coding tools (OpenAI
Codex agents, with review by Claude). I went over the result before
signing off.

Dickson Wu (7):
  ffmpeg: fix CVE-2026-135736
  ffmpeg: fix CVE-2026-135743
  ffmpeg: fix CVE-2026-135722
  ffmpeg: fix CVE-2026-135725
  ffmpeg: fix CVE-2026-135734
  ffmpeg: fix CVE-2026-135738
  ffmpeg: fix CVE-2026-135740

 .../ffmpeg/ffmpeg/CVE-2026-135722.patch       | 36 +++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-135725.patch       | 34 ++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-135734.patch       | 36 +++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-135736.patch       | 45 ++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-135738.patch       | 52 +++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-135740.patch       | 35 +++++++++++++
 .../ffmpeg/ffmpeg/CVE-2026-135743.patch       | 49 +++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  7 +++
 8 files changed, 294 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135722.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135725.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135734.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135736.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135738.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135740.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-135743.patch


base-commit: d521a7d8364fe038ce5205003170e80de218a83a
-- 
2.43.0


