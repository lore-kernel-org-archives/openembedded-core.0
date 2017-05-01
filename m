Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 76DBC72F06
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 08:14:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v418Er7i031830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 1 May 2017 09:14:54 +0100
Message-ID: <1493626492.23535.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 01 May 2017 09:14:52 +0100
In-Reply-To: <8681b4fb223c4d4dbf3944533891f4b8@XBOX02.axis.com>
References: <cover.1493391620.git.pkj@axis.com>
	<1493455974.19076.167.camel@linuxfoundation.org>
	<8681b4fb223c4d4dbf3944533891f4b8@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 01 May 2017 09:14:54 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/2] Handle the hossttools directory when restoring from the sstate cache
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
X-List-Received-Date: Mon, 01 May 2017 08:14:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-04-29 at 18:07 +0000, Peter Kjellerstedt wrote:
> > Richard Purdie
> > Sent: den 29 april 2017 10:53
> > On Fri, 2017-04-28 at 17:01 +0200, Peter Kjellerstedt wrote:
> > > 
> > > After the introduction of copying host tools to the build
> > > directory
> > > and cleaning out $PATH, we got a problem with one of our tools.
> > > It
> > > turned out that its configure.ac uses AC_PATH_PROG(PERL, perl) to
> > > locate the perl interpreter, and uses that on the shebang line of
> > > the
> > > installed tool. Previously it found /usr/bin/perl and used that,
> > > but
> > > now it will find ${TMPDIR}/hosttools/perl and use that instead,
> > > which
> > > means that if the tool is restored from the sstate cache in
> > > another
> > > build directory than where it originated from, the path will be
> > > wrong.
> > > 
> > > These two patches adds a new variable (HOSTTOOLS_DIR) for the
> > > ${TMPDIR}/hosttools directory, and then makes sure it is handled
> > > by
> > > the staging code so that any references to its value are properly
> > > corrected when restoring from the sstate cache.
> > I did mention on irc that I didn't really want to do this, I only
> > wanted to fix this issue on a case by case basis.
> > 
> > The reason is that we currently have pretty clean sstate files in
> > this
> > regard, we haven't needed to do this. If we add this, we'll become
> > reliant on the fixups. The fixups are slow and ideally we want to
> > pass
> > in correct paths in the first place if/as/where we can.
>
> I am not sure how much my change will affect performance, but I think
> it should be negligible. It only adds one more regular expression to
> a sed command that would be run anyway. And all files (at least that
> I can see in my tmp/sysroot-components) that need to be fixed for
> HOSTTOOLS_DIR already need some other fixup so it does not add to the
> number of files needing to be fixed.

Whether its negligible or not, we're going to end up enouraging people
to be lazy and generate files which don't relocate without manual
fixups.

That said, based on the number of files with problems, I don't think we
have any other choice but to take the patches, particularly this close
to release. I've therefore merged them as I don't have any better
option.

> > So is there a way we can only do this if/as/where needed instead of
> > universally?
> > 
> > The performance overhead of fixups verses no fixups is significant.
> > 
> > Cheers,
> > 
> > Richard
> This actually turned out much worse than I had first thought.
> 
> When I examined what files had been modified in tmp/sysroot-
> components after
> applying my change, the following files were listed:
> 
> tmp/sysroots-components/mips32r2el-nf/libtool-
> cross/usr/bin/crossscripts/mipsel-poky-linux-
> libtool:lt_truncate_bin="FIXME_HOSTTOOLS_DIR/dd bs=4096 count=1"
> tmp/sysroots-components/mips32r2el-
> nf/python/usr/lib/python2.7/config/Makefile:INSTALL=
> FIXME_HOSTTOOLS_DIR/install -c
> tmp/sysroots-components/mips32r2el-
> nf/python/usr/lib/python2.7/config/Makefile:MKDIR_P=
> FIXME_HOSTTOOLS_DIR/mkdir -p
> tmp/sysroots-components/mips32r2el-
> nf/python3/usr/lib/python3.5/config-
> 3.5m/Makefile:INSTALL=   FIXME_HOSTTOOLS_DIR/install -c
> tmp/sysroots-components/mips32r2el-
> nf/python3/usr/lib/python3.5/config-
> 3.5m/Makefile:MKDIR_P=   FIXME_HOSTTOOLS_DIR/mkdir -p
> tmp/sysroots-components/mips32r2el-
> nf/python3/usr/lib/python3.5/config/Makefile:INSTALL=        FIXME_HO
> STTOOLS_DIR/install -c
> tmp/sysroots-components/mips32r2el-
> nf/python3/usr/lib/python3.5/config/Makefile:MKDIR_P=        FIXME_HO
> STTOOLS_DIR/mkdir -p
> tmp/sysroots-components/mips32r2el-
> nf/apache2/usr/share/apache2/build/config_vars.mk:EGREP =
> FIXME_HOSTTOOLS_DIR/grep -E
> tmp/sysroots-components/mips32r2el-nf/apr/usr/share/build-
> 1/libtool:lt_truncate_bin="FIXME_HOSTTOOLS_DIR/dd bs=4096 count=1"
> 
> So I guess there are potential problems with them. However, in
> addition to the 
> files listed above, all postinst-useradd-* scripts where also listed.
> That is 
> because they set up PATH like this:
> 
> export PATH="${BUILDDIR}/scripts:FIXMESTAGINGDIRTARGET-
> native/usr/bin/mipsel-poky-
> linux:FIXMESTAGINGDIRTARGET/usr/bin/crossscripts:FIXMESTAGINGDIRTARGE
> T-native/usr/sbin:FIXMESTAGINGDIRTARGET-
> native/usr/bin:FIXMESTAGINGDIRTARGET-
> native/sbin:FIXMESTAGINGDIRTARGET-
> native/bin:${BUILDDIR}/poky/bitbake/bin:FIXME_HOSTTOOLS_DIR"
> 
> [ I modified the line to use ${BUILDDIR} rather than the expanded
> value to
>   make it shorter in the mail. ]

