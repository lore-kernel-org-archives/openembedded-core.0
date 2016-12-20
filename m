Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 46466772DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 10:22:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 20 Dec 2016 02:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,378,1477983600"; d="scan'208";a="44877199"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 20 Dec 2016 02:22:35 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 532E56A4082;
	Tue, 20 Dec 2016 02:21:45 -0800 (PST)
Date: Tue, 20 Dec 2016 12:22:20 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20161220102220.GA15090@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1741618.15EvijL4zK@peggleto-mobl.ger.corp.intel.com>
	<1482151262-22674-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAMKF1sqPsmaOfKHLeTVqsWUMY+jkNByV-ONMV7EnHLnOj=B0gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqPsmaOfKHLeTVqsWUMY+jkNByV-ONMV7EnHLnOj=B0gw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] wic: look for wks files in <layer>/wic
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
X-List-Received-Date: Tue, 20 Dec 2016 10:22:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2016 at 03:31:29PM -0800, Khem Raj wrote:
> On Mon, Dec 19, 2016 at 4:41 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > Currently wic looks for wks files in
> > <layer dir>/scripts/lib/wic/canned-wks/ directories.
> > This path is too nested and doesn't look consistent with the
> > naming scheme of layer directories.
> >
> > Added <layer>/wic directory to the list of paths
> > to look for wks files.
> 
> Does it also affect documentation ?
> 

Yes, in a way. There is only indirect mentioning of
scripts/lib/wic/canned-wks/ in the documentation. I'm going to add new
path there or even directly mention both paths in dev manual.

> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> >  scripts/lib/wic/engine.py | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > index 5b10463..2adef2f 100644
> > --- a/scripts/lib/wic/engine.py
> > +++ b/scripts/lib/wic/engine.py
> > @@ -52,6 +52,7 @@ def verify_build_env():
> >
> >  CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
> >  SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
> > +WIC_DIR = "wic"
> >
> >  def build_canned_image_list(path):
> >      layers_path = misc.get_bitbake_var("BBLAYERS")
> > @@ -59,8 +60,10 @@ def build_canned_image_list(path):
> >
> >      if layers_path is not None:
> >          for layer_path in layers_path.split():
> > -            cpath = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
> > -            canned_wks_layer_dirs.append(cpath)
> > +            for wks_path in (WIC_DIR, SCRIPTS_CANNED_IMAGE_DIR):
> > +                cpath = os.path.join(layer_path, wks_path)
> > +                if os.path.isdir(cpath):
> > +                    canned_wks_layer_dirs.append(cpath)
> >
> >      cpath = os.path.join(path, CANNED_IMAGE_DIR)
> >      canned_wks_layer_dirs.append(cpath)
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

