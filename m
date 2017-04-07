Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCE736FF7F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 22:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v37Mbpro007957; 
	Fri, 7 Apr 2017 23:37:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FW16dTGOsHZv; Fri,  7 Apr 2017 23:37:51 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v37MVmwl007794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 23:31:49 +0100
Message-ID: <1491604308.17200.106.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Date: Fri, 07 Apr 2017 23:31:48 +0100
In-Reply-To: <20170407215501.31916-1-marex@denx.de>
References: <20170407215501.31916-1-marex@denx.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] lsb: Remove bashisms from the rc.d functions
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
X-List-Received-Date: Fri, 07 Apr 2017 22:37:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-04-07 at 23:55 +0200, Marek Vasut wrote:
> This bashism prevents functions from working on systems without bash,
> ie. on systems with busybox shell or debian dash. Replace them with
> bourne-compatible command instead.

Note that you'd code adds in a couple of forks for code which currently
doesn't need separate process execution. Its therefore not a clear cut
win. Is there no way to do it without the forks in dash?

Cheers,

Richard

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../0002-rc.d-Remove-bashism-from-functions.patch  | 48
> ++++++++++++++++++++++
>  meta/recipes-extended/lsb/lsbinitscripts_9.68.bb   |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0002-
> rc.d-Remove-bashism-from-functions.patch
> 
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-
> Remove-bashism-from-functions.patch b/meta/recipes-
> extended/lsb/lsbinitscripts/0002-rc.d-Remove-bashism-from-
> functions.patch
> new file mode 100644
> index 0000000000..44eed1cc18
> --- /dev/null
> +++ b/meta/recipes-extended/lsb/lsbinitscripts/0002-rc.d-Remove-
> bashism-from-functions.patch
> @@ -0,0 +1,48 @@
> +From b7601dcd4663a9cb936a6d2d224665bea69fcc50 Mon Sep 17 00:00:00
> 2001
> +From: Marek Vasut <marex@denx.de>
> +Date: Thu, 6 Apr 2017 19:15:56 +0200
> +Subject: [PATCH] rc.d: Remove bashism from functions
> +
> +This bashism prevents functions from working on systems without
> bash,
> +ie. on systems with busybox shell or debian dash. Replace them with
> +bourne-compatible command instead.
> +
> +Signed-off-by: Marek Vasut <marex@denx.de>
> +---
> + rc.d/init.d/functions | 9 ++-------
> + 1 file changed, 2 insertions(+), 7 deletions(-)
> +
> +diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
> +index 746b37d..3ba21ef 100644
> +--- a/rc.d/init.d/functions
> ++++ b/rc.d/init.d/functions
> +@@ -115,15 +115,11 @@ __kill_pids_term_kill_checkpids() {
> +     local pid=
> +     local pids=$*
> +     local remaining=
> +-    local stat=
> +     local stime=
> + 
> +     for pid in $pids ; do
> +         [ ! -e  "/proc/$pid" ] && continue
> +-        read -r line < "/proc/$pid/stat" 2> /dev/null
> +-
> +-        stat=($line)
> +-        stime=${stat[21]}
> ++        stime=`cut -d " " -f 22 < /proc/self/stat`
> + 
> +         [ -n "$stime" ] && [ "$base_stime" -lt "$stime" ] &&
> continue
> +         remaining+="$pid "
> +@@ -139,8 +135,7 @@ __kill_pids_term_kill() {
> +     local try=0
> +     local delay=3;
> +     local pid=
> +-    local stat=($(< /proc/self/stat))
> +-    local base_stime=${stat[21]}
> ++    local base_stime=`cut -d " " -f 22 < /proc/self/stat`
> + 
> +     if [ "$1" = "-d" ]; then
> +         delay=$2
> +-- 
> +2.11.0
> +
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
> b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
> index 0c08fffcef..9ba0e01776 100644
> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
> @@ -11,6 +11,7 @@ S="${WORKDIR}/initscripts-${PV}"
>  SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/inits
> cripts-${PV}.tar.bz2/6a51a5af38e01445f53989ed0727c3e1/initscripts-
> ${PV}.tar.bz2 \
>             file://functions.patch \
>             file://0001-functions-avoid-exit-1-which-causes-init-
> scripts-to-.patch \
> +	   file://0002-rc.d-Remove-bashism-from-functions.patch \
>            " 
>  
>  SRC_URI[md5sum] = "6a51a5af38e01445f53989ed0727c3e1"

