Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D130E66882
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 20:28:12 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25530.1766176088277360308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 12:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=ZajJlOXY;
 spf=neutral (domain: theyoctojester.info, ip: 209.85.215.170, mailfrom: jester@theyoctojester.info)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso2135504a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1766176088; x=1766780888; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9IohO/d/MCiS5OV8zDl8qt3/TQNn7a+prGsv2SqaJA=;
        b=ZajJlOXYAiYlQDEK1FlGkTxxEJbqArRsvXS4bGijz10GFZyJiL8Zy69YGssYLv8WZJ
         q9/O+buTxns67Abe97L4QD8KIaFNex5Ppr3BjzN+4pSZSsBIsqfTFC1E5pnPB4ZTUE40
         EMel6drAMHXcSmu//xaaQinc2htneFNO50WGhWN5+75N8PXqMeAK+jaTaJk37a7PuS0/
         l4bAfQWbTTJbiWon91VKt4hlbrNftHb5hN6h6w/Ex/Kw5Woz5p2lGqUwv9U9iTr47bnj
         ZaPDk04Tls79TzaLDwirtClrnTQHt5xb6/Eouu6qm7vrEQNs2cyUuW2DyCbd+Sp41pIT
         kUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766176088; x=1766780888;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9IohO/d/MCiS5OV8zDl8qt3/TQNn7a+prGsv2SqaJA=;
        b=qlGLFeKt0o5Z5b4r2YEOjoaaASy2vsSNtginHrUan3l5V1+9qpvJZ9qOY24mcyDWYi
         ETVNSDU+dgMz/u4fvv06rqlLahl4p3y8Wug4s5wkF0HyodS5DeXQa9Oklgp3tzr2uGs4
         I5rqpMDsvMq8rlgQjdk55msHhdID6zebYm+l8ctJWtlhUbfOQYerw7nM8sW+hfkprKbc
         mIsmF1miXMQr1AxgOyG5uHI5I+OHjYVXzB8s2//0/blNdBfLIEg+DBcxConAhHp+FHhO
         +Us+gHekTomw9hyTOSSbv8lVFDHR71CNb2D/XKZJZqAFRvBUxNYXTq1UcilOaNmY0lkI
         fqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx0u+6mn99XanKin7+vyvPEuovG+ZMErHEJlpWjDyHZF++u16CRMB1DerjoNlpG4LIh/Ka2tXgtz26bFChOWYCSA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyN6sBW6fLjmqkAcrz3/NdVHSKg5hMoznzHzX5HHr22qKqvh/q2
	XXrEKwqxWyTUwwWuDQo6z/LhL/u9LoMt3FNYzyKyd9nPfdjaddcUVcWUDZiV0slqE3KXjIncqSc
	GyblSWCzXOA60W0hHxU+vMvx7FwSM7r1K3SeZmU9RbQ==
X-Gm-Gg: AY/fxX7RAZFF8tg2zuXz+46D1ujfRGiEpRxaJ+XA4EHnzoWtc30v9a1vVSO1QrIL5aZ
	5+VvMVeeaAdZm+uhNknrnM5HZIhFjapmmzy7lXWV+COUoLLpSERUdBF+iBNSg7GESptUUrEftYy
	ummDZ1z/uBenjcyvYWOQUaU4LAGT091RjXG+Kzz1PjAv9bJOYFmQEJzUoN23I/lDuILaJDBX95w
	dRBwEY3VK2kARxuTkyC7lI6koc4D/aqdolVn4Gh2H8RnlzZ9Z+ExmmfVo9ARzHiU4dvbGE60r6U
	3tummKmEYmRCuSWgYq/UOUfuLedBsg==
X-Google-Smtp-Source: AGHT+IH0NBaZ+SPOdhudZcd71R8mnsXxgC/JYGdUtPKLBv8BzFnGJTDVfzd0velj8RYbgiCr5nyvp0zzVRmLn64MC9Y=
X-Received: by 2002:a05:693c:631c:b0:2ae:5d27:ff49 with SMTP id
 5a478bee46e88-2b05ebd85femr5625387eec.7.1766176087655; Fri, 19 Dec 2025
 12:28:07 -0800 (PST)
MIME-Version: 1.0
References: <CAEt6Nwo64QB0ygUK5qCcB46-V8Twk-jWrGCbtMR1MP8EvnMSiA@mail.gmail.com>
In-Reply-To: <CAEt6Nwo64QB0ygUK5qCcB46-V8Twk-jWrGCbtMR1MP8EvnMSiA@mail.gmail.com>
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 19 Dec 2025 21:27:40 +0100
X-Gm-Features: AQt7F2qcrz-0naey-AFcm0XPBLMe4n9epYWYNWXAIRwWHSVH64UIhSrxFp5srGQ
Message-ID: <CAEt6Nwr+G+=NamM5ayu2EZ8X==HcPkmp8VvXX3pAePdX+RG2YQ@mail.gmail.com>
Subject: Re: Final stretch for the OE Workshop 2026 CFP
To: openembedded-devel@lists.openembedded.org, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 20:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228245

Correction: use
https://pretalx.com/openembedded-workshop-2026-2025/cfp - unless you
are part of the organization team yourself :)

On Fri, Dec 19, 2025 at 9:22=E2=80=AFPM Josef Holzmayr
<jester@theyoctojester.info> wrote:
>
> You already know that we will host the OE Workshop 2026 on February 2
> - the Monday after FOSDEM.
>
> You already know that there will be a friendly, enthusiast crowd ready
> to take on all thing OpenEmbedded and Yocto.
>
> You already know that this is the perfect way to wrap up the weekend.
>
> And now you know: the CFP is in its final 48h. That one things which
> you always wanted to talk about, now is the time to submit it at
> https://pretalx.com/orga/event/openembedded-workshop-2026-2025/
>
> Looking forward to read your ideas :-)
>
> Greetz,
> Josef
> (OpenEmbedded social media dude, event conspirator and occasional timekee=
per)

