Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.4668.1591077883122199778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 23:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJFx6FmD;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id 82so5413228lfh.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 23:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Qc3U+RrQF9mmVG0sLIu8hWUji/+JNr7W2s7Czr2rft8=;
        b=gJFx6FmDXvB2QS411banaKwgNHFrjWO1q7fK1vA1oszSeaTO7eefZQdKPWb/kiUQ3+
         C3nMOyyXt43LaStvNr9pJjlhrbszD2jtZX7zfuEnc2QsMiDPCToqCuw9Oe6Y7epZpHx7
         kfICIVjL+iXgB9kSsjVkn4xaQJypzJHzzW5lCUMJW9cLMIrWEdpvGOADgf7rMg54wRP5
         P9mH4DELLIfk1WuOpaJ3n/tmQXcuRKmxA+ivBPjx4Y71k39mhaAo9Ab5XszWk4V4ntra
         u2JmZNWeQVSkxyn0a/nEx5E280Yt4kRpeFvirmQ7shKqHmRVZYzgt+IH0sCNnmdEmvgC
         R+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qc3U+RrQF9mmVG0sLIu8hWUji/+JNr7W2s7Czr2rft8=;
        b=f0J1ZBvINq9KkjhXTL46z06QCzGSABOU2y+6+gtOsGDBTuE0BMvdeShLkGkJrGET3q
         lCOE5Fm1oA5W0vXV0BOuYjXfwTIekgQ1JftcY0Ph9nXmz4PnmldAge3Ux/upqPczt3hU
         dxCJWEY6mfp18Fxcr3CmNeWnYgfiu4RXAYjGnAaNFUK+WcRdeB6sYn3LIo6sClz86lmZ
         ofqzHSUaIGjUCuumWml4hQK65Ro+HEf7v9PJ1OB0xPa9//30bFGmVTBZF9JZLJ6HVqlP
         PQXBpB53G9W3CE1VgRw7yw+/n72MCKexXtyVeSzSjGHh3IZaeB0+/AtsPaMy1aJEv1yf
         sFvQ==
X-Gm-Message-State: AOAM532nijlmIpoaNEkbgczOVwPyJbq+wc/MfO3uuWtAf0ZX5cZ8B20c
	21awVbQNWarfk6I1Dlgi0j2v+ZLq
X-Google-Smtp-Source: ABdhPJy1YV6NrOIBMg409QTmiCpMsLEipfgSFO1fwEf8DaGuO0Ugr3e/Rd6IFjPAGYWjmOwc8zFWKw==
X-Received: by 2002:a19:cb92:: with SMTP id b140mr13384191lfg.63.1591077880378;
        Mon, 01 Jun 2020 23:04:40 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id w25sm439682lfn.42.2020.06.01.23.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 23:04:39 -0700 (PDT)
