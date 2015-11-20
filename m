Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 68F7460112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 15:46:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id B2A14601957
To: Adrian Calianu <adrian.calianu@enea.com>,
	openembedded-core@lists.openembedded.org
References: <1447944434-63631-1-git-send-email-adrian.calianu@enea.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <564F4068.8030701@collabora.co.uk>
Date: Fri, 20 Nov 2015 15:46:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447944434-63631-1-git-send-email-adrian.calianu@enea.com>
Subject: Re: [fido][PATCH] [AArch64] Fix the big endian loader name
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
X-List-Received-Date: Fri, 20 Nov 2015 15:46:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Adrian,

On 19/11/15 14:47, Adrian Calianu wrote:
> Backported from glibc 2.22 (master)

Thanks for this change, after fleshing out the commit message a bit[1] 
I've queued it for inclusion in my latest pull request for fido.

Regards,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=joshuagl/fido-next&id=513e52670ea52e8143f46777accf441bb5c299fa

> Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
> ---
>   .../AArch64-Fix-the-big-endian-loader-name.patch   | 49 ++++++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.21.bb              |  1 +
>   2 files changed, 50 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch b/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
> new file mode 100644
> index 0000000..fd2bd8e
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/AArch64-Fix-the-big-endian-loader-name.patch
> @@ -0,0 +1,49 @@
> +[AArch64] Fix the big endian loader name
> +
> +Signed-off-by: Szabolcs Nagy  <szabolcs.nagy@arm.com>
> +
> +The patch was imported from the glibc's official git server
> +(https://sourceware.org/git/?p=glibc.git) as of commit id
> +44cb254f9a024db33ba549e59dc9d90355b797c9.
> +
> +Fixed conflicts raised on glibc 2.21.
> +
> +Upstream-Status: Backport [glibc 2.22]
> +
> +Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
> +---
> + ChangeLog   | 5 +++++
> + config.h.in | 3 +++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index dc1ed1b..503ad41 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -56278,4 +56278,9 @@
> + 	added check.  Only act on the data if no current modification
> + 	happened.
> +
> ++2015-05-01  Szabolcs Nagy  <szabolcs.nagy@arm.com>
> ++
> ++    * config.h.in (HAVE_AARCH64_BE): Add.
> ++
> ++
> + See ChangeLog.17 for earlier changes.
> +diff --git a/config.h.in b/config.h.in
> +index 695ca35..85c1761 100644
> +--- a/config.h.in
> ++++ b/config.h.in
> +@@ -114,6 +114,9 @@
> +    include/libc-symbols.h that avoid PLT slots in the shared objects.  */
> + #undef	NO_HIDDEN
> +
> ++/* AArch64 big endian ABI */
> ++#undef HAVE_AARCH64_BE
> ++
> +
> + /* Defined to some form of __attribute__ ((...)) if the compiler supports
> +    a different, more efficient calling convention.  */
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
> index a0b2f2d..3bba734 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -30,6 +30,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
>              file://Fix-__memcpy_chk-on-non-SSE2-CPUs.patch \
>              ${EGLIBCPATCHES} \
>              ${CVEPATCHES} \
> +           file://AArch64-Fix-the-big-endian-loader-name.patch \
>             "
>   EGLIBCPATCHES = "\
>              file://timezone-re-written-tzselect-as-posix-sh.patch \
>


