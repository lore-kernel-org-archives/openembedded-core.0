Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B655BC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:33:52 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.51804.1674149628810605266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j6HKMMty;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id bn6so2831922ljb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUOyv0jR7nnlGvNsbL+r1ptHDFe/9uFHctZ8ahlUewU=;
        b=j6HKMMtyvSQifGmI4iBBzZkvPv/9Zf0js6p9CTkEkPl0jliE6RafKLxRFUqc3mpQv8
         qY8uJqrGSEWli15UlcKFF59yakuZqrdBkYwNhtgpwjls2VwKZWMBdlR+X9BZN0+FFMe2
         FxR9ZWi2oX8c6oaXthYR0pOYpmu70crmKZdv2SjhzP2cKknv6hFEJYewfVwhPPNI8tp5
         BTXcFx/2eLacLK+0IXu3zkYArNCf4gavJ4DVkwdlo0NyVg9THzgPKu4X4DmjmqQE8J1N
         0IURrluzECXAK4YaeJcCbhUqiAFrMhLluJWVabeOy17M9UHtzfSebm5ZXSx5/RZTww1Q
         NJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUOyv0jR7nnlGvNsbL+r1ptHDFe/9uFHctZ8ahlUewU=;
        b=hkQ+ex7X49axwTDwfY8ZWeF1KjtpevDVaYO6j9k0lzJR2v90i800wg9sDB9unXBP0l
         8YgzER2S4WIVfTrkbbVNQyC8J+Pz/dRnzsj0vDnjx0yn+2/K/9K7Jkd8iMZD2G3hE994
         430EY03l0m0TwfwTlSUFlwxHnQ9SaPdEAKLEcT8nSh+AYD9rFM4O+M9SJriJvmsEyzSE
         SOFB/DS7MMQ6oUf/4XC80hSb+6XWKJnepW147fgBGOJUwnAF9a+HOFIoUqyAM+242pCe
         +t/zrjCsaIYnYHEfyT12OTWWwQkJh6UJWHxXBl+dcq3LMEikk0AHmbE4B1xIglI313G7
         3Yow==
X-Gm-Message-State: AFqh2kqa0LBKZNPeYrwbod38KNTJanNQu7P7vWevF65jlS5j+50R43TJ
	hIkxnVZg/mlljjSPmm4OWoPzL5z4AYskfpWM2xo=
X-Google-Smtp-Source: AMrXdXsRFK2mk3YgruhP5e0E+BR6N1/8hhKvhin1NLnE7OirHaA5iLD0Et+GqoHGE96FQWnW0ipvobuZQs6PsbskmeU=
X-Received: by 2002:a2e:a4a9:0:b0:283:7671:a305 with SMTP id
 g9-20020a2ea4a9000000b002837671a305mr1068390ljm.33.1674149626966; Thu, 19 Jan
 2023 09:33:46 -0800 (PST)
MIME-Version: 1.0
References: <20230119131853.27372-1-f_l_k@t-online.de> <CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
 <G9OQOR.29KQBNHWF95M@t-online.de> <CANNYZj8DpFxQfTJtWoyGyUkLRjZgKRoLKKJu4KXB77r755hEQw@mail.gmail.com>
 <2LTQOR.QLNMTZ06LFDD3@t-online.de>
In-Reply-To: <2LTQOR.QLNMTZ06LFDD3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jan 2023 18:33:35 +0100
Message-ID: <CANNYZj_n=mVXPiDsfuW3vW-bCos57_dD+ffTZ8Bz7uZ9zb_d8A@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 17:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176156

I sent oe-core patches upstream that aren't mine all the time.
Sometimes I as well don't even understand them fully, and then I have
upstream explain to me what's wrong with it or why is it not
appropriate or poorly written. Or they rework it themselves. The
primary goal is to engage the upstream and make them aware, and no one
expects you to produce a perfect patch and complete understanding of
the issue in your head up-front.

My request is simply to go through the not-too-hard technicality of
sending the patch via opening a merge request, so that there is an
link for it that can be followed up later by you, or by someone else.
Later can be measured in weeks or months, and often is.

Alex

On Thu, 19 Jan 2023 at 18:22, Markus Volk <f_l_k@t-online.de> wrote:
>
> I don't want to push this work to you. Just wanted to give a reason, why =
I'd rather dont like to do myself, at least for the next days. Have still p=
lenty of work lying here and in fact I do this only for fun and thats what =
it still needs to be to give me reason. I'm not related to technical things=
 for a living. It's just, that I had an issue with gnome-disks and as a sid=
e effect I realized that sgdisk has an issue as well and found a fix for it=
.
> But if thats not appropriate like this, just drop that commit for now. Wi=
ll send a v2 when I've been digging into it enough, to have the feeling tha=
t I am halfway knowing what I talk about, if sending a merge request for a =
patch I didn't create.
>
>
> Am Do, 19. Jan 2023 um 18:10:05 +0100 schrieb Alexander Kanavin <alex.kan=
avin@gmail.com>:
>
> On Thu, 19 Jan 2023 at 16:27, Markus Volk <f_l_k@t-online.de> wrote:
>
> But its neither my patch nor am I familiar with sourceforge or the actual=
 issue with popt ... and I'm not keen on changing that. I think if the gptf=
disk maintainer wants to release a new version, he will be able to find the=
 patch on the net like I was. And if he wants to get more help from the com=
munity it would be a good idea to have a git repo available somewhere. Or a=
m I missing something and just wasn't able to find it?
>
> The git repo is in fact on sourceforge: https://sourceforge.net/p/gptfdis=
k/code/ci/master/tree/ and you can open a merge request there. There's one =
from Khem for example. Please do not come up with reasons to push this work=
 (submitting patches upstream) on me; I do not appreciate that. Alex

