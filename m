Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id D50877D848
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 11:02:52 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x3GB2pW9022113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 13:02:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1555412572;
	bh=1PEW7gmOgEWt52tof07QFxBgiyTVPbot+wMW0/kvef8=; l=471;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=KmzDiRYDDEKSF4xK0Pa+ylWkqjUsk9qQtC7k5uq7vVPvWsh1kj7E1isxCPUBLMBJN
	gPym6nPHrCJxWiAM7Ox0lGJ/BZ/jQHKf4z1x5jrwHp2Pd4w0dFbaxNuLg2CGOJlAKP
	+YrwL6sIPr0+zuRfqrFfm0cVlaGH6Dcd4BwzRQWg=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x3GB1vpT023533 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 16 Apr 2019 13:02:03 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 86EC0907DF3;
	Tue, 16 Apr 2019 13:01:56 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	x3GB1tqp023521
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Tue, 16 Apr 2019 13:01:56 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.92) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1hGLqd-001O1Q-Ak; Tue, 16 Apr 2019 13:01:55 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie
	<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
References: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
	<6ca03a74bb0c22fb2f483afac0d9e8ec13d6e29d.camel@linuxfoundation.org>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 16 Apr 2019 13:01:55 +0200
In-Reply-To: <6ca03a74bb0c22fb2f483afac0d9e8ec13d6e29d.camel@linuxfoundation.org>
	(Richard Purdie's message of "Tue, 16 Apr 2019 11:22:39 +0100")
Message-ID: <lytveymcws.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: changqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: change default locale from C.UTF-8 to C
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
X-List-Received-Date: Tue, 16 Apr 2019 11:02:53 -0000
Content-Type: text/plain

Richard Purdie
<richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
writes:

>> current default locale is set to C.UTF-8, but glibc not support
>> locale C.UTF-8. so set to the default locale C.
>
> Doesn't your second patch mean we don't need this one?

C.UTF-8 instead of plain C has runtime costs because additional files
need to be read by services.

imo, plain C should be a PACKAGE_CONFIG option which is enabled by
default.


Enrico

