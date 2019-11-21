Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 62D347F8D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 06:27:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2019 22:27:36 -0800
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; 
	d="scan'208,217";a="209994384"
Received: from nvkremer-mobl1.amr.corp.intel.com ([10.252.133.123])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2019 22:27:36 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
Message-Id: <549C1F29-84E4-43A3-9DD2-FBED13A92C37@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Wed, 20 Nov 2019 22:27:35 -0800
In-Reply-To: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com,
	openembedded-core@lists.openembedded.org, bunk@stusta.de
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
X-List-Received-Date: Thu, 21 Nov 2019 06:27:35 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_31985018-FC0F-43FF-9CEC-31CCDD18B0E7"

--Apple-Mail=_31985018-FC0F-43FF-9CEC-31CCDD18B0E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Nov 20, 2019, at 1:33 AM, Jean-Marie LEMETAYER =
<jean-marie.lemetayer@savoirfairelinux.com> wrote:
>=20
> The current NPM support have several issues:
> - The current NPM fetcher downloads the dependency tree but not the =
other
>   fetchers. The 'subdir' parameter was used to fix this issue.
> - They are multiple issues with package names (uppercase, exotic =
characters,
>   scoped packages) even if they are inside the dependencies.
> - The lockdown file generation have issues. When a package depends on
>   multiple version of the same package (all versions have the same =
checksum).
>=20
> This patchset refactors the NPM support in Yocto:
> - As the NPM algorithm for dependency management is hard to handle, =
the new
>   NPM fetcher downloads only the package source (and not the =
dependencies,
>   like the other fetchers) (patch submitted in the bitbake-devel =
list).
> - The NPM class handles the dependencies using NPM (and not manually).
> - The NPM recipe creation is simplified to avoid issues.
> - The lockdown file is no more used as it is no longer relevant =
compared to the
>   latest shrinkwrap file format.
>=20
> This patchset may remove some features (lockdown file, license =
management for
> dependencies) but fixes the majority of the NPM issues. All of these =
issues
> from the bugzilla.yoctoproject.org are resolved by this patchset:
> #10237, #10760, #11028, #11728, #11902, #12534
>=20
> The fetcher and recipetool are now aware of a 'latest' keyword for the =
version
> which allow to build the latest version available on the registry. =
This feature
> fixes the two issues: #10515, #11029
>=20
> Moreover the issue #13415 should also be fixed but I cannot test it.
>=20
> I have tested the recipe creation and builds using a self made example =
to
> generate build failures:
> - https://github.com/savoirfairelinux/node-server-example
> - https://npmjs.com/package/@savoirfairelinux/node-server-example
>=20
> The test steps are these ones:
>  $ source poky/oe-init-build-env
>  $ bitbake-layers add-layer ../meta-openembedded/meta-oe
>  $ devtool add =
"npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-example;ver=
sion=3Dlatest=E2=80=9D

I noticed this before but forgot to report it:

ERROR: Nothing PROVIDES 'c-ares-native' (but =
virtual:native:/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/no=
dejs_10.17.0.bb DEPENDS on or otherwise requires it). ...
http://layers.openembedded.org/layerindex/recipe/50318/ =
<http://layers.openembedded.org/layerindex/recipe/50318/>
$ bitbake-layers add-layer ../meta-openembedded/meta-networking
Which requires
$ bitbake-layers add-layer ../meta-openembedded/meta-python


Using tip of bitbake with V3, openembedded-core with V3 and =
meta-openembedded master, somehow nodejs-native do_compile broke (at =
least on qemux86-64) since the last time I built it shortly after =
ELC-E=E2=80=A6
So now I=E2=80=99ll have to git bisect that=E2=80=A6more to come=E2=80=A6

FWIW I had previously successfully run your instructions and the tests =
for both bitbake and oe-selftest for V2 (distroless, e.g. not with =
poky). Something unrelated has broken I suspect.

