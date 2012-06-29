Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SkQaS-0004Qg-QL
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 04:05:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5T1sa5Z018391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 18:54:36 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Jun 2012 18:54:35 -0700
Message-ID: <4FED0AD9.5010102@windriver.com>
Date: Fri, 29 Jun 2012 09:54:33 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340773014.git.liezhi.yang@windriver.com>
	<63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
In-Reply-To: <63976f811fe5cb0c5688fe6847975499ac2d9e51.1340773014.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] icu 3.6: do_install failed: Segmentation fault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 02:05:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/27/2012 04:19 PM, Robert Yang wrote:
> There is a "Segmentation fault" error when the tmpdir is longer than 470
> (or less), this is because it used "char cmd[1024]" which is not enough
> for the command line. Allocate a larger memory size should fix this problem.
>
> [YOCTO #2664]
>
> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> ---
>   .../icu/files/larger-cmd-size.patch                |   27 ++++++++++++++++++++
>   meta/recipes-support/icu/icu-3.6.inc               |    1 +
>   meta/recipes-support/icu/icu_3.6.bb                |    2 +-
>   3 files changed, 29 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch
>
> diff --git a/meta/recipes-support/icu/files/larger-cmd-size.patch b/meta/recipes-support/icu/files/larger-cmd-size.patch
> new file mode 100644
> index 0000000..4b5f73d
> --- /dev/null
> +++ b/meta/recipes-support/icu/files/larger-cmd-size.patch
> @@ -0,0 +1,27 @@
> +Allocate a larger memory size for cmd
> +
> +The length of the command line can be longer than 1024 sometimes,
> +which will cause a "Segmentation fault" error.
> +
> +Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> +
> +Upstream-Status: Pending
> +---
> + tools/pkgdata/pkgdata.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tools/pkgdata/pkgdata.c b/tools/pkgdata/pkgdata.c
> +--- a/tools/pkgdata/pkgdata.c
> ++++ b/tools/pkgdata/pkgdata.c
> +@@ -439,7 +439,7 @@ main(int argc, char* argv[]) {
> + /* POSIX - execute makefile */
> + static int executeMakefile(const UPKGOptions *o)
> + {
> +-    char cmd[1024];
> ++    char cmd[BUFSIZ];

I've changed the cmd[BUFSIZ] to cmd[2048], which should be enough for us, and
pushed it to the git repo again:

   git://git.pokylinux.org/poky-contrib robert/icu
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/icu

// Robert

> +     /*char pwd[1024];*/
> +     const char *make;
> +     int rc;
> +--
> +1.7.10.2
> +
> diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
> index d3391fe..d969caa 100644
> --- a/meta/recipes-support/icu/icu-3.6.inc
> +++ b/meta/recipes-support/icu/icu-3.6.inc
> @@ -6,6 +6,7 @@ BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-
>              file://gccfix.patch \
>              file://fix-parallel-build.patch \
>              file://use-g++-for-linking.patch \
> +           file://larger-cmd-size.patch \
>              "
>   SRC_URI = "${BASE_SRC_URI} \
>              file://noldlibpath.patch \
> diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/icu/icu_3.6.bb
> index d7be522..f941acf 100644
> --- a/meta/recipes-support/icu/icu_3.6.bb
> +++ b/meta/recipes-support/icu/icu_3.6.bb
> @@ -1,6 +1,6 @@
>   require icu-3.6.inc
>
> -PR = "r8"
> +PR = "r9"
>
>   SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
>   SRC_URI[sha256sum] = "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"


