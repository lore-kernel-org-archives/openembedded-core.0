Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 966B0601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 01:47:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M1lRqU028856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Feb 2017 17:47:27 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 17:47:26 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1487700646-25006-1-git-send-email-ross.burton@intel.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <536fd0b9-ca05-2667-d2d7-efb72bbefd20@windriver.com>
Date: Wed, 22 Feb 2017 09:47:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1487700646-25006-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Wed, 22 Feb 2017 01:47:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

It is fine to me

//Hongxu

On 2017年02月22日 02:10, Ross Burton wrote:
> From: Hongxu Jia <hongxu.jia@windriver.com>
>
> Add a patch to fix the CC/CFLAGS mangling that broke builds. [RB]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../recipes-core/ncurses/files/fix-cflags-mangle.patch | 18 ++++++++++++++++++
>   ...ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |  3 ++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
>   rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (73%)
>
> diff --git a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
> new file mode 100644
> index 0000000..e9447c5
> --- /dev/null
> +++ b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
> @@ -0,0 +1,18 @@
> +configure has a piece of logic to detect users "abusing" CC to hold compiler
> +flags (which we do).  It also has logic to "correct" this by moving the flags
> +from CC to CFLAGS, but the sed only handles a single argument in CC.
> +
> +Replace the sed with awk to filter out all words that start with a hyphen.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/configure b/configure
> +index 7f31208..1a29cfc 100755
> +--- a/configure
> ++++ b/configure
> +@@ -2191,2 +2191,2 @@ echo "$as_me: WARNING: your environment misuses the CC variable to hold CFLAGS/C
> +-	cf_flags=`echo "$CC" | sed -e 's/^.*[ 	]\(-[^ 	]\)/\1/'`
> +-	CC=`echo "$CC " | sed -e 's/[ 	]-[^ 	].*$//' -e 's/[ 	]*$//'`
> ++	cf_flags=`echo "$CC" | awk  'BEGIN{ORS=" ";RS=" "} /^-.+/ {print $1}'`
> ++	CC=`echo "$CC " | awk  'BEGIN{ORS=" ";RS=" "} /^[^-].+/ {print $1}'`
> diff --git a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> similarity index 73%
> rename from meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
> rename to meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> index 6514613..e95741f 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.0+20160625.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.0+20161126.bb
> @@ -1,10 +1,11 @@
>   require ncurses.inc
>   
>   SRC_URI += "file://tic-hang.patch \
> +            file://fix-cflags-mangle.patch \
>               file://config.cache \
>   "
>   # commit id corresponds to the revision in package version
> -SRCREV = "63dd558cb8e888d6fab5f00bbf7842736a2356b9"
> +SRCREV = "3db0bd19cb50e3d9b4f2cf15b7a102fe11302068"
>   S = "${WORKDIR}/git"
>   EXTRA_OECONF += "--with-abi-version=5"
>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"



