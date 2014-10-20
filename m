Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 80E4665D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:40:04 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id h18so4592022igc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 20:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3MEoMgeg4v+SyydnW/vwyjw84bt1tZ3/GZEO0IJ8Lo4=;
	b=YpiHadRfp9nkqxoDO5qcSrtu8smSrw9PvVXSUYnoB8BJ67xyaAhQqVTVPUQkW4teoa
	9P5pFOVBQF2l+FT4dk5vOrGeP6aBsUhix8qbjbQgkenBsKWTMX5x3YygG3L+uLkcCTIO
	VgXNsQOW5iS504yuPD81Hb/LeJfbRd3VEb2+Y/0Olp+w8XspeAdTKjW4Z1mZxGVvwBIY
	83v3gFSMUPCK1MUNgriE6rCG6GRI7Pb22GjS4aoLfYNLxgOHkYQi4Uwg8wjXjgirHwNt
	KdJy8AzR1vwTGckvO9BUOu199PJZyfGND9ghq7srvXAtQ5yLyt/BnvLwrX+5X8GGIkSI
	f6fA==
X-Received: by 10.50.110.65 with SMTP id hy1mr15383916igb.13.1413776404578;
	Sun, 19 Oct 2014 20:40:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Sun, 19 Oct 2014 20:39:34 -0700 (PDT)
In-Reply-To: <1413364894-25626-1-git-send-email-rongqing.li@windriver.com>
References: <1413364894-25626-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Oct 2014 20:39:34 -0700
Message-ID: <CAMKF1sq03U7B2qN=MBOZemLnpuNqeqOTZdtVCb3V+2FUks_w6A@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: fix a Gcc undefined behavior
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
X-List-Received-Date: Mon, 20 Oct 2014 03:40:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 15, 2014 at 2:21 AM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> Calling strncpy with NULL second argument, even when the size is 0,
> is undefined behavior, which leads to GCC to drop the check old
> variable with NULL in following code.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743

FWIW this is correct way to fix it

>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../files/fix-a-Gcc-undefined-behavior.patch       |   38 ++++++++++++++++++++
>  .../nfs-utils/nfs-utils_1.3.0.bb                   |    1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
>
> diff --git a/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch b/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
> new file mode 100644
> index 0000000..5843ba0
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/files/fix-a-Gcc-undefined-behavior.patch
> @@ -0,0 +1,38 @@
> +[PATCH] fix a Gcc undefined behavior
> +
> +Upstream-Status: Pending
> +
> +Calling strncpy with NULL second argument, even when the size is 0,
> +is undefined behavior, which leads to GCC to drop the check old
> +variable with NULL in following code.
> +
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=6743
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + support/export/client.c |    9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/support/export/client.c b/support/export/client.c
> +index dbf47b9..a37ef69 100644
> +--- a/support/export/client.c
> ++++ b/support/export/client.c
> +@@ -482,8 +482,13 @@ add_name(char *old, const char *add)
> +               else
> +                       cp = cp + strlen(cp);
> +       }
> +-      strncpy(new, old, cp-old);
> +-      new[cp-old] = 0;
> ++
> ++      if (old) {
> ++              strncpy(new, old, cp-old);
> ++              new[cp-old] = 0;
> ++      } else
> ++              new[0] = 0;
> ++
> +       if (cp != old && !*cp)
> +               strcat(new, ",");
> +       strcat(new, add);
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> index c813d7f..f1ef6d9 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> @@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>             file://nfs-statd.service \
>             file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
>             file://0001-statd-fixed-the-with-statdpath-flag.patch \
> +           file://fix-a-Gcc-undefined-behavior.patch \
>  "
>
>  SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

