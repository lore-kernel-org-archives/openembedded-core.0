Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1USqjB-0000Z0-Sn
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 17:26:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3IF8ljU009181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Apr 2013 08:08:47 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 18 Apr 2013 08:08:47 -0700
Message-ID: <51700C7C.3050100@windriver.com>
Date: Thu, 18 Apr 2013 10:08:44 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
	<516FFE5F.7040901@windriver.com>
	<alpine.DEB.2.02.1304181018220.21920@oneiric>
In-Reply-To: <alpine.DEB.2.02.1304181018220.21920@oneiric>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: tweaking insane.bbclass to handle MIPS SEAD-3?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 15:26:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/13 9:25 AM, Robert P. J. Day wrote:
> On Thu, 18 Apr 2013, Mark Hatle wrote:
>
>> On 4/18/13 7:38 AM, Robert P. J. Day wrote:
>>>
>>>     students from a class of mine last year are currently playing
>>> with a MIPS SEAD-3:
>>>
>>> http://www.mips.com/products/development-kits/mips-sead-3/
>>>
>>> and asked for some assistance getting oe/yocto to build for that
>>> kit. they started with the routerstation pro content, and just
>>> wanted to reproduce the same rootfs to run on the SEAD-3 (they
>>> would use the provided u-boot and kernel for now). the biggest
>>> issue was changing the endianness of the build.
>>>
>>>     got an email this morning, they have a working rootfs, i asked
>>> for details on everything they had to do, but for now, here's the
>>> final issue they dealt with:
>>>
>>> "Attached rootfs created for RS Pro, but with mips32el (little
>>> endian config) and soft floating point. I had to comment out the
>>> endianess check Python code from the insane.bbclass file to get
>>> the build to work."
>>
>> I'm interested in what changes are required.  Both mips and mipsel
>> are defined in the insane class.  If you define 'mips', but end up
>> building little endian, you WILL get errors.  But if the arch is
>> defined as mipsel, then no errors should be generated.
>>
>> If the arch is 'mips32' and 'mips32el' then those are simply not
>> defined at this point.  But before defining them, what is the
>> difference between mips and mips32?
>>
>> (I have no experience with this particular board, so I don't know
>> what the actual gcc configuration is for building functional
>> software.)
>
>    i'm still waiting to hear back ... do you know *theoretically* what
> the recipe should have been? i gave them some initial advice but as
> this was the first time i had anything to do with MIPS endianness, it
> might have been horrifically bad advice.
>
>    i pointed out the oe-core file "tune-mips32.inc", and the following:
>
> DEFAULTTUNE ?= "mips32"
>
> require conf/machine/include/mips/arch-mips.inc
>
> TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
> TUNECONFLICTS[mips32] = "n64 n32"
> TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32",
> "-march=mips32", "", d)}"
>
> AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
>
>    so, off the top of my head, i suggested adding to local.conf:
>
> DEFAULTTUNE := "mips32el"

A quick look at master says that that should be fine.  It will result in:

TUNE_FEATURES = "o32 fpu-hard mips32"
BASE_LIB = "lib"
TUNE_ARCH = "mipsel"
TUNE_PKGARCH = "mips32el"
PACKAGE_EXTRA_ARCHS = "mipsel mips32el"

Changing the tune to "mips32el-nf", will result in a mips32 little endian, 
soft-float system.  And there should be no sanity or other failures.

(Note, the difference between 'mips' and 'mips32' is use of -march=mips32.)

> since that's listed as one of the "AVAILTUNES", but i was just
> guessing. from what i heard, that *partly* solved the problem but the
> rest of the solution is what you read above.
>
>    i can easily ask them to try a different recipe, they're all set up
> to build and test a rootfs. what *would* have been the right approach?

If the tuning is set right, then everything else should "just work".  They can 
do the DEFAULTTUNE setting in their local.conf, but it's better to do it in 
their machine.conf file.  (Style vs required.)

They can verify the settings using 'bitbake -e' and looking for the CC flags, 
and other related items to make sure they are right for this system.

> rday
>



