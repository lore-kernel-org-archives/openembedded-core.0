Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id E0BB9728E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:06:08 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBJB63Ks032024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 12:06:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418987167;
	bh=ucIH6hQIHjOWiPmT6WxOr4G6M0izmwD4qtk7bMZFV3Q=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=fcDoumJ1VFoozFOwwy6T5CnqQf3y+O/LPMbmxhMwZZ8PRii76p9XXpxAGs/7KYMzo
	AHR0gU5wETil78rHa5lqSnTDZiMS9xMFB6lxgW+NYeuXapHtwKXGdATNmAwDuEJDXW
	PsKWz9Kmb1154WFVZ/IiFVymzE0jfGQGAXtJY2C4=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBJB5vxi013932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 12:05:58 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1Y1vNc-0001Sj-VZ
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Dec 2014 12:05:57 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 19 Dec 2014 12:05:56 +0100
In-Reply-To: <0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	(Bruce Ashfield's message of "Wed, 10 Dec 2014 05:34:03 -0500")
Message-ID: <lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Fri, 19 Dec 2014 11:06:13 -0000
Content-Type: text/plain

Bruce Ashfield <bruce.ashfield-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
writes:

> With the kernel build optimizations, we no longer copy the source from
> the built kernel into the staging dir, since the kernel is unpacked and built
> directly from the staging dir.
>
> This means that a few build artifacts need to be restored to allow out of
> tree modules to once again build.
> ...
> +	
> +	# Copy files required for module builds
> +	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> +	cp Module.symvers $kerneldir/
> +	cp .config $kerneldir/

This and the following lines seem to void the whole idea of the patchset
because it means that only one kernel can be built.  In our usecase we
build usually two kernels: a full featured one for the main system and a
minimal, initramfs based for a rescue system.

With this change and building both kernels, it is ambiguous which
System.map is used.



Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

