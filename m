Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2F2C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 14:24:44 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.74493.1674743082774254314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 06:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GWJ4PbF6;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id a11so3343073lfg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 06:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dJmcJiIQKG7YTx0JjWakdUQ2j8dDuubvepwqIE7zUpI=;
        b=GWJ4PbF6jsEQhtur2Avf3w3OEvnJOBasNzf2siG+t3GdiHf2piYyhgWfzfLEFnjP/K
         FbaCeNkXV2R5BFERtFn8KidM8pAgoNt2u35PmqeuNnAGVZ1FtgOnF1XI8/eiPxWeqE2H
         LV5kE9zJopyJljFU7ya+4kCDKfFeChASJd0hUitF/nVobFLkn6hcMl6dQDvmrwG8tDIk
         tGyNg87OPl3M/go4VrvYsaGem09Qtmdxmj5FR1UzQGs7/luo4vhnPYJiwJN2A4VSejJe
         6XmzAzoiaZN+ENhECMQq2vhkgkXhlXLrrbs60cBts0+CkpgyN+tjwyeiZX+nq1ejjV3B
         g+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJmcJiIQKG7YTx0JjWakdUQ2j8dDuubvepwqIE7zUpI=;
        b=a6jQOK8/v99m83xPzEmQwwssYlGgvbcAikzMuXv4XFoS3i8icY3IR0WuXN/vunH+nm
         DwLO53jQ7IqxvziLmtTaG8swMgyluKA5rmu1JqqKVYx/E/xvJB0au12Z28W5a9izH3iD
         KXa20WH4TRKlvRAbqJHYkZ57Cqaqdx4K1RFBKvG5MMu0Fv83Qy/qlio4jsrNAxh7y7nF
         Ffgzf0aDilfmfzKv1fL6Gaj997F32JI5BMSj3KBP5pkBR+4+uvZrzZYpFegJ8QRtljYc
         vFe1z/WbYTlEUWK4E5l8jTsFjbEIHACwS7OULzh5VHezh73Si1afU61BRl7EB5cAnxsB
         9jiw==
X-Gm-Message-State: AFqh2kq7PV19XXSWUXTz9LRiDbdxACpd3FN4goQBpzClS6d8uMs4RUr7
	K4msjRmoDyPpWoKHaYpX2avAp7Mh5DIWuTceOdQmQcfim0o=
X-Google-Smtp-Source: AMrXdXuvyBDLknD14Hr/Rd79HVz+ZNkBtPXhgwH1EMZY3eUaaVsY3bOW7Br+EwwlNdvZ9C0a/olBl0CGdW79+1uWuVY=
X-Received: by 2002:a19:7509:0:b0:4b5:6990:3c94 with SMTP id
 y9-20020a197509000000b004b569903c94mr2120841lfe.27.1674743080956; Thu, 26 Jan
 2023 06:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma> <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma> <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma>
In-Reply-To: <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jan 2023 15:24:29 +0100
Message-ID: <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
To: Ravineet Singh <ravineet.a.singh@est.tech>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 14:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176400

On Thu, 26 Jan 2023 at 13:07, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> I believe the patch cannot be
> upstreamed into gnutls since gnutls use automake and use 'make check' to verify the same locally.
> This patch enables running gnutls tests under ptest, hence it would tag the patch as:
> Upstream-Status: Inappropriate [embedded specific]
>
> What do you think?

That's ok. The real issue is that libcheck does not support
installable tests, and it should be solved there rather than patched
into specific upstreams that use it.

Can you also try to determine what are the specific missing items
needed by entries in test_disallowlist and see if they can be easily
provided on target via adding to RDEPENDS:${PN}-ptest?

Alex

