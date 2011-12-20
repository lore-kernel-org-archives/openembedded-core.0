Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Rd2Ul-0000N1-4R
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 17:24:51 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2011 08:17:23 -0800
Received: by iazz13 with SMTP id z13so8350169iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 08:17:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.181.161 with SMTP id dx1mr2786817igc.90.1324397842841; Tue,
	20 Dec 2011 08:17:22 -0800 (PST)
Received: by 10.50.66.2 with HTTP; Tue, 20 Dec 2011 08:17:22 -0800 (PST)
Date: Tue, 20 Dec 2011 08:17:22 -0800
Message-ID: <CAPhnLPByP_W+1La9svcgud_yc9WAsP3U9_oCVBGiarZu_YKkdA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] LICENSE Standards
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Dec 2011 16:24:52 -0000
Content-Type: multipart/alternative; boundary=14dae9340399f6bf1104b4886676

--14dae9340399f6bf1104b4886676
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

This email describes a suggested implementation of LICENSE
functionality and standards that will correct some issues within the
licensing infrastructure of OE-Core. It discusses a LICENSE standard,
both for license names and operators within the field and touches on
some issues with regards to how license.bbclass and other classes
utilize LICENSE. It suggests a path forward in correcting those issues
and finally, it describes future enhancements to the license
functionality that will give more accurate manifests and make
OE-Core's license functionality much more useful.

Overview
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
I've identified a few known issues with how LICENSE is implemented and
used, as well as standards issues:

- Some LICENSE fields have non-versioned LICENSE values in which no
meaning can actually be deduced from them. An example of this is
references to GPL or LGPL without a version number. This currently
throws a bb.warn.

- A few LICENSE fields contain values for licenses that have no
generic license text.

- The LICENSE parser currently does not utilize operators. It grabs
all licenses mentioned within the LICENSE field. The plan is to
implement LICENSE priority, which will utilize field operators.
However, there seems to be no definition around how operators are
actually used nor does there exist an agreed upon standard.

- A few LICENSE fields have unparsable values.

- In most cases, LICENSE is set for the recipe, however, a recipe that
contains multiple packages, all of whom may have a distinct LICENSE,
would throw an inaccurate LICENSE into the manifest. We've seen a few
examples of LICENSE_<package_name>, but it is a rare occurrence.

- The LICENSE operands need to be dealt with through a license
priority map. The plan is to implement this within the next few weeks.

- There are currently two sets of names used within recipes. One, is
an undocumented but commonly used naming convention. The other is a
standard created by the SPDX project. The current OE-Core license
functionality does support compatibility with the OE naming
conventions so end users do not have to change their common LICENSE
definitions, however, a documented standard should be implemented and
a plan forward created.


Proposed Solutions
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Decide on a standard.
------------------------------

I would suggest that new recipes follow the SPDX naming convention
with support for the OE convention maintained for a period of time (my
suggestions is 24 months to enable layer maintainers to update with
warnings turned on if this RFC is adopted). LICENSE fields not
following SPDX should be corrected as they are audited.

Adopting SPDX will do a few things for us:

- This will allow us to support an open source project dedicated to
license standards, allowing us to leverage their work and expertise.

- It will also allow us to support recipes that use (or are planning
to use) the SPDX standard .

- It gets us out of the business of maintaining a licensing standard.

While we could always spend time hashing out the OE standard (and from
my searching, I've not seen it documented anywhere, other than a few
places via email archives), I feel this is the wrong path.

The requirements for this should be:

- Any work done with LICENSES within OE-Core or Yocto must maintain
backwards compatibility with the OE naming convention. If SPDX is decided
up,
we should maintain backwards compatibility for a period of time. My
suggested timeline for removal of that compatibility is 24 months.

LICENSE audit
----------------------
Some LICENSE fields are either unparsable, have no version when one is
required (GPL/GPL-2.0), or are factually wrong. I would suggest we
spend time auditing these fields over the next few months using the
following guidelines

- All LICENSE fields must be ast parsable.

- All LICENSE fields should be updated to whatever standard is decided
upon and documented, with mapping for other conventions for a period
of time

- All LICENSE fields should support

- If a LICENSE field references a non-existent common-license, we
either add the common-license or ask the author if we may be permitted
to license under a generic (see less for an example).

