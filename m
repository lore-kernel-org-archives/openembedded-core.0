Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BF6C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:43:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.17313.1716471807610315836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TAq1arXn;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51ffff16400so12417805e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716471806; x=1717076606; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sm5/r4uZkR9rz18pcOQ5ow12jObaD8wLPU+MrAnMlcg=;
        b=TAq1arXnE3jLJ7kE6ZdgF4U/mCWKXZIdDVMiHhLvtioVYlLhsHi0geM4CElNtkxS0h
         RMOey/unGlzubHbWKR8ppuBbpTgnQA9nkzh9Xt36PX0DKa2zsUuPeQ2LG+0ROpWnGKMs
         TMk8tt3tFg5rjcWn2qHUNBVeeXWSD+UM1OoRVtvh2Y0/zo5n/l8K9ifrN4IXZ7+a7pFa
         Hc36Fa770gB0GbS2mlq+x0wEjktXYqYxLfC9dQ1Oe/odJ4XTPqrLQ2c76Kl3EXCXf+6o
         Ae1Tu0Q2ttqYl46wCjLoAPXuZT5mOWcINtRpJ0lQVsZ0ZpdzNac48MbEZ2xQEg0jOWBs
         Clcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716471806; x=1717076606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm5/r4uZkR9rz18pcOQ5ow12jObaD8wLPU+MrAnMlcg=;
        b=Oinmdvl9whH57YNZa0Laix04vYjZia4qryxOVM2PQQnA5DHzl/wlx0H6tmk9g2QZc5
         Zd0vBQ2SlD1mhX9r+yMPxA626XXx0nioYB2S2luz0MpruEq8baZS99uMMJqpXkUeBgkf
         pMwnxpQ3DqwxBnPYhuOMnXZu8APIhjxarGggNFZ2I+aAYxlEQjWYzFY4AHJd2hGT94d9
         16plpGuwSB322BPg4ASSLuJp96lTCJmoqJEk7ql9P+wZP6O7xVkN5kBRM4/kUMSogvik
         0wjiSHV6aTtBT6fUUgkM2GpwkDxPM+1I4rLDaqDc/eRbwvk6S+bzO3R71iVt/8VbKoiG
         OXfw==
X-Gm-Message-State: AOJu0YwDHMVDiLPaQX9SPqMqUJSCWKbwtdE9KFcV9+0BubTRw9FQUitY
	pD08QJ1UIarKpY8gmSPzabrwA7/n5Z9s8+e0Tsf2WRzjVTIrMuELISEyqg==
X-Google-Smtp-Source: AGHT+IEIsc+7zSrej0MXLECEgdyv4mhuXvBY83rwSWkJ5hPdLrzblBefzq1OGMpzLciu8ehstFp7UA==
X-Received: by 2002:a05:6512:3e0d:b0:518:9ce1:a5bb with SMTP id 2adb3069b0e04-526c0b5dc0dmr4568580e87.54.1716471805471;
        Thu, 23 May 2024 06:43:25 -0700 (PDT)
