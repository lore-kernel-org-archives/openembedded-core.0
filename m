Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D1E5177A34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 00:33:55 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l37so7752498wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 17:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LdjJxKuaONh51gmuNXT0yxUs33zr8ixp3FbfdGzxr/I=;
	b=VUbh4o/9MFF1fmCD+e1xrkoBE6nLcDZhQ3P0QzEbem/2X8V6KByZImLRybVd19sUBm
	AQQDt+oqaTCAncWykIr4POYg2QPZXFQTCq+F1bARAizGGZyyxP/WZyd0RU+aFQznflE2
	xuXtIa/d6a4AL90OHCSkdPyAAi8V+YugfFb5q9V/scU8U9tX7ImMnqNV1MHfUQjB8iHk
	IAHxKm9NaT+QDPGAnuJnAhjhV0GHJDIDfp7NiBDqPpI5Zol4yepa00s08BUag1B4z67K
	9fJWqUleHxhe10oMuScA03dEV1vBixfMy7b0+orBDWVZmWZR+jua6HIYf7qqHzsjpy3h
	l5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LdjJxKuaONh51gmuNXT0yxUs33zr8ixp3FbfdGzxr/I=;
	b=ZjHZq4Xfp6wwEgYfx7/9lr4Px8MeVZAqb7GKTi8tZn3QsAjVAPgkPF+hAMf8g2bAFo
	e1DEiIsJIeYWRHhnt3VItvls+REoL8m7ggEZszAjbi2RoNG2asWjUV8amoqwzOZp8Myv
	scC2niXILP1zJgzDF5mJ879ZcfleBP82TdGolA0l9YPEkZuxhxQQ89hFEQm00Qd8j2/t
	DovAGj1dF7GFtdNAejb8yA+C1sT1KOH+322jWf+z8XLwQbVNQw69hfbIUyXMFlHpLvGK
	4KnnIcjpHlNe6R037ZeJWW1s4LD83V3CPbdZ5EV0Hir/QLBQFQ736I0zCDcqxlqf4Tjd
	M9Fw==
X-Gm-Message-State: AFeK/H0rCr99qREUBP1jFeXXv70qDgoy/Iobo82NzoDsK5OvFIEv+5jwD85kjhQx/9H/pip8EUIHkqzajOpzMA==
X-Received: by 10.223.182.133 with SMTP id j5mr11636818wre.19.1489710836901;
	Thu, 16 Mar 2017 17:33:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.179.24 with HTTP; Thu, 16 Mar 2017 17:33:56 -0700 (PDT)
In-Reply-To: <1489195879-5397-1-git-send-email-armccurdy@gmail.com>
References: <1489195879-5397-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Mar 2017 17:33:56 -0700
Message-ID: <CAJ86T=XxS98V33zVhyhzVH4=hHBZHjA5Jnjpc6cp_-SJANnmzA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] feature-arm-thumb.inc: fix ARM_THUMB_SUFFIX for armv8
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
X-List-Received-Date: Fri, 17 Mar 2017 00:33:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 10, 2017 at 5:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> The current definition for ARM_THUMB_SUFFIX doesn't consider armv8
> and will therefore cause TUNE_PKGARCH to be set incorrectly for
> machines which inherit arch-armv8 and don't include aarch64 in
> TUNE_FEATURES (ie when building for 32bit ARMv8).
>
> Also fix typo in comments and improve TUNEVALID[thumb] wording.

Ping.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index 6d4747b..0b47cca 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -1,17 +1,14 @@
> -TUNEVALID[thumb] = "Use thumb instructions instead of ARM"
> -ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET') == 'thumb']}"
> -ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4',  't',  '', d)}"
> -ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5',  't',  '', d)}"
> -ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d)}"
> -ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}"
> -ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}"
> -ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 't2', '', d)}"
> -ARM_THUMB_SUFFIX .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 't2', '', d)}"
> +
> +TUNEVALID[thumb] = "Support Thumb instructions"
> +
> +ARM_THUMB_SUFFIX = "${@bb.utils.contains_any('TUNE_FEATURES', 'armv4 armv5 armv6', 't', 't2', d)}"
>
>  # If the device supports ARM, then respect ARM_THUMB_OPT (which can be "arm" or "thumb")
> -# If the defice doesn't support ARM, then always set "thumb" even when
> +# If the device doesn't support ARM, then always set "thumb" even when
>  # some recipe explicitly sets ARM_INSTRUCTION_SET to "arm"
> +ARM_THUMB_OPT = "${@['arm', 'thumb'][d.getVar('ARM_INSTRUCTION_SET') == 'thumb']}"
>  ARM_M_OPT = "${@bb.utils.contains('TUNE_FEATURES', 'arm', '${ARM_THUMB_OPT}', 'thumb', d)}"
> +
>  python () {
>      if bb.utils.contains('TUNE_FEATURES', 'thumb', False, True, d):
>          return
> --
> 1.9.1
>

