Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697A2E71D2B
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 13:09:28 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.16727.1695992960723608457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 06:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H46Vv1Gb;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c00df105f8so228682821fa.2;
        Fri, 29 Sep 2023 06:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695992959; x=1696597759; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nNY2aCJGmtRSFNGtbGYVSxxI2Zr4bLMWrpjRE/hrJcg=;
        b=H46Vv1GbYtmGrf/sPjRcerkV/9urwA0Iy6gtqrlx5qn9XOH7liDagSJATltcIYrOMz
         RyfqP2js5GvYIygo7cII0en0Vp1QGFDCDUuJn3k95mCnreStiETTlAaTGnQv7Yifoqgr
         l7OkyzaKh2O7HzKeh99XRixGsW0BL3eaYVJ3yZCxza/7ZJxME9sMcqCPNBDc2+CVccW3
         YNbR7FERKg/uGmv24ko6mOKetKMbsjcykOyx6rFn6wVBiO/CX8/udj7jJ1awB5Rr2ejk
         90QsrfVPCpBAtGYM+HCZLGu6co2n22LA+tEaQSnVbXZeZ+wOrr/GS7C/JV6GKeWxyjqV
         QBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695992959; x=1696597759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNY2aCJGmtRSFNGtbGYVSxxI2Zr4bLMWrpjRE/hrJcg=;
        b=HNfpTxyCCgHHd4qX2YYyfJuOSBWZz/yZu/BKXlAyJAICsNeNiMPh0KMWOb+ne1Q161
         puOa5qDgn2+XYWf0HgKOr8xWArHhfLLaRc/Akg5EyGErKuSYMGziIiNfrbXHdK4DqYuw
         K1RAV8b4aqxxf3A7p6uidrNAKqhwjwCS1ruqQSsMIssC4q03RkIlOToJgP89p4jROhbi
         ODksd/tp3C/ZRQyuZ0Ayqb5amCXUeNJkaHla1K8iqnO9TVfRxC+NyACV3n58CuI7QZY8
         eCvemxPKzEHN4pbz6iFnBlduELxTv/En/Yfx63s9U3te1SRNzwTmpK+7C3RC4o9kS4T1
         oKuQ==
X-Gm-Message-State: AOJu0Yz9uiNp3FnixfP0Urg+xRDF/mMk4aCHQvQoTY1TcVuksVP0rQcQ
	pzXsVJc/wsheJ9jZ/fP6/w9leLQ64fbNTs2bs1E=
X-Google-Smtp-Source: AGHT+IHT6idlN0Cptv0H42kmLdH/+7iNGxOUVD5uuLBtX/CJWbXC0Hp4xusbjZAQRVLKlfGfhwBQqFLTunykjp327fc=
X-Received: by 2002:a2e:97c9:0:b0:2bd:10ee:7d22 with SMTP id
 m9-20020a2e97c9000000b002bd10ee7d22mr3682008ljj.51.1695992958547; Fri, 29 Sep
 2023 06:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
 <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
 <CANNYZj8eSZZOfPGYCdYPrWjHf74dmRW5uYAZfTBp7JemPXxQCg@mail.gmail.com>
 <24b60007a669d075fa1e4ccd18980ada93714c7a.camel@linuxfoundation.org>
 <CANNYZj-YBTN_yje-fyzp12YDF9XMaZSuMvLh6qA1H+9GEYEmfA@mail.gmail.com>
 <7564ae2b6c036b10a35e8c9927c0ab2cf533f35c.camel@linuxfoundation.org>
 <CANNYZj_16s-JuZAQ3pccnf-8Lb=yMQ1+a9FiU1abLXgORs70rw@mail.gmail.com> <ad1f866bf7b231ccd57f91f2f0a9256d18eb533f.camel@linuxfoundation.org>
In-Reply-To: <ad1f866bf7b231ccd57f91f2f0a9256d18eb533f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Sep 2023 15:09:06 +0200
Message-ID: <CANNYZj8iRGygNAdVdHQ-k8JodmzRaLK+vx2tKhmWBBEb8R4-dA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188404

On Fri, 29 Sept 2023 at 14:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I'd prefer to see some dedicated bitbake API used even if we need to
> create/add it. tinfoil and some of the bblock/unlock work shows we can
> get stamp data, the question would be how to get it without
> "disturbing" the existing build.
>
> By using dedicated API, we'd be able to control the console output.

I just noticed that compare_sigfiles() has a 'collapsed' argument,
which, when set to True, omits most or all of the task hash printing,
and with that its output should approximate what bitbake-whatchanged
is aiming to do. This is currently used only by buildhistory, but it
could be used by -S printdiff too, e.g. by having verbose and concise
modes.

I'll run some experiments, and let's see what the overall output looks
like in real scenarios (e.g. 4.3_M3 vs current master).

Alex

