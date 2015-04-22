Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 139496E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 13:51:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2015 06:51:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,623,1422950400"; d="scan'208";a="484185425"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2015 06:51:22 -0700
Message-ID: <1429710682.5183.14.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 22 Apr 2015 16:51:22 +0300
In-Reply-To: <11442871.jqCMSY985y@peggleto-mobl.ger.corp.intel.com>
References: <1429627794-28895-1-git-send-email-markus.lehtonen@linux.intel.com>
	<11442871.jqCMSY985y@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.11 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: extract: remove patches when S=WORKDIR
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
X-List-Received-Date: Wed, 22 Apr 2015 13:51:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paul,

On Tue, 2015-04-21 at 16:04 +0100, Paul Eggleton wrote:
> Hi Markus,
> 
> On Tuesday 21 April 2015 17:49:54 Markus Lehtonen wrote:
> > All local files from the layer, including patches, are added to to
> > srctree repository when S==WORKDIR. The patch files are useless as they
> > are automatically applied on top of the srctree by devtool.
> > 
> > This change causes devtool extract to remove these unnecessary (and
> > possibly confusing) patch file(s). The patches will be removed in one
> > single commit.
> > 
> > [YOCTO #7602]
> > 
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  scripts/lib/devtool/standard.py | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index a50a771..41bcf86 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -248,6 +248,26 @@ def _extract_source(srctree, keep_temp, devbranch, d):
> >              else:
> >                  os.rmdir(patchdir)
> > 
> > +        # Find local patches that were "unpacked" to srctree directory
> > +        patches = []
> > +        for uri in (crd.getVar('SRC_URI', True) or "").split():
> > +            if uri.startswith('file://'):
> > +                fname = os.path.basename(uri).split(';')[0]
> > +                # Take patch "basename" without the possible compression
> > +                # extension (.gz etc)
> > +                match = re.match(r'^(.+\.patch)(\..+)?$', fname)
> > +                if match:
> > +                    patches.append(match.group(1))
> 
> Could you please use get_recipe_patches() from recipeutils.py for this? 
> There's some logic in there that I'd rather we didn't re-implement.

OK. Fixed in v2 of the patch.

Thanks,
  Markus


