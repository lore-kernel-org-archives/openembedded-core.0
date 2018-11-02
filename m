Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC2579FD8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 17:38:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA2Hcrdr003188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Nov 2018 10:38:53 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 2 Nov 2018 10:38:49 -0700
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1541052997-30487-1-git-send-email-changqing.li@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <1a9a69d0-9934-07d8-0aa7-0b6d18714845@windriver.com>
Date: Fri, 2 Nov 2018 13:38:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541052997-30487-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH V2] dbus: fix ptest failure
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
X-List-Received-Date: Fri, 02 Nov 2018 17:38:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/1/18 2:16 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> 1. since one bug in run-ptest, testcase test-bus have never been
> actually run (althrough it's result is PASS) until oe-core
> commit 0828850 "dbus-test_1.12.2: various fixes" fixed it.
> After commit 0828850, test-bus can actually run, but failed,

Is the name really test-bus or is it test-dbus ?
Fix it below as well if this is a typo.

> install test-service/test-shell-service/test-segfault/
> dbus-daemon-launch-helper-test(need --enable-embedded-tests to
> generate it) to fix it, since test-bus need these binaries.

The grammar in that last sentence is a bit hard to parse.
How about:

After commit 0828850 test-bus can actually run but it
did not install:
   test-service, test-shell-service, test-segfault, and
   dbus-daemon-launch-helper-test
Add the configure flag:
   --enable-embedded-tests
to generate these binaries, then install them so that
test-bus will now pass.

> 
> 2. fix testcase test-dbus-daemon failed
> we enable --enable-verbose-mode in recipe dbus-test, and don't
> enable it in recipe dbus. This will below test code get unexpect
> result of have_verbose and assert. remove --enable-verbose-mode
> of recipe dbus-test to fix it.

Could you add PACKAGECONFIG[developer-mode] to enable-verbose-mode ?
That would be useful when debugging.

> 
>   #ifdef DBUS_ENABLE_STATS
>    g_assert_true (have_stats);
>   #else
>    g_assert_false (have_stats);
>   #endif
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-core/dbus/dbus-test_1.12.10.bb | 11 ++++++++---
>   meta/recipes-core/dbus/dbus/run-ptest       | 16 ++++++++++++----
>   2 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> index 25b9395..ce54628 100644
> --- a/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> +++ b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> @@ -33,13 +33,13 @@ EXTRA_OECONF = "--enable-tests \
>                   --enable-installed-tests \
>                   --enable-checks \
>                   --enable-asserts \
> -                --enable-verbose-mode \
>                   --enable-largefile \
>                   --disable-xml-docs \
>                   --disable-doxygen-docs \
>                   --disable-libaudit \
>                   --with-dbus-test-dir=${PTEST_PATH} \
> -                ${EXTRA_OECONF_X}"
> +                ${EXTRA_OECONF_X} \
> +                --enable-embedded-tests"

Build machines and scripts that parse this recipe won't care that
you have stuck the option at the end of the list but I hear that
humans like order and symmetry :) so please move it up to the end
of the list of '--enable' options.

Thanks,
../Randy


>   
>   EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
>   
> @@ -58,9 +58,14 @@ do_install() {
>   do_install_ptest() {
>   	install -d ${D}${PTEST_PATH}/test
>   	l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay \
> -	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass "
> +	   variant uid-permissions syntax spawn sd-activation names monitor message fdpass service shell-service"
>   	for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
>   
> +	install -d ${D}${PTEST_PATH}/bus
> +	install ${B}/bus/.libs/dbus-daemon-launch-helper-test ${D}${PTEST_PATH}/bus
> +
> +	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
> +
>   	l="bus bus-system bus-launch-helper"
>   	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
>   
> diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
> index 353ba1e..e7e1c1e 100755
> --- a/meta/recipes-core/dbus/dbus/run-ptest
> +++ b/meta/recipes-core/dbus/dbus/run-ptest
> @@ -17,8 +17,16 @@ export LD_LIBRARY_PATH=@PTEST_PATH@/test/.libs
>   files=`ls test/test-*`
>   
>   for i in $files
> -	do
> -		./$i ./test/data >/dev/null
> -		output
> -	done
> +do
> +     #these programs are used by testcase test-bus, don't run here
> +     if [ $i = "test/test-service" ] \
> +        || [ $i = "test/test-shell-service" ] \
> +        || [ $i = "test/test-segfault" ]
> +     then
> +         continue
> +     fi
> +
> +     ./$i ./test/data >/dev/null 2>&1
> +     output
> +done
>   
> 


-- 
# Randy MacLeod
# Wind River Linux

