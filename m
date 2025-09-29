Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7CBCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 09:49:34 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.49944.1759139367373798430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 02:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f9ordVjS;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-791875a9071so42993386d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 02:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759139366; x=1759744166; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T5fnPwkxokJjhOCrjkwLqUh6wBiClHLt/2cPcYxvWtw=;
        b=f9ordVjSrRNlHQtIeeEvcDjWOB5mfVNY6Q80BEs8vDIVLQJqiRZ2CSyAbb2ZkB77A5
         SlHofV6Raew3efei85mzD4Ewl+k/wMJjKncLWddo7YamTD4ZhejTywTezGIV5JtiSJhP
         w0eqtVtagvMUPRW7cfPW6mD+Yv0OKUkrLzIr5ekdx+B8+sroKlnIgbvHovy689ZOSOI5
         Td7aV74yAbfroSdaGoSwByxyxsGTHTdnkXFrXZnZU+VDqVIX23Ma9Vr/AzMB9lj6aSEA
         KzIvZxDUWkDfiquO3sODWHfRqC3hOZ/EuWjL+PwIRGDxQygPZFdi9kasu6stkddHyDAF
         VvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759139366; x=1759744166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5fnPwkxokJjhOCrjkwLqUh6wBiClHLt/2cPcYxvWtw=;
        b=Yl38lv5u9RC+hDSCPHK0YYKS+yx2vK2VIDWNUUo5BylOPr5wfG2oou0j11hU0MzBUR
         OUl3du7lJWQzM5wEeAARMXfl3aJlVxDDlItEuljo0cmDJArRM0uy8sBeXw5OcnAfPa9V
         XTm1Ol6jOBruTG71iYKx7TZNzUtlHa4PYM6mgr9X2hx712HAs2jTe43rrDiepsj/5Kxr
         j9cg10acdcgJ8upRMWX9rj/vTOyDFKLHwOS0kEh7giOanKHEU5VoOadP6nkG6R4IHgs6
         RhemnGkRRsRL1neNznCp/6BeFKO8Yw32b8WZaLRIZwr5CdFainpp8CTI3g2GGIuKNkCw
         6Cew==
X-Gm-Message-State: AOJu0YxSZvQenviQTkro+F5SMSsSxo2+AQAOCbmjzB1Gr/r4DC8eaExW
	k3DHPpVNrDooa0LCPRsPc12RXP6ZHAhSXd583d2V4300hEsasllnZ6tqyV5ySnDS6akF7kXJVjT
	hXDCFo/Qv5CV5RB65tYP9QXBFrA37Jlby8Q==
X-Gm-Gg: ASbGncs1vcrpK9Nnsd65pmy1kV2Ob0VNZnejsr65614WrBsYt4c9r7ukjMDkYHT2VSx
	d1XUnOp5yDTdwNGGxVQ2Hhzz1KM1542J5XpZ37cfUiMMpiO4RU6A7eMd6nnuNXLhBXO6uD9NLtC
	jSHYdwfP0YLyORZa+oJC3afRSD5efm6eH/crx//3RfM40ms+i0qvKtimGTjLPl29lfA9dlsiHzH
	p0squi2UiWyQJ6cbL7u7IHEK0shsCzcl7erCjMWB3B4fHvtS11RFQZ9AL5gpNKFhH8PpYJswGAP
	maOprfLzwHDImMmOS/GT831cUYm+SpaFLu0MW9vb
X-Google-Smtp-Source: AGHT+IF1rvTtAOuHRbH8xRGoA6d/yStt/b9dxtXhTMOfdI7DGbhUyr2D7vVubB+ksgpIJnRozH+VdSuc5SXMFVtl7js=
X-Received: by 2002:a05:6214:19ca:b0:7ec:c448:7c88 with SMTP id
 6a1803df08f44-7fc2b4837a8mr270955546d6.19.1759139366401; Mon, 29 Sep 2025
 02:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAD_4BXhMymbdUj-KqRZA5bN6imMvz8+OQt2EsiALs3wYhmtVPw@mail.gmail.com>
In-Reply-To: <CAD_4BXhMymbdUj-KqRZA5bN6imMvz8+OQt2EsiALs3wYhmtVPw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Sep 2025 11:49:14 +0200
X-Gm-Features: AS18NWCBw2LcVNZg__AYvLWZEYbbqemm4SF0zGPPfub6bPwK7-gUWjIonJFvyGM
Message-ID: <CANNYZj9Fu3U31QybY0aeKUxBTvxa7eEk7RAKd-pCSmYNSo1JCw@mail.gmail.com>
Subject: Re: [OE-core] Distro Wide LTO Broken?
To: william@wkennington.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 09:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224132

On Mon, 29 Sept 2025 at 07:56, William Kennington via
lists.openembedded.org
<william=wkennington.com@lists.openembedded.org> wrote:
> Probably there is just some kind of flag missing in the LTO build
> options to filter out the build directory, as -ffile-prefix-map and
> whatnot are already present in the builds. I haven't yet figured out
> exactly what is contributing to this impurity.
>
> Prior to rebasing on the latest master, LTO was working fine globally.

lto isn't tested in Yocto CI, and it's well possible it has silently
regressed. Last time anyone touched conf/distro/include/lto.inc was
2021. I'm afraid it is not getting much use in the community, so it
won't be easy to make this an officially supported feature, but
patches to at least fix the current issue would be welcome.

Alex

