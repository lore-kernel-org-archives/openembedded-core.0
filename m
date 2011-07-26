Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QllBZ-0001jr-Aa
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 19:12:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QH8ZFl013964
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 10:08:35 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 26 Jul 2011 10:08:31 -0700
Message-ID: <4E2EF488.5060308@windriver.com>
Date: Tue, 26 Jul 2011 12:08:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<b270e42da9fef8715c84054fc968ee7fe2492eab.1311683981.git.richard.purdie@linuxfoundation.org>
	<4E2ED221.3010705@windriver.com> <1311699119.2344.281.camel@rex>
In-Reply-To: <1311699119.2344.281.camel@rex>
Subject: Re: [PATCH 2/3] Add basic Mips core tune config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 17:12:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/26/11 11:51 AM, Richard Purdie wrote:
> On Tue, 2011-07-26 at 09:41 -0500, Mark Hatle wrote:
>> Few quick items here:
>>
>> On 7/26/11 7:44 AM, Richard Purdie wrote:
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/conf/machine/include/mips/arch-mips.inc |   64 +++++++++++++++++++++++++-
>>>  meta/conf/machine/include/tune-mips32.inc    |   10 +++-
>>>  2 files changed, 71 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
>>> index f7f4eed..071e6b5 100644
>>> --- a/meta/conf/machine/include/mips/arch-mips.inc
>>> +++ b/meta/conf/machine/include/mips/arch-mips.inc
>>> @@ -1 +1,63 @@
>> ...
>>
>>> +# Floating point
>>> +TUNEVALID[fpu-hard] = "Use hardware FPU"
>>> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "-mhard-float", "-msoft-float", d)}"
>>> +TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "", "soft", d)}"
>>> +
>>> +# Package naming
>>> +MIPSPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
>>> +MIPSPKGSFX_BYTE = "${@bb.utils.contains("TUNE_FEATURES", "n64" , "64", "", d)}"
>>
>> n32 is also MIPS64.
>>
>> so a:
>>
>> MIPSPKGSFX_BYTE .= "${@bb.utils.contains("TUNE_FEATURES", "n32" , "64", "", d)}"
>>
>> should fix the issue.
>>
>>> +TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
>>> +
>>> +# Base tunes
>>> +AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
>>> +TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
>>> +BASE_LIB_tune-mips = "lib"
>>> +TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
>>> +BASE_LIB_tune-mips64-n32 = "lib32"
>>> +TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
>>> +BASE_LIB_tune-mips64 = "lib64"
>>> +TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
>>> +BASE_LIB_tune-mipsel = "lib"
>>> +TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
>>> +BASE_LIB_tune-mips64el-n32 = "lib32"
>>> +TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
>>> +BASE_LIB_tune-mips64el = "lib64"
>>> +TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
>>> +BASE_LIB_tune-mips-nf = "lib"
>>> +TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
>>> +BASE_LIB_tune-mips64-nf-n32 = "lib32"
>>> +TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
>>> +BASE_LIB_tune-mips64-nf = "lib64"
>>> +TUNE_FEATURES_tune-mipsel-nf = "o32"
>>> +BASE_LIB_tune-mipsel-nf = "lib"
>>> +TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
>>> +BASE_LIB_tune-mips64el-nf-n32 = "lib32"
>>> +TUNE_FEATURES_tune-mips64el-nf = "n64"
>>> +BASE_LIB_tune-mips64el-nf = "lib64"
>>> +
>>> diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
>>> index 28b0047..1f913df 100644
>>> --- a/meta/conf/machine/include/tune-mips32.inc
>>> +++ b/meta/conf/machine/include/tune-mips32.inc
>>> @@ -1,4 +1,10 @@
>>> +DEFAULTTUNE ?= "mips32"
>>> +
>>>  require conf/machine/include/mips/arch-mips.inc
>>>  
>>> -TUNE_CCARGS = "-march=mips32"
>>> -TUNE_PKGARCH = "mips"
>>> +TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
>>
>> If tune-mips32 is used, then all of the n32 and n64 variants are not possible.
>> Do we have a way to specify that?  Perhaps using the TUNECONFLICT?
> 
> Agreed, TUNE_CONFLICTS is the way to go. I've updated the patch on my
> branch with this and the other tweak:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/ml4&id=2a31a7d38149b6bc972831964bfdeae7422c128c

Looks good..

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



