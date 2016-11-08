Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACCA60290
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 08:56:40 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161108085641054_0486
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 08:56:41 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=34402 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c42Co-0003xP-Pj for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2016 03:56:34 -0500
Date: Tue, 8 Nov 2016 03:55:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611080334060.19840@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: compile error for handwritten "perl-RPM2", 'RPM_GNUC_NULL_TERMINATED' error
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
X-List-Received-Date: Tue, 08 Nov 2016 08:56:42 -0000
Content-Type: text/plain; charset=US-ASCII


  following on my earlier post, here's the specific issue i'm
tackling. having found no existing OE recipe equivalent to a centos
"perl-RPM2" RPM, i wrote my own. here's the info about that RH RPM on
my fedora system, so i know what the final result should look like:

  $ rpm -ql perl-RPM2
  /usr/lib64/perl5/vendor_perl/RPM2.pm
  /usr/lib64/perl5/vendor_perl/auto/RPM2
  /usr/lib64/perl5/vendor_perl/auto/RPM2/RPM2.so
  /usr/share/doc/perl-RPM2
  /usr/share/doc/perl-RPM2/Changes
  /usr/share/doc/perl-RPM2/README
  /usr/share/man/man3/RPM2.3pm.gz
  $

so, as before, track down the source at cpan:

  https://metacpan.org/pod/RPM2

and write a boilerplate recipe, "perl-rpm2", containing the following
line since it's an older style recipe:

  inherit cpan_build

fetching works fine:

  $ bitbake -c fetchall perl-rpm2

but here's the problem:

  $ bitbake perl-rpm2

... snip ...

| DEBUG: Executing shell function do_compile
| Copying lib/RPM2.pm -> blib/lib/RPM2.pm
| lib/RPM2.xs -> lib/RPM2.c
| powerpc-poky-linux-gcc -m32 -mhard-float -mcpu=7400 -mno-spe
--sysroot=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc
-I/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/lib/perl/5.22.1/CORE
-DVERSION="1.3" -DXS_VERSION="1.3" -fPIC -DRPM2_API=5004
-I/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm
-c -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/work/ppc7400-poky-linux/perl/5.22.1-r0=/usr/src/debug/perl/5.22.1-r0
-fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc=
-DDEBIAN -D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe
-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2 -O2
-pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/work/ppc7400-poky-linux/perl-rpm2/1.3-r0=/usr/src/debug/perl-rpm2/1.3-r0
-fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/x86_64-linux=
-fdebug-prefix-map=/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc=
-O2 -o lib/RPM2.o lib/RPM2.c
| In file included from
/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmcli.h:9:0,
|                  from lib/RPM2.xs:3:
|
/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmmacro.h:
In function 'rpmExpand':
|
/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmmacro.h:249:2:
error: expected declaration specifiers before
'RPM_GNUC_NULL_TERMINATED'
|   RPM_GNUC_NULL_TERMINATED
|   ^~~~~~~~~~~~~~~~~~~~~~~~
|
/home/rpjday/oe/builds/msm_qemuppc/tmp/sysroots/qemuppc/usr/include/rpm/rpmmacro.h:260:2:
error: expected '=', ',', ';', 'asm' or '__attribute__' before
'RPM_GNUC_NULL_TERMINATED'
|   RPM_GNUC_NULL_TERMINATED
|   ^~~~~~~~~~~~~~~~~~~~~~~~

... big snip, lots more errors ...

  that looks like that macro isn't defined -- on my fedora system,
it's defined as part of the "rpm-devel" rpm, which loads up
/usr/include/rpm/ with all sorts of rpm-related header files.

  so if i pop back to the build directory for "rpm" and check
"deploy-rpms", sure enough:

$ rpm -qpl rpm-dev-5.4.16-r0.ppc7400.rpm
warning: rpm-dev-5.4.16-r0.ppc7400.rpm: Header V4 DSA/SHA1 Signature,
key ID e638bdb5: NOKEY
/usr
/usr/include
/usr/include/rpm
/usr/include/rpm/argv.h
/usr/include/rpm/mire.h
/usr/include/rpm/pkgio.h
/usr/include/rpm/rpm46compat.h
/usr/include/rpm/rpm4compat.h
/usr/include/rpm/rpmbf.h
/usr/include/rpm/rpmbuild.h
/usr/include/rpm/rpmcb.h
/usr/include/rpm/rpmcli.h
/usr/include/rpm/rpmconstant.h
/usr/include/rpm/rpmdb.h
/usr/include/rpm/rpmds.h
/usr/include/rpm/rpmevr.h
/usr/include/rpm/rpmfi.h
/usr/include/rpm/rpmgi.h
/usr/include/rpm/rpmio.h
/usr/include/rpm/rpmiotypes.h
/usr/include/rpm/rpmlog.h
/usr/include/rpm/rpmmacro.h
/usr/include/rpm/rpmns.h
/usr/include/rpm/rpmpgp.h
/usr/include/rpm/rpmps.h
/usr/include/rpm/rpmrc.h
/usr/include/rpm/rpmspec.h
/usr/include/rpm/rpmsw.h
/usr/include/rpm/rpmtag.h
/usr/include/rpm/rpmte.h
/usr/include/rpm/rpmts.h
/usr/include/rpm/rpmtypes.h
/usr/include/rpm/rpmutil.h
... more ...

  so, later this morning, i'm going to take the obvious approach and
install "rpm-dev" to see if that fixes things (and subsequently add
that dependency to the perl-rpm2 recipe).

  does that make sense? it *seems* clear that to build perl-rpm2, i'll
need the rpm-dev package installed. am i on the right track here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


