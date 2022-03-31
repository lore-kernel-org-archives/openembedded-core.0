Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A0FC433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 14:42:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.7973.1648737767783342598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 07:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=iFNcqCJW;
 spf=pass (domain: burtonini.com, ip: 209.85.221.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f44.google.com with SMTP id h23so67308wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1WA5I91lWIkI6G5nGNwCSFomEOQJcIaCdqni5K1tVo=;
        b=iFNcqCJWA3zCXut2SHD7CPUsLNulvRJcWBgZ37GeBeJsnY1EwaPVsgawSYxNsZoHqW
         zdCr3AIWMs1lcVFv2xEklBydTYKaKj3j1EbFfRAJZngt7qPP1b0RmHT2X/IXyU0M38Dj
         ulEyOwde2r0S90nBO94diQFu9UW44moDFDosPyp4Hx6Uet21v8GBFyois9Quu7YKoMQl
         px2QkqM8VjaNzgHOq367OC5wHw1nqnJb64cKMugY/eQtv67VNTvIh1bSAPN+YrBGo+Mq
         hmnYvgjH5tvz0aNrdcC1Qf22+MkoUpCBeKo92S/n4B1HnvdLwWHOfdmichvM31NaHb+f
         JkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1WA5I91lWIkI6G5nGNwCSFomEOQJcIaCdqni5K1tVo=;
        b=6QXq/VLlTiRoG5dj4lNQQ62YGy6lWWnGax4+edlB8C+b/bHe8TogPpfhPuGtWLAdN3
         nXvuz5ZEFSYbTF7wr6M+XqRhlr6i1J2DkOMXQ7Qug8m7VzYIk9RSGm9lM2V5dG/RfwQ5
         dQp+2S8y1gX8XWzmtRcuAzIN7gXz8etYSG0tbyzF4Id404lI569sGe+N5dhBzAiv+OM9
         UkNx+7P38Fd8O3y4Cac+h/P+pML17auXOAL8G9wtYp8LS1lKeI4wTT/8nYjmyELIiDiP
         bMInSdvMqdnfSqnkEeXjW/nGUaugrqVgyTGfZjbELlpaGE3Ovx59FezOoRx+kwYqe0SU
         vk5A==
X-Gm-Message-State: AOAM533iJaJJgQgcBb/72B2rztqKJxFKWexXkuBqRq8L3wHnXNfkLfF5
	6XRLTC6hyR5v5WS0cr+ZlUuQStZrM2vN7Bac9S4ElQ==
X-Google-Smtp-Source: 
 ABdhPJyhru2YRNtk34vgBkzrrXNLfPzfzflNwH/vhgUta5O0fWpmzwBrm0Z5XnswvovBbS8YOawWa2SRwv9dRPoARDI=
X-Received: by 2002:adf:e74a:0:b0:1f0:25cb:3ad5 with SMTP id
 c10-20020adfe74a000000b001f025cb3ad5mr4481462wrn.231.1648737765727; Thu, 31
 Mar 2022 07:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220331110151.1562779-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220331110151.1562779-1-richard.purdie@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 31 Mar 2022 14:42:34 +0000
Message-ID: 
 <CAAnfSTvCdUZ7B6P02fWsCGmkdMhFTU9gu56qZKTQh_HRu=nMXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] base: Don't add duplicates to sys.path
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 14:42:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163838

Oh, this might explain some weird errors I was having.  See the
de-duplication patch last week or so for oeqa.

Ross

On Thu, 31 Mar 2022 at 12:01, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We can re-trigger this code and there is little point in stacking a ton of duplicate
> paths which just waste time during searches for modules. This could in theory alter
> layer module search order but that seems unlikely in common use.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index cc81461473f..e51722d945d 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -20,8 +20,8 @@ PACKAGECONFIG_CONFARGS ??= ""
>  def oe_import(d):
>      import sys
>
> -    bbpath = d.getVar("BBPATH").split(":")
> -    sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
> +    bbpath = [os.path.join(dir, "lib") for dir in d.getVar("BBPATH").split(":")]
> +    sys.path[0:0] = [dir for dir in bbpath if dir not in sys.path]
>
>      def inject(name, value):
>          """Make a python object accessible from the metadata"""
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163808): https://lists.openembedded.org/g/openembedded-core/message/163808
> Mute This Topic: https://lists.openembedded.org/mt/90152116/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

