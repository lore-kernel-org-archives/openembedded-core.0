Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E9ECA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 10:33:06 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.18293.1757068385208432180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmByVnIl;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-721504645aaso15583546d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757068384; x=1757673184; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EZQlyipQIT/XgEqFGaxjtUDh7WgOczGVIlLYFZQ4Ze8=;
        b=YmByVnIl9/rmayUKGoRwxvWH4tkEuDel9kZL1qY4ukXbMo4YERnbdNEjp/5NYNbYZc
         ZMz8+wgYCaOQPX8JdOAdAiXCySeUUcgbVIDNhupn/+WqklkNaxntp8X7v4zRRXVqT/HR
         E0Ba4nESEMQEIeU3525kz4+fiJPfdTdYO/DfeV9hMGzVgAErARWQ6vAhGX21cfvtKWwi
         NoNqRxRX9bnaVHKPHYIM3F6+OxhxFyLIpxza+RSvdup0GijO9tMEP7UxVk7+JPnGIU3N
         aBp4CJAr1Q3JNTCnCMOE8tTyp1O+glqswkGvHfFUmuSxFXrdgLeh0yMXwY7j3XwihPfl
         eMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068384; x=1757673184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZQlyipQIT/XgEqFGaxjtUDh7WgOczGVIlLYFZQ4Ze8=;
        b=sYOPb9S/6FU8tfAy7jLkUzRJAgx7/pngjFoAFIQ0UCUDaDAN8uMH5wsPGUFVONrD+w
         qPpNhqguGM5IzTUsG9vc1R0X4zfmSTZEG501caFgZbTq7TB0Wrm5GFf9R8QRT7A2FOLF
         3aRp43HdCkoogMTrdREVpcfqgmflYLejQh0t51S2Ne+DDuaoApDZxh7AYle5ieMCuWv8
         KaehvV38lrrQBR/pM/io/66eyK6+kpOBKEnCvXkBms5PG1NmeumMuTntD7YtIdDctdVd
         1diawK/Zjp3898NuQNc8WsRkPmzY51FmpbvhYHcOhFK3tfWYzgL6wxQHrmVfXv6UB0l4
         /mgA==
X-Gm-Message-State: AOJu0YwigDJVkkAj5eJmrJtfglS197jd0uu/7Yy8yU1bN123lje5Plp8
	Z7OgCM2EEZqniVZXmuBTu8GU/RyuJ8PM7xyD0AD41EoJ6emX6G3tp6ZwL2d/R3LR/vrdkT95E6I
	Ivq0paKTz4QuKs3yxkTFrrovqP35N1ST7mw==
X-Gm-Gg: ASbGncsa/loMIvyHsgfE6hW893QvcA52CqIIreooKU80pxx81o5uy+xg1fo/EXYaoTm
	ATsoKfmfC4T37MUSftH3fyIf8IkFE8SccobRDnPSlEEyXgX8vj6UkgiZ4kd29UbAPlPSmYy6nIa
	G7szM7HT6Y6bQo3HEJKIcyGBI6lI4R41t40qID5Tab1HBoBV0n2mbPJsxtQ4TOLXmjCHT1dbN7m
	QnVD65/Nnw4RP9eOWHGG5DtSUsBo87Jl7p9eBQ3i0L5dGrRUUrof32HJa9vt8imi41Tid5GjJxK
	oV+wCW9En+FawGvxLZwQrAIvdZI4ceto3H0lVtL7
X-Google-Smtp-Source: AGHT+IGZD6U9n+1B/BWS2INyfnc/X6desrS/TsfprrBLk76AMzQVIjFTdI5x+YYpw/U5ezl8TNVDF5Xy93EbfOIh2B8=
X-Received: by 2002:a05:6214:1308:b0:70d:daae:c5ff with SMTP id
 6a1803df08f44-70fac89eb40mr267281766d6.39.1757068383920; Fri, 05 Sep 2025
 03:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250904-show-fragments-v1-1-ff41f5a75959@bootlin.com>
In-Reply-To: <20250904-show-fragments-v1-1-ff41f5a75959@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Sep 2025 12:32:52 +0200
X-Gm-Features: Ac12FXw6wOZ0PsKyB5fAkkDs_tobPeArKhMPTT6AmJnxWOuFE_u8H3CkEm96Ciw
Message-ID: <CANNYZj9fP8uhOr2+jOJDbvJPvNY=TF4U6vxw_RAm6reum2zLmw@mail.gmail.com>
Subject: Re: [PATCH] lib/configfragments: add a show-fragments command
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 10:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222982

Thanks, lgtm. Hopefully takes away some of the 'magic' behind
fragments, and encourages people to start making them :)

Alex

On Thu, 4 Sept 2025 at 15:18, Antonin Godard <antonin.godard@bootlin.com> wrote:
>
> We can print information on fragments (name, location, description,
> etc.), but not their content.
>
> Add a show-fragment command to do that. It can be used as follows:
>
>   $ bitbake-config-build show-fragment core/yocto/sstate-mirror-cdn
>
> And prints:
>
>   .../meta/conf/fragments/yocto/sstate-mirror-cdn.conf:
>
>   BB_CONF_FRAGMENT_SUMMARY = "Use prebuilt sstate artifacts for standard Yocto build configurations."
>   BB_CONF_FRAGMENT_DESCRIPTION = "The Yocto Project has prebuilt artefacts available for standard build configurations. \
>   ...
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  meta/lib/bbconfigbuild/configfragments.py | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
> index 61c33ac316..fce3301bac 100644
> --- a/meta/lib/bbconfigbuild/configfragments.py
> +++ b/meta/lib/bbconfigbuild/configfragments.py
> @@ -156,6 +156,18 @@ class ConfigFragmentsPlugin(LayerPlugin):
>          if modified:
>              print("Fragment {} removed from {}.".format(", ".join(args.fragmentname), args.confpath))
>
> +    def do_show_fragment(self, args):
> +        """ Show the content of a fragment """
> +        for layername, layerdata in self.discover_fragments().items():
> +            fragments = layerdata['fragments']
> +            for fragment in fragments:
> +                if fragment['name'] == args.fragmentname:
> +                    print(f"{fragment['path']}:")
> +                    print()
> +                    with open(fragment['path']) as fd:
> +                        print(fd.read())
> +                    return
> +
>      def do_disable_all_fragments(self, args):
>          """ Disable all fragments in the local build configuration """
>          def disable_all_helper(varname, origvalue, op, newlines):
> @@ -181,5 +193,8 @@ class ConfigFragmentsPlugin(LayerPlugin):
>          parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
>          parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment', nargs='+')
>
> +        parser_show_fragment = self.add_command(sp, 'show-fragment', self.do_show_fragment, parserecipes=False)
> +        parser_show_fragment.add_argument('fragmentname', help='The name of the fragment')
> +
>          parser_disable_all = self.add_command(sp, 'disable-all-fragments', self.do_disable_all_fragments, parserecipes=False)
>          parser_disable_all.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
>
> ---
> base-commit: 0a849dc7edeecb6c16a8a0fe347015d6d85e9dfd
> change-id: 20250904-show-fragments-140f8a1265a1
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>

