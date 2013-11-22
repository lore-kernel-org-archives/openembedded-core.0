Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC65616F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 11:41:04 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1Vjp6c-0002hx-VI; Fri, 22 Nov 2013 12:41:03 +0100
Message-ID: <1385120462.15760.33.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Qi.Chen@windriver.com
Date: Fri, 22 Nov 2013 11:41:02 +0000
In-Reply-To: <8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
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
	Content preview:  On Fri, 2013-11-22 at 13:39 +0800,
	Qi.Chen@windriver.com wrote:
	> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel >
	can get built by default. Otherwise,
	the kernel will not get built > unless it's
	required by other packages like v86d. As a result,
	if > we build 'core-image-minimal'
	for qemumips, the kernel is not built,
	> and we have 'bitbake linux-yocto'
	before we can use runqemu to start > the target. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: depends on virtual/kernel
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
X-List-Received-Date: Fri, 22 Nov 2013 11:41:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 13:39 +0800, Qi.Chen@windriver.com wrote:
> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
> can get built by default. Otherwise, the kernel will not get built
> unless it's required by other packages like v86d. As a result, if
> we build 'core-image-minimal' for qemumips, the kernel is not built,
> and we have 'bitbake linux-yocto' before we can use runqemu to start
> the target.

Not all images do actually need a kernel, and this will cause a
dependency loop for old-style initramfs images that are dependencies of
virtual/kernel itself.

If you just want to ensure that the kernel is available at deployment
time, perhaps you could make virtual/kernel be a dependency of do_deploy
specifically (rather than do_configure as you have it here).
Alternatively, if this is a specific problem for core-image-minimal,
maybe the virtual/kernel dependency should just go in there.

p.


