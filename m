Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UGCm9-0004TA-57
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:21:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2EI4T1K016703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 11:04:29 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 14 Mar 2013 11:04:29 -0700
Message-ID: <51421128.6090201@windriver.com>
Date: Thu, 14 Mar 2013 13:04:24 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1363282893-19390-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1363282893-19390-1-git-send-email-marcin.juszkiewicz@linaro.org>
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
X-List-Received-Date: Thu, 14 Mar 2013 18:21:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/13 12:41 PM, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/conf/machine/include/aarch64/README           |  9 +++++++++
>   meta/conf/machine/include/aarch64/arch-aarch64.inc | 16 ++++++++++++++++
>   2 files changed, 25 insertions(+)
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
> index 0000000..5177d7f
> --- /dev/null
> +++ b/meta/conf/machine/include/aarch64/arch-aarch64.inc
> @@ -0,0 +1,16 @@
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
> +
> +TUNE_ARCH = "aarch64"
> +TUNE_PKGARCH = "aarch64"
> +
> +PACKAGE_EXTRA_ARCHS += "aarch64"
>

I'm not completely familiar with aarch64.  So a couple of questions.  The first 
is is it supposed to allow a multilib configuration?  I.e. being able to run 
both 32-bit "arm/thumb" code & aarch64 code on the same machine?  If so, a 
"BASE_LIB_tune-aarch64" should be defined with the right value.

Second are there expected to be tuned variants for the aarch64, i.e. 
processor/core tunings that need to get embedded into the package arch.  if so 
the definition of the TUNE_ARCH and TUNE_PKGARCH should probably be based on the 
tune_feature...  (This may simply not be necessary though as this is a new 
architecture that will expand and grow...)

My suggestion then, to help with future growth is:

DEFAULTTUNE ?= "aarch64"

ARMPKGARCH ?= "aarch64"

TUNEVALID[aarch64] = "Enable instructions for aarch64"
TUNECONFLICTS[aarch64] = ""
MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", 
":aarch64", "" ,d)}"

# Little Endian base configs
AVAILTUNES += "aarch64"
TUNE_FEATURES_tune-aarch64 ?= "aarch64"
BASE_LIB_tune-aarch64 = "lib64" <-- guess on my part
TUNE_ARCH_tune-aarch64 = "aarch64"
TUNE_PKGARCH_tune-aarch64 = "aarch64"
PACKAGE_EXTRA_ARCHS_tune-aarch64 += "aarch64"