>  $ devtool build savoirfairelinux-node-server-example
>  $ bitbake-layers create-layer ../meta-test
>  $ bitbake-layers add-layer ../meta-test
>  $ devtool finish savoirfairelinux-node-server-example ../meta-test
>  $ echo IMAGE_INSTALL_append =3D '" =
savoirfairelinux-node-server-example"' >> conf/local.conf
>  $ bitbake core-image-minimal
>=20
> Also the 'devtool add' url could be one of these:
> - =
npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-example;vers=
ion=3Dlatest
>   This url uses the new npm fetcher and request the latest version =
available on
>   the registry.
> - =
npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-example;vers=
ion=3D1.0.0
>   This url uses the new npm fetcher and request a fixed version.
> - =
git://github.com/savoirfairelinux/node-server-example.git;protocol=3Dhttps=

>   This url uses the git fetcher. As the dependencies are managed by =
the NPM
>   class, any fetcher can be used.
>=20
> When this patchset will be merged, I have planned to update the NPM =
wiki:
>  https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM
>=20
> This patchset is also the base work for the full Angular support in =
Yocto that I
> am preparing. These applications have a huge dependency tree which is =
ideal to
> test the NPM support.
>=20
> --- V2
>=20
> - Add the 'check_network_access' function before each network access =
to check
>   for 'BB_NO_NETWORK' and 'BB_ALLOWED_NETWORKS' variables.
>=20
> - Add a 'recipetool.RecipetoolTests.test_recipetool_create_npm' test =
case for
>   'oe-selftest' to test the npm recipe creation.
>=20
> - Update the 'npm.bbclass' to fetch the dependencies in the 'do_fetch' =
task.
>   The dependencies are cached in a npm cache stored in =
'${DL_DIR}/npm_cache'
>   allowing the dependencies to be saved in the download directory and =
verify
>   on insertion and extraction [1]:
>      "All data that passes through the cache is fully verified
>       for integrity on both insertion and extraction."
>=20
> 1: https://docs.npmjs.com/cli/cache.html
>=20
> --- V3
>=20
> - Add a test regarding the 'devtool add' and 'devtool build' command:
>     - devtool.DevtoolAddTests.test_devtool_add_npm
>=20
> - Add the license management for dependencies.
>=20
> - Split the npm workflow to use the bitbake default tasks (do_fetch, =
do_unpack,
>   do_compile, do_install). Make sure that only the do_fetch task =
requires
>   network access.
>=20
> - Split the commits for better understanding.
>=20
> - Force the rebuild of prebuild addons.
>=20
> - Use ${nonarch_libdir} instead of ${libdir} in the do_install task.
>=20
>  - These patches can be found here:
>     - =
https://github.com/savoirfairelinux/openembedded-core/tree/npm-refactoring=
-v3
>     - https://github.com/savoirfairelinux/poky/tree/npm-refactoring-v3
>=20
> Jean-Marie LEMETAYER (17):
>  devtool: npm: update command line options
>  npm.bbclass: refactor the npm class
>  recipetool/create_npm.py: refactor the npm recipe creation handler
>  lib/oe/package.py: remove unneeded npm_split_package_dirs function
>  devtool/standard.py: npm: update the append file
>  recipetool/create.py: npm: remove the 'noverify' url parameter
>  recipetool/create.py: npm: replace the 'latest' keyword
>  npm.bbclass: split the do_compile task
>  devtool/standard.py: npm: exclude the node_modules directory
>  recipetool/create_npm.py: handle the licenses of the dependencies
>  npm.bbclass: restrict the build to be offline
>  npm.bbclass: use the local node headers
>  recipetool/create_npm.py: convert the shrinkwrap file
>  npm.bbclass: force to rebuild the prebuild addons
>  devtool/standard.py: npm: configure the NPM_CACHE_DIR to be =
persistent
>  oeqa/selftest/recipetool: add npm recipe creation test
>  oeqa/selftest/devtool: add npm recipe build test
>=20
> meta/classes/npm.bbclass                   | 224 +++++---
> meta/lib/oe/package.py                     |  33 --
> meta/lib/oeqa/selftest/cases/devtool.py    |  20 +
> meta/lib/oeqa/selftest/cases/recipetool.py |  21 +
> scripts/lib/devtool/standard.py            |  31 +-
> scripts/lib/recipetool/create.py           |  16 +-
> scripts/lib/recipetool/create_npm.py       | 565 +++++++++++----------
> 7 files changed, 510 insertions(+), 400 deletions(-)
>=20
> --
> 2.20.1
>=20


