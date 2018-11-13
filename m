Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5166C227
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 01:06:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAD16Rn7024994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 17:06:28 -0800 (PST)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 12 Nov 2018 17:06:27 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1541662273-22871-1-git-send-email-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <35eaf214-d7cf-aca6-f45c-88449b4eb68d@windriver.com>
Date: Tue, 13 Nov 2018 09:06:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1541662273-22871-1-git-send-email-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.153]
Subject: Re: [PATCH] ltp: kernel/syscall/setrlimit05.c: use a legal bad address for mips
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
X-List-Received-Date: Tue, 13 Nov 2018 01:06:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ping

--Hongzhi


On 11/08/2018 03:31 PM, Hongzhi.Song wrote:
> This testcase fails on mips32. The process is killed by SIGBUS which
> is not as expect.
>
> This is because:
> ((void *)-1) is not a legal bad address which causes the process
> killed by SIGBUG on mips.
>
> 'tst_get_bad_addr()' returns an address that should works on mips
> and other arches.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   ...t05-Use-another-method-to-get-bad-address.patch | 61 ++++++++++++++++++++++
>   meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
>   2 files changed, 62 insertions(+)
>   create mode 100644 meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> new file mode 100644
> index 0000000..dd688e4
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
> @@ -0,0 +1,61 @@
> +From ff1678f02fdf08e8b7cfca4d0d5aa7815b30957c Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Thu, 8 Nov 2018 01:30:53 -0500
> +Subject: [PATCH] setrlimit05: Use another method to get bad address
> +
> +This testcase fails on mips32. The process is killed by SIGBUS which
> +is not as expect.
> +
> +This is because:
> +((void *)-1) is not a legal bad address which causes the process
> +killed by SIGBUG on mips.
> +
> +'tst_get_bad_addr()' returns an address that should works on mips
> +and other arches.
> +
> +Upstream-Status: Accepted [80bed467bc6ab48a6cd88a8ab74ca15d08830cb0]
> +
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> +---
> + testcases/kernel/syscalls/setrlimit/setrlimit05.c | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit05.c b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
> +index 7ea7d62..61ac7c6 100644
> +--- a/testcases/kernel/syscalls/setrlimit/setrlimit05.c
> ++++ b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
> +@@ -26,6 +26,8 @@
> +
> + #include "tst_test.h"
> +
> ++static void *bad_addr;
> ++
> + static void verify_setrlimit(void)
> + {
> + 	int status;
> +@@ -33,7 +35,7 @@ static void verify_setrlimit(void)
> +
> + 	pid = SAFE_FORK();
> + 	if (!pid) {
> +-		TEST(setrlimit(RLIMIT_NOFILE, (void *) -1));
> ++		TEST(setrlimit(RLIMIT_NOFILE, bad_addr));
> + 		if (TEST_RETURN != -1) {
> + 			tst_res(TFAIL, "setrlimit()  succeeded unexpectedly");
> + 			exit(0);
> +@@ -67,7 +69,13 @@ static void verify_setrlimit(void)
> + 	tst_res(TBROK, "child %s", tst_strstatus(status));
> + }
> +
> ++static void setup(void)
> ++{
> ++	bad_addr = tst_get_bad_addr(NULL);
> ++}
> ++
> + static struct tst_test test = {
> + 	.test_all = verify_setrlimit,
> + 	.forks_child = 1,
> ++	.setup = setup,
> + };
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
> index ff85be7..240222e 100644
> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
> @@ -56,6 +56,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>              file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
>              file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
>              file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
> +		   file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
>              "
>   
>   S = "${WORKDIR}/git"


