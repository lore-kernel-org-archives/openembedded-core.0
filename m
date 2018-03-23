Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id E018C78526
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 15:43:21 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NFhMEI028783
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 16:43:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1521819802;
	bh=dqiFp6dud2fTpQ67V5cHia5I8F86LDjELqzUeNZxLHM=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=E1z2A/W1VK/NqUyY4oYP/rwy4rqvEHodcXO4YW1K94kamb8wIbSSx1kMifrbcCZM+
	OqVQs+YJPRuobBmN1U1U+ClQtwVVf10jDPu/nD6eMOn49ChTKmnZiLbFS3/vCSIV/g
	f08a01FzCqnxdF/Y4hzo+52dYAGs9djMBsDOWTPU=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NFhF2e003154 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 23 Mar 2018 16:43:16 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 335197DE485;
	Fri, 23 Mar 2018 16:33:57 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2NFhDK6003151
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Fri, 23 Mar 2018 16:43:14 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>) id 1ezOqX-00013r-QX
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2018 16:43:13 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 23 Mar 2018 16:43:13 +0100
In-Reply-To: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de> (Enrico
	Scholz's message of "Fri, 23 Mar 2018 16:33:38 +0100")
Message-ID: <lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.75
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.83
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 15:43:22 -0000
Content-Type: text/plain

Enrico Scholz
<enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
writes:

> in some packages (e.g. ncurses or glibc) I get package-qa warnings due
> to host user contamination; e.g.

can be reproduced by

---
LICENSE = "closed"

do_compile() {
	echo foo > bar
}

do_install() {
	install -D -p -m 0644 bar ${D}/bin/bar
	install -d -m 0755 ${D}/usr/bin
	mv ${D}/bin/bar ${D}/usr/bin/bar
	ln -s /usr/bin/bar ${D}/bin/bar
}

FILES_${PN} = "/bin/* /usr/bin/*"
---

WARNING: foo-1.0-r0 do_package_qa: QA Issue: foo: /foo/usr/bin/bar is owned by uid 505, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]



Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

