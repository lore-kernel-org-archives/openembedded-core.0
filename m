Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UbuPN-00014j-7d for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:11:27 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ubu7p-0004OK-Av; Mon, 13 May 2013 16:53:17 +0200
Message-ID: <1368456796.6920.23.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Mon, 13 May 2013 15:53:16 +0100
In-Reply-To: <5190CF63.2030303@r-finger.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
	<CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
	<5190CF63.2030303@r-finger.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 15:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-13 at 12:32 +0100, Tomas Frydrych wrote:
> On 13/05/13 12:06, Burton, Ross wrote:
> > The problem with bbappends is that they break every time the package
> > in oe-core changes version.
> 
> I see this as a good thing; if I maintain a bbappend, I want to know
> when the base package changes its a version, and I get an immediate
> error due to bbappend to a non-existent file.

Personally, for the .bbappends that I maintain, I would much rather not
have to go around renaming a bunch of files every time I merge a new
version of oe-core and all the recipes get upgraded. 

But, if you enjoy the errors, you could easily enough get them back even
if the filenames didn't change:

python() {
    tolerable_pvs = [ '1.0', '1.1', '1.2' ]
    pv = d.getVar('PV', True)
    if not pv in tolerable_pvs:
        bb.fatal("encountered intolerable version %s of underlying recipe, please adjust me accordingly" % pv)
}

or something.  One could wrap that in some extra sugar and put it in
base.bbclass if having the boilerplate in each .bbappend is unappealing.

p.




