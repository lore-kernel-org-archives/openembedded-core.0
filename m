Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvX0a-0007c8-3v for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 16:33:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p24FW8HL001011
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2011 15:32:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00641-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2011 15:32:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p24FW0Pe001004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2011 15:32:00 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <75F3CD12-154B-44AC-8F3D-BE90C5D10153@dominion.thruhere.net>
References: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
	<1299247286.17567.1349.camel@rex>
	<75F3CD12-154B-44AC-8F3D-BE90C5D10153@dominion.thruhere.net>
Date: Fri, 04 Mar 2011 15:31:52 +0000
Message-ID: <1299252712.17567.1463.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: point PERSISTENT_DIR outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 15:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-04 at 15:26 +0100, Koen Kooi wrote:
> Op 4 mrt 2011, om 15:01 heeft Richard Purdie het volgende geschreven:
> 
> > On Fri, 2011-03-04 at 11:40 +0100, Martin Jansa wrote:
> >> * sanity check warning user that he still has peristent cache in old location
> >> * similar patch was sent to OE, to keep PERSISTENT_DIR location consistent
> >>  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/030623.html
> >> 
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> meta/classes/sanity.bbclass |    8 ++++++++
> >> meta/conf/bitbake.conf      |    2 +-
> >> meta/conf/sanity.conf       |    1 +
> >> 3 files changed, 10 insertions(+), 1 deletions(-)
> > 
> > When I saw this on the OE list, I'd assumed you'd done what Poky had
> > done, I've just realised you're moving this file to TOPDIR instead of
> > TMPDIR.
> > 
> > My big concern here is that we really shouldn't be writing to data to
> > the conf directory as its not what the user expects.
> > 
> > I say this knowing the raft of usability problems we've had every time
> > we take something outside of TMPDIR as users have the expectation that
> > deleting tmp wipes out all stored state and rebuilds. Having this file
> > hidden in the conf directory breaks that expectation. Note there are
> > only two things we place outside of TMPDIR, downloads and sstate data.
> 
> And pseudodone! That one nearly always trips me up :)

We should at least be a lot better about working out when that file is
valid these days. 

The reason for that file and its location is its near impossible to work
out where TMPDIR is in the general case without calling bitbake. Like
most good cache files, in that case we can now tell when its invalid and
rebuild it if it is missing for any reason with no really nasty
implications.

Cheers,

Richard




