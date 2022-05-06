Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC2BC433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 07:09:25 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.6674.1651820957059521111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LAP+2CO6;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id x17so11066952lfa.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XYh917TCZZVI9HwvNfLeSH4XHfVITOQfNCszEZ+DVus=;
        b=LAP+2CO6eh9ScDZKC+NFHbLXTf2gTXQuhSQ97aPu4o5OldMWd/EWk0J9N8VTBwr1ui
         lgBFMuspnwgqzNBGh7kKyjOTc4bIchpk+gAnuA/dG/zgR6SvXzdWqhPXd/nL92NNT2Na
         GIzYc+2NW/vpo9gZHDSFVAoWMjDrlll4rHG6Uv3guh0OO73I3QpH1DGq8dPZodbqInMh
         VQb4WddxKKa1VombKy5FY55jgNpQEKTdkyq2vPkosPRcLGKtR9KbA8MgutW/p0PpSD6F
         +9mSeWbMzPsVBNz7h098sMJDMrfs+7UB+827MQTYsmMCyO/kdNffkhXfUycQ+gS+AoAO
         MEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XYh917TCZZVI9HwvNfLeSH4XHfVITOQfNCszEZ+DVus=;
        b=J/lx5sBeUNVRMOir4nE3G0/16Iz43/CTJoZlrb7uyx8sbOu4Rr1kwl1WmWGLMbdjum
         vOEQfd3YP9PKrir9OTYOgR1Ulwy2sw75E4qaLXsz4wKiUX13EqFjt/fW9CLydCjgwuBD
         KAJh9rZcYsrP9iF9/JQX+pbE7tcHF7ORHoxhN0XGvnimLmBo5gTGbDjw+yiryNhAS0tU
         4GNHrflf3UavNg7GRZd3Z+AZBXGrFmATaBuXv/qO9CSsZF5ItCBtNI5ye+nNttx9hNBj
         0UALaGag0jPmiJhgxnKGX1v9dD8QQNtNI2YMyB8d7W/jFI4IIwI4AZNjOohBZEmz5J3O
         CMbg==
X-Gm-Message-State: AOAM530suiTk1T7M8WUFuLM4pwqLCjGU8K1NwH3V11dkBdU4c4AMEBA2
	ViCmZ4bpaVba593ZcrcMmc3Is2alrQgzWUDzVb4=
X-Google-Smtp-Source: 
 ABdhPJwv8OzRmliI3o3rmP3B9DhKSZZrVkCzmK16uUdAxmXwfIuMo/kuUzOOCEasMhAEfidyv9dUItmys9BpxKlKYjY=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr1479827lfo.358.1651820955247; Fri, 06
 May 2022 00:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 May 2022 09:09:03 +0200
Message-ID: 
 <CANNYZj_bYU0RFtyaTzeVWZMCHfxtQwP-Vjt7ovqOHh8+SWduHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] recipetool-create: add ensure_native_cmd
 function
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Lukas Funke <lukas.funke@weidmueller.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 07:09:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165330

I think the terminology is a bit confused here, instead of 'command'
it should say 'recipe'. Also:
"""Check if the command is available in the recipes""" is not
everything it does, it also builds the recipe.

And please write a commit message that explains what and why.

Alex

On Fri, 6 May 2022 at 09:00, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Lukas Funke <lukas.funke@weidmueller.com>
>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  scripts/lib/recipetool/create.py | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> index 824ac6350d..efcb82173e 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1375,6 +1375,29 @@ def convert_rpm_xml(xmlfile):
>                      values[varname] = child[0].text
>      return values
>
> +def ensure_native_cmd(tinfoil, cmd):
> +    """Check if the command is available in the recipes"""
> +    if not tinfoil.recipes_parsed:
> +        tinfoil.parse_recipes()
> +
> +    try:
> +        d = tinfoil.parse_recipe("%s-native" % cmd)
> +    except bb.providers.NoProvider:
> +        bb.error("Nothing provides '%s-native' which is required for the build" % cmd)
> +        bb.note("You will likely need to add a layer that provides %s" % cmd)
> +        sys.exit(14)
> +
> +    bindir = d.getVar("STAGING_BINDIR_NATIVE")
> +    cmdpath = os.path.join(bindir, cmd)
> +
> +    if not os.path.exists(cmdpath):
> +        tinfoil.build_targets("%s-native" % cmd, "addto_recipe_sysroot")
> +
> +        if not os.path.exists(cmdpath):
> +            bb.error("Failed to add '%s' to sysroot" % cmd)
> +            sys.exit(14)
> +
> +    return bindir
>
>  def register_commands(subparsers):
>      parser_create = subparsers.add_parser('create',
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165323): https://lists.openembedded.org/g/openembedded-core/message/165323
> Mute This Topic: https://lists.openembedded.org/mt/90928682/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

