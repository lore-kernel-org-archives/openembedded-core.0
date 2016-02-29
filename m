Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6807C77150
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 14:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TEnm02012881; Mon, 29 Feb 2016 14:50:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hLmdWRH8WZcX; Mon, 29 Feb 2016 14:50:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TEnxLm012890
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Feb 2016 14:50:00 GMT
Message-ID: <1456757399.11498.175.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 14:49:59 +0000
In-Reply-To: <1456756033-17665-1-git-send-email-dmitry.rozhkov@linux.intel.com>
References: <1456756033-17665-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] libarchive: Set xattrs after setting times
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
X-List-Received-Date: Mon, 29 Feb 2016 14:50:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-29 at 16:27 +0200, Dmitry Rozhkov wrote:
> With Integrity Measurement Architecture (IMA) enabled Linux
> kernel the security.ima extended attribute gets overwritten
> when setting times on a file with a futimens() call. So it's safer
> to set xattrs after times.
> 
> The patch was submitted upstream in
> https://github.com/libarchive/libarchive/pull/664
> 
> Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
> ---
>  .../0001-Set-xattrs-after-setting-times.patch      | 54
> ++++++++++++++++++++++
>  .../libarchive/libarchive_3.1.2.bb                 |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/0001
> -Set-xattrs-after-setting-times.patch
> 
> diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Set
> -xattrs-after-setting-times.patch b/meta/recipes
> -extended/libarchive/libarchive/0001-Set-xattrs-after-setting
> -times.patch
> new file mode 100644
> index 0000000..beded5c
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs
> -after-setting-times.patch
> @@ -0,0 +1,54 @@
> +From 545ded56095c570426fe102ff2192889681ea75c Mon Sep 17 00:00:00
> 2001
> +From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
> +Date: Mon, 29 Feb 2016 14:38:25 +0200
> +Subject: [PATCH] Set xattrs after setting times
> +
> +With Integrity Measurement Architecture (IMA) enabled Linux
> +kernel the security.ima extended attribute gets overwritten
> +when setting times on a file with a futimens() call. So it's safer
> +to set xattrs after times.
> +---
> + libarchive/archive_write_disk_posix.c | 21 +++++++++++----------
> + 1 file changed, 11 insertions(+), 10 deletions(-)

Patch looks good but we need an "Upstream-Status: Submitted [
https://github.com/libarchive/libarchive/pull/664]" header in the patch
itself please.

Cheers,

Richard

> +diff --git a/libarchive/archive_write_disk_posix.c
> b/libarchive/archive_write_disk_posix.c
> +index 0fc6193..27c9c1e 100644
> +--- a/libarchive/archive_write_disk_posix.c
> ++++ b/libarchive/archive_write_disk_posix.c
> +@@ -1620,16 +1620,6 @@ _archive_write_disk_finish_entry(struct
> archive *_a)
> +	}
> +
> +	/*
> +-	 * Security-related extended attributes (such as
> +-	 * security.capability on Linux) have to be restored last,
> +-	 * since they're implicitly removed by other file changes.
> +-	 */
> +-	if (a->todo & TODO_XATTR) {
> +-		int r2 = set_xattrs(a);
> +-		if (r2 < ret) ret = r2;
> +-	}
> +-
> +-	/*
> +	 * Some flags prevent file modification; they must be
> restored after
> +	 * file contents are written.
> +	 */
> +@@ -1648,6 +1638,17 @@ _archive_write_disk_finish_entry(struct
> archive *_a)
> +	}
> +
> +	/*
> ++	 * Security-related extended attributes (such as
> ++	 * security.capability or security.ima on Linux) have to be
> restored last,
> ++	 * since they're implicitly removed by other file changes
> like setting
> ++	 * times.
> ++	 */
> ++	if (a->todo & TODO_XATTR) {
> ++		int r2 = set_xattrs(a);
> ++		if (r2 < ret) ret = r2;
> ++	}
> ++
> ++	/*
> +	 * Mac extended metadata includes ACLs.
> +	 */
> +	if (a->todo & TODO_MAC_METADATA) {
> +--
> +2.5.0
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> index 89c8faf..ed677ac 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
> @@ -35,6 +35,7 @@ SRC_URI = "
> http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
>             file://pkgconfig.patch \
>             file://libarchive-CVE-2015-2304.patch \
>             file://mkdir.patch \
> +           file://0001-Set-xattrs-after-setting-times.patch \
>             "
>  
>  SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
> -- 
> 2.5.0
> 

