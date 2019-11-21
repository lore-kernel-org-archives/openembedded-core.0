Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5071F7F96B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 14:07:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i12so4577452wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 06:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TmnLDH6ZafuvtY2BQcbv4ePZKSEv3h07TdYsFT0oUeo=;
	b=Hbc5da5rjmTXzCati5My6BVRjmdMzEXpQhO7eFcF4JfEKtN5OWPoLPxUjRGWvRCR0r
	vcMkfXJp6V4ojqr1LeBOIgVV5+k314z6uPfVnuw1IQ1h5UFCJd6JUYuBsVF4cf3/0IWP
	H4UIYXhdYqFOWiQukvDk2cg4G3y9Ja8mdzb+87zCB13nkhhuPeEgJ8+g/h+JD7UufGXG
	eQJusuKoJLK2sHaRF1OdacdO9D0UC4kE53Tp0/tavmZbPiwCrbiIVArB+iwkddjJ1DuC
	9fAxtwNDBWvsZdlLIJpO9amhm3c7PhTpg/iI74olIoPQG8F68ljgkgIqU0UYjPny0alG
	VvSg==
X-Gm-Message-State: APjAAAUerCW39z9+7LDkEpG2X0Y03r6yCm5vgqDdeU3n3GFn8plukg89
	b+M8tgjq+VRRLp7cIuQ4CyzvB9AY
X-Google-Smtp-Source: APXvYqwexdd34KMswAseibMydqtqGsU0KwOcrVyg3hYFE2uAQeoBzSALUaePV9B43FDOQqrQPzvaeg==
X-Received: by 2002:adf:ec84:: with SMTP id z4mr2562941wrn.289.1574345262595; 
	Thu, 21 Nov 2019 06:07:42 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 16sm9375474wmf.0.2019.11.21.06.07.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 06:07:41 -0800 (PST)
Message-ID: <5ea261a1289f54f523b371f3d5a32d7bdf3e21aa.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 14:07:41 +0000
In-Reply-To: <315444F4-D824-4698-B0EB-B20309CD6809@linux.intel.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<549C1F29-84E4-43A3-9DD2-FBED13A92C37@linux.intel.com>
	<315444F4-D824-4698-B0EB-B20309CD6809@linux.intel.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Thu, 21 Nov 2019 14:07:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 2019-11-20 at 22:36 -0800, Tim Orling wrote:
> 
> 
> > On Nov 20, 2019, at 10:27 PM, Tim Orling <timothy.t.orling@linux.intel.com> wrote:
> > 
> > 
> > 
> > > On Nov 20, 2019, at 1:33 AM, Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com> wrote:
> > > 
> > > The current NPM support have several issues:
> > > - The current NPM fetcher downloads the dependency tree but not the other
> > >   fetchers. The 'subdir' parameter was used to fix this issue.
> > > - They are multiple issues with package names (uppercase, exotic characters,
> > >   scoped packages) even if they are inside the dependencies.
> > > - The lockdown file generation have issues. When a package depends on
> > >   multiple version of the same package (all versions have the same checksum).
> > > 
> > > This patchset refactors the NPM support in Yocto:
> > > - As the NPM algorithm for dependency management is hard to handle, the new
> > >   NPM fetcher downloads only the package source (and not the dependencies,
> > >   like the other fetchers) (patch submitted in the bitbake-devel list).
> > > - The NPM class handles the dependencies using NPM (and not manually).
> > > - The NPM recipe creation is simplified to avoid issues.
> > > - The lockdown file is no more used as it is no longer relevant compared to the
> > >   latest shrinkwrap file format.
> > > 
> > > This patchset may remove some features (lockdown file, license management for
> > > dependencies) but fixes the majority of the NPM issues. All of these issues
> > > from the bugzilla.yoctoproject.org are resolved by this patchset:
> > > #10237, #10760, #11028, #11728, #11902, #12534
> > > 
> > > The fetcher and recipetool are now aware of a 'latest' keyword for the version
> > > which allow to build the latest version available on the registry. This feature
> > > fixes the two issues: #10515, #11029
> > > 
> > > Moreover the issue #13415 should also be fixed but I cannot test it.
> > > 
> > > I have tested the recipe creation and builds using a self made example to
> > > generate build failures:
> > > - https://github.com/savoirfairelinux/node-server-example
> > > - https://npmjs.com/package/@savoirfairelinux/node-server-example
> > > 
> > > The test steps are these ones:
> > >  $ source poky/oe-init-build-env
> > >  $ bitbake-layers add-layer ../meta-openembedded/meta-oe
> > >  $ devtool add "npm://registry.npmjs.org;name=@savoirfairelinux/node-server-example;version=latest”
> > 
> > I noticed this before but forgot to report it:
> > 
> > ERROR: Nothing PROVIDES 'c-ares-native' (but virtual:native:/build/meta-openembedded/meta-oe/recipes-
> > devtools/nodejs/nodejs_10.17.0.bb DEPENDS on or otherwise requires it). ...
> > http://layers.openembedded.org/layerindex/recipe/50318/
> > $ bitbake-layers add-layer ../meta-openembedded/meta-networking
> > Which requires
> > $ bitbake-layers add-layer ../meta-openembedded/meta-python
> > 
> > 
> > Using tip of bitbake with V3, openembedded-core with V3 and meta-openembedded master, somehow nodejs-native
> > do_compile broke (at least on qemux86-64) since the last time I built it shortly after ELC-E…
> > So now I’ll have to git bisect that…more to come…
> 
> See https://errors.yoctoproject.org/Errors/Details/274939/
> The same error I am seeing.

