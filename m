Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.2752.1587632079846502465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 01:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b6XOB5NT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 188so5539692wmc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=H4lxqPEpG2BBBQvXb8qBYNrUO02kXD64afFQgVLawv0=;
        b=b6XOB5NTQo9Nw3sGoIzuOLYv5eYSHVYhJMigZfx1qspLa4QSu0EOwcWWttKPyYwZj5
         c3MnYCCfRekQ88ZbBhvx2rFME/nnopGrSuOWP7F3uTgk+XNANHJSgFXmZlVjegm1KXQH
         ALDkDmfNcpdaN67/qnI6dCKJu1RwV2WDB+AGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=H4lxqPEpG2BBBQvXb8qBYNrUO02kXD64afFQgVLawv0=;
        b=hFoLr8TWTHEvtx4LjVPi6yioD2IQprkbfx7q9kjD09yNf0vQIauQLmNmNvyMb/8lR1
         1OLcoa8KI6bfEgeIgKTJL8r8DBA/9T7WJhhkPtI8pR1o6DnyACINbdUdcoyAsYZJywid
         /PJuDQTqn4wi1uhil1fzf1w+PWENeDhDIgTQroaRefkTYQIoblDHf5NmXEYe1kZM8H1j
         KHGAoInMgAPFTt0zeuH4S7vUhZIsNl6vuwiaEQH2mUVPNL4526t0zMcam00v6QPv9Op3
         /RToXyxCtcnhEtLbZj0mJrA6ii8xxoszMgLIhhCl/rjzMpFxitcb9wXUh6T5NZ+BohGR
         9qhw==
X-Gm-Message-State: AGi0PuYOZc+ZmEE6MkNBjllvLLz3msuvY2mREL+jRE+FETFmTa2ZnhnJ
	0PbcKfCOBsSjBn+TbLe96njbwg==
X-Google-Smtp-Source: APiQypK6gRXdJCja0WLDb0W+LVXVCL2CyK4OIAQdY+xZoqjTEN2Y9ovq57KKCmAnmJ0WFW5VIPUOQw==
X-Received: by 2002:a1c:9c15:: with SMTP id f21mr2992874wme.139.1587632078149;
        Thu, 23 Apr 2020 01:54:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y5sm2921424wru.15.2020.04.23.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 01:54:37 -0700 (PDT)
Message-ID: <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda <ricardo.ribalda@gmail.com>, openembedded-core
 <openembedded-core@lists.openembedded.org>, Paul Barker
 <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Thu, 23 Apr 2020 09:54:36 +0100
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-19 at 08:35 +0200, Ricardo Ribalda wrote:
> 
> Changelog v6->v7 (Thanks Paul):
>   - Use passwd instead of shadow for oetests
>   - For pseudo folder inside workdir
>   - Improve comments on tar
>   - Use line number on tar name
>   - Allow include-files of files in workdir
> 
> Changelog v5->v6:
>   - Allow two arguments to include-path
>   - Fix permission on include-path
>   - exec_native with ASSUME_PROVIDED
>   - More unittesting
> 
> Changelog v4->v5:
>   - Add unittesting
>   - wic: Avoid creating invalid pseudo directory
> 
> Ricardo Ribalda Delgado (10):
>   wic: Fix permissions when using exclude or include path
>   wic: Fix multi images .wks with bitbake
>   wic: Add --change-directory argument
>   wic: Continue if excluded_path does not exist
>   wic: Avoid creating invalid pseudo directory
>   oeqa: wic: Add tests for permissions and change-directory
>   wic: misc: Do not find for executables in ALREADY_PROVIDED
>   wic: root: Add an opt. destination on include-path
>   wic: rootfs: Combine path_validation in one function
>   oeqa: wic: Add more tests for include_path

I did run this through the autobuilder along with other changes and
there were 5 oe-selftest failures for wic:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/858
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/855
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/861
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/849

Cheers,

Richard

