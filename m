Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 36D3B7742D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 15:38:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 26 Feb 2016 07:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="753806782"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.118])
	([10.219.16.118])
	by orsmga003.jf.intel.com with ESMTP; 26 Feb 2016 07:38:14 -0800
To: Mikko.Rapeli@bmw.de
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<20160225121421.GB6210@loska> <20160225122912.GC6210@loska>
	<20160225132748.GD6210@loska> <20160225140942.GE6210@loska>
	<20160226081455.GH6210@loska> <56D065CF.9060303@linux.intel.com>
	<20160226145624.GJ6210@loska> <20160226145701.GK6210@loska>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56D0718A.7050506@linux.intel.com>
Date: Fri, 26 Feb 2016 09:38:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160226145701.GK6210@loska>
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
X-List-Received-Date: Fri, 26 Feb 2016 15:38:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 02/26/2016 08:57 AM, Mikko.Rapeli@bmw.de wrote:
> On Fri, Feb 26, 2016 at 03:56:24PM +0100, Mikko Rapeli wrote:
>> On Fri, Feb 26, 2016 at 08:48:47AM -0600, Mariano Lopez wrote:
>>> On 02/26/2016 02:14 AM, Mikko.Rapeli@bmw.de wrote:
>>>> Hi,
>>>>
>>>> On my developer machine the cve-check ran ok for dizzy but on build server
>>>> with sstate-cache and rmwork enabled it failed with what looks like a race
>>>> condition when scanning the patch files:
>>>>
>>>> 17:45:36 ERROR: Error executing a python function in /home/builder/src/base/poky/meta/recipes-extended/mailx/mailx_12.5.bb:
>>>> 17:45:36
>>>> 17:45:36 The stack trace of python calls that resulted in this exception/failure was:
>>>> 17:45:36 File: 'do_cve_check', lineno: 17, function: <module>
>>>> 17:45:36      0013:    else:
>>>> 17:45:36      0014:        bb.note("Failed to update CVE database, skipping CVE check")
>>>> 17:45:36      0015:
>>>> 17:45:36      0016:
>>>> 17:45:36  *** 0017:do_cve_check(d)
>>>> 17:45:36      0018:
>>>> 17:45:37 File: 'do_cve_check', lineno: 8, function: do_cve_check
>>>> 17:45:37      0004:    Check recipe for patched and unpatched CVEs
>>>> 17:45:37      0005:    """
>>>> 17:45:37      0006:
>>>> 17:45:37      0007:    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE", True)):
>>>> 17:45:37  *** 0008:        patched_cves = get_patches_cves(d)
>>>> 17:45:37      0009:        patched, unpatched = check_cves(d, patched_cves)
>>>> 17:45:37      0010:        if patched or unpatched:
>>>> 17:45:37      0011:            cve_data = get_cve_info(d, patched + unpatched)
>>>> 17:45:37      0012:            cve_write_data(d, patched, unpatched, cve_data)
>>>> 17:45:37 File: 'cve-check.bbclass', lineno: 13, function: get_patches_cves
>>>> 17:45:37      0009:    cve_match = re.compile("CVE:( CVE\-\d+\-\d+)+")
>>>> 17:45:37      0010:    patched_cves = set()
>>>> 17:45:37      0011:    for url in src_patches(d):
>>>> 17:45:37      0012:        patch_file = bb.fetch.decodeurl(url)[2]
>>>> 17:45:37  *** 0013:        with open(patch_file, "r") as f:
>>>> 17:45:37      0014:            patch_text = f.read()
>>>> 17:45:37      0015:
>>>> 17:45:37      0016:        # Search for the "CVE: " line
>>>> 17:45:37      0017:        match = cve_match.search(patch_text)
>>>> 17:45:37 Exception: IOError: [Errno 2] No such file or directory: '/home/builder/src/base/build/tmp/work/corei7-64-linux/mailx/12.5-r2/heirloom-mailx_12.5-1.diff'
>>>> 17:45:37
>>>> 17:45:37 ERROR: Function failed: do_cve_check
>>>>
>>>> So could this be caused by cve-check changes or is this just a side effect
>>>> of some other recipe problems?
>>>>
>>>> I could not see that kind of fixes in master.
>>>>
>>>> -Mikko
>>> The changes in patch series were minimal and actually this part of the code
>>> wasn't touched at all. That part of the code will look for all the files in
>>> the SRC_URI variable and will look for the "CVE:" tag in order to find
>>> patches that solve CVEs.
>> Yep, the code seems straight forward.
>>
>>> It seems the problem is with the bitbake fetcher, or the recipe;
>>> unfortunately the fetcher is one of the components that most change between
>>> releases. Another thing to check is that if actually there is a
>>> heirloom-mailx_12.5-1.diff file in the paths that the fetcher look for. You
>>> can check this in the cve_check or patch log in the work directory of the
>>> recipe.
>> Unfortunately the file is there if I check with devshell but I have now
>> four different CI runs with this failure. Only difference to my developer
>> machine is sstate cache. Build machines maintain their own sstate cache.
> Last two runs were with v2 patches.

Would be possible to run these CI with master to check if you see the 
error too?
Also, what you can do is to put try: except:, but this won't solve the 
problem, just will hide it so the build can finish.

>
> -Mikko

Mariano Lopez

