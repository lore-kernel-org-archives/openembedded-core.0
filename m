Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 56F9A6CF0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:34:57 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r9HAYsbI010896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 17 Oct 2013 12:34:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1382006097;
	bh=T0YMhOcNqcKzYNBeTGPHZb470unkTNFQW8Ew0v92Sdc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Mc91n9obcpDZCqF2JCVSGdgvZaln7KwL0k38OZbTxSFvjBwLHDN5iDMGgiXW+KMnL
	7zMYepP7gw34lSUJpp+SHyLUcNiyR00efE5H8fMwZ4ofIMhMNvyPDlfG6ZeBUUip59
	XDmWvwcYddKyul1Cf6c3DiNOT6CwyXg5Ur8gBB+4=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r9HAYj45017111
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 17 Oct 2013 12:34:46 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VWkui-0006l3-Lm; Thu, 17 Oct 2013 12:34:44 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Rongqing Li <rongqing.li@windriver.com>
References: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
	<E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
	<525DE1D4.40109@windriver.com>
	<EF2228FC-1E37-435B-A76A-426E585A2E0E@dominion.thruhere.net>
	<525E57FA.6000200@windriver.com>
	<lyppr5plyp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<525F598D.2010106@windriver.com>
Date: Thu, 17 Oct 2013 12:34:44 +0200
In-Reply-To: <525F598D.2010106@windriver.com> (Rongqing Li's message of "Thu, 
	17 Oct 2013 11:29:17 +0800")
Message-ID: <lyzjq8tccb.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.2
X-Spam-Level: ----
X-Spam-Tests: AWL,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Thu, 17 Oct 2013 10:34:58 -0000
Content-Type: text/plain

Rongqing Li <rongqing.li@windriver.com> writes:

>>> Do you have any advice?
>>
>> I would split the cmdline generation into a dedicated one-shot service;
>> e.g. modify the original connman.service to have something like
> ...
> I test your method, but failed to start connmand,
> it always report "hand over timeout", I think
> it is caused by which the script run slow.

strange; I just tested it with

--- connman.service ---
[Unit]
Description=Connection service
After=syslog.target
Wants = connman-env.service

[Service]
Type=dbus
BusName=net.connman
EnvironmentFile = -/run/connmand.env
ExecStart=/usr/sbin/connmand -n $CONNMAND_OPTS

[Install]
WantedBy=multi-user.target

--- connman-env.service ---
[Unit]
Before = connman.service
ConditionKernelCommandLine = root=/dev/nfs

[Service]
Type = oneshot
ExecStart = /bin/sh -c 'echo CONNMAND_OPTS=\\"--noipconfig=eth0\\" > /run/connmand.env'

[Install]
WantedBy = connman.service


which works fine. Of course, this is just a quick hack and needs some changes
(replacement of inline shell script, perhaps setting RemainAfterExit, using
'systemctl enable' instead of 'Wants = connman-env.service')




Enrico

