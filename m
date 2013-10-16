Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6AF6C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 10:08:21 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r9GA8J7e029478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 12:08:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1381918101;
	bh=wYo0QvlUWbNAw8hWXKqMCe3+u1CAlo5RNYz3mGaNwjA=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=hswyU0ZauG1oI5j/BPtrJMFsWCDoSgDrfZXGyVy7iQYXTzMkREzjT/XHVEorOgYzL
	1PLaaeLLt3H1SUeI5C8GYwLgF1SbUalPJyg+VdN1PUhlXJY/yA8ect/pODpRn19xb2
	rzRsBE0/u5P4SBtUEA5nJl3U5r8o5gfrTmsPLLf4=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r9GA8F0n016306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 12:08:15 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VWO1W-0005yK-HY
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Oct 2013 12:08:14 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1381824734-2946-1-git-send-email-rongqing.li@windriver.com>
	<E0C668BE-B0FA-4BE0-91E9-BB779A8ABDC3@dominion.thruhere.net>
	<525DE1D4.40109@windriver.com>
	<EF2228FC-1E37-435B-A76A-426E585A2E0E@dominion.thruhere.net>
	<525E57FA.6000200@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 16 Oct 2013 12:08:14 +0200
In-Reply-To: <525E57FA.6000200@windriver.com> (Rongqing Li's message of "Wed, 
	16 Oct 2013 17:10:18 +0800")
Message-ID: <lyppr5plyp.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Wed, 16 Oct 2013 10:08:22 -0000
Content-Type: text/plain

Rongqing Li <rongqing.li-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
writes:

>>>> ConditionKernelCommandLine!=root=/dev/nfs
>>>> >>
>>> >
>>> >What is your meaning?
>> That's you are creating a huge script that does something built into systemd.
>>
>
>
> Yes, I can not find a way to avoid to that,
>
> Do you have any advice?

I would split the cmdline generation into a dedicated one-shot service;
e.g. modify the original connman.service to have something like

  [Service]
  EnvironmentFile = -/run/connmand.env
  ExecStart=/usr/sbin/connmand -n ${CONNMAND_OPTS}


The '/run/connmand.env' is created by a service with

  [Unit]
  Before = connman.service
  ConditionKernelCommandLine!=root=/dev/nfs
  
  [Service]
  Type = oneshot
  ExecStart = /usr/sbin/create-run-connmand.env

  [Install]
  WantedBy = connman.service



Enrico

