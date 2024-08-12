Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D60C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 08:39:13 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.41871.1723451950053046394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 01:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFwEajxP;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so44267041fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 01:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723451948; x=1724056748; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpPSegD7zVsHd1X+gWvytY5wSzcVweK+zpUsw+5M1pg=;
        b=OFwEajxPGU4g38EoOOKRODdQaPwRWwUb3bF0Elu0nQ7+0rqwTYhsAkvi/K3gS2br8P
         Yla2SXfacHt9TqtiObKGSWwLwIWQy+EpkDBkJA3VUFSSaUVqt3fexcXIBS045ZBlEG0p
         CU5HSw1WZ+m+DZATTYVn3LfPRxy0ZKKvYUs5z0lBoB9+z8w9knp7Dtk7NJ4tUibJLmbh
         FUNEKMPe/IsE3BZabKJAcfuezfw5omVxw6pnHYERkAy08vUfgZxrcbzt8P9yHQGZxOs2
         6jdzI7JmUUrDDaY971B7XBPjr6XBW+9bXWqlf117E0Ha6DNsvLIIR7latYDdHGnlOfog
         Dthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723451948; x=1724056748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpPSegD7zVsHd1X+gWvytY5wSzcVweK+zpUsw+5M1pg=;
        b=TYAGUZGchZt/hSINDGGp4KBMcCQUb+Z44U4+D5R1mppNnqd1UUcWZgtP18yeFP45OY
         qN4zmFLgV5SMN8p+KThpgZ73tCExEgVV/5SAQmVkhZHXh/9x2YLfmlKSOipkhSdKzpgC
         ha6ExE0m590sIogAK0A+fdQhsBP9h18UQo0WjeXCUlpOI791nsvb6UjaZEDGLkV4ZsFa
         uJrjbwFURzm539YTCV4d2BTdmBjo7bLRw8z61QX1nmQfqPAX2S8B21sCm+0aZukZ8FW+
         AuPF/X2ha7TBDgdjY01zEaJEf6CRTWHv8l3cjt6E5rhLzRfXjhzEXpNRU1WIB0d5LZrZ
         bucA==
X-Gm-Message-State: AOJu0Yyzn9C1hkJfHSpcafNl5lwZ2EAXjmzw9XSKaMYO6wD9rj4vtrXF
	x9jWEMP4iJoD1hc1r/W/lAfYJ8URA6S/GegiIr3OjOSnQiG9zHVVW4GhCcpNudlr1R/nhrCVsDE
	vhxGytBeC+6967Ywqbm7w7GQhNbg=
X-Google-Smtp-Source: AGHT+IE7HeSYkeuiLc8NU56clIvVbdmOjlTCsiNIm1OpwBhklI1YaeKp3JpnZFBGNYNJ2HL//cTLtdgTAQ4+MINhL5w=
X-Received: by 2002:a2e:b88a:0:b0:2ef:18c1:fa07 with SMTP id
 38308e7fff4ca-2f1a6d26a57mr57467431fa.29.1723451947544; Mon, 12 Aug 2024
 01:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
 <CANNYZj9v2KksePBij2yF64OX+yQCR6M+RGfcgqhS7AC5dfVXJw@mail.gmail.com> <d3b8c889-9cd2-4f8b-8f9b-c80f63ccabd6@skyrain.eu>
In-Reply-To: <d3b8c889-9cd2-4f8b-8f9b-c80f63ccabd6@skyrain.eu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Aug 2024 10:38:55 +0200
Message-ID: <CANNYZj_1L9FFWzEsSV-Bi1GDO0ef3Y8XKb-oTB5VPD+vnfraHA@mail.gmail.com>
Subject: Re: [OE-core] [oe]printhello
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203210

The example in bitbake manual assumes a pristine bitbake environment
without poky or oe-core. When you pull in oe-core, it makes all sorts
of changes, including making do_build non-executable.

Alex

