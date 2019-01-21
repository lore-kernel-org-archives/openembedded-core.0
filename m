Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2196C606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 07:48:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0L7liZv022842
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jan 2019 23:47:55 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 20 Jan 2019 23:47:34 -0800
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <e28bcecd-2cc1-28b4-1c47-e9b86ed52bf3@windriver.com>
Date: Mon, 21 Jan 2019 15:47:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH V3] dbus: fix ptest failure
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
X-List-Received-Date: Mon, 21 Jan 2019 07:48:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi, Richard

Could you help to review this patch? Thanks.

On 11/5/18 11:28 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. since one bug in run-ptest, testcase test-bus have never been
> actually run (althrough it's result is PASS).
>
> After commit 0828850, test-bus can actually run but it
> did not install:
>    test-service, test-shell-service, test-segfault, and
>    dbus-daemon-launch-helper-test
> Add the configure flag:
>    --enable-embedded-tests
> to generate binary dbus-daemon-launch-helper-test, then install
> them so that test-bus will now pass.
>
> 2. fix testcase test-dbus-daemon failed
> we enable --enable-verbose-mode in recipe dbus-test, and don't
> enable it in recipe dbus. This will make below test code get
> unexpect result of have_verbose and assert.
> disable --enable-verbose-mode for recipe dbus-test to fix it.
>
>   #ifdef DBUS_ENABLE_STATS
>    g_assert_true (have_stats);
>   #else
>    g_assert_false (have_stats);
>   #endif
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-core/dbus/dbus-test_1.12.10.bb | 12 +++++++++---
>   meta/recipes-core/dbus/dbus/run-ptest       | 16 ++++++++++++----
>   2 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
> index 25b9395..ec9b9e2 100644
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
>   
>   EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
>   
> @@ -50,6 +50,7 @@ PACKAGECONFIG_class-nativesdk = ""
>   PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
>   PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
>   PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> +PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
>   
>   do_install() {
>       :
> @@ -58,9 +59,14 @@ do_install() {
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

-- 
BRs

Sandy(Li Changqing)