--Apple-Mail=_31985018-FC0F-43FF-9CEC-31CCDD18B0E7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 20, 2019, at 1:33 AM, Jean-Marie LEMETAYER &lt;<a =
href=3D"mailto:jean-marie.lemetayer@savoirfairelinux.com" =
class=3D"">jean-marie.lemetayer@savoirfairelinux.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">The current NPM support have several issues:<br class=3D""> - =
The current NPM fetcher downloads the dependency tree but not the =
other<br class=3D""> &nbsp;&nbsp;fetchers. The 'subdir' parameter was =
used to fix this issue.<br class=3D""> - They are multiple issues with =
package names (uppercase, exotic characters,<br class=3D""> =
&nbsp;&nbsp;scoped packages) even if they are inside the =
dependencies.<br class=3D""> - The lockdown file generation have issues. =
When a package depends on<br class=3D""> &nbsp;&nbsp;multiple version of =
the same package (all versions have the same checksum).<br class=3D""><br =
class=3D"">This patchset refactors the NPM support in Yocto:<br =
class=3D""> - As the NPM algorithm for dependency management is hard to =
handle, the new<br class=3D""> &nbsp;&nbsp;NPM fetcher downloads only =
the package source (and not the dependencies,<br class=3D""> =
&nbsp;&nbsp;like the other fetchers) (patch submitted in the =
bitbake-devel list).<br class=3D""> - The NPM class handles the =
dependencies using NPM (and not manually).<br class=3D""> - The NPM =
recipe creation is simplified to avoid issues.<br class=3D""> - The =
lockdown file is no more used as it is no longer relevant compared to =
the<br class=3D""> &nbsp;&nbsp;latest shrinkwrap file format.<br =
class=3D""><br class=3D"">This patchset may remove some features =
(lockdown file, license management for<br class=3D"">dependencies) but =
fixes the majority of the NPM issues. All of these issues<br =
class=3D"">from the <a href=3D"http://bugzilla.yoctoproject.org" =
class=3D"">bugzilla.yoctoproject.org</a> are resolved by this =
patchset:<br class=3D"">#10237, #10760, #11028, #11728, #11902, =
#12534<br class=3D""><br class=3D"">The fetcher and recipetool are now =
aware of a 'latest' keyword for the version<br class=3D"">which allow to =
build the latest version available on the registry. This feature<br =
class=3D"">fixes the two issues: #10515, #11029<br class=3D""><br =
class=3D"">Moreover the issue #13415 should also be fixed but I cannot =
test it.<br class=3D""><br class=3D"">I have tested the recipe creation =
and builds using a self made example to<br class=3D"">generate build =
failures:<br class=3D""> - <a =
href=3D"https://github.com/savoirfairelinux/node-server-example" =
class=3D"">https://github.com/savoirfairelinux/node-server-example</a><br =
class=3D""> - <a =
href=3D"https://npmjs.com/package/@savoirfairelinux/node-server-example" =
class=3D"">https://npmjs.com/package/@savoirfairelinux/node-server-example=
</a><br class=3D""><br class=3D"">The test steps are these ones:<br =
class=3D""> &nbsp;$ source poky/oe-init-build-env<br class=3D""> &nbsp;$ =
bitbake-layers add-layer ../meta-openembedded/meta-oe<br class=3D""> =
&nbsp;$ devtool add "<a =
href=3D"npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-exam=
ple;version=3Dlatest" =
class=3D"">npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-e=
xample;version=3Dlatest</a>=E2=80=9D</div></div></blockquote><div><br =
class=3D""></div><div>I noticed this before but forgot to report =
it:</div><div><br class=3D""></div>ERROR: Nothing PROVIDES =
'c-ares-native' (but =
virtual:native:/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/no=
dejs_10.17.0.bb DEPENDS on or otherwise requires it). ...</div><div><a =
href=3D"http://layers.openembedded.org/layerindex/recipe/50318/" =
class=3D"">http://layers.openembedded.org/layerindex/recipe/50318/</a></di=
v><div>$ bitbake-layers add-layer =
../meta-openembedded/meta-networking</div><div>Which =
requires</div><div>$ bitbake-layers add-layer =
../meta-openembedded/meta-python</div><div><br class=3D""></div><div><br =
class=3D""></div><div>Using tip of bitbake with V3, openembedded-core =
with V3 and meta-openembedded master, somehow nodejs-native do_compile =
broke (at least on qemux86-64) since the last time I built it shortly =
after ELC-E=E2=80=A6</div><div>So now I=E2=80=99ll have to git bisect =
that=E2=80=A6more to come=E2=80=A6</div><div><br =
class=3D""></div><div>FWIW I had previously successfully run your =
instructions and the tests for both bitbake and oe-selftest for V2 =
(distroless, e.g. not with poky). Something unrelated has broken I =
suspect.</div><div><br class=3D""></div><div><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""> &nbsp;$ devtool build =
savoirfairelinux-node-server-example<br class=3D""> &nbsp;$ =
bitbake-layers create-layer ../meta-test<br class=3D""> &nbsp;$ =
bitbake-layers add-layer ../meta-test<br class=3D""> &nbsp;$ devtool =
finish savoirfairelinux-node-server-example ../meta-test<br class=3D""> =
&nbsp;$ echo IMAGE_INSTALL_append =3D '" =
savoirfairelinux-node-server-example"' &gt;&gt; conf/local.conf<br =
class=3D""> &nbsp;$ bitbake core-image-minimal<br class=3D""><br =
class=3D"">Also the 'devtool add' url could be one of these:<br =
class=3D""> - <a =
href=3D"npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-exam=
ple;version=3Dlatest" =
class=3D"">npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-e=
xample;version=3Dlatest</a><br class=3D""> &nbsp;&nbsp;This url uses the =
new npm fetcher and request the latest version available on<br class=3D"">=
 &nbsp;&nbsp;the registry.<br class=3D""> - <a =
