Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E271E6D12B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 13:53:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Oct 2013 06:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,609,1378882800"; d="scan'208";a="425863724"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2013 06:52:59 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 31 Oct 2013 13:52:26 +0000
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.83]) by
	IRSMSX152.ger.corp.intel.com ([163.33.192.66]) with mapi id
	14.03.0123.003; Thu, 31 Oct 2013 13:52:26 +0000
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] oe-selftest proof of concept
Thread-Index: Ac7WDQZZRNYS7Kf/TvuytaHDS9G5QQAF7H4AAAWWpiA=
Date: Thu, 31 Oct 2013 13:52:26 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A1A96BD@IRSMSX103.ger.corp.intel.com>
References: <33115ABC4887814E8A92A08FBC93416B0A1A9528@IRSMSX103.ger.corp.intel.com>
	<4379965.nvzZzTEQm7@helios>
In-Reply-To: <4379965.nvzZzTEQm7@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-selftest proof of concept
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
X-List-Received-Date: Thu, 31 Oct 2013 13:53:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for the reply, Paul. I will make sure to make the most of your in=
put!

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Thursday, October 31, 2013 12:34 PM
> To: Stoicescu, CorneliuX
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] oe-selftest proof of concept
>=20
> Hi Corneliu,
>=20
> This is a well-rounded proposal, thanks. Some comments below.
>=20
> On Thursday 31 October 2013 07:53:48 Stoicescu, CorneliuX wrote:
> > This e-mail was originally sent to the Yocto mailing list in the form
> > of 2 e-mails. As per Paul's and Richard's request, I am re-sending and
> > moving the conversation here. Feel free to add any input :) .
> >
> > NOTE: I also made a small syntax correction in the example at the end
> > of the e-mail for oeSelfTest.var_append() .
> >
> > After a chat with Richard and Stefan, I came up with an outline of how
> > the oe-selftest
> > feature(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4740
> > ) should look like. I made a summary of my proposal below. Please feel
> > free to add your thoughts!
> >
> > There will be a new script introduced(similar to bitbake-selftest)
> > that will use python unit test to execute tests. Name has not been
> > decided but it can be "oe-selftest". Running this script will not compr=
omise
> poky in any way.
> > Initially, the script does not need any preparation in order to be
> > run. If this changes in the future, the user will be prompted upon
> > execution with the pre-required tasks. Oe-selftest can be used
> > together with the automated runtime tests if necessary.
> >
> > The following types of tests are targeted for the initial implementatio=
n:
> > - testing the functionality of scripts in poky/scripts (such as:
> > bitbake-layers, yocto-bsp, yocto-kernel, yocto-layers) - testing of
> > the 'bitbake' command and its output (this includes output data
> > validation such as the sstate-cache/ and tmp/ directories)
>=20
> It could be considered a separate exercise, but I'd like us to test the
> installation and usage of the SDK installer as well. Initially this would=
 be fairly
> straightforward - install the SDK to a non-standard location, fetch some
> nominated piece of source code and try to build it using the installed SD=
K.
> (One issue springs to mind though - unless we take steps to guard against=
 it,
> this won't be able to pick up problems where the SDK contains references =
to
> files within TMPDIR, since those will still be valid on the build host).
>=20
> Later we'd want to be able to test the executables produced using the SDK
> on the target; however that would presumably necessitate some integration
> with the runtime tests and that could be complicated.
>=20

We will be able to add such functionality with ease once we are able to run=
 bitbake commands in a shared resources multi-build environment. It would h=
elp though to keep in mind when designing the execute method that ${BUILDDI=
R} should actually be more like ${WORKDIR} and we should be able to create =
more types of build environments(not just poky/build/ types).

> > In order to achieve the above, the script will need to:
> >
> > -          manipulate configuration files and variables
> >
> > -          issue commands in a certain order
> >
> > -          analyze command output
> >
> > -          analyze output files and directories
> >
> > -          manage shared resources such as sstate-cache
> >
> > Oe-selftest will use Python Unit Testing as follows:
> >                 - we will use what has already been done with the 'unit=
test'
> > and 'oeqa' classes. This includes 'decorators' and methods like
> > 'skipModules'. - the tests configuration files will be similar to
> > those of the automated runtime tests.
> > - because we are using the same framework and structure, the output
> > will also be similar to that of the automated runtime tests
> > - the build environments used will be set up in the setUpClass() or
> > setUpModule() methods
> >    * local.conf may be modified here to use shared resources like
> > sstate-cache and downloads directory with other build environments -
> > the build environments used will be removed in the
> > tearDownClass() or tearDownModule() methods * this ensures no residue
> > is left over that we are not aware of
> > - we will add a new class
> > oeqa.oeSelfTest that contains the following base methods:
> >
> > 1) A few methods to manipulate variables in poky in a standardized way:
> >                 -
> > oeSelfTest.var_rewrite(filepath_relative_to_poky_location,
> > variable_name, new_variable_value) * resets a variable to the
> > specified value(may be similar to how HOB does to local.conf and
> > bblayers.conf) -
> > oeSelfTest.var_append(filepath_relative_to_poky_location,
> > variable_name,
> > appended_variable_value) * appends data to a variable
> >                 -
> > oeSelfTest.var_remove(filepath_relative_to_poky_location,
> > variable_name, remove_variable_value) * removes data from a variable
> >
> > 2) We need to be able to execute tasks in a multiple build directories
> > environment.
> > - oeSelfTest.execute(command, build_dir)
> >                                 * this method executes the command 'com=
mand'
> > from 'build_dir' * for each execution, the environment is sourced
> > (similar to autobuilder) (if the build directory does not exist, the
> > command will fail. This needs to be taken care of in the setUpClass()
> > method) * it returns the exit code and the output of the command
> >
> > Additional information/notes:
> > - class and method naming and structure is not final and open for
> > suggestions
> > - poky under git is required for the script to work; we will use git
> > to reset modified files to default.
>=20
> Actually I think we should avoid modifying existing files if at all possi=
ble -
> instead we should add an additional layer on top to make changes, using
> bbappends / overlayed recipes as necessary. There are several reasons for
> this:
>=20
> * Most of the time this is the approach users should be using when they
> make customisations, so it's what we ought to concentrate on testing.
>=20
> * It preserves the ability to run the tests with uncommitted changes, whi=
ch
> would be useful during development.
>=20
> * Last but certainly not least, the tests need to work also in separate O=
E-
> Core + BitBake  configuration, since that's how many in the community use
> the build system. If we don't try to manage the repository this should ju=
st
> work without extra effort.
>=20

