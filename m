Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFC0C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 13:54:18 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web08.5581.1648216457589345204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 06:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kAdb5IAm;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id w123so4266970vkg.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tq9nAgh3bo1rSJcypr6AQTI8tFVAV+PJeNq1G2k54Xw=;
        b=kAdb5IAmNBZrSXV2enO3B6GvXYzmzCge5Lpl442W9jSzRHPx1ojm4g4nyftoJAr1xL
         FMUTXOPRnRnkIuCCDmR9oLVbNbYisDLSZmEb1HzUT99V5vzzuzwPER6UScHqlthmRgYw
         VRH4hFsH/EDSUiVYg34Dv0zJqR7+633QTkcw2N6Gn1edy2zd4mjoARRcWOMcCk7y4e16
         zorPcUE1kkNcLu3kMEPJqK9wDD5OCd2zYMNJ65loP8IocR7pt1yZgZz3O6ASvh8/q5Qa
         n34Xg7+8iB6IH76N4pvAuc1vsyZKN/mwj85v7kbArdAlfJ5qhwNW6bQ2zt3f7fbTQh41
         ykjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tq9nAgh3bo1rSJcypr6AQTI8tFVAV+PJeNq1G2k54Xw=;
        b=lIjrlYEhQ2YEPh6ZoxVfsL82a+falHw2vEbHRnh1ZhjaYt8d6MSDi8fStDahJBQb0M
         34E7idYFTm506wGHo9bT0qY+A5Hua8GBdtj7autw2BwkJAfi7RC2BiJuG7dTs0Eh6bhZ
         EFkwSP/uhgPQbn/kni7sHTXvKWBDdVdAEFe+LVcdjJIE5Ub8/utF/VcTAqvVKa37sPE3
         dS0AR278NdorHcXcRufx1UmXhQ3wvzKkyX7rBodYF4MobrH0L3gEoUm3k1F6iwtBuoVY
         gzRZVs0uJ6TGq3RiZZRqQRsFD0Ez+1Q4chmRISRgpktwOMnNXDHke4Om5YlkAn4wPkQd
         K1MA==
X-Gm-Message-State: AOAM532hjlyQaJsP8pZ/lELAtx2O1F8POxR7Q7WU+qp5wejMJQ48qabA
	P4RxsTMjLgDuokPWiL+ZpKUyGs79b6hvJEw+e6s=
X-Google-Smtp-Source: 
 ABdhPJzX+3bOGXjneYn9wt1+l2susLa1Vg/6llbRTMCIh4gvhRHmtwwtz59gkkMe39cJPGbpWSaYWU3WrxUARtqpFvc=
X-Received: by 2002:a05:6122:2094:b0:341:b604:100 with SMTP id
 i20-20020a056122209400b00341b6040100mr335786vkd.1.1648216456792; Fri, 25 Mar
 2022 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
 <1a104385-ede3-53df-37f9-141de5e191cd@gmail.com>
In-Reply-To: <1a104385-ede3-53df-37f9-141de5e191cd@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Mar 2022 14:54:04 +0100
Message-ID: 
 <CANNYZj8vQhVntJbCdH4i+okyRXUVwFLRJ4kzO8=_F6QO5omreQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: add libzstd package to minimize runtime
 dependencies
To: Khem Raj <raj.khem@gmail.com>
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 13:54:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163641

On Fri, 25 Mar 2022 at 14:47, Khem Raj <raj.khem@gmail.com> wrote:
> > The standard way to do this is to inherit lib_package.
> >
>
> that is appropriate when main package is a library but it also has some
> utilities accompanying it. This case seems reverse, where its tryin to
> create a fine grained packaging and separating the lib out instead.

No, it's the same here: most (or all) of the consumers link to the
library, and utilities are mostly for interactive development.

Alex

