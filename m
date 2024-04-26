Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE5FC4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 08:20:44 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.8862.1714119643365655864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 01:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=isbe70CR;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5171a529224so2251466e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 01:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714119641; x=1714724441; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMsUWxL6LReOoL/sEdMYR4gGUZeJOE0UdiJMaF1SKUQ=;
        b=isbe70CR6DANn44aaUNFlm28turEUSbV50U2RaxJFrr78T6fCvIi/8CkRJ4fmMVyIz
         Ss/39a6NWVQ97bEzJeAsDGYlKF2XVQMJ+qVcVnJe24F+nsQBVHhGjmBrodRs8+Y28yPg
         OQHRagwrNPzNX/CR4obUzkGiG+td1JMA/+HMNX89xqdYbJNhaKnRUD7arRvXjPCEO/OO
         2xCfCLS+JciNiogjnpnk+pd47TNKNJOvCpiSdrPB2JzOOBdrOsGywIHI92caCG6StEi8
         InfgLzIi63e8TR6lVDB5MdUpFibgDECK+vZQofuND9goq+3hvMsPMemsGD4rpvVufgxc
         StEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714119641; x=1714724441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMsUWxL6LReOoL/sEdMYR4gGUZeJOE0UdiJMaF1SKUQ=;
        b=hT5c9KvGHfXZGkCrgOt498oW0Lhglu6mLQNtMUUb85YfbDzX5EgTvsknFSZvEuve4S
         eUpGIkeY6ufeof8SvYzYQEvJByeHkcNWIlmF8AuCKwIdypXdt1MTOG7KQHVLRWHxReHh
         6K7eQoyOet1pDdfk7whPrulmM/lA5AB+zxrE/kRpdqxqT0LkciVYPhAIh4NcAjnM4s7J
         tDdPJG3DVjRFtOPCcbv32eEBwu0Uhvp0NZ5Vfdu1sytphAuSM7ID6OA/QM8gTEUvAcTv
         4p94CyVoke2oXNcIWHrgsn/ATAI13x+np2NesTdGG+l+YchD76Y9fc2IhjOZzEkqwkTa
         UAmA==
X-Gm-Message-State: AOJu0YwiaY4SaIreAWHrIEGV2fb9+EeE3vC6OYFOTgOfxFinCm63H252
	Mv/y04Z/K4qTxm0zbDq0JO8pPGb7M10kWWC8luZ2dHNcWvYcU+Q/5kPm/yN+k+RIymWLi2ZL/kw
	wzbb485pFnzod41l0qExiLA3CsDA=
X-Google-Smtp-Source: AGHT+IHuXgj+xSV0ZWP6oVNLBB8foN2eIjRqmoStk34vRypSdUGC6VQAr3Hb1TsSK6pPDp5MB0864LcPBrpaKn4wFVQ=
X-Received: by 2002:ac2:51bb:0:b0:515:bbe9:f208 with SMTP id
 f27-20020ac251bb000000b00515bbe9f208mr1002447lfk.19.1714119641015; Fri, 26
 Apr 2024 01:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240425154607.566716-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20240425154607.566716-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Apr 2024 10:20:29 +0200
Message-ID: <CANNYZj9Q+W3k=+0OZtNwZM0H1KvsfN+3xYL8NgzG+tJFPz6fLg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] oeqa/runtime/cases: new image_upgrade test
To: michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 08:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198713

On Thu, 25 Apr 2024 at 17:46, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
> +++ b/meta/lib/oeqa/runtime/cases/opkg_sysupgrade.py

This should perhaps go to meta-selftest/lib/oeqa/runtime/cases/ as it
needs special setup via selftest, and not useful in standalone '-c
testimage' runs.

> +    def test_image_upgrade(self):
> +        """
> +        Summary: Test that generated ipk packages can
> +        be used to upgrade an older image version.
> +        This is done by generating an image but then replacing it
> +        by an older image shared by the Yocto Project autobuilder.
> +        We then run QEMU on the old image and replace the original
> +        original package feeds by our own.
> +        """
> +
> +        image = 'core-image-full-cmdline'
> +        machine = get_bb_var("MACHINE")
> +
> +        features = 'DISTRO = "poky-altcfg"\n'
> +        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
> +        features += 'PACKAGE_CLASSES = "package_ipk"\n'
> +        features += 'IMAGE_CLASSES += "testimage"\n'
> +        features += 'TEST_SUITES="opkg_sysupgrade"\n'
> +        self.write_config(features)
> +
> +        # Need to build a full image to build the .json file needed by QEMU.
> +        # Therefore, it is not sufficient to run only "package_write_ipk" for the image.
> +
> +        self.logger.info("Generating '%s' and package index for latest commit in this branch..." % image)
> +        bitbake(image)
> +        bitbake('package-index')
> +
> +        # Download previously generated image
> +
> +        image_file = '%s-%s.rootfs.ext4' % (image, machine)
> +        image_path = '%s/tmp/deploy/images/%s/%s' % (self.builddir, machine, image_file)
> +        machine_variant = '-alt'
> +
> +        os.remove(image_path)
> +        image_url = get_latest_image_url(machine, machine_variant, image_file)
> +        self.logger.info("Downloading image: %s..." % image_url)
> +        cmd = 'wget -O %s %s' % (image_path, image_url)
> +        result = runCmd(cmd)
> +        self.assertEqual(0, result.status, cmd + ' returned a non 0 status: %s' % result.output)
> +
> +        # Now run the upgrade tests on the old image
> +
> +        self.logger.info("Running upgrade tests on the downloaded image, using the package feeds generated here...")
> +        bitbake(image + ' -c testimage')

RP perhaps already pointed out this, but this mashes together
parameters and implementation. Please split the implementation into
'non-opinionated' functions that take everything that can change via
arguments, and have a short and sweet top level test definition that
does something like this:

def test_poky_altcfg_cmdline_update(self):
   config = 'DISTRO=..., etc'
   imagelocation = find_yocto_image(...)
   run_update_test(config, imagelocation, ...)

As an example, CDN sstate tests are arranged similarly:
https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/sstatetests.py#n920

Then we can further improve this by defining those parameters
somewhere external, that's a separate decision.

Alex

