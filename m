Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8890722E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:08:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2015 01:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,754,1413270000"; d="scan'208";a="650890668"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.23.139])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2015 01:08:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Wed, 14 Jan 2015 09:08:28 +0000
Message-ID: <1866922.ZHph2PdP1B@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CABcZAN=nB-m5560EeeHODqjWJ7MvFKQrGNZr2va70+iOb8J8=A@mail.gmail.com>
References: <1420741450-28220-1-git-send-email-kergoth@gmail.com>
	<5115458.ATlrg5uZUd@peggleto-mobl5.ger.corp.intel.com>
	<CABcZAN=nB-m5560EeeHODqjWJ7MvFKQrGNZr2va70+iOb8J8=A@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] recipetool: add python buildsystem support
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
X-List-Received-Date: Wed, 14 Jan 2015 09:08:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chris,

On Monday 12 January 2015 11:00:56 Christopher Larson wrote:
> There was a bug which didn't properly detect a case where some of its info
> from setup.py (`scripts` in this case) is available, but some of it is not
> (`packages`), and as a result ended up only parsing some of the python code
> available. Since the paths provided to the dependency scanning are also
> passed to the packages search, it didn't pick up on the provide of mako &
> mako.* either. Once that's fixed, it looks like this:
> https://gist.github.com/0a641e90cdfd37fd2100.
> 
> > * Shouldn't it know that sys is provided by python-core (maybe this has to
> > be hardcoded)?
> 
> Yeah, there are cases where it can't pick up a provide. Built-in modules
> (which is the case here), C extensions, or if a module is renamed or
> similar programmatically (os.path is actually posixpath in linux).
> 
> It seems that sys.builtin_module_names lists the built-in modules. To get
> at that list, we could use that from recipetool and implicitly assume that
> this list is the same for the host python as the target, which isn't ideal,
> or we could run the native python from the sysroot, which I'm not currently
> using in any way, or we could copy the list into recipetool. Thoughts?

In this instance as long as we aren't mixing 2.x vs 3.x I think we should be 
OK with assuming that the host and target python will be the same (at least 
for now).
 
> > * Our existing recipe has "python-threading python-netclient python-html"
> > for RDEPENDS_${PN}, I don't know if all of these are correct but it does
> > at least try to import threading.
> 
> With the aforementioned bug fixed, it picks up these and many others,
> thankfully.

Great!
 
> > * Should we just assume by convention that package names should start with
> > "python-" and thus make that prefix on all items brought in from
> > setuptools install_requires?
> 
> Good question, I'd thought about this too. Whichever way we go, the user
> will have to review and confirm sanity regardless, so it's a matter of
> trying to optimize for the common case. One would hope that the python-
> convention would be the common case, so I'm not opposed to this.
>
> > * I think "It is your responsibility ..." is a little harsh for the
> > dependency situation - you'll soon find out at runtime if the value is
> > insufficient. I used this wording for LICENSE because if you don't check it
> > yourself you won't find out if it's incorrect.
> 
> K, I'll drop that.
> 
> > Earlier you mentioned it would be nice if the buildsystem handler could
> > replace the existing value of LICENSE - I checked and it already can;
> > you'll find the existing value in lines_before. It's all a little bit
> > clunky API-wise but it is at least possible.
> 
> Ah! I swear I tried exactly that, but apparently something went wrong. I'll
> look into adding that feature to simplify the recipe.
>
> > I also noticed when looking at this that my code wasn't replacing the
> > version with ${PV} in S (but was in SRC_URI). I'll send a patch to fix
> > that. The way the code works at the moment, I only replace it in SRC_URI
> > if you've specified a file name containing the version and then we can find
> > that same version in the SRC_URI value (I'm not sure there is any other
> > practical way)
> 
> Cool, thanks. I'd noticed this too (in fact it's in the linked todo list :).
> 
> After reviewing the generated recipe for mako more closely, I see multiple
> potential concerns:
>
> - It doesn't handle find_packages() for packages in setup.py. This is
> relatively minor, without knowing the list of packages being shipped, we
> just scan the whole source tree -- this is why things like nose are showing
> up in the new recipe, because it scanned the unit test suite. So I see this
> as a potential future enhancement.

Right, that would be useful; test suites often do have extended dependencies.

> - setuptools/pkg_resources still isn't being properly mapped, even with
> both python and python-distribute built. It looks like python-distribute
> ships setuptools.py & friends in an egg, and the package search via pkgdata
> isn't handling that. - Fixed locally.
> - The detected 'beaker' dependency is an optional one, which we'd know if
> we parsed extra_requires() or the optional sections of
> *.egg-info/requires.txt. This is a known limitation and is already on the
> todo list.

OK, cool. At least for the moment it's better to have the note than to not 
have it and miss dependencies leading to an additional round of recipe fixing.

> - The babel/pygments/templating deps are slightly interesting. Mako doesn't
> actually depend on these itself, but it does provide extensions to those
> projects via entry points. It could be worth enhancing the tool to handle
> those specially, either excluding the entry point packages from the
> dependency scanning, or somehow automatically splitting out the entry point
> bits into separate binary packages, but that'd be slightly non-trivial, and
> might be more "magic" than we want going on. Worth looking into as a
> potential enhancement.

Right, that sounds like a future enhancement to me as well.

> - urllib.parse/urllib.request/html.entities: these were picked up out of
> compat.py, which does runtime python 2 vs 3 handling, so these are python 3
> module deps. There's really no way to avoid this sort of thing, whenever we
> have conditional imports going on, it's going to pick up them all.

Right, yes.
 
> Up next:
> - Drop the duplicated LICENSE
> - Drop the 'your responsibility' message
> - Rebase to merge in the local fixes mentioned above
> - Add python- prefixes to non-mapped deps (e.g. install-requires)
> - For now, add 'sys' to the hardcoded list of modules to ignore (part of
> core)
> 
> After that, I'll re-submit.

Great, thanks.
 
> Then for the future enhancements todo:
> - Handle all of sys.builtin_module_names
> - Consider handling find_packages(), particularly the excludes=
> - Consider handling deps detected from non-local entry points

Sounds good :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

