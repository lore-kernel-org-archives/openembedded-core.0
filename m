Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 13D2B731EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 03:00:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K30TrN010648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 19:00:29 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 19:00:27 -0800
To: Andre McCurdy <armccurdy@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1453258071-22847-1-git-send-email-armccurdy@gmail.com>
	<1453258071-22847-4-git-send-email-armccurdy@gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <569EF849.6000603@windriver.com>
Date: Wed, 20 Jan 2016 11:00:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1453258071-22847-4-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH v2 3/3] valgrind: avoid neon for targets which don't support it
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
X-List-Received-Date: Wed, 20 Jan 2016 03:00:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月20日 10:47, Andre McCurdy wrote:
> The sh-mem-random.c test app tries to use neon loads and stores to
> test 64-bit float copies when building for ARM. Allow it to do so if
> possible, but fallback to C when building for ARM targets which don't
> support neon.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

it work for me, thank Andre McCurdy


Reported-and-Tested-by: Roy Li <rongqing.li@windriver.com>

-Roy

> ---
>   ...d-neon-for-targets-which-don-t-support-it.patch | 33 ++++++++++++++++++++++
>   meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |  1 +
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
> new file mode 100644
> index 0000000..5fcfec0
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
> @@ -0,0 +1,33 @@
> +From 8facc29c3c56e6cf9cfef70986cf73876044a3fb Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Tue, 19 Jan 2016 16:42:36 -0800
> +Subject: [PATCH] avoid neon for targets which don't support it
> +
> +The sh-mem-random.c test app tries to use neon loads and stores to
> +test 64-bit float copies when building for ARM. Allow it to do so if
> +possible, but fallback to C when building for ARM targets which don't
> +support neon.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + memcheck/tests/sh-mem-random.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/memcheck/tests/sh-mem-random.c b/memcheck/tests/sh-mem-random.c
> +index ae82248..816e139 100644
> +--- a/memcheck/tests/sh-mem-random.c
> ++++ b/memcheck/tests/sh-mem-random.c
> +@@ -191,7 +191,7 @@ void do_test_at ( U1* arr )
> +                "emms"
> +                : : "r"(arr+dst), "r"(arr+src) : "memory"
> +             );
> +-#elif defined(__linux__) && defined(__arm__) && !defined(__aarch64__)
> ++#elif defined(__linux__) && defined(__arm__) && defined(__ARM_NEON__) && !defined(__aarch64__)
> +             /* On arm32, many compilers generate a 64-bit float move
> +                using two 32 bit integer registers, which completely
> +                defeats this test.  Hence force a 64-bit NEON load and
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 4f7c39a..7ef1e48 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -22,6 +22,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>              file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
>              file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
>              file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
> +           file://avoid-neon-for-targets-which-don-t-support-it.patch \
>              "
>
>   SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
>

-- 
Best Reagrds,
Roy | RongQing Li

