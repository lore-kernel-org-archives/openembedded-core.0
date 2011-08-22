Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvUCY-0005Nb-88
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 15:06:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2011 06:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40588308"
Received: from unknown (HELO helios.localnet) ([10.255.18.106])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 06:01:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2011 14:01:15 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
	<20110819221653.GE22251@jama.jama.net>
In-Reply-To: <20110819221653.GE22251@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201108221401.15860.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Mon, 22 Aug 2011 13:06:02 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Friday 19 August 2011 23:16:53 Martin Jansa wrote:
> On Fri, Aug 19, 2011 at 03:11:08PM -0700, Chris Larson wrote:
> > On Fri, Aug 19, 2011 at 5:16 AM,  <martin.jansa@gmail.com> wrote:
> > > From: Martin Jansa <Martin.Jansa@gmail.com>
> > > 
> > > * if there is multiple .bbappend files with FILESEXTRAPATHS_prepend :=
> > > "/:" then the one parsed last is causing trailing ':' and that's
> > > causing empty element in path = extrapaths.split(:) + path
> > > * it's hard to keep all .bbappends from foreign layers to follow this
> > > rule, so it's better to be able to handle trailing ':'
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/classes/utils.bbclass |    5 +++--
> > >  1 files changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> > > index 56abdd8..3c2e342 100644
> > > --- a/meta/classes/utils.bbclass
> > > +++ b/meta/classes/utils.bbclass
> > > @@ -338,8 +338,9 @@ def base_set_filespath(path, d):
> > >        # The ":" ensures we have an 'empty' override
> > >        overrides = (bb.data.getVar("OVERRIDES", d, 1) or "") + ":"
> > >        for p in path:
> > > -               for o in overrides.split(":"):
> > > -                       filespath.append(os.path.join(p, o))
> > > +               if p != "":
> > > +                       for o in overrides.split(":"):
> > > +                               filespath.append(os.path.join(p, o))
> > 
> > You shouldn't use 'p != "":'. Instead, use the fact that the empty
> > string is false in boolean context.  'if p:'.
> > 
> > Of course, you could also use filter. path = filter(None, path) --
> > filtering an iterable with a function of None results in it dropping
> > all false values. But then, there's a tendency nowadays to avoid
> > map/filter/etc, so that's probably not best :)
> 
> does it apply to all != "" in utils.bbclass? because I've used it just
> because it's at least 3 times in this file already.. so to be consistent
> with the rest..

FWIW I agree with Martin; I wouldn't hold back the patch just for this reason 
- it's not incorrect code, it's consistent with the rest of the file, and we 
can easily clean these up later.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

- Paul
-- 

Paul Eggleton
Intel Open Source Technology Centre


