Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id B3EE878150
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 18:31:05 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id m7so431877wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p0zeC+eB8iG1NRmVEFjAf3oTiwIKxK5xDlfiNqzf1h8=;
	b=Ftq5a/q4AbA6RRpzU+CfMU/q6Dq/TfDLIIw++nlxZ0C0O+KShprTlMLMn+cF4agWc3
	pn3m6xUXyFERFPjt3/htnxonvqFT9ga/Xjf+ST62eCZlRtek+/F+5Jbgijno5ccxOiFQ
	BOHAE0Efzt1lAXFMlnX7nT17n63+IsXzK/6fdOWM04N3ENF/Wv+6A/wkWDunezYGIdIb
	q/40ad1p+xSd+sI8LZ5LGtw+WxKwn7ItaN5CKEenIDoHlFzAZUmsRVyHSapeI28HYnm8
	CFH962jLWKwqnjn/fb1GnW5BtAZQUNO2Ehr8ZCLhA+lK8v2S4GxNOvVu30Hg0VhGAl1x
	Ghag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p0zeC+eB8iG1NRmVEFjAf3oTiwIKxK5xDlfiNqzf1h8=;
	b=bQcHkUMoiSM/Cs/UBqFXTYx2v1ADS5/LszriRRA87RfyDc0+WLYYl4VuPxVGzZlJ6W
	+HMu929lKFrD5eawIk6nMVOkB2W+m4eTIOX+NkKvcHhBADkSxdsL4LQ7f9FEiBwN4CYY
	pJMCGh8EQVpdVxp5pQr7MkoSUSxEgaoTvKc+/L6bMfF1A8TpLxkKV5bkxwmseuyA+hpj
	GzzecAw+8c522d13draj0SCDnI2Wu4hoPPgsyfCjrWTvxfsTarNPmuNo0vFEj62Dp/i6
	SNxSkKfYvF4r0dtFzd4Vq1L8AozdjnP1vw4JP58/1vBkHFAKvk1GhTnuSYCS7gohSqji
	roLQ==
X-Gm-Message-State: AODbwcDKU4gIwIML2SwUiJ7fqZfdfN2TLyoQBpWCKOjhi1sKYKva82Gj
	KllWLdOFG/m9FSfTJzR9qIXlG3q8HA==
X-Received: by 10.223.170.67 with SMTP id q3mr29346675wrd.19.1495737066107;
	Thu, 25 May 2017 11:31:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.18 with HTTP; Thu, 25 May 2017 11:31:05 -0700 (PDT)
In-Reply-To: <1495678712-44204-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495678712-44204-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 25 May 2017 11:31:05 -0700
Message-ID: <CAJ86T=W++TQhRcupbLoACVLTEmEzZRmQUaYZqFFh23+Zwq6X4w@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: fix libssl error for ARMv8
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
X-List-Received-Date: Thu, 25 May 2017 18:31:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 24, 2017 at 7:18 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> curl + gnutls can not work on ARMv8 32BE, so change it to curl + ssl when the target is aarch64.
>
> The error is as follow:
> curl: (35) gnutls_handshake() failed: Bad record MAC

Googling for that error message brings up the following thread, which
isn't very conclusive but suggests the root cause is the server
configuration:

  https://lists.gnu.org/archive/html/help-gnutls/2013-01/threads.html#00006

Have you confirmed that curl + gnutls built for targets other than
ARMv8 32BE and aarch64 works OK with your server?

> When set machine to qemuarm64 in local.conf, this patch will work.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-support/curl/curl_7.54.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_7.54.0.bb b/meta/recipes-support/curl/curl_7.54.0.bb
> index ce5ca37..7421617 100644
> --- a/meta/recipes-support/curl/curl_7.54.0.bb
> +++ b/meta/recipes-support/curl/curl_7.54.0.bb
> @@ -21,6 +21,7 @@ CVE_PRODUCT = "libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy zlib"
> +PACKAGECONFIG_aarch64 ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl proxy zlib"
>  PACKAGECONFIG_class-native = "ipv6 proxy ssl zlib"
>  PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl zlib"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

