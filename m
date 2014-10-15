Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0C160DD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 13:18:03 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so878127qcx.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GZGk4XGA9TsU0vDQCU3G6laeoHJXL0E7FofWa7oFc2M=;
	b=xecPCu5NE+DA0lvIGRKxF+ck7KpMvrqnyh2lU5v3D0ooYHs0WTinla2POSsthWopnS
	sGjpCFalqr80zZ1/+axCSgCYa3hsPkJXqoLWl7MEWE6t18LxcSx90dLAWGLXbAVpP7sm
	/qhQrYVthLpFTtvfzTATZGRHeaSle9JvOjVJf1P4ek3ANQPZP4lDekCfVRgr5ULhKUC4
	y3D0CcTJlzdTGNYOpJdflYkQ0+PziakUtGCZuYl9yYcHLHY9tYFOGrGz3wAmDslO1TKq
	DTnwCz0Wdwxgs+NpRvcBY9M71sk9jofM2UMzcsz/00bTxZh78Kuq3Me7l02WSVdHSUyo
	uTWA==
X-Received: by 10.140.23.198 with SMTP id 64mr19529680qgp.62.1413379084210;
	Wed, 15 Oct 2014 06:18:04 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Wed, 15 Oct 2014 06:17:23 -0700 (PDT)
In-Reply-To: <543E5F54.9090907@urbanec.net>
References: <543E5F54.9090907@urbanec.net>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 15 Oct 2014 14:17:23 +0100
X-Google-Sender-Auth: GXkpawT1Jzfdl36jKqrASieL9Ik
Message-ID: <CANyK_8ekCtKhA6Ps7tyP8PxerCpP_iDFqBbsCiuB1q_NTFJyaA@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Wed, 15 Oct 2014 13:18:06 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 12:49, Peter Urbanec <openembedded-devel@urbanec.net> wrote:
> opkg upgrade will now call prerm and postrm scripts from the old package
> with the "upgrade new-version" arguments, similar to what dpkg does.
>
> Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
> Upstream-Status: Submitted [opkg-devel@googlegroups.com]
> ---
>  .../opkg/opkg/prerm-and-postrm-scripts.patch       | 79 ++++++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.2.2.bb           |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> new file mode 100644
> index 0000000..c393807
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/prerm-and-postrm-scripts.patch
> @@ -0,0 +1,79 @@
> +From 476965fdb2d6eec559242e6205cbb07d539b80e1 Mon Sep 17 00:00:00 2001
> +From: Peter Urbanec <openembedded-devel@urbanec.net>
> +Date: Wed, 15 Oct 2014 14:32:22 +1100
> +Subject: [PATCH] opkg_install: Call prerm and postrm scripts on package
> + upgrade.
> +To: opkg-devel@googlegroups.com
> +Cc: paul@paulbarker.me.uk
> +
> +When upgrading a package from v1 to v2, run "v1-prerm upgrade v2" and
> +"v1-postrm upgrade v2", similarly to what dpkg does.
> +
> +This patch fixes issue 104.
> +
> +Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>

This is still missing "Upstream-status:"

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
> + + static int

I don't think the patch has been generated properly here. There
shouldn't be a change to this line.

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
> + + static int

Again, I'm not sure why this line is listed with a '+'.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

