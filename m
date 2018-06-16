Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1E974A13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 12:01:09 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5GC0xtD019796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 16 Jun 2018 13:01:00 +0100
Message-ID: <fb2e6f8984bec2130a908a5d11f643fb655ffc4c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrii Bordunov <aborduno@cisco.com>,
	openembedded-core@lists.openembedded.org, Burton Ross
	<ross.burton@intel.com>
Date: Sat, 16 Jun 2018 13:00:59 +0100
In-Reply-To: <55a3f6af-b807-c14b-bacd-edfe52d6ca7f@cisco.com>
References: <1476118955-12401-1-git-send-email-aborduno@cisco.com>
	<1479293265.28508.4.camel@linuxfoundation.org>
	<6897ef62-b48d-ca6d-dc03-41d3467bc91a@cisco.com>
	<256c9b8c-4972-f308-eb26-4c32e005a72e@cisco.com>
	<b15fed47-677b-8c53-e6a0-0f812f500812@cisco.com>
	<55a3f6af-b807-c14b-bacd-edfe52d6ca7f@cisco.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH v3] package.bbclass: allow using EXCLUDE_FROM_SHLIBS for subpackages
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
X-List-Received-Date: Sat, 16 Jun 2018 12:01:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Sorry about the delay on this, my concern still remains. Having thought
about this a bit, the performance issue wouldn't show up with glibc, it
would probably show up better with glibc-locales, perl (due to its
modules) or the kernel (again due to large number of modules) as these
all have significantly more packages.

Basically, regardless of the profile data, adding new API which mean
hundreds of new getVar calls for something which is not common case,
isn't something I really want to do as it limits us in the future.

I'd much prefer we have one variable which lists all packages which
need to be excluded from shlibs and have some special values which mean
"all packages", including "1" for backwards compatibility. I'd be happy
  to see "1" trigger a warning and have it replaced with "*" or
something with clearer meaning.

Cheers,

Richard


