Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AFEC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 21:36:37 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.34945.1660772191054304208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 14:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fzLX8Ddj;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id x25so20406ljm.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=LCDIUpLXGBueBIf1XQXFu0nQbfEtyRqM4VaUsC2pjMo=;
        b=fzLX8DdjN57E7KbzRoiHbLLe1NTNkZpwS6rr8X4t/me09WH0/EMWOdVhUjrK3SYd0E
         vkTIxr5+rvE8we0tsiolOLdairizOB7aehWnpKBklz+k8nXwh6bpLnTOLXzeRADVI8Nk
         76Ye8uZ3XxC1qa+ImKfhVBmKehgPdSIQHkoIIUyAxIEnK4RSVXTsZNYbDHHPik5qvANt
         Fbc3PjWVWh8wMXAyJRBvb+9BrFYGhoSEgOGBu8zzyu/wLVKWRn8WMK5ObjgJu30cJD58
         LIFiLaLLkjbwagUj+fMbj9bBzMqTzad/rRFGr6KPP1+G9pQho6JhJVuP5pVBUIAkHTC1
         hEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=LCDIUpLXGBueBIf1XQXFu0nQbfEtyRqM4VaUsC2pjMo=;
        b=fdA2tjhrzmHfTQ9qrgUWtjuHc7PrS3fyZLhUBI+GJTkmEDgTMCuo4678+w9arumL7U
         6tR4VXtz9B1TkI6qMGAsq7zlVHBoSYnK9kGogwGGP/VGFor5EmIQZazgZ0YHN1uyYCIl
         ImOeGp3HBXvUW4dtr1wleBGqYmVsjv4Nlfmb+YWVtpbkZ94al7WeFiKGqvJa3AtauY7K
         cWyTbYqYwoCBhFhmTaqaajcOdXWS7mZyr2cHMDXwGdaYxZqCXKz7862eIZJT22ny+cmN
         7Ej2rjBELLQVymCmVrsazqV6x2M4FKmaH3056r/XDhqJfn4Cx0HSUZZsrL2hkvqW4Zgm
         g+2g==
X-Gm-Message-State: ACgBeo0EKKhjoEgvrH7sxtz8PYzixYVqTe+Zfz3Jz+Fl8fvvzLXqq4F7
	QMY3KMP49rqt3uLcT14VfxHv2QyOa4VC+nn0qcw=
X-Google-Smtp-Source: 
 AA6agR5ca4JSWmc9JRA0FDyCMOEuMGZbpj2iEj31Nc/h3wfMlvXWB8p7EtBEaXFuC8YCJTbkLTmYMujSDS34aT7kmpk=
X-Received: by 2002:a05:651c:2120:b0:25e:5145:38b0 with SMTP id
 a32-20020a05651c212000b0025e514538b0mr51559ljq.191.1660772188720; Wed, 17 Aug
 2022 14:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-2-alex@linutronix.de>
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
In-Reply-To: 
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Aug 2022 23:36:16 +0200
Message-ID: 
 <CANNYZj-1c9cd1Q9LodoxrMxkhBTbOTdg3gb=TVyVdWJ6inMO4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] meta/files: add layer setup JSON schema and
 example
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 21:36:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169507

On Wed, 17 Aug 2022 at 22:52, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> One thing that concerns me a little is that this mixes two things,
> layer setup (as in repos) and configuration. I'm nervous about json
> config which effectively has to duplicate the list of machines/distros
> in layers.
>
> Where is the distro/machine data used?

The use case I was thinking of is doing something useful with this
information *before* doing actual checkout. I would even appreciate
knowing in advance - maybe even by just looking at the json through
gitweb ui - which machines, distros and config templates I would be
getting, and from which layers. Also the proposed oe-setup tool could
do useful things with this information, if it operates from the json
definitions in the same format. You can discover and supply all needed
information up front, and oe-setup will land you in a bitbake session.
Without it, you have to first do the layer setup, then the
configuration discovery, then the configuration setup, as separate
commands - I'd say that would be an inferior experience for the users.

> Are these the only config options people will want to add or will we
> have others? init system? libc? Or feature information about which
> configurations are expected to work? I worry this is a magnet for
> future feature creep and duplication of information.

These are not the same, as machines and distros are specifically
defined in layers as .conf files in pre-determined locations. Other
things are defined as variables in files, and aren't as easily
discoverable by code. I only want to allow programmatically
discoverable options (that are guaranteed to be in lockstep with the
layer revision) in the json; no one should ever write or modify the
json by hand.

> I can see where the buildconfigs are used but again, does the json file
> need to encode those or could you determine them by inspection of the
> layers once setup?

In addition to the above point (knowing them in advance is useful),
there is no fixed location for these in layers. You could perhaps walk
the layer trees, but I'd rather place the info in the json.

> Also, if there is new version of this series, could you squash in these
> copyright/license tweaks please:
>
> https://git.yoctoproject.org/poky/commit/?h=master-next&id=45b396298c1dd638bb702f5251b4a663f07978ca

This is the easy part :-) Hope the above clarifies a bit what went on
in my head when I was writing the code.

Alex

