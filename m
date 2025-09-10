Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D942CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:59:21 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.14554.1757501955910901923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8hn9eec;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b38d4de6d9so33405221cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501955; x=1758106755; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5J6EAuUhsZyoTvk0D7TOd4bJGu76aBbWwZbQgLsFUcA=;
        b=Q8hn9eecUDMTNL9jvNued+Ow0nKfW2HLr+klYQKy37EkWbFMZPpG8nJjDSeqtcSYx2
         Bdg5YPiv3Yc+g08VXbGZb1jyhe59m0L4PeGW6ZRsaDkDewcvQqxylM8apO73qQHYfyuf
         qpxfGabuIZzxeEznNRwyAy/0pxBtmPY7XMqNO/UVpHQyzIbGU2Lo791KS24E4cm4OXYu
         6XuTSlFp3sZjOq//Xgmfwy+E7FWrCS3t8jjkw4K1TWFtYJ2JAKtlCsqASN2m5UNn6pNb
         Ss7EcVfLCw8PWtH2rcuX2YmuBnElidiU5OhwiTZR7UN/EbKrA6mmRT38djfG/if8vc7J
         E+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501955; x=1758106755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5J6EAuUhsZyoTvk0D7TOd4bJGu76aBbWwZbQgLsFUcA=;
        b=fLs3ThJCFBECUcu7N7Y29U2NXm5AZF//PrTHOUQFQiltAOc2SwpbxJKPfhZok3m0BS
         iOwtczkS++QwuYA4Vk18roIzvdFzzQv0w2wIfkFqpBDMKzy/cAUhhfJ3OtnM3QKtuD6b
         JwFikOZtAr+pCnk3E36AbnFmyPf02xnxjW2lSAYM5VIdocUlz84BYbIjo0lg6eAdGl3n
         4wK8GMTGo1KZ/gxBCwAcEiXEtR8mLCwCRITpt7kQZeMPx5sMh45YChga6SdLlUKJ4Dk4
         LfD6QIvG5n7B9IrBu7YXpSYfDnHNtyagXf/qQPmAqNJ3eus1uhU2wclPR1pe+JmcGjW2
         pwSQ==
X-Gm-Message-State: AOJu0YxkNUWt4uLPfj5XqEj0VOJUCvOSBpDmcJimF7NnKpjxBSRNwS5Y
	8wUBp7GVaM66EJ2aobjVFI7wyknYPpwYC9yAOyeIP2/EnUg788TripRmBj77Pye+/IV9/GIorZQ
	TtcV+tGgBpcji2mM6Fmcxa6FrkvYMQk0=
X-Gm-Gg: ASbGnctbRpBRo4aOfFD/7QyxhyYA1U0odc7TCowCqLfgJLjs2Xt/eE5Q4n47+1VHTjs
	FxcO3HU2zty4eiFu1ltW0A2P7Qqep3WBApR1gilBWjOeHYPxxjUmT8svdcoD9onry7aDXGXsIZ1
	se5RZouICNz+fRhATIAaW36uePUMcVk7seHASb2fbVSMoX6m/GjEOPTVwxmD3ik/CcPDXM94iwH
	ccdtPPM3ZyIzE+U5dBn3ojJFoWX+cPKvK5luxbRK5cq31lqkdGO4ZojYvL+re9k2cqVIYLszVSk
	fp0BVCVJBCv9HtQeRDBAipF125QAy9cpy9WD10k6
X-Google-Smtp-Source: AGHT+IG7dufjlruKeqYIVO/EmeT8vi1BkLy2tqMj7duLThOOY8Xm9Wk3Jr44YnI4w4wUI12x2kQXT22LrZD0AfPtqCM=
X-Received: by 2002:a05:622a:59c7:b0:4b5:dadd:cec1 with SMTP id
 d75a77b69052e-4b5f8452a58mr171040111cf.59.1757501954684; Wed, 10 Sep 2025
 03:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250910105053.315379-1-alex.kanavin@gmail.com> <1863E6469F7807AC.10180@lists.openembedded.org>
In-Reply-To: <1863E6469F7807AC.10180@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Sep 2025 12:59:03 +0200
X-Gm-Features: AS18NWDdygma_HyJgc3qIj-HnhsSeGWSn3-Wl7Oizc7XYqXkG1Bx0786FIhN4KY
Message-ID: <CANNYZj9E1Vv85TTH+FuB4G5a4AZ7xhKyHz6-5xN+dRwoy4eERA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] maintainers.inc: unassign Carlos Rafael Giani
To: Carlos Rafael Giani <crg7475@mailbox.org>, Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223203

Hello Carlos,

please see below; if you do not wish to be unassigned as the
maintainer of these recipes in openembedded-core, please speak up. But
it is expected that assigned maintainers update their recipes to
latest versions in a timely manner (which has not been happening).

Thanks,
Alex


On Wed, 10 Sept 2025 at 12:51, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> No activity for a long time.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index ece809f61a6..239f1f80836 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -309,7 +309,7 @@ RECIPE_MAINTAINER:pn-kernel-signing-keys-native = "Adrian Freihofer <adrian.frei
>  RECIPE_MAINTAINER:pn-kexec-tools = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-keymaps = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
> -RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <crg7475@mailbox.org>"
> +RECIPE_MAINTAINER:pn-kmscube = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-l3afpad = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael@opdenacker.org>"
>  RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223197): https://lists.openembedded.org/g/openembedded-core/message/223197
> Mute This Topic: https://lists.openembedded.org/mt/115167232/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

