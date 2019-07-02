Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4145F7EA07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 07:34:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x627Xh2N000528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2019 00:33:53 -0700
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 2 Jul 2019 00:33:32 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1555923339-440174-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <d0eda857-ab9b-edf9-6fa2-32c2c0169ed3@windriver.com>
Date: Tue, 2 Jul 2019 15:33:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1555923339-440174-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.221]
Subject: Re: [PATCH v2] ltp: file01: Fix in was not recognized
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
X-List-Received-Date: Tue, 02 Jul 2019 07:34:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Kindly ping.

Zhe

On 4/22/19 4:55 PM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> Some file has "pie" appending after LSB or MSB, which causes mismatch and the
> following error.
>
> "file01 10 TFAIL: in: was not recognized"
> ..."ELF 64-bit LSB pie executable"...
>
> This patches tunes the regulation expression to include those cases.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v1 to v2: Move Upstream-Status to right place
>
>  .../0001-file01.sh-Fix-in-was-not-recognized.patch | 38 ++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20190115.bb          |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch b/meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch
> new file mode 100644
> index 0000000..5cd9e08
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch
> @@ -0,0 +1,38 @@
> +From 974e9b862e503c50501079e6586f81918e94a849 Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Fri, 19 Apr 2019 17:57:48 +0800
> +Subject: [PATCH] file01.sh: Fix in was not recognized
> +
> +Some file has "pie" appending after LSB or MSB, which causes mismatch and the
> +following error.
> +
> +"file01 10 TFAIL: in: was not recognized"
> +..."ELF 64-bit LSB pie executable"...
> +
> +This patches tunes the regulation expression to include those cases.
> +
> +Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-April/011758.html]
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + testcases/commands/file/file01.sh | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/testcases/commands/file/file01.sh b/testcases/commands/file/file01.sh
> +index 0a8119e..55c0433 100755
> +--- a/testcases/commands/file/file01.sh
> ++++ b/testcases/commands/file/file01.sh
> +@@ -91,7 +91,9 @@ do_test()
> + 	 9) file_test in.m4 "M4 macro processor script, ASCII text" \
> + 			    "ASCII M4 macro language pre-processor text";;
> + 	10) file_test in "ELF .*-bit $TEST_ARCH executable, .*" \
> +-			 "ELF .*-bit $TEST_ARCH shared object, .*";;
> ++			 "ELF .*-bit $TEST_ARCH shared object, .*" \
> ++			 "ELF .*-bit $TEST_ARCH pie executable, .*" \
> ++			 "ELF .*-bit $TEST_ARCH pie shared object, .*";;
> + 	11) file_test in.ar "current ar archive";;
> + 	12) file_test in.tar "tar archive";;
> + 	13) file_test in.tar.gz "gzip compressed data, .*";;
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
> index 1d0c00b..a9e025a 100644
> --- a/meta/recipes-extended/ltp/ltp_20190115.bb
> +++ b/meta/recipes-extended/ltp/ltp_20190115.bb
> @@ -50,6 +50,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://define-sigrtmin-and-sigrtmax-for-musl.patch \
>             file://setregid01-security-string-formatting.patch \
>             file://0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch \
> +           file://0001-file01.sh-Fix-in-was-not-recognized.patch \
>             "
>  
>  S = "${WORKDIR}/git"


