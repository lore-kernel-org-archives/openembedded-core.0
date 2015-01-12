Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8462A62252
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 14:15:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2015 06:12:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,744,1413270000"; d="scan'208";a="636039553"
Received: from fcrouzet-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.81])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2015 06:15:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Mon, 12 Jan 2015 14:15:15 +0000
Message-ID: <5115458.ATlrg5uZUd@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <1420741450-28220-1-git-send-email-kergoth@gmail.com>
References: <1420741450-28220-1-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 12 Jan 2015 14:15:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chris,

On Thursday 08 January 2015 11:24:08 Christopher Larson wrote:
> - Handles distutils & setuptools.
> - Supports pulling metadata from PKG-INFO, .egg-info, & setup.py (via two
>   different mechanisms).
> - Doesn't handle python 3 yet.
> - Optional dependencies via `extra_requires` are not currently
>   handled.
> - Implements scanning for dependencies by using the python ast to
>   determine what modules/packages are being imported by the python
>   code in question
> 
> See https://gist.github.com/kergoth/6cca6caa4e9b22a21f75 for the projects
> I used to test this against, and
> https://gist.github.com/kergoth/7fea9494e3cf60b382ff which is the result of
> running recipetool create against every recipe that inherits distutils or
> setuptools in my build environment.
> 
> https://gist.github.com/kergoth/7ad4b5102b2a5fe3a956 has my current TODO for
> this feature.

This works pretty well, thanks!

I tried this on python-mako and got this:

------------- snip --------------
...
# WARNING: the following rdepends are from setuptools install_requires. These
# upstream names may not correspond exactly to bitbake package names.
RDEPENDS_${PN} += "markupsafe"

# WARNING: the following rdepends are determined through basic analysis of the
# python sources, and might not be 100% accurate. It is your responsibility to
# verify that the values are complete and correct.
RDEPENDS_${PN} += "python-core python-textutils"

# WARNING: We were unable to map the following python package/module
# dependencies to the bitbake packages which include them:
#    mako.lookup
#    mako.template
#    sys
------------- snip --------------

* Shouldn't it know that sys is provided by python-core (maybe this has to be 
hardcoded)? 

* Possibly also that "mako" is a module provided by this recipe?

* Our existing recipe has "python-threading python-netclient python-html" for 
RDEPENDS_${PN}, I don't know if all of these are correct but it does at least 
try to import threading.

* Should we just assume by convention that package names should start with 
"python-" and thus make that prefix on all items brought in from setuptools 
install_requires?

* I think "It is your responsibility ..." is a little harsh for the dependency 
situation - you'll soon find out at runtime if the value is insufficient. I used 
this wording for LICENSE because if you don't check it yourself you won't find 
out if it's incorrect.

Earlier you mentioned it would be nice if the buildsystem handler could 
replace the existing value of LICENSE - I checked and it already can; you'll 
find the existing value in lines_before. It's all a little bit clunky API-wise 
but it is at least possible.

I also noticed when looking at this that my code wasn't replacing the version 
with ${PV} in S (but was in SRC_URI). I'll send a patch to fix that. The way 
the code works at the moment, I only replace it in SRC_URI if you've specified 
a file name containing the version and then we can find that same version in the 
SRC_URI value (I'm not sure there is any other practical way).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

