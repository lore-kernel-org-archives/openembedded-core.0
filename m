Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SbNv4-0006eh-82
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 05:25:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2012 20:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174326498"
Received: from unknown (HELO [10.255.12.127]) ([10.255.12.127])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2012 20:15:00 -0700
Message-ID: <4FCC2833.5060508@linux.intel.com>
Date: Sun, 03 Jun 2012 20:14:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Yocto Project Discussion <yocto@yoctoproject.org>, 
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] Split and revamp distro_tracking_fields.inc
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
X-List-Received-Date: Mon, 04 Jun 2012 03:25:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Folks,

As this project has progressed, we have found the distro_tracking_fields
to become a bit cumbersome and dated, I want to therefore propose we get
rid of it ;-), nah that would be too easy!

I would like to propose the following, split it into smaller files with 
more specific meaning, and move some of the data contained in the 
original file into the recipes directly. Some of the fields will be 
deprecated, others renamed and finally others will be used for a burn 
down list of things to be checked or converted to be automagically 
generated.

Currently the data contained in these fields is used to generate the 
database that the Package reporting system uses and will continue to use 
in it's new form. (https://packages.yoctoproject.org) We also use the 
data for tracking the recipe updating to ensure we keep the system as up 
to date as possible.

The new split would make this data part of Poky in meta-yocto, and not 
in oe-core (other than the modifications to the recipes). The split 
would be as follows:

maintainers.inc
  - RECIPE_MAINTAINER = "Full Name <user@example.com>"
  - This is the name of the person currently watching the upstream and
    updating the recipe and/or fixing bugs filed against, this person
    should also help review incoming patches for that recipe.
  - NOTE to REVIEWERS: I still need to better define what the Roles and 
Responsibilities of a maintainer are for recipes!

recipe_color.inc
  - RECIPE_COLOR = "green|yellow|red" - defaults to green
  - Burn down list of recipes that need to be checked for general issues
  - red means there are some issues that might be legacy or function
    need review
  - yellow means recipe needs review
  - once reviewed and issues resolved the recipe's entry can be removed

upstream_tracking.inc
  - RECIPE_UPSTREAM_VERSION = "<version>"
  - RECIPE_UPSTREAM_DATE = "Mmm, dd, yyyy"
    - Version info from the Upstream, mostly this can be generated, but
      in some cases we need to track it manually, this should just be
      the manually tracked info, it currently contains more than that,
      this will be corrected over time as we can generate it
      automatically
  - RECIPE_NO_UPDATE_REASON = "Free form text"
    - Used by the package and update tracking to explain why a recipe
      should not be updated.

Insert into recipe.bb or .inc files:
  - NOTES = <free form text>
    - was RECIPE_COMMENTS
    - Information that would useful in the package reporting system, but
      not part of the DESCRIPTION, could be existing comments
  - CHECK_DATE = "Mmm, dd, yyyy"
    - was RECIPE_MANUAL_CHECK_DATE
    - The date when the upstream was last checked, specifically for the
      Manual check process when a recipe's upstream could not be checked
      automagically, this should become fewer and fewer as we determine
      ways to check.
  - DISTRO_PN_ALIAS = "Distro:package alias, Distro:package alias, ..."
    - This is a comma separated list of mainline distros, such as
      Fedora, Debian, OpenSuse which also ship a similar package, but
      with a different name possibly.
    - Used by package reporting system and is fairly static
    - Many Commercial users would like to know that a given package is
      already shipping with other distributions

Any fields not mentioned above will be deprecated.

The first three files are ready to merged, I need to finish updating the 
recipes for the last part.  This will not require any PR bumps as there 
is no packaging changes, just metadata that is used by the package 
reporting system.


Comments?
-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



