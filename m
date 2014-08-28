Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE9770E6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 10:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SAXUKl012689; Thu, 28 Aug 2014 11:33:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JCCPlT6jP33T; Thu, 28 Aug 2014 11:33:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SAXR8d012686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 28 Aug 2014 11:33:28 +0100
Message-ID: <1409222009.29296.137.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
Date: Thu, 28 Aug 2014 11:33:29 +0100
In-Reply-To: <1409221034-24748-1-git-send-email-muzaffar_mahmood@mentor.com>
References: <1409221034-24748-1-git-send-email-muzaffar_mahmood@mentor.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemtap: Fixed probe syscall.sendfile failure
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
X-List-Received-Date: Thu, 28 Aug 2014 10:33:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-28 at 15:17 +0500, Muzaffar Mahmood wrote:
> From: Mikhail Durnev <mikhail_durnev@mentor.com>
> 
> Marked __syscall.compat_sendfile as optional
> 
> Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
> Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
> ---

This says what you did but not why. There is nothing at all in the patch
header, no Upstream-Status, no description, no author.

Cheers,

Richard

>  .../systemtap/tapset-linux-sendfile-syscall.patch  |   12 ++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch b/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
> new file mode 100644
> index 0000000..b42ab3c
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap/tapset-linux-sendfile-syscall.patch
> @@ -0,0 +1,12 @@
> +diff -Naur old/tapset/linux/syscalls2.stp new/tapset/linux/syscalls2.stp
> +--- old/tapset/linux/syscalls2.stp	2014-04-21 01:28:41.000000000 -0500
> ++++ new/tapset/linux/syscalls2.stp	2014-04-21 01:38:14.961233914 -0500
> +@@ -1953,7 +1953,7 @@
> + # COMPAT_SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd,
> + #		compat_loff_t __user *, offset, compat_size_t, count)
> + #
> +-probe syscall.sendfile = __syscall.sendfile, __syscall.compat_sendfile
> ++probe syscall.sendfile = __syscall.sendfile, __syscall.compat_sendfile ?
> + {
> + 	name = "sendfile"
> + 	out_fd = __int32($out_fd)
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
> index 717d66f..3e1e80a 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -6,6 +6,7 @@ PV = "2.5+git${SRCPV}"
>  SRC_URI = "git://sourceware.org/git/systemtap.git \
>             file://docproc-build-fix.patch \
>             file://obsolete_automake_macros.patch \
> +           file://tapset-linux-sendfile-syscall.patch \
>            "
>  
>  # systemtap doesn't support mips
> -- 
> 1.7.9.5
> 



