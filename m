Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F065072381
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 15:58:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 05 Dec 2014 07:58:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="425571238"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.54])
	([10.219.4.54])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2014 07:48:06 -0800
Message-ID: <5481D62B.7090805@linux.intel.com>
Date: Fri, 05 Dec 2014 09:58:35 -0600
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1417623235.git.alejandro.hernandez@linux.intel.com>	
	<8d53e3e985f526e6c845328dc6bfa9c27cc63413.1417623235.git.alejandro.hernandez@linux.intel.com>
	<1417686494.15614.49.camel@linuxfoundation.org>
In-Reply-To: <1417686494.15614.49.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA test for unexpanded ${D}
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
X-List-Received-Date: Fri, 05 Dec 2014 15:59:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes, I agree the function should iterate over all the PACKAGES, but for 
the second matter, using the existing package variable handling 
infrastructure within the class, ends up expanding the variables before 
being able to check them , using getVar('FOO', False) is useless in this 
case, any suggestions?

On 04/12/14 03:48, Richard Purdie wrote:
> On Wed, 2014-12-03 at 11:00 -0600, Alejandro Hernandez wrote:
>> Checks in FILES and pkg_* variables ,solves common mistake
>> of using ${D} instead of $D and warns the user accordingly.
>>
>> [YOCTO #6642]
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>> ---
>>   meta/classes/insane.bbclass | 34 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 0b45374..419c89b 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -906,6 +906,39 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
>>   
>>       return sane
>>   
>> +def package_qa_check_unexpanded_d(d):
>> +    """
>> +    Check for unexpanded D variable in pkg_* and FILES
>> +    variables, warn the user to use it correctly.
>> +    """
>> +
>> +    sane = True
>> +
>> +    # Get variables for current package
>> +    pkg = d.getVar('PN', True)
> Rather than just PN here (which may or may not be a package), you need
> to iterate over the list of packages in PACKAGES.
>
>
>> +    localdata = bb.data.createCopy(d)
>> +    localdata.setVar('OVERRIDES', pkg)
>> +    bb.data.update_data(localdata)
>> +
>> +    # Go through all variables and check if unexpanded D is found, warn the user accordingly
>> +    for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
>> +        bbvar = localdata.getVar(var, False)
>> +        if bbvar:
>> +            if "${D}" in bbvar:
>> +                if var == 'FILES':
>> +                    bb.error("FILES should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference")
>> +                    sane = False
>> +                else:
>> +                    bb.error("%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pkg))
>> +                    sane = False
>> +    return sane
>> +
>> +# Actual task to check for ${D
>> +python do_qa_check_unexpanded_d(){
>> +    package_qa_check_unexpanded_d(d)
>> +}
>> +addtask qa_check_unexpanded_d before do_compile
>> +
> Why are we doing this before compile, rather than using the existing
> package variable handling infrastructure in the class?
>
> The other benefit of using that is we can benefit from the QA_WARN and
> QA_ERR variables to determine if this issue is a warning or a fatal
> error.
>
> Cheers,
>
> Richard
>
>


