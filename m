Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.8225.1589522165746660835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 22:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PwnHvdz5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id d207so13004974wmd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 22:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UyONZfxfUYicVl6pZeRRR5SwFbsgeo36T/zV+PacBrc=;
        b=PwnHvdz5vL87CMvajwDkzhlAiu+tYi/ZxjoUg/XNTOKvE8JCBveCeES0cyOBGXT3HR
         s5FG87ZY+IaDcU7xFCnSddWe1os3cSOWIUttdAkakHA40Mr47V1HtC4kKPLJGqEmh7sG
         EafRqTsc8KjOg7YLUVwFEUcavUgQVurbREOq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UyONZfxfUYicVl6pZeRRR5SwFbsgeo36T/zV+PacBrc=;
        b=b/Y2jbF1kg9gl0ghN3IJs/rUXKTnCqCoptxz/l3lnvx3TfNi3s7Je+Nr31vmO0EhKa
         Fm/GqMXSROuqcimKjtm9SOStsaQ5pjcEvpwYGnP8tVtGfYexCa60e9tUjJxqO4h9H+W1
         1EvRUyVN9LHGP/Ez8Eu9slVysmxoDT6kBxQzvlZ9+8ZT9wOIbA3bLfT6KlAFYtCxHUOR
         AfCrKlg75yFGSaKjVmcO7J9uCmrfFJCJIEILMlnnNDEK099foEhtz1uk6QhYmQW4xmRo
         hV9c2Xw5v4dLLmdlSj2xbdvhXYNGqk0G2FAbxFYEV/JVHKLkV3+26v1gFmON4rI/O/6r
         puCA==
X-Gm-Message-State: AOAM533rOTJI6unPLYtu9TwtS3aGme/0y8eiUPKY2GGYgTtzICwgFScS
	/YM27hhS6jUjcVSX9DHDf5lmgQ==
X-Google-Smtp-Source: ABdhPJx6T1vFQVwiU90trwua3pbnp4fae2NcwLUuC5rMYW1LnZOoSMMJJG93Ch1mYg5xpN+VUTB/zQ==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr2069016wmb.116.1589522163534;
        Thu, 14 May 2020 22:56:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 2sm1941259wre.25.2020.05.14.22.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 22:56:02 -0700 (PDT)
Message-ID: <7fbf9d94860522944c8764760b717a0524bf20b5.camel@linuxfoundation.org>
Subject: Re: [meta-OE][PATCH v3] image.bbclass: deploy image artifacts in stages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
 Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org, Bartosz Golaszewski
	 <bgolaszewski@baylibre.com>
Date: Fri, 15 May 2020 06:56:01 +0100
In-Reply-To: <20200512140529.27606-1-brgl@bgdev.pl>
References: <20200512140529.27606-1-brgl@bgdev.pl>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 16:05 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> override. This way each generated set of artifacts is deployed as soon
> as it's ready instead of the do_image_complete task handling the entire
> deployement. This allows us to better fine-tune dependencies e.g. we
> can make do_image_wic depend on fitImage task which can in turn depend
> on do_image_ext4.
> 
> We need delete the IMGDEPLOYDIR variable from the data object passed
> to each image task so that it gets expanded with the correct override.
> 
> In order to make sure that tasks added to SSTATETASKS in anonymous python
> functions are correctly setup, move the code that assigns pre- and
> postfuncs to an event handler invoked on bb.event.RecipeTaskPreProcess
> in sstate.bbclass. This event is fired right after the anonymous
> functions.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> Changes since v2:
> - dropped the qemuboot patch (already upstream)
> - switched to % string formatting instead of using .format() for consistency

Thanks, I included this in automated testing and its shown a few
issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/943

"oe-selftest -r
sstatetests.SStateTests.test_sstate_nativelsbstring_same_hash " should
reproduce

I think multiconfig.MultiConfig.test_multiconfig and
multiconfig.MultiConfig.test_multiconfig are also related but its
harder to be sure.

package.PackageTests.test_gdb_hardlink_debug isn't related in there.
runqemu.RunqemuTests.test_boot_deploy_hddimg and
runqemu.RunqemuTests.test_boot_machine_iso could be, not sure.

Cheers,

Richard



