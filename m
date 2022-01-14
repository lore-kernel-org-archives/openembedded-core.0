Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9534C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 17:39:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.10413.1642181986588564907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=V5MNOHGn;
 spf=pass (domain: burtonini.com, ip: 209.85.128.46,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f46.google.com with SMTP id w26so7415166wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60DsI7iF414/O1T1JmvTF75wOZ7D8l29hDZrV00wseg=;
        b=V5MNOHGnaHvgludItlOGLS78HF+EG2tB+jnxA/eixgokawCy6dcGFre1e0sWiI6oEy
         mC6lRBEB5DfZvBHcadiSfXrJrnfN5kpCG0J4GuH12TrSFG3GCdhSVVC0RpTiHYq3F4U1
         3QHYGyiCBGaMichGx3qqyYRi5oJUqkLgTrq6lJf6cMdb8/HYPe+gFwV24lyqKYWcu/bD
         qd11eoqDuqOmz9LPtp74il1EE2QoQDIt25tGo+aFfKO+hU/slHAFvFn4T112Dkbz0A4H
         ZQWcKUHtV7B7ZGe7BkpP9cQWbDo9pLVCdN7DrjKxYxLbgdDlhfyE6U5UpazQ7wzor9/1
         rWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60DsI7iF414/O1T1JmvTF75wOZ7D8l29hDZrV00wseg=;
        b=V2+yuYzYE3N02OwgUxb5B+1CMvOan45QohdQI/TIMx7nRvwlOX/TTZt1qBBnDobLUe
         ftvbvmbmP4SeLZ1Lo6WvJPdcJqCRIjxzGHHj/5OBS48qLz15ktNKcqSanJK4ZUuTxefW
         l+tCJvGGYpA/4OXCvBr8eKhhvS+kvsvu2pK8dCbpdWhOW3hTbo9Uc1w2zdzw2p5N9K0b
         JOxaDqWAs8H2uUbsqLBBrWCZ1G05B/uxFUnt4CCQA5yjCae8hyoJKD1wOAqN5mqZY6W7
         vAY9KiAl6mBY4Ni94CkSDPbOGCZ6b9HapSXYDp+sS07dBr8AdQSnK4uYzj9cWWK4mEHN
         td7Q==
X-Gm-Message-State: AOAM5304OkY+/og9K0VmpveJpF30Wi97NfOw0ocKALemSn9RBqh/rNqU
	hNgy9tGETN7afHde7XytsyyNKOoubacIISmFcDiydw==
X-Google-Smtp-Source: 
 ABdhPJy6CFD3z/Ytu7QJyy57POj2uHSFmmCaiF9S80g9eS8HHgodh7CYewbUvgDlbKCWlMbBaOyJdT7yot+aiU0WyO8=
X-Received: by 2002:a05:6000:1146:: with SMTP id
 d6mr8849630wrx.497.1642181984884;
 Fri, 14 Jan 2022 09:39:44 -0800 (PST)
MIME-Version: 1.0
References: 
 <CGME20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359@epcas2p1.samsung.com>
 <000801d808e3$fcea94e0$f6bfbea0$@samsung.com>
 <CAPphmgbonScBvk-DC1Zvv5ydYSDpiRMFGevZ1Pkr9hAcgWrjgA@mail.gmail.com>
 <25c45fe6-b268-6054-0537-d2af1c0335ea@bootlin.com>
 <CANNYZj_Zc25Ff7Kx6kgO13tvfkdQH_vHQUFezsCyJiBGddPj9Q@mail.gmail.com>
 <e6593f8d-fc05-c3bc-77b0-2eab3898f29f@pr.hu>
In-Reply-To: <e6593f8d-fc05-c3bc-77b0-2eab3898f29f@pr.hu>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 14 Jan 2022 17:39:34 +0000
Message-ID: 
 <CAAnfSTt_BdEYHr=uj9eB-KuM-bBO8SMCFK_YN-=xZbu=PO0Avw@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Question of Yocto dunfell LTS period
To: zboszor@pr.hu
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Jate Sujjavanich <jatedev@gmail.com>,
	chanho61.park@samsung.com,
 OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 17:39:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160572

On Fri, 14 Jan 2022 at 12:41, Zoltan Boszormenyi via
lists.yoctoproject.org <zboszor=pr.hu@lists.yoctoproject.org> wrote:
> It would also help if recipes staying on the same version
> but adding patches for e.g. CVE fixes should increase their
> PR value so their rebuilt versions can be put into a package repo.
>
> Throwing away the buildroot (as suggested any time some obscure
> build error happens) and restarting a complete image build
> resets the autopr value so the repo would contain packages with
> the same r0.0 release string and the package manager doesn't know
> that the package is newer.

If you want persistent PRs between builds after deleting the build
tree, simply archive the PR database.

We're not going back to manually updating the PR on changes.

Ross

