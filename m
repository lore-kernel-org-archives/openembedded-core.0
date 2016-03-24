Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 556D0601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 09:23:51 +0000 (UTC)
Received: from [IPv6:fda8:8b75:6fa6:1000:31c0:4816:a1c6:a1f9] (192.168.15.34)
	by smtp.enea.com (172.21.1.209) with Microsoft SMTP Server id
	14.3.266.1; Thu, 24 Mar 2016 10:23:43 +0100
To: Dengke Du <dengke.du@windriver.com>
References: <cover.1458731173.git.dengke.du@windriver.com>
	<ecd80b5ad2eb73b3c5615d3b8985c30c7d088bd6.1458731173.git.dengke.du@windriver.com>
From: Tudor Florea <tudor.florea@enea.com>
Message-ID: <56F3B211.7000904@enea.com>
Date: Thu, 24 Mar 2016 11:23:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <ecd80b5ad2eb73b3c5615d3b8985c30c7d088bd6.1458731173.git.dengke.du@windriver.com>
X-Originating-IP: [192.168.15.34]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pTest-quilt: pTest-quilt failed fixed
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
X-List-Received-Date: Thu, 24 Mar 2016 09:23:55 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

A few comments:

1. (Editorial) Please use the appropriate package name and description
of the fix in the commit message:
e.g.: "quilt: run ptest as normal user" or similar

2. I would avoid using the user "test" in this context. "test" user
might be a legitimate one in some actual deployment and could interfere
this this one.

3. I'd avoid having the user persistent on rootfs (created on
post-install script) Instead I would create a regular user at the
beginning of test and removing it at the end. You may take a look on
libpam recipe tests.

Regards,
 Tudor.

On 23/03/2016 13:14, Dengke Du wrote:
> When run the pTest-quilt, the faildiff.test failed, because the user
> is root. The faildiff.test had the following:
> 	$ chmod -r test.txt
> 	$ quilt refresh
> Then we drop the read permission of the file test.txt, we can't
> "quilt refresh" as normal user, so we got the following:
> 	>~ .*diff: test\.txt: Permission denied
> 	> Diff failed on file 'test.txt', aborting
> But when the user is root, we can access the file, so we get the
> following:
> 	> Nothing in patch patchs/test.dfff
> So I add a user who named "test" to run the pTest, when we run the
> run-ptest script. In this way, we should add the user at the begining.
> Add the useradd inherit to the meta/recipes-devtools/quilt/quilt.inc
> and set the USERADD_PACKAGES and USERADD_PARAM_${PN}-ptest variable
> respectively.
> In the end, change the authority of the directory of test which collect
> all the test case under the directory /usr/lib/quilt/ptest/ on the
> target to 777. Because the test case would write this directory, if
> the user is test user, it can't write this directory.
> 
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/recipes-devtools/quilt/quilt.inc       | 9 +++++++--
>  meta/recipes-devtools/quilt/quilt/run-ptest | 3 ++-
>  meta/recipes-devtools/quilt/quilt/test.sh   | 1 +
>  3 files changed, 10 insertions(+), 3 deletions(-)
>  create mode 100755 meta/recipes-devtools/quilt/quilt/test.sh
> 
> diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
> index 837b36b..65d40cc 100644
> --- a/meta/recipes-devtools/quilt/quilt.inc
> +++ b/meta/recipes-devtools/quilt/quilt.inc
> @@ -8,12 +8,13 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
>          file://install.patch \
>          file://run-ptest \
>          file://Makefile \
> +        file://test.sh \
>  "
>  
>  SRC_URI[md5sum] = "fc0310db5868a0873d602d4332a76d43"
>  SRC_URI[sha256sum] = "c4bfd3282214a288e8d3e921ae4d52e73e24c4fead72b5446752adee99a7affd"
>  
> -inherit autotools-brokensep ptest
> +inherit autotools-brokensep ptest useradd
>  
>  EXTRA_OECONF_darwin += "--without-date \
>                          --without-getopt \
> @@ -35,6 +36,9 @@ EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
>  
>  CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
>  
> +USERADD_PACKAGES = "${PN}-ptest"
> +USERADD_PARAM_${PN}-ptest = "--create-home --user-group test"
> +
>  # quilt ignores DESTDIR
>  do_install () {
>  	oe_runmake ${EXTRA_OE_MAKE_ARGS} install
> @@ -50,8 +54,9 @@ do_install_ptest() {
>  	tar -cf - bin/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
>  	tar -cf - compat/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
>  	tar -cf - quilt/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
> -	tar -cf - test/ --exclude mail.test --exclude delete.test | ( cd ${D}${PTEST_PATH} && tar -xf - )
> +	tar -cf - test/ --exclude mail.test --exclude delete.test | ( cd ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
>  	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
> +	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
>  }
>  
>  RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
> diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-devtools/quilt/quilt/run-ptest
> index 958a9df..14430a2 100755
> --- a/meta/recipes-devtools/quilt/quilt/run-ptest
> +++ b/meta/recipes-devtools/quilt/quilt/run-ptest
> @@ -1,5 +1,6 @@
>  #!/bin/sh
>  
> +THIS_SH=/bin/sh
>  ln -sf /bin/ed /usr/bin/ed
> -for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
> +su -c "${THIS_SH} ./test.sh" test
>  rm -f /usr/bin/ed
> diff --git a/meta/recipes-devtools/quilt/quilt/test.sh b/meta/recipes-devtools/quilt/quilt/test.sh
> new file mode 100755
> index 0000000..6563e4a
> --- /dev/null
> +++ b/meta/recipes-devtools/quilt/quilt/test.sh
> @@ -0,0 +1 @@
> +for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
> 

