Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6152E72F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 22:05:49 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y192so12600755pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iPGUFwI0QR/oDQKPEZAnq7LTSm2SzLQuYb3hyu8e+uU=;
	b=WKbVZ8MK+164IsULYohH0REG03puQ9rzGBQ1repRSyRQBWUrpYfclZLP81TBYuvcmF
	UnwxalRhXWM+0xtGBVCP0lVoiZMWxD+2NM0a4TJmGUir4eK42BWJqgxpg2AmJ06xGtbg
	7cNurqF54JmTow4Ocir4+JGjCTK2ctCTL3PFcxb2cyxFy0k+qyNG9mPQpaNOJDs06TbW
	cKLYLCSc/uMklaLvizFje9MzO5JcyE+CvtZxACbuNVyKI9qnuOwBITIWCphkl5tPe6xN
	3R1JObaqAOeAt00eMGF0nnZ4VS7WCsGyn7L92fkSWJ9MEciOamgdBlWcqUlhOXK4ltMX
	65YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iPGUFwI0QR/oDQKPEZAnq7LTSm2SzLQuYb3hyu8e+uU=;
	b=W3YAWQJoA1OKWJNIETvMa5Cqztnf9KBOO79MlVmlRkwWXlwmCqaKQxXtPc+4bYBn4f
	fN+6TG1AK5nraStYTxbFYqmbTjadIbrskDzAFnO86mwpxJS64gt+IAUXJuP5MoxqsJT9
	UzLk9pkH3TQl4EK1HQZtMHGIt88d4oIX321k2EVUxx6CSaWylcHVEFweGvSGf2Y8m7+X
	CFNHCcVC/7SFCtlixtv2mVV9Dm/gz5fxcIVAzbMhEa5SqCsXX1gyMJxjN71+cqJxRh/y
	ZgV7vXFRoe43bO4KRmNMJNWMJNSYCBbT4JNSxUcZI4mmMJmbAYntb+agq8ALy4xVK3Yw
	CHlA==
X-Gm-Message-State: AHYfb5hoYcOFmjeRMAtwQwStZ4K/HaXfP4bejWjs9633lYuoH9XbAMqH
	InTzr5twpMi/u68wD6UlonhuxHKw+A==
X-Received: by 10.98.152.155 with SMTP id d27mr26050647pfk.245.1502748351477; 
	Mon, 14 Aug 2017 15:05:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 14 Aug 2017 15:05:21 -0700 (PDT)
In-Reply-To: <1502706437-5377-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1502706437-5377-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2017 15:05:21 -0700
Message-ID: <CAMKF1sotYKOYbmh_T0d=mBLAqikBYgdgqMEmL7s7r3irDnmsKg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] site/ix86-common: Drop ac_cv_sizeof_ino_t as it can be incorrect with large file support
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
X-List-Received-Date: Mon, 14 Aug 2017 22:05:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 14, 2017 at 3:27 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Depending on whether large file support is enabled, the size of ino_t can
> be 4 or 8 on 32 bit x86. Drop the value from the site cache and allow the
> system to vary it depending on configuration. Very few other arches actually set
> this so its likely obsolete and doesn't need to be hardcoded anymore.
>
> Also drop the 64 bit and x32 variants since autodetection of this value appears
> to work fine and this avoids any confusion or sizing errors depending on large
> file support.
>

IIRC apr was one package where it poked for determining this value and
used runtime test which obviously will be wrong during cross compilation.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/site/ix86-common  | 1 -
>  meta/site/x32-linux    | 1 -
>  meta/site/x86_64-linux | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/meta/site/ix86-common b/meta/site/ix86-common
> index f4cf0b8..4fbf58c 100644
> --- a/meta/site/ix86-common
> +++ b/meta/site/ix86-common
> @@ -19,7 +19,6 @@ ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
>  ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
>  ac_cv_sizeof_uid_t=${ac_cv_sizeof_uid_t=4}
>  ac_cv_sizeof_gid_t=${ac_cv_sizeof_gid_t=4}
> -ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=4}
>  ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
>  ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
>  ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
> diff --git a/meta/site/x32-linux b/meta/site/x32-linux
> index 308d6e2..4b70422 100644
> --- a/meta/site/x32-linux
> +++ b/meta/site/x32-linux
> @@ -1,6 +1,5 @@
>  # general
>  ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
> -ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
>  ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
>  ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
>  ac_cv_alignof_double=8
> diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
> index ebdcf69..778e2c5 100644
> --- a/meta/site/x86_64-linux
> +++ b/meta/site/x86_64-linux
> @@ -24,7 +24,6 @@ ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
>  ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
>  ac_cv_sizeof_uid_t=${ac_cv_sizeof_uid_t=4}
>  ac_cv_sizeof_gid_t=${ac_cv_sizeof_gid_t=4}
> -ac_cv_sizeof_ino_t=${ac_cv_sizeof_ino_t=8}
>  ac_cv_sizeof_dev_t=${ac_cv_sizeof_dev_t=8}
>  ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
>  ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

