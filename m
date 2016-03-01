Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD35A76E5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 15:16:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 01 Mar 2016 07:15:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,523,1449561600"; d="scan'208";a="57642533"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.118])
	([10.219.16.118])
	by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2016 07:15:00 -0800
To: Mikko.Rapeli@bmw.de, ross.burton@intel.com
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska> <20160225140942.GE6210@loska>
	<20160226081455.GH6210@loska>
	<CAJTo0LYAD76f7qOjAhyZF3NAgBo79ewUGKOT=8REWrnSK+cw7Q@mail.gmail.com>
	<20160229141934.GQ6210@loska>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56D5B219.8050204@linux.intel.com>
Date: Tue, 1 Mar 2016 09:15:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160229141934.GQ6210@loska>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Tue, 01 Mar 2016 15:16:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/29/2016 08:19 AM, Mikko.Rapeli@bmw.de wrote:
> On Mon, Feb 29, 2016 at 02:17:26PM +0000, Burton, Ross wrote:
>> On 26 February 2016 at 08:14, <Mikko.Rapeli@bmw.de> wrote:
>>
>>> 17:45:37  *** 0013:        with open(patch_file, "r") as f:
>>> 17:45:37      0014:            patch_text = f.read()
>>> 17:45:37      0015:
>>> 17:45:37      0016:        # Search for the "CVE: " line
>>> 17:45:37      0017:        match = cve_match.search(patch_text)
>>> 17:45:37 Exception: IOError: [Errno 2] No such file or directory:
>>> '/home/builder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/heirloom-mailx_12.5-1.diff'
>>> 17:45:37
>>> 17:45:37 ERROR: Function failed: do_cve_check
>>>
>>> So could this be caused by cve-check changes or is this just a side effect
>>> of some other recipe problems?
>>>
>> Do you have rm_work enabled?
> Yes.
>
> -Mikko

I think I have found the problem, when you do devshell it will execute 
do_unpack and the cve_check task must run after that for some recipes. 
Try this:

addtask cve_check after do_unpack before do_build

Sorry, to no include a diff, the diff is way bigger than just this line 
at the moment.

Mariano

