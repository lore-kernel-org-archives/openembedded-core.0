Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A65326CD0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 10:53:32 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VWlCv-0001qs-Dr; Thu, 17 Oct 2013 12:53:33 +0200
Message-ID: <1382007212.484.53.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Ming Liu <ming.liu@windriver.com>
Date: Thu, 17 Oct 2013 11:53:32 +0100
In-Reply-To: <525FBBBA.3000405@windriver.com>
References: <1382004192-12678-1-git-send-email-ming.liu@windriver.com>
	<1382004192-12678-2-git-send-email-ming.liu@windriver.com>
	<1382004711.484.47.camel@phil-desktop.brightsign>
	<525FBBBA.3000405@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 2/2] screen: add pkg_postinst to register entry to /etc/shells
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
X-List-Received-Date: Thu, 17 Oct 2013 10:53:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-10-17 at 18:28 +0800, Ming Liu wrote:
> On 10/17/2013 06:11 PM, Phil Blundell wrote:
> > On Thu, 2013-10-17 at 18:03 +0800, Ming Liu wrote:
> >> +pkg_postinst_${PN} () {
> >> +	touch $D${sysconfdir}/shells
> >> +	grep -q "${bindir}/screen" $D${sysconfdir}/shells || echo ${bindir}/screen >> $D${sysconfdir}/shells
> >> +}
> > Is that "touch" really desirable?  It seems as though screen ought not
> > really to be creating /etc/shells if it isn't there already,
> No, it's supposed to be created if /etc/shells doesn't exist already, 
> otherwise, how could we echo text to it?

I guess there are two things to say about this:

1) not everybody wants /etc/shells, and having screen (or any other
recipe) create that file unilaterally seems like a bad thing.
Especially since there doesn't seem to be any corresponding postrm to
clear it up if screen is then removed again, nor is /etc/shells
mentioned in CONFFILES.

2) even if you did want to create /etc/shells, the touch is unnecessary
because "echo foo >> FILE" is perfectly capable of creating the FILE if
it didn't already exist.

p.



