Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id E3617728FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 12:11:14 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBJCB9Js021373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 19 Dec 2014 13:11:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418991072;
	bh=WdBWW8YMAx990/p7NAbOB/qsBZyRQm3BZK6LRvKaONo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=dU9LLO33PRfb6Way8LuzU0f1YqzLxjFJcr6/NFfKzSXskFb5Aw7DAXZo3NojZUtqo
	v7HRuh4ya6cgXQkMaNVFvcV0ODH2++scblGwAhFIfpIaWMpVHtFIBmYItGFCZ84+Ry
	2ToE6WK0hnlrxx2ctG1LYjFSzLL0bNDBzV/rEakA=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBJCB4ep023977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 19 Dec 2014 13:11:04 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y1wOc-0008KQ-BT; Fri, 19 Dec 2014 13:11:02 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	<lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418989891.13316.10.camel@linuxfoundation.org>
Date: Fri, 19 Dec 2014 13:11:02 +0100
In-Reply-To: <1418989891.13316.10.camel@linuxfoundation.org> (Richard Purdie's
	message of "Fri, 19 Dec 2014 11:51:31 +0000")
Message-ID: <ly7fxnon55.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Fri, 19 Dec 2014 12:11:18 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> In our usecase we build usually two kernels: a full featured one for
>> the main system and a minimal, initramfs based for a rescue system.
>> 
>> With this change and building both kernels, it is ambiguous which
>> System.map is used.
>
> Regardless of how you do this, if you build two kernels, you still need
> to choose one to build the main set of modules against. I'm therefore
> not sure how this change makes anything particularly worst than what
> existed before?

A I see... previously I did

| do_install[noexec] = "1"

in the rescue kernel and only the main kernel's System.map, .config... were
staged into the sysroot.  This can be done now too, but building secondary
kernels fails with

| .../usr/src/kernel is not clean, please run 'make mrproper'


> Building two kernels is currently fraught with difficulty anyway,

It was not so difficulty... Removing the "virtual/kernel" provider and
changing names of deployed files should do it with the old classes.


> to the point of not being a currently well supported use case and the
> classes would probably need to be refactored to allow such things to
> be well supported. These changes do bring significant benefit

Does some lowered i/o really provide such a benefit?  With the new
system you are bypassing the excellent staging system (which would
detect e g ".config" or "System.map" file conflicts). Afais, it breaks
with "rm_work" too (I guess, kernel:fetch stamp is removed when kernel
build finishes and packages which inherit "kernelsrc" fetch the kernel
sources (without .config and System.map) again).



Enrico

