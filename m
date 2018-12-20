Return-Path: <ross.burton@intel.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1122378BE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 13:04:26 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v5so1286192lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 05:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pbvpf+OGGL3ODGt0bjfopzEjN5RbM1hl2HsnT9FUABQ=;
	b=RynRYtS0UrN9vZGfLv5e/uk8YEOJS3bH/xfVJIMMLwaMBaQwEM9r2Ft9tkpAMwvpxr
	grJTDJbqn6sTl3bdyp+my+ZqZCrpReihrKNrNXw/mNUewMXOM66/2AraemF+Xfxr0CSA
	hBxdHHdGKq1785rpoWG/aLDdV/x7fUw5J3KFPGqkRHrhbn7WQfh3x7mQPxxvguCj4KEf
	f/UGDdC6hZzv37IGrSo3s3gl63EoYsOJDtEO0r0xSQD2bENUXWp1GebGLfHiswBQr0n2
	Eu3QMTTW6DUudmsQUOOuosF7hUwnhOiDVCoavc9UlDIuNATal6Ddp+KMfLw/eLGrYvy6
	t+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pbvpf+OGGL3ODGt0bjfopzEjN5RbM1hl2HsnT9FUABQ=;
	b=qGg17QrgaL1Q7izf7uodp9nExCYPgMgygRfoAS+2i+BNszI7Fn+b4ETSoam+9G9tQv
	qGhPiCPdzC8PvTKqKE12pcaq/8CaklewLS2kj+o/EwXmErZTYHlnACb8DzkxGIl2GZUr
	C5VT3sSbis20mDEuIGVAuF8GlGlyG3DSOiPfJs5aUQBQ0JRLHG/IsjTywB8Ku28AxTdO
	AmTxeaET3nci1kx1GWOSw3UXj8vqNwvqZO8PUupDEoG5xBvmHXC7P9Wnqeeb36RNEKoA
	o7O6sxUfL1UgqgLKEy8MG0fId5XTS1ybtcmUh9iwATN7otZX7sOyiGZxCi05UxXFJbWN
	zYoQ==
X-Gm-Message-State: AA+aEWZAJi8F07oxT45W7c1hHsUoYfuQHHFyFmkdigl0jzLkzPFwgrPS
	POkDXrVLHi1x43n+wAGAlLBo54Iauy0k93ab7AS21w==
X-Google-Smtp-Source: AFSGD/XWMUvjIbS/lRPVE3diM0r5V/EREWFEJcT0A8UV1hvKwANVymmriQ/N6e1IRgDFPZL8kErar+Ljkpu4wcW72yU=
X-Received: by 2002:a19:641d:: with SMTP id y29mr14885110lfb.14.1545311067466; 
	Thu, 20 Dec 2018 05:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20181220054044.29476-1-douglas.royds@taitradio.com>
In-Reply-To: <20181220054044.29476-1-douglas.royds@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 13:04:15 +0000
Message-ID: <CAJTo0LZ+9K+AbMeWb5PV_0bmivHcv+2JAXtuA2ZxKJMsaL=Tbg@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpam: reproducibility: Fix host umask leakage at patch-time
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
X-List-Received-Date: Thu, 20 Dec 2018 13:04:27 -0000
Content-Type: text/plain; charset="UTF-8"

Why is this libpam specific and not a general issue that the umask
needs to be set in patch.bbclass?

Ross
On Thu, 20 Dec 2018 at 05:41, Douglas Royds <douglas.royds@taitradio.com> wrote:
>
> The patch file pam-security-abstract-securetty-handling.patch creates a new
> file (tty_secure.c) at patch-time, so its permissions are subject to the host
> umask. This file is later copied into the -dbg package with no change in
> permissions.
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/recipes-extended/pam/libpam_1.3.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
> index 3aec2cdb4c..292b570e11 100644
> --- a/meta/recipes-extended/pam/libpam_1.3.0.bb
> +++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
> @@ -49,6 +49,9 @@ S = "${WORKDIR}/Linux-PAM-${PV}"
>
>  inherit autotools gettext pkgconfig
>
> +# We create a new file (tty_secure.c) from pam-security-abstract-securetty-handling.patch
> +do_patch[umask] = "022"
> +
>  PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
>
>  PACKAGES += "${PN}-runtime ${PN}-xtests"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

