Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A08CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 14:54:37 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11468.1762354466920273877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 06:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=iGaZ+qNe;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=iGaZ+qNe;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1762354463;
	bh=kDb6L2pcTMjwLzvKVHjAJH8NIrAvi3/jZn6o/lEyunE=;
	h=Subject:From:To:Date:From;
	b=iGaZ+qNepPzEVfyETsJoUMceZbGZXqkOREbIZSbMPq5DcdOoeUSqFl27Jz+Ssa1Kx
	 8SWitndOwg0TQJ5tq99i0EQNerI9nWNCXxwxCrT+E15IVPAyDneBcSd/OinAMKTgt1
	 jtrlxE6CrWYQnIbRL+8KT43U+ISoKGSh3jjOMgbR7p0qjhgCyF1/nhHfocdsnTtuws
	 821jxZItRTJx2kpxHxhYp5HvNpuUWuwMZRCaSrsQjIvDU++BDLu7sN4n2nHi130aNn
	 qWvXnGjgzgB883j3dvQ1tWb5GwkM0U+YkaFzNFpCkVWagr2QX3Bn1uavn4uStTZnkc
	 kqg4g12a/0Lww==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id DF85A5F9CC
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 15:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1762354463;
	bh=kDb6L2pcTMjwLzvKVHjAJH8NIrAvi3/jZn6o/lEyunE=;
	h=Subject:From:To:Date:From;
	b=iGaZ+qNepPzEVfyETsJoUMceZbGZXqkOREbIZSbMPq5DcdOoeUSqFl27Jz+Ssa1Kx
	 8SWitndOwg0TQJ5tq99i0EQNerI9nWNCXxwxCrT+E15IVPAyDneBcSd/OinAMKTgt1
	 jtrlxE6CrWYQnIbRL+8KT43U+ISoKGSh3jjOMgbR7p0qjhgCyF1/nhHfocdsnTtuws
	 821jxZItRTJx2kpxHxhYp5HvNpuUWuwMZRCaSrsQjIvDU++BDLu7sN4n2nHi130aNn
	 qWvXnGjgzgB883j3dvQ1tWb5GwkM0U+YkaFzNFpCkVWagr2QX3Bn1uavn4uStTZnkc
	 kqg4g12a/0Lww==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id CE97E5F87B
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 15:54:23 +0100 (CET)
Message-ID: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
Subject: Thoughts on SPDX for files from meta-layer
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Nov 2025 15:54:23 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 14:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225774

Hello,

I've looked through the generated SPDX files for a project recently.
I' m specifically interested in the downloadLocation property that is
set for entries in SRC_URI in recipe scope SPDX files, as our list of
upstream sources we need to monitor for security information is based
off those values.

We'd like to extend the generated SPDX to also cover files from meta-
layers, that are provided via file:// entries in SRC_URI. The files
provided via this mechanism are mostly configuration files, systemd
services, initscripts and the likes, so one could argue that they
are=C2=A0not relevant dependencies and thus do not need to be traced in
SPDX, but we'd prefer to properly trace them in the SPDX documents.

Are there any thoughts on this, prior discussion that I've not found in
the mailinglist archive or external resources on how such files should
be treated in SPDX in general?

I'm considering implementing this as outlined:
- for file:// entries in SRC_URI determine which layer provides the
file (via bb.fetch2.local.localpath())
- check if the layer is modified via oe.buildcfg.is_layer_modified()
  -> modified -> abort
- retrieve the layers URL. This is more involved since what
oe.buildcfg.get_metadata_git_remotes() returns might not be the URL
that should be specified in the downloadLocation
My approach would be to introduce a per-layer variable that specifies
it's public URL.
  -> no public URL for the layer found -> abort
- create a SPDXRef-Download-recipename-X entry for the file with the
downloadLocation set to the layers url with commit and subpath of the
file in the repository specified

If the layer is modified or a public URL for that layer is not
specified the downloadLocation would yield a NOASSERTION value.

I'd be glad to get some feedback on those ideas!

Sincerely
Daniel Wagenknecht