- We should actually split common-licenses into spdx-licenses and
alternative-licenses. This will allow us to pull license text from
SPDX and maintain spdx-licenses as a pure form of the provided
licenses. There is already a bug opened with the SPDX group to provide
some sore of repository for this. Additional licenses that are non-OSI
compliant (like Adobe's free license) should be moved to
alternative-licenses. Licenses that are OSI compliant should be
upstreamed to SPDX.

For licenses that are non-OSI compliant, I would suggest we use the SPDX
format:

Where there is a specified version of the license:
<LICENSE_ABBREVIATION>-<VERSION>
Example: AFL-1.3

Where no specified version of the license exists:
<LICENSE_ABBREVIATION>
Example: Adobe

Field Operators
----------------------
The LICENSE parser currently does not act upon Field Operators. It
grabs all licenses mentioned within the LICENSE field. The plan is to
implement LICENSE priority, which will utilize field these operators
and decides on the correct license based on priority. For example, if
we were to weight BSD as a higher priority than GPL-2.0, when the
parser hit "BSD | GPL-2.0" it would use BSD for the package. However,
there seems to be no clear definition around how field operators are
used.

I would suggest the following:

& : This package/recipe includes multiple files with different
licenses. These licenses must be included together

| : This package/recipe is dual licensed.

+ : This package/recipe has a voluntary upgrade path

() : Used to group licenses decision parameters.

Examples:

LICENSE =3D =93GPL-2.0+=94
Meaning: This recipe may be licensed as GPL-2.0 or any greater license

LICENSE =3D =93(BSD & LGPL-2.0) | (GPL-2.0+ & LGPL-2.0)=94
LICENSE =3D =93(BSD | GPL-2.0+) & LGPL-2.0=94

Meaning: This recipe may be licensed as either BSD and LGPL-2.0 or
GPL-2.0 or greater and LGPL-2.0. The parser should support both ways
of writing this.

I've seen reference to "/" and "&&" and ",". I don't see a purpose for thes=
e
operators and short of a clear need, I would suggest their removal.

Recipe-level Licensing
-------------------------------
LICENSE is generally set for the recipe, however, a recipe that
contains multiple packages, all of whom may have a distinct LICENSE,
would throw an inaccurate LICENSE. We've seen a few examples of
LICENSE_${PN}, but it is a rare occurrence. During the audit, I would
suggest that:

- Recipes be corrected, if need.
- license and emit_pkg_data and anything that utilizes LICENSE be
fixed to take package level LICENSE_${PN} into account.

--14dae9340399f6bf1104b4886676
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

This email describes a suggested implementation of LICENSE<br>
functionality and standards that will correct some issues within the<br>
licensing infrastructure of OE-Core. It discusses a LICENSE standard,<br>
both for license names and operators within the field and touches on<br>
some issues with regards to how license.bbclass and other classes<br>
utilize LICENSE. It suggests a path forward in correcting those issues<br>
and finally, it describes future enhancements to the license<br>
functionality that will give more accurate manifests and make<br>
OE-Core&#39;s license functionality much more useful.<br>
<br>
Overview<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
I&#39;ve identified a few known issues with how LICENSE is implemented and<=
br>
used, as well as standards issues:<br>
<br>
- Some LICENSE fields have non-versioned LICENSE values in which no<br>
meaning can actually be deduced from them. An example of this is<br>
references to GPL or LGPL without a version number. This currently<br>
throws a bb.warn.<br>
<br>- A few LICENSE fields contain values for licenses that have no<br>
generic license text.<br>
<br>- The LICENSE parser currently does not utilize operators. It grabs<br>
all licenses mentioned within the LICENSE field. The plan is to<br>
implement LICENSE priority, which will utilize field operators.<br>
However, there seems to be no definition around how operators are<br>
actually used nor does there exist an agreed upon standard.<br>
<br>- A few LICENSE fields have unparsable values.<br>
<br>- In most cases, LICENSE is set for the recipe, however, a recipe that<=
br>
contains multiple packages, all of whom may have a distinct LICENSE,<br>
would throw an inaccurate LICENSE into the manifest. We&#39;ve seen a few<b=
r>
examples of LICENSE_&lt;package_name&gt;, but it is a rare occurrence.<br>
<br>- The LICENSE operands need to be dealt with through a license<br>
priority map. The plan is to implement this within the next few weeks.<br>
<br>- There are currently two sets of names used within recipes. One, is<br=
>
an undocumented but commonly used naming convention. The other is a<br>
standard created by the SPDX project. The current OE-Core license<br>
functionality does support compatibility with the OE naming<br>
conventions so end users do not have to change their common LICENSE<br>
definitions, however, a documented standard should be implemented and<br>
a plan forward created.<br>
<br>
<br>
Proposed Solutions<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Decide on a standard.<br>
------------------------------<div id=3D":11v"><br>
I would suggest that new recipes follow the SPDX naming convention<br>
with support for the OE convention maintained for a period of time (my<br>
suggestions is 24 months to enable layer maintainers to update with<br>
warnings turned on if this RFC is adopted). LICENSE fields not<br>
following SPDX should be corrected as they are audited.<br>
<br>
Adopting SPDX will do a few things for us:<br>
<br>
- This will allow us to support an open source project dedicated to<br>
license standards, allowing us to leverage their work and expertise.<br>
<br>- It will also allow us to support recipes that use (or are planning<br=
>
to use) the SPDX standard .<br>
<br>- It gets us out of the business of maintaining a licensing standard.<b=
r>
<br>
While we could always spend time hashing out the OE standard (and from<br>
my searching, I&#39;ve not seen it documented anywhere, other than a few<br=
>
places via email archives), I feel this is the wrong path.<br>
<br>
The requirements for this should be:<br><br>
- Any work done with LICENSES within OE-Core or Yocto must maintain<br>
backwards compatibility with the OE naming convention. If SPDX is decided u=
p,<br>
we should maintain backwards compatibility for a period of time. My<br>
suggested timeline for removal of that compatibility is 24 months.<br>
<br>
LICENSE audit<br>
----------------------<br>
Some LICENSE fields are either unparsable, have no version when one is<br>
required (GPL/GPL-2.0), or are factually wrong. I would suggest we<br>
spend time auditing these fields over the next few months using the<br>
following guidelines<br>
<br>
- All LICENSE fields must be ast parsable.<br>
<br>- All LICENSE fields should be updated to whatever standard is decided<=
br>
upon and documented, with mapping for other conventions for a period<br>
of time<br>
<br>- All LICENSE fields should support<br>
<br>- If a LICENSE field references a non-existent common-license, we<br>
either add the common-license or ask the author if we may be permitted<br>
to license under a generic (see less for an example).<br>
<br>- We should actually split common-licenses into spdx-licenses and<br>
alternative-licenses. This will allow us to pull license text from<br>
SPDX and maintain spdx-licenses as a pure form of the provided<br>
licenses. There is already a bug opened with the SPDX group to provide<br>
some sore of repository for this. Additional licenses that are non-OSI<br>
compliant (like Adobe&#39;s free license) should be moved to<br>
alternative-licenses. Licenses that are OSI compliant should be<br>
upstreamed to SPDX.<br>
<br>
For licenses that are non-OSI compliant, I would suggest we use the SPDX fo=
rmat:<br>
<br>
Where there is a specified version of the license:<br>
&lt;LICENSE_ABBREVIATION&gt;-&lt;VERSION&gt;<br>
Example: AFL-1.3<br>
<br>
Where no specified version of the license exists:<br>
&lt;LICENSE_ABBREVIATION&gt;<br>
Example: Adobe<br>
<br>
Field Operators<br>
----------------------<br>
The LICENSE parser currently does not act upon Field Operators. It<br>
grabs all licenses mentioned within the LICENSE field. The plan is to<br>
implement LICENSE priority, which will utilize field these operators<br>
and decides on the correct license based on priority. For example, if<br>
we were to weight BSD as a higher priority than GPL-2.0, when the<br>
parser hit &quot;BSD | GPL-2.0&quot; it would use BSD for the package. Howe=
ver,<br>
there seems to be no clear definition around how field operators are<br>
used.<br>
<br>
I would suggest the following:<br>
<br>
&amp; : This package/recipe includes multiple files with different<br>
licenses. These licenses must be included together<br>
<br>
| : This package/recipe is dual licensed.<br>
<br>
+ : This package/recipe has a voluntary upgrade path<br>
<br>
() : Used to group licenses decision parameters.<br>
<br>
Examples:<br>
<br>
LICENSE =3D =93GPL-2.0+=94<br>
Meaning: This recipe may be licensed as GPL-2.0 or any greater license<br>
<br>
LICENSE =3D =93(BSD &amp; LGPL-2.0) | (GPL-2.0+ &amp; LGPL-2.0)=94<br>
LICENSE =3D =93(BSD | GPL-2.0+) &amp; LGPL-2.0=94<br>
<br>
Meaning: This recipe may be licensed as either BSD and LGPL-2.0 or<br>
GPL-2.0 or greater and LGPL-2.0. The parser should support both ways<br>
of writing this.<br>
<br>
I&#39;ve seen reference to &quot;/&quot; and &quot;&amp;&amp;&quot; and &qu=
ot;,&quot;. I don&#39;t see a purpose for these<br>
operators and short of a clear need, I would suggest their removal.<br>
<br>
Recipe-level Licensing<br>
-------------------------------<br>
LICENSE is generally set for the recipe, however, a recipe that<br>
contains multiple packages, all of whom may have a distinct LICENSE,<br>
would throw an inaccurate LICENSE. We&#39;ve seen a few examples of<br>
LICENSE_${PN}, but it is a rare occurrence. During the audit, I would<br>
suggest that:<br>
<br>
- Recipes be corrected, if need.<br>
- license and emit_pkg_data and anything that utilizes LICENSE be<br>
fixed to take package level LICENSE_${PN} into account.<div class=3D"yj6qo =
ajU"><div id=3D":133" class=3D"ajR" tabindex=3D"0"><img class=3D"ajT" src=
=3D"images/cleardot.gif"></div></div></div>

--14dae9340399f6bf1104b4886676--
