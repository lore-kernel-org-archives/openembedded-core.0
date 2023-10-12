Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5A0CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:08:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.12427.1697119713512576220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xKnkitzn;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so1415648a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 07:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697119712; x=1697724512; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruzwXSr9e7JYOU0Toi+Z75EZ4O+nEdtWHTzzYATL3fA=;
        b=xKnkitznC4LMOrlhqbvY16WsAh6jMVN54W/VEognhltCOPCu+z76+FEgfMnn/TimrW
         w9iYbv81ZJ2DRbRl+5SeVjJlzfP2T5AYf0/1li38CmBkek3U31+yHuYURp8Mh/yEuGEq
         u3eidQ+y/MU163JOl+ph6Kg0H0iIpZmzQbwrz10KlZDL/7UPxt3q1VuFC8Qv6sOLnZ/U
         uPbWa8M/dC8ZDK3nO+BE1RcSCK+OOzRG1/yYPHnc0IFv6uJSdgyCBd3stDAP7Z05dSFl
         V/P/WvLnh5gWRsHwD6//AnmI8b5env36nOz69qb14E+syLajNL1vGu24JM/OOiLe4Pxo
         8scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119712; x=1697724512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruzwXSr9e7JYOU0Toi+Z75EZ4O+nEdtWHTzzYATL3fA=;
        b=NOUYVP4lT9tvVcMJpw7IzEwII8pCLPHeFEzliyubBqrRfjWfOw3avgSVusT43a5aN3
         +UhcgJtD8527Eb1v6JuC8hjMZWA4s1XE28CJMnNOvwRN3W5lbkibBZIuMRHQXTHSZmL0
         CQUx2Tlg+bRrTyYmEUbiu/l802DHK5hEk+sfX+yc9h6puPxZ5ekiSFtlzsC457XirYmV
         xtO27ILctQtF+lwWVmULbHqF7rs3NWei0H2cewnmzml/1xIVeGg0rP1Rs+peXwixsprA
         84xlBsctD4BlctYJrhmlgWR+kEScSKIa6i+sOryqbHWukH2WmDRKzEWdXvXC9rU/fmdg
         KnAQ==
X-Gm-Message-State: AOJu0YxJhjNSGnPVGy3qhtBgMbl3l1u6qr7TGSLaOqVAb8fHvUj+NhTx
	lSc+FJSPS3xCUkkdi6lNSqoHPFxSH0OWcOeNwWoWZxUQWDrxLR0J
X-Google-Smtp-Source: AGHT+IEp0t0XWPgYMxd2itr5Acl5pXPQYRjeHvRENG6xxUAfbGOOQ6eUy4D2/dKHpgNBIGTBR2FOeu6LNn4GR2cgK9Y=
X-Received: by 2002:a17:906:8472:b0:9b2:6fec:3e5e with SMTP id
 hx18-20020a170906847200b009b26fec3e5emr20194976ejc.55.1697119711639; Thu, 12
 Oct 2023 07:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20679.1697091557461045335@lists.openembedded.org> <20679.1697091902505998029@lists.openembedded.org>
In-Reply-To: <20679.1697091902505998029@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 12 Oct 2023 04:08:20 -1000
Message-ID: <CAOSpxdaOWoGu3MnOJwZUuT2JmcafoufLW0bLFOqfmBd7ogt3+g@mail.gmail.com>
Subject: Re: [OE-core] [mickledore] glibc: stable 2.37 branch updates.
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 14:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189000

On Wed, Oct 11, 2023 at 8:25=E2=80=AFPM Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Yocto bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15231 raise=
d for failures cases analysis.

I assume that I should wait to take this patch until the analysis is done?

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188985): https://lists.openembedded.org/g/openembedde=
d-core/message/188985
> Mute This Topic: https://lists.openembedded.org/mt/101774187/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