Subject: Re: [PATCH] features_check: Factorize code for checking features
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
References: <20200526073623.38078-1-jacob.kroon@gmail.com>
Message-ID: <0c555301-e1eb-292f-82e3-47b1d87ff6dc@gmail.com>
Date: Tue, 2 Jun 2020 08:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526073623.38078-1-jacob.kroon@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/26/20 9:36 AM, Jacob Kroon wrote:
> The DISTRO/MACHINE/COMBINED features should be treated identically, so
> convert the expanded code to a loop. This fixes some of the COMBINED error
> messages which were previously referring to MACHINE features. There
> should be no functional changes.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>   meta/classes/features_check.bbclass | 110 ++++++++--------------------
>   1 file changed, 32 insertions(+), 78 deletions(-)
> 
> diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
> index 876d32e315..4ba827d4ab 100644
> --- a/meta/classes/features_check.bbclass
> +++ b/meta/classes/features_check.bbclass
> @@ -1,23 +1,13 @@
> -# Allow checking of required and conflicting DISTRO_FEATURES
> +# Allow checking of required and conflicting features
>   #
> -# ANY_OF_DISTRO_FEATURES:     ensure at least one item on this list is included
> -#                             in DISTRO_FEATURES.
> -# REQUIRED_DISTRO_FEATURES:   ensure every item on this list is included
> -#                             in DISTRO_FEATURES.
> -# CONFLICT_DISTRO_FEATURES:   ensure no item in this list is included in
> -#                             DISTRO_FEATURES.
> -# ANY_OF_MACHINE_FEATURES:    ensure at least one item on this list is included
> -#                             in MACHINE_FEATURES.
> -# REQUIRED_MACHINE_FEATURES:  ensure every item on this list is included
> -#                             in MACHINE_FEATURES.
> -# CONFLICT_MACHINE_FEATURES:  ensure no item in this list is included in
> -#                             MACHINE_FEATURES.
> -# ANY_OF_COMBINED_FEATURES:   ensure at least one item on this list is included
> -#                             in COMBINED_FEATURES.
> -# REQUIRED_COMBINED_FEATURES: ensure every item on this list is included
> -#                             in COMBINED_FEATURES.
> -# CONFLICT_COMBINED_FEATURES: ensure no item in this list is included in
> -#                             COMBINED_FEATURES.
> +# xxx = [DISTRO,MACHINE,COMBINED]
> +#
> +# ANY_OF_xxx_FEATURES:        ensure at least one item on this list is included
> +#                             in xxx_FEATURES.
> +# REQUIRED_xxx_FEATURES:      ensure every item on this list is included
> +#                             in xxx_FEATURES.
> +# CONFLICT_xxx_FEATURES:      ensure no item in this list is included in
> +#                             xxx_FEATURES.
>   #
>   # Copyright 2019 (C) Texas Instruments Inc.
>   # Copyright 2013 (C) O.S. Systems Software LTDA.
> @@ -26,63 +16,27 @@ python () {
>       if d.getVar('PARSE_ALL_RECIPES', False):
>           return
>   
> -    # Assume at least one var is set.
> -    distro_features = set((d.getVar('DISTRO_FEATURES') or '').split())
> -
> -    any_of_distro_features = set((d.getVar('ANY_OF_DISTRO_FEATURES') or '').split())
> -    if any_of_distro_features:
> -        if set.isdisjoint(any_of_distro_features, distro_features):
> -            raise bb.parse.SkipRecipe("one of '%s' needs to be in DISTRO_FEATURES" % ' '.join(any_of_distro_features))
> -
> -    required_distro_features = set((d.getVar('REQUIRED_DISTRO_FEATURES') or '').split())
> -    if required_distro_features:
> -        missing = set.difference(required_distro_features, distro_features)
> -        if missing:
> -            raise bb.parse.SkipRecipe("missing required distro feature%s '%s' (not in DISTRO_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
> -
> -    conflict_distro_features = set((d.getVar('CONFLICT_DISTRO_FEATURES') or '').split())
> -    if conflict_distro_features:
> -        conflicts = set.intersection(conflict_distro_features, distro_features)
> -        if conflicts:
> -            raise bb.parse.SkipRecipe("conflicting distro feature%s '%s' (in DISTRO_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
> -
> -    # Assume at least one var is set.
> -    machine_features = set((d.getVar('MACHINE_FEATURES') or '').split())
> -
> -    any_of_machine_features = set((d.getVar('ANY_OF_MACHINE_FEATURES') or '').split())
> -    if any_of_machine_features:
> -        if set.isdisjoint(any_of_machine_features, machine_features):
> -            raise bb.parse.SkipRecipe("one of '%s' needs to be in MACHINE_FEATURES" % ' '.join(any_of_machine_features))
> -
> -    required_machine_features = set((d.getVar('REQUIRED_MACHINE_FEATURES') or '').split())
> -    if required_machine_features:
> -        missing = set.difference(required_machine_features, machine_features)
> -        if missing:
> -            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in MACHINE_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
> -
> -    conflict_machine_features = set((d.getVar('CONFLICT_MACHINE_FEATURES') or '').split())
> -    if conflict_machine_features:
> -        conflicts = set.intersection(conflict_machine_features, machine_features)
> -        if conflicts:
> -            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in MACHINE_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
> -
> -    # Assume at least one var is set.
> -    combined_features = set((d.getVar('COMBINED_FEATURES') or '').split())
> -
> -    any_of_combined_features = set((d.getVar('ANY_OF_COMBINED_FEATURES') or '').split())
> -    if any_of_combined_features:
> -        if set.isdisjoint(any_of_combined_features, combined_features):
> -            raise bb.parse.SkipRecipe("one of '%s' needs to be in COMBINED_FEATURES" % ' '.join(any_of_combined_features))
> -
> -    required_combined_features = set((d.getVar('REQUIRED_COMBINED_FEATURES') or '').split())
> -    if required_combined_features:
> -        missing = set.difference(required_combined_features, combined_features)
> -        if missing:
> -            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in COMBINED_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
> -
> -    conflict_combined_features = set((d.getVar('CONFLICT_COMBINED_FEATURES') or '').split())
> -    if conflict_combined_features:
> -        conflicts = set.intersection(conflict_combined_features, combined_features)
> -        if conflicts:
> -            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in COMBINED_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
> +    for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
> +        # Assume at least one var is set.
> +        features = set((d.getVar(kind + '_FEATURES') or '').split())
> +
> +        any_of_features = set((d.getVar('ANY_OF_' + kind + '_FEATURES') or '').split())
> +        if any_of_features:
> +            if set.isdisjoint(any_of_features, features):
> +                raise bb.parse.SkipRecipe("one of '%s' needs to be in %s_FEATURES"
> +                    % (' '.join(any_of_features), kind))
> +
> +        required_features = set((d.getVar('REQUIRED_' + kind + '_FEATURES') or '').split())
> +        if required_features:
> +            missing = set.difference(required_features, features)
> +            if missing:
> +                raise bb.parse.SkipRecipe("missing required %s feature%s '%s' (not in %s_FEATURES)"
> +                    % (kind.lower(), 's' if len(missing) > 1 else '', ' '.join(missing), kind))
> +
> +        conflict_features = set((d.getVar('CONFLICT_' + kind + '_FEATURES') or '').split())
> +        if conflict_features:
> +            conflicts = set.intersection(conflict_features, features)
> +            if conflicts:
> +                raise bb.parse.SkipRecipe("conflicting %s feature%s '%s' (in %s_FEATURES)"
> +                    % (kind.lower(), 's' if len(conflicts) > 1 else '', ' '.join(conflicts), kind))
>   }
> 

Ping ? Any feedback on this proposed change ?

Jacob
