Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8B16D2F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 08:26:16 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1Vigd4-0006I2-Fy; Tue, 19 Nov 2013 09:26:17 +0100
Message-ID: <1384853093.3814.56.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Yi Qingliang <niqingliang2003@gmail.com>
Date: Tue, 19 Nov 2013 09:24:53 +0000
In-Reply-To: <2838381.LbivOYPPzY@yiqingliang-pc>
References: <2838381.LbivOYPPzY@yiqingliang-pc>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
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
	Content preview:  On Tue, 2013-11-19 at 07:21 +0800,
	Yi Qingliang wrote: > The
	stack trace of python calls that resulted in this exception/failure
	was: > File: 'sysroot_stage_all', lineno: 6,
	function: <module> > 0002:def sysroot_stage_all(d):
	> 0003: oe.path.copyhardlinktree(d.expand("/mnt/src/kl360- >
	build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
	> gitAUTOINC+5dbff4f559/image/usr/src/kernel"),
	d.expand("/mnt/src/kl360-
	> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4- >
	gitAUTOINC+5dbff4f559/sysroot-destdir//usr/src/kernel")) [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kernel build fail after update
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
X-List-Received-Date: Tue, 19 Nov 2013 08:26:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 07:21 +0800, Yi Qingliang wrote:
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'sysroot_stage_all', lineno: 6, function: <module>
>      0002:def sysroot_stage_all(d):
>      0003:    oe.path.copyhardlinktree(d.expand("/mnt/src/kl360-
> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/image/usr/src/kernel"), d.expand("/mnt/src/kl360-
> build/tmp/work/kl360-jilong-linux-gnueabi/linux-jilong/3.9.4-
> gitAUTOINC+5dbff4f559/sysroot-destdir//usr/src/kernel"))

I've been seeing this too (sporadically) and Martin also reported that
it afflicts one of his jenkinses.  What seems to be happening is that,
for unknown reasons, bitbake is omitting to run do_install() on the
kernel before calling do_populate_sysroot(), despite the fact that there
clearly is a declared dependency between these two tasks.

>I found one patch 'Use hardlinks for do_populate_sysroot for speed' 
>may be related with this error.

The failure only seems to occur with the kernel, whereas I think that
patch applies to all recipes.  But that's not to say it isn't related,
of course.  What makes you think that this is the problem?

p.



