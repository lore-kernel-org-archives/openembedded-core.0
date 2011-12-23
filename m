Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Re9of-0000D3-Bf
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 19:26:02 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Dec 2011 10:18:52 -0800
Received: by iazz13 with SMTP id z13so13484999iaz.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 10:18:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.36.230 with SMTP id t6mr14783003igj.5.1324664331756; Fri,
	23 Dec 2011 10:18:51 -0800 (PST)
Received: by 10.50.208.98 with HTTP; Fri, 23 Dec 2011 10:18:51 -0800 (PST)
In-Reply-To: <4EF4B4BD.9050005@windriver.com>
References: <CAPhnLPByP_W+1La9svcgud_yc9WAsP3U9_oCVBGiarZu_YKkdA@mail.gmail.com>
	<1661045.RyWPXMxtTU@helios> <4EF4B4BD.9050005@windriver.com>
Date: Fri, 23 Dec 2011 10:18:51 -0800
Message-ID: <CAPhnLPAvEuJeUcnehUKLSv2CPjNU2v2HjeWx12EwNYHkcqkCLA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] LICENSE Standards
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
X-List-Received-Date: Fri, 23 Dec 2011 18:26:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2011 at 9:05 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 12/23/11 10:44 AM, Paul Eggleton wrote:
>>
>> Hi Beth,
>>
>> Great work on this. A few comments below:
>>
>> On Tuesday 20 December 2011 08:17:22 Flanagan, Elizabeth wrote:
>>>
>>> - In most cases, LICENSE is set for the recipe, however, a recipe that
>>> contains multiple packages, all of whom may have a distinct LICENSE,
>>> would throw an inaccurate LICENSE into the manifest. We've seen a few
>>> examples of LICENSE_<package_name>, but it is a rare occurrence.
>>
>>
>> Do you have a feeling as to how common this is? I've not done any
>> comprehensive study but presumably this is the exception rather than the
>> rule?
>> (Perhaps this is only a matter of wording in the above.)
>
>
> This is common enough, in my experience, that we have to have a way to
> support it. =A0The primary example I have is gettext. =A0The core gettext=
 binary
