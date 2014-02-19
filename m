Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D53526E7D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 11:43:09 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WG5YT-0005oR-6x; Wed, 19 Feb 2014 12:43:09 +0100
Message-ID: <1392810188.14769.356.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Kai Kang <kai.kang@windriver.com>
Date: Wed, 19 Feb 2014 11:43:08 +0000
In-Reply-To: <1392807566-15114-1-git-send-email-kai.kang@windriver.com>
References: <1392807566-15114-1-git-send-email-kai.kang@windriver.com>
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Wed, 2014-02-19 at 18:59 +0800,
	Kai Kang wrote: > In update-rc.d.bbclass
	it checks variable INITSCRIPT_PACKAGES to avoid > inherit this class.
	But
	it is wrong logic to check INITSCRIPT_PACKAGES. > When 'sysvinit' is in
	'DISTRO_FEATURES', 
	INITSCRIPT_PACKAGES will not be > checked. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc.d.bbclass: fix inhibit check
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
X-List-Received-Date: Wed, 19 Feb 2014 11:43:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-19 at 18:59 +0800, Kai Kang wrote:
> In update-rc.d.bbclass it checks variable INITSCRIPT_PACKAGES to avoid
> inherit this class. But it is wrong logic to check INITSCRIPT_PACKAGES.
> When 'sysvinit' is in 'DISTRO_FEATURES', INITSCRIPT_PACKAGES will not be
> checked.

Er, really?  From the code you quoted...

>      # Check that this class isn't being inhibited (generally, by
>      # systemd.bbclass) before doing any work.
> -    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
> +    if oe.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) and \
>         not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
>          pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
>          if pkgs == None:

... it seems that if sysvinit is in DISTRO_FEATURES then the outer "if"
will evaluate to true and it will indeed proceed to check
INITSCRIPT_PACKAGES in the last quoted line.  Can you clarify what
exactly is wrong here?

p.



