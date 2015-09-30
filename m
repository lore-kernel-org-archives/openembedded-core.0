Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 20FF176AE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:21:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 30 Sep 2015 02:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,611,1437462000"; d="scan'208";a="816058956"
Received: from mhanley-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.22.120])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2015 02:21:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Wed, 30 Sep 2015 10:21:57 +0100
Message-ID: <2536397.TWMWxq2M1Y@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1443603673.11206.35.camel@linux.intel.com>
References: <1443095587-13852-1-git-send-email-markus.lehtonen@linux.intel.com>
	<2936022.hqFWI3dATu@peggleto-mobl.ger.corp.intel.com>
	<1443603673.11206.35.camel@linux.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 30 Sep 2015 09:22:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 September 2015 12:01:13 Markus Lehtonen wrote:
> Hi,
> 
> On Mon, 2015-09-28 at 14:48 +0100, Paul Eggleton wrote:
> > Hi Markus,
> > 
> > On Thursday 24 September 2015 14:53:07 Markus Lehtonen wrote:
> > > This change makes it possible to have local files (non-remote SRC_URI
> > > files, i.e. files that are located in the "recipe space") under the
> > > srctree even if S!=WORKDIR. The files must be placed under the
> > > 'local-files' subdirectory.
> > > 
> > > Complements the previous patch that imports local files into srctree.
> > > 
> > > [YOCTO #7602]
> > > 
> > > Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> > > ---
> > > 
> > >  scripts/lib/devtool/standard.py | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/scripts/lib/devtool/standard.py
> > > b/scripts/lib/devtool/standard.py index 6b85c8c..78b0d27 100644
> > > --- a/scripts/lib/devtool/standard.py
> > > +++ b/scripts/lib/devtool/standard.py
> > > 
> > > @@ -558,8 +558,13 @@ def modify(args, config, basepath, workspace):
> > >      if not os.path.exists(appendpath):
> > >          os.makedirs(appendpath)
> > >      
> > >      with open(appendfile, 'w') as f:
> > > -        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
> > > -        f.write('inherit externalsrc\n')
> > > +        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n')
> > > +        # Local files can be modified/tracked in separate subdir under
> > > srctree +        # Mostly useful for packages with S != WORKDIR
> > > +        f.write('FILESPATH_prepend := "%s:"\n' %
> > > +                os.path.join(srctree, 'local-files'))
> > 
> > Shouldn't this directory be named "oe-local-files"?
> 
> Argh, sorry, I had missed this email earlier. Yes, it should be
> 'oe-local-files'. An updated patch with a fix is available at:
> 
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/devtoo
> l/localfiles

OK, great, but the commit message still has "local-files".

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

