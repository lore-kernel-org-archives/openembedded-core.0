Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1EE57570D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 01:33:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u211XOYU030518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 29 Feb 2016 17:33:24 -0800
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Feb 2016 17:33:24 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456456877.git.mark.hatle@windriver.com>
	<CAJTo0LYDSo_oEMQEhHUWZEO2AGZ516JFevNH7oZ-yTKP_S8_sw@mail.gmail.com>
	<56D12579.9020705@windriver.com>
	<CAJTo0LYdiFyyU0Mn8eEq8eQfmcmKekkXxg1Dzqv+apA9RfA1hQ@mail.gmail.com>
	<56D23094.20207@windriver.com> <56D46567.7070409@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56D4F163.8060406@windriver.com>
Date: Mon, 29 Feb 2016 19:33:23 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56D46567.7070409@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3 v2] Upgrade RPM 5 to 5.4.16 (CVS HEAD)
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
X-List-Received-Date: Tue, 01 Mar 2016 01:33:26 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 2/29/16 9:36 AM, Mark Hatle wrote:
> Status update.

Further status, I've identified all of the pending issues and will have a v3
patch sent out likely in the next few hours.  I just have to let my local tests
finish.

--Mark

> I was able to reproduce the issue and I have added a configure check to see if
> the compiler supports the atomic operations or not.  RPM will then configure
> itself to use them if available.
> 
> I also disabled the blake tests which were causing issues in some parallel builds.
> 
> Finally I found an issue where a specific dependency (internal to the package)
> was not being properly determined by RPM.  I'm currently investigating this.
> 
> --Mark
> 
> On 2/27/16 5:26 PM, Mark Hatle wrote:
>> On 2/27/16 4:47 PM, Burton, Ross wrote:
>>>
>>> On 27 February 2016 at 04:26, Mark Hatle <mark.hatle@windriver.com
>>> <mailto:mark.hatle@windriver.com>> wrote:
>>>
>>>     I am not getting this error on qemux86.
>>>
>>>     My build configuration:
>>>
>>>     BB_VERSION        = "1.29.0"
>>>     BUILD_SYS         = "x86_64-linux"
>>>     NATIVELSBSTRING   = "Fedora-23"
>>>     TARGET_SYS        = "i586-oe-linux"
>>>     MACHINE           = "qemux86"
>>>     DISTRO            = "nodistro"
>>>     DISTRO_VERSION    = "nodistro.0"
>>>     TUNE_FEATURES     = "m32 i586"
>>>     TARGET_FPU        = ""
>>>     meta              = "mhatle/rpm-5.4.16:004efb3aaa973dba030847c1c8218238f0cc68c5"
>>>
>>>     The local.conf is the stock one with buildhistory and package_rpm enabled.
>>>
>>>     Which compiler do you have enabled?  I'm building with the default 5.3.0
>>>     compiler.
>>>
>>>     Since I'm not reproducing the problem, I'd like to know what the difference in
>>>     configurations is.
>>>
>>>
>>> This was on the autobuilder and happened twice in rpm-native:
>>>
>>> http://errors.yoctoproject.org/Errors/Details/38006/ (Debian 8.3)
>>> http://errors.yoctoproject.org/Errors/Details/38000/ (Ubuntu 14.04)
>>>
>>> I guess the -native bit is important there.
>>
>> Ok.. so that is different.  It means the host compiler is too old and doesn't
>> support atomic transactions.
>>
>>> Also, another failure happened more globally:
>>>
>>> gcc: error: tblake2bp.o: No such file or directory
>>>
>>> Several times in rpm for target:
>>> http://errors.yoctoproject.org/Errors/Details/37991/
>>> http://errors.yoctoproject.org/Errors/Details/38001/
>>> http://errors.yoctoproject.org/Errors/Details/38007/
>>> http://errors.yoctoproject.org/Errors/Details/38004/
>>
>> Ok. I'll investigate this one as well.  Likely this is a parallel build issue,
>> hopefully I can spot the fault.
>>
>> --Mark
>>
>>> And once in rpm-native:
>>> http://errors.yoctoproject.org/Errors/Details/37995/
>>>
>>> Ross
>>
> 


