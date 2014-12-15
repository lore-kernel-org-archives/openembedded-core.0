Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 88DD665CD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:19:55 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBFGJoFa028106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:19:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418660394;
	bh=kymQ8Y3l55kxhPe8a+XcJwVsJc1WRrwJWvAcCdCG+FA=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=FyPboUoCj8XCvSJIAz53mT1OviP2ef1syhkZDYUP+ypoELpOenA+MgB1fKc0sCi3B
	zGqJas3jhi42ep6tm2MuhMllpjhAMoO7AWMRlMnaaCe7W6dHsUoCqnhsdOHNaal6yk
	A9Ok1m0khMG3znZ8vmSSCgDSjiR69lU1FaxEs4AQ=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBFGJji5014982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:19:46 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1Y0YN6-0003wL-VZ
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Dec 2014 17:19:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <548EBDE0.3080704@dresearch-fe.de>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 15 Dec 2014 17:19:44 +0100
In-Reply-To: <548EBDE0.3080704@dresearch-fe.de> (Steffen Sledz's message of
	"Mon, 15 Dec 2014 11:54:24 +0100")
Message-ID: <lyiohcubq7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
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
Subject: Re: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
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
X-List-Received-Date: Mon, 15 Dec 2014 16:19:59 -0000
Content-Type: text/plain

Steffen Sledz <sledz-mQBY8sqGERgRVMum7q6B+Q@public.gmane.org> writes:

> The first thing we observed was that the do_rootfs stage made a very
> big load (more than 500) on the machine but the cpu's aren't working
> for 100%. I could track down the problem to the call
> ...
> which eats swap space without end till the system crashes (more than 100GB swap space ist available).
>
> I've no idea how to inspect this problem further. Any ideas?

I had a similar issue when /var/tmp in the rootfs was an absolute symlink
pointing to toplevel /var/tmp which contained some millions of files.

Can you look (lsof) which files are open by qemu?


Enrico

