Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C585C77122
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 04:38:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0Q4cxQn024570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 25 Jan 2016 20:38:59 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jan 2016 20:38:58 -0800
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1453764577-26470-1-git-send-email-anibal.limon@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56A6F861.9000101@windriver.com>
Date: Tue, 26 Jan 2016 12:38:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453764577-26470-1-git-send-email-anibal.limon@linux.intel.com>
Subject: Re: [PATCHv3] ptest-runner_2.0: Add ptest-runner_2.0 recipe.
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
X-List-Received-Date: Tue, 26 Jan 2016 04:38:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 01/26/2016 07:29 AM, Aníbal Limón wrote:
> The ptest-runner 2.0 is C written program for run ptests of
> Yocto/Openembedded, is fully compatible with previous version of
> ptest-runner that was a shell script that runs ptests sequencially.

If it is fully compatible with 1.0, how about remove 1.0, please ?

// Robert

>
> The mainly reason for the new ptest-runner in C is because is designed
> for run in tiny systems also the old shell script version have problems
> when certain ptest hang it becomes blocked indefinitely.
>
> Now the ptest-runner 2.0 support the next features:
>
> 	- Specify the directory for search ptests.
> 	- List available ptests.
> 	- Specify the timeout for avoid blocking indefinetly.
> 	- Only run certain ptests.
>
> Proposed features:
>
> 	- Adds support for per ptest output file.
> 	- Adds support for run ptests in parallel (review possible
> 	  colisions in ptests).
>
> [YOCTO #8021]
>
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>   .../ptest-runner/ptest-runner_2.0.bb               | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> new file mode 100644
> index 0000000..221cf6c
> --- /dev/null
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "A C program to run all installed ptests"
> +DESCRIPTION = "The ptest-runner2 package installs a ptest-runner \
> +program which loops through all installed ptest test suites and \
> +runs them in sequence."
> +HOMEPAGE = "https://github.com/alimon/ptest-runner2"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> +
> +SRCREV = "8bfdf946e784f4d5757bebee1fbc4b4a3d7a95c4"
> +PV = "2.0+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/alimon/ptest-runner2.git;protocol=https"
> +S = "${WORKDIR}/git"
> +
> +FILES_${PN} = "${bindir}/ptest-runner"
> +
> +do_compile () {
> +	oe_runmake
> +}
> +
> +do_install () {
> +	install -D -m 0755 ${WORKDIR}/git/ptest-runner ${D}${bindir}/ptest-runner
> +}
>

