Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E42C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:26:42 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.76934.1752495997340271375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IVFBnINJ;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b595891d2so33601061fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 05:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752495995; x=1753100795; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0mzYktirKb7V0nRCgVz8syvR0r12UTz6gmfiH01862k=;
        b=IVFBnINJVXMnuP0btEauFB70tKjQosL1EatGhsF0wqAxFFkGNhyazUeJ0i9OitCr2a
         sapoVebXqwY+C7jZ2+47FrGY8xFy7MKISg4Y8iuU9q3cXeuRD9UpIfNfdNOTKwV37Rbh
         c/h9uycQqSGm/MfB2st5/BqM4JA7v2n8qs4ufHgYMqk19ZA4v/TSD0iJ0YPohtwLmh5r
         cvriAmyOtmXaDznbX8/lnV/jN4y67ON6BhCe/BM7N9/eAtwHmX3Wd/Jl6HteXhxVJnV6
         3eyW9muPEg1MRg32Iiqd5J+pWWOEwmRVg2uSCJjIRpC1/QwCvaLPqD7t7F9JNroN8zg6
         txEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752495995; x=1753100795;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mzYktirKb7V0nRCgVz8syvR0r12UTz6gmfiH01862k=;
        b=rzQyJQmMviflcKtRRh7rJmBD8pmInv4aaUM5ZIJ4E7tfSCp1wWk0nuqfQ/MuRDUcAs
         /G7MQ8x4OoC7ZeRWGjubh0nwyvaSNH0lzGUYCctPhN72NQf3zlF0bIdzNupg2d5yDHbH
         8FolFszIC4O9TAu9Jq3foCzAcuheBugAI/s5g1fCNFfqw+Wq3npttXDISAM+kLAhGvvX
         Rlog1bi0blqJBcCeQBQhSNsSaJqb57kymw6vdNpIgdXkKxehzgkNZWhBFpABTb/d+JqG
         Japbnm1J3TMXDLAHXRoltoX6iBGKnp7ScqSL1t+fqpztm3Qfbm+m4Uym877+pUrhNksN
         jiTQ==
X-Gm-Message-State: AOJu0YxdfdG5mdaI/h2J2AepJqZBcm/GjqPl8lAu0haBapYb7GhW+Esq
	+c7nwrYuFok/XzvbTLkmJjJ6A+r6dwGm5na24HEN5Y8zjJG0MBSWnAMM6mLftnK6Cgc=
X-Gm-Gg: ASbGnctJHwYnLUiiBs/aDR7pX/8CJYvI4OgFg6u/wKlAN6wuGH17knGnZDY7n6yKOze
	b9SvUCLyw8iCcbKIenaeOL3DDxWETM3Mqm86mCGUie3Zj6WrgfWJyGfGg1q22+0YO2yU/kzIj5J
	smDgPCuvR1gBlIk8+cE97aNaUwUnATDnylzSDjW9eLqhsxLnS7Ge/4oEENZ/V88+qB/nmozpnwS
	n7g9bBs0O6RThVGnMxq8Wf2jHa5SLTOm86N5TEXaYcv0tlRVW3Lea0GqSYCNbJz1o3u5XIZtqAE
	ys8zQSKKuobTNF5TEvQ+b1E142fr5E6RnSpbn3RJi4HXEgzfTc+e6837rnVSO1HStM67cVaV+Ga
	iVHXQMmthzMIGKu2y2wkVZGZlaJq1fH0HyeU24Pww3lpWYNvQhL/qIu8=
X-Google-Smtp-Source: AGHT+IGOdep/4ngivCOo2jeI78tsJKlxnGZisXoF7yZrvyj3IRi8iYUAiS5RDM6JBlEUdAY+lalfuw==
X-Received: by 2002:a2e:b8c2:0:b0:32a:81a2:8a8d with SMTP id 38308e7fff4ca-3305341a987mr39101971fa.26.1752495995331;
        Mon, 14 Jul 2025 05:26:35 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ec735sm14782811fa.83.2025.07.14.05.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:26:34 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:26:33 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 4/5] testexport.bbclass: use image suffix in
 testexport tar ball name
Message-ID: <aHT3efhwan1KNT2x@nuoska>
References: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
 <20250702072516.1075450-4-mikko.rapeli@linaro.org>
 <8f8c45afad9226d215b4c37d13abd8d677e79755.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f8c45afad9226d215b4c37d13abd8d677e79755.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 12:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220229

Hi,

On Mon, Jul 14, 2025 at 01:08:42PM +0100, Richard Purdie wrote:
> On Wed, 2025-07-02 at 10:25 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > testexport.tar.gz is image specific. Thus add same image name
> > suffix to the tar ball name. For example genericarm64 machine
> > core-image-minimal image tar ball changes name from
> > testexport.tar.gz to testexport-core-image-minimal-genericarm64.tar.gz
> > 
> > This way testexport from multiple images can exists in the same
> > directory.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/classes-recipe/testexport.bbclass | 8 ++++++--
> > �1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
> > index 843d777e3bb9..3005fc0dfa52 100644
> > --- a/meta/classes-recipe/testexport.bbclass
> > +++ b/meta/classes-recipe/testexport.bbclass
> > @@ -136,8 +136,12 @@ def copy_needed_files(d, tc):
> > ������������ if dir == '__pycache__':
> > ���������������� shutil.rmtree(os.path.join(subdir, dir))
> > �
> > +��� image_basename = d.getVar('IMAGE_BASENAME')
> > +��� image_machine_suffix = d.getVar('IMAGE_MACHINE_SUFFIX')
> > +
> > ���� # Create tar file for common parts of testexport
> > -��� testexport_create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
> > +��� testexport_create_tarball(d, "testexport-%s%s.tar.gz" %
> > +������� (image_basename, image_machine_suffix), d.getVar("TEST_EXPORT_DIR"))
> > �
> > ���� # Copy packages needed for runtime testing
> > ���� test_paths = get_runtime_paths(d)
> > @@ -149,7 +153,7 @@ def copy_needed_files(d, tc):
> > �������� export_pkg_dir = os.path.join(d.getVar("TEST_EXPORT_DIR"), "packages")
> > �������� oe.path.copytree(test_pkg_dir, export_pkg_dir)
> > �������� # Create tar file for packages needed by the DUT
> > -������� testexport_create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACHINE"), export_pkg_dir)
> > +������� testexport_create_tarball(d, "testexport_packages%s.tar.gz" % image_machine_suffix, export_pkg_dir)
> > �
> > ���� # Copy SDK
> > ���� if d.getVar("TEST_EXPORT_SDK_ENABLED") == "1":
> 
> Since most of the machine and image specific elements of this have been
> removed, does it not make sense just to have one testexport tarball
> generated by an external script?
> 
> The testdata json file is already exported separately.
> 
> I've held off this patch for that reason, making it machine specific
> seems a backwards step?

Currently the image specific testdata json is inside the testexport
tar ball as core-image-sato/data/testdata.json. Same file is available
after build in
tmp/deploy/images/genericarm64/core-image-sato-genericarm64.rootfs.testdata.json
so I could switch the exported tests over to that.

I'll try to set this up with a different patch. Thanks for the feedback!

The new approach needs some standardisation between what is in build
output and what is in the test environment. There is a similar issue
with opkg/ipk runtime test and the need for just a few files around
80kb from the ipk archive, not the full archive which is possibly
gigabytes in size. I've now set these up with a separate script
outside of poky. It would be nice if these small scripts could live
in poky, possibly scripts/contrib/ ? I could capture the image specific
testdata.json file in the same way too, for example a single tar ball.

Cheers,

-Mikko

