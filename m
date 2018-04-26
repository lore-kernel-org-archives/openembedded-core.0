Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA1D671A9D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 10:46:08 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 19-v6so23152735itw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=oGDWHUl5A02VSPCbAeWa51r4bF0cJ8HG+Cz0fmvmfE0=;
	b=HaPyCb/ig34JEbyRjb4TIfrvcmrWfTmb7icHTjbGIwuReWiUafie7Ev/hrjjkgve9E
	2khLoTCIdYZ8v1PvhCgvgK1BmQ8p3oP/CCUOO1vsrGCYn1VtiDpcxupRNPrl43m/4uWF
	0au9KREA0nFcZLX2i87TZ1W6/K2hPHtLyUHHo481MwO+Y/Js7t347v0JXvCFdGZKHsUt
	StQxfZ3XM41HrNvyr/rvanJntX6gO6FhFSVj7TD3SdpQ2HuHxKzn5vR0743f2DCDKKGI
	E/z+3fA1l+lzdD7zVbpAq9PzltBvheVxHaAd8DMBxxxpYKFkt2L/VvjWz2A3Z5GWsxV6
	xJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=oGDWHUl5A02VSPCbAeWa51r4bF0cJ8HG+Cz0fmvmfE0=;
	b=Y8/tHSsJgQkdPROZ1PgXk8bqQIPk+kQh5rRduKNberVNQFB1sig9KXjY86G19CTyXk
	buZL56XAzGb/+R4gfeIp6EJUsv1t0shZPms8P/3BInCQcJj9+uwjMvz4a2Uww5RnKq+q
	qKR7w+MT5UcUinYwf/xSC38kl7iVkQJLtBFm/SxfVVTKo9O8NY7UST793cPDc58wX9oZ
	t/qtwGHCXvCuJNl7uJlPi4OFGiyJ9q0JXaY+EjFETd2puPml1hHd57UHudKEM9/QmKEa
	ikW5fRr9ehO5ptA9r4GWeRKRSPESdG91Wp1XvifG0kZvFCVQyPxqO0jI4fuxc9RX+Frk
	2k9Q==
X-Gm-Message-State: ALQs6tDhM2gCzenZktMkSTsKcQjwRfS5trzw/doB6MNhRt2Tp/Y6WYkB
	pMxtAfAXcq+jGiU6Xkdi5SVF/jxqFVYGT4rJmj0swA==
X-Google-Smtp-Source: AIpwx4+cXmDSs6rkydPblqfrR7f3e4tGXcy1uhCGUz+alIM3LEDYQuYUYQDJwFHlnAQsEO45Vq1Bxo+5wkgdQuS06UA=
X-Received: by 2002:a24:730e:: with SMTP id
	y14-v6mr27992279itb.45.1524739568997; 
	Thu, 26 Apr 2018 03:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Thu, 26 Apr 2018 03:45:48 -0700 (PDT)
In-Reply-To: <20180425135818.23345-1-ross.burton@intel.com>
References: <20180425135818.23345-1-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Apr 2018 11:45:48 +0100
Message-ID: <CAJTo0LZ234RVEsXyUooFAzoGx+WxyxipSMMfxGqVcev5xBYjuw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base: improve do_unpack[cleandirs] logic
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
X-List-Received-Date: Thu, 26 Apr 2018 10:46:08 -0000
Content-Type: text/plain; charset="UTF-8"

Retracting this, doesn't work on a clean build dir.

Ross

On 25 April 2018 at 14:58, Ross Burton <ross.burton@intel.com> wrote:
> If a recipe sets S to ${WORKDIR}/ then the S != WORKDIR test doesn't work as
> expected.  Use os.path.samefile() instead of string comparisons to do the right
> thing.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index bb1f4b75336..7ddf70414a1 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -152,7 +152,7 @@ python base_do_fetch() {
>  addtask unpack after do_fetch
>  do_unpack[dirs] = "${WORKDIR}"
>
> -do_unpack[cleandirs] = "${@d.getVar('S') if d.getVar('S') != d.getVar('WORKDIR') else os.path.join('${S}', 'patches')}"
> +do_unpack[cleandirs] = "${@os.path.join('${S}', 'patches') if os.path.samefile(d.getVar('S'), d.getVar('WORKDIR')) else d.getVar('S')}"
>
>  python base_do_unpack() {
>      src_uri = (d.getVar('SRC_URI') or "").split()
> --
> 2.11.0
>

