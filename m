Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
	by mail.openembedded.org (Postfix) with ESMTP id 2B57F61C45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 14:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 467A2281554;
	Thu, 12 Mar 2020 10:33:05 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id neBELehGzkyD; Thu, 12 Mar 2020 10:33:04 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id D2A6F281553;
	Thu, 12 Mar 2020 10:33:04 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com D2A6F281553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1584023584;
	bh=9GXfJ6zZ17kQ19+mU8zBomixrHSU2ysdUL9IVW/gzQ8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=hmMA/SCzZLC5kD9doNPSGYuVV9Nue4NP5Sl7UVLcLhuoTD2e00MyPlHz+pH9CLRB+
	DnjO+SKorMbztyHNPxaUM/n/Igy3eqtjzME/t1v6JM7+C05ZY7kft5s3p8zDu7JJkb
	r4vjqiydmqx8MdR7M79jZ9yeI5qj6D8aGgHjkj44ud59xGVZewwZFEeIEZotQ62xnQ
	IVfMRU9PBcX0BAoojLWjNmjC0ieLLVoSBiJodtVYXne2NrTJwjPjTkO4g1kmzfBf6+
	ZdatYRKwQMLVb7GYBmfRZzTGy2SqIm6EEoYRTxW+hnt8i8+ErLDSGndrqVmyZyEt6K
	2ACHnXYTflERA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id E5EQuTz8CwRc; Thu, 12 Mar 2020 10:33:04 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id A295A281552;
	Thu, 12 Mar 2020 10:33:04 -0400 (EDT)
Date: Thu, 12 Mar 2020 10:33:04 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: mingli.yu@windriver.com
Message-ID: <20200312143304.GC30953@joraj-alpa>
References: <1583934573-94011-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1583934573-94011-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] babeltrace2: initialize the other_entry pointer
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
X-List-Received-Date: Thu, 12 Mar 2020 14:33:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mingli,

Thanks for also posting this on the lttng-dev mailing list. I'm sure we can get
this in fairly quickly upstream.

This is more a question for Richard and other core members of oe, is this kind of
patch pertinent for upstream oe considering it is only silencing a
warning (based on [1])?

[1] https://lists.lttng.org/pipermail/lttng-dev/2020-March/029550.html

On Wed, Mar 11, 2020 at 09:49:33PM +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> When add below line to local.conf to enable debug build:
> 
> DEBUG_BUILD = "1"
> 
> There comes below failure when run "bitbake babeltrace2"
> | ../../../../../git/src/plugins/ctf/fs-src/fs.c: In function 'ds_index_insert_ds_index_entry_sorted':
> | ../../../../../git/src/plugins/ctf/fs-src/fs.c:702:5: error: 'other_entry' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |   702 |    !ds_index_entries_equal(entry, other_entry)) {
> 
> So initialize the other_entry pointer to fix the above error.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../0001-fs.c-initialize-other_entry.patch         | 33 ++++++++++++++++++++++
>  meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb     |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
> new file mode 100644
> index 0000000..b56b3bd
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
> @@ -0,0 +1,33 @@
> +From 42dae692b9057d03ce9a0651f061472e9dd90130 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 11 Mar 2020 08:44:42 +0000
> +Subject: [PATCH] fs.c: initialize the other_entry variable
> +
> +Initialize the pointer other_entry to fix the below error:
> +| ../../../../../git/src/plugins/ctf/fs-src/fs.c: In function 'ds_index_insert_ds_index_entry_sorted':
> +| ../../../../../git/src/plugins/ctf/fs-src/fs.c:702:5: error: 'other_entry' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> +|   702 |    !ds_index_entries_equal(entry, other_entry)) {
> +
> +Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2020-March/029549.html]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/plugins/ctf/fs-src/fs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/plugins/ctf/fs-src/fs.c b/src/plugins/ctf/fs-src/fs.c
> +index e87523a3..a6b5315f 100644
> +--- a/src/plugins/ctf/fs-src/fs.c
> ++++ b/src/plugins/ctf/fs-src/fs.c
> +@@ -680,7 +680,7 @@ void ds_index_insert_ds_index_entry_sorted(
> + 	struct ctf_fs_ds_index_entry *entry)
> + {
> + 	guint i;
> +-	struct ctf_fs_ds_index_entry *other_entry;
> ++	struct ctf_fs_ds_index_entry *other_entry = NULL;
> + 
> + 	/* Find the spot where to insert this index entry. */
> + 	for (i = 0; i < index->entries->len; i++) {
> +-- 
> +2.24.1
> +
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> index 16953d6..c027d8b 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
> @@ -10,6 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>  SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
>  	   file://run-ptest \
>  	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
> +	   file://0001-fs.c-initialize-other_entry.patch \
>  	  "
>  SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jonathan Rajotte-Julien
EfficiOS

