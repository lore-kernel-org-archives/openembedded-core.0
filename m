Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67ECCDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 17:17:21 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16942.1782407833244723836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 10:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JwedVA+Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80814edb536so2131777b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 10:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782407832; cv=none;
        d=google.com; s=arc-20260327;
        b=h9Q35co+P/kyWQaZzV30wRpLAgDLF/S/ato+d6LGP5CeJyfTJQ4Fx3wjD7Z+Cb0P3Y
         Wga0dRs2c9skp5I+/rlPZH3ObPl4oh1/JDciu/XF8qufKYqSpEAwhoWY5zsfF0N+zJs+
         nCClBycNRgxGVmYZtkI0BsOTcX/gpEMYPRwK1eV7mKccmto1l9sTltFHB4uSlxs+XNWc
         uUMf/a2OTEwhk90FC3CehTlbjlKKwAQl4Hw1r1R1AU88bwsrzPXVlZuEu4mqM6P0nU7U
         TP2dUw6/3Sa8MkJBEMjLWwvmv0cbFeNCoNay95k6do3ZmJo//K3vMXVn0CtdpAxd3dZO
         fyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4LqB74FB2C9eJssoOjzR3gXP7zZnlzPayshHENBt6eQ=;
        fh=ZalfJJupMFrxQVhj5GRLYKJMovrtmUeW+W5saYyPgHU=;
        b=N4FobYbBYMXGXIq7lDOmcAbLu98aeOEIqTN/XcqftZxiHSocVK13JpbOnZdNQ6tSq7
         t3qqosVIM7SM/29FLXSMnN1I99iwRVCoee2UNcw8Q0l5k364ZxStgcBOe/+xKI86p+Zu
         ApvMlNGryPz53H9W9rmNNb0ROckLJ7YC1mMVGJZ7heqzljBGfRcZqgHwowlzmqpxkAgE
         Ien3GfX6JlhWbV6VhWfiTnCLN/nfOISDhtbx3a02iH3oNbDKHXiIXGbsW52bLqVa9EzC
         GZwW9TYS5hcHgAokIW0+vMALOM034oXiWU89k7TZZqBGYMOw13HuU1QDlG4vfEQPlCo7
         +I9g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782407832; x=1783012632; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4LqB74FB2C9eJssoOjzR3gXP7zZnlzPayshHENBt6eQ=;
        b=JwedVA+YD6Hjm9A9su7S/Y4Os/uu7sG+T9nr9X/8LjKqsbxUH3qjC/n397B/kh/zsN
         W9eObG9eeB2J0U0UfzJ7IxZ53Frq6hyuw7q0WAEZNwmUpxLOPDactCjLChZt4jwq1BCF
         vYLhV9v9q5HYwUKwLXZHQAKPx4qR2SN0I8gNJLImj47WPcRfMMSa6k1aFhWk5QTSzMAv
         pqqIN+STANw92qVxjHS0F7dZ8DQn1fQfdnDtKtiREqY03XRZvkbgGBfG0TWRFqfpo1vd
         porrmykF19mSqcghy5DzUOHGXCDedWbEX/XJE4sSuBQ5xDWE4t8SPeFrj/1iUVVuDyaI
         Gpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782407832; x=1783012632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LqB74FB2C9eJssoOjzR3gXP7zZnlzPayshHENBt6eQ=;
        b=msD/F7Tf9JOrhT7oGT74Pgt2sE7NMi5Jw52YaCCqzP7pIpjyyt9mCgFrxXYizAzk+7
         NJFl5m4B8S2Ysyb93E1fXlTs37/HPRPtKx52m+Tek52/U1jh1FMlu5wtQPGpYhw+uWla
         0zY9SZtGWhU9GE7e6gxnoOoSrv98g8co+TnKYQoDeaTOA775P66v+0iBDLWOMXgykHw7
         2m1m3bkPQ/waylBBDqAMVPwuCuGWzT3sBAGHalHu6b5swvEUGjeDducpW2XT3sRA0CLw
         CALscMTrBUkNcF6Vp7/YfNAzmFJtc9UGQCe/F9UxdYAwEhkMH4xL7cJ/UbOncaijbj+/
         yJ2w==
X-Gm-Message-State: AOJu0Yx1pfkPSS8X5tYaiw0oOgKvs3D/KC+NNHbgcQjfOuWmiBiCgz4J
	f8gMJ5sA+PNopugFIeiirf600+R8juAYinIls6bgZ+rQYac/HAOuogjscxeB72hyrLleY+XqWKw
	VJBjRc73ZRAA63+J+/qclxyAgttP8Up0=
X-Gm-Gg: AfdE7cnW/hqTg0GSXeJO03JQ17GeJBUIkyHsyZkx5SwRR89YjY6fug3s8XIkcBEXv5X
	7TCBo0nDZR/n6absMGnC/H4I1oeR8ZePhXVmXVIvHoTll/pMLx3U2iEeL3vZDH+OOCAyp+vzU39
	mfDgysrL1GFHkC03MQkZs1NfeOzZkbB2ltTjRipHE4gJHOjrl6DX9QLB5wZIf6AUO1sVGLD6Zya
	0d87l8cgN+Pp8BBmqe+jP1q9aEi+xV2R4CBezMrY9MJBYIQ3RkjtOzLOFCis9pWntl2Q9Xn4A==
X-Received: by 2002:a05:690c:c4d3:b0:7bf:ff7:ea6e with SMTP id
 00721157ae682-80a6a5a97a1mr34756127b3.4.1782407832040; Thu, 25 Jun 2026
 10:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260625092726.35752-1-jaipaul.cheernam@est.tech>
 <20260625170620.81300-1-jaipaul.cheernam@est.tech> <20260625170620.81300-3-jaipaul.cheernam@est.tech>
In-Reply-To: <20260625170620.81300-3-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 19:17:01 +0200
X-Gm-Features: AVVi8CfErzgHV8prsfj3H0USdRKpvwsn4de1jegAFjR7Z40sY6pVGtLpTneNNf0
Message-ID: <CANNYZj-cZS=gHjEbga=M+BVBxeX0c_N0QC=hVQtuO5JVnBv0EQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] install-buildtools: add --local-file option
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org, 
	Daniel Turull <daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 17:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239586

Thanks, this looks good.

Alex

On Thu, 25 Jun 2026 at 19:06, Jaipaul Cheernam via
lists.openembedded.org
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:
>
> Add --local-file so that bitbake-setup (or any other caller that
> already fetched and verified the installer) can pass a local path
> directly without re-downloading.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  scripts/install-buildtools | 40 +++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index b438d7a359..4e6f6e25d7 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -176,6 +176,10 @@ def main():
>          description="Buildtools installation helper",
>          add_help=False,
>          formatter_class=argparse.RawTextHelpFormatter)
> +    parser.add_argument('--local-file',
> +                        help='path to a pre-downloaded buildtools installer file.\n'
> +                             'Cannot be combined with --url or --filename.',
> +                        action='store')
>      parser.add_argument('-u', '--url',
>                          help='URL from where to fetch buildtools SDK installer, not '
>                               'including filename (optional)\n'
> @@ -289,21 +293,35 @@ def main():
>      os.makedirs(sdk_dir, exist_ok=True)
>      try:
>          # Fetch installer
> -        tmpbuildtools = fetch_buildtools(buildtools_url, filename, sdk_dir, args.check)
> -        if tmpbuildtools is None:
> -            return 1
> -
> -        # Make installer executable
> -        logger.info("Making installer executable")
> -        st = os.stat(tmpbuildtools)
> -        os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
> -        logger.debug(os.stat(tmpbuildtools))
> +        if args.local_file:
> +            if args.url or args.filename:
> +                parser.error("--local-file cannot be combined with --url or --filename")
> +            tmpbuildtools = os.path.abspath(args.local_file)
> +            if not os.path.exists(tmpbuildtools):
> +                logger.error("Local file not found: %s" % tmpbuildtools)
> +                return 1
> +            filename = os.path.basename(tmpbuildtools)
> +        else:
> +            tmpbuildtools = fetch_buildtools(buildtools_url, filename, sdk_dir, args.check)
> +            if tmpbuildtools is None:
> +                return 1
> +
> +        # Run installer
> +        if args.local_file:
> +            # Avoid mutating caller-owned file; invoke via /bin/sh instead
> +            cmd = ["/bin/sh", tmpbuildtools]
> +        else:
> +            logger.info("Making installer executable")
> +            st = os.stat(tmpbuildtools)
> +            os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
> +            logger.debug(os.stat(tmpbuildtools))
> +            cmd = [tmpbuildtools]
>          if args.directory:
>              install_dir = os.path.abspath(args.directory)
> -            ret = subprocess.call([tmpbuildtools, "-d", install_dir, "-y"])
> +            ret = subprocess.call(cmd + ["-d", install_dir, "-y"])
>          else:
>              install_dir = "/opt/poky/%s" % args.installer_version
> -            ret = subprocess.call([tmpbuildtools, "-y"])
> +            ret = subprocess.call(cmd + ["-y"])
>          if ret != 0:
>              logger.error("Could not run buildtools installer")
>              return ret
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239584): https://lists.openembedded.org/g/openembedded-core/message/239584
> Mute This Topic: https://lists.openembedded.org/mt/119977011/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

