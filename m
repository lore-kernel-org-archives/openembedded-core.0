Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A5AC636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:32:40 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.10302.1677159153920775547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xde+AFQE;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id f9so5653039iox.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yiyAqku17uvF5i6SIZSNMc0fy8BGf3CmUTWhneNLalI=;
        b=Xde+AFQEBhvikZ9R5Fqrlt0ZqnPe1CEHBazJly11Oq7G/F1degacEOneTf4deKJGcU
         Wu2G9rB9BcDAddrvf7jeKhcwxGGn2qAFMt4JRBzOcasB+cF9OjTsaH9aprd51FKykJUM
         4Xqz3eHbDQa6DlplNZ/HXTlWw9DiQBVH7dAk4kqiG2E72/rB30TkHUMWYPbYdfZwRCIi
         x0nMenIKFNDbdmePYvKdeT/E78oA3ftp9uz4mEqHs5OCebPkBBBT+ySxKYFkNm1Th+v/
         mmGqD5gfcsNi+kcivOnCdZpMAeZn1bpIGd2yZ3DACpd800SwQ4UqxLjwSIIbPygkx333
         s00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiyAqku17uvF5i6SIZSNMc0fy8BGf3CmUTWhneNLalI=;
        b=gxGuFr5WY1Zo56M/lgSmXpm/Fyux6pYYKn1QbvTFu0RNQoucXc5PnDyWbRKu9D+cwm
         j+IkF6FyolIRvpicDrMiaZ6KfXaWHB+0tpICk1XhKdl6tbYdvY4sfRdJa/Nqy4TXaOS+
         2XRf4pKR68OLnEq6rwpzsnkyyj3CV33ygcUJbsNsKiFZMlndi1S9HxLUJKbIl1WNmrTC
         xIOI4y9ZWISZmJoTqX5i4f0LKNy7TzNjYBvd5zHOljRMsSWjorfzrrBL2X5oCshRJSO7
         auRJ4bzmOOPDLljayPyBsL93SLXk+W4VkXmVL8jOmdnXRFNV3vNM36K96zQSvBmo5gc6
         ipig==
X-Gm-Message-State: AO0yUKXxPtL45OmHrpeST/IYLSW+BnvbUnFuj05vLNay6LRgxjx9Gxby
	gyMujiG504UntgtcBYn0kSJQkSq0CpmcUX2bGqM=
X-Google-Smtp-Source: AK7set+G9hf4qRdMYuujX3m71T+YuPCy5WnNK4sZaJLCliI8xlwzU9NXTSdwFxqAWDWcnaIW52inWKpzeVxUK1tGNlo=
X-Received: by 2002:a02:85c6:0:b0:3e1:fb3d:4dce with SMTP id
 d64-20020a0285c6000000b003e1fb3d4dcemr2861099jai.0.1677159153116; Thu, 23 Feb
 2023 05:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20230223062754.3162249-1-chee.yang.lee@intel.com>
In-Reply-To: <20230223062754.3162249-1-chee.yang.lee@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Feb 2023 08:33:23 -0500
Message-ID: <CADkTA4MV5JMfhG6hSCHqRO2RSguE9k-DCYHX6h8R9_xRD_0TOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] checklayer: check for patch file upstream status
To: Lee Chee Yang <chee.yang.lee@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177606

I don't recall the upstream-status being added as a yocto
compatibility requirement. Can someone point me to a discussion that I
missed ?

As everyone can recall, I wasn't on board with this being a default QA
check and error, and I'm also not on board with it being a yocto
compliance error.

I realize it isn't being made an error in this patch, but I wanted to
raise my concerns now, before someone throws that switch.

Bruce

On Thu, Feb 23, 2023 at 1:28 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> yocto-check-layer to check all .patch file in layer for
> Upstream-status and list down all .patch file without Upstream-Status.
> Since upstream-status is additional Yocto Compatible requirement,
> set this test as expected failure for now so it wont fail final
> result.
>
> [YOCTO #14642]
>
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  scripts/lib/checklayer/cases/common.py | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
> index 722d3cf638..8fb37e175f 100644
> --- a/scripts/lib/checklayer/cases/common.py
> +++ b/scripts/lib/checklayer/cases/common.py
> @@ -72,6 +72,21 @@ class CommonCheckLayer(OECheckLayerTestCase):
>                  self.tc.layer['name'])
>              self.fail('\n'.join(msg))
>
> +    @unittest.expectedFailure
> +    def test_patches_upstream_status(self):
> +        patches = []
> +        for dirpath, dirs, files in os.walk(self.tc.layer['path']):
> +            for filename in files:
> +                if filename.endswith(".patch"):
> +                    data = ""
> +                    ppath = os.path.join(dirpath, filename)
> +                    with open(ppath, 'r', encoding='utf-8', errors='ignore') as f:
> +                        data = f.read()
> +                    if not re.search(r'^Upstream-Status', data, flags=re.I + re.M):
> +                        patches.append(ppath)
> +        self.assertEqual(len(patches), 0 , \
> +                msg="Layer contains patches without upstream status:\n%s" % '\n'.join([str(patch) for patch in patches]))
> +
>      def test_signatures(self):
>          if self.tc.layer['type'] == LayerType.SOFTWARE and \
>             not self.tc.test_software_layer_signatures:
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177599): https://lists.openembedded.org/g/openembedded-core/message/177599
> Mute This Topic: https://lists.openembedded.org/mt/97178225/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

