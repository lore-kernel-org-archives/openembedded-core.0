Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 65A0571C70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:42:22 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2REgNlk017739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 16:42:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1522161743;
	bh=7+3nnVva1jT2f+p+cgzNFj9acUyXi1bMz7Dghowbm5Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=j6DVa6m67pft8g5na901/AXPVwO0MQOnIn+1+t+Et+bFHLENjqgCeS1IsZ2IvUpte
	e4v5ffI7pe/gITiNu79WDqPjixSVgPK/oAvfJuSbHIr9OLw+Zlk3g7fS9njf2cmP83
	PacscvpSzsQyBlx0LDGW/leAFQq87BL4fT3rQ/HQ=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2REgHNI030232 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 27 Mar 2018 16:42:17 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 777EE611674;
	Tue, 27 Mar 2018 16:32:43 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	w2REg3Eq030224
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 27 Mar 2018 16:42:03 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.90_1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1f0pnX-0006cb-Dc; Tue, 27 Mar 2018 16:42:03 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Seebs <seebs@seebs.net>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
Date: Tue, 27 Mar 2018 16:42:03 +0200
In-Reply-To: <20180323112820.12bc94a4@seebsdell> (seebs@seebs.net's message of
	"Fri, 23 Mar 2018 11:28:20 -0500")
Message-ID: <lyy3idoa10.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.74
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.83
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 27 Mar 2018 14:42:26 -0000
Content-Type: text/plain

Seebs <seebs@seebs.net> writes:

> And so far as I know, it's not actually *possible* to in the general
> case. I really don't think it's safe to try to catch syscall().

I think, something like

----
static void (*orig_syscall)();
long syscall(long number, ...)
{
        switch (number) {
        case __NR_renameat2: return _renameat2_syscall(.......);
        }
        
 	void	*res =__builtin_apply(orig_syscall, __builtin_apply_args(),
				      sizeof(uintmax_t) * 7);

	__builtin_return(res);
}
----

will work to wrap syscall(2).  Params for _renameat2_syscall() can be
extracted by va_args.


Code generated above is very ineffective; perhaps you can create
specialized assembly instructions which just jump into orig_syscall.


Enrico

