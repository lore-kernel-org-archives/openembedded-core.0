Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id C28007039A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 18:32:19 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s6EIWGdV032496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 14 Jul 2014 20:32:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1405362739;
	bh=lvmbNa4ZfYA8HDj53SvPASnWtbEursC3PCtqZYmbuE8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=MPouISu4zmzkBNwCt/py73BVQ0voX07Ts50m1jkURV/Co3BgYjhZJCshNApTgsBVF
	u18DL0w7ApQxSmyiHjof2U7rk4pTUUFgr/EBBauUJ85BWmasQvoKYKgaTolYOxoM7W
	LiwVjxIWBNXHecEupSDWUlJuKXSH75aktlhXJOAQ=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s6EIWCZg020747
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 14 Jul 2014 20:32:13 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1X6l2p-0003z5-Vh; Mon, 14 Jul 2014 20:32:12 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Jate S <jatedev@gmail.com>
References: <1405349203-32702-1-git-send-email-jatedev@gmail.com>
	<lyzjgchs81.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAPphmgYUX828A=6SayztArEdU9L-=Hhfkw2w3mRw1ka_AmCWsw@mail.gmail.com>
Date: Mon, 14 Jul 2014 20:32:11 +0200
In-Reply-To: <CAPphmgYUX828A=6SayztArEdU9L-=Hhfkw2w3mRw1ka_AmCWsw@mail.gmail.com>
	(Jate S.'s message of "Mon, 14 Jul 2014 13:58:26 -0400")
Message-ID: <lylhrviyfo.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python2: Add PACKAGECONFIG for tkinter to support tk from meta-oe
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
X-List-Received-Date: Mon, 14 Jul 2014 18:32:31 -0000
Content-Type: text/plain

Jate S <jatedev@gmail.com> writes:

> Python 2.7.x does not use an explicit configure option for tk support.
> Instead, it tries to detect the tk and tcl libraries before compiling
> python-tkinter.

Your patch does not solve the issue of non-deterministic builds.  When
tk was added by some other way, python will get tkinter support although
PACKAGECONFIG was not set.

An idea to make build deterministic might be patching of detect_modules()
in setup.py to add disabled modules to 'missing'.  E.g.

|             missing.append('_tkinter')
| 
|+        missing.extend(os.environ('OE_HACK_MISSING').split())
|         return missing

Probably there are better/cleaner ways but I am not familar with python
distutils.


Enrico