On Mon, 12 Aug 2024 at 10:22, Andrej Valek <andrej.v@skyrain.eu> wrote:
>
> Hello Alex,
>
> Here is some more information...
>
> /home/projects/Yocto/poky/build/tmp/work/all-poky-linux/printhello/1/temp=
$
> tree
> .
> =E2=94=9C=E2=94=80=E2=94=80 cve.json
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_create_runtime_spdx -> depsig.do_cr=
eate_runtime_spdx.60015
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_create_runtime_spdx.60015
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_create_spdx -> depsig.do_create_spd=
x.59805
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_create_spdx.59805
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_deploy_source_date_epoch ->
> depsig.do_deploy_source_date_epoch.59329
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_deploy_source_date_epoch.59329
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_package -> depsig.do_package.59461
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_package.59461
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_packagedata -> depsig.do_packagedat=
a.59740
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_packagedata.59740
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_package_qa -> depsig.do_package_qa.=
59807
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_package_qa.59807
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_package_write_rpm -> depsig.do_pack=
age_write_rpm.59806
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_package_write_rpm.59806
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_populate_lic -> depsig.do_populate_=
lic.59330
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_populate_lic.59330
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_populate_sysroot -> depsig.do_popul=
ate_sysroot.59462
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_populate_sysroot.59462
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_recipe_qa -> depsig.do_recipe_qa.59=
251
> =E2=94=9C=E2=94=80=E2=94=80 depsig.do_recipe_qa.59251
> =E2=94=9C=E2=94=80=E2=94=80 log.do_cleansstate -> log.do_cleansstate.5916=
9
> =E2=94=9C=E2=94=80=E2=94=80 log.do_cleansstate.59169
> =E2=94=9C=E2=94=80=E2=94=80 log.do_collect_spdx_deps -> log.do_collect_sp=
dx_deps.59311
> =E2=94=9C=E2=94=80=E2=94=80 log.do_collect_spdx_deps.59311
> =E2=94=9C=E2=94=80=E2=94=80 log.do_compile -> log.do_compile.59435
> =E2=94=9C=E2=94=80=E2=94=80 log.do_compile.59435
> =E2=94=9C=E2=94=80=E2=94=80 log.do_configure -> log.do_configure.59429
> =E2=94=9C=E2=94=80=E2=94=80 log.do_configure.59429
> =E2=94=9C=E2=94=80=E2=94=80 log.do_create_runtime_spdx -> log.do_create_r=
untime_spdx.60015
> =E2=94=9C=E2=94=80=E2=94=80 log.do_create_runtime_spdx.60015
> =E2=94=9C=E2=94=80=E2=94=80 log.do_create_spdx -> log.do_create_spdx.5980=
5
> =E2=94=9C=E2=94=80=E2=94=80 log.do_create_spdx.59805
> =E2=94=9C=E2=94=80=E2=94=80 log.do_cve_check -> log.do_cve_check.59262
> =E2=94=9C=E2=94=80=E2=94=80 log.do_cve_check.59262
> =E2=94=9C=E2=94=80=E2=94=80 log.do_deploy_source_date_epoch -> log.do_dep=
loy_source_date_epoch.59329
> =E2=94=9C=E2=94=80=E2=94=80 log.do_deploy_source_date_epoch.59329
> =E2=94=9C=E2=94=80=E2=94=80 log.do_fetch -> log.do_fetch.59299
> =E2=94=9C=E2=94=80=E2=94=80 log.do_fetch.59299
> =E2=94=9C=E2=94=80=E2=94=80 log.do_install -> log.do_install.59451
> =E2=94=9C=E2=94=80=E2=94=80 log.do_install.59451
> =E2=94=9C=E2=94=80=E2=94=80 log.do_package -> log.do_package.59461
> =E2=94=9C=E2=94=80=E2=94=80 log.do_package.59461
> =E2=94=9C=E2=94=80=E2=94=80 log.do_packagedata -> log.do_packagedata.5974=
0
> =E2=94=9C=E2=94=80=E2=94=80 log.do_packagedata.59740
> =E2=94=9C=E2=94=80=E2=94=80 log.do_package_qa -> log.do_package_qa.59807
> =E2=94=9C=E2=94=80=E2=94=80 log.do_package_qa.59807
> =E2=94=9C=E2=94=80=E2=94=80 log.do_package_write_rpm -> log.do_package_wr=
ite_rpm.59806
> =E2=94=9C=E2=94=80=E2=94=80 log.do_package_write_rpm.59806
> =E2=94=9C=E2=94=80=E2=94=80 log.do_patch -> log.do_patch.59309
> =E2=94=9C=E2=94=80=E2=94=80 log.do_patch.59309
> =E2=94=9C=E2=94=80=E2=94=80 log.do_populate_lic -> log.do_populate_lic.59=
330
> =E2=94=9C=E2=94=80=E2=94=80 log.do_populate_lic.59330
> =E2=94=9C=E2=94=80=E2=94=80 log.do_populate_sysroot -> log.do_populate_sy=
sroot.59462
> =E2=94=9C=E2=94=80=E2=94=80 log.do_populate_sysroot.59462
> =E2=94=9C=E2=94=80=E2=94=80 log.do_prepare_recipe_sysroot -> log.do_prepa=
re_recipe_sysroot.59303
> =E2=94=9C=E2=94=80=E2=94=80 log.do_prepare_recipe_sysroot.59303
> =E2=94=9C=E2=94=80=E2=94=80 log.do_recipe_qa -> log.do_recipe_qa.59251
> =E2=94=9C=E2=94=80=E2=94=80 log.do_recipe_qa.59251
> =E2=94=9C=E2=94=80=E2=94=80 log.do_unpack -> log.do_unpack.59302
> =E2=94=9C=E2=94=80=E2=94=80 log.do_unpack.59302
> =E2=94=9C=E2=94=80=E2=94=80 log.task_order
> =E2=94=9C=E2=94=80=E2=94=80 run.base_do_fetch.59299
> =E2=94=9C=E2=94=80=E2=94=80 run.base_do_unpack.59302
> =E2=94=9C=E2=94=80=E2=94=80 run.BUILDSPEC.59806
> =E2=94=9C=E2=94=80=E2=94=80 run.create_source_date_epoch_stamp.59302
> =E2=94=9C=E2=94=80=E2=94=80 run.debian_package_name_hook.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.do_cleansstate -> run.do_cleansstate.5916=
9
> =E2=94=9C=E2=94=80=E2=94=80 run.do_cleansstate.59169
> =E2=94=9C=E2=94=80=E2=94=80 run.do_collect_spdx_deps -> run.do_collect_sp=
dx_deps.59311
> =E2=94=9C=E2=94=80=E2=94=80 run.do_collect_spdx_deps.59311
> =E2=94=9C=E2=94=80=E2=94=80 run.do_compile -> run.do_compile.59435
> =E2=94=9C=E2=94=80=E2=94=80 run.do_compile.59435
> =E2=94=9C=E2=94=80=E2=94=80 run.do_configure -> run.do_configure.59429
> =E2=94=9C=E2=94=80=E2=94=80 run.do_configure.59429
> =E2=94=9C=E2=94=80=E2=94=80 run.do_create_runtime_spdx -> run.do_create_r=
untime_spdx.60015
> =E2=94=9C=E2=94=80=E2=94=80 run.do_create_runtime_spdx.60015
> =E2=94=9C=E2=94=80=E2=94=80 run.do_create_spdx -> run.do_create_spdx.5980=
5
> =E2=94=9C=E2=94=80=E2=94=80 run.do_create_spdx.59805
> =E2=94=9C=E2=94=80=E2=94=80 run.do_cve_check -> run.do_cve_check.59262
> =E2=94=9C=E2=94=80=E2=94=80 run.do_cve_check.59262
> =E2=94=9C=E2=94=80=E2=94=80 run.do_deploy_source_date_epoch -> run.do_dep=
loy_source_date_epoch.59329
> =E2=94=9C=E2=94=80=E2=94=80 run.do_deploy_source_date_epoch.59329
> =E2=94=9C=E2=94=80=E2=94=80 run.do_fetch -> run.do_fetch.59299
> =E2=94=9C=E2=94=80=E2=94=80 run.do_fetch.59299
> =E2=94=9C=E2=94=80=E2=94=80 run.do_install -> run.do_install.59451
> =E2=94=9C=E2=94=80=E2=94=80 run.do_install.59451
> =E2=94=9C=E2=94=80=E2=94=80 run.do_package -> run.do_package.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.do_package.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.do_packagedata -> run.do_packagedata.5974=
0
> =E2=94=9C=E2=94=80=E2=94=80 run.do_packagedata.59740
> =E2=94=9C=E2=94=80=E2=94=80 run.do_package_qa -> run.do_package_qa.59807
> =E2=94=9C=E2=94=80=E2=94=80 run.do_package_qa.59807
> =E2=94=9C=E2=94=80=E2=94=80 run.do_package_rpm.59806
> =E2=94=9C=E2=94=80=E2=94=80 run.do_package_write_rpm -> run.do_package_wr=
ite_rpm.59806
> =E2=94=9C=E2=94=80=E2=94=80 run.do_package_write_rpm.59806
> =E2=94=9C=E2=94=80=E2=94=80 run.do_patch -> run.do_patch.59309
> =E2=94=9C=E2=94=80=E2=94=80 run.do_patch.59309
> =E2=94=9C=E2=94=80=E2=94=80 run.do_populate_lic -> run.do_populate_lic.59=
330
> =E2=94=9C=E2=94=80=E2=94=80 run.do_populate_lic.59330
> =E2=94=9C=E2=94=80=E2=94=80 run.do_populate_sysroot -> run.do_populate_sy=
sroot.59462
> =E2=94=9C=E2=94=80=E2=94=80 run.do_populate_sysroot.59462
> =E2=94=9C=E2=94=80=E2=94=80 run.do_prepare_recipe_sysroot -> run.do_prepa=
re_recipe_sysroot.59303
> =E2=94=9C=E2=94=80=E2=94=80 run.do_prepare_recipe_sysroot.59303
> =E2=94=9C=E2=94=80=E2=94=80 run.do_qa_configure.59429
> =E2=94=9C=E2=94=80=E2=94=80 run.do_qa_patch.59309
> =E2=94=9C=E2=94=80=E2=94=80 run.do_qa_sysroot.59462
> =E2=94=9C=E2=94=80=E2=94=80 run.do_qa_unpack.59302
> =E2=94=9C=E2=94=80=E2=94=80 run.do_recipe_qa -> run.do_recipe_qa.59251
> =E2=94=9C=E2=94=80=E2=94=80 run.do_recipe_qa.59251
> =E2=94=9C=E2=94=80=E2=94=80 run.do_unpack -> run.do_unpack.59302
> =E2=94=9C=E2=94=80=E2=94=80 run.do_unpack.59302
> =E2=94=9C=E2=94=80=E2=94=80 run.emit_pkgdata.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.extend_recipe_sysroot.59303
> ...
> =E2=94=9C=E2=94=80=E2=94=80 run.package_convert_pr_autoinc.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.packagedata_translate_pr_autoinc.59740
> =E2=94=9C=E2=94=80=E2=94=80 run.package_depchains.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_do_filedeps.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_do_pkgconfig.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_do_shlibs.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_do_split_locales.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_fixsymlinks.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_get_auto_pr.59740
> =E2=94=9C=E2=94=80=E2=94=80 run.package_name_hook.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_prepare_pkgdata.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_setup_pkgv.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.package_setup_pkgv.59740
> =E2=94=9C=E2=94=80=E2=94=80 run.patch_do_patch.59309
> =E2=94=9C=E2=94=80=E2=94=80 run.perform_packagecopy.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.populate_lic_qa_checksum.59330
> =E2=94=9C=E2=94=80=E2=94=80 run.populate_packages.59461
> =E2=94=9C=E2=94=80=E2=94=80 run.read_shlibdeps.59461
> ...
> =E2=94=94=E2=94=80=E2=94=80 run.write_specfile.59806
>
> cat log.task_order
> 20240812-101439.615459 do_cleansstate (59169): log.do_cleansstate.59169
> 20240812-101445.329720 do_recipe_qa (59251): log.do_recipe_qa.59251
> 20240812-101445.392736 do_cve_check (59262): log.do_cve_check.59262
> 20240812-101445.432053 do_fetch (59299): log.do_fetch.59299
> 20240812-101445.481892 do_unpack (59302): log.do_unpack.59302
> 20240812-101445.482591 do_prepare_recipe_sysroot (59303):
> log.do_prepare_recipe_sysroot.59303
> 20240812-101445.537083 do_patch (59309): log.do_patch.59309
> 20240812-101445.541476 do_collect_spdx_deps (59311):
> log.do_collect_spdx_deps.59311
> 20240812-101445.609294 do_deploy_source_date_epoch (59329):
> log.do_deploy_source_date_epoch.59329
> 20240812-101445.609743 do_populate_lic (59330): log.do_populate_lic.59330
> 20240812-101445.739420 do_configure (59429): log.do_configure.59429
> 20240812-101445.817208 do_compile (59435): log.do_compile.59435
> 20240812-101446.131607 do_install (59451): log.do_install.59451
> 20240812-101446.234228 do_populate_sysroot (59462):
> log.do_populate_sysroot.59462
> 20240812-101446.237527 do_package (59461): log.do_package.59461
> 20240812-101446.696560 do_packagedata (59740): log.do_packagedata.59740
> 20240812-101446.828025 do_create_spdx (59805): log.do_create_spdx.59805
> 20240812-101446.834945 do_package_write_rpm (59806):
> log.do_package_write_rpm.59806
> 20240812-101446.836504 do_package_qa (59807): log.do_package_qa.59807
> 20240812-101446.995964 do_create_runtime_spdx (60015):
> log.do_create_runtime_spdx.60015
>
>
> and grep -R "World" showed nothing... .
>
> Of course it will work after these changes:
>
> do_configure() {
>    bbwarn "********************"
>    bbwarn "*                  *"
>    bbwarn "*  Hello, World!   *"
>    bbwarn "*                  *"
>    bbwarn "********************"
> }
>
>
> but I was expecting something like point 12. from
> https://docs.yoctoproject.org/bitbake/2.4/bitbake-user-manual/bitbake-use=
r-manual-hello.html#the-hello-world-example
> :)
>
>
> Regards,
> Andy
>
> On 12.08.2024 09:51, Alexander Kanavin wrote:
> > On Fri, 9 Aug 2024 at 08:41, Andrej Valek via lists.openembedded.org
> > <andrej.v=3Dskyrain.eu@lists.openembedded.org> wrote:
> >> Dear community!
> >>
> >> I know this could be a funny question, but I wanted to use the
> >> "printhello" recipe as a basic example. But looks like, that is little
> >> bit "out-of-date".
> >>
> >> I know, that I can crate a custom recipe, but I wanted to use somethin=
g
> >> "standard", so I took
> >> poky/bitbake/doc/bitbake-user-manual/bitbake-user-manual-hello.rst and
> >> created an "printhello.bb" out of it. I made some modifications to try
> >> to make it working.
> >>
> >>    DESCRIPTION =3D "Prints Hello World"
> >> +LICENSE =3D "CLOSED"
> >>    PN =3D 'printhello'
> >>    PV =3D '1'
> >>
> >> + inherit allarch
> >>
> >>    python do_build() {
> >> -   bb.plain("********************");
> >> -   bb.plain("*                  *");
> >> -   bb.plain("*  Hello, World!   *");
> >> -   bb.plain("*                  *");
> >> -   bb.plain("********************");
> >> +   bb.warn("********************");
> >> +   bb.warn("*                  *");
> >> +   bb.warn("*  Hello, World!   *");
> >> +   bb.warn("*                  *");
> >> +   bb.warn("********************");
> >>    }
> >>
> >> +SSTATE_SKIP_CREATION =3D "1"
> >>
> >> Even if I made these modifications nothing has been printed in termina=
l.
> >> So the question is how good is the example?
> > You need to look into ${T} where the logs for the recipe tasks are. Is
> > there anything noteworthy there?
> >
> > Alex
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#203203): https://lists.openembedded.org/g/openembed=
ded-core/message/203203
> > Mute This Topic: https://lists.openembedded.org/mt/107804007/3619876
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
andrej.v@skyrain.eu]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

