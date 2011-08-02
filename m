Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoFGe-0001lS-0y for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 15:44:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72De1F0015711
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 14:40:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14658-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2011 14:39:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72Dds9I015705
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 14:39:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1spf+C=PFXWetPCfGJs_puQm_tpXFDYsBPVLwXx-oJA2QQ@mail.gmail.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
	<d16f8ea81d614e2dd5608cbf8b773de9764b8d56.1312182844.git.sgw@linux.intel.com>
	<1312203836.2344.431.camel@rex>
	<BD97115A-63EB-467F-AA18-3ECAEBA017E3@kernel.crashing.org>
	<20110801173429.GC7798@sakrah.homelinux.org>
	<917D82F8-94FC-4311-A7D3-5B07589ED4B5@kernel.crashing.org>
	<CAMKF1spf+C=PFXWetPCfGJs_puQm_tpXFDYsBPVLwXx-oJA2QQ@mail.gmail.com>
Date: Tue, 02 Aug 2011 14:39:37 +0100
Message-ID: <1312292377.2344.594.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 13/22] sanity: Dont throw a warning if TUNE_PKGARCH is in PACKAGE_ARCHS twice
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
X-List-Received-Date: Tue, 02 Aug 2011 13:44:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 11:59 -0700, Khem Raj wrote:
> On Mon, Aug 1, 2011 at 11:51 AM, Kumar Gala <galak@kernel.crashing.org> wrote:
> >
> > On Aug 1, 2011, at 12:34 PM, Khem Raj wrote:
> >
> >> On (01/08/11 09:11), Kumar Gala wrote:
> >>>
> >>> On Aug 1, 2011, at 8:03 AM, Richard Purdie wrote:
> >>>
> >>>> On Mon, 2011-08-01 at 00:36 -0700, Saul Wold wrote:
> >>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>>>> ---
> >>>>> meta/classes/sanity.bbclass |    8 +++++---
> >>>>> 1 files changed, 5 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> >>>>> index 999e15d..dc11c9e 100644
> >>>>> --- a/meta/classes/sanity.bbclass
> >>>>> +++ b/meta/classes/sanity.bbclass
> >>>>> @@ -383,12 +383,14 @@ def check_sanity(e):
> >>>>>    dups = []
> >>>>>
> >>>>>    for pa in pkgarchs.split():
> >>>>> -          if seen.get(pa, 0) == 1:
> >>>>> +  if pa == tunepkg:
> >>>>> +      tunefound = True
> >>>>> +            if seen.get(pa, 0) == 1:
> >>>>> +               pkgarchs.remove(pa)
> >>>>> +          elif seen.get(pa, 0) == 1:
> >>>>>        dups.append(pa)
> >>>>>    else:
> >>>>>        seen[pa] = 1
> >>>>> -  if pa == tunepkg:
> >>>>> -      tunefound = True
> >>>>>
> >>>>>    if len(dups):
> >>>>>       messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
> >>>>
> >>>> How about we don't put duplicates in there in the first place?
> >>>>
> >>>> Which board/tune files is this occurring with?
> >>>
> >>> Yeah, not sure about this one, I added the sanity check to find this early.  Ran into issues with my PPC patch set and took a while to find (thus figured a sanity check made sense to check early on).
> >>
> >> I think the issue is when TUNE_PKGARCH does not end up in the
> >> PACKAGE_ARCHS and then package managers dont pick the ipks/rpms/debs
> >> which are under that dir in deploy/ipk.
> >> Usually we have been doing += to PACKAGE_EXTRA_ARCH
> >> variable in layers but with latest tune overhaul += does not work
> >> and we have to do _append/_prepend. I dont know if that is Kumar's
> >> original problem
> >
> > Yeah, its why I added the sanity check to make sure TUNE_PKGARCH was in the PACKAGE_ARCHS list.
> 
> right now ppc is bitten by this issue. I cannt build images for qemuppc
> in oe-core atm since TUNE_PKGARCH = "powerpcppc603e" and therefore ipks
> are put in the subdir with same name which opkg does not know about
> powerpcppc603e as a PACKAGE_ARCH so doesnt search this subdir for
> packages.

I'm fine with the sanity check, thats great and I merged that. What I
don't like is automagically removing duplicates. The variable is order
sensitive and who do we know which one to remove?

Cheers,

Rcichard



