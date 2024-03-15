Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426C2C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 15:58:31 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.26053.1710518305307553836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 08:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=Rk5v0cZI;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42FFwLl9206167
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 16:58:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710518302;
	bh=oT6E7OObFXY5iVz2Ka1EtLjOTY2GJFw8bzNDPmqnGFU=; l=1188;
	h=From:To:Subject:Date;
	b=Rk5v0cZIh44+U2nYtCUVsTBUvU0MJhLSOOsXPdx5EMZ0Uq9weYwOR+fKrCkvwtEiY
	 lUH5waq3dTcuxf03GreDL874QD1cPbIi/q2u+6bGfQMKQYLMWuq6qrBMtCpr4kwsTx
	 oTyfzSkayNn+WaE7f4Zsh6aG1pIN8hN7kzvLuDyGNGPMFUVaEJqUskqqGAK+pCMnvs
	 4/m3+35eNcno4hfz6bWlx32SQwiaEVfW0b5+iw0+7lSj8RjfF8/ie+psDkc+pM7qTV
	 IM1ZehC5tYuBGa0GnS8xCY6iRUCez2gK2W484IXAlsZu7cxLr1bFOhKu9+KpbVxyQh
	 BxhUHaBMRnJMA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42FFwJjD390160
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Fri, 15 Mar 2024 16:58:20 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id W91SKNSYV3; Fri, 15 Mar 2024 16:58:18 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 42FFwIPp143202
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from ensc@sigma-chemnitz.de; Fri, 15 Mar 2024 16:58:18 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rl9wo-00000004zjy-2YLM
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2024 16:58:18 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Subject: '.bashrc': Unknown file type; file ignored
Date: Fri, 15 Mar 2024 16:58:18 +0100
Message-ID: <lysf0r7ahx.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65f4701ab121c496daa90638
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 15:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197140

Hello,

with ubuntu-20.04 based builders I get problems like

| DEBUG: Executing shell function do_image_tar
| tar: ./home/.../.bashrc: Unknown file type; file ignored
| tar: Exiting with failure status due to previous errors
| WARNING: exit code 1 from a shell command.
| NOTE: recipe ...-image-core-1.0-r0: task do_image_tar: Failed

or

| Creating journal (8192 blocks): done
| Copying files into the device: __populate_fs: ignoring entry ".bashrc"
| .bashrc: File not found by ext2_lookup while looking up ".bashrc"
| mkfs.ext4: File not found by ext2_lookup while populating file system
| 
| + bb_sh_exit_handler
| + ret=1
| + [ 1 != 0 ]
| + echo WARNING: exit code 1 from a shell command.
| + exit 1
| WARNING: exit code 1 from a shell command.
| NOTE: recipe ...-image-1.0-r0: task do_image_wic: Failed


Build works fine under fedora-39 based builders.

I see related discussions at 2024-01-18 ("shadow: link executables
statically for -native variant") but not after.


Seen on scarthgap bc793fa9d1fe24c102d91e97b7002b6e637cbfa5 and it seems
to be very reproducible (both the failure on ubuntu-20.04 and the success
on fedora-39).



Enrico