href=3D"npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-exam=
ple;version=3D1.0.0" =
class=3D"">npm://registry.npmjs.org;name=3D@savoirfairelinux/node-server-e=
xample;version=3D1.0.0</a><br class=3D""> &nbsp;&nbsp;This url uses the =
new npm fetcher and request a fixed version.<br class=3D""> - <a =
href=3D"git://github.com/savoirfairelinux/node-server-example.git;protocol=
=3Dhttps" =
class=3D"">git://github.com/savoirfairelinux/node-server-example.git;proto=
col=3Dhttps</a><br class=3D""> &nbsp;&nbsp;This url uses the git =
fetcher. As the dependencies are managed by the NPM<br class=3D""> =
&nbsp;&nbsp;class, any fetcher can be used.<br class=3D""><br =
class=3D"">When this patchset will be merged, I have planned to update =
the NPM wiki:<br class=3D""> &nbsp;<a =
href=3D"https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM" =
class=3D"">https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM</a><br =
class=3D""><br class=3D"">This patchset is also the base work for the =
full Angular support in Yocto that I<br class=3D"">am preparing. These =
applications have a huge dependency tree which is ideal to<br =
class=3D"">test the NPM support.<br class=3D""><br class=3D"">--- V2<br =
class=3D""><br class=3D""> - Add the 'check_network_access' function =
before each network access to check<br class=3D""> &nbsp;&nbsp;for =
'BB_NO_NETWORK' and 'BB_ALLOWED_NETWORKS' variables.<br class=3D""><br =
class=3D""> - Add a =
'recipetool.RecipetoolTests.test_recipetool_create_npm' test case for<br =
class=3D""> &nbsp;&nbsp;'oe-selftest' to test the npm recipe =
creation.<br class=3D""><br class=3D""> - Update the 'npm.bbclass' to =
fetch the dependencies in the 'do_fetch' task.<br class=3D""> =
&nbsp;&nbsp;The dependencies are cached in a npm cache stored in =
'${DL_DIR}/npm_cache'<br class=3D""> &nbsp;&nbsp;allowing the =
dependencies to be saved in the download directory and verify<br =
class=3D""> &nbsp;&nbsp;on insertion and extraction [1]:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"All data that passes through the cache is =
fully verified<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for =
integrity on both insertion and extraction."<br class=3D""><br =
class=3D"">1: <a href=3D"https://docs.npmjs.com/cli/cache.html" =
class=3D"">https://docs.npmjs.com/cli/cache.html</a><br class=3D""><br =
class=3D"">--- V3<br class=3D""><br class=3D""> - Add a test regarding =
the 'devtool add' and 'devtool build' command:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;- =
devtool.DevtoolAddTests.test_devtool_add_npm<br class=3D""><br class=3D"">=
 - Add the license management for dependencies.<br class=3D""><br =
