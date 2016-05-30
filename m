Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8E579731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 11:26:31 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 30 May 2016 04:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,389,1459839600"; d="scan'208";a="112811961"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 30 May 2016 04:26:30 -0700
Message-ID: <1464607590.941.22.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 May 2016 14:26:30 +0300
In-Reply-To: <20160527100752.GA2570@jama>
References: <1464330370-6856-1-git-send-email-markus.lehtonen@linux.intel.com>
	<20160527100752.GA2570@jama>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] license.bbclass: do not process LICENSE_pn variables
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
X-List-Received-Date: Mon, 30 May 2016 11:26:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Martin,

On Fri, 2016-05-27 at 12:07 +0200, Martin Jansa wrote:
> On Fri, May 27, 2016 at 09:26:10AM +0300, Markus Lehtonen wrote:
> > The loop iterating over LICENSE_pn variables has never worked. In
> > addition, the LICENSE variable is supposed to contain all licenses
> > defined in LICENSE_pn variables.
> 
> Is this really true?

That's what I've been told: LICENSE is supposed to contain all licenses
and LICENSE_pn can be used to refine on per-package basis. But, that
said, I don't know if that has actually been documented anywhere except
perhaps in the bitbake manual which states that LICENSE is "The list of
source licenses for the recipe".



> I've seen couple examples where LICENSE variable is used as a
> "default"
> for most packages, and then only 1 package sets different LICENSE_pn.
> 
> Changing the semantics as you said would force people to define
> LICENSE_pn-dev
> LICENSE_pn-staticdev
> LICENSE_pn
> LICENSE_pn-dbg
> to foo when they have just one file in
> LICENSE_pn-blah
> which containd unwanted LICENSE bar
> 
> And then overall license will be "foo & bar"
> 
> There are real-world examples where there is one GPLv3 shell script
> we
> don't even need in LGPLv2 component - for now it was simple to move
> this
> script to separate package and set just LICENSE_pn-blah-script

Do you have any specific examples of packages like this? My current
understanding is that they use LICENSE and LICENSE_pn incorrectly, but
I might well be wrong. Also, I don't know if all the license checking
correctly applies to LICENSE_pn variables. In any case, I see you
point, it would be very convenient to have this "default binary
license". 

Whatever the outcome is, it probably would be good to add a sanity
checker for the usage if LICENSE* variables inside a recipe.


Thanks,
  Markus


> > Thus, it is simpler just to use LICENSE
> > as the data we get is essentially the same.
> > 
> > [YOCTO #9499]
> > 
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  meta/classes/license.bbclass | 16 +---------------
> >  1 file changed, 1 insertion(+), 15 deletions(-)
> > 
> > diff --git a/meta/classes/license.bbclass
> > b/meta/classes/license.bbclass
> > index 69335d6..eacf9e8 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -376,20 +376,6 @@ def find_license_files(d):
> >      import shutil
> >      import oe.license
> >  
> > -    pn = d.getVar('PN', True)
> > -    for package in d.getVar('PACKAGES', True):
> > -        if d.getVar('LICENSE_' + package, True):
> > -            license_types = license_types + ' & ' + \
> > -                            d.getVar('LICENSE_' + package, True)
> > -
> > -    #If we get here with no license types, then that means we have
> > a recipe 
> > -    #level license. If so, we grab only those.
> > -    try:
> > -        license_types
> > -    except NameError:        
> > -        # All the license types at the recipe level
> > -        license_types = d.getVar('LICENSE', True)
> > - 
> >      # All the license files for the package
> >      lic_files = d.getVar('LIC_FILES_CHKSUM', True)
> >      pn = d.getVar('PN', True)
> > @@ -487,7 +473,7 @@ def find_license_files(d):
> >  
> >      v = FindVisitor()
> >      try:
> > -        v.visit_string(license_types)
> > +        v.visit_string(d.getVar('LICENSE', True))
> >      except oe.license.InvalidLicense as exc:
> >          bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
> >      except SyntaxError:
> > -- 
> > 2.6.6
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


