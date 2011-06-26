Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QaeeE-0007Zp-Ra
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 04:00:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jun 2011 18:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,427,1304319600"; d="scan'208";a="18619947"
Received: from unknown (HELO [10.255.13.190]) ([10.255.13.190])
	by azsmga001.ch.intel.com with ESMTP; 25 Jun 2011 18:56:50 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 25 Jun 2011 18:56:45 -0700
In-Reply-To: <4E068312.5090507@linux.intel.com>
References: <cover.1308592651.git.josh@linux.intel.com>
	<909a6c756247a7a0f68f60a64477d4e8419ca74c.1308593086.git.josh@linux.intel.com>
	<4E068312.5090507@linux.intel.com>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1309053411.2772.12.camel@scimitar>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Sun, 26 Jun 2011 02:00:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-06-25 at 17:53 -0700, Saul Wold wrote:
> On 06/20/2011 11:09 AM, Joshua Lock wrote:
> > Sanity test to verify files can be fetched from the network using git, http
> > and https fetchers point users at a page to help get set up in the case of a
> > failure.
> >
> > Addresses [YOCTO #933]
> >
> > Signed-off-by: Joshua Lock<josh@linux.intel.com>
> > ---
> >   meta/classes/sanity.bbclass |   34 ++++++++++++++++++++++++++++++++++
> >   1 files changed, 34 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index bffa4f5..650df5f 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -35,6 +35,8 @@ def check_sanity_tmpdir_change(tmpdir, data):
> >
> >       # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
> >       testmsg = check_create_long_filename(tmpdir, "TMPDIR")
> > +    # Check that we can fetch from various network transports
> > +    testmsg = testmsg + check_connectivity(data)
> >       return testmsg
> >
> >   def check_sanity_version_change(data):
> > @@ -75,6 +77,38 @@ def check_create_long_filename(filepath, pathname):
> >               return "Failed to create a file in %s: %s" % (pathname, strerror)
> >       return ""
> >
> > +def check_connectivity(d):
> > +    # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable using
> > +    # the same syntax as SRC_URI.
> > +    test_uris = (bb.data.getVar('CONNECTIVITY_CHECK_URIS', d, True) or "").split()
> > +    # If no URI's set, fallback to some default ones we know of
> > +    if len(test_uris) == 0:
> > +        test_uris = ["http://yoctoproject.org/about",
> > +                     "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
> > +                     "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
> > +    retval = ""
> > +
> > +    # Only check connectivity if network access and this check enabled.
> > +    # Because it's a fairly heavy test allow disabling of just this sanity test
> > +    # by setting DISABLE_NETWORK_SANITY.
> > +    network_disabled = not bb.data.getVar('BB_NO_NETWORK', d, True)
> > +    check_disabled = bb.data.getVar('DISABLE_NETWORK_SANITY', d, True)
> > +    if check_disabled or network_disabled:
> > +        data = bb.data.createCopy(d)
> > +        dldir = bb.data.expand('${TMPDIR}/sanity', data)
> > +        bb.data.setVar('DL_DIR', dldir, data)
> > +
> > +        try:
> > +            fetcher = bb.fetch2.Fetch(test_uris, data)
> > +            fetcher.download()
> > +	    fetcher.clean(test_uris)
> > +        except Exception:
> > +            retval = "Error connecting to the network to fetch, http/https and git checked.\nPlease check the wiki (https://wiki.yoctoproject.org/wiki/Connectivity\%20Troubleshooting) for more suggestions.\n"
> > +        finally:
> > +            # Make sure we tidy up the cruft
> > +            oe.path.remove(dldir)
> > +    return retval
> > +
> >   def check_sanity(e):
> >       from bb import note, error, data, __version__
> >
> 
> Josh,
> 
> When I ran this, I got the following messages about missing SRC_URI 
> Checksums and then it failed to parse recipes.  When I removed this 
> commit things worked normally.
> 

Ick. I didn't see this when I first wrote the patches but am able to
reproduce now... It's the "ERROR: Command execution failed: Exited with
1" which indicates the real problem. The WARNING's are just extra noise.

Looks like the git fetcher is cd'ing before fetching and then breaking
the parsing after the sanity check is complete by not being in the right
cwd as expected by the parser. Messy.

At least that's my inference from reading this output:

joshual@scimitar:~/Projects/Yocto/oe-core/boom [josh/connection-test]
$ bitbake core-image-minimal
Pseudo is not present but is required, building this first before the
main build
Cloning into bare
repository /home/joshual/Projects/Yocto/oe-core/boom/tmp/sanity/git2/git.yoctoproject.org.yocto-firewall-test...
 Parsing recipes:   0% |                                         | ETA:
--:--:-ERROR: Unable to
parse /home/joshual/Projects/Yocto/oe-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb
Traceback (most recent call last):
  File "/home/joshual/Projects/Yocto/bitbake/lib/bb/cooker.py", line
1164, in
parse_file(task=('/home/joshual/Projects/Yocto/oe-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb', [], [<class 'bb.cache.CoreRecipeInfo'>])):
         try:
    >        return True, bb.cache.Cache.parse(filename, appends,
parse_file.cfg, caches_array)
         except Exception as exc:
  File "/home/joshual/Projects/Yocto/bitbake/lib/bb/cache.py", line 402,
in parse(cls=<class 'bb.cache.Cache'>,
filename='/home/joshual/Projects/Yocto/oe-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb', appends=[], configdata=<bb.data_smart.DataSmart object at 0x961f04c>, caches_array=[<class 'bb.cache.CoreRecipeInfo'>]):
             infos = []
    >        datastores = cls.load_bbfile(filename, appends, configdata)
             depends = set()
  File "/home/joshual/Projects/Yocto/bitbake/lib/bb/cache.py", line 641,
in
load_bbfile(bbfile='/home/joshual/Projects/Yocto/oe-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.15.0.bb', appends=[], config=<bb.data_smart.DataSmart object at 0x961f04c>):
             bbfile_loc = os.path.abspath(os.path.dirname(bbfile))
    >        oldpath = os.path.abspath(os.getcwd())
             parse.cached_mtime_noerror(bbfile_loc)
OSError: [Errno 2] No such file or directory

ERROR: Command execution failed: Exited with 1

The following hunk is a workaround but I need to figure out if this is
the right way to fix it and Saturday night isn't when I do my best
thinking ;-)

@@ -90,6 +90,7 @@ def check_connectivity(d):
     network_disabled = not bb.data.getVar('BB_NO_NETWORK', data, True)
     check_disabled = bb.data.getVar('DISABLE_NETWORK_SANITY', data,
True)
     if check_disabled or network_disabled:
+        bookmark = os.getcwd()
         dldir = bb.data.expand('${TMPDIR}/sanity', data)
         bb.data.setVar('DL_DIR', dldir, data)
 
@@ -102,6 +103,7 @@ def check_connectivity(d):
         finally:
             # Make sure we tidy up the cruft
             oe.path.remove(dldir)
+            os.chdir(bookmark)
     return retval

I'll work on a rev two patch and also try and figure out a clean way to
at least hide the SRC_URI checksum warnings.

Thanks,
Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



