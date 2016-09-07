Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEB4762B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 21:07:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 07 Sep 2016 14:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; d="scan'208";a="1052787674"
Received: from myeap-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.149])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2016 14:07:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Date: Thu, 08 Sep 2016 09:07:52 +1200
Message-ID: <3071986.dgRiYBiJ1X@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.2-101.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1e9475f4422447368ffc76229252acbc@XBOX04.axis.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
	<2374b44b9289aea7fc23c47a71af0526416ec3a8.1473155977.git.paul.eggleton@linux.intel.com>
	<1e9475f4422447368ffc76229252acbc@XBOX04.axis.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] recipetool: create: support git submodules
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
X-List-Received-Date: Wed, 07 Sep 2016 21:07:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ola,

On Wed, 07 Sep 2016 06:23:15 Ola x Nilsson wrote:
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Paul Eggleton
> > Sent: den 6 september 2016 12:03
> > 
> > Ensure we fetch submodules and set SRC_URI correctly when pointing to a
> > git repository that contains submodules.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  scripts/lib/recipetool/create.py | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/lib/recipetool/create.py
> > b/scripts/lib/recipetool/create.py index a08352e..7cbd614 100644
> > --- a/scripts/lib/recipetool/create.py
> > +++ b/scripts/lib/recipetool/create.py
> > 
> > @@ -399,6 +399,11 @@ def create_recipe(args):
> >                      if '<html' in f.read(100).lower():
> >                          logger.error('Fetching "%s" returned a single
> >                          HTML page - check
> > 
> > the URL is correct and functional' % fetchuri)
> > 
> >                          sys.exit(1)
> > 
> > +        if os.path.exists(os.path.join(srctree, '.gitmodules')) and
> > srcuri.startswith('git://'):
> > +            srcuri = 'gitsm://' + srcuri[6:]
> > +            logger.info('Fetching submodules...')
> > +            bb.process.run('git submodule init', cwd=srctree)
> > +            bb.process.run('git submodule update', cwd=srctree)
> 
> This is not how the gitsm fetcher does it.
> 
> git submodule update --init --recursive
> 
> will actually fetch all submodules recursively.

Right, we should indeed be doing that. I've pushed a new commit to the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

