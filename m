Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882B3C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 20:04:50 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.1742.1645128289586780888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:04:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PmNsVOSo;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id y4so7544195vsd.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mtg3KolXkgkz+JSiyodHatu5poy/pGKlIq6z7i4oymw=;
        b=PmNsVOSoo8IUnjQ5wkdu4dbSCy+6DebkNNCYIOkSWR9APLVDMXgQh9eOU3KG4tT3Es
         64puNtfChWirIMAi6+tQcsGbmvAAjpQ+Q04yWc852PXU5RWbETbr9m0pgudpi27zi2d2
         Mz3uPOsoV+wsBJklwvx44gUUiCSOKun2x7rwWIS7xjdC35e9BmG8M/0/NbN53wvy17Fw
         RgRDtdg5SVbAAbKNat5GQ3zQkAzHDltD8ZO4szp8sHgOeOylru3ksUwEtjCqvkQxpLWk
         lYqY+EvAvzHq1WYMTjv1oAMoAZjQPwPTw7+FjaE6dtiELHkk9BkzPC5HzXROHhgWBGs5
         CurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mtg3KolXkgkz+JSiyodHatu5poy/pGKlIq6z7i4oymw=;
        b=TejL3Ept0O0FqTo83rDIB/NoQeFODkGACGIUeGdJUky56TqvxnzPQm4DiIAYEVizhD
         9vQH3xAiuKxV5qx2/sdUE9Zn7/M87ac5IzbpleQi9t3VDjAED0KfbMp0h49NDwy7OuGk
         VwphxlqPTYqTBrXa3NyyH+D7K8lE4xQxPwi/JBvE9+6u8obWcu0RghJNmraMAsdLs5ej
         NP4Q0M9UJUDiySZ3EpqZpL30NBlsDp9Kh+uRxTgWA7LmmJi955xH28JHOpUCLpAVI2s/
         hCmHwyxwI/JWlvjrGZsgTTykkqByorGG7xHjDlx7qXrLQ2ZQ/zdJb8aAQ5/Dx896VQDy
         LB+w==
X-Gm-Message-State: AOAM530OR3Hj3aUv5nuypaGKpTCZkHeSQKBHtHDLgSFi9PdzutoaTHLe
	B9m75tfgvh2ob0EZfOIKKkDGEKCotghgdWJy0is=
X-Google-Smtp-Source: 
 ABdhPJya5HvQBHcs6w7JSdiSopqLwEAdVMHHwEWzCTcQLSE5o6jSj4xYKe79U5h20pdpLZPmT6IcMUmyZ/ujAGORxW4=
X-Received: by 2002:a05:6102:20d1:b0:30e:dfe6:de1a with SMTP id
 i17-20020a05610220d100b0030edfe6de1amr2123775vsr.73.1645128288646; Thu, 17
 Feb 2022 12:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-2-alex@linutronix.de>
 <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
 <16D4AB147C5087DA.27018@lists.openembedded.org>
 <CANNYZj8gG9vxKmU=5AU_7RV51Zji1b=mOT8fcdDqvvo-N9-Z-g@mail.gmail.com>
 <83fae3c2-2583-f6de-6b17-65193de1969e@gmail.com>
In-Reply-To: <83fae3c2-2583-f6de-6b17-65193de1969e@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Feb 2022 21:04:37 +0100
Message-ID: 
 <CANNYZj_hBjhyPBVXJK86ekihZo41ALmJ=EnnVv__41Hb+R13TA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/28] weston-init: replace deprecated/disabled
 fbdev with drm backend
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 20:04:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161859

On Thu, 17 Feb 2022 at 21:03, Khem Raj <raj.khem@gmail.com> wrote:
> what qemu targets are exercised by AB for full runtime tests ?

x86/x86-64/x86-x32/arm/arm64/mips32/mips64/ppc32

Alex

