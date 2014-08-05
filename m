Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8E160C19
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 17:11:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2014 10:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="368282489"
Received: from kennetho-mobl.amr.corp.intel.com (HELO [10.254.99.137])
	([10.254.99.137])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2014 10:02:34 -0700
Message-ID: <53E10ED5.6030508@intel.com>
Date: Tue, 05 Aug 2014 10:05:25 -0700
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Organization: Intel Corp
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Hart, Darren" <darren.hart@intel.com>, 
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, 
	"Burton, Ross" <ross.burton@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <cover.1406658528.git.nitin.a.kamble@intel.com>
	<b60eac03f169389484bcc40fdfc3e4e12cb7934b.1406658528.git.nitin.a.kamble@intel.com>
	<D005011E.9F32A%darren.hart@intel.com> <53E05E94.2050802@intel.com>
	<D006556F.9F7C9%darren.hart@intel.com>
In-Reply-To: <D006556F.9F7C9%darren.hart@intel.com>
Subject: Re: [PATCH 1/1] INITRD var: make it a list of filesystem images
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
X-List-Received-Date: Tue, 05 Aug 2014 17:11:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/2014 9:45 AM, Hart, Darren wrote:
> On 8/4/14, 21:33, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:
>
>> On 8/4/2014 9:38 AM, Hart, Darren wrote:
>>> On 7/29/14, 11:34, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:
> ...
>
>>>> +	if [ -n "${INITRD}" ]; then
>>>> +		rm -f $dest/initrd
>>>> +		for fs in ${INITRD}
>>>> +		do
>>>> +			if [ -n "${fs}" ] && [ -s "${fs}" ]; then
>>> The -n test is unnecessary here. How would "for fs in ${INITRD}" result
>>> in
>>> an fs of "" ?
>> The -n test is needed here, it checks whether the file exist or not.
>
> Nope, -n tests if the string length is non-zero. See the bash manual
> section "CONDITIONAL EXPRESSIONS". -s tests if the file exists and has a
> size > 0.
You are right. it is "-N" which checks for presence of the file.

>
>>>> +				cat ${fs} >> $dest/ignited
>>>> +			fi
>>> Some kind of a warning at least is warranted if a file appears in the
>>> INITRD list but is either 0-size or non-existent.
>> I tried to keep the original style of the code. But it makes sense to
>> add a warning  or even an error here.
>
> Style is fine, but error checking is a functional thing. If it was missing
> before, it was a bug.
Noted.

>>>> build_iso() {
>>>> 	# Only create an ISO if we have an INITRD and NOISO was not set
>>>> -	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" = "1"
>>>> ];
>>>> then
>>>> +	if [ -z "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
>>>> 		bbnote "ISO image will not be created."
>>>> 		return
>>>> 	Fi
>>> Perhaps the -s test should be replaced with a -s of $dest/initrd?
>> The -s test is replaced by the loop few lines below.
>>>> +	# ${INITRD} is a list of multiple filesystem images
>>>> +	for fs in ${INITRD}
>>>> +	do
>>>> +		if [ ! -s "${fs}" ]; then
>>>> +			bbnote "ISO image will not be created. ${fs} is invalid."
>>>> +			return
>>>> +		fi
>>>> +	done
>>> This additional loop could be eliminated by including this test above.
>>> Right? Or am I missing something subtle here?
>> That approach will leave a hole where, the function will continue when
>> one of the filesystem image is invalid.
>> So the loop is better here as it does not leave any hole.
>
> But you've already built it right? So you have already tested for -s ${fs}
> previously. The only thing that matters now is that the assembled image is
> valid. $dest/initrd. Right?
No, the dest/initrd is not built at this point. It will be built in the 
populate function which is called later. so that check will always fail 
wrongly.

I also notice that RP has pulled in part of the commit already, hence I 
will be making another commit to address the feedback.

Thanks,
Nitin



