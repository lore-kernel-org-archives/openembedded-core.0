Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53146CA9EDA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:00:00 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32875.1791748795181116693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=I1DYF3fY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026101119595217534350af0002079a-fwaaku@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026101119595217534350af0002079a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RX3q8e3APtDhFoxqe0wBFW1nkwksdHI3g9fFRrkFZhw=;
 b=I1DYF3fY1QxhtJcrpxjnipemBE2irS8yUwzXl56lsIxWMiL9IaitYTeZxT9gLE7gINOMOb
 QbWab9VqVbG3JPqGZJe9ZaUdOpNJ20PkEYoJwaf9H2KwS72OiAMZ6uZXgHoPLlTYfgO3aQVt
 /ukBiuwqhPt+r91RizVe9nqFkrrrh5muvbtja32loKzWGWodhbKsg3Rt9Xl40Fcmkr/5klEV
 uYIGbFsMuHlCpdR8pEDRlRQMIuLybBSgsDmFMMnDx5NYTFXgLjZ9/E8LGmyMVtVqfiultPEX
 R2sdh6Ao1rFICVjH2cuy/JVA+3pjC0fmMrIWTWWKkbIVF1HNOuFHtB3w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 00/11] runqemu: use QMP for slirp host port allocation
Date: Sun, 11 Oct 2026 21:59:05 +0200
Message-ID: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247588

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Instead of using flocks to manage slirp host ports, let QEMU be the
authoritative source for the ports. runqemu starts QEMU without the
forwards and adds them through the QMP interface (hostfwd_add).
If a host port is taken, QEMU rejects the forward and runqemu retries
with the next free one.

Why:
- Atomic: Taking the port either succeeds or fails in one step in QEMU.
  A lock and probe is racy, because the lock only coordinates runqemu
  instances and any other process can still bind the port before QEMU does.
- Readable: The effective host ports can be queried from QEMU. Reading them
  back from the command line only works for the first forward, which is the
  ssh port.

Since a forward can now end up on a different host port, devtool ide-sdk and
its selftests use the effective host ports. New selftests run against a native
-machine none QEMU and need no image.

The last patch keeps the old locking for the wrynose and blacksail autobuilder
branches, so a newer runqemu doesn't take ports away from the older locking
scheme. It is to be reverted once those branches are EOL or have the QMP
allocation backported.

