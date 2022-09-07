Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27FFC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 09:15:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.5581.1662542137187251543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eXabAQUM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k9so19368155wri.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=0/rUAA4ZMAwiI2IY8BZgke2ovV0FsSvCM3n5UzFyi7E=;
        b=eXabAQUMNDoJxSRqJaZj4WOMxUzkfi6oORfnQXTyuwJ3WGkIAVXpPi++l29ZLkwNW/
         GWuRhNkmNzfUaOo8peGKZDl+KXb+Q5kSYbvpPoyIielNtGXJkLfWXfOGsloEQXSy5JIp
         oEyC9nvro6IYWrlPfQwr+jbPazvdTog0frDo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=0/rUAA4ZMAwiI2IY8BZgke2ovV0FsSvCM3n5UzFyi7E=;
        b=EPAMHuj48VvhC/Piya47xXp6PQTKkh76ndGk09Qg7P3/7brUg2C/AztWMwworXfbjk
         lw2iJlKx0pZE92Wbc6lcYFUwXYS5FT9u3K4apPx/7MvaoZMzbah9MmhJxcJRFbrKVNPo
         6Z6J4ljYCD1p2Y/BWCTZ6pZUtY/BkEQhm3K0XxWMZy+X5ikFUCsMh3EcYEkqYviEwMjh
         0ZAtrKh+6AH9Yfl/x+omQAGdAix0X4ZF16jrpbsU5wmT6qZGNty/UR+flURnvad0JML0
         ubqf6HZTUjxGajxQJqPO9xpDCJIUIzcjhlyXA3nLHTzadRJFlw1qpEk5rUQ7uYLNXRwB
         xtfw==
X-Gm-Message-State: ACgBeo0+B4K/27OLSwkBeJl96Xzh3AwuopUhReB8HJopn12un2ZtoTRU
	y1DT8Ym5gkfBG7I8jcs5eZfVyw==
X-Google-Smtp-Source: 
 AA6agR6+Yc3yDG89dtXlMlF3WoY6w4soey5XncpwjaaUHwiSSuU2qbyng6wj8z1YJd8VGApiQkL/+g==
X-Received: by 2002:a05:6000:2c4:b0:225:6782:5755 with SMTP id
 o4-20020a05600002c400b0022567825755mr1512603wry.299.1662542135552;
        Wed, 07 Sep 2022 02:15:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb69:bb70:edb:6315?
 ([2001:8b0:aba:5f3c:eb69:bb70:edb:6315])
        by smtp.gmail.com with ESMTPSA id
 i17-20020a1c5411000000b003a1980d55c4sm24839521wmb.47.2022.09.07.02.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 02:15:34 -0700 (PDT)
Message-ID: 
 <86b2113a64d9432126fe69f7fa15d7372ee5460d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] oe-setup-build: add a tool for
 discovering config templates and setting up builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 07 Sep 2022 10:15:33 +0100
In-Reply-To: <20220905182141.1091053-1-alex@linutronix.de>
References: <20220905182141.1091053-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 09:15:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170377

On Mon, 2022-09-05 at 20:21 +0200, Alexander Kanavin wrote:
> This is the last (I believe) piece of the puzzle in setting up builds
> from nothing without having to write custom scripts or use external
> tools.
>=20
> After layers have been fetched and placed into their respective=C2=A0
> locations, one would surely want to proceed to the actual build, and=C2=
=A0
> here's how:

To set expectations, I'm probably not going to merge this for 4.1. I
think we've taken some really good steps in the direction we need so
far but we don't want to rush this. I haven't had the time needed to
look at these patches properly due to everything else that was
breaking.

That doesn't stop review ad refining the patches ready for 4.2 opening.
I'm open to representations if everyone thinks this is ready but I get
the feeling many are distracted atm.

Cheers,

Richard

