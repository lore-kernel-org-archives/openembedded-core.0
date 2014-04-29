Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB04610CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 03:04:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3T34cJt023643
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Apr 2014 20:04:38 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 28 Apr 2014 20:04:37 -0700
Message-ID: <535F16C3.2090304@windriver.com>
Date: Tue, 29 Apr 2014 11:04:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1398416012.git.hongxu.jia@windriver.com>
	<9f4638c7a81e5ddf79649a7611cb5317df465274.1398416012.git.hongxu.jia@windriver.com>
In-Reply-To: <9f4638c7a81e5ddf79649a7611cb5317df465274.1398416012.git.hongxu.jia@windriver.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 1/1] make: fix invoking makeinfo failed at do_install time
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
X-List-Received-Date: Tue, 29 Apr 2014 03:04:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Tested and Reviewed by Robert Yang <liezhi.yang@windriver.com>

// Robert

On 04/25/2014 04:59 PM, Hongxu Jia wrote:
> Reproduce steps:
> $ bitbake texinfo-native
> $ bitbake make
> $ bitbake make -cdevshell
> In the devshell:
> root:make-3.82# echo "" >> doc/make.texi
> root:make-3.82# ../temp/run.do_install
>
> Failed Log:
> ...
> tmp/work/i586-poky-linux/make/3.81-r1/make-3.81/doc/make.texi:8165: @itemx must follow @item
> ...
>
> Backport from make 4.0 to fix this issue.
>
> [YOCTO #6219]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../doc-make.texi-fix-itemx-must-follow-item.patch | 24 ++++++++++++++++++++++
>   meta/recipes-devtools/make/make.inc                |  1 +
>   2 files changed, 25 insertions(+)
>   create mode 100644 meta/recipes-devtools/make/files/doc-make.texi-fix-itemx-must-follow-item.patch
>
> diff --git a/meta/recipes-devtools/make/files/doc-make.texi-fix-itemx-must-follow-item.patch b/meta/recipes-devtools/make/files/doc-make.texi-fix-itemx-must-follow-item.patch
> new file mode 100644
> index 0000000..fbbff38
> --- /dev/null
> +++ b/meta/recipes-devtools/make/files/doc-make.texi-fix-itemx-must-follow-item.patch
> @@ -0,0 +1,24 @@
> +doc/make.texi: fix @itemx must follow @item
> +
> +Upstream-Status: Backport from make 4.0
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + doc/make.texi | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/doc/make.texi b/doc/make.texi
> +--- a/doc/make.texi
> ++++ b/doc/make.texi
> +@@ -8162,7 +8162,7 @@ from complicated nests of recursive @code{make} commands.
> + rarely need to specify this option since @samp{make} does it for you;
> + see @ref{-w Option, ,The @samp{--print-directory} Option}.)
> +
> +-@itemx --no-print-directory
> ++@item --no-print-directory
> + @cindex @code{--no-print-directory}
> + Disable printing of the working directory under @code{-w}.
> + This option is useful when @code{-w} is turned on automatically,
> +--
> +1.8.1.2
> +
> diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
> index 5de74e4..faf66e1 100644
> --- a/meta/recipes-devtools/make/make.inc
> +++ b/meta/recipes-devtools/make/make.inc
> @@ -6,6 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/make/"
>   SECTION = "devel"
>
>   SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
> +           file://doc-make.texi-fix-itemx-must-follow-item.patch \
>              file://SCCS.patch"
>
>   inherit autotools gettext
>

