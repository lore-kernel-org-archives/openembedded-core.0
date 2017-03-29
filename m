Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D269D77BEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 20:33:58 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u18so6343078wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kYuZdZIU+6G1iDQSBr4gdykoHls6H4wXe4i1Ax6ViLg=;
	b=YrqqiCA6sEfXtYXLXc3Y8NLsfsbODKKWGu+cOb39rAcZbz84hfYU+38Qd8Gngwilck
	wPG8jJZxzQkkUan0Onm8Laoqpyhlt45IPMoBgoYUiopJa0c9pD1uuDOb6blaie1AdZNt
	qCltPBFzCBViVu6XBGKWFr3AG31J666tseid+HuNs8gJZRrjdUwZSIWhGUoUmSiqnjx+
	OPSNSm5BL/FV+0/h6rZwp8tEAGbBA13OLgyI0B3cTBGd6RLcEBkbKpFfgoQayc4a8H3F
	zQ+oOwAhDhb4Ftv2flQHJV6giiFtAMfyXv/6wuKyLa/3qHLUjwcmBaA8RJTbkK/DMWb1
	5xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kYuZdZIU+6G1iDQSBr4gdykoHls6H4wXe4i1Ax6ViLg=;
	b=k8T8YFDsj3H+Eu65G6zQcovKc+cDApKwxmT4jt1dXStGCxPANnaS0gPH+O+qh1/yjP
	Pu/qeKBPC9CCsDYRQPkGxn053Ukyrn05rNOoV5Y3VqLVDa6mcU50juEMg1e3A/XCv3Nk
	lwNCLkcvav7mparw/lu8gLskxuDi0ybbPMkg45ICEKb8AGRO+BSwRhswXFJh6v5JFx5y
	PdazNxxopb70NcQvx5eHKttjalZp3UdSnm+s1m4yje/Rx2TcAmoNCQDPwETaC9tfMf5Z
	U0FNXk85XfloIp6vLuKDWQxx0uvRrgMtpnLJoD1dw6/zBdJU4LwnKCkPkAZh+34ch0UU
	ILqQ==
X-Gm-Message-State: AFeK/H1AnB5DTvAn/FGg6LddAnKQPcDVsozjia+PCjmF2IqShAxAQlD/+S2FfQQQNdZtf9gx3MOU5NQnmNGthQ==
X-Received: by 10.28.166.133 with SMTP id p127mr255144wme.62.1490819639270;
	Wed, 29 Mar 2017 13:33:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Wed, 29 Mar 2017 13:33:58 -0700 (PDT)
In-Reply-To: <f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
References: <cover.1490717618.git.chris_larson@mentor.com>
	<f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 29 Mar 2017 22:33:58 +0200
Message-ID: <CAAQYJAvnEY2=jHs6dkjk0aSR74s6+4xYLEQMsp4yVXjngsWQ4g@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] update_gio_module_cache: fix host user contamination
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
X-List-Received-Date: Wed, 29 Mar 2017 20:33:59 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 6:14 PM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Abdur Rehman <abdur_rehman@mentor.com>
>
> update_gio_module_cache intercept creates file:
> $D${libdir}/gio/modules/giomodule.cache
>
> Change ownership of this file to root:root to avoid user contamination
> by host.
>
> Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  scripts/postinst-intercepts/update_gio_module_cache | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
> index fe468092cf..92092f2144 100644
> --- a/scripts/postinst-intercepts/update_gio_module_cache
> +++ b/scripts/postinst-intercepts/update_gio_module_cache
> @@ -5,3 +5,5 @@ set -e
>  PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D${libdir}:$D${base_libdir} \
>          $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
>
> +chown root:root $D${libdir}/gio/modules/giomodule.cache
> +
> --
> 2.11.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Hello,
There must be something wrong with this patch.
After fresh pull of an hour ago I git:

andrea@ThinkPad-T520:/oe/oe-core/build$ bitbake core-image-base
Loading cache: 100% |############################################| Time: 0:00:00
Loaded 2095 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.33.2"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "ubuntu-16.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "c7x0"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "arm armv5 thumb dsp"
TARGET_FPU        = "soft"
meta              = "master:c187326afcf1e9d781c1bd0923e1362a6f50f613"
meta-handheld     = "master:f88f5bc546ec18de232a91dc1c8185ad242c45f7"
meta-oe
meta-initramfs    = "master:225e64d95bc41077782815f3dceb6f2d1a42b167"

Initialising tasks: 100% |#######################################| Time: 0:00:08
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: core-image-base-1.0-r0 do_rootfs: The postinstall intercept
hook 'update_gio_module_cache' failed (exit code: 1)! See log for
details! (Output: b'')
WARNING: core-image-base-1.0-r0 do_rootfs: The postinstalls for the
following packages will be postponed for first boot: libglib-2.0-0
NOTE: Tasks Summary: Attempted 3440 tasks of which 3427 didn't need to
be rerun and all succeeded.

Cheers
Andrea

