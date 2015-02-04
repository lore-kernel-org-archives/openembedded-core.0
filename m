Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 42F9E60017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 11:48:37 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	t14BmXkF021407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Feb 2015 11:48:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1423050516;
	bh=Z5EMDNqSvpD+Pq4B6KP9ltSbA/TaN8txGgRnXmQhvIM=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=eswL4V6oi8+JuXnLHt4zp50u5ZdGMiNbQJhdVkLWUX8CxpL0OByc4fI1MaqEHmZEr
	4i55216Sgv76lHgWKT75c/GC24UwHWsvm6gJu8tqKRqWlo3m7lCD6cIFEYM/3zla8k
	lk9jPfYsikCaeyzTKqt5pzxOcRUeQz3w3Jdkr3Xo=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id t14BmTbK029275
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Feb 2015 12:48:30 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.84) (envelope-from <ensc@sigma-chemnitz.de>) id 1YIyRf-0007OA-Db
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Feb 2015 12:48:35 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <bruno.bottazzini@intel.com>
	<1422987664-26903-1-git-send-email-bruno.bottazzini@intel.com>
	<1422987664-26903-2-git-send-email-bruno.bottazzini@intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 04 Feb 2015 12:48:35 +0100
In-Reply-To: <1422987664-26903-2-git-send-email-bruno.bottazzini@intel.com>
	(Bruno Bottazzini's message of "Tue, 3 Feb 2015 16:21:04 -0200")
Message-ID: <lytwz1zylo.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH] systemd: update version from 216 to 218
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
X-List-Received-Date: Wed, 04 Feb 2015 11:48:41 -0000
Content-Type: text/plain

Bruno Bottazzini <bruno.bottazzini-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> +PACKAGES =+ "${PN}-services-ask-password"
> +SUMMARY_${PN}-services-ask-password = "systemd's service and tool to
> query the user for a system password"
> +RRECOMMENDS_${PN}-services-ask-password = "${PN}-services-base"
> +FILES_${PN}-services-ask-password = "\
> +        ${rootprefix}/bin/systemd-ask-password \
> +        ${rootprefix}/bin/systemd-tty-ask-password-agent \
> +        ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
> +        ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
> +        ${systemd_unitdir}/system/systemd-ask-password-console.path \
> +        ${systemd_unitdir}/system/systemd-ask-password-console.service \
> +        ${systemd_unitdir}/system/systemd-ask-password-wall.path \
> +        ${systemd_unitdir}/system/systemd-ask-password-wall.service \
> +"

I think, enumerating services in this kind becomes a maintenance
nightmare.  E.g. you have to check for every future systemd version
whether service gets listed in a new .wants.  Using wildcards can
simplify this; e.g. see systemd_elito_populate_packages() in

          https://www.cvg.de/people/ensc/systemd_216.bbappend


Enrico

