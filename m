Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D10CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 10:35:37 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14522.1762857317007723518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 02:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eKJNoJQC;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b271e6833fso67894885a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 02:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762857316; x=1763462116; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vP4+D7JD8hYjAnrxYTa3jhyNjemY86CGwMwr30KGXDE=;
        b=eKJNoJQChJTkK+U2l1sqqTZp64iX14pUIKWuCOT1iRiaORUN4jc4JEzHnDIc8GQt2l
         2epicXcot3jFAABURyje1aiqdXuZ5cnl+sXOUH1yU+/ayaOSfTAw6Jf69bQ+YnBb8x38
         QIezDRlIYTH5YvYHjY7dWVSPnqTc9CZeqv+uyN5tLVVUjRb2oS2ELVD9m9gWRgCbzFsA
         K3Tyi/i2gmyDkxQBU1G9Ws3yl5LMciasj14jyQMLdhd8ZNYye8NBbXt+QCc3GetWTYEK
         tQ1AHqQB03ta8OjayK4HcGF6sqaqQc7TYXdk29xTwEs+G4/trq2z76jMtS9LAhQtUSic
         fASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857316; x=1763462116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP4+D7JD8hYjAnrxYTa3jhyNjemY86CGwMwr30KGXDE=;
        b=PaeMlLMLKgrXXUqS3h07YY6lZO4HI+n0Sk198xvusSOnXc7HSAJJPJez7yuWnt2Qmr
         fs49l3u797T/A7hhOLiVZuGKjvAPqPUu6T5dhmzxJMigZs/0/5vEbk2XefyNfHkAoAWq
         y6LRCrmD6L29fU8xPsd5DEVTlyyWsPa2p5bInrxZ646n9lruCUqEDuYD6Otcky2MHuA2
         2umN4UPj3PO8UVPLS0okU3bq1LRRUgxAcRr/TWz6NIItcsMIdxqrXhBlFKrOQVQvFyDl
         5Up9eB95TkxckXIqCRigvR7JVMlzY2PUZGgfhcHbRadjZErGBwXfzU8oQuU7n3iTDwXA
         Fabw==
X-Gm-Message-State: AOJu0YyevGCTVIaaogx0HvzAWg9rBrBrwZgPGORk9yKRsDQMS+xr6YS0
	frXtXxnBmjOHetJcYlZnVLl+pfPbZ9A6/0oIL9qpKb2WK1fbw0Zflw75z/2MpNSh2TuFHDfeikE
	RTrxYO4J37gZhHbZa6RENuEddNwwzOP0=
X-Gm-Gg: ASbGncu1LSTbZxXTQwTztqS1OE+rGKyND9wgTFPiplI/ur9h2mHFS0KsxLyMSMg1oFU
	19R4SzgMxrLZssyooIrHXxchilKBEOEZHjZbtPSvAHFXgFFooa8jx6heokGB+gdLX1kQdyN6Bj+
	97NROfw2kZUxrQNsS/JblfkwXs0eqC4jXebjK0umA8cCJ1av/8nHoOhXCHwOYA0qI58BT/hJJuU
	EtQ51j23HFg3NAsGnpbOE9owyu1Tuw+waEyXR6iAyeFaPCfnjxeVChVACB1WOO7iM1VDOk60FUM
	YJEG8nnE
X-Google-Smtp-Source: AGHT+IE0YL1OwupOVbBkJdRFoGuBe9SCzrxY+GzpM21GctY18JbC2cdewitlfU7VMLq5exRad31M3lZ0ApukI1OpJYQ=
X-Received: by 2002:a05:6214:2029:b0:882:36d6:e5c1 with SMTP id
 6a1803df08f44-8825e85717amr37362936d6.29.1762857315917; Tue, 11 Nov 2025
 02:35:15 -0800 (PST)
MIME-Version: 1.0
References: <3Q2y.1762836199203901249.LEbU@lists.openembedded.org>
In-Reply-To: <3Q2y.1762836199203901249.LEbU@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Nov 2025 11:35:03 +0100
X-Gm-Features: AWmQ_blVjyr2nGVT7RQfu7KKgXfJ6Em6EtKRe7lICz9FZ4UXtPxw-fsjUQ8ZyLA
Message-ID: <CANNYZj-WA5FD9pbj42tS_JFvBsVd7mzpeJ6mekcQ2JkP-i_vuQ@mail.gmail.com>
Subject: Re: [OE-core] Question about merger process for patches under
 different branch
To: emailaddress.ashish@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 10:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226155

This probably should be asked on openembedded-devel list?

Alex

On Tue, 11 Nov 2025 at 05:43, Ashish Mishra via lists.openembedded.org
<emailaddress.ashish=gmail.com@lists.openembedded.org> wrote:
>
> Hi Team,
>
> I am trying to get a better picture so that we avoid un-necessary message which interrupts the branch maintainer's
> Can team please confirm if I am understanding usage of below branches correct:
>
> 1) meta-openembedded-contrib
>     The patches which are being "considered" or "scheduled" to be tested for merge can be seen from these branches
>      From these patches, whichever passes the auto-build will then move to branch-next
>     The presence of patches here can be considered as "patch considered for auto build and testing for respective branch "
>      To know which patches are scheduled for next test , we can look at
>      master      : https://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/master
>      scarthgap : https://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/scarthgap
>      kirkstone  : https://git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/kirkstone
>
> 2) branch-next @ meta-openembedded
>     These are the patches which have been tested & will shortly be added in their respective branch
> But the presence of patches here can be considered as "merged" in respective branch
> master       : https://git.openembedded.org/meta-openembedded/log/?h=master-next
> scarthgap : https://git.openembedded.org/meta-openembedded/log/?h=scarthgap-next
> kirkstone  : https://git.openembedded.org/meta-openembedded/log/?h=kirkstone-next
>
> 3) Any ball mark, how much time we can consider it takes for patches to be available in respective branch from "branch-next".
>
> Thanks ,
> Ashish Kumar Mishra
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226145): https://lists.openembedded.org/g/openembedded-core/message/226145
> Mute This Topic: https://lists.openembedded.org/mt/116234126/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

