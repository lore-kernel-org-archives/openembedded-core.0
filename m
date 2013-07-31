Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 9C14D6077F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 10:05:21 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6VA5KNn014445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 31 Jul 2013 12:05:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1375265120;
	bh=bsupiq+tGXBe7Gh/fi/R5heS6lJeLWPSBdaiHjSYJqM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=KiiTU7JoAPewhvRX3yWUuzWyOwXsAXXUgz2ie5+9D+rVbiKdMn0e1Q8MIEqCYhC9R
	7I8AKkqaGKppGu8SNularj+ZktL5iqULV4P0Uga9DOWNA1B5UXdapbuvLp8FYqetpz
	iDNEAJ4pcjyBYZLp8nmvkWaGmRlD4wfyVDVTdiUg=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6VA5E5j009688
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 31 Jul 2013 12:05:15 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1V4THO-00083i-HH; Wed, 31 Jul 2013 12:05:14 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1374823720.git.wenzong.fan@windriver.com>
	<e44d86edd598d06c444ea5cde10b50a1cd1727e3.1374823720.git.wenzong.fan@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Wed, 31 Jul 2013 12:05:14 +0200
In-Reply-To: <e44d86edd598d06c444ea5cde10b50a1cd1727e3.1374823720.git.wenzong.fan@windriver.com>
	(wenzong's message of "Fri, 26 Jul 2013 03:35:55 -0400")
Message-ID: <ly38qvnixx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: wenzong.fan-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org
Subject: Re: [PATCH 1/1] ccache: allow CCACHE_DIR to be overriden
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
X-List-Received-Date: Wed, 31 Jul 2013 10:05:22 -0000
Content-Type: text/plain

<wenzong.fan-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> Use weaker assignment for CCACHE_DIR to allow users to override it
> if desired.
>
> -export CCACHE_DIR = "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
> +export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"

This can be a dangerous change and probably does not have the intended
effect ((project) global ccache dir) due to

| do_clean[cleandirs] += "${CCACHE_DIR}"


imo, this class should be removed completely (${PN} local ccache dirs do
not make any sense) and the only useful part

| CCACHE_DISABLE[unexport] = "1"

should be solved by http://patchwork.openembedded.org/patch/32787/



Enrico

