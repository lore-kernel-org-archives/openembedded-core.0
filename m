Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B573C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 06:53:39 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.10493.1710312814241224714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 23:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QyvC8K4g;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d204e102a9so9614391fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710312811; x=1710917611; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nOFauZ7rfYYx6ufxU84kYl/9Oo+EvUNrjd1TiUNcokc=;
        b=QyvC8K4gxxId8ki2cY3flTOVf5KhG3+lulul5soNalB/GKf3V9ysGa9A131mkPwAg7
         DV1Xs/Ssioek9pCHxtNI1El3y56MEsJxmOV4qS4zOMGtdam2rZ85xDrZULePVACD/Fe8
         sa9RFXJkLIjptUJhyiCB0NfbdCIZykoL1sRph/tYoREzZjJpvplyt/ywHvkdWhXb42EO
         eJD2YOcRNd+tmlFszzkTfA9/FD3d0dZG5bZ/igjTuEyYzQvYL1Ymh3Y1RZ5j82xW9uEF
         X7zyTVdyo6KLYSAQfJ+lvWik+kAonyt1BK5QER5GBS5ARt4almlC76aDXro6iSYqtRVI
         YSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710312811; x=1710917611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOFauZ7rfYYx6ufxU84kYl/9Oo+EvUNrjd1TiUNcokc=;
        b=UXhvjMw6jGouKtfSFwulIRjC9nirAlzG7NQ+m4r9fl5bksO1TgK9pwySB3icTrUHbW
         O1hvBZjs1J5Tbize+79hwRqzfuGS3zrEHsjH+IJTvtbfTYT/DumvK6xl9+qtMFCFU52z
         jo3ad8IhtFjA3f5dn78UoP+0uV4/iMen7FSoUsydXCUFIo+IgroTSUygPgMAW9zqeWdu
         CHVKIjUeghmAWe02RitBiA0myuY/ej2UwVx2A3cryk7IqOt2oGC0kFUPbeufYFzePPqX
         72ay4Lz+fnZbZ/JYihM//lLCree9R2iosbw8O8gvCArhOWtA62zELP0WqqDL6/4Vq0uN
         HTJA==
X-Gm-Message-State: AOJu0Ywl3ri9/MNIRS0aW/ir7E4B4XLzrLBF5V8hi4R7FyATREMQPc+v
	rlYXYMEGM80wEkm17lToCl5JoCSFUMJlCv+2TyDx4ax9xtK3I/yUAKtaEyloXtpIEbWPtWfXmUG
	1rqxIg7w7Pb8YULP727ABx8aR9Xg=
X-Google-Smtp-Source: AGHT+IEOR1cAlFCuF/xCORQsjEVxeVKrlVzNBeWBtXL0sjWlM/yXZHqXUZg0apiTbA6EQmoNlfrDUzoi//IPSdycMuY=
X-Received: by 2002:a05:6512:3ca3:b0:513:46b4:4eb4 with SMTP id
 h35-20020a0565123ca300b0051346b44eb4mr2185839lfv.3.1710312811333; Tue, 12 Mar
 2024 23:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240306154151.3741709-1-alex@linutronix.de> <20240306154151.3741709-35-alex@linutronix.de>
 <CAFMvBt0onfsJ3BtzcEn87P4G3g+LQbrg2=f9eEexE80VO2TFPg@mail.gmail.com>
In-Reply-To: <CAFMvBt0onfsJ3BtzcEn87P4G3g+LQbrg2=f9eEexE80VO2TFPg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Mar 2024 07:53:19 +0100
Message-ID: <CANNYZj-jM1Uj4XW=58F9sbX3r5bST9iqT7L5hmvRs6XxOmELRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/47] python3-jsonschema: upgrade 4.17.3 ->
 4.21.1 and add new dependencies
To: "Theodore A. Roth" <troth@openavr.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 06:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197002

On Tue, 12 Mar 2024 at 19:55, Theodore A. Roth <troth@openavr.org> wrote:

> Any help or things to try would be appreciated. More than happy to provide more information if needed.

Maturin support is fairly new, and rpds is the first real consumer in
oe-core, so issues like this can happen. You need to find out how it
forms the installation file name, and then find out how python forms
the filename it expects, and see where the mismatch is coming from.
Yes it's not simple and requires advanced, intuitive ability to read
large, unfamiliar code trees, something that everyone working with
yocto should possess. We already map architectures in various rust
pieces, e.g. rust-target-config class, so probably something like that
should be done in maturin builds too.

Alex

