Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0C96006E;
	Mon, 16 Oct 2017 02:14:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9G2EPPc024944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 15 Oct 2017 19:14:25 -0700
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 15 Oct 2017 19:14:23 -0700
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171012015609.GA3832@jama>
	<CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
	<50262241.T8AzmBLD0O@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqqx-7PgL7833JVTn87Tdc57+h-Ob7VLfBD4khmpKN+HA@mail.gmail.com>
	<CAJTo0LZMRAP4t4XcjyNw-uhnqLLU=sQW38=EMKn=RKo3=c-bEw@mail.gmail.com>
	<CA+chaQe1gHwBOzvA7mKTMU312iF5HApkMjib7J5CysEQCuA-3g@mail.gmail.com>
	<CAMKF1sq-BgVCA0C_coZDpxWJhnOLxsUTxZQyHg13AO1zoLbGgA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <765cf62b-74bb-8611-d858-807a501ee01c@windriver.com>
Date: Mon, 16 Oct 2017 10:20:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq-BgVCA0C_coZDpxWJhnOLxsUTxZQyHg13AO1zoLbGgA@mail.gmail.com>
X-Originating-IP: [128.224.163.189]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Mon, 16 Oct 2017 02:14:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I've created YOCTO#12227 
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=12227).
And I've sent out a patch, adding ssh to HOSTTOOLS_NONFATAL.
Another way to fix things up is to add ssh to HOSTTOOLS and change 
QuickStart accordingly.
Either way is acceptable for me.
I'm using the first solution as I'm slightly leaning to it.

Best Regards,
Chen Qi

On 10/13/2017 10:40 AM, Khem Raj wrote:
> On Thu, Oct 12, 2017 at 7:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> I just got bunch of do_fetch errors from components using
>> git://....;protocol=ssh
>>
>> So it isn't just the sanity check and CONNECTIVITY_CHECK_URIS, it's
>> everywhere where git-native (by default in ASSUME_PROVIDED) is used with
>> ssh.
> right, I realised that it wont make the situation worse, then it was
> in last release,
>
>> On Thu, Oct 12, 2017 at 1:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 12 October 2017 at 06:01, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Wed, Oct 11, 2017 at 9:32 PM, Paul Eggleton
>>>> <paul.eggleton@linux.intel.com> wrote:
>>>>> On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:
>>>>>> On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa <martin.jansa@gmail.com>
>>>>>> wrote:
>>>>>>> On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org
>>>>>>> wrote:
>>>>>>>> --- a/meta/conf/bitbake.conf
>>>>>>>> +++ b/meta/conf/bitbake.conf
>>>>>>>> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>>>>>>>>   "
>>>>>>>>
>>>>>>>>   # Tools needed to run testimage runtime image testing
>>>>>>>> -HOSTTOOLS += "ip ping ps scp ssh stty"
>>>>>>>> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh
>>>>>>>> stty'][bb.data.inherits_class('testimage', d)]}"
>>>>>>> Shouldn't we include at least ssh by default?
>>>>>> I would say no, since nothing in OE-Core depends on it. more we
>>>>>> abstract from host system better it is.
>>>>> I'm with Martin on this one, let's not make it painful for people to
>>>>> use
>>>>> the SSH protocol in git URLs in their recipes. I don't see much
>>>>> potential
>>>>> for host contamination.
>>>> Standard distro do not install ssh, if we want to add it here, probably
>>>> we
>>>> should at the same time let user know that he should install ssh
>>>
>>> That's what HOSTTOOLS_NONFATAL is for.  Who is going to claim the glory
>>> and post a patch?
>>>
>>> Ross
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>


