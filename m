Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A591766A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:01:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2015 02:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,611,1437462000"; d="scan'208";a="800352812"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2015 02:01:14 -0700
Message-ID: <1443603673.11206.35.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 30 Sep 2015 12:01:13 +0300
In-Reply-To: <2936022.hqFWI3dATu@peggleto-mobl.ger.corp.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1443095587-13852-11-git-send-email-markus.lehtonen@linux.intel.com>
	<2936022.hqFWI3dATu@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.11 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 10/10] devtool: modify: make bitbake use local files from srctree
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
X-List-Received-Date: Wed, 30 Sep 2015 09:01:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 2015-09-28 at 14:48 +0100, Paul Eggleton wrote:
> Hi Markus,
> 
> On Thursday 24 September 2015 14:53:07 Markus Lehtonen wrote:
> > This change makes it possible to have local files (non-remote SRC_URI
> > files, i.e. files that are located in the "recipe space") under the
> > srctree even if S!=WORKDIR. The files must be placed under the
> > 'local-files' subdirectory.
> > 
> > Complements the previous patch that imports local files into srctree.
> > 
> > [YOCTO #7602]
> > 
> > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > ---
> >  scripts/lib/devtool/standard.py | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/lib/devtool/standard.py
> > b/scripts/lib/devtool/standard.py index 6b85c8c..78b0d27 100644
> > --- a/scripts/lib/devtool/standard.py
> > +++ b/scripts/lib/devtool/standard.py
> > @@ -558,8 +558,13 @@ def modify(args, config, basepath, workspace):
> >      if not os.path.exists(appendpath):
> >          os.makedirs(appendpath)
> >      with open(appendfile, 'w') as f:
> > -        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
> > -        f.write('inherit externalsrc\n')
> > +        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n')
> > +        # Local files can be modified/tracked in separate subdir under
> > srctree +        # Mostly useful for packages with S != WORKDIR
> > +        f.write('FILESPATH_prepend := "%s:"\n' %
> > +                os.path.join(srctree, 'local-files'))
> 
> Shouldn't this directory be named "oe-local-files"?

Argh, sorry, I had missed this email earlier. Yes, it should be
'oe-local-files'. An updated patch with a fix is available at:

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/devtool/localfiles



Thanks,
  Markus