I also think a meta-selftest layer would be helpful and make the oe-selftes=
t functionality self-contained. The git functionality will be there anyway =
if special situations arise though.=20

> > - a policy needs to be set in place(after experience has been gained
> > from using the tool) for working with a shared sstate-cache directory
> > and multiple build environments at a time.
>=20
> For tests where it matters, we'll have to ensure the sstate-cache only
> contains what we need it to contain. I suspect this will mean we'll need =
to
> have the script set SSTATE_DIR and SSTATE_MIRRORS so that any user
> configuration of these doesn't interfere with the test.
>=20

We can do this when setting up the build environment. This can be done eith=
er by exporting variables(straying from the normal use pattern) or setting =
them in local.conf(following the normal use pattern). I believe we should n=
ot stray too far from the normal use pattern because the results might not =
be so relevant(though having both or a combination may be a good settle). W=
e need to design the 'execute', 'var_append' and 'var_rewrite' methods to f=
ollow normal user patterns in order to get the best data possible.=20

> > - coding style is very important in order to get a reasonable
> > execution time. At the moment this is not a priority though.
>=20
> I guess this is perhaps implicit; but we'll want to have a means of easil=
y
> selecting which tests to run (as we currently do with the runtime testing=
).
>=20
> > - no strategy has been put in place yet in order to deal with multiple
> > poky environments
>
 > What exactly do you mean by this?

There are some(few) test cases that require having multiple poky directorie=
s at the same time (example: the 'bitbake-prserv' tool) . I cannot say of i=
f the future these types of tests will become more "popular".

>=20
> > I made an example of how we can use the functionality described to
> > conduct 3 of our test cases:
> > https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=3D90
> > https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=3D93
> > https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=3D83
> >
> > As mentioned, the structure is very similar to the automated runtime
> > tests configuration files. NOTE: ${POKYDIR} does not exist but I use
> > it to refer to the location of the poky directory.
> >
> > "
> > import unittest
> > import os
> > from oeqa import oeSelfTest, skipModule from oeqa.utils.decorators
> > import *
> >
> > def setUpModule():
> > #             Here we set up the environment for a build directory
> >
> > class bitbake_layers(oeSelfTest):
> >
> >                 @classmethod
> >                 def setUpClass(self):
> > #                             Here we set up special settings for the b=
uild
> > environment, like shared sstate-cache directory
> >
> >                 def test_show_overlayed(self):
> >                                 oeSelfTest.execute("cp -R
> > ${POKYDIR}/meta/recipes-graphics/clutter
> > ${POKYDIR}/meta/recipes-core/") (status, output) =3D
> > oeSelfTest.execute("bitbake-layers show_overlayed | grep clutter",
> > build_dir) oeSelfTest.execute("rm -R
> > ${POKYDIR}/meta/recipes-core/clutter") self.assertEqual(status, 0,
> > msg=3D"Could not find overlayed recipe")
> >
> >                 def test_show_appends(self):
> >                                 oeSelfTest.execute("echo "" >
> > ${POKYDIR}/meta-yocto/recipes-core/busybox/linux-
> yocto_3.10.bbappend"/
> > ") (status, output) =3D oeSelfTest.execute("bitbake_layers show_appends
> > | grep
> > \"/meta-yocto/recipes-core/busybox/linux-yocto_3.10.bbappend\"",
> > build_dir) self.assertEqual(status, 0, msg=3D" 'bitbake_layers
> > show_appends' Could not find the bbappend file")
> >
> >                 def test_show_layers(self):
> >                                 (ls_status) =3D oeSelfTest.execute("ls
> > ${POKYDIR} | grep meta-intel") if ls_status =3D=3D 1:
> >                                                 (git_status) =3D
> > oeSelfTest.execute("git clone git://git.yoctoproject.org/meta-intel
> > ${POKYDIR}/")
> > oeSelfTest.var_append("${BUILDDIR}/conf.bblayers.conf",
> > "BBLAYERS", "${POKYDIR}/meta-intel")
> >
> > (status, output) =3D
> > oeSelfTest.execute("bitbake-layers show_layers | grep meta-intel",
> > build_dir)
>=20
> I know the test case mentions it explicitly, but we don't actually need m=
eta-
> intel to check this functionality, any layer will work. We probably ought=
 to be
> creating a meta-selftest layer (or similar) within OE-Core that we could =
use
> for this purpose and the addition of bbappends / additional configuration=
.
> This avoids the need for something like POKYDIR as well.
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

Regards,
Corneliu
Romania Yocto QA

