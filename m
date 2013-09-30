Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B23E560EAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 14:02:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8UE2SQT005925
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 07:02:28 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 30 Sep 2013 07:02:27 -0700
Message-ID: <52498472.8080204@windriver.com>
Date: Mon, 30 Sep 2013 09:02:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Kai Kang <kai.kang@windriver.com>
References: <cover.1380534395.git.kai.kang@windriver.com>
	<4092f836c8e0d512fa2f0b4378766820a16e4957.1380534395.git.kai.kang@windriver.com>
In-Reply-To: <4092f836c8e0d512fa2f0b4378766820a16e4957.1380534395.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rpm: fix rpm2cpio segmentation fault
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
X-List-Received-Date: Mon, 30 Sep 2013 14:02:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/13 4:48 AM, Kai Kang wrote:
> From: Kang Kai <kai.kang@windriver.com>
>
> When run rpm2cpio, it fails with segmentation fault. The root cause is
> no macros "_db_path" and "_dbi_config*" defined, when query these macros
> get nothing then cause segment fault.
>
> Add patch to parse macro files first to fix this problem.

I talked briefly with the RPM maintainer about this a while back.

I don't think this is the right patch.  Not because what it does is wrong.  (The 
patch itself is actually likely correct in the general case.)  However, the 
proper fix is to simply use the rpm2cpio shell script, and never install the 
binary.  (This does introduce a dependency on 'file', but I don't believe that 
should be a major concern.)

So my suggestion is to rework this fix by:

1) Keep what you have below (why?  because if someone really wants the binary 
it'll prevent the segfault.)

2) Change the recipe's do_install to copy in the rpm2cpio.sh and replace the 
binary version.

3) Ensure that the package that rpm2cpio is in gets a dependency on 'file'.

--Mark

> [YOCTO #3656]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   .../rpm/rpm/rpm2cpio-fix-segmentation-fault.patch  | 28 ++++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  1 +
>   2 files changed, 29 insertions(+)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
> new file mode 100644
> index 0000000..cdf8fb1
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
> @@ -0,0 +1,28 @@
> +Upstream-Status: Pending
> +
> +rpm2cpio fails on target with "Segmentation fault". Because macros
> +"_dbpath" and "_dbi_config*" need to be defined, otherwise query these
> +macros will cause segment fault.
> +
> +Parse config files first to fix this bug. If parse fails, give a warning.
> +
> +[YOCTO #3656]
> +
> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +
> +--- rpm-5.4.9/tools/rpm2cpio.c.orig	2013-04-15 10:35:14.269398890 +0800
> ++++ rpm-5.4.9/tools/rpm2cpio.c	2013-04-15 10:44:12.777417885 +0800
> +@@ -87,6 +87,13 @@
> + #endif
> + 	(void) rpmtsSetVSFlags(ts, vsflags);
> +
> ++	/* If macros "_dbpath" and "_dbi_config*" are not defined,
> ++	 * sigment fault occurs */
> ++	rc = rpmReadConfigFiles(NULL, NULL);
> ++	if (rc) {
> ++		fprintf(stderr, _("Read RPM config files failed that may cause sigment fault.\n"));
> ++	}
> ++
> + 	/*@-mustmod@*/      /* LCL: segfault */
> + 	rc = rpmReadPackageFile(ts, fdi, "rpm2cpio", &h);
> + 	/*@=mustmod@*/
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 3c7e03b..492393e 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -88,6 +88,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
>   	   file://debugedit-segv.patch \
>   	   file://rpm-platform-file-fix.patch \
>   	   file://rpm-lsb-compatibility.patch \
> +	   file://rpm2cpio-fix-segmentation-fault.patch \
>   	  "
>
>   # Uncomment the following line to enable platform score debugging
>


