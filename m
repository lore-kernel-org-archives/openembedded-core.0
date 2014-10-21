Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id C0D3360672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 10:03:50 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s9LA3jEk022364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 12:03:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1413885828;
	bh=v7QpkSL9/g8FsMyyUSnmPjTvF3EL9tTmcVvbXbzowpo=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=PXGK2sSrH9P00Alr7j97+xRyzZpZdX1Z5TvDn4kQJ4JafTOTxHPne8TggZWZ2SKVD
	XtQl8sbVrXANwBw3UciFRf+Xivi6iSYlyUTzOnz/E9IH4WJAel3d8S58N6ZTw3w8RX
	efM7Vv5ZjzueZLxAF0SX7vLNxWQHjbnMTYoMzKII=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s9LA3e6Z029381
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 12:03:43 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XgWHy-0007uu-Ed
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Oct 2014 12:03:38 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1413829859-8489-1-git-send-email-jeffrey.honig@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 21 Oct 2014 12:03:38 +0200
In-Reply-To: <1413829859-8489-1-git-send-email-jeffrey.honig@windriver.com>
	(jeffrey's message of "Mon, 20 Oct 2014 14:30:59 -0400")
Message-ID: <ly7fzteo3p.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.7
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH] Refuse to run bitbake on a kernel that is too old.
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
X-List-Received-Date: Tue, 21 Oct 2014 10:03:53 -0000
Content-Type: text/plain

<jeffrey.honig-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> Bitbake.conf now specifies OLDEST_KERNEL to insure that the SDK is
> not run on a kernel that is not supported by a component of the SDK
> (i.e. glibc).

OLDEST_KERNEL is used in glibc recipe only; it would be much better
to build SDK's glibc with an --enable-kernel matching the target
distribution.  E.g. by setting a special 'OLDEST_KERNEL_nativesdk'
variable.

> +    # Check that our kernel will work for crosssdk

This check should be made overridable for environments which do not
build SDKs.

> +    if os.uname()[0] == "Linux" and LooseVersion(os.uname()[2]) < LooseVersion(d.getVar('OLDEST_KERNEL')):

This check does not work when you build e.g. in an LXC container.  You
could define something like

| SDK_UNAME ??= "${@' '.join(os.uname())}"

and do the checks on this.


Enrico

