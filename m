Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34549C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:55:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.100.1680105303250473435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XtaK8jdh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id o32so9240808wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680105302;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J+CIjxnffiMVZnpCcn6I7oiR/SX27T5wg+dN6PmzfyQ=;
        b=XtaK8jdhLv+WrOeruR2peG4p0uru6wPhB5gETBj7EnQYWe0yYEgOBfefvfsT7G8OxS
         +pIhpQdy6YkOQOLoZnRNVoA9j5XYGcn14HqJQNvX1xJZOJDL3Znai2BUmuJMpjYP88sN
         HsexN0JpfJozEjZGrHb/UgrmymNnfJ1rqkA0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105302;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J+CIjxnffiMVZnpCcn6I7oiR/SX27T5wg+dN6PmzfyQ=;
        b=AwcTiXiSsE5i1/ekH7j9L61BOEZ4tGyG0rwgzXwcsSuwTPfkXrsv8/xz/+55fZhgTo
         BaLVadWVRMQ3nq4ZADZ+my1UWDo6eo0JzT+rXN0xmp5SXNWurf8G9tJixy/aUBKMbJFK
         KdSI93qXvsB+yLRZmtqcZxS/q8mxOYJFSrdedOFe05XN0U84BuoIr8kBA3QQWxI0YsVd
         HLBhPjsWc5WBk+ftoYqLoW3B4YlCwnEZfxunSHNzP/wsr4UVhOjSj1Nm4zaYmaSQm1qw
         3XidHbz0YdASsx64AF4ny0Zsdw9hVJFV9XrxN+ulEtyMgWEJQ+zQI3kPxC99w3UFDpEm
         RUpw==
X-Gm-Message-State: AO0yUKWWMRZu70uSfSoqCQg28jBshaDOU6HwkGRlaByLa5elMosaASrL
	vRK7Nb/8SbPrmo+MzVkGTyVNdw==
X-Google-Smtp-Source: AK7set+E7jd6lsCZhCCPz8ymwLZF+Vr2pwrpU4aHQw2TMZ8EnWmwfNOKn2ENt0gFCp4mUATTH5Jnyg==
X-Received: by 2002:a7b:c00f:0:b0:3eb:3945:d3fd with SMTP id c15-20020a7bc00f000000b003eb3945d3fdmr15329120wmb.14.1680105301655;
        Wed, 29 Mar 2023 08:55:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7? ([2001:8b0:aba:5f3c:a292:121e:1e7c:1ae7])
        by smtp.gmail.com with ESMTPSA id z20-20020a7bc7d4000000b003eeb1d6a470sm2695409wmk.13.2023.03.29.08.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:55:01 -0700 (PDT)
Message-ID: <23e742ca62b882717bd04827c3939f4951481551.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] wic: use part_name when defined
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dit.kozmaj@kynetics.com, openembedded-core@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Date: Wed, 29 Mar 2023 16:55:00 +0100
In-Reply-To: <20230322155430.31594-1-dit.kozmaj@kynetics.com>
References: <20230322155430.31594-1-dit.kozmaj@kynetics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179291

On Wed, 2023-03-22 at 16:54 +0100, dit.kozmaj@kynetics.com wrote:
> From: Dit Kozmaj <dit.kozmaj@kynetics.com>
>=20
> So far part.label has been used to define GPT partition label even if
> part.part_name was defined.
> Fix the code to use part.part_name whenever available, as it makes sense
> to have a GPT partition label which is different from the contained
> filesystem label.
>=20
> Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
> Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index dfaa901567..1f06b89f8e 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -571,11 +571,12 @@ class PartitionedImage():
>              self._create_partition(self.path, part.type,
>                                     parted_fs_type, part.start, part.size=
_sec)
> =20
> -            if part.part_name:
> +            if part.part_name or part.label:
> +                partition_label =3D part.part_name if part.part_name els=
e part.label
>                  logger.debug("partition %d: set name to %s",
> -                             part.num, part.part_name)
> +                             part.num, partition_label)
>                  exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
> -                                         (part.num, part.part_name,
> +                                         (part.num, partition_label,
>                                            self.path), self.native_sysroo=
t)
> =20
>              if part.part_type:
> @@ -592,13 +593,6 @@ class PartitionedImage():
>                                  (part.num, part.uuid, self.path),
>                                  self.native_sysroot)
> =20
> -            if part.label and self.ptable_format =3D=3D "gpt":
> -                logger.debug("partition %d: set name to %s",
> -                             part.num, part.label)
> -                exec_native_cmd("parted -s %s name %d %s" % \
> -                                (self.path, part.num, part.label),
> -                                self.native_sysroot)
> -
>              if part.active:
>                  flag_name =3D "legacy_boot" if self.ptable_format =3D=3D=
 'gpt' else "boot"
>                  logger.debug("Set '%s' flag for partition '%s' on disk '=
%s'",

This was flagged on irc as not having a response. We're struggling with
a lack of a maintainer for wic at the moment so review is slow and I'm
not really a wic expert but I'm all we have :/.

As mentioned, changes to code like this are much more likely if there
is a test case included. The existing tests can be run with "oe-
selftest -r wic".

Can you confirm this patch doesn't regress the current tests?

Would you be able to add a test so this change doesn't regress in
future?

Cheers,

Richard




