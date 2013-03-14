Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UGDQD-0005qU-Ju
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 20:02:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2EIjsN3028505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 11:45:54 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 14 Mar 2013 11:45:53 -0700
Message-ID: <51421ADB.2020803@windriver.com>
Date: Thu, 14 Mar 2013 13:45:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1363282893-19390-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<51421128.6090201@windriver.com> <5142148A.7010009@linaro.org>
In-Reply-To: <5142148A.7010009@linaro.org>
Subject: Re: [PATCH] Add architecture files for AArch64 architecture.
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
X-List-Received-Date: Thu, 14 Mar 2013 19:02:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/13 1:18 PM, Marcin Juszkiewicz wrote:
> W dniu 14.03.2013 19:04, Mark Hatle pisze:
>> I'm not completely familiar with aarch64.  So a couple of questions.
>> The first is is it supposed to allow a multilib configuration?  I.e.
>> being able to run both 32-bit "arm/thumb" code & aarch64 code on the
>> same machine?  If so, a "BASE_LIB_tune-aarch64" should be defined with
>> the right value.
>
> AArch64 is able to run ARMv7a code but it not something we worry too
> much now as there is no hardware yet so we mostly use OE for porting
> software. There will be no multilib related work done by Linaro in near
> time (if at all).

What I'm considering are the ability to use existing (binary only) 32-bit 
thumb/arm programs with these new cores.  I also don't have a good sense of the 
executable and memory size requirements of the new aarch64 to decide if multilib 
is something desired by the end users.  (if the executables are roughly the same 
size, then it greatly diminishes the usefulness of 32-bit multilibs.)

>> Second are there expected to be tuned variants for the aarch64, i.e.
>> processor/core tunings that need to get embedded into the package arch.
>> if so the definition of the TUNE_ARCH and TUNE_PKGARCH should probably
>> be based on the tune_feature...  (This may simply not be necessary
>> though as this is a new architecture that will expand and grow...)
>
> Probably big endian version will arrive sooner or later. Other than that
> no extra tuning will be needed (no hardware yet).
>
>> My suggestion then, to help with future growth is:
>>
>> DEFAULTTUNE ?= "aarch64"
>>
>> ARMPKGARCH ?= "aarch64"
>>
>> TUNEVALID[aarch64] = "Enable instructions for aarch64"
>> TUNECONFLICTS[aarch64] = ""
>> MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64",
>> ":aarch64", "" ,d)}"
>>
>> # Little Endian base configs
>> AVAILTUNES += "aarch64"
>> TUNE_FEATURES_tune-aarch64 ?= "aarch64"
>> BASE_LIB_tune-aarch64 = "lib64" <-- guess on my part
>
> No, we do not use /lib64/ for AArch64.

This will certainly limit the use of multilibs if it becomes desirable on this 
part.  I really dislike architectures that use the same directory for two 
"machine" compatible libraries with different ABIs.

>> TUNE_ARCH_tune-aarch64 = "aarch64"
>> TUNE_PKGARCH_tune-aarch64 = "aarch64"
>> PACKAGE_EXTRA_ARCHS_tune-aarch64 += "aarch64"
>
> Thanks, changed and attached new version.
>
>  From b303dd32eecd2fca3708eef468910f19bb903b3f Mon Sep 17 00:00:00 2001
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Date: Thu, 14 Mar 2013 18:41:08 +0100
> Subject: [PATCH] Add architecture files for AArch64 architecture.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/conf/machine/include/aarch64/README           |  9 +++++++++
>   meta/conf/machine/include/aarch64/arch-aarch64.inc | 14 ++++++++++++++
>   2 files changed, 23 insertions(+)
>   create mode 100644 meta/conf/machine/include/aarch64/README
>   create mode 100644 meta/conf/machine/include/aarch64/arch-aarch64.inc
>
> diff --git a/meta/conf/machine/include/aarch64/README b/meta/conf/machine/include/aarch64/README
> new file mode 100644
> index 0000000..59c8710
> --- /dev/null
> +++ b/meta/conf/machine/include/aarch64/README
> @@ -0,0 +1,9 @@
> +2013-03-14 - Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> + - Initial Revision
> +
> +Currently only little endian is defined for AArch64.
> +
> +AArch64 is 64-bit ARM architecture.
> +
> +Also known as ARMv8 (instruction set) or ARM64 (name in Linux kernel and
> +architecture name in Debian and derived).
> diff --git a/meta/conf/machine/include/aarch64/arch-aarch64.inc b/meta/conf/machine/include/aarch64/arch-aarch64.inc
> new file mode 100644
> index 0000000..121d339
> --- /dev/null
> +++ b/meta/conf/machine/include/aarch64/arch-aarch64.inc
> @@ -0,0 +1,14 @@
> +DEFAULTTUNE ?= "aarch64"
> +
> +ARMPKGARCH ?= "aarch64"
> +
> +TUNEVALID[aarch64] = "Enable instructions for aarch64"
> +TUNECONFLICTS[aarch64] = ""
> +MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES += "aarch64"
> +TUNE_FEATURES_tune-aarch64 ?= "aarch64"

That should be an "=".  Since that tune has a specific "feature" meaning.  If 
someone wants to deviate, they should establish a new/custom tune.

> +TUNE_ARCH_tune-aarch64 = "aarch64"
> +TUNE_PKGARCH_tune-aarch64 = "aarch64"
> +PACKAGE_EXTRA_ARCHS_tune-aarch64 += "aarch64"
>

Otherwise this looks reasonable to me.  (Once real hardware exists and people 
start building products.. the multilib question may come back...)

--Mark


