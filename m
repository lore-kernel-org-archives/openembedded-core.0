Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYJ9l-0006As-Hc for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 16:11:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7F4ilW015522;
	Wed, 7 Dec 2011 15:04:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15455-01; Wed,  7 Dec 2011 15:04:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7F4ZSX015516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 7 Dec 2011 15:04:36 GMT
Message-ID: <1323270287.30601.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 15:04:47 +0000
In-Reply-To: <4EDF4D98.7060803@emagii.com>
References: <4EDF2360.7090402@emagii.com> <1323249403.19363.66.camel@ted>
	<4EDF4D98.7060803@emagii.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Possible stale tags in the download directory
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
X-List-Received-Date: Wed, 07 Dec 2011 15:11:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 12:27 +0100, Ulf Samuelsson wrote:
> On 2011-12-07 10:16, Richard Purdie wrote:
> > On Wed, 2011-12-07 at 09:27 +0100, Ulf Samuelsson wrote:
> >> When I look at the "downloads" location I find a lot of files called.
> >>
> >> "11_usagi_fix.patch.done"
> >>
> >> but no  "11_usagi_fix.patch" file in the directory.
> >>
> >> If this is a indication of that a patch has been downloaded,
> >> what happens if you for some reason or other delete your
> >> OE-core directory and keep the downloads directory.
> >>
> >> When you start from fresh, all the tags are then stale.
> >>
> >> (Deleting the "downloads" directory seems a bad idea)
> >>
> >> I think that if there should be tags in the "downloads" directory,
> >> they should only reflect things which are downloaded to the
> >> "downloads" directory, and nothing else.
> >>
> >> As for the tags in the directory, I think a better approach
> >> is to download a file "tarball.tar.bz2" to a different filename first
> >> I.E: "tarball.tar.bz2.in-progress"  and if the download completes
> >> then move the file to "tarball.tar.bz2".
> >> Should remove a lot of clutter from the "downloads" directory.
> > What we've tried to do is simplify the fetcher code paths in fetch2.
> > There were some many corner/special cases and different code paths it
> > was near impossible to tell what was going on. One of the side effects
> > is that local file:// urls do touch the done stamp in the same way as
> > other downloads. The main reason for those files is now checksum
> > tracking. If the done stamps were part of tmpdir, we'd keep checksumming
> > the contents of the downloads at each build rather than once after the
> > download. The way the implementation works, there is very little risk
> > from stale stamps, it would just mean the checksum code wouldn't get
> > triggered and that is likely unneeded for a local file:// url anyway.
> >
> > So yes, its not ideal but looking at the code I'd be surprised if a
> > build ever broke due to it.
> >
> Maybe I am paranoid, but I think I remember seeing tarballs developing
> bit rot when moved between different machines.

I don't understand what you mean here. If your process for copying files
between machines corrupts files, you have bigger problems. You can just
rm *.done at the same time if that is an issue.

> Could of course clean out the downloads directory, but it would be
> nice if the stamps would be in a different directory.
> Then I just delete the directory when I move the tarballs.
> 
> I tend to use the "downloads" directory for other build systems as well,
> to avoid duplication, and having stamps in the directory could have
> real bad effects.
> 
> I agree that recomputing checksums for each build is not so good,
> but doing it once after moving to a new machine, or for each new user
> is acceptable (at least to me).
> 
> The stamps could be stored in a central location.
> 
>      "~/.oe/downloads"  ?

I believe the data the .done files represent is directly related to the
files themselves and they should be kept together.

Nothing said here is convincing me there is a real world problem...

Cheers,

Richard



