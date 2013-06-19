Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id A763A601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:33:27 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r5JAXO0q025910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Jun 2013 12:33:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1371638004;
	bh=Qg522vYcvdTDTPrO0vJw5Sa94TGnjIK46o4SdvDboE8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=JL8BU+LNlFB0p8Ry3EBycVsQJ2Vg2j3yxqqPhvBXp78s9jhQJxqvrNucHQU9IXGdn
	95y7XA0crkKoAAhh4nKv92I/Pv0puYFMYSsKkHd3T2p6DaZ/aXyGhvb/Tj6FUTcfn6
	qSRRJBzvRX2R+NFr51mtbgJAdVFRNepbK2i8NU74=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r5JAXK8Q000753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 19 Jun 2013 12:33:20 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UpFhX-0005mm-RD; Wed, 19 Jun 2013 12:33:19 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<5bc169404eddb0ec90ce82c6013432f295d0cdc3.1371621343.git.liezhi.yang@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 19 Jun 2013 12:33:19 +0200
In-Reply-To: <5bc169404eddb0ec90ce82c6013432f295d0cdc3.1371621343.git.liezhi.yang@windriver.com>
	(Robert Yang's message of "Wed, 19 Jun 2013 05:00:40 -0400")
Message-ID: <lyy5a675lc.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.4
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Robert Yang <liezhi.yang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH 2/3] package_ipk.bbclass: make DESCRIPTION support newline
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
X-List-Received-Date: Wed, 19 Jun 2013 10:33:28 -0000
Content-Type: text/plain

Robert Yang <liezhi.yang-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
writes:

> The recipe's DESCRIPTION is wrapped automatically by textwrap, make it
> support newline ("\n") to let the user can wrap it manually, e.g.:
>
> -                    ctrlfile.write('Description: %s\n' % summary)
> -                    ctrlfile.write('%s\n' % textwrap.fill(description, width=74, initial_indent=' ', subsequent_indent=' '))
> +                    for t in description.split('\\n'):
> +                        ctrlfile.write('%s\n' % textwrap.fill(t, width=74, initial_indent=' ', subsequent_indent=' '))

When user wrapped lines manually, why is textwrap.fill() called on the
lines again?  E.g. when user wrapped manually at 78 columns, this will
create long - short - long - short lines (in german, why call this
effect "Kammquoting" (comb quoting)) .

I suggest to avoid textwrap.fill() when text contains '\n'.



Enrico