class=3D""> - Split the npm workflow to use the bitbake default tasks =
(do_fetch, do_unpack,<br class=3D""> &nbsp;&nbsp;do_compile, =
do_install). Make sure that only the do_fetch task requires<br class=3D"">=
 &nbsp;&nbsp;network access.<br class=3D""><br class=3D""> - Split the =
commits for better understanding.<br class=3D""><br class=3D""> - Force =
the rebuild of prebuild addons.<br class=3D""><br class=3D""> - Use =
${nonarch_libdir} instead of ${libdir} in the do_install task.<br =
class=3D""><br class=3D""> &nbsp;- These patches can be found here:<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;- <a =
href=3D"https://github.com/savoirfairelinux/openembedded-core/tree/npm-ref=
actoring-v3" =
class=3D"">https://github.com/savoirfairelinux/openembedded-core/tree/npm-=
refactoring-v3</a><br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;- <a =
href=3D"https://github.com/savoirfairelinux/poky/tree/npm-refactoring-v3" =
class=3D"">https://github.com/savoirfairelinux/poky/tree/npm-refactoring-v=
3</a><br class=3D""><br class=3D"">Jean-Marie LEMETAYER (17):<br =
class=3D""> &nbsp;devtool: npm: update command line options<br class=3D"">=
 &nbsp;npm.bbclass: refactor the npm class<br class=3D""> =
&nbsp;recipetool/create_npm.py: refactor the npm recipe creation =
handler<br class=3D""> &nbsp;lib/oe/package.py: remove unneeded =
npm_split_package_dirs function<br class=3D""> =
&nbsp;devtool/standard.py: npm: update the append file<br class=3D""> =
&nbsp;recipetool/create.py: npm: remove the 'noverify' url parameter<br =
class=3D""> &nbsp;recipetool/create.py: npm: replace the 'latest' =
keyword<br class=3D""> &nbsp;npm.bbclass: split the do_compile task<br =
class=3D""> &nbsp;devtool/standard.py: npm: exclude the node_modules =
directory<br class=3D""> &nbsp;recipetool/create_npm.py: handle the =
licenses of the dependencies<br class=3D""> &nbsp;npm.bbclass: restrict =
the build to be offline<br class=3D""> &nbsp;npm.bbclass: use the local =
node headers<br class=3D""> &nbsp;recipetool/create_npm.py: convert the =
shrinkwrap file<br class=3D""> &nbsp;npm.bbclass: force to rebuild the =
prebuild addons<br class=3D""> &nbsp;devtool/standard.py: npm: configure =
the NPM_CACHE_DIR to be persistent<br class=3D""> =
&nbsp;oeqa/selftest/recipetool: add npm recipe creation test<br =
class=3D""> &nbsp;oeqa/selftest/devtool: add npm recipe build test<br =
class=3D""><br class=3D""> meta/classes/npm.bbclass =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 224 +++++---<br class=3D""> =
meta/lib/oe/package.py =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;33 --<br class=3D"">=
 meta/lib/oeqa/selftest/cases/devtool.py &nbsp;&nbsp;&nbsp;| &nbsp;20 =
+<br class=3D""> meta/lib/oeqa/selftest/cases/recipetool.py | &nbsp;21 =
+<br class=3D""> scripts/lib/devtool/standard.py =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| =
&nbsp;31 +-<br class=3D""> scripts/lib/recipetool/create.py =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;16 =
+-<br class=3D""> scripts/lib/recipetool/create_npm.py =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 565 +++++++++++----------<br =
class=3D""> 7 files changed, 510 insertions(+), 400 deletions(-)<br =
class=3D""><br class=3D"">--<br class=3D"">2.20.1<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_31985018-FC0F-43FF-9CEC-31CCDD18B0E7--
