Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CAFE473905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 17:44:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 13 Aug 2015 10:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,671,1432623600"; d="scan'208";a="783590805"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.147])
	([10.219.5.147])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2015 10:44:11 -0700
Message-ID: <55CCD7A4.7050209@linux.intel.com>
Date: Thu, 13 Aug 2015 12:45:08 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<dec31dd6b2f6e2c9cfd36f3a249ef1cbead5cdf6.1439301278.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<4365231.OlMhXKZDbM@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <4365231.OlMhXKZDbM@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH 1/1][RFC] devtool: Upgrade feature
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
X-List-Received-Date: Thu, 13 Aug 2015 17:44:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

On 08/13/2015 05:06 AM, Paul Eggleton wrote:
> Hi Leo,
>
> On Tuesday 11 August 2015 14:04:14 leonardo.sandoval.gonzalez@linux.intel.com
> wrote:
>> This is a new devtool's feature, which upgrades a recipe to a
>> particular version number. Code was taken from [1] where some modifications
>> were done (remove all email, buildhistory and statistics features,
>> use devtool logger instead of AUH logger) to adapt the devtool framework.
>> Once the upgrade is over, the new recipe will be located under the
>> devtool's workspace. This is a first approach to this feature; pending
>> tasks include:
>>
>> 1. The AUH [1] is used to rename and update the recipe. AUH is not
>> using the lib/oe/recipeutils library to do this work. AUH ported code should
>> use this library which is the one being used by the rest of the devtool
>> features.
>>
>> 2. Currently, when 'update-recipe' is executed, the recipe under workspace
>> is updated with latest commits. The only task missing is to replace the new
>> recipe with the old one, commonly located under the meta layer.
>>
>> 3. When patches fail to apply, follow the PATCHRESOLVE behavior instead of
>> just failing.
>>
>> 4. Patches most of the time do not apply correctly on the new recipe
>> version, so include a command line option to indicate the system not to
>> apply these, so it can be applied manually later on.
>
> So, this is a good first implementation and gives an idea of how the command
> will work - and I'm quite keen for us to have this, I've had several people
> asking me recently about when we'll be adding it, so it's definitely something
> we want.
>
> However, I'm concerned about the volume of code we're adding here, some of
> which duplicates what we already have in devtool or elsewhere in lib/oe. I
> know this is the easiest approach and you've noted it's todo item #1 above to
> work on - I'll be a lot happier if you can improve that before the final
> version.
>
> In particular, I see the upgrade() function is duplicating a bunch of code
> from modify() - we should split the common parts out to separate function(s)
> that can be called from both places instead.

As you noticed, there is code duplication specially on the standard.py. 
Code on this file needs to be refactor somehow so the function upgrade 
can call these new functions.

>
> Some other comments:
>
> * I can see it's actually making changes to the original recipe - I found this
> because I'd run a devtool upgrade on dropbear and specified the wrong version
> to --version Ctrl+C'd out during the fetch part, and the original dropbear.inc
> was modified instead of the one in the workspace. We don't want to touch the
> original recipe, not until you run update-recipe at least.
>

Ok. This is definitely a bug. All work must be done in the workspace. 
This is contrary to the AUH code, which works on poky default layers, so 
this bug may be something I did not change on the ported code.

> * As far as the source tree is concerned I think that this is doing things
> slightly backwards - it's using the AUH code to do the upgrade, and then it's
> extracting the code. What I'd like to see happen is it extract the code for
> the old version (including applying patches), use the AUH code to figure out
> how to fetch the new version, fetch it into a different branch (assuming it's
> not already there since it was fetched from git), then rebase the patches onto
> the new version - the user can then use git to fix things up if patches don't
> apply.
>

got it. Looks good to me. I also though using the recipetool script 
(instead of AUH), but this one creates a recipe from scratch so it is 
not really useful at this moment.

> * I'm not sure if using an existing source tree is a reasonable default for
> this command - I'm not even sure it's something people will want to do at all
> in the context of an upgrade. I'm willing to be convinced otherwise though -
> any opinions (from anyone)?
>
> * We need oe-selftest tests for this that test as much of the functionality as
> possible. This may require adding some simple "synthetic" recipes to meta-
> selftest so that we have something that's always there to upgrade. Based upon
> my recent experience in devtool (with my own code), the sooner we add these
> the better.

good point. I will add these on v2.

>
> * I'd like to see the implementation for this in its own file rather than in
> standard.py.

Good. What about the other features (add, update-recipe, modify, etc.)? 
will these remain in the same place?

>
> * Probably just a result of this being WIP, but I found that if I don't
> specify a version with --version then it says "NOTE: Upgrading to None" and
> then fails with "ERROR: cannot concatenate 'str' and 'NoneType' objects".
>

Bug. I will also add it on V2.


> Cheers,
> Paul
>

Thanks for your comments.

