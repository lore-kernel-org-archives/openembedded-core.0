Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E79EC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 18:02:55 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.407.1664560971327137747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 11:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FL+VUvpg;
 spf=pass (domain: gmail.com, ip: 209.85.166.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id l127so1375290iof.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=f6o3/Mwbo2/W3+b7a1frzUMbwL9fzS+yN7oPYRcXsoY=;
        b=FL+VUvpgTplKSM5bGWLTR6Oqpl1vX/Dgodk5L0jPqU23Ne2S8NHGQRpCsrHQrNjjdx
         VhnuikXyPUZC7IJGS/00W3dfcxftxLrSBDzw7eAgwM/fiir1vPpnuLBOzReJOI/c+wFT
         FCeBBh5AmAfaewuR7MSDEknxCRdelxVSVvuBLMIfcjZ5qZtCvaLAFt0FmHsnNgqDO42s
         SaLIdi0wuwwe0t1bUCbUg32wDN1Abk8J+0hSHqaeaNtpIW+mTGXQ4gM8vfvIM6QxwKcg
         O8KoVjXP74hLrwQV5XzkEcG7YinO+bJyc2GENuu4TtwvaeQIf70LPi3nSg8dagbrEdFy
         9dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=f6o3/Mwbo2/W3+b7a1frzUMbwL9fzS+yN7oPYRcXsoY=;
        b=Tj6teAjwoGVVeh6Wdg8gUTeE89C2k3pEkh/o4CQslB/I9Kg5o7QCx63is0kSiUEEgv
         XfIH8GIwIHpc0/AFN3t3Cug7L/TYJ6rKx/8cnEnzXAkLXnzBUtJu3C2wA74ePg3nZV8k
         liSF9pNeOflxYiMZedYl7Nh0pRIxFWJMLR8ovzrOyRtXjW0auHmrvd/KTf5Fc1A0qTl0
         2cSt8XKULca1Lf8TrOLEzfWlamQhRsMnXgYSVcyxakqYBkF58QRCYB1wxe1cibHpCHsw
         LbHrI62RVJBz+dd1R/YQQ57aw6PmQvM5DX/uQAspkpmwNtJFgn78W6MoYmtJr8gityrb
         AoYA==
X-Gm-Message-State: ACrzQf2gWwfjvg/54kQ8XMPxF66MSvDM/ezu9AI1HuzuHycRQ9cERwJY
	VAO9aaMFqscFYBR6Xu5CRJXy2sfvgEVgVOCZTyo=
X-Google-Smtp-Source: 
 AMsMyM5/5rDTGOiV+ARfcs9/wl73yhXwJQ9j4aPMKVhILv4kKzrA6og65e/NcJbj2AHmlu3OHHi2mZIPtB23WHpqd5Q=
X-Received: by 2002:a05:6638:138e:b0:357:a6c7:e972 with SMTP id
 w14-20020a056638138e00b00357a6c7e972mr5392554jad.40.1664560970666; Fri, 30
 Sep 2022 11:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <CANNYZj-15uhYQwhU95q0Yr=FcX_qGhWj5Vy=7qFdqyJ4QfSsww@mail.gmail.com>
 <CANPvuRkXLnZMYGttuO1k6SVoN=vhee5K0uk7eXSzpYZxvQRiXQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkXLnZMYGttuO1k6SVoN=vhee5K0uk7eXSzpYZxvQRiXQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Sep 2022 20:02:39 +0200
Message-ID: 
 <CANNYZj9hSLESrhTHYQr2tPiA6W94GVayntUD5qOoa0692HUP+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] go: drop patch to make content based hash
 generation less pedan
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 18:02:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171241

On Fri, 30 Sept 2022 at 20:01, Jose Quaresma <quaresma.jose@gmail.com> wrote:
> Forgot to remove the patch! Will send a v2 but I can't run the reproducibility now.

You should, I believe the patch was added in the first place to fix
the reproducibility issues, and won't be accepted if its removal
breaks that.

Alex