Received: from gmail.com ([85.235.16.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5df00490cfsm780718566b.159.2024.05.23.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 06:43:25 -0700 (PDT)
Date: Thu, 23 May 2024 15:49:30 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [OE-core] [PATCH 1/2] image-bootfiles.bbclass: new class, copy
 boot files to /boot on rfs
Message-ID: <Zk9JakPbu4jT65op@gmail.com>
References: <20240521173343.2954628-1-marcus.folkesson@gmail.com>
 <66c6fe23-dbdf-40a5-ad5b-393b4d1239f9@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66c6fe23-dbdf-40a5-ad5b-393b4d1239f9@cherry.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199797

Hello Quentin,

First, thank you for your feedback.

On Thu, May 23, 2024 at 03:26:36PM +0200, Quentin Schulz wrote:
> Hi Markus,
> 
> On 5/21/24 7:33 PM, Marcus Folkesson via lists.openembedded.org wrote:
> > [You don't often get email from marcus.folkesson=gmail.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > image-bootfiles class copy files listed IMAGE_BOOT_FILES
> > to the /boot directory of the root filesystem.
> > 
> > This is useful when there is no explicit boot partition but all boot
> > files should instead reside inside the root filesystem.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >   meta/classes/image-bootfiles.bbclass | 69 ++++++++++++++++++++++++++++
> >   1 file changed, 69 insertions(+)
> >   create mode 100644 meta/classes/image-bootfiles.bbclass
> > 
> > diff --git a/meta/classes/image-bootfiles.bbclass b/meta/classes/image-bootfiles.bbclass
> > new file mode 100644
> > index 0000000000..850e14e4bb
> > --- /dev/null
> > +++ b/meta/classes/image-bootfiles.bbclass
> > @@ -0,0 +1,69 @@
> > +#
> > +# Writes IMAGE_BOOT_FILES to the /boot directory
> > +#
> > +# Copyright (C) 2024 Marcus Folkesson
> > +# Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> > +#
> > +# Licensed under the MIT license, see COPYING.MIT for details
> > +# Inspired of bootimg-partition.py
> > +#
> > +# Usage: add INHERIT += "image-bootfiles" to your conf file
> > +#
> 
> Since it's in meta/classes, I assume we can also inherit image-bootfiles in
> an image recipe?

Yes, that is how I do it right now.

> 
> > +
> > +def bootfiles_populate(d):
> > +    import re
> > +    from glob import glob
> > +    import shutil
> > +
> > +    boot_files = d.getVar("IMAGE_BOOT_FILES")
> > +    deploy_image_dir = d.getVar("DEPLOY_DIR_IMAGE")
> > +    boot_dir = d.getVar("IMAGE_ROOTFS") + "/boot"
> > +    install_files = []
> > +
> > +    if boot_files is None:
> > +        return
> > +
> > +    # list of tuples (src_name, dst_name)
> > +    deploy_files = []
> > +    for src_entry in re.findall(r'[\w;\-\./\*]+', boot_files):
> 
> Isn't this a more complex boot_files.split()? What do we gain from using
> this regex? If we have malformed IMAGE_BOOT_FILES, this would actually
> introduce some logic error:

Probably it is. The code is heavily based on the bootimg_partition [1]
wic plugin, and this regex comes from there.
The rationale to keep it was that it is probably well-tested already and
I want to keep the same behavior as bootimg_partition as I want it to be
interchangable.

> 
> >>> s="plop\\plip;plep plop;plap"
> >>> re.findall(r'[\w;\-\./\*]+', s)
> ['plop', 'plip;plep', 'plop;plap']
> 
> I'm pretty sure we don't want that. Instead, I would suggest to use split()
> and iterate over that, split(';'), check for each if there's 1 or 2 entries,
> add one if it's one.

Looks better to me. Thanks

> 
> > +        if ';' in src_entry:
> > +            dst_entry = tuple(src_entry.split(';'))
> > +            if not dst_entry[0] or not dst_entry[1]:
> > +                raise bb.parse.SkipRecipe('Malformed boot file entry: %s' % src_entry)
> > +        else:
> > +            dst_entry = (src_entry, src_entry)
> > +
> > +        deploy_files.append(dst_entry)
> > +
> > +    for deploy_entry in deploy_files:
> > +        src, dst = deploy_entry
> > +        if '*' in src:
> > +            # by default install files under their basename
> > +            entry_name_fn = os.path.basename
> > +            if dst != src:
> > +                # unless a target name was given, then treat name
> > +                # as a directory and append a basename
> > +                entry_name_fn = lambda name: \
> > +                                os.path.join(dst,
> > +                                             os.path.basename(name))
> > +
> > +
> > +                srcs = glob(os.path.join(deploy_image_dir, src))
> > +                for entry in srcs:
> > +                    src = os.path.relpath(entry, deploy_mage_dir)
> > +                    entry_dst_name = entry_name_fn(entry)
> > +                    install_files.append((src, entry_dst_name))
> > +            else:
> > +                install_files.append((src, dst))
> > +
> > +    for entry in install_files:
> > +        src, dst = entry
> > +        image_src = os.path.join(deploy_image_dir, src)
> > +        image_dst = os.path.join(boot_dir, dst)
> > +        shutil.copyfile(image_src, image_dst)
> > +
> 
> We literally iterate three times over the same files, I don't see a reason
> for not merging those three for loops into one?

Yes, that is probably better.

> 
> Also, I now realize that this was heavily inspired from what's in
> scripts/lib/wic/plugins/source/bootimg-partition.py, would have been nice to
> say so ;)

Yes it is, I have this text in the header

+#
+# Licensed under the MIT license, see COPYING.MIT for details
+# Inspired of bootimg-partition.py

Maybe I should make it more clear?

> 
> > +python bootfiles () {
> > +   bootfiles_populate(d),
> 
> Not entirely convinced we should have a comma after bootfiles_populate here?
> 
> More general question:
> 1) how does this work if one has a boot partition created by wic (via the
> plugin bootimg-partition?

The images will be copied to both the partition and /boot.

> 2) shouldn't we factor out this code here and bootimg-partition's? or make
> bootimg-partition somehow call bootfiles IMAGE_PREPROCESS_COMMAND to avoid
> code duplication?

I would love that. Not sure where to but it though, I'm still learning
the structure of poky.

I'm preparing a v2 with an indentation error and that the installation directory is configurable so
that it does not *have* to be /boot.
But I will probably wait one or two more daysto give people a chance to
give their comments.

> 
> Cheers,
> Quentin

[1] https://github.com/yoctoproject/poky/blob/master/scripts/lib/wic/plugins/source/bootimg-partition.py#L71

Best regards,
Marcus Folkesson