Its actually worse again as the stashed source directories for
gcc/glibc also have a ton of this kind of issue too.

> And sure enough, when I tested a build without my fixes where a
> recipe that creates a user is restored from sstate to satisfy the
> dependencies of another recipe, and the hosttools path that is in the
> postinst-useradd script no longer exists, the script fails to create
> the user. But it does it silently, without causing a build failure!
> And even if I add the -e option to sh for these scripts they still do
> not fail, because the missing commands are called from within if
> tests and thus do not trigger the shell to abort. This is very 
> bad, and if at all possible should be fixed for Pyro before release,
> as it may lead to very odd failures for anyone using recipes that
> create users/groups.

The piece that particularly worries me here is the silent nature of the
failures. We really need to figure out why its silent and fix that.

> Another thing I noticed when looking at that PATH line, was the
> existence of FIXMESTAGINGDIRTARGET-native. Those should have been
> FIXMESTAGINGDIRHOST, but I think the logic in sstate.bbclass is
> flawed as it only does that replacement if native.bbclass or any
> cross*.bbclass has been inherited, but the native paths can very well
> be used in a target recipe. It only happens to work because 
> RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE are defined as:
> 
> RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
> RECIPE_SYSROOT_NATIVE = "${WORKDIR}/recipe-sysroot-native"
> 
> If RECIPE_SYSROOT_NATIVE instead had been defined as:
> 
> RECIPE_SYSROOT_NATIVE = "${WORKDIR}/native-recipe-sysroot "
> 
> I am sure we would have seen failures since the paths would no longer
> have been fixed...
> 
> I believe the sed expression used in sstate_hardcode_path() when
> cross.bbclass or crosssdk.bbclass has been inherited should be used
> for all the cases, but it needs to be corrected so that
> FIXMESTAGINGDIRHOST is searched for before FIXMESTAGINGDIRTARGET, or
> it will never match. Fixing this is not critical due to how
> RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE are defined, so fixing it
> can wait till after Pyro.

If you think about this a bit more, target output should not be
referencing native paths. The postinst case is kind of special and my
first instinct to fix this would be to simply stop exporting PATH in
those scripts. The parent environment they're run in should have the
correct PATH.

This is my big worry about this patch set, it papers over problems
which should really be fixed by setting variables correctly in the
first place, rather than relying on the relocation mechanism. Even in
your original example, I think we should likely be passing in the
correct paths, not relying on relocation magic.

Unfortunately we are close to release and there are paths which aren't
easily fixed. You can't for example set ac_cv_path_install=install
since autoconf then decides this must be a relative path and prefixes
it with "../" and similar. Sure, we can then tweak autoconf but not
quite everything uses reautoconf (notably gcc) and then things get
messy :(.

I would also add that we need some better sanity tests on the sstate
output to make sure bad paths aren't leaking through. We likely need
some bugs filed on the various issues.

I will respin the release to rc4 with these patches applied though as
there are too many potential risks here to release without doing that.
I'm still running local tests.

Cheers,

Richard






