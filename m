Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB6A9608CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 15:46:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jun 2013 08:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,898,1363158000"; d="scan'208";a="356228830"
Received: from unknown (HELO helios.localnet) ([10.252.122.40])
	by orsmga002.jf.intel.com with ESMTP; 19 Jun 2013 08:45:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jate Sujjavanich <Jate.Sujjavanich@myfuelmaster.com>
Date: Wed, 19 Jun 2013 16:45:55 +0100
Message-ID: <1409263.tPA0GAOlPL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1616148.Gg6ON78uJM@helios>
References: <1371653832-2178-1-git-send-email-jate.sujjavanich@myfuelmaster.com>
	<6C2434209962DC46B88345CA85C334A201C9F4A70BF2@Courier.syntech.org>
	<1616148.Gg6ON78uJM@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Checksums for local files now stored using partial recipe path
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
X-List-Received-Date: Wed, 19 Jun 2013 15:46:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 19 June 2013 16:24:53 Paul Eggleton wrote:
> Hi Jate,
> 
> On Wednesday 19 June 2013 11:08:10 Jate Sujjavanich wrote:
> > This allows sstate-cache to be shared between builds in different
> > directories.
> > 
> > Differences in the full path were triggering a false positive when there
> > were actually no changes.
> > 
> > Signed-off-by: Jate Sujjavanich <jate.sujjavanich@myfuelmaster.com>
> > ---
> > 
> >  bitbake/lib/bb/fetch2/__init__.py |   14 +++++++++-----
> >  bitbake/lib/bb/siggen.py          |    3 ++-
> >  2 files changed, 11 insertions(+), 6 deletions(-)
> > 
> > diff --git a/bitbake/lib/bb/fetch2/__init__.py
> > b/bitbake/lib/bb/fetch2/__init__.py index dd1cc93..7ab44d7 100644
> > --- a/bitbake/lib/bb/fetch2/__init__.py
> > +++ b/bitbake/lib/bb/fetch2/__init__.py
> > 
> > @@ -900,8 +900,7 @@ def get_checksum_file_list(d):
> >      return " ".join(filelist)
> > 
> > -
> > -def get_file_checksums(filelist, pn):
> > 
> > +def get_file_checksums(filelist, pn, topdir):
> >      """Get a list of the checksums for a list of local files
> >      
> >      Returns the checksums for a list of local files, caching the results
> >      as
> > 
> > @@ -917,7 +916,12 @@ def get_file_checksums(filelist, pn): bb.warn("Unable
> > to get checksum for %s SRC_URI entry %s: %s" % (pn, os.path.basename(f),
> > e)) return None
> > 
> >          return checksum
> > 
> > +
> > +    (recipe_root, _) = os.path.split(topdir)
> > 
> > +    def remove_recipe_parent(data):
> > +        return data.replace(recipe_root, '').strip('/')
> > +
> > 
> >      checksums = []
> >      
> >      for pth in filelist.split():
> >          checksum = None
> > 
> > @@ -927,7 +931,7 @@ def get_file_checksums(filelist, pn):
> >              for f in glob.glob(pth):
> >                  checksum = checksum_file(f)
> > 
> >                  if checksum:
> > -                    checksums.append((f, checksum))
> > +                    checksums.append((remove_recipe_parent(f),
> > + checksum))
> > 
> >          elif os.path.isdir(pth):
> >              # Handle directories
> > 
> >              for root, dirs, files in os.walk(pth):
> > @@ -935,12 +939,12 @@ def get_file_checksums(filelist, pn):
> >                      fullpth = os.path.join(root, name)
> >                      checksum = checksum_file(fullpth)
> > 
> >                      if checksum:
> > -                        checksums.append((fullpth, checksum))
> > +
> > + checksums.append((remove_recipe_parent(fullpth), checksum))
> > 
> >          else:
> >              checksum = checksum_file(pth)
> >          
> >          if checksum:
> > -            checksums.append((pth, checksum))
> > +            checksums.append((remove_recipe_parent(pth), checksum))
> > 
> >      checksums.sort(key=operator.itemgetter(1))
> >      return checksums
> > 
> > diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py index
> > 8861337..c64acfe 100644 --- a/bitbake/lib/bb/siggen.py
> > +++ b/bitbake/lib/bb/siggen.py
> > 
> > @@ -74,6 +74,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
> >          self.pkgnameextract = re.compile("(?P<fn>.*)\..*")
> >          self.basewhitelist = set((data.getVar("BB_HASHBASE_WHITELIST",
> > 
> > True) or "").split()) self.taskwhitelist = None
> > +        self.topdir = data.getVar("TOPDIR", True)
> > 
> >          self.init_rundepcheck(data)
> >      
> >      def init_rundepcheck(self, data):
> > @@ -187,7 +188,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
> >              self.runtaskdeps[k].append(dep)
> >          
> >          if task in dataCache.file_checksums[fn]:
> > -            checksums =
> > bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task],
> > recipename) +            checksums =
> > + bb.fetch2.get_file_checksums(dataCache.file_checksums[fn][task],
> > + recipename, self.topdir)
> > 
> >              for (f,cs) in checksums:
> >                  self.file_checksum_values[k][f] = cs
> >                  data = data + cs
> 
> Good catch! The only thing is, this will not help for files within different
> layers which may not be underneath TOPDIR; I think we'll need a function
> that determines which layer the file is under (longest path match from
> data.getVar('BBLAYERS', True).split()) and then take that path off the
> beginning.
> 
> Additionally, this is a patch against bitbake so it will need to go to the
> bitbake-devel@lists.openembedded.org mailing list.

Actually, looking more closely at this I'm not sure how the full path to the 
file would be getting into the signature - looking at lib/bb/siggen.py it 
should only be adding the file checksum value to the signature data and not the 
path. I did a quick test with master by moving some files referred to in 
SRC_URI to a different valid location (thus changing their full path), cleaning 
the recipe and then building it again, and the output was restored from sstate 
rather than rebuilding.

Can you explain how you came to the conclusion that this was why the checksums 
were different on different machines?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

