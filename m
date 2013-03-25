Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul@paulbarker.me.uk>) id 1UK82n-0007rc-97
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 15:06:49 +0100
Received: from mail630.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id E6E56FF94E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 14:50:16 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Mar 2013 15:32:58 +0200
Received: from 94-192-12-83.zone6.bethere.co.uk (HELO
	b5-server.betafive.co.uk) (mail@betafive.co.uk@94.192.12.83)
	by ns0.ovh.net with SMTP; 25 Mar 2013 15:32:58 +0200
Received: from unknown (b5-desktop.betafive.co.uk [192.168.0.20])
	by b5-server.betafive.co.uk (Postfix) with ESMTP id 327B11601A6;
	Mon, 25 Mar 2013 13:32:26 +0000 (GMT)
Date: Mon, 25 Mar 2013 13:32:52 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Message-ID: <20130325133252.0000678c@unknown>
In-Reply-To: <1364217957.3097.43.camel@ted>
References: <1364172907-14541-1-git-send-email-paul@paulbarker.me.uk>
	<20130325125728.00004c11@unknown> <1364217957.3097.43.camel@ted>
X-Mailer: Claws Mail 3.7.8cvs47 (GTK+ 2.16.6; i586-pc-mingw32msvc)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 5911537461582072210
X-Ovh-Remote: 94.192.12.83 (94-192-12-83.zone6.bethere.co.uk)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -95
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrieejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfntfdqqdfkugfoihhnuhhstghulhgvshculdehmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -95
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiuddrieejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogfntfdqqdfkugfoihhnuhhstghulhgvshculdehmd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Gnupg recipe fixes
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
X-List-Received-Date: Mon, 25 Mar 2013 14:06:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 25 Mar 2013 13:25:57 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2013-03-25 at 12:57 +0000, Paul Barker wrote:
> > On Mon, 25 Mar 2013 00:55:05 +0000
> > Paul Barker <paul@paulbarker.me.uk> wrote:
> > 
> > > I'm setting up a signed apt repository of .deb packages built
> > > using OpenEmbedded and I've ran into an issue with apt-get on the
> > > target board not being able to find 'gpgv' to verify the
> > > signatures. This is installed as 'gpgv2' in the gnupg recipe.
> > > Therefore I've used update-alternatives to create the appropriate
> > > link.
> > > 
> > 
> > I've re-thought this already. Is update-alternatives the right
> > thing to use here? Maybe not as there isn't anything else that
> > provides gpgv and gnupg_1.* and gnupg_2.* probably can't co-exist
> > on the same install. I could just add a line to do_install_append()
> > to create the gpgv link manually, similar to how the link for gpg
> > is already created. Please let me know which is the better solution
> > here.
> > 
> > I also noticed that gnupg_1.4.7.bb splits gpgv into a separate
> > package but gnupg_2.0.19 doesn't. I could write a patch to modify
> > one of these to match the other if desired?
> 
> I glanced at this earlier and wondered what the alternative provider
> was. If we have no alternative, a symlink is fine.
> 
> I'm open to separate packaging of the utilities if its useful and they
> can use used one without the other. If we'd generally need both, they
> can exist in the same package fine.
> 
> Cheers,
> 
> Richard
> 

I'll put a new patch together to add the symlink. Does this warrant
incrementing PR?

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


