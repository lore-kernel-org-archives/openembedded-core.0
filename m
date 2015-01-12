Return-Path: <kergoth@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 129F260670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 18:01:23 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id f10so10292774yha.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 10:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KO7viYpdQhKoWBn0cEUOmneBdis4siGJMkkQUUiKFBk=;
	b=DXCVABd6LdCB+RlU2em1jTSMwwKgZah+vocZ9fpBa1Zg15aplTXwTsn80XdJv1cr3t
	eXbvgDF6qfqeLwGQ6KAL++rU1fzsKeRhEEATQ0CTj4mkuumaKWZ4iqMfdssikSaUbx68
	p9JI6iC7M41gMCzYKMPxbpIeUfAlJk7h37eLznT/rQOwXdQ6bZ8DEzJTDm7whHJz3m7z
	KzG4KPJuCwH9OS4GG35eEW35vazpICSPI0nPG+cjE7X4W/DAMK5F7l8n4Wgg0lYNJUkb
	ov5bocKz54FxKNuPn4oztgKU8I4xY9dsv8Ly5T6JMJhkTXqSJ6axY/LpmOWAQjQn57Io
	BPYw==
X-Received: by 10.170.188.8 with SMTP id f8mr26664682yke.114.1421085678005;
	Mon, 12 Jan 2015 10:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.170.190.16 with HTTP; Mon, 12 Jan 2015 10:00:56 -0800 (PST)
In-Reply-To: <5115458.ATlrg5uZUd@peggleto-mobl5.ger.corp.intel.com>
References: <1420741450-28220-1-git-send-email-kergoth@gmail.com>
	<5115458.ATlrg5uZUd@peggleto-mobl5.ger.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 12 Jan 2015 11:00:56 -0700
Message-ID: <CABcZAN=nB-m5560EeeHODqjWJ7MvFKQrGNZr2va70+iOb8J8=A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Mon, 12 Jan 2015 18:01:36 -0000
Content-Type: multipart/alternative; boundary=001a1139709c087371050c784bf4

--001a1139709c087371050c784bf4
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 12, 2015 at 7:15 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Chris,
>
> On Thursday 08 January 2015 11:24:08 Christopher Larson wrote:
> > - Handles distutils & setuptools.
> > - Supports pulling metadata from PKG-INFO, .egg-info, & setup.py (via two
> >   different mechanisms).
> > - Doesn't handle python 3 yet.
> > - Optional dependencies via `extra_requires` are not currently
> >   handled.
> > - Implements scanning for dependencies by using the python ast to
> >   determine what modules/packages are being imported by the python
> >   code in question
> >
> > See https://gist.github.com/kergoth/6cca6caa4e9b22a21f75 for the
> projects
> > I used to test this against, and
> > https://gist.github.com/kergoth/7fea9494e3cf60b382ff which is the
> result of
> > running recipetool create against every recipe that inherits distutils or
> > setuptools in my build environment.
> >
> > https://gist.github.com/kergoth/7ad4b5102b2a5fe3a956 has my current
> TODO for
> > this feature.
>
> This works pretty well, thanks!
>
> I tried this on python-mako and got this:
>
> ------------- snip --------------
> ...
> # WARNING: the following rdepends are from setuptools install_requires.
> These
> # upstream names may not correspond exactly to bitbake package names.
> RDEPENDS_${PN} += "markupsafe"
>
> # WARNING: the following rdepends are determined through basic analysis of
> the
> # python sources, and might not be 100% accurate. It is your
> responsibility to
> # verify that the values are complete and correct.
> RDEPENDS_${PN} += "python-core python-textutils"
>
> # WARNING: We were unable to map the following python package/module
> # dependencies to the bitbake packages which include them:
> #    mako.lookup
> #    mako.template
> #    sys
> ------------- snip --------------
>

There was a bug which didn't properly detect a case where some of its info
from setup.py (`scripts` in this case) is available, but some of it is not
(`packages`), and as a result ended up only parsing some of the python code
available. Since the paths provided to the dependency scanning are also
passed to the packages search, it didn't pick up on the provide of mako &
mako.* either. Once that's fixed, it looks like this:
https://gist.github.com/0a641e90cdfd37fd2100.

* Shouldn't it know that sys is provided by python-core (maybe this has to
> be
> hardcoded)?
>

