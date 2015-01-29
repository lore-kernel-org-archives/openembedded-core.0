Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 96EDD60701
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 21:20:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2015 13:20:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,488,1418112000"; d="scan'208";a="669917716"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.43])
	([10.219.4.43])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2015 13:20:01 -0800
Message-ID: <54CAA406.7060209@linux.intel.com>
Date: Thu, 29 Jan 2015 15:20:06 -0600
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1422488980-24850-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<54CA413C.6000707@linux.intel.com>
In-Reply-To: <54CA413C.6000707@linux.intel.com>
Subject: Re: [PATCH][RFC] insane.bbclass: Enhance file-rdeps QA check
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
X-List-Received-Date: Thu, 29 Jan 2015 21:20:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 29/01/15 08:18, Saul Wold wrote:

> Have you done before and after builds to assess the performance 
> differences if any?

I checked, found no actual difference on performance.


> What tool are you using that might cause double spacing in your commit 
> messages.

Won't be happening again.

>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 143ec46..542346a 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -34,7 +34,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev 
>> libdir xorg-driver-abi \
>>   ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig 
>> la \
>>               perms dep-cmp pkgvarcheck perm-config perm-line 
>> perm-link \
>>               split-strip packages-list pkgv-undefined var-undefined \
>> -            version-going-backwards \
>> +            version-going-backwards  symlink-to-sysroot\
>>               "
>>
> We should also add this to the poky.conf, for the Poky distro since it 
> overrides the ERROR_QA setting in meta-yocto/distro/conf/poky.conf. 
> That patch should go to poky@yoctoproject.org

Yes, a patch to poky is also required, I intended to send it once this 
gets accepted.


>> @@ -841,31 +841,27 @@ def package_qa_check_rdepends(pkg, pkgdest, 
>> skip, taskdeps, packages, d):
>>                   # case there is a RDEPENDS_pkg = "python" in the 
>> recipe.
>>                   for py in [ d.getVar('MLPREFIX', True) + "python", 
>> "python" ]:
>>                       if py in done:
>> -                        filerdepends.discard("/usr/bin/python")
>> + filerdepends.pop("/usr/bin/python",None)
>>                           done.remove(py)
>>                   for rdep in done:
>>                       # For Saving the FILERPROVIDES, RPROVIDES and 
>> FILES_INFO
>> -                    rdep_rprovides = set()
>>                       rdep_data = 
>> oe.packagedata.read_subpkgdata(rdep, d)
>>                       for key in rdep_data:
>>                           if key.startswith("FILERPROVIDES_") or 
>> key.startswith("RPROVIDES_"):
>>                               for subkey in rdep_data[key].split():
>> -                                rdep_rprovides.add(subkey)
>> +                                filerdepends.pop(subkey,None)
> Should this be a pop here since you are removing a add()?

Yes, it should be a pop, because it was adding subkey to rdep_rprovides, 
which were substracted from filerdepends afterwards, this worked on sets 
but not on dictionaries, the same result is achieved this way.


