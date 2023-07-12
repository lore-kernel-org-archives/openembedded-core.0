Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D440C001DF
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:48:32 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.5351.1689162504543920633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=WAI1gzG/;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 36CBmKFO350039
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 13:48:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1689162500;
	bh=eRMWJ98bmIU3xdGuDc54YSE5hITAppKMtAL7vcS+Hxg=; l=1270;
	h=From:To:Subject:Date;
	b=WAI1gzG/NVPIg/hjG1VkoVX4KHr7OXr3ks8iEe/bAPZ+c0dDGWC7FK219gTH6duRn
	 WaTzC92Hkh/R1jUFgZkKIn0HRHJ96IhPZOtIFkMny89BFeZU4QgzzSRMQPjpoHBjBC
	 N3Hj64pH3h61g9+HzOm7tbN2Hk58RBFsdCLJc/Zbjhf+ry99ntc2nprpc5FfoNRRaE
	 gOdIPnZ78RCMCuIjDUUnkomv9eXmfmGUMUPoV6w20wn/cBzDkzlW/zFKjyJI3HwDgn
	 /L3u5kzTDlr8tttOsAbvb8DQPMqFJ6kJSWtFewC/gd41XlxQ1O4r7cBYZN5LfT0TDW
	 ffH8/8qqTI4dg==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 36CBmIsd449429
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Wed, 12 Jul 2023 13:48:19 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id U24NJ788TK; Wed, 12 Jul 2023 13:48:18 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de ([192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 36CBmIqM343709
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from ensc@sigma-chemnitz.de; Wed, 12 Jul 2023 13:48:18 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.96)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1qJYKQ-002fKb-0X
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Jul 2023 13:48:18 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Subject: RFE: add 'LAYERDIR_<layer>' variable
Date: Wed, 12 Jul 2023 13:48:18 +0200
Message-ID: <ly5y6p1hbx.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 64ae9302301ed1a431088a56
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184185

Hi,

currently, it is difficult to reuse recipes from other layers because
their path is required but not known.  E.g. when one tries to add a
backported imx-gpu-viv recipe [1] to a local layer by

| require recipes-graphics/imx-gpu-viv/imx-gpu-viv-6.inc

do_fetch() will fail because some SRC_URI can not be resolved.  To
support this, FILESEXTRAPATHS must contain the path of the original
recipe.

Determining this path is difficult at the moment, because it is unknown
and depends on the layout of BBLAYERS.


I suggest to add a new standard variable 'LAYERDIR_<layer>' which
points to '${LAYERDIR}' of the layer.  It is probably difficult to set
it automatically (value of <layer> is not known); instead of, it must
be defined manually in 'layer.conf' like related variables.

E.g.

| BBFILE_COLLECTIONS += "freescale-layer"
| BBFILE_PATTERN_freescale-layer := "^${LAYERDIR}/"
| 
| LAYERDIR_freescale-layer := "${LAYERDIR}"    <<<<<<<<<<

Diagnostic should be easy (iterate over BBFILE_COLLECTIONS and emit
warning when corresponding 'LAYERDIR_<layer>' is undefined).


What do you think?


Enrico

Footnotes:
[1]  https://github.com/Freescale/meta-freescale/blob/master/recipes-graphics/imx-gpu-viv/imx-gpu-viv_6.4.11.p1.0-aarch64.bb