Yeah, there are cases where it can't pick up a provide. Built-in modules
(which is the case here), C extensions, or if a module is renamed or
similar programmatically (os.path is actually posixpath in linux).

It seems that sys.builtin_module_names lists the built-in modules. To get
at that list, we could use that from recipetool and implicitly assume that
this list is the same for the host python as the target, which isn't ideal,
or we could run the native python from the sysroot, which I'm not currently
using in any way, or we could copy the list into recipetool. Thoughts?

* Our existing recipe has "python-threading python-netclient python-html"
> for
> RDEPENDS_${PN}, I don't know if all of these are correct but it does at
> least
> try to import threading.
>

With the aforementioned bug fixed, it picks up these and many others,
thankfully.


> * Should we just assume by convention that package names should start with
> "python-" and thus make that prefix on all items brought in from setuptools
> install_requires?
>

Good question, I'd thought about this too. Whichever way we go, the user
will have to review and confirm sanity regardless, so it's a matter of
trying to optimize for the common case. One would hope that the python-
convention would be the common case, so I'm not opposed to this.

>
> * I think "It is your responsibility ..." is a little harsh for the
> dependency
> situation - you'll soon find out at runtime if the value is insufficient.
> I used
> this wording for LICENSE because if you don't check it yourself you won't
> find
> out if it's incorrect.
>

K, I'll drop that.

Earlier you mentioned it would be nice if the buildsystem handler could
> replace the existing value of LICENSE - I checked and it already can;
> you'll
> find the existing value in lines_before. It's all a little bit clunky
> API-wise
> but it is at least possible.
>

Ah! I swear I tried exactly that, but apparently something went wrong. I'll
look into adding that feature to simplify the recipe.

I also noticed when looking at this that my code wasn't replacing the
> version
> with ${PV} in S (but was in SRC_URI). I'll send a patch to fix that. The
> way
> the code works at the moment, I only replace it in SRC_URI if you've
> specified
> a file name containing the version and then we can find that same version
> in the
> SRC_URI value (I'm not sure there is any other practical way)
>

Cool, thanks. I'd noticed this too (in fact it's in the linked todo list :).

After reviewing the generated recipe for mako more closely, I see multiple
potential concerns:
- It doesn't handle find_packages() for packages in setup.py. This is
relatively minor, without knowing the list of packages being shipped, we
just scan the whole source tree -- this is why things like nose are showing
up in the new recipe, because it scanned the unit test suite. So I see this
as a potential future enhancement.
- setuptools/pkg_resources still isn't being properly mapped, even with
both python and python-distribute built. It looks like python-distribute
ships setuptools.py & friends in an egg, and the package search via pkgdata
isn't handling that. - Fixed locally.
- The detected 'beaker' dependency is an optional one, which we'd know if
we parsed extra_requires() or the optional sections of
*.egg-info/requires.txt. This is a known limitation and is already on the
todo list.
- The babel/pygments/templating deps are slightly interesting. Mako doesn't
actually depend on these itself, but it does provide extensions to those
projects via entry points. It could be worth enhancing the tool to handle
those specially, either excluding the entry point packages from the
dependency scanning, or somehow automatically splitting out the entry point
bits into separate binary packages, but that'd be slightly non-trivial, and
might be more "magic" than we want going on. Worth looking into as a
potential enhancement.
- urllib.parse/urllib.request/html.entities: these were picked up out of
compat.py, which does runtime python 2 vs 3 handling, so these are python 3
module deps. There's really no way to avoid this sort of thing, whenever we
have conditional imports going on, it's going to pick up them all.

Up next:
- Drop the duplicated LICENSE
- Drop the 'your responsibility' message
- Rebase to merge in the local fixes mentioned above
- Add python- prefixes to non-mapped deps (e.g. install-requires)
- For now, add 'sys' to the hardcoded list of modules to ignore (part of
core)

After that, I'll re-submit.

