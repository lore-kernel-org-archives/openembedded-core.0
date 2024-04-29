Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C176C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:55:29 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.25078.1714406121710806600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 08:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HYe7tEe2;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so5525964e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714406120; x=1715010920; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wYdHZxO0BRt7dgpRNiCyfVAfabfi7oZLSCmF+401fHU=;
        b=HYe7tEe2NizSVq8iXGZQm2sc6BxXH167kpXj6dF2RIrSsoPJsyDFQ99q6CtcECHETj
         iUjA0VzcURuKRYoXI/jfb8C0TQCzVOjWuR6N1X0UJZjMheOKyN9gfN0zEuXlFn3eHhXs
         Q/q4+Y8KUcRg5AdBQw16K7Ot625EySJf7Tnj6jZBvwChN5n1GBGKFB+UIPP7kPfwSHq8
         3R47ooKW/6OsI1sYPAEwgllOkJcXapyAmR4a+1/o5A4avJJcq/e5q8jSKtw9HXz8tKZy
         KhNQAgjpkvZs+PFlO240ZDK8tOvUMCz7/8uj6DQrp8oOkmHjLcYnM2MYH7KfRF9KKUCU
         4Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714406120; x=1715010920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYdHZxO0BRt7dgpRNiCyfVAfabfi7oZLSCmF+401fHU=;
        b=ZHpUlWwPNHl6vUK3igX0rFJMGKB/+mzarSsSO/s6+BvllFadWcmANhVUwGrvcN5MW9
         nZcO3Y7bcp0a4qtwi076DyUGHjBimHqmqdgKGkpVONi036giokaDbxRB/IQgYBrRu7t8
         zOEjpnLzzjd7558rcXWk4w3FjS01STpWq27kouuFOmRFHWtb6/H+NjTbtONnELdyM5/m
         6HBjd4VTCxzG7nnIvGwevo/hj08RvtlWd5kmpc9aRQgflnUGtlkp5CWeKtFiKUAp10xQ
         IrxK8ROKP5GTiAax5Jxo3tIsiwMKycfkAxPXG+65mNN3lOTve3v6L17wzC6Nica2kYvz
         cwwg==
X-Gm-Message-State: AOJu0YxY2QH+pjGfWijrFwpubIqSGN9zvtRyaU78vKm/qJ4S5XUEBfY8
	TxdKGXZGga9ZY7Lm1jt4H0jMFvaTA2CSuJ/puLBInQg2bz2n/CnUVItkiadrX8Ff0DaoOJ+N6Se
	xERplaDPpFzwWcll2R9fYBH7yWi8=
X-Google-Smtp-Source: AGHT+IGwbgS8aQAkZA5460yNKboxuhJ8w/vE+AWhSdVpgG8JC7WwFJ6V6vTv66DwtpE3Rw84R0cSwhqAZ+zE4oZszHs=
X-Received: by 2002:a05:6512:20ca:b0:51d:1002:520d with SMTP id
 u10-20020a05651220ca00b0051d1002520dmr3831591lfr.64.1714406119464; Mon, 29
 Apr 2024 08:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240429152221.3405405-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20240429152221.3405405-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Apr 2024 17:55:07 +0200
Message-ID: <CANNYZj_PD0+DEM1XT9uqETkUvz5fzO7cQEFwLxZk7p+ZCqYs_Q@mail.gmail.com>
Subject: Re: [PATCH v2] oeqa/runtime/cases: new image_upgrade test
To: michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 15:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198747

