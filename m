Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2E76E9AC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 11:42:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s11BgQMl023765; Sat, 1 Feb 2014 11:42:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pfWKcI65N66Y; Sat,  1 Feb 2014 11:42:26 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s11BgMMt023761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sat, 1 Feb 2014 11:42:24 GMT
Message-ID: <1391254936.28575.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Sat, 01 Feb 2014 11:42:16 +0000
In-Reply-To: <31bde1f3800810ad5898b52ab8b59e6b8502a180.1390722297.git.Chong.Lu@windriver.com>
References: <cover.1390722297.git.Chong.Lu@windriver.com>
	<31bde1f3800810ad5898b52ab8b59e6b8502a180.1390722297.git.Chong.Lu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "saul.wold" <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/1] acl: enable ptest support
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
X-List-Received-Date: Sat, 01 Feb 2014 11:42:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-01-26 at 15:50 +0800, Chong Lu wrote:
> Install acl test suite and run it as ptest.
> nfs test cases need depend on nfs service. So exclude them order to
> make ptest all pass.
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-support/attr/acl.inc       | 14 +++++++++++++-
>  meta/recipes-support/attr/acl/run-ptest |  7 +++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/attr/acl/run-ptest
> 
> diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
> index a461232..04967a6 100644
> --- a/meta/recipes-support/attr/acl.inc
> +++ b/meta/recipes-support/attr/acl.inc
> @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
>                      file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
>  
>  DEPENDS = "attr"
> -SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz"
> +SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
> +           file://run-ptest \
> +"
>  
>  require ea-acl.inc
>  
> @@ -24,3 +26,13 @@ do_install_append() {
>  	sed -i ${D}${libdir}/libacl.la -e \
>  	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
>  }
> +
> +inherit ptest
> +
> +do_install_ptest() {
> +	tar -cf - test/ --exclude nfs | ( cd ${D}${PTEST_PATH} && tar -xf - )
> +	mkdir ${D}${PTEST_PATH}/include
> +	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
> +}
> +
> +RDEPENDS_${PN}-ptest = "bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"

This set of dependencies is proving problematic. Firstly it is going to
increase build times as perl gets pulled in. coreutils also pulls in gmp
which doesn't appear to build on x32.

This patch is therefore why we keep seeing MUT builds of nightly-x32
fail.

http://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/9/steps/BuildImages/logs/stdio

No doubt we need to fix this, however it does also show how convoluted
our dependency chains are and how a small change like this, raises other
issues elsewhere.

I opened a bug about the gmp issue:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5783

Cheers,

Richard



