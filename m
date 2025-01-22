Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BCEC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 14:17:31 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.44575.1737555445554000404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 06:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=Gt5Fvt7T;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Pn7WNMipUI7zTrYWsKSTBp1ghnKBtiGi4+qqmELEcL0=; b=Gt5Fvt7TsaSvo6pgo59ZpfDC9w
	tm6F3OdqE0wIrgeOQcgfM0ZrGn2YqFubz3VAhrJLbeHh+EBOdORbhVmPPF+dVMuYtAokX1eBEsDC3
	iNbi4rgrmo2mHo368VJvO7bRkz1UPokiusYNe54pyAMO1nE6IF9pwMDRtAb99LLGA5pBXEyNr87z3
	m4vNT398hTkHn7Gc1TxJdiuvdWXzc2+wKkH5X9oN0ugbc1fBltlH6UtJGmCXD/+2d2kA5Fm8d4HMz
	Exe/Crk8dkPydNmHCMZFwAyoXGLkvimfvV+VYZ7baFJY8+e3HVORXMSRdxS0mHRR4JbNnxdNCzERe
	TrvVTNjA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <esben@geanix.com>)
	id 1tabXj-000HcH-1k;
	Wed, 22 Jan 2025 15:17:19 +0100
Received: from [87.49.44.57] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tabXj-0007rX-0T;
	Wed, 22 Jan 2025 15:17:19 +0100
From: Esben Haabendal <esben@geanix.com>
To: "Sadineni, Harish via lists.openembedded.org"
 <Harish.Sadineni=windriver.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org,
  Harish.Sadineni@windriver.com,  Randy.MacLeod@windriver.com,
  Sundeep.Kokkonda@windriver.com,  Shivaprasad.Moodalappa@windriver.com
Subject: Re: [OE-core] [PATCH V2 1/2] rust: fix for rust multilib sdk
 configuration
In-Reply-To: <20250116134833.1838212-1-Harish.Sadineni@windriver.com> (Harish
	via lists openembedded org Sadineni's message of "Thu, 16 Jan 2025
	05:48:31 -0800")
References: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
Date: Wed, 22 Jan 2025 15:17:18 +0100
Message-ID: <87o6zzszkh.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27526/Wed Jan 22 10:40:03 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 14:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210155

"Sadineni, Harish via lists.openembedded.org"
<Harish.Sadineni=windriver.com@lists.openembedded.org> writes:

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> YOCTO [#15061]
> The rust sdk installs both 'rust.sh' and 'cargo.sh' for lib32 and lib64 in the same location.
> This causes below error while installing the lib32 & lib64 binaries:
>
> Error: Transaction test error:
>   file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/cargo.sh
> conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
>  rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
>   file /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/environment-setup.d/rust.sh
> conflicts between attempted installs of rust-cross-canadian-arm-1.67.1-r0.x86_64_nativesdk and
> rust-cross-canadian-aarch64-1.67.1-r0.x86_64_nativesdk
> ERROR: Task (virtual:multilib:lib32:/media/build/poky/meta/recipes-sato/images/core-image-sato.bb:do_populate_sdk)
> failed with exit code '1'
>
> The change includes:
> - Prepending '${RUST_TARGET_SYS}' to 'rust.sh' to differentiate between target systems.
> - Moving the non-target-specific environment variables to 'nativesdk-cargo' and 'nativesdk-rust',
> instead of being managed by the cross-canadian recipe.
> - Removed the redundant cargo config file from the 'rust-cross-canadian.inc' file.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/rust/cargo_1.81.0.bb    | 15 +++++++++++
>  .../rust/rust-cross-canadian.inc              | 27 ++-----------------
>  meta/recipes-devtools/rust/rust_1.81.0.bb     | 13 +++++++++
>  3 files changed, 30 insertions(+), 25 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/cargo_1.81.0.bb b/meta/recipes-devtools/rust/cargo_1.81.0.bb
> index 123032cdf7..d05b076d30 100644
> --- a/meta/recipes-devtools/rust/cargo_1.81.0.bb
> +++ b/meta/recipes-devtools/rust/cargo_1.81.0.bb
> @@ -50,8 +50,23 @@ do_install:append:class-nativesdk() {
>  	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
>  	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
>  	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
> +
> +        ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
> +        mkdir "${ENV_SETUP_DIR}"
> +        CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
> +
> +        cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
> +	# Keep the below off as long as HTTP/2 is disabled.
> +	export CARGO_HTTP_MULTIPLEXING=false
> +
> +	export CARGO_HTTP_CAINFO="\$OECORE_NATIVE_SYSROOT/etc/ssl/certs/ca-certificates.crt"
> +	EOF
> +
> +        chown -R root.root ${D}

You should probably cleanup the mixed use of tabs and spaces above.

/Esben

