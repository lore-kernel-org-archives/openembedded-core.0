Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id EF48960DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 17:27:04 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id x3so1330337qcv.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 10:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=y1Jfr54RuXKBuL3LxWvNA5oJWHMrq+KRBZsCA+FbfHo=;
	b=dPDGcdCLSpNOiLFZMpKW2jPCg1H9K2ea1gNPDQwNtIDcCmirQtBp3nvVjWpdFgPQaS
	89orXu1DNRAtj39MBf4zxPwGCr2QOtix2Xp+kqIRJBSI4NJBeY480aLFRWchUVpzC1Fu
	UpH+I8c5F+FmERJ7LM3Bd1ttCRvLnmiKJOw7IrVJnmmdMIr7LCNuQLBm/AOLnFJemsB2
	znwQWD4gX4j4BbtktEzLUC2Bu4fTeL7binckHIhly4ea9gqM21EkcTrZlPfvNrGkGtoy
	FT3X3xvEpcP4QO/TvPm9W5PxCJqJqtBo3c1v4fD7Pt5/PTgkngnd1iiEWzPF7rrRsSln
	IfiA==
X-Received: by 10.140.32.227 with SMTP id h90mr20014467qgh.13.1413394025671;
	Wed, 15 Oct 2014 10:27:05 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Wed, 15 Oct 2014 10:26:25 -0700 (PDT)
In-Reply-To: <543ea179.e25bb40a.2c8a.1e34SMTPIN_ADDED_BROKEN@mx.google.com>
References: <543ea179.e25bb40a.2c8a.1e34SMTPIN_ADDED_BROKEN@mx.google.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 15 Oct 2014 18:26:25 +0100
X-Google-Sender-Auth: gE2MSVw-HZzkKpxtTBF-qaBIbvE
Message-ID: <CANyK_8e3EV3dO72UJ6Bo=QodGS3A315j5E_i_7evPjrgGVqxgA@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Wed, 15 Oct 2014 17:27:11 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 17:31, Peter Urbanec <openembedded-devel@urbanec.net> wrote:
> opkg upgrade will now call prerm and postrm scripts from the old package
> with the "upgrade new-version" arguments, similar to what dpkg does.
>
> Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
> ---
>  .../opkg/opkg/prerm-and-postrm-scripts.patch       | 82
> ++++++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
>  2 files changed, 83 insertions(+)
>  create mode 100644
> meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> new file mode 100644
> index 0000000..0d7f726
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> @@ -0,0 +1,82 @@
> +Upstream-Status: Submitted [opkg-devel@googlegroups.com]
> +Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
> +
> +From 476965fdb2d6eec559242e6205cbb07d539b80e1 Mon Sep 17 00:00:00 2001
> +From: Peter Urbanec <openembedded-devel@urbanec.net>
> +Date: Wed, 15 Oct 2014 14:32:22 +1100
> +Subject: [PATCH] opkg_install: Call prerm and postrm scripts on package
> upgrade.
> +To: opkg-devel@googlegroups.com
> +Cc: paul@paulbarker.me.uk
> +
> +When upgrading a package from v1 to v2, run "v1-prerm upgrade v2" and
> +"v1-postrm upgrade v2", similarly to what dpkg does.
> +
> +This patch fixes issue 104.

For the sake of future readers within OpenEmbedded, we need to make
clearer here that this is opkg issue 104, not an OE issue number. This
change isn't needed in the patch to opkg upstream though.

> +
> +Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>

Sorry to be pedantic but there's now 2 copies of the Signed-off-by
line. If you resend this, I'd also bring the Upstream-status line down
so that it immediately follows the Signed-off-by line. That's just a
minor cosmetic point though, it may be possible for someone to make
these edits as the patch is merged.

> +
> +---
> + libopkg/opkg_install.c | 40 ++++++++++++++++++++++++++++++++++++++--
> + 1 file changed, 38 insertions(+), 2 deletions(-)
> +
> +diff --git a/libopkg/opkg_install.c b/libopkg/opkg_install.c
> +index 4f6fe65..ec0f34a 100644
> +--- a/libopkg/opkg_install.c
> ++++ b/libopkg/opkg_install.c
> +@@ -601,7 +601,25 @@ prerm_upgrade_old_pkg(pkg_t *pkg, pkg_t *old_pkg)
> +          Error unwind, for both the above cases:
> +          old-postinst abort-upgrade new-version
> +      */
> +-     return 0;
> ++    int err;
> ++    char *script_args;
> ++    char *new_version;
> ++
> ++    if (!old_pkg || !pkg)
> ++        return 0;
> ++
> ++    new_version = pkg_version_str_alloc(pkg);
> ++
> ++    sprintf_alloc(&script_args, "upgrade %s", new_version);
> ++    free(new_version);
> ++    err = pkg_run_script(old_pkg, "prerm", script_args);
> ++    free(script_args);
> ++    if (err != 0) {
> ++        opkg_msg(ERROR, "prerm script for package \"%s\" failed\n",
> ++                 old_pkg->name);
> ++        return -1;
> ++    }
> ++    return 0;
> + }
> +
> + static int
> +@@ -1001,7 +1019,25 @@ postrm_upgrade_old_pkg(pkg_t *pkg, pkg_t *old_pkg)
> +          new-postrm failed-upgrade old-version
> +       Error unwind, for both cases:
> +          old-preinst abort-upgrade new-version    */
> +-     return 0;
> ++    int err;
> ++    char *script_args;
> ++    char *new_version;
> ++
> ++    if (!old_pkg || !pkg)
> ++        return 0;
> ++
> ++    new_version = pkg_version_str_alloc(pkg);
> ++
> ++    sprintf_alloc(&script_args, "upgrade %s", new_version);
> ++    free(new_version);
> ++    err = pkg_run_script(old_pkg, "postrm", script_args);
> ++    free(script_args);
> ++    if (err != 0) {
> ++        opkg_msg(ERROR, "postrm script for package \"%s\" failed\n",
> ++                 old_pkg->name);
> ++        return -1;
> ++    }
> ++    return 0;
> + }
> +
> + static int
> +--
> +2.1.2
> +

This looks fine. As I've said in reply to the patch on the opkg-devel
mailing list, I'm busy this week but should have time to test this
properly next week. It looks correct to me though, the logic is almost
identical to the patch I prepared which covers prerm only.

It probably doesn't need to wait for my test before going into OE though.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

