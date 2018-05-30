Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E23874BE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 02:13:54 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q6-v6so21372839qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6y9jenRaTU3finsKy13Whq4RQ82rfzND+7SNUKa9hAA=;
	b=uR5bFziT4BujnJcMf6+gLDipQlsDLex0mtsMxsv5E/bb+Fw0qVcTey2T0up2MlquTz
	3bZdG1P211ReUgmYmgjmfYYStFCu5wTmZcgaekeI7TAjJyjfD3fPQBc1zKpwdTaN9Ykh
	PNmz5TZEHPYqbdBpqpOjhREykbQTtu26ZEh9SHY6muC+MDTJGAxYoA+/k0jbnjB8OVjM
	rNkkbVmy0ScNv0BSiYksqTWsjPG9fgTnPvk+smv/nz7eABBc2t51iZh6n9KOk2OsiwlW
	ovHeMYw8a1vilV9+ryCDa37ME6bFTGZUcOuAhs3e2nWWf2gV4DfWQB67VMTC/Z4V5Wjs
	i1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6y9jenRaTU3finsKy13Whq4RQ82rfzND+7SNUKa9hAA=;
	b=pwk8ia/n57doKVz+b2r7MCuZdAawAfmcMQjKg95mwV5/gisPNmSX7DblHDL28uzTb0
	NAkwsqJsrBGIiupNOckvuhwxh2qfrvTfcR4JcdycAOz5Q/9D3pKJCDLQD9HwCpEif2wz
	djCQ+9P2coUt8IuPuXKk9GPJ+yXqq7KIBnAabXCpTNsY44nmV/W03FfBeYF8zBXoogQf
	xpUCmZ/QUrjPjVW+Ho+/MNGEqYciys048UInWL3EmSig8bVnBNciHUSEni6jAjtM4Tb2
	RJRF8p0N07AKw8i1tTr2c93kDGjxoB0BoXg91Y81N2AgIRak106akaex58CP292X1OdL
	+rKA==
X-Gm-Message-State: APt69E1dNTtmg7sCJ3jt06sipdNowCa3rpZhHvabPDbmQeZ6+YL8mOyk
	5fo0p1DXjf8Z+YLkIIHQeZdjOp4Gtr1o7mtTjcM=
X-Google-Smtp-Source: ADUXVKLDUKFUQGMlKyrRyw/+muHLR9ZwXkvlYkaVj2vgLB/6qflH8p+Zu+CCSiB6ZRY5FnJ2EbM+8dxbid3FeeeJy6E=
X-Received: by 2002:ac8:2b5c:: with SMTP id 28-v6mr783125qtv.117.1527646434783;
	Tue, 29 May 2018 19:13:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Tue, 29 May 2018 19:13:24
	-0700 (PDT)
In-Reply-To: <1527629388-3808-5-git-send-email-armccurdy@gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
	<1527629388-3808-5-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 19:13:24 -0700
Message-ID: <CAMKF1sroBR0o=tfORJxX-Fg5itQLEtBxtiTjia4E2YGYuj1OEg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/5] bitbake.conf: include ASNEEDED in TARGET_LDFLAGS directly
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
X-List-Received-Date: Wed, 30 May 2018 02:13:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 2:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Previously, ASNEEDED was appended to TARGET_LDFLAGS from
> as-needed.inc via tcmode-default.inc and so may not have been enabled
> for external toolchain builds or other configurations which over-ride
> TCMODE (ie builds which do not include tcmode-default.inc).
>
> Include ASNEEDED in TARGET_LDFLAGS directly from bitbake.conf to
> ensure that the optimisation is applied to all builds (and for
> consistency with the way that TARGET_LINK_HASH_STYLE is handled).

We have to be ensure that external toolchains can either override or support
--as-needed feature, since we may not be able to control what linker they use
or version of gnu ld they may deploy.  From internal toolchains pov
this is a good change, but It would be good if some users of external toolchains
can chime in.

>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/bitbake.conf                      | 4 +++-
>  meta/conf/distro/include/as-needed.inc      | 4 ----
>  meta/conf/distro/include/tcmode-default.inc | 3 ---
>  3 files changed, 3 insertions(+), 8 deletions(-)
>  delete mode 100644 meta/conf/distro/include/as-needed.inc
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 15f6da7..fab3dcc 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -585,8 +585,10 @@ LINKER_HASH_STYLE_mipsarch = "sysv"
>
>  TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE') != 'gnu']}"
>
> +ASNEEDED ?= "-Wl,--as-needed"
> +
>  export LDFLAGS = "${TARGET_LDFLAGS}"
> -export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
> +export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
>
>  # Pass parallel make options to the compile task
>  EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
> diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
> deleted file mode 100644
> index b163fef..0000000
> --- a/meta/conf/distro/include/as-needed.inc
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -
> -ASNEEDED = "-Wl,--as-needed"
> -
> -TARGET_LDFLAGS += "${ASNEEDED}"
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 4b58df0..d85fd1e 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -65,12 +65,9 @@ PREFERRED_VERSION_glibc-initial            ?= "${GLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
>  PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
>
> -
>  PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
>  PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
>  PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
> -# Setup suitable toolchain flags
> -require conf/distro/include/as-needed.inc
>
>  GOVERSION ?= "1.9%"
>  PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

