Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 62B9B6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 23:47:07 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p66so1616466wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6mC0vnUkWNc7aZX+NKz34gdSI97ODmt0a6OtWyG7Aew=;
	b=G68F5rc0T+s3qmSKom19kHw/ugF3iUZ447eysIVtWZiGtGLT1hsJ0VcTmnPixLX1uS
	cshGUSDsW70z+lEgKuLfIjGdNwkuWdBEyD22+bUkh1SyLBF5ZvqGcYx1m/Mil87k7X7n
	Z+wzNDvPjlmgMADB77XaYkhx++oh4pAndKvRfNTNWW6FGjTWQz1rRGjKrC7n63hyKWqK
	I4arHj3G54jgXen4d3NsTjat8NiLrw5VvhIobUbNSbDv+Uz7tkyliTkPQEXph9mPhHQc
	mBfmMzVlrUblLXS+VmJCUoYPYl5FQXQiO+wKijKXE9cdsuXsWzbzYPkVyD/sa9U26l6c
	GXpQ==
MIME-Version: 1.0
X-Received: by 10.28.177.10 with SMTP id a10mr891506wmf.4.1450136828431; Mon,
	14 Dec 2015 15:47:08 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Mon, 14 Dec 2015 15:47:08 -0800 (PST)
In-Reply-To: <1449184196-21113-2-git-send-email-juro.bystricky@intel.com>
References: <1449184196-21113-1-git-send-email-juro.bystricky@intel.com>
	<1449184196-21113-2-git-send-email-juro.bystricky@intel.com>
Date: Mon, 14 Dec 2015 15:47:08 -0800
Message-ID: <CAJ86T=UbLswt_z286cNq87N7ft92m_XXiDfNG1yL4tH=5Gx3Dg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oe-buildenv-internal: preserve existing BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Mon, 14 Dec 2015 23:47:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 3, 2015 at 3:09 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
> According to the BitBake User Manual the environment variable BB_ENV_EXTRAWHITE
> specifies an additional set of variables to allow through (whitelist) from the
> external environment into BitBake's datastore. However, running:
>
>   $ source oe-init-build-env build-name
>
> will overwrite any pre-existing BB_ENV_EXTRAWHITE variables.
> This patch modifies this behaviour: all oe-build-internal BB_ENV_EXTRAWHITE
> variables are appended to any potentially already existing BB_ENV_EXTRAWHITE
> variables. (The variables are only appended if not already in BB_ENV_EXTRAWHITE)
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  scripts/oe-buildenv-internal | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 9ed2721..51e449a 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -102,8 +102,12 @@ unset BITBAKEDIR NEWPATHS
>  # Used by the runqemu script
>  export BUILDDIR
>  export PATH
> -export BB_ENV_EXTRAWHITE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
> +
> +BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
>  HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
>  all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
>  SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
>  SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
> +
> +echo "$BB_ENV_EXTRAWHITE" | grep -q "${BB_ENV_EXTRAWHITE_OE}"
> +[ $? != 0 ] && export BB_ENV_EXTRAWHITE="${BB_ENV_EXTRAWHITE_OE} $BB_ENV_EXTRAWHITE"

If ${BB_ENV_EXTRAWHITE_OE} is found in ${BB_ENV_EXTRAWHITE} (e.g. if
oe-init-build-env is re-run from a shell where it has already been run
before), then this change cause oe-buildenv-internal to exit with a
non-zero status, which will prevent oe-init-build-env from calling
oe-setup-builddir or cd'ing to ${BUILDDIR}. Is that really the
intention? It breaks my typical work flow...


> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

