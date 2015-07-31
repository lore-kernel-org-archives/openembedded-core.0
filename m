Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C2A747656C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 15:31:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 31 Jul 2015 08:31:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,585,1432623600"; d="scan'208";a="774113731"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.5.54])
	([10.219.5.54])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2015 08:31:18 -0700
Message-ID: <55BB94CB.1090003@linux.intel.com>
Date: Fri, 31 Jul 2015 10:31:23 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<3bfd35fc6c4860c569683b9e8943fecfe20a228f.1438262915.git.alexander.kanavin@linux.intel.com>
	<55BB8C1B.2020104@linux.intel.com>
	<55BB8FBB.4070809@linux.intel.com>
In-Reply-To: <55BB8FBB.4070809@linux.intel.com>
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
X-List-Received-Date: Fri, 31 Jul 2015 15:31:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 31/07/15 10:09, Alexander Kanavin wrote:
> On 07/31/2015 05:54 PM, Aníbal Limón wrote:
>> I added get_recipe_pv_without_srcpv for compare git versions because
>> vercmp_string
>> don't take into account git versioning (git, gitAUTOINC) causing wrong
>> comparisons.
>>
>> We need to review if removal don't affect the current upstream 
>> detection.
>
> These are the regex strings that get_recipe_pv_without_srcpv() is using:
>
> for git sources:
> git_regex = 
> re.compile("(?P<pfx>(v|))(?P<ver>((\d+[\.\-_]*)+))(?P<sfx>(\+|)(git|)(r|)(AUTOINC|)(\+|))(?P<rev>.*)")
>
> for everything else:
> regex = re.compile("(?P<pfx>(v|r|))(?P<ver>((\d+[\.\-_]*)+))")
>
> Both regular expressions are too restrictive in allowing only numeric 
> characters in the <ver> component. If you try to match, say 3.1rc1 and 
> 3.1rc2, they will be both stripped of the '.rcN part, <ver> will be 
> set to 3, and vercmp_string will of course say they match!

In this case we need to add rcN into the regex because if you cmp 
something like,

 >>> import bb
 >>> bb.utils.vercmp_string('3.0+gitX', '2.9+gitX')

It returns 1 that means 2.9+gitX is greater than 3.0+gitX.

     alimon

>
> Alex


