Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QlIAj-0004Nw-Tx
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 12:14:02 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p6P9vaFA004940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Jul 2011 11:57:37 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Mon, 25 Jul 2011 11:57:36 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1311191810.git.tom_rini@mentor.com>
	<7add784e793424e835ea062df57713257e42481b.1311191810.git.tom_rini@mentor.com>
Date: Mon, 25 Jul 2011 11:57:35 +0200
In-Reply-To: <7add784e793424e835ea062df57713257e42481b.1311191810.git.tom_rini@mentor.com>
	(Tom Rini's message of "Wed, 20 Jul 2011 13:50:45 -0700")
Message-ID: <lyfwluk7hs.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.9
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Cc: Tom Rini <tom_rini-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/1] siteinfo.bbclass: Port over oe.dev logic for site files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 10:14:02 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <tom_rini-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> writes:

> +python () {
> +    sitedata = set(siteinfo_data(d))
> +    if "endian-little" in sitedata:
> +        d.setVar("SITEINFO_ENDIANESS", "le")
> +    elif "endian-big" in sitedata:
> +        d.setVar("SITEINFO_ENDIANESS", "be")

Assigning SITEINFO_ENDIANESS in this way seems to break build of cross
packages (binutils, gcc).  E.g. for xscale (--> armv5te), these packages
will be build for armv5teb. This happens because tune-xscale.inc uses an
(unsafe)

| BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"

statement. As there seems that something wents wrong when setting
SITEINFO_ENDIANESS in an anonymous python function, 'armv5teb' will be
assumed.

Using a more safe construct like

| BASE_PACKAGE_ARCH = "${@{'le' : 'armv5te', 'be' : 'armv5teb'}[ \
|                        bb.data.getVar('SITEINFO_ENDIANESS', d, 1)]}"

reveals that SITEINFO_ENDIANESS is undefined when expression is evaluated.

I am using bitbake master (5c8eeefc79455f058dda8f04cf4c12dc5418e00f).



Enrico