On Mon, 2018-06-11 at 15:20 +0300, Andrii Bordunov wrote:
> Ping again.
> 
> 
> Thank you,
> Andrii
> 
> On 04/12/2018 05:42 PM, Andrii Bordunov wrote:
> > Another ping.
> > 
> > Any comments? Or could it be just applied as is?
> > 
> > 
> > Thank you,
> > Andrii
> > 
> > On 03/13/2018 07:25 PM, Andrii Bordunov wrote:
> > > Ping
> > > 
> > > Rebased patch to latest master.
> > > 
> > > Regarding special value for the variable, it could be done with 
> > > PRIVATE_LIBS to mean all libraries, I think. PRIVATE_LIBS could
> > > be set 
> > > per-package already.
> > > Would it be a better option?
> > > However, EXCLUDE_FROM_SHLIBS seems to be a more proper thing to
> > > use.
> > > 
> > > 
> > > Thank you,
> > > Andrii
> > > 
> > > On 03/16/2017 05:07 PM, Andrii Bordunov wrote:
> > > > Hi Richard,
> > > > 
> > > > Sorry, my Python knowledge is quite basic. I'm sure it's
> > > > possible to 
> > > > have a (global?) EXCLUDE_FROM_SHLIBS list holding subpackage
> > > > names, 
> > > > but how it could lead to performance improvement? It would also
> > > > need 
> > > > some check for every subpackage.
> > > > Could you please give more details?
> > > > And what do you mean under "all packages"? The intent is like 
> > > > opposite, to split package operations, not to gather.
> > > > 
> > > > As for False parameter to getVar, OK, I just used existing 
> > > > EXCLUDE_FROM_SHLIBS example (seems fixed now).
> > > > 
> > > > In the meantime tried to make a quick and dirty profiling like 
> > > > following:
> > > > 
> > > >    bitbake -c package glibc
> > > >    bitbake -c clean glibc
> > > >    python -m cProfile -s cumtime 
> > > > /mnt/src/oe/distro/bitbake/bin/bitbake -c package glibc >
> > > > result.txt
> > > > 
> > > > Result is below. If got it right, there are 3833 getVar calls
> > > > with 
> > > > total time 0.025 second (including subcalls).
> > > > This gives ~6.5 microsecond duration of one call (incl
> > > > subcalls). Not 
> > > > a lot.
> > > > This is only a partial rebuild of one package of course.
> > > > Also tried to do all of this with and without my patch, but
> > > > getVar 
> > > > calls number stays exactly the same (w/o modifying glibc
> > > > recipe, but 
> > > > anyway).
> > > > 
> > > >    NOTE: Tasks Summary: Attempted 314 tasks of which 314 didn't
> > > > need 
> > > > to be rerun and all succeeded.
> > > >             672869 function calls (667640 primitive calls) in
> > > > 12.912 
> > > > seconds
> > > >       Ordered by: cumulative time
> > > >       ncalls  tottime  percall  cumtime  percall 
> > > > filename:lineno(function)
> > > >            1    0.001    0.001   12.913   12.913
> > > > bitbake:25(<module>)
> > > >            1    0.001    0.001   12.082   12.082 
> > > > main.py:320(bitbake_main)
> > > >            1    0.005    0.005   11.494   11.494
> > > > knotty.py:253(main)
> > > >          250   11.476    0.046   11.476    0.046 {method 'poll'
> > > > of 
> > > > '_multiprocessing.Connection' objects}
> > > >    ...
> > > >    4481/4046    0.007    0.000    0.026    0.000 
> > > > data_smart.py:666(getVarFlag)
> > > >    ...
> > > >    3833/3719    0.002    0.000    0.025    0.000 
> > > > data_smart.py:569(getVar)
> > > >    ...
> > > >         1338    0.002    0.000    0.003    0.000 
> > > > data_smart.py:805(getVarFlags)
> > > > 
> > > > 
> > > > 
> > > > Thank you,
> > > > Andrii
> > > > 
> > > > On 16.11.16 12:47, Richard Purdie wrote:
> > > > > On Mon, 2016-10-10 at 20:02 +0300, Andrii Bordunov wrote:
> > > > > > Some packages containing shared libraries might be
> > > > > > registered
> > > > > > as shlib providers when they shouldn't (for example, the
> > > > > > lib is for
> > > > > > their private use and must not generate any dependency).
> > > > > > 
> > > > > > EXCLUDE_FROM_SHLIBS is targeted at that, but it could be
> > > > > > set
> > > > > > for entire recipe only.
> > > > > > 
> > > > > > This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's
> > > > > > possible
> > > > > > to set it in a style similar with RDEPENDS. For example:
> > > > > >  EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
> > > > > > 
> > > > > > Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
> > > > > > ---
> > > > > >  meta/classes/package.bbclass | 12 ++++++++++--
> > > > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > > > 
> > > > > My main concern here is actually performance. For a package
> > > > > with many
> > > > > sub packages you just added many calls to getVar when that
> > > > > getVar is
> > > > > extremely unlikely to find any value. Whilst not hugely slow,
> > > > > that
> > > > > operation isn't trivial and hard to fix later.
> > > > > 
> > > > > I'm wondering if we could support the syntax
> > > > > 
> > > > > EXCLUDE_FROM_SHLIBS = "${PN}-ptest"
> > > > > 
> > > > > and then have "1", used in a couple of places as the special
> > > > > value to
> > > > > mean all packages?
> > > > > 
> > > > > Also please use False, not 0 as the parameter to getVar.
> > > > > 
> > > > > Cheers,
> > > > > 
> > > > > Richard
> > 
> > -- 
> > 
> >  From 4a33d384a72a351bad5a98e46a7c9c1c9755635e Mon Sep 17 00:00:00
> > 2001
> > From: Andrii Bordunov <aborduno@cisco.com>
> > Date: Mon, 12 Mar 2018 08:13:44 -0700
> > Subject: [PATCH v3] Allow EXCLUDE_FROM_SHLIBS to be specified for
> > subpackages
> > 
> > Some subpackages containing shared libraries might be registered
> > as shlib providers when they shouldn't (the lib is for their
> > private use
> > and must not generate any dependency).
> > 
> > EXCLUDE_FROM_SHLIBS is targeted at that, but it could be set
> > for entire recipe only.
> > 
> > This patch expands EXCLUDE_FROM_SHLIBS usage, so now it's possible
> > to set it like following:
> > EXCLUDE_FROM_SHLIBS_${PN}-ptest = "1"
> > 
> > Signed-off-by: Andrii Bordunov <aborduno@cisco.com>
> > ---
> >    meta/classes/package.bbclass | 11 +++++++++--
> >    1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/package.bbclass
> > b/meta/classes/package.bbclass
> > index 317c775..5d49d41 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1571,6 +1571,13 @@ python package_do_shlibs() {
> > 
> >        workdir = d.getVar('WORKDIR')
> > 
> > +    shlib_pkgs = []
> > +    for pkg in packages.split():
> > +        if d.getVar('EXCLUDE_FROM_SHLIBS_' + pkg, False):
> > +            bb.note("not generating shlibs for %s" % pkg)
> > +        else:
> > +            shlib_pkgs.append(pkg)
> > +
> >        ver = d.getVar('PKGV')
> >        if not ver:
> >            msg = "PKGV not defined"
> > @@ -1698,7 +1705,7 @@ python package_do_shlibs() {
> >        needed = {}
> >        shlib_provider = oe.package.read_shlib_providers(d)
> > 
> > -    for pkg in packages.split():
> > +    for pkg in shlib_pkgs:
> >            private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or
> > d.getVar('PRIVATE_LIBS') or ""
> >            private_libs = private_libs.split()
> >            needs_ldconfig = False
> > @@ -1770,7 +1777,7 @@ python package_do_shlibs() {
> > 
> >        libsearchpath = [d.getVar('libdir'),
> > d.getVar('base_libdir')]
> > 
> > -    for pkg in packages.split():
> > +    for pkg in shlib_pkgs:
> >            bb.debug(2, "calculating shlib requirements for %s" %
> > pkg)
> > 
> >            private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or
> > d.getVar('PRIVATE_LIBS') or ""
> 
> 

