Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDB86FEB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 11:30:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2014 04:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,486,1400050800"; d="scan'208";a="556161949"
Received: from lakaruna-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.8])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2014 04:29:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Date: Mon, 16 Jun 2014 12:29:58 +0100
Message-ID: <25511336.vWPgqOQUkP@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
References: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, "Purdie,
	Richard" <richard.purdie@intel.com>
Subject: Re: oe-selftest developer oriented improvements
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
X-List-Received-Date: Mon, 16 Jun 2014 11:30:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Sorry for the late reply on this.

On Wednesday 23 April 2014 09:26:21 Stoicescu, CorneliuX wrote:
> During the 1.6 development/testing cycle we introduced and used oe-selftest
> more and more for QA purposes to identify various issues in the master
> branch. For those who don't know yet what is oe-selftest, it is a python
> unit test based testing framework designed to simulate poky external usage
> patterns. What we basically do is translate test case steps into python
> classes and methods. This is useful both in reducing QA workload and the
> coverage of our tests. For more information please visit the oe-selftest
> wiki page: https://wiki.yoctoproject.org/wiki/Oe-selftest
> 
> What we would like oe-selftest to be useful with as well is helping
> developers quickly test their patches before submission. With this in mind,
> we came up with some ideas but we also encourage everyone to contribute
> with theirs.
> 
> Test suites can be created from existing automated tests and accessed using
> command-line options. For example, using 'oe-selftest --test-suite
> type=recipe target=man' would test the recipe man and 'oe-selftest
> --test-suite type=class target=buildhistory' would test the buildhistory
> class.

This is definitely something I'd like to see oe-selftest expand into.

> 1)   Testing recipes updates or new recipes
> 
> Even though we cannot test every single scenario or the functionality of a
> recipe, we could create a test suite that would: - build the recipe with
> all major architectures(qemux86, qemux86-64, qemuarm, qemuppc, qemumips) -
> rebuild the recipe from sstate(with or without a sstate file for the
> recipe) - perform cleaning operations on the recipe(cleansstate)
> - force all major tasks on the recipe (bitbake -C <task> <recipe>)
> - selectively use each combination of .bbappend files with the recipe; all
> the combinations should not break the recipe build. - we could also create
> mini test suites just for some of these tests like testing only the rebuild
> from sstate. (any experience from common recipe build fails can be helpful
> here)

Sounds good to me.

For everyone else's benefit, there is now an enhancement bug related to this:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6370

These days we have quite a number of QA checks, so as long as the user hasn't 
disabled those they protect against a variety of recipe quality issues. Here 
are some issues we don't currently test for (I wouldn't necessarily call them 
"common", they do come up from time to time):

1) Tasks such as do_install not being re-executable (e.g. because they use rm 
without -f or unconditional mv on files created in a previous task).

2) Upgrade done without changing SRC_URI checksums (because the check isn't 
performed once the file has been fetched once). Simply doing -c cleanall and 
then re-running fetch will catch this immediately.

3) Recipes poking files directly into the sysroot. We'd have to compare the 
contents of the sysroot with the manifest files before and after building to 
see if anything was installed directly.

One other important thing - oe-selftest's command-line parsing should be made 
a bit more friendly so that it's easy for people to run individual tests 
rather than the entire test suite. I've entered the following enhancement to 
cover that:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6453

> 2)  Testing classes
> 
> This is tricky. There is no general testing pattern to test all classes as
> they provide different functionality. Because of this we should have
> specific tests for each class or set of classes.  Also when updating a
> class, the developer could add new tests or update the old ones. The tests
> used here should be straightforward and well documented. Also I believe
> it's desired to have tests(even rudimentary ones) for all oe-core features
> and this could help push this forward.

For the classes that are meant to be inherited at the recipe level we'll need 
to add dummy recipes to meta-selftest for each class. For classes that are 
meant to be inherited at the system level it's just a matter of creating 
fairly standard oe-selftest test cases that inherit the class and then run a 
build to check that the functionality works.

> There were scenarios where sometimes a recipe would fail to build due to a
> race condition. We could create tests that run in a configurable number of
> build directories at a time with a specific number of threads and parallel
> make. For example, on a 8 threaded machine we could have 3 builds with 4
> threads and parallel make each run in parallel building the same recipe
> oven and over until it fails.

As you're probably aware there are two types of issue here - missing 
dependencies within our recipes and missing dependencies within the build 
system used by the software the recipe is building (most often makefiles). For 
the former we do have scripts/test-dependencies.sh which is run regularly by 
Martin. Whilst this is an area that might be useful to cover, we do usually 
pick up on these kinds of races on the autobuilders most of the time, so it's 
probably of lower importance than other kinds of tests we might add IMO.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

