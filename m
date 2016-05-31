Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 20CCA771AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 21:32:08 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id m81so92841vka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=CBL6PYbNvQ1BJepbxNoH7n/xCAYDArnPC6opc9EQy+A=;
	b=J+sBBCi5lTSELYiizSx8djU2dmZ15QfhoV+2wT0la85HrX+iUdBJaFES2Eg4An/4Cq
	/39L4uAf3hUm9WlOPx0eAJtF7wAdxS1fRioGXTFTWldSNt/nxmxBH+f+X5VmiV3EPGXv
	5aI9EEcrQFTGFlxnF+Sxfu10GFvCTppyOEuBXhfNr5nGDxtAi3o3FzjyqqxOUC47AgZk
	iTFwJ0Aw5e44Ou+z81prD9AkP56IWiN6+jAd42cz/qokV+cRn4pwSHiUHIW76svvjUnb
	XQANy+7k7VmMhlgK/I8Uh5y8Fg4cA5Hb8kXDbIz520IiC119OGcWd/AKeZzz1YhVSU2V
	u5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=CBL6PYbNvQ1BJepbxNoH7n/xCAYDArnPC6opc9EQy+A=;
	b=LyylZAcIDFCoUbaGc7dLIkbgSvQIeQA5kagW8GOrK1xKaEMkRcslSasegfGQW9E7Eh
	Xsi/dKY+HfvLFSXPj9qfKdBQiysZhsfAH5STiaex1y2IRqCRQPl+OhedkCOaGOCAQxKP
	0OgJJPSjNbAbWz82vVfb+NGHH4rKbZ1QCytOzBOc4wnEuq9+gU7XeVicUFUzBhemSrkP
	dF9MJL6QB9H6/fGXg/bQwO+1TYtt36UJ/4xe5uByt1pbJcoS3edt+O0uA59hgmNGUEw2
	pSFqMcyapjO8vLY7LnD6qsjZbrg/Gi/YnkfHb0ZYtkhkYlQ7ZiUV3vTl7Hq7tZE0VnM8
	KVww==
X-Gm-Message-State: ALyK8tLGyzKtJO9IuAU6xqF+OoKcWsavTMjnSznwBHrWB32ZDHGdepDfYagIgpHquZx+LNTi6As7d5ubT5LTvA==
MIME-Version: 1.0
X-Received: by 10.31.94.18 with SMTP id s18mr109731vkb.89.1464730329085; Tue,
	31 May 2016 14:32:09 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Tue, 31 May 2016 14:32:09 -0700 (PDT)
In-Reply-To: <34d687a62898106d88c01c1c0bf6e6311e6972ff.1464688273.git.pkj@axis.com>
References: <cover.1464688273.git.pkj@axis.com>
	<34d687a62898106d88c01c1c0bf6e6311e6972ff.1464688273.git.pkj@axis.com>
Date: Tue, 31 May 2016 23:32:09 +0200
Message-ID: <CALbNGRTZJV5BSJTc6uuYqoe4tf7-nZ0M-L4SDcf3LX+nmTjMAQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tcl: Only set BINCONFIG_GLOB for target builds
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
X-List-Received-Date: Tue, 31 May 2016 21:32:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 31, 2016 at 11:51 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> The recent change of how ${bindir_crossscripts} is installed to the
> sysroot had the unforeseen effect that tclConfig.sh in the sysroot
> contained invalid paths, which caused postgresql to fail to build.
> The change in the contents of tclConfig.sh was due to that it was
> previously installed to the sysroot after binconfig had done its work,
> and was thus unaffected by it.
>
> This change makes sure the contents of tclConfig.sh is the same as
> before, both in the sysroots and on target. This will make postgresql
> build again.
>
> This also changes the BINCONFIG_GLOB to only match tclConfig.sh.
> Before it would also match itclConfig.sh, tclooConfig.sh and
> tdbcConfig.sh, which were consequently installed to the sysroots.
> However, that seems to have been accidentally introduced with the use
> of binconfig (based on what is installed in do_install()).
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> index 61be81d..3a3fd83 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> @@ -93,7 +93,7 @@ do_install_ptest() {
>  }
>
>  # Fix some paths that might be used by Tcl extensions
> -BINCONFIG_GLOB = "*Config.sh"
> +BINCONFIG_GLOB_class-target = "tclConfig.sh"
>
>  # Fix the path in sstate
>  SSTATE_SCAN_FILES += "*Config.sh"
> --
> 2.1.0
>
> --
For me tclConfig.sh still contains absolute paths and postgresql still
fails. I did ccleansstate for tcl and postgresql, applied this patch
and tried to build postgresql.

Andreas

