Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id D9AAD60FA6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 00:58:16 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so3213524pbc.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2013 17:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=06QWFyJXdQkGxJ1Z46Pne2wa6kBXVZEdntnqEVRfWWs=;
	b=of1V7XhxPHdjZXM4s3vvDkr6NF3sTGeA5NwlOLwiHvbiJiO7wvBLVYPyvp0OjnZ+jY
	I/+EHOdVvJ7CEJragKx2yJ1Mhgc78ppTRtqu/OvAfL2S6Lf+MGaQA8uG3VmLm72wtXc2
	5XodZj78vNkDtyy3QqUIeP71u0BeJgW09oA2GezR7+LBWuuNA64AJbuPioOD6utVx3OL
	y/7ajgyEBc8CS0pmPkq6ydDUN7C9+YPyJjsPBhUm01aw/C/ArSOG5GfYpuvNe7AksH7I
	/bpfWcmbTGG9p0tV8Zz9vPg7hcFSxbIv70+VZ/nGGweFnWR41dGbsFuN7pFjkxylsAvO
	4ZTw==
X-Received: by 10.66.250.138 with SMTP id zc10mr12669100pac.72.1380848298585; 
	Thu, 03 Oct 2013 17:58:18 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	fi4sm10942427pbc.28.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 03 Oct 2013 17:58:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
Date: Thu, 3 Oct 2013 17:58:16 -0700
Message-Id: <24D616E6-3C79-4C7A-AFED-BE63DAE239BF@gmail.com>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1510)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Fri, 04 Oct 2013 00:58:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 3, 2013, at 5:02 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> When building against the sysroot, out of tree modules can require =
modpost
> and other utilities normally found in the kernel's scripts directory. =
For
> the kernel source in the staging dir, these scripts have been removed =
to
> avoid mixing archiectures when packaging kernel-dev (among other =
things).
>=20
> Rather than further complicate the kernel's install rule, or its =
packaging,
> we can jump into the sysroot and restore the scripts by building them, =
hence
> making them available to packages that need them.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> meta/classes/kernel.bbclass | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4acfb7e..d856e31 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -294,6 +294,14 @@ do_install[prefuncs] +=3D "package_get_auto_pr"
>=20
> sysroot_stage_all_append() {
> 	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} =
${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
> +
> +	# Restore kernel scripts in the sysroot, since they had to be =
removed during
> +	# packaging to avoid mismatched arch QA errors, but are =
required/useful when
> +	# packages like out of tree kernel modules are built. Rather =
than playing QA
> +	# games, it is easier to just do this work in the sysroot.
> +	( cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH};

This was cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}/scripts in my patch but =
I will test out this one too.
but this is ok since=20

ifeq ($(KBUILD_EXTMOD),)
# Additional helpers built in scripts/
# Carefully list dependencies so we do not try to build scripts twice
# in parallel
PHONY +=3D scripts
scripts: scripts_basic include/config/auto.conf =
include/config/tristate.conf \
         asm-generic
        $(Q)$(MAKE) $(build)=3D$(@)


> +	  oe_runmake scripts=20
> +	)
> }
>=20
> kernel_do_configure() {
> --=20
> 1.8.1.2
>=20


