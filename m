Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1BBC67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 12:51:32 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.105375.1712580681497269837
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 05:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=NJNKKwyE;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 438CpHBk438043
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Apr 2024 14:51:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1712580678;
	bh=fZYHMPyt2ncyQEp7WSt7E5xRm4382fKjQV9PnCEnesU=; l=1276;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NJNKKwyEkArRln2hvG/zgCTBQX+VwJhyzT/PmW3uWfjlyCrqPyhi4dghtcRTSG4FA
	 y5PRzdNV8WDiLr8MsQYDm0eiEGEZPKwJsFhCy00SBwlMWZiGHGNCraHHfHP6I5Nhkh
	 xgxVOiW+uieErpoeObGnlykSuX2mhVpUD2xaoAboOzxG+oYYhw58J0E1r73FtNsyxG
	 EsfvnTqe50v3oxk1Fv2J446aXBkCmG64MhZoqbuLGVuAZ94Rkg/ZmzqFv8QA5GT8ku
	 hXASY/hMAplKNMCPNiq19448LnD+uDhGgsNVK4PUmnhYcEs0YyMZ4WM+np79U3ons0
	 G9ecSRIV1+3Zw==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 438CpFhN545804
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 8 Apr 2024 14:51:16 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id X8GFFG44H0; Mon, 08 Apr 2024 14:51:13 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 438CpCEG427258
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 8 Apr 2024 14:51:12 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rtoSu-0000000FxfZ-32kz;
	Mon, 08 Apr 2024 14:51:12 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Dan McGregor" <danismostlikely@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Daniel McGregor
 <daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH v7 3/3] nfs-utils: Configure nfsv4 ID mapping
 & Kerberos
In-Reply-To: <20240402002058.3910908-3-danismostlikely@gmail.com> (Dan
	McGregor's message of "Mon, 1 Apr 2024 18:20:56 -0600")
References: <20240402002058.3910908-1-danismostlikely@gmail.com>
	<20240402002058.3910908-3-danismostlikely@gmail.com>
Date: Mon, 08 Apr 2024 14:51:12 +0200
Message-ID: <lybk6krpa7.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 6613e841b121c496daa95d8b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 12:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198010

"Dan McGregor" <danismostlikely@gmail.com> writes:

> Add support for the nfsv4 user ID mapping daemon, configured with
> a sensible default, and add a packageconfig for Kerberos support.
>
> This is reasonably tested in production in our environment, but only
> systemd support. There'll be some more work to do to get GSSAPI and
> NFS idmapd support integreated into that.

Just for interest: how do you solve GSSAPI?  I made it work for me, put
it requires ugly changes (e.g. see [1])

There is an early dependency loop in libtirpc -> python -> kerberos ->
openssl -> python.  I solved it by

- creating a throw-away krb5-initial package [2]; installs libraries in
  /opt/krb5 and is used only at a few places.

- splitting libtirpc; this required to touch only a few other packages
  some weeks/months ago.  But now, [file-rdeps] error is triggered and
  every

Both is ugly....



Enrico

Footnotes:
[1]  https://gitlab.com/ensc-groups/bpi-router/de.ensc.bpi-router/-/tree/nanbield-next/meta-core/recipes-extended/libtirpc?ref_type=heads

     (there exists a newer version but I do have not pushed it yet...)

[2]  https://gitlab.com/ensc-groups/bpi-router/de.ensc.bpi-router/-/tree/nanbield-next/meta-core/recipes-connectivity/krb5?ref_type=heads