On Mon, 29 Apr 2024 at 17:22, <michael.opdenacker@bootlin.com> wrote:
> +# Version string utilities copied from yocto-autobuilder-helper/scripts/utils.py
> +
> +def get_string_from_version(version, milestone=None, rc=None):
> +    """ Point releases finishing by 0 (e.g 4.0.0, 4.1.0) do no exists,
> +    those are major releases
> +    """
> +    if len(version) == 3 and version[-1] == 0:
> +        version = version[:-1]
> +
> +    result = ".".join(list(map(str, version)))
> +    if milestone:
> +        result += "_M" + str(milestone)
> +    if rc:
> +        result += ".rc" + str(rc)
> +    return result
> +
> +def get_tag_from_version(version, milestone):
> +    if not milestone:
> +        return "yocto-" + get_string_from_version(version, milestone)
> +    return get_string_from_version(version, milestone)
> +
> +def get_version_from_string(raw_version):
> +    """ Get version as list of int from raw_version.
> +
> +    Raw version _can_ be prefixed by "yocto-",
> +    Raw version _can_ be suffixed by "_MX"
> +    Raw version _can_ be suffixed by ".rcY"
> +    """
> +    version = None
> +    milestone = None
> +    rc = None
> +    if raw_version[:6] == "yocto-":
> +        raw_version = raw_version[6:]
> +    raw_version = raw_version.split(".")
> +    if raw_version[-1][:2] == "rc":
> +        rc = int(raw_version[-1][-1])
> +        raw_version = raw_version[:-1]
> +    if raw_version[-1][-3:-1] == "_M":
> +        milestone = int(raw_version[-1][-1])
> +        raw_version = raw_version[:-1] + [raw_version[-1][:-3]]
> +    version = list(map(int, raw_version))
> +    """ Point releases finishing by 0 (e.g 4.0.0, 4.1.0) do no exists,
> +    those are major releases
> +    """
> +    if len(version) == 3 and version[-1] == 0:
> +        version = version[:-1]
> +    return version, milestone, rc

I understand that the above is merely a copy-paste, but these
functions would really benefit from having comments that contain
examples of input and output. I don't understand what they do.

> +def get_poky_latest_image_url(machine, machine_variant, image_file):
> +
> +    """Returns the URL of the latest generated image for the current branch"""
> +
> +    baseversion, milestone, _ = get_version_from_string(subprocess.check_output(["git", "describe", "--abbrev=0"], cwd=basepath).decode('utf-8').strip())
> +    tag = get_tag_from_version(baseversion, milestone)
> +    downloads_base = "https://downloads.yoctoproject.org/releases/yocto/"
> +
> +    if milestone is not None:
> +        downloads_base += "milestones/yocto-%s" % tag
> +    else:
> +        downloads_base += tag
> +
> +    if machine_variant == "":
> +        subdir = machine
> +    else:
> +        subdir = "%s-%s" % (machine, machine_variant)
> +
> +    return "%s/machines/qemu/%s/%s" % (downloads_base, subdir, image_file)

Same here.  A comment with example input and output would help a lot.

> +class ImageIpkUpgrade(OESelftestTestCase):
> +
> +    def run_image_upgrade_test(self, image, image_path, image_url, pkg, features):
> +        """
> +        Summary: Test that generated packages can
> +        be used to upgrade an older image version.
> +        This is done by generating an image but then replacing it
> +        by an older image available at a specified location.
> +        We then run QEMU on the old image and replace the original
> +        original package feeds by our own.
> +        """
> +
> +        features += 'EXTRA_IMAGE_FEATURES += "package-management"\n'
> +        features += 'PACKAGE_CLASSES = "package_%s"\n' % pkg
> +        features += 'IMAGE_CLASSES += "testimage"\n'
> +        features += 'TEST_SUITES="%s_sysupgrade"\n' % pkg
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
> +        image_full_path = '%s/%s' % (self.builddir, image_path)
> +
> +        os.remove(image_full_path)
> +        self.logger.info("Downloading image: %s..." % image_url)
> +        cmd = 'wget -O %s %s' % (image_full_path, image_url)
> +        result = runCmd(cmd)
> +        self.assertEqual(0, result.status, cmd + ' returned a non 0 status: %s' % result.output)
> +
> +        # Now run the upgrade tests on the old image
> +
> +        self.logger.info("Running upgrade tests on the downloaded image, using the package feeds generated here...")
> +        bitbake(image + ' -c testimage')
> +
> +    def run_poky_image_upgrade_test(self, distro_variant, image, machine_variant, fstype, pkg):
> +        machine = get_bb_var("MACHINE")
> +        features = 'DISTRO = "poky%s"\n' % distro_variant
> +        image_file = '%s-%s.rootfs.%s' % (image, machine, fstype)
> +        image_path = 'tmp/deploy/images/%s/%s' % (machine, image_file)
> +        image_url = get_poky_latest_image_url(machine, machine_variant, image_file)
> +        self.run_image_upgrade_test(image, image_path, image_url, pkg, features)
> +
> +    @skipIfNotQemu()
> +    def test_poky_altcfg_core_image_ext4_full_cmdline_ipk_upgrade(self):
> +        self.run_poky_image_upgrade_test("-altcfg", "core-image-full-cmdline", "alt", "ext4", "ipk")

This is a much improved code structure that can scale easily, right? :)

Alex

