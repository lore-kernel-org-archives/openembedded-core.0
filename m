Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7F765CF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 11:28:50 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s75BSnGI030697
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Aug 2014 13:28:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1407238131;
	bh=zG3IE3qqi+R8oNryCLZHL9/5Sanzcx/5KCmkwFc8l30=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=eG5yeBs6fwNCJymBLo86K0bdf8fm5M29kDu+m3atsjmCZD7cC9DOhsqLEvFAto9I2
	rmJ3P2qstUtYpmaOlMl4dBWxCn6T9r2B8QGMHspJce5hIATCmTPKXpGzoDfQWIzUrO
	/QK+GsqdoVoM+JLBfUMX5bHeSd6DltuppsUYgZXY=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s75BSjNx009558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Aug 2014 13:28:46 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XEcv7-0001SR-Bb
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Aug 2014 13:28:45 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.11.1408050640270.7701@localhost>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 05 Aug 2014 13:28:45 +0200
In-Reply-To: <alpine.LFD.2.11.1408050640270.7701@localhost> (Robert
	P. J. Day's message of "Tue, 5 Aug 2014 06:42:28 -0400 (EDT)")
Message-ID: <lysilbch02.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: i guess there's no way to *conditionally* add tasks?
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
X-List-Received-Date: Tue, 05 Aug 2014 11:28:51 -0000
Content-Type: text/plain

"Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
writes:

> addtask configure_ptest_base after do_configure before do_compile
> addtask compile_ptest_base   after do_compile   before do_install
> addtask install_ptest_base   after do_install   before do_package do_populate_sysroot
> ...
>     # Remove all '*ptest_base' tasks when ptest is not enabled
>     if not(d.getVar('PTEST_ENABLED', True) == "1"):
>         for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'do_install_ptest_base']:
>             bb.build.deltask(i, d)
>
>   so i'm guessing there's no way to conditionally add task(s) to avoid
> adding them, only to turn around and delete them, yes?

I solved similar issues by including files conditionally; e.g. above
would be

---
ptest_inc = "${@['noop', 'ptest'][d.getVar('PTEST_ENABLED', True) == '1']}"
include ptest-${ptest_inc}.inc

--- ptest-ptest.inc ---
addtask configure_ptest_base after do_configure before do_compile
addtask compile_ptest_base   after do_compile   before do_install
addtask install_ptest_base   after do_install   before do_package
do_populate_sysroot



Enrico

