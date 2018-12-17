Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDB06C1FD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 22:30:21 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id x85-v6so12481047ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 14:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=f7+TYeETaT03qQ5DHL47yITYXirrNjoffoIW5PS52W8=;
	b=E/12FuNNtJF9057Z5t/d4etYMejWa18gG22z6zD+f7WJaXN6X58rW29bC+8rPvjYe7
	ZHRZOmBunnaWsh/Zihkr7D1Hgiy2jgaIxqzfKn0RbaBTYTlBOQXOm8C4wJP4XaGQchEa
	zcGjhNcXqvBdozlkvqe+i44d+zzEqS48hq6XyQrtuUpo9wYwEEew64dRIKfFzyEU+098
	2FufauwPaR74W4jAMWaCmR+KJuwDcrBeOe1vrd9bdtfI7H33OrOZQuACDTqK5sx5DcIc
	qaoAzwv5ENQ21wEkxDbXCdHVEv05F9zX7SdjvpBS9n1hqk5Ui6n/ycGPdYwcERjiMyJY
	S/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=f7+TYeETaT03qQ5DHL47yITYXirrNjoffoIW5PS52W8=;
	b=V0pMPBhKJYbL3RPvtdFiYJl4AYNdyEnNzsohUsz3AEDiXsQN2OASHDp9Rbi8fzefUI
	oCDnnuGtHP5y8N4WFQVMosuEaTeGK+87S9V31qLRwBQf0H5iLewUMv3YNGwKOKM8iPCc
	Vikw6CkPhm68Y4xzkyzgO3SZo08wUAwajKR/IGy1cL0FfHNUnpxF5qllwnSUI0X0trCM
	v9wuXe0nP2CB7pG7QcVePtlA4BSxZVkfMU2wJflXPCq9qB56XI/Vig5N2kcPNAgnjypZ
	IpRcjMGWIsW3E9I35dnFwf+VgTqoUfCErpG7YyWapU1yYdqAknlIQRs6YyO74AVWiwfk
	bfZw==
X-Gm-Message-State: AA+aEWZWxhKcPEZvyIleLxfX+Iv1hZaphJL4JZ0edqp255UQSBhigTyg
	ctj9obhYRgNfGodqUv+PZS8CwQcc
X-Google-Smtp-Source: AFSGD/ViP9j/tnEpJedBh10OVG63YHth+k18OpFf+icFmLiWkuoR35RQ7xUMfYqMqA01l24yqAWLXA==
X-Received: by 2002:a2e:4a19:: with SMTP id
	x25-v6mr8329811lja.19.1545085822218; 
	Mon, 17 Dec 2018 14:30:22 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm2691726ljg.32.2018.12.17.14.30.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Dec 2018 14:30:21 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 00:29:51 +0200
Message-Id: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] multilib: Fix and improve support in musl and glibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2018 22:30:22 -0000

Both changes target ldd helper handling in packages:

  1) For musl this fixes do_install error where ldd provided in both
     main target and multilib packages.

  2) For glibc make behaviour inline with musl by providing ldd
     via RRECOMMENDS and avoid filename clash as fixed in 1) for musl.

Build tested on IBM POWER8 running RHEL7 machine for ppc64p5 as main
target and ppcp5 as multilib with package lib32-glib-2.0 from Yocto
manual.

Boot tested as KVM-HV guest on IBM POWER8 machine.

Serhey Popovych (2):
  musl: Fix ldd symlink install in case of multilib
  glibc: Rename ldd in multilib package

 meta/recipes-core/glibc/glibc-package.inc | 7 ++++++-
 meta/recipes-core/musl/musl_git.bb        | 5 +++--
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.7.4


