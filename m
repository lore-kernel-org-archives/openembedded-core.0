Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D93CEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:07:19 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.9171.1690884432916616249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=c+bCgdAe;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4fe3678010eso3154500e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690884431; x=1691489231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zi9evIErXcTGZ3MXGpYCmpbhp+4pb0shWPX3Sd2IHns=;
        b=c+bCgdAeCP8KZF+TN+HAJIo5cLoYICxaZ3rjw3ZTeTFVZGWLFOeVPuIBaukSgHpjmp
         PGY4BcYnhvFxd3kA1LpN/XorYDDUyS/WiWCZUt3xEQ2dms2B7UUSJ7otoLoQWqjebJOE
         Zgik76m5Xyuw8LcRR7vJj9rJjltcX0EhWUkTsLjvB08/sFoKy+mxB3P8W7+53VTopxt5
         3JX2XL/8Sn+0Pmu9SjBkPFm6/sgqxAgUP7uKzyRjIhyj257koJhsCi6rZTkVZ9xT/H/E
         qKSoULVm6bbFhFoV0Ay43J0y1nWL6rY6zDptMnFNEMK3j8BpLmAhGAiJHqwQuSX4lEGF
         +Vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690884431; x=1691489231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zi9evIErXcTGZ3MXGpYCmpbhp+4pb0shWPX3Sd2IHns=;
        b=WvYKLUu/PGpDSWZsnNCzMcDoUtqJlYUo+5jTGUfO669+CUbZqSiL9pUnGj7ZeMUFHm
         7/eGqK0BLjJY0GyNE06dqp7TZmvpJ4am3kLP3weoM37guxZUcoV0h2+HJb8Cd7qSFeFR
         bk0GhxLZ4+Az5pEoqQ8RLeh72X3dz6j8v3xA/b464FPryE21PP1CUpyhWcL3kCER06ZH
         B0ek/yB8JlDVHzYw34Fqj/zsGuSm0HoXexslatn21oAqFkEKQYF9m/lvYG2dYN+Q2x/n
         kBUIvWNoohVElaT7QwUh1rDTB5DZQF0OVcm478UKUNHiSx66x9X440ywX9hZdJrI9RNB
         mJiA==
X-Gm-Message-State: ABy/qLYBRVSEX+e1PbQdbv8G13Mn9ZnfJYZjm7NCLVMetIsArJp8L6oh
	pwIYaJFA29JARbxHUPdjehpGp9Co7l+y/ZGNrvM=
X-Google-Smtp-Source: APBJJlGd4Khkg2ZFz3a6jhkMxqy75DcuJrLGRyEuSzsllihS/dsRjLr04cs5ZFE6IQNWH2V7+zzLUehMtIGl59yBudw=
X-Received: by 2002:ac2:532e:0:b0:4f8:49a7:2deb with SMTP id
 f14-20020ac2532e000000b004f849a72debmr1755429lfh.8.1690884430719; Tue, 01 Aug
 2023 03:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230731215310.3949441-1-charlie.johnston@ni.com> <20230731215310.3949441-3-charlie.johnston@ni.com>
In-Reply-To: <20230731215310.3949441-3-charlie.johnston@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 12:06:58 +0200
Message-ID: <CANNYZj-24Xjci4DmDgi+ANf52oniH+yMy61QPf=UWo=4iH+7iQ@mail.gmail.com>
Subject: Re: [oe-core][RFC PATCH v2 2/6] package_manager: Add feed support to generate_index_files.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185232

I think it's better to change indexer_map either to three different
dictionaries, or a dictionary of dictionaries. Putting more than two
things in a tuple (that aren't of the same kind) results in a code
that's hard to read. For example:

feedpath = indexer_map[pkg_class][1] if feedname is None else
indexer_map[pkg_class][2]
if os.path.exists(feedpath):
            result = indexer_map[pkg_class][0](d, feedpath).write_index()

What is '1' and what is '2' and what is '0'? They should be named
properly, and not numbered.

Same applies to patch 4/6.

Alex



On Mon, 31 Jul 2023 at 23:53, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
> Currently, the generate_index_files function only handles
> the creation of index files in the DEPLOY_DIR_<PKG_TYPE>
> directories. This change adds an optional feedname input
> that will instead point the index generation at a package
> specific feed directory. If no feedname is specified,
> the original behavior persists.
>
> The directory for index creation will be
> ${DEPLOY_DIR_FEED_<PKG_TYPE>}/feedname.
>
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>  meta/lib/oe/package_manager/__init__.py | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
> index 0c313190cf..0934cda89d 100644
> --- a/meta/lib/oe/package_manager/__init__.py
> +++ b/meta/lib/oe/package_manager/__init__.py
> @@ -533,7 +533,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
>                          raise
>
>
> -def generate_index_files(d):
> +def generate_index_files(d, feedname = None):
>      from oe.package_manager.rpm import RpmSubdirIndexer
>      from oe.package_manager.ipk import OpkgIndexer
>      from oe.package_manager.deb import DpkgIndexer
> @@ -541,9 +541,9 @@ def generate_index_files(d):
>      classes = d.getVar('PACKAGE_CLASSES').replace("package_", "").split()
>
>      indexer_map = {
> -        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM')),
> -        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK')),
> -        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'))
> +        "rpm": (RpmSubdirIndexer, d.getVar('DEPLOY_DIR_RPM'), d.expand('${DEPLOY_DIR_FEED_RPM}/%s' % feedname)),
> +        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK'), d.expand('${DEPLOY_DIR_FEED_IPK}/%s' % feedname)),
> +        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB'), d.expand('${DEPLOY_DIR_FEED_DEB}/%s' % feedname))
>      }
>
>      result = None
> @@ -552,8 +552,9 @@ def generate_index_files(d):
>          if not pkg_class in indexer_map:
>              continue
>
> -        if os.path.exists(indexer_map[pkg_class][1]):
> -            result = indexer_map[pkg_class][0](d, indexer_map[pkg_class][1]).write_index()
> +        feedpath = indexer_map[pkg_class][1] if feedname is None else indexer_map[pkg_class][2]
> +        if os.path.exists(feedpath):
> +            result = indexer_map[pkg_class][0](d, feedpath).write_index()
>
>              if result is not None:
>                  bb.fatal(result)
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185176): https://lists.openembedded.org/g/openembedded-core/message/185176
> Mute This Topic: https://lists.openembedded.org/mt/100471803/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

