Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C568060089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 13:10:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t75DAhWq009100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Aug 2015 06:10:43 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 5 Aug 2015 06:10:42 -0700
To: Robert Yang <liezhi.yang@windriver.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
References: <55C1B11A.7060606@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <55C20B52.9090400@windriver.com>
Date: Wed, 5 Aug 2015 08:10:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <55C1B11A.7060606@windriver.com>
Subject: Re: About multilib packages rpm pkg name
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
X-List-Received-Date: Wed, 05 Aug 2015 13:10:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 8/5/15 1:45 AM, Robert Yang wrote:
> 
> Hello,
> 
> For the multilib package like lib32-bash, its rpm package name
> is bash-4.3.30-r0.lib32_x86.rpm, but for ipk and deb, its name is
> lib32-bash.ipk and lib32-bash.deb, there is a side effect for
> the naming of rpm, for example, if packagegroup-xx rdepends on bash,
> the lib32-packagegroup-xx should rdepend on lib32-bash, but
> the its rpm pkg knows nothing about lib32-bash, so it still rdepends
> on bash, this causes 32bit toolchain libs not installed when export
> multilib sdk, for example:
> 
> Configured multilib:
> MACHINE ?= "qemux86-64"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> $ bitbake core-image-minimal -cpopulate_sdk
> 
> When PACKAGE_CLASSES = "package_rpm",  the lib32-libgcc,
> lib32-libgcc-dev or other lib32-xx packages are not installed,
> so that the 32bit toolchain doesn't work in SDK, this is because
> lib32-packagegroup-core-standalone-sdk-target can't pull in the
> lib32-xx correctly.
> 
> When PACKAGE_CLASSES = "package_ipk", it works well.
> 
> Does anyone why we don't use the name like lib32-bash.rpm, please ?
> Can we use lib32-bash, please ?

Because for something like bash, there is absolutely no reason to choose a
64-bit or 32-bit version over the other.  They have equivalent functionality for
the end user, and only one version can be installed at a time.

This is the RPM behavior that is being copied from Red Hat and other places, and
what our customers are expecting.

RPM supports multiple packages, with different arch fields, being installed at
the same time.  ipkg and deb have a limitation that the package name MUST be
unique.  So this is the first reason why we have different style names.

The idea here being that you can build the .i586 packages once, and re-use them
on an i586 system and an x86-64 system.  (Note, this doesn't work in practice in
the Yocto Project due to sstate issues... but that is the underlying design from
a package management perspective.)

Dependency processing is the second reason, see below for an explanation of the
difference and how it affects us.

There are different types of dependencies within the system.

* Package level dependency
This is of the format 'bash' or 'lib32-bash'.  The system requires a specific
package.  All three package formats support this.

* Virtual dependency
This is similar, in that the format can look like a package, or be something
like 'virtual/foo'.  Again all three package formats support this.

* Library SONAME
This is a correlation of the library SONAME into the dependency set, such as
'libz.so(64)'.  This is pulled directly from any ELF binaries in the system
during processing and added as a direct dependency to other shared libraries.
It is significantly more exact then the package or virtual dependencies above.
HOWEVER, it only works in the RPM case.

This is the second reason why deb and ipkg need a unique 'lib32' style name for
things.  They don't have a mechanism for a package to say "I need the 64-bit
version of libz.so" to run properly, while that is built into RPM itself.

* Filename dependency
These are dependencies that start with '/'.  This is unique to RPM as well, and
allows RPM to express dependencies on '/bin/bash', vs deb/ipkg having
dependencies on 'bash'.  The difference is that it puts a hard marker in place
that if 'bash' doesn't provide '/bin/bash', it's not enough.

This doesn't directly affect the naming, but occasionally has some indirect
adjustments on things.


So when building a system using RPM as the package type, the rootfs construction
may be slightly different because the package manager rules are different.

RPM (smart) will look at the overall dependency tree and attempt to pick the
shortest path so that all of the dependencies are correct.  You can 'weight' the
dependency resolver to favor one style of package over the other.  This is a
place in smart where we likely need to change the behavior to make it a bit more
friendly for the Yocto Project.

The dependency generator is already configured to weigh a package of the same
type (arch) as a bit higher then others.  The problem is that a 'noarch' (all)
package is of a different type then say i586.  So when an all package says "give
me bash".  There is no 'bash.all', so it looks at the list and finds 'bash' of
the highest priority, IF it had not previously been selected by something else.
 (How would it have previously been selected?  If the image had selected
'lib32-bash' explicitly, or the more likely case, a lib32-* package that
requires bash had been selected by the image, and there were not explicit
requirements for 'bash' [main lib version]).


RPM itself has a setting that defines which ABI type becomes the default if you
attempt to choose multiple packages that have the same executables listed.  The
setting here is:

# Set RPM_PREFER_ELF_ARCH to configure preferred ABI when using rpm packaging
# backend to generate a rootfs, choices are:
# 1: ELF32 wins
# 2: ELF64 wins
# 4: ELF64 N32 wins (for mips64 or mips64el only)

Note, this doesn't prevent multiple packages of the same name, different arch
from being installed -- what this does is selects which one wins.  When not set,
I believe it's last-in wins.


This setting should also help weigh the smart dep generator, but I'm not sure it
does.  (Pretty easy to test though.. set the value, build a multilib rootfs, and
select something (all package) that requires 'bash' and see which version is
selected.)

But for most things in the system this really doesn't matter at all.  For things
where a 32-bit or 64-bit does matter (executable and/or libraries that are not
implicitly linked elsewhere), we really do need to add dependencies into the
system so that the correct set of items are selected.

PAM, Perl, Python, and the on-target toolchains are things that adding a few
runtime dependencies are needed.  Basically anything in the system that may have
runtime loadable libraries of a specific ABI, using something like dlopen.
(Remember SONAME dependencies are automatic as mentioned above.)

These new runtime dependencies will not harm deb/ipkg resolution (and may help
it), but they give RPM the additional information it needs to select the
explicit set that is required.  For example PAM:

RPROVIDES_${PN} += "${PN}-${libpam_suffix}"
RPROVIDES_${PN}-runtime += "${PN}-runtime-${libpam_suffix}"

RDEPENDS_${PN}-runtime = "${PN}-${libpam_suffix} \
    ${MLPREFIX}pam-plugin-deny-${libpam_suffix} \
    ${MLPREFIX}pam-plugin-permit-${libpam_suffix} \
    ${MLPREFIX}pam-plugin-warn-${libpam_suffix} \
    ${MLPREFIX}pam-plugin-unix-${libpam_suffix} \
    "

(other code later constructs the RPROVIDES for the plugins as well)

The MLPREFIX will be filtered off when RPM constructs it's packages, as it
doesn't want/need them.  However the suffix won't be filtered.

libpam_suffix = "suffix${@get_multilib_bit(d)}"

This way the -runtime package ensures the right other packages (with their
specific PROVIDES sufffixes) are included in all cases.

This is a unique case, but should be pretty easy to help fix.

For the case where you want to specify 'lib32-packagegroup' and expect to ONLY
get 32-bit packages... While we can't ensure it with the RPM mechanism, we can
weigh things to more likely happens -if- the lib32-packagegroup is of the same
.arch as the packages it's installing, instead of being 'all' packages.

Hopefully this explains a bit more how all of these items fit together, and the
choice made when RPM was implemented to follow more of an expected multilib
workflow.  (This won't affect you if you don't use multilibs in your design!)

--Mark