Then for the future enhancements todo:
- Handle all of sys.builtin_module_names
- Consider handling find_packages(), particularly the excludes=
- Consider handling deps detected from non-local entry points
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1139709c087371050c784bf4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Jan 12, 2015 at 7:15 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">Hi Chris,<br>
<span class=3D""><br>
On Thursday 08 January 2015 11:24:08 Christopher Larson wrote:<br>
&gt; - Handles distutils &amp; setuptools.<br>
&gt; - Supports pulling metadata from PKG-INFO, .egg-info, &amp; setup.py (=
via two<br>
&gt;=C2=A0 =C2=A0different mechanisms).<br>
&gt; - Doesn&#39;t handle python 3 yet.<br>
&gt; - Optional dependencies via `extra_requires` are not currently<br>
&gt;=C2=A0 =C2=A0handled.<br>
&gt; - Implements scanning for dependencies by using the python ast to<br>
&gt;=C2=A0 =C2=A0determine what modules/packages are being imported by the =
python<br>
&gt;=C2=A0 =C2=A0code in question<br>
&gt;<br>
&gt; See <a href=3D"https://gist.github.com/kergoth/6cca6caa4e9b22a21f75" t=
arget=3D"_blank">https://gist.github.com/kergoth/6cca6caa4e9b22a21f75</a> f=
or the projects<br>
&gt; I used to test this against, and<br>
&gt; <a href=3D"https://gist.github.com/kergoth/7fea9494e3cf60b382ff" targe=
t=3D"_blank">https://gist.github.com/kergoth/7fea9494e3cf60b382ff</a> which=
 is the result of<br>
&gt; running recipetool create against every recipe that inherits distutils=
 or<br>
&gt; setuptools in my build environment.<br>
&gt;<br>
&gt; <a href=3D"https://gist.github.com/kergoth/7ad4b5102b2a5fe3a956" targe=
t=3D"_blank">https://gist.github.com/kergoth/7ad4b5102b2a5fe3a956</a> has m=
y current TODO for<br>
&gt; this feature.<br>
<br>
</span>This works pretty well, thanks!<br>
<br>
I tried this on python-mako and got this:<br>
<br>
------------- snip --------------<br>
...<br>
<span class=3D""># WARNING: the following rdepends are from setuptools inst=
all_requires. These<br>
</span><span class=3D""># upstream names may not correspond exactly to bitb=
ake package names.<br>
</span>RDEPENDS_${PN} +=3D &quot;markupsafe&quot;<br>
<br>
# WARNING: the following rdepends are determined through basic analysis of =
the<br>
# python sources, and might not be 100% accurate. It is your responsibility=
 to<br>
# verify that the values are complete and correct.<br>
RDEPENDS_${PN} +=3D &quot;python-core python-textutils&quot;<br>
<br>
# WARNING: We were unable to map the following python package/module<br>
# dependencies to the bitbake packages which include them:<br>
#=C2=A0 =C2=A0 mako.lookup<br>
#=C2=A0 =C2=A0 mako.template<br>
#=C2=A0 =C2=A0 sys<br>
------------- snip --------------<br></blockquote><div><br></div><div>There=
 was a bug which didn&#39;t properly detect a case where some of its info f=
rom setup.py (`scripts` in this case) is available, but some of it is not (=
`packages`), and as a result ended up only parsing some of the python code =
available. Since the paths provided to the dependency scanning are also pas=
sed to the packages search, it didn&#39;t pick up on the provide of mako &a=
mp; mako.* either. Once that&#39;s fixed, it looks like this:=C2=A0<a href=
=3D"https://gist.github.com/0a641e90cdfd37fd2100">https://gist.github.com/0=
a641e90cdfd37fd2100</a>.</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
* Shouldn&#39;t it know that sys is provided by python-core (maybe this has=
 to be<br>
hardcoded)?<br></blockquote><div><br></div><div>Yeah, there are cases where=
 it can&#39;t pick up a provide. Built-in modules (which is the case here),=
 C extensions, or if a module is renamed or similar programmatically (os.pa=
th is actually posixpath in linux).</div><div><br></div><div>It seems that =
sys.builtin_module_names lists the built-in modules. To get at that list, w=
e could use that from recipetool and implicitly assume that this list is th=
e same for the host python as the target, which isn&#39;t ideal, or we coul=
d run the native python from the sysroot, which I&#39;m not currently using=
 in any way, or we could copy the list into recipetool. Thoughts?</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex">
* Our existing recipe has &quot;python-threading python-netclient python-ht=
ml&quot; for<br>
RDEPENDS_${PN}, I don&#39;t know if all of these are correct but it does at=
 least<br>
try to import threading.<br></blockquote><div><br></div><div>With the afore=
mentioned bug fixed, it picks up these and many others, thankfully.</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex">
* Should we just assume by convention that package names should start with<=
br>
&quot;python-&quot; and thus make that prefix on all items brought in from =
setuptools<br>
install_requires?<br></blockquote><div><br></div><div>Good question, I&#39;=
d thought about this too. Whichever way we go, the user will have to review=
 and confirm sanity regardless, so it&#39;s a matter of trying to optimize =
