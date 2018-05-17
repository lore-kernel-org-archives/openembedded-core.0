Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 May 2018 11:49:10 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9C595745AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 11:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 28D2331C559C;
	Thu, 17 May 2018 13:39:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zSA0nd6OuZta; Thu, 17 May 2018 13:39:21 +0200 (CEST)
Received: from t460p (p4FE9AC32.dip0.t-ipconnect.de [79.233.172.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2057831C55C5;
	Thu, 17 May 2018 13:39:17 +0200 (CEST)
Date: Thu, 17 May 2018 13:39:16 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20180517133916.0c6b0a9c@t460p>
In-Reply-To: <20180517085704.28799-1-ricardo.ribalda@gmail.com>
References: <20180517085704.28799-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Cc: anibal.limon@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] apt: Port apt-file to busybox readlink
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
X-List-Received-Date: Thu, 17 May 2018 11:49:10 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Dear Ricardo,

On Thu, 17 May 2018 10:57:04 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> Redlink from busybox and coreutils behave differently on missing files.
> This leads to apt-key miss-behaving and also segure apt-get

wouldn't it be more appropriate to improve the behavior of busybox?

Best regards,
Andreas


> 
> root@qt5122:~# apt-key exportall
> touch: : No such file or directory
> 
> W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://release.qtec.com:5022/qtec/europa/deb/qt5122 ./ Release: At least one invalid signature was encountered.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v2: Add missing signed-off-by
> 
>  meta/recipes-devtools/apt/apt.inc             |  1 +
>  ...t-Fix-apt-file-with-busybox-readlink.patch | 41 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
> 
> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
> index f1cde3068d..995bfc45ee 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -13,6 +13,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.
>             file://disable-test.patch \
>             file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
>             file://0001-apt-1.2.12-Fix-musl-build.patch \
> +           file://0001-apt-Fix-apt-file-with-busybox-readlink.patch \
>             "
>  SRC_URI[md5sum] = "ce8f9ab11f4fd0a08ec73eaffd75c8f0"
>  SRC_URI[sha256sum] = "fa1311a9ce00e72379a0a3bc6d240ba30c0968cfbbb3472859e50b99e24e9598"
> diff --git a/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch b/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
> new file mode 100644
> index 0000000000..684e3b1626
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt/0001-apt-Fix-apt-file-with-busybox-readlink.patch
> @@ -0,0 +1,41 @@
> +From 3e0804f7882088186f47ff3c3c9e60998a1d93a0 Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Thu, 17 May 2018 10:42:44 +0200
> +Subject: [PATCH] apt: Fix apt-file with busybox readlink
> +
> +Busybox readlink behaves diferently that coreutils readlink:
> +
> +root@qt5122:~# touch /tmp/this_file_exist
> +root@qt5122:~# busybox readlink -f /tmp/this_file_exist
> +/tmp/this_file_exist
> +root@qt5122:~# readlink -f /tmp/this_file_exist
> +/tmp/this_file_exist
> +
> +root@qt5122:~# readlink -f /tmp/this_file_does_not_exist
> +/tmp/this_file_does_not_exist
> +root@qt5122:~# busybox readlink -f /tmp/this_file_does_not_exist
> +root@qt5122:~#
> +
> +This patch make apt-file compatible with busybox readlink
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +---
> + cmdline/apt-key.in | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/cmdline/apt-key.in b/cmdline/apt-key.in
> +index eab5805..421c981 100644
> +--- a/cmdline/apt-key.in
> ++++ b/cmdline/apt-key.in
> +@@ -313,6 +313,7 @@ merge_all_trusted_keyrings_into_pubring() {
> +     # does the same as:
> +     # foreach_keyring_do 'import_keys_from_keyring' "${GPGHOMEDIR}/pubring.gpg"
> +     # but without using gpg, just cat and find
> ++    touch "${GPGHOMEDIR}/pubring.gpg"
> +     local PUBRING="$(readlink -f "${GPGHOMEDIR}/pubring.gpg")"
> +     rm -f "$PUBRING"
> +     touch "$PUBRING"
> +-- 
> +2.17.0
> +