> is GPLv3, while the libraries are still LGPLv2.1. =A0This can make a huge
> impact when someone is evaluating weather that can use the current versio=
n
> of gettext or not in a system.
>
>
>>> - The LICENSE operands need to be dealt with through a license
>>> priority map. The plan is to implement this within the next few weeks.
>>
>>
>> Could you elaborate on what the license priority map is?
>
>
> I'd not commented on this before, but I'm not sure that is possible. =A0M=
ost
> licenses, that offer multiple choice, are written that it's up to the use=
r
> to choose the appropriate license. =A0I believe we can set reasonable def=
aults
> within the OE environment. =A0But in the end the user has to choose the
> license they want to use for a particular package. =A0(Some packages I've=
 seen
> allow you to choose the license on the configure line, which has a side
> effect of disabling certain functionality -- this is very rare though.)
>
> Perhaps a companion variable to LICENSE that the user can set, that detai=
ls
> their choice. =A0(Other then the existing black listed license, in the fu=
ture
> I can see someone write an audit tool that looks for possible licensing
> conflicts -- it's more likely to be needed then.)

I was thinking more in the lines of what shadow's license is. BSD | Artisti=
c.

In that case, at least how I'm reading it, the choice is give to the
distributor in
how they deal with licensing. Which, to me, does mean writing it like:

LICENSE =3D "(BSD) | (Artistic)"

Which is what priority mapping should be. A decision from the packager
side. When we hit
multi-licensed software where the decision is on the end user side,
perhaps the way to do it
would be:

LICENSE =3D "BSD | Artistic"

>
>
>>> Proposed Solutions
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> Decide on a standard.
>>> ------------------------------
>>>
>>> I would suggest that new recipes follow the SPDX naming convention
>>> with support for the OE convention maintained for a period of time (my
>>> suggestions is 24 months to enable layer maintainers to update with
>>> warnings turned on if this RFC is adopted). LICENSE fields not
>>> following SPDX should be corrected as they are audited.
>>
>>
>> Sounds reasonable, I think that we additionally ought to put in warnings
>> for
>> mapped licenses now if we go ahead with this - perhaps if we're going to
>> update oelint.bbclass (something I came across recently) it could be
>> extended
>> to understand and report mappings?
>
>
> I firmly believe using SPDX naming is a good first approach.. specificall=
y
> for the items listed below. =A0(For items outside of the SPDX naming, the=
re
> should be a way to specify "other" and what that other means.. =A0conside=
r it
> a namespace, with the default namespace being SPDX.)
>
>
>>> Adopting SPDX will do a few things for us:
>>>
>>> - This will allow us to support an open source project dedicated to
>>> license standards, allowing us to leverage their work and expertise.
>>>
>>> - It will also allow us to support recipes that use (or are planning
>>> to use) the SPDX standard .
>>>
>>> - It gets us out of the business of maintaining a licensing standard.
>>
>>
>> I think OE history has shown we're not great at this by ourselves so thi=
s
>> definitely sounds good.
>
>
> Whenever the SPDX tooling and license data starts to be produced, we'll w=
ant
> to have a way to include this with the recipes. =A0I suspect we have enou=
gh
> facilities today to be able to do this, so nothing special will be needed=
.
>
>
>>> LICENSE audit
>>> ----------------------
>>> Some LICENSE fields are either unparsable, have no version when one is
>>> required (GPL/GPL-2.0), or are factually wrong. I would suggest we
>>> spend time auditing these fields over the next few months using the
>>> following guidelines
>>>
>>> - All LICENSE fields must be ast parsable.
>>>
>>> - All LICENSE fields should be updated to whatever standard is decided
>>> upon and documented, with mapping for other conventions for a period
>>> of time
>>>
>>> - All LICENSE fields should support
>>
>>
>> Should support ... ?
>>

Copy past edit forget.

>>> - If a LICENSE field references a non-existent common-license, we
>>> either add the common-license or ask the author if we may be permitted
>>> to license under a generic (see less for an example).
>>
>>
>> I'm wondering about another possibility - for those pieces of software
>> where
>> we cannot get permission for a generic license, have a mechanism for the
>> recipe to point to the license file within the source that should be
>> copied to
>> the output, thus avoiding "uncommon" licenses being copied into the comm=
on
>> license dir. It could even be as simple as an additional flag for one of
>> the
>> files listed in LIC_FILES_CHKSUM. Would that work and be worthwhile?
>
>
> That seems reasonable. =A0Annoying as it is, I've seen a few packages whe=
re
> the license text is simply a magic URL. =A0So adding the facility to fetc=
h the
> license text from a URL and include it is likely a good idea as well.
> =A0(Since my understanding is you are bound by the license at the time yo=
u
> download the software -- so matching the download to the license text is =
a
> good safety net. This could also have ramifications of caching/mirroring
> downloads as well..) Again, this is rare, but something I've run into
> before. =A0(It seems fairly scary to me that the only license text for a
> program would be on a web page that the copyright holder is allowed to
> modify at any time they choose.. which is why mirroring the text is
> important in that case.)

That's a good way to approach the licenses that do that. We should
still have a defined
naming convention for those licenses.

>
>
>>> - We should actually split common-licenses into spdx-licenses and
>>> alternative-licenses. This will allow us to pull license text from
>>> SPDX and maintain spdx-licenses as a pure form of the provided
>>> licenses. There is already a bug opened with the SPDX group to provide
>>> some sore of repository for this. Additional licenses that are non-OSI
>>> compliant (like Adobe's free license) should be moved to
>>> alternative-licenses. Licenses that are OSI compliant should be
>>> upstreamed to SPDX.
>>
>>
>> Unless "alternative" is a term SPDX uses I would suggest using "other" o=
r
>> some
>> other word since "alternative" implies some form of choice. Otherwise th=
is
>> sounds reasonable.

other is fine by me.

>
>
> Let me clarify something about SPDX. =A0There is no such thing as an
> "spdx-license". =A0What they have done is created a set of common names t=
hat
> refer to common license texts. =A0It's up to the recipe creator to verify=
 that
> the common text is what is within the package.
>
> SPDX really refers to an XML format for meta data related to a given
> software package. =A0This file will include the standardized naming for a
> given license (if there is one), along with key information relating to
> copyright and license statements within every source file in that package=
.
> =A0The SPDX data is designed to go down to the file level and give someon=
e
> performing a license audit all of the information they may potentially ne=
ed
> to determine the (legal) suitability of a piece of software for their nee=
ds.

That should probably read "spdx provided license text". One thing we should=
 also
discuss is eventually looking for the spdx spec file. If it exists, we shou=
ld:

a. Audit against it
b. if it says our LICENSE is wrong, throw a warning.
c. use the spec file instead.

>
>
>>> For licenses that are non-OSI compliant, I would suggest we use the SPD=
X
>>> format:
>>>
>>> Where there is a specified version of the license:
>>> <LICENSE_ABBREVIATION>-<VERSION>
>>> Example: AFL-1.3
>>>
>>> Where no specified version of the license exists:
>>> <LICENSE_ABBREVIATION>
>>> Example: Adobe
>>
>>
>> Clearly this is just an example, but I imagine we would want to be more
>> specific as I'm sure like many commercial vendors, Adobe has many licens=
es
>> under which they have released software.
>
>
> Going back to the namespace idea.. perhaps: =A0Other:Adobe =A0 This would
> clearly label the item as not being in the SPDX namespace.

perhaps Other:Adobe:${PN} ?

>
>
>>> Field Operators
>>> ----------------------
>>> The LICENSE parser currently does not act upon Field Operators. It
>>> grabs all licenses mentioned within the LICENSE field. The plan is to
>>> implement LICENSE priority, which will utilize field these operators
>>> and decides on the correct license based on priority. For example, if
>>> we were to weight BSD as a higher priority than GPL-2.0, when the
>>> parser hit "BSD | GPL-2.0" it would use BSD for the package. However,
>>> there seems to be no clear definition around how field operators are
>>> used.
>>>
>>> I would suggest the following:
>>>
>>> & =A0: This package/recipe includes multiple files with different
>>> licenses. These licenses must be included together
>>>
>>> | : This package/recipe is dual licensed.
>>>
>>> + : This package/recipe has a voluntary upgrade path
>>>
>>> () : Used to group licenses decision parameters.
>>
>>
>> Sounds like it should cover all the bases.
>>
>>> I've seen reference to "/" and "&&" and ",". I don't see a purpose for
>>> these
>>> operators and short of a clear need, I would suggest their removal.
>
>
> & and | I believe are "obvious". =A0And cover the case of the "/", "&&" a=
nd
> "," above. =A0I'm not sure exactly how using the "+" and "()" will be.

+ is for those Licenses that have an automatic upgrade path (or greater).
Parens for decisions that need to be made from the distributor side.

> The
> single "license" field has to the cover the package as whole -- anything =
at
> a split level will need to be covered by license_pn -- and anything that =
is
> file level will need to be rolled up into the license_pn for the associat=
ed
> split item.
>
> I would expect in the gettext example that something like the following i=
s
> in the recipe:
>
> LICENSE =3D "GPLv3 & LGPLv2.1"
> LICENSE_gettext =3D "GPLv3"
> LICENSE_libgettext =3D "LGPLv2.1"
>
> That way it's clear what the overall source license is, as well as the sp=
lit
> package licenses. =A0(Of course this is a corner case, as most things the
> package license and the split package license are the same.)
>
> --Mark
>
>>
>> Definitely agreed.
>>
>> Cheers,
>> Paul
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


