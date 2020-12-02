Subject: Multi-threaded npm build
To: openembedded-core@lists.openembedded.org
From: michal.frynas@sigma.se
X-Originating-Location: Wrocław, Lower Silesia, PL (78.8.146.236)
X-Originating-Platform: Linux Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Dec 2020 08:25:56 -0800
Message-ID: <WyJB.1606926356468119429.WUQh@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="an0uumEmsZBP97ZybBqF"

--an0uumEmsZBP97ZybBqF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Task do_configure delivered by npm.bbclass takes a lot of time, the longer =
shrinkwrap dependency list the longer time needed for do_configure to execu=
te.
Following improvement allows to execute do_configure on any available CPI =
threads.

>=20
> diff --git a/bitbake/lib/bb/fetch2/npmsw.py
> b/bitbake/lib/bb/fetch2/npmsw.py
> index 0c3511d8ab..0e6075859c 100644
> --- a/bitbake/lib/bb/fetch2/npmsw.py
> +++ b/bitbake/lib/bb/fetch2/npmsw.py
> @@ -29,8 +29,9 @@ from bb.fetch2.npm import npm_integrity
> from bb.fetch2.npm import npm_localfile
> from bb.fetch2.npm import npm_unpack
> from bb.utils import is_semver
> +from concurrent.futures import ThreadPoolExecutor
>=20
> -def foreach_dependencies(shrinkwrap, callback=3DNone, dev=3DFalse):
> +def foreach_dependencies(shrinkwrap, callback=3DNone, dev=3DFalse,
> executor=3DNone):
> """
> Run a callback for each dependencies of a shrinkwrap file.
> The callback is using the format:
> @@ -49,7 +50,10 @@ def foreach_dependencies(shrinkwrap, callback=3DNone,
> dev=3DFalse):
> continue
> elif deps[name].get("bundled", False):
> continue
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 callback(name, =
deps[name], subtree)
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if executor:
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
xecutor.submit(callback, name=3Dname,
> params=3Ddeps[name], deptree=3Dsubtree)
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
allback(name, deps[name], subtree)
>=20
> _walk_deps(shrinkwrap.get("dependencies", {}), [])
>=20
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 068032a1e5..1869b63cdb 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -80,6 +80,7 @@ python npm_do_configure() {
> from bb.fetch2.npm import npm_unpack
> from bb.fetch2.npmsw import foreach_dependencies
> from bb.progress import OutOfProgressHandler
> +=C2=A0 =C2=A0 from concurrent.futures import ThreadPoolExecutor
>=20
> bb.utils.remove(d.getVar("NPM_CACHE"), recurse=3DTrue)
> bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=3DTrue)
> @@ -164,9 +165,11 @@ python npm_do_configure() {
> progress_done +=3D 1
> progress.write("%d/%d" % (progress_done, progress_total))
>=20
> +=C2=A0 =C2=A0 executor =3D ThreadPoolExecutor(max_workers =3D os.cpu_co=
unt())
> dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
> foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
> -=C2=A0 =C2=A0 foreach_dependencies(orig_shrinkwrap, _cache_dependency, =
dev)
> +=C2=A0 =C2=A0 foreach_dependencies(orig_shrinkwrap, _cache_dependency, =
dev,
> executor)
> +=C2=A0 =C2=A0 executor.shutdown(True)
>=20
> # Configure the main package
> with tempfile.TemporaryDirectory() as tmpdir:
>=20
>

--an0uumEmsZBP97ZybBqF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit; =
font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-si=
ze: 12pt; line-height: inherit; font-family: Calibri, Arial, Helvetica, san=
s-serif; vertical-align: baseline; color: #000000;">Task do_configure deliv=
ered by npm.bbclass takes a lot of time, the longer shrinkwrap dependency l=
ist the longer time needed for do_configure to execute.</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; font-family: Calibri, Arial, Helvetica, sa=
ns-serif; vertical-align: baseline; color: #000000;">Following improvement =
allows to execute do_configure on any available CPI threads.<br />
<blockquote>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">diff --git a/bi=
tbake/lib/bb/fetch2/npmsw.py b/bitbake/lib/bb/fetch2/npmsw.py</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">index 0c3511d8a=
b..0e6075859c 100644</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">--- a/bitbake/l=
ib/bb/fetch2/npmsw.py</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+++ b/bitbake/l=
ib/bb/fetch2/npmsw.py</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">@@ -29,8 +29,9 =
@@ from bb.fetch2.npm import npm_integrity</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;from bb.f=
etch2.npm import npm_localfile</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;from bb.f=
etch2.npm import npm_unpack</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;from bb.u=
tils import is_semver</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+from concurren=
t.futures import ThreadPoolExecutor</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">-def foreach_de=
pendencies(shrinkwrap, callback=3DNone, dev=3DFalse):</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+def foreach_de=
pendencies(shrinkwrap, callback=3DNone, dev=3DFalse, executor=3DNone):</div=
>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;"""</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;Run a callback for each dependencies of a shrinkwrap fil=
e.</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;The callback is using the format:</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">@@ -49,7 +50,10=
 @@ def foreach_dependencies(shrinkwrap, callback=3DNone, dev=3DFalse):</di=
v>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;elif deps[name].get("bundled=
", False):</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">-&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; callback(name, deps[name], subtre=
e)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if executor:</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; executor.submit(cal=
lback, name=3Dname, params=3Ddeps[name], deptree=3Dsubtree)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else:</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; callback(name, deps=
[name], subtree)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;_walk_deps(shrinkwrap.get("dependencies", {}), [])</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">diff --git a/me=
ta/classes/npm.bbclass b/meta/classes/npm.bbclass</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">index 068032a1e=
5..1869b63cdb 100644</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">--- a/meta/clas=
ses/npm.bbclass</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+++ b/meta/clas=
ses/npm.bbclass</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">@@ -80,6 +80,7 =
@@ python npm_do_configure() {</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;from bb.fetch2.npm import npm_unpack</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;from bb.fetch2.npmsw import foreach_dependencies</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;from bb.progress import OutOfProgressHandler</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
from concurrent.futures import ThreadPoolExecutor</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;bb.utils.remove(d.getVar("NPM_CACHE"), recurse=3DTrue)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=3DTrue)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">@@ -164,9 +165,=
11 @@ python npm_do_configure() {</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;progress_done +=3D 1</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;progress.write("%d/%d" % (progress_done, p=
rogress_total))</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
executor =3D ThreadPoolExecutor(max_workers =3D os.cpu_count())</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;dev =3D bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">-&nbsp; &nbsp; =
foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev, executor)</di=
v>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; =
executor.shutdown(True)</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp;</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;# Configure the main package</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &=
nbsp;with tempfile.TemporaryDirectory() as tmpdir:</div>
<div>&nbsp;</div>
</blockquote>
</div>
<div style=3D"margin: 0px; padding: 0px; border: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: 12pt; line-height: inherit; font-family: Calibri, Arial, Helvetica, sa=
ns-serif; vertical-align: baseline; color: #000000;">&nbsp;</div>

--an0uumEmsZBP97ZybBqF--
