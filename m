Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD124765B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:08:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2015 08:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,585,1432623600"; d="scan'208";a="759259218"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2015 08:08:45 -0700
Message-ID: <55BB8FBB.4070809@linux.intel.com>
Date: Fri, 31 Jul 2015 18:09:47 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<3bfd35fc6c4860c569683b9e8943fecfe20a228f.1438262915.git.alexander.kanavin@linux.intel.com>
	<55BB8C1B.2020104@linux.intel.com>
In-Reply-To: <55BB8C1B.2020104@linux.intel.com>
Subject: Re: [PATCH 25/26] distrodata.bbclass: do not use get_recipe_pv_without_srcpv() before comparing versions in checkpkg
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
X-List-Received-Date: Fri, 31 Jul 2015 15:08:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 07/31/2015 05:54 PM, Aníbal Limón wrote:
> I added get_recipe_pv_without_srcpv for compare git versions because
> vercmp_string
> don't take into account git versioning (git, gitAUTOINC) causing wrong
> comparisons.
>
> We need to review if removal don't affect the current upstream detection.

These are the regex strings that get_recipe_pv_without_srcpv() is using:

for git sources:
git_regex = 
re.compile("(?P<pfx>(v|))(?P<ver>((\d+[\.\-_]*)+))(?P<sfx>(\+|)(git|)(r|)(AUTOINC|)(\+|))(?P<rev>.*)")

for everything else:
regex = re.compile("(?P<pfx>(v|r|))(?P<ver>((\d+[\.\-_]*)+))")

Both regular expressions are too restrictive in allowing only numeric 
characters in the <ver> component. If you try to match, say 3.1rc1 and 
3.1rc2, they will be both stripped of the '.rcN part, <ver> will be set 
to 3, and vercmp_string will of course say they match!

Alex

