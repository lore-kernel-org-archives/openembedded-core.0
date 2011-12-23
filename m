Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Re8Kx-0005Gh-Pc
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:51:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Dec 2011 08:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="50133568"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Dec 2011 08:44:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 23 Dec 2011 16:44:04 +0000
Message-ID: <1661045.RyWPXMxtTU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CAPhnLPByP_W+1La9svcgud_yc9WAsP3U9_oCVBGiarZu_YKkdA@mail.gmail.com>
References: <CAPhnLPByP_W+1La9svcgud_yc9WAsP3U9_oCVBGiarZu_YKkdA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 23 Dec 2011 16:51:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Beth,

Great work on this. A few comments below:

On Tuesday 20 December 2011 08:17:22 Flanagan, Elizabeth wrote:
> - In most cases, LICENSE is set for the recipe, however, a recipe that
> contains multiple packages, all of whom may have a distinct LICENSE,
> would throw an inaccurate LICENSE into the manifest. We've seen a few
> examples of LICENSE_<package_name>, but it is a rare occurrence.

Do you have a feeling as to how common this is? I've not done any 
comprehensive study but presumably this is the exception rather than the rule?
(Perhaps this is only a matter of wording in the above.)

> - The LICENSE operands need to be dealt with through a license
> priority map. The plan is to implement this within the next few weeks.

Could you elaborate on what the license priority map is?

> Proposed Solutions
> ================
> 
> Decide on a standard.
> ------------------------------
> 
> I would suggest that new recipes follow the SPDX naming convention
> with support for the OE convention maintained for a period of time (my
> suggestions is 24 months to enable layer maintainers to update with
> warnings turned on if this RFC is adopted). LICENSE fields not
> following SPDX should be corrected as they are audited.

Sounds reasonable, I think that we additionally ought to put in warnings for 
mapped licenses now if we go ahead with this - perhaps if we're going to 
update oelint.bbclass (something I came across recently) it could be extended 
to understand and report mappings?

> Adopting SPDX will do a few things for us:
> 
> - This will allow us to support an open source project dedicated to
> license standards, allowing us to leverage their work and expertise.
> 
> - It will also allow us to support recipes that use (or are planning
> to use) the SPDX standard .
> 
> - It gets us out of the business of maintaining a licensing standard.

I think OE history has shown we're not great at this by ourselves so this 
definitely sounds good.

> LICENSE audit
> ----------------------
> Some LICENSE fields are either unparsable, have no version when one is
> required (GPL/GPL-2.0), or are factually wrong. I would suggest we
> spend time auditing these fields over the next few months using the
> following guidelines
> 
> - All LICENSE fields must be ast parsable.
> 
> - All LICENSE fields should be updated to whatever standard is decided
> upon and documented, with mapping for other conventions for a period
> of time
> 
> - All LICENSE fields should support

Should support ... ?

> - If a LICENSE field references a non-existent common-license, we
> either add the common-license or ask the author if we may be permitted
> to license under a generic (see less for an example).

I'm wondering about another possibility - for those pieces of software where 
we cannot get permission for a generic license, have a mechanism for the 
recipe to point to the license file within the source that should be copied to 
the output, thus avoiding "uncommon" licenses being copied into the common 
license dir. It could even be as simple as an additional flag for one of the 
files listed in LIC_FILES_CHKSUM. Would that work and be worthwhile?

> - We should actually split common-licenses into spdx-licenses and
> alternative-licenses. This will allow us to pull license text from
> SPDX and maintain spdx-licenses as a pure form of the provided
> licenses. There is already a bug opened with the SPDX group to provide
> some sore of repository for this. Additional licenses that are non-OSI
> compliant (like Adobe's free license) should be moved to
> alternative-licenses. Licenses that are OSI compliant should be
> upstreamed to SPDX.

Unless "alternative" is a term SPDX uses I would suggest using "other" or some 
other word since "alternative" implies some form of choice. Otherwise this 
sounds reasonable.

> For licenses that are non-OSI compliant, I would suggest we use the SPDX
> format:
> 
> Where there is a specified version of the license:
> <LICENSE_ABBREVIATION>-<VERSION>
> Example: AFL-1.3
> 
> Where no specified version of the license exists:
> <LICENSE_ABBREVIATION>
> Example: Adobe

Clearly this is just an example, but I imagine we would want to be more 
specific as I'm sure like many commercial vendors, Adobe has many licenses 
under which they have released software.

> Field Operators
> ----------------------
> The LICENSE parser currently does not act upon Field Operators. It
> grabs all licenses mentioned within the LICENSE field. The plan is to
> implement LICENSE priority, which will utilize field these operators
> and decides on the correct license based on priority. For example, if
> we were to weight BSD as a higher priority than GPL-2.0, when the
> parser hit "BSD | GPL-2.0" it would use BSD for the package. However,
> there seems to be no clear definition around how field operators are
> used.
> 
> I would suggest the following:
> 
> & : This package/recipe includes multiple files with different
> licenses. These licenses must be included together
> 
> | : This package/recipe is dual licensed.
> 
> + : This package/recipe has a voluntary upgrade path
> 
> () : Used to group licenses decision parameters.

Sounds like it should cover all the bases.

> I've seen reference to "/" and "&&" and ",". I don't see a purpose for these
> operators and short of a clear need, I would suggest their removal.

Definitely agreed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


