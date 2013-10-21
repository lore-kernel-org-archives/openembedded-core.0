Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id E21436D191
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 09:42:25 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r9L9gLQs016798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:42:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1382348544;
	bh=tGf7QZ0GvGu0gq096zzVgL35hDGbXonSbSOyYAJwcYY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=D00TVrEqDZnpLJtnU+fpESb1f2r5F+bWkgAr6xqAXgJHAsoKnmcsAqNHNsurMtBzn
	lEa73rQ5D6+mRH/SeKpGXr9Jr8Vtk7wuw7kuLDI01bFjtLePk64aApaiIHs/4VrlZq
	Rd/b1eQQE+5TBcnVL/5MRY8erwunvwssWfjuOcSA=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r9L9gDZO012568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:42:14 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VYC04-0007lV-US
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Oct 2013 11:42:13 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 21 Oct 2013 11:42:12 +0200
Message-ID: <lyy55nhsej.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: How to set PACKAGECONFIG + proposal
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
X-List-Received-Date: Mon, 21 Oct 2013 09:42:27 -0000
Content-Type: text/plain

Hi,

recent packaging uses lots of different ways how PACKAGECONFIG is set:

a)  PACKAGECONFIG ??= "<something>"

b)  PACKAGECONFIG ?= "<something>"

and similar variations for special classes

c)  PACKAGECONFIG_class-target ??= "<something>"

d)  PACKAGECONFIG_class-target ?= "<something>"

Sample c) causes problems (see 8994ff6650a4c4c2f0b07e5ee6a5f889270151e5)
and at least me does not see why it is going wrong.  It is unclear to me
either why some packages uses a), other b).

To avoid nasty surprises; I would prefer to avoid cases c) and d) or
even ban the usage of '?=' completely when assigning _overrides.

As "<something>" is calculated sometimes in non trivial ways and contains
requirements instead of user configurable features, I suggest to write

  DEFAULT_PACKAGECONFIG = "<something>"
  DEFAULT_PACKAGECONFIG_class-target = "<something>"

  PACKAGECONFIG ??= "${DEFAULT_PACKAGECONFIG}"
 
at least when case c) or d) were used.  Using '??=' or '?=' is debatable
but should be consistent across the distribution.


Opinions?



Enrico

