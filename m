Return-Path: <darren.hart@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4C0609C0
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 16:52:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2014 09:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="368268565"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2014 09:42:28 -0700
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.224]) by
	FMSMSX108.amr.corp.intel.com ([169.254.10.152]) with mapi id
	14.03.0123.003; Tue, 5 Aug 2014 09:45:18 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH 1/1] INITRD var: make it a list of filesystem images
Thread-Index: AQHPq1so0wNiYZq5p0CU9Wax1JRNMJvArl8AgAE9DACAAFcigA==
Date: Tue, 5 Aug 2014 16:45:17 +0000
Message-ID: <D006556F.9F7C9%darren.hart@intel.com>
References: <cover.1406658528.git.nitin.a.kamble@intel.com>
	<b60eac03f169389484bcc40fdfc3e4e12cb7934b.1406658528.git.nitin.a.kamble@intel.com>
	<D005011E.9F32A%darren.hart@intel.com> <53E05E94.2050802@intel.com>
In-Reply-To: <53E05E94.2050802@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.0.106]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 05 Aug 2014 16:52:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C305879DE6E6744190A5AEA7A2CB258A@intel.com>
Content-Transfer-Encoding: quoted-printable

On 8/4/14, 21:33, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:

>
>On 8/4/2014 9:38 AM, Hart, Darren wrote:
>> On 7/29/14, 11:34, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:

...

>>
>>> +	if [ -n "${INITRD}" ]; then
>>> +		rm -f $dest/initrd
>>> +		for fs in ${INITRD}
>>> +		do
>>> +			if [ -n "${fs}" ] && [ -s "${fs}" ]; then
>>
>> The -n test is unnecessary here. How would "for fs in ${INITRD}" result
>>in
>> an fs of "" ?
>The -n test is needed here, it checks whether the file exist or not.


Nope, -n tests if the string length is non-zero. See the bash manual
section "CONDITIONAL EXPRESSIONS". -s tests if the file exists and has a
size > 0.


>
>>
>>> +				cat ${fs} >> $dest/ignited
>>> +			fi
>> Some kind of a warning at least is warranted if a file appears in the
>> INITRD list but is either 0-size or non-existent.
>
>I tried to keep the original style of the code. But it makes sense to
>add a warning  or even an error here.


Style is fine, but error checking is a functional thing. If it was missing
before, it was a bug.

>>>
>>> build_iso() {
>>> 	# Only create an ISO if we have an INITRD and NOISO was not set
>>> -	if [ -z "${INITRD}" ] || [ ! -s "${INITRD}" ] || [ "${NOISO}" =3D "1"
>>>];
>>> then
>>> +	if [ -z "${INITRD}" ] || [ "${NOISO}" =3D "1" ]; then
>>> 		bbnote "ISO image will not be created."
>>> 		return
>>> 	Fi
>> Perhaps the -s test should be replaced with a -s of $dest/initrd?
>The -s test is replaced by the loop few lines below.
>>> +	# ${INITRD} is a list of multiple filesystem images
>>> +	for fs in ${INITRD}
>>> +	do
>>> +		if [ ! -s "${fs}" ]; then
>>> +			bbnote "ISO image will not be created. ${fs} is invalid."
>>> +			return
>>> +		fi
>>> +	done
>> This additional loop could be eliminated by including this test above.
>> Right? Or am I missing something subtle here?
>That approach will leave a hole where, the function will continue when
>one of the filesystem image is invalid.
>So the loop is better here as it does not leave any hole.


But you've already built it right? So you have already tested for -s ${fs}
previously. The only thing that matters now is that the assembled image is
valid. $dest/initrd. Right?

--=20
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation



