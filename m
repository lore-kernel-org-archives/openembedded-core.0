Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ECDC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 21:24:12 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.504.1643923451310183463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ND6In9cw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id c192so3070266wma.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VemclcWJQUXt3Pr951GLqbqEiI+zMk8GQaXk9Q/s028=;
        b=ND6In9cwiuJZVb9bucxvcRtfcJAuU5XuUF5Ohcvss3XlJ0G9ElhJ4jjuOVdCvNZM2p
         Ko8nt6xlpiKDYG32+YzJOXj4ceqNCW3/3N5z4dsmrZlJV4PI/Pu6J4XPTv9MCE4lz6ag
         6JXFz/VNKeAJQ2hRsPYAkyiK/sSpyqpp0eQiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VemclcWJQUXt3Pr951GLqbqEiI+zMk8GQaXk9Q/s028=;
        b=trAAsJbpydQdJmf9kFflwZA4pgAo5wMOXn/nuyZmqf82mK6Q2PCxM8bFSaSrnvr+0L
         bFdYZwaNWk4nNNSJh3zee4cLAP2QC+gu0St2W1jQ5tXUK5hYppe/2cbWTfZJdANP0PYE
         GpMh83xa90QFyfsEraPCsCuid1fmec/ctj1/vtFWdJJHR2KjzoP6zEpaVepFgPMbvH8h
         O+fGFb7tUinqb8fJQ3pdjYfzNe5kOekZyqHT09g7BvICJlHj9LnArF4nT6m5BzV+0G4U
         slRpGHXGuxj8eM/8gj9SEF9eR5xTVvRgfwmh/1ROQZ+vmY9qtUuj+YTFpLQ8n+049sC5
         S28w==
X-Gm-Message-State: AOAM532RIekyJL08O+vyIMXZRx/FFx1H/Z0Mniv//kA3qHdUj1z9TSRw
	SjIrrrylmJxRl1vCrw9/TUwEyw==
X-Google-Smtp-Source: 
 ABdhPJxc2mzE1ycH846Xprq1dDaGK9Tk6GoshLm8TjzEdZI+oJxS8HZ27kyQynn74Wvg9JUu4hwT3A==
X-Received: by 2002:a05:600c:3d8c:: with SMTP id
 bi12mr11942853wmb.109.1643923449825;
        Thu, 03 Feb 2022 13:24:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7818:26e5:4f1b:504a?
 ([2001:8b0:aba:5f3c:7818:26e5:4f1b:504a])
        by smtp.gmail.com with ESMTPSA id
 d6sm20763512wrs.85.2022.02.03.13.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 13:24:09 -0800 (PST)
Message-ID: 
 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] recipetool/create: Scan for
 SDPX-License-Identifier
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org, ticotimo@gmail.com
Date: Thu, 03 Feb 2022 21:24:08 +0000
In-Reply-To: <20220203170724.1319808-1-saul.wold@windriver.com>
References: <20220203170724.1319808-1-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 21:24:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161318

On Thu, 2022-02-03 at 09:07 -0800, Saul Wold wrote:
> When a file can not be identified by checksum and they contain an SPDX
> License-Identifier tag, use it as the found license.
> 
> [YOCTO #14529]
> 
> Tested with LICENSE files that contain 1 or more SPDX-License-Identifier tags
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  scripts/lib/recipetool/create.py | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> index 507a230511..9149c2d94f 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1221,14 +1221,20 @@ def guess_license(srctree, d):
>      for licfile in sorted(licfiles):
>          md5value = bb.utils.md5_file(licfile)
>          license = md5sums.get(md5value, None)
> +        license_list = []
>          if not license:
>              license, crunched_md5, lictext = crunch_license(licfile)
>              if lictext and not license:
> -                license = 'Unknown'
> -                logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
> -                    "and replace `Unknown` with the license:\n" \
> -                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
> -        if license:
> +                spdx_re = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
> +                license_list = re.findall(spdx_re, "\n".join(lictext))
> +                if not license_list:
> +                    license_list.append('Unknown')
> +                    logger.info("Please add the following line for '%s' to a 'lib/recipetool/licenses.csv' " \
> +                        "and replace `Unknown` with the license:\n" \
> +                        "%s,Unknown" % (os.path.relpath(licfile, srctree), md5value))
> +        else:
> +            license_list.append(license)
> +        for license in license_list:
>              licenses.append((license, os.path.relpath(licfile, srctree), md5value))
>  
>      # FIXME should we grab at least one source file with a license header and add that too?

I think to close this bug the code may need to go one step further and
effectively grep over the source tree. 

We'd probably want to list the value of any SPDX-License-Identifier: header
found in any of the source files for the user to then decide upon?

Or am I misunderstanding?

Cheers,

Richard






