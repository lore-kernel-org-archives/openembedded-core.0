Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D20576A43A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 17:27:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2013 10:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,722,1363158000"; d="scan'208";a="341520112"
Received: from unknown (HELO [10.255.12.171]) ([10.255.12.171])
	by orsmga002.jf.intel.com with ESMTP; 22 May 2013 10:27:37 -0700
Message-ID: <519D0009.1090605@linux.intel.com>
Date: Wed, 22 May 2013 10:27:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1369199443-3441-1-git-send-email-net147@gmail.com>
In-Reply-To: <1369199443-3441-1-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: backport sulogin empty root password fix
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
X-List-Received-Date: Wed, 22 May 2013 17:27:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2013 10:10 PM, Jonathan Liu wrote:
> This allows system maintenance login if the root password is empty.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   .../busybox-sulogin-empty-root-password.patch      | 58 ++++++++++++++++++++++
>   meta/recipes-core/busybox/busybox_1.20.2.bb        |  3 +-
>   2 files changed, 60 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch
>
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch
> new file mode 100644
> index 0000000..baad298
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch
> @@ -0,0 +1,58 @@
> +Upstream-Status: Backport
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +From b6dc13c2d3754704b1bf5af4e6b957b48585102f Mon Sep 17 00:00:00 2001
> +From: Jonathan Liu <net147@gmail.com>
> +Date: Tue, 21 May 2013 17:01:55 +0200
> +Subject: [PATCH] sulogin: allow system maintenance login if root password is
> + empty
> +
> +The current password checking is unable to distinguish between the user
> +entering an empty password or pressing Control-D. As a result, an empty
> +password always results in normal startup.
> +
> +We modify bb_ask to return NULL if Control-D is pressed without entering
> +a password. The sulogin applet is then modified to only proceed to
> +normal startup if bb_ask returns NULL. This covers EOF with no password,
> +interrupt by timeout and ^C.
> +
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +---
> + libbb/bb_askpass.c   | 4 +++-
> + loginutils/sulogin.c | 4 ++--
> + 2 files changed, 5 insertions(+), 3 deletions(-)
> +
> +diff --git a/libbb/bb_askpass.c b/libbb/bb_askpass.c
> +index fe2b506..77c1bcd 100644
> +--- a/libbb/bb_askpass.c
> ++++ b/libbb/bb_askpass.c
> +@@ -65,7 +65,9 @@ char* FAST_FUNC bb_ask(const int fd, int timeout, const char *prompt)
> + 	i = 0;
> + 	while (1) {
> + 		int r = read(fd, &ret[i], 1);
> +-		if (r < 0) {
> ++		if ((i == 0 && r == 0) /* EOF (^D) with no password */
> ++		 || r < 0
> ++		) {
> + 			/* read is interrupted by timeout or ^C */
> + 			ret = NULL;
> + 			break;
> +diff --git a/loginutils/sulogin.c b/loginutils/sulogin.c
> +index f79802a..65e6384 100644
> +--- a/loginutils/sulogin.c
> ++++ b/loginutils/sulogin.c
> +@@ -83,8 +83,8 @@ int sulogin_main(int argc UNUSED_PARAM, char **argv)
> + 		cp = bb_ask(STDIN_FILENO, timeout,
> + 				"Give root password for system maintenance\n"
> + 				"(or type Control-D for normal startup):");
> +-
> +-		if (!cp || !*cp) {
> ++		if (!cp) {
> ++			/* ^D, ^C, timeout, or read error */
> + 			bb_info_msg("Normal startup");
> + 			return 0;
> + 		}
> +--
> +1.8.2.3
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
> index 1445a5e..91510d6 100644
> --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR = "r7"
> +PR = "r8"
>
You don't need to do PR bumps anymore.

Otherwise this looks good.

Sau!

>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://B921600.patch \
> @@ -33,6 +33,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://testsuite-du-du-k-works-fix-false-positive.patch \
>              file://strict-atime.patch \
>              file://fail_on_no_media.patch \
> +           file://busybox-sulogin-empty-root-password.patch \
>              file://inetd.conf \
>              file://inetd"
>
>

