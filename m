Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UB4pE-0001eS-6S
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 15:51:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1SEYnQp009235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 06:34:49 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Thu, 28 Feb 2013 06:34:49 -0800
Message-ID: <512F6B04.8010102@windriver.com>
Date: Thu, 28 Feb 2013 08:34:44 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1362035905.git.kai.kang@windriver.com>
	<c100eba8e21c76e85e5250020c0b1d68c96e02d9.1362035905.git.kai.kang@windriver.com>
In-Reply-To: <c100eba8e21c76e85e5250020c0b1d68c96e02d9.1362035905.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/1] rpm: fix rpm2cpio segmentation fault
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
X-List-Received-Date: Thu, 28 Feb 2013 14:51:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/13 1:34 AM, Kang Kai wrote:
> When run rpm2cpio, it fails with segmentation fault. The root cause is
> no macro "_db_path" defined, when query its value get nothing then
> cause segment fault.
>
> Add patch to parse macro files first to fix this problem.
>
> [YOCTO #3656]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   .../rpm/rpm/rpm2cpio-fix-segmentation-fault.patch  |   24 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
>   2 files changed, 26 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
> new file mode 100644
> index 0000000..b43a64e
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
> @@ -0,0 +1,24 @@
> +Upstream-Status: Pending
> +
> +rpm2cpio fails on target with "Segmentation fault". Because no "_dbpath"
> +defined, when query it will cause seg fault.
> +Parse macro files first to fix this bug.
> +
> +[YOCTO #3656]
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +
> +--- rpm-5.4.9/tools/rpm2cpio.c.orig	2013-02-28 13:14:12.453540767 +0800
> ++++ rpm-5.4.9/tools/rpm2cpio.c	2013-02-28 15:09:41.685785192 +0800
> +@@ -88,6 +88,11 @@ int main(int argc, char **argv)
> + 	(void) rpmtsSetVSFlags(ts, vsflags);
> +
> + 	/*@-mustmod@*/      /* LCL: segfault */
> ++	rc = rpmReadConfigFiles(NULL, NULL);
> ++	if (rc) {
> ++		fprintf(stderr, _("read RPM config files failed\n"));
> ++		exit(EXIT_FAILURE);
> ++	}
> + 	rc = rpmReadPackageFile(ts, fdi, "rpm2cpio", &h);
> + 	/*@=mustmod@*/
> +

In the RPM2CPIO case, I'm not sure that we want to exit here.  It's certainly 
reasonable for the config files to be unavailable to us.

If the problem is that _dbpath is undefined (and it's needed for some reason), 
my suggestion is that "some value" be defined, even if it's to a non-existent 
location.  It's be even better if we could simply avoid using the _dbpath at all 
in the rpm2cpio code.

(Note, to folks reading this.  Normally in oe-core, if we use rpm2cpio, we're 
actually using a shell script version which does not have this problem.  The 
rpm2cpio -binary- is used by people on the target or sometimes via the SDK to 
extract SRPM or RPM packages...)

> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 39b0481..fcfbde8 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>   DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
> -PR = "r61"
> +PR = "r62"
>
>   # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
>   # in order to extract the distribution SRPM into a format we can extract...
> @@ -85,6 +85,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>   	   file://rpm-reloc-macros.patch \
>   	   file://rpm-platform2.patch \
>        file://rpm-remove-sykcparse-decl.patch \
> +	   file://rpm2cpio-fix-segmentation-fault.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>



