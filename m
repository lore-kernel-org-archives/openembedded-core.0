Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 2643E61FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 16:26:28 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6AGQS62000790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 10 Jul 2013 18:26:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1373473589;
	bh=p6MiqeosYkQrd87zvznZKsHQLt4SeT3GL0aav+lVyAg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=i3W2gqpzcXlb1fonhrZrQoFIx/KopO0V1yYlqzKiCWNDK9YzHCQbLTB499fn9XTY1
	bhD+BFgpZXfRU7Ip0ZN3RNv9TIa4En/rTNcH1AdYtfigjXtePHTSra57Q0EqQW64tK
	HUFAZEd/e54qzbca61dhfWSFk7oIusazCAYBDI2A=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6AGQOJr006774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 10 Jul 2013 18:26:25 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UwxDi-0008AL-9t; Wed, 10 Jul 2013 18:26:23 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1373325035-29814-1-git-send-email-sgw@linux.intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 10 Jul 2013 18:26:22 +0200
In-Reply-To: <1373325035-29814-1-git-send-email-sgw@linux.intel.com> (Saul
	Wold's message of "Mon, 8 Jul 2013 16:10:35 -0700")
Message-ID: <lysizmmle9.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2] util-linux: Use PACKAGECONFIG to control pam and system config options
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
X-List-Received-Date: Wed, 10 Jul 2013 16:26:30 -0000
Content-Type: text/plain

Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:

> The PACKAGECONFIG will ensure consistent enabling and disabling of the pam and systemd related
> options for configure and the correct dependencies
>
> v2: fixed PACKAGECONFIG line continuation grammar
>     added _class-target for PACKAGECONFIG to work on target only
> ...
> +PACKAGECONFIG_class-target ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> +                                ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "

This does not work here. d.getVar('PACKAGECONFIG', True) evaluates to 'None'
in the anonymous python function in base.bbclass so that non-systemd options
are selected in systemd distributions and packaging fails in a sanity check.

Using the less weak '?=' operator makes thing work as expected.



Enrico

