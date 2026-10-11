Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6295ECA9ED1
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:50:18 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30594.1791740591515842945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 10:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=kk3CS5qr;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=9dI2cV1c;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1791740588; x=1792345388;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=1kqHsccPvqPDjXr+QNyub59SSmKOPxiwQpdp6Qo9/HU=;
	b=kk3CS5qry1XHhbDjY+a4lkzEKxU+4iL5Etvzfp26sQx2nnm9mQWMci5Aj21Cj8XWDWMtn+PyrNnI6
	 V97Cg4K05RfE8XDgm99I9w7VOsKoaPveh1yMU8sHqvp+n6Hm4qjhqvnPiwP7FRBOtE4sN3H1LyEKNJ
	 3pggfQPsn3AhK8vEM9I0VhDcanPu5ioFPExpBxCyH6KqfEeFfSdawZlwwhDXhqg6KWNUNrYr7M/zUn
	 AurrJOuLfjq1sioGaTTrmYPVmkhypAsI1PRO6c4JR5gERG+rdPgnasw8GZ/cUdlyMmFxdPzRfpFK2l
	 +AMmBr+H8iy8KWBD6Nn4dSYNDE+OWGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1791740588; x=1792345388;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=1kqHsccPvqPDjXr+QNyub59SSmKOPxiwQpdp6Qo9/HU=;
	b=9dI2cV1chOreaN5Qsvu7blfzIdxQF6Ye5dbgFyE30FKXSYkTG+3LXtyDhqQcfMzhryBryczpyN2ds
	 HCH1WwMBw==
X-HalOne-ID: 37293eff-c59b-11f1-aa68-df8125a0c701
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-4918-3389-416e-e9a4.310.pool.telefonica.de [2a02:3102:8c10:1ae0:4918:3389:416e:e9a4])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 37293eff-c59b-11f1-aa68-df8125a0c701;
	Sun, 11 Oct 2026 17:43:08 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [PATCH 0/2] Enable OpenSSH hybrid post-quantum host keys
Date: Sun, 11 Oct 2026 19:43:03 +0200
Message-ID: <20261011174305.2610435-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 19:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247580

OpenSSH 10.6 enabled hybrid ML-DSA-44/Ed25519 signatures. This series
enables this host key type by default beside ECDSA and adds a pregenerated
key for QEMU tests.

Tested on qemux86-64 with SSH connections to localhost using both ECDSA
and explicitly selected ML-DSA-44/Ed25519 host keys.

Ayoub Zaki (2):
  ssh-pregen-hostkeys: add ML-DSA-44/Ed25519 host key
  openssh: enable ML-DSA-44/Ed25519 host keys by default

 .../openssh/openssh/sshd_check_keys           |  5 ++
 .../openssh/openssh/sshd_config               |  1 +
 .../openssh/openssh_10.6p1.bb                 |  9 ++-
 .../openssh/ssh_host_mldsa44_ed25519_key      | 58 +++++++++++++++++++
 .../openssh/ssh_host_mldsa44_ed25519_key.pub  |  1 +
 5 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_mldsa44_ed25519_key
 create mode 100644 meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys/openssh/ssh_host_mldsa44_ed25519_key.pub

-- 
2.43.0


