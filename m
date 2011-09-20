Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R672y-00010d-A2 for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 22:36:04 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KKaxlk001752 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 21:36:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M4MI3MelEVCI
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 21:36:59 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8KKanai001743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 21:36:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Sep 2011 21:30:35 +0100
In-Reply-To: <4E78E508.9080706@windriver.com>
References: <CALT56yOyp2VYEziGiZj4PLjYHFhTkxisKwWnP7_Uy69Cc1ufYw@mail.gmail.com>
	<4E78E508.9080706@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316550641.14488.61.camel@ted>
Mime-Version: 1.0
Subject: Re: [RFC] policy proposal: INC_PR
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
X-List-Received-Date: Tue, 20 Sep 2011 20:36:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-20 at 14:10 -0500, Mark Hatle wrote:
> On 9/20/11 2:04 PM, Dmitry Eremin-Solenikov wrote:
> > Hello, colleagues,
> > 
> > While debugging some stuff in oe-core & company I've noticed that
> > lot's of packages
> > either don't use INC_PR, or misuse it (e.g. .inc has INC_PR, but then
> > .bb just defines PR = "rX").
> 
> I've noticed similar things.  I'd agree, we should define and use INC_PR for
> items that have .inc files.  There have been many times that I need to fix a bug
> in the .inc file and end up manually updating the PR is 2 or 3 recipes that use
> the .inc.
> 
> One question though, how do we handle packages with multilib .inc files?
> 
> INC_PR += ...  (or is it .=)

I'm going to disagree here. I'd actually like to see the whole PR thing
become irrelevant. Its insane we have to spend so much time doing
something the system should be able to figure out for itself. It
currently serves two purposes:

1. Triggers rebuilds of packages when they change
2. Handles package feed upgrades correctly

For 1, we can use the sstate checksums and for 2, we can use some kind
of PR server, either local or networked.

I'm therefore proposing that after the current release is finished, we
enable the BasicHash signature generator (which adds the sstate
checksums to the stamp files) and stop bumping PR values (so INC_PR can
die and PR values can likely fade out of recipes). If the tooling we
have for 2 isn't enough we'll then just simply have to improve it and
make it work.

Comments?

Cheers,

Richard