for the common case. One would hope that the python- convention would be th=
e common case, so I&#39;m not opposed to this.</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
* I think &quot;It is your responsibility ...&quot; is a little harsh for t=
he dependency<br>
situation - you&#39;ll soon find out at runtime if the value is insufficien=
t. I used<br>
this wording for LICENSE because if you don&#39;t check it yourself you won=
&#39;t find<br>
out if it&#39;s incorrect.<br></blockquote><div><br></div><div>K, I&#39;ll =
drop that.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">
Earlier you mentioned it would be nice if the buildsystem handler could<br>
replace the existing value of LICENSE - I checked and it already can; you&#=
39;ll<br>
find the existing value in lines_before. It&#39;s all a little bit clunky A=
PI-wise<br>
but it is at least possible.<br></blockquote><div><br></div><div>Ah! I swea=
r I tried exactly that, but apparently something went wrong. I&#39;ll look =
into adding that feature to simplify the recipe.</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding=
-left:1ex">
I also noticed when looking at this that my code wasn&#39;t replacing the v=
ersion<br>
with ${PV} in S (but was in SRC_URI). I&#39;ll send a patch to fix that. Th=
e way<br>
the code works at the moment, I only replace it in SRC_URI if you&#39;ve sp=
ecified<br>
a file name containing the version and then we can find that same version i=
n the<br>
SRC_URI value (I&#39;m not sure there is any other practical way)<br></bloc=
kquote><div><br></div><div>Cool, thanks. I&#39;d noticed this too (in fact =
it&#39;s in the linked todo list :).</div><div><br></div><div>After reviewi=
ng the generated recipe for mako more closely, I see multiple potential con=
cerns:</div><div>- It doesn&#39;t handle find_packages() for packages in se=
tup.py. This is relatively minor, without knowing the list of packages bein=
g shipped, we just scan the whole source tree -- this is why things like no=
se are showing up in the new recipe, because it scanned the unit test suite=
. So I see this as a potential future enhancement.</div><div>- setuptools/p=
kg_resources still isn&#39;t being properly mapped, even with both python a=
nd python-distribute built. It looks like python-distribute ships setuptool=
s.py &amp; friends in an egg, and the package search via pkgdata isn&#39;t =
handling that. - Fixed locally.</div><div>- The detected &#39;beaker&#39; d=
ependency is an optional one, which we&#39;d know if we parsed extra_requir=
es() or the optional sections of *.egg-info/requires.txt. This is a known l=
imitation and is already on the todo list.</div><div>- The babel/pygments/t=
emplating deps are slightly interesting. Mako doesn&#39;t actually depend o=
n these itself, but it does provide extensions to those projects via entry =
points. It could be worth enhancing the tool to handle those specially, eit=
her excluding the entry point packages from the dependency scanning, or som=
ehow automatically splitting out the entry point bits into separate binary =
packages, but that&#39;d be slightly non-trivial, and might be more &quot;m=
agic&quot; than we want going on. Worth looking into as a potential enhance=
ment.<br></div><div>- urllib.parse/urllib.request/html.entities: these were=
 picked up out of compat.py, which does runtime python 2 vs 3 handling, so =
these are python 3 module deps. There&#39;s really no way to avoid this sor=
t of thing, whenever we have conditional imports going on, it&#39;s going t=
o pick up them all.</div><div><br></div><div>Up next:</div><div>- Drop the =
duplicated LICENSE</div><div>- Drop the &#39;your responsibility&#39; messa=
ge</div><div>- Rebase to merge in the local fixes mentioned above</div><div=
>- Add python- prefixes to non-mapped deps (e.g. install-requires)</div><di=
v>- For now, add &#39;sys&#39; to the hardcoded list of modules to ignore (=
part of core)</div><div><br></div><div>After that, I&#39;ll re-submit.</div=
><div><br></div><div>Then for the future enhancements todo:</div><div>- Han=
dle all of sys.builtin_module_names</div><div>- Consider handling find_pack=
ages(), particularly the excludes=3D</div><div>- Consider handling deps det=
ected from non-local entry points</div></div>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1139709c087371050c784bf4--
