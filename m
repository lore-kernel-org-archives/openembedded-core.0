Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id DD589719B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A224F20AF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:16:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id bDrZ9-uFGLLs
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:16:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8972220862
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:16:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 159FA16231A; Thu,  5 Jan 2017 14:16:52 -0500 (EST)
Date: Thu, 5 Jan 2017 14:16:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170105191652.GN30576@denix.org>
References: <1482437940-4194-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1482437940-4194-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [morty][PATCH] systemtap: remove explicit msgfmt check
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
X-List-Received-Date: Thu, 05 Jan 2017 19:16:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

On Thu, Dec 22, 2016 at 03:19:00PM -0500, Denys Dmytriyenko wrote:
> From: Ross Burton <ross.burton@intel.com>
> 
> Passing --disable-nls should be enough to disable the requirement for a full
> gettext to be present, but the upstream configure explicitly checks for msgfmt
> even if it isn't going to be used.  To avoid having to depend on gettext-native,
> patch this check out.
> 
> (From OE-Core rev: 2f8d2a74f73490c1ae35131d3eb3592f7ee0a1e4)
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../systemtap/systemtap/no-msgfmt-check.patch             | 15 +++++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.inc           |  1 +
>  2 files changed, 16 insertions(+)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch b/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
> new file mode 100644
> index 0000000..471e62c
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
> @@ -0,0 +1,15 @@
> +There is no need to explicitly check that msgfmt was found as the gettext macros
> +handle this for us if NLS is enabled.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +diff --git a/configure.ac b/configure.ac
> +index e56079a..284bbe0 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -39,4 +38,0 @@ AM_GNU_GETTEXT_VERSION([0.19.4])
> +-if test "x$GMSGFMT" = "x:"; then
> +-   AC_MSG_ERROR([missing gnu /usr/bin/msgfmt])
> +-fi
> +-
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 304eb99..34cf227 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -9,6 +9,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>             file://configure-allow-to-disable-libvirt.patch \
>             file://x32_abi_time.patch \
>             file://monitor-option.patch \
> +           file://no-msgfmt-check.patch \
>            "
>  
>  # systemtap doesn't support mips
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

