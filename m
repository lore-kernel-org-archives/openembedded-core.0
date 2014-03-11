Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 373866F7DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 10:40:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2BAebKp024049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 03:40:37 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 03:40:36 -0700
Message-ID: <531EE822.7070201@windriver.com>
Date: Tue, 11 Mar 2014 18:40:34 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <531ECDCE.3020805@sonarnerd.net> <531ED455.50702@windriver.com>
	<2472430.vmDQzt5qix@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2472430.vmDQzt5qix@peggleto-mobl5.ger.corp.intel.com>
Cc: Jussi Laako <jussi@sonarnerd.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora]Re: Failure in license.bbclass
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
X-List-Received-Date: Tue, 11 Mar 2014 10:40:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2014 06:02 PM, Paul Eggleton wrote:
> Hi Hongxu,
>
> The person you need to CC is Robert Yang since he maintains the dora branch.
> FWIW I hadn't anticipated this patch being backported, but I guess if
> functionality now in dora relies upon it we have no choice :(
>

I'm sorry to say that it seems that we can't backport this patch since
we need at least the following patches, it is not a good idea to backport
it:

d69931d scripts/oe-pkgdata-util: fix global name 'debug' is not defined
6ce2879 scripts/oe-pkgdata-util: add ability to find a recipe from a target package
948a714 scripts/oe-pkgdata-util: add ability to look up runtime package names
48755f1 scripts/oe-pkgdata-util: add ability to search for a target path
4ec1f8c scripts/oe-pkgdata-util: check path arguments to ensure they exist
8b42409 scripts/oe-pkgdata-util: improve help text and command line parsing
9ce903b scripts/oe-pkgdata-util: remove remnants of former pkgdata structure

It is because I backported this commit: (I'm sorry about that)

commit e58a1499accd74d3e6fe4f899711d4c680ebc18f
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Wed Nov 20 18:35:39 2013 +0800

     license.bbclass: fix copying license directories failed

It is used for fixing this bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5572

Enalbe COPY_LIC_MANIFEST and COPY_LIC_DIRS: No kernel license is installed in image

But it used the "oe-pkgdata-util lookup-recipe" which is only on master branch,
I think that we'd better:

1) Revert this commit, then it works with minor problems.

Or

2) Fix the "oe-pkgdata-util lookup-recipe" on dora.

// Robert

> Cheers,
> Paul
>
>
> On Tuesday 11 March 2014 17:16:05 Hongxu Jia wrote:
>> It seems dora has some patches of oe-pkgdata-util not
>> rebased from poky, such as:
>>
>> commit 6ce287937e86a43d696e3615aa18d439928b7691
>> Author: Paul Eggleton <paul.eggleton@linux.intel.com>
>> Date:   Fri Oct 18 14:52:10 2013 +0100
>>
>>       scripts/oe-pkgdata-util: add ability to find a recipe from a target
>> package
>>
>> //Hongxu
>>
>> On 03/11/2014 04:48 PM, Jussi Laako wrote:
>>> Hi,
>>>
>>> Your recent (from November) change to license.bbclass in Yocto Dora
>>> release completely breaks COPY_LIC_DIRS.
>>>
>>> Running the command manually for any package results in command line
>>> syntax error:
>>> jussi@porkkala:/home/scratch/jussi/poky/build> oe-pkgdata-util
>>> lookup-recipe
>>> /home/scratch/jussi/poky/build/tmp/sysroots/cubox-i/pkgdata
>>> alsa-conf-base
>>> syntax: oe-pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist>
>>> "<globs>"
>>>
>>>                       read-value [-d] <pkgdatadir> <vendor-os>
>>>
>>> <value-name> "<package-name>_<package_architecture>"
>>>
>>>
>>> Best regards,
>>>
>>>      - Jussi
>