Might be caused by 0005-Link-atomic-library.patch which unconditionally makes it
link against libatomic.so
I'd say this should be done conditionally on those arches that need it, exclusively.
Ideally using some kind of auto-detection...

Not sure why it's a problem only now, though.

Cheers,
Andre'

> 
> > FWIW I had previously successfully run your instructions and the tests for both bitbake and oe-selftest for V2
> > (distroless, e.g. not with poky). Something unrelated has broken I suspect.
> > 
> > >  $ devtool build savoirfairelinux-node-server-example
> > >  $ bitbake-layers create-layer ../meta-test
> > >  $ bitbake-layers add-layer ../meta-test
> > >  $ devtool finish savoirfairelinux-node-server-example ../meta-test
> > >  $ echo IMAGE_INSTALL_append = '" savoirfairelinux-node-server-example"' >> conf/local.conf
> > >  $ bitbake core-image-minimal
> > > 
> > > Also the 'devtool add' url could be one of these:
> > > - npm://registry.npmjs.org;name=@savoirfairelinux/node-server-example;version=latest
> > >   This url uses the new npm fetcher and request the latest version available on
> > >   the registry.
> > > - npm://registry.npmjs.org;name=@savoirfairelinux/node-server-example;version=1.0.0
> > >   This url uses the new npm fetcher and request a fixed version.
> > > - git://github.com/savoirfairelinux/node-server-example.git;protocol=https
> > >   This url uses the git fetcher. As the dependencies are managed by the NPM
> > >   class, any fetcher can be used.
> > > 
> > > When this patchset will be merged, I have planned to update the NPM wiki:
> > >  https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM
> > > 
> > > This patchset is also the base work for the full Angular support in Yocto that I
> > > am preparing. These applications have a huge dependency tree which is ideal to
> > > test the NPM support.
> > > 
> > > --- V2
> > > 
> > > - Add the 'check_network_access' function before each network access to check
> > >   for 'BB_NO_NETWORK' and 'BB_ALLOWED_NETWORKS' variables.
> > > 
> > > - Add a 'recipetool.RecipetoolTests.test_recipetool_create_npm' test case for
> > >   'oe-selftest' to test the npm recipe creation.
> > > 
> > > - Update the 'npm.bbclass' to fetch the dependencies in the 'do_fetch' task.
> > >   The dependencies are cached in a npm cache stored in '${DL_DIR}/npm_cache'
> > >   allowing the dependencies to be saved in the download directory and verify
> > >   on insertion and extraction [1]:
> > >      "All data that passes through the cache is fully verified
> > >       for integrity on both insertion and extraction."
> > > 
> > > 1: https://docs.npmjs.com/cli/cache.html
> > > 
> > > --- V3
> > > 
> > > - Add a test regarding the 'devtool add' and 'devtool build' command:
> > >     - devtool.DevtoolAddTests.test_devtool_add_npm
> > > 
> > > - Add the license management for dependencies.
> > > 
> > > - Split the npm workflow to use the bitbake default tasks (do_fetch, do_unpack,
> > >   do_compile, do_install). Make sure that only the do_fetch task requires
> > >   network access.
> > > 
> > > - Split the commits for better understanding.
> > > 
> > > - Force the rebuild of prebuild addons.
> > > 
> > > - Use ${nonarch_libdir} instead of ${libdir} in the do_install task.
> > > 
> > >  - These patches can be found here:
> > >     - https://github.com/savoirfairelinux/openembedded-core/tree/npm-refactoring-v3
> > >     - https://github.com/savoirfairelinux/poky/tree/npm-refactoring-v3
> > > 
> > > Jean-Marie LEMETAYER (17):
> > >  devtool: npm: update command line options
> > >  npm.bbclass: refactor the npm class
> > >  recipetool/create_npm.py: refactor the npm recipe creation handler
> > >  lib/oe/package.py: remove unneeded npm_split_package_dirs function
> > >  devtool/standard.py: npm: update the append file
> > >  recipetool/create.py: npm: remove the 'noverify' url parameter
> > >  recipetool/create.py: npm: replace the 'latest' keyword
> > >  npm.bbclass: split the do_compile task
> > >  devtool/standard.py: npm: exclude the node_modules directory
> > >  recipetool/create_npm.py: handle the licenses of the dependencies
> > >  npm.bbclass: restrict the build to be offline
> > >  npm.bbclass: use the local node headers
> > >  recipetool/create_npm.py: convert the shrinkwrap file
> > >  npm.bbclass: force to rebuild the prebuild addons
> > >  devtool/standard.py: npm: configure the NPM_CACHE_DIR to be persistent
> > >  oeqa/selftest/recipetool: add npm recipe creation test
> > >  oeqa/selftest/devtool: add npm recipe build test
> > > 
> > > meta/classes/npm.bbclass                   | 224 +++++---
> > > meta/lib/oe/package.py                     |  33 --
> > > meta/lib/oeqa/selftest/cases/devtool.py    |  20 +
> > > meta/lib/oeqa/selftest/cases/recipetool.py |  21 +
> > > scripts/lib/devtool/standard.py            |  31 +-
> > > scripts/lib/recipetool/create.py           |  16 +-
> > > scripts/lib/recipetool/create_npm.py       | 565 +++++++++++----------
> > > 7 files changed, 510 insertions(+), 400 deletions(-)
> > > 
> > > --
> > > 2.20.1
> > > 
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


