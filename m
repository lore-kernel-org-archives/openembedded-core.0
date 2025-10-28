Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F5ACCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:26:57 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.8042.1761647215287719080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 03:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+BEfpQ9;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-87fc4d29301so52434566d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 03:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761647214; x=1762252014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bVh+uBYoBruNB3agig0IoNMnv+pbDIuphC+59fCIlB8=;
        b=d+BEfpQ9WwpmN7unBO74NsYaZvEN13mRzugc92X1AEAKfsGN+WnjAQosVSczi5Uh4r
         Lm5MS40CmYyeUkKkHZDK04pdubVJQPK1JLmI4JKAhaTvwEfDn82DyZTHWv8ezg0jG7A4
         Xq+857dQaGNEm0LqTDUgcMwyNfRMEXxdmRztzJclKDQF12n1j1ChJQReUMpyRjOROmQG
         uz4wjpLbDMyY/uAF/5h71IM5SXj0RUMwV0pL0dttYzA2mBUyYta8rnM+gc/ouLpB1rCJ
         TT8Fd47Rwwn16cl6Y59BjY3rKivdP7PBaHRK4pQBtDnCQv5S2ISyYgnXPXjSL+Z8Qg55
         qERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761647214; x=1762252014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVh+uBYoBruNB3agig0IoNMnv+pbDIuphC+59fCIlB8=;
        b=WCNyy2tlguDRW2hYhwJTLjMqFTbcHXlZXSrp6cmaw9hfv+0qblhXnQorBSLIoLIQr4
         rxw4tBfBUwy1/RmwUOu2W+1ur5onvZfCVd6th+qwDX6mAf0i6ktMHljkoNMDMkMT/PAe
         EAM4BIFDJ/CVJ67XNeY81aPJbKeAFdboKU6cGiGSqvX4wjiijTTnj3YdHUPIYNQtLKIW
         49QIBPuzDilW7LN9kgjorpbRFmDnkiDET9qm0Sv6cgAzOMs+PlEqrNtw2rY+bt004Z+b
         KphN/rgLrELdsb/9MY+J9nHOuMORkpiM/7Gt2vfVfktaAByq3g3LhQ4kn3ba++L9cwDT
         EYVg==
X-Gm-Message-State: AOJu0YwiUrvw2RH97+2JpAm8lxLfVCdpKpLqnDR5TYn4ReXi4inaGnkS
	jOXfszZo0K9E/DLfPNVBa7fZ9DsWVDrFWM82ruLoCQc6nQLnZHeztExxf3YqxqAEHFkUMkZKon+
	j/MH/qxteFssMzRe1PN/zLzKPgvQDLmQ=
X-Gm-Gg: ASbGnctZDhtcbTqc4xXP9YWnhA1+hk3th/03CDyiwmsjRCjc7NKO2VwDVXVL52mAHDf
	+CgZKahHsjEw420w0NgYmnVQEZYPdQajS2PBgfA7Qx0q2YFZPcDLK0nvsdINXo2Ocl4Mfip8Fo7
	2RGQubu3Q7HpcTRVzvnT5a6LSMWkAL/pGvE6DIbee5q6kmS03CTvJ6fbCCgUtO0uCBrVzRRYIgB
	Nsag12QSOP1WuNw/p8QxrjIvwl942sftisOo3izauaaEo5JyLXET0t/TD7oZ4EHwTtnCpYogrUs
	Gz5pRxXTMHnGVWE1b9EDtCGB979SXNFRxZDv+SGys/JsPPSQniULdeitd8ztrt7SWNOuY5LdqwP
	jqIH9AejTNwQhnXeCtt2yhB2PlBof
X-Google-Smtp-Source: AGHT+IGO/+rixL4xPuYbILRIyhKMZA0CO3TFt2bJ+PDTdovqNxLvOOpUGkkJCke8/n9/vjwcnlwtiKEod0dq4OfgrNI=
X-Received: by 2002:ad4:5ec5:0:b0:87d:fc49:2a79 with SMTP id
 6a1803df08f44-87ffb057b21mr35380866d6.29.1761647214203; Tue, 28 Oct 2025
 03:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251028102341.955681-1-contact@schnwalter.eu>
In-Reply-To: <20251028102341.955681-1-contact@schnwalter.eu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Oct 2025 11:26:43 +0100
X-Gm-Features: AWmQ_bn-rO20rhyC0Y1FkVxfEc7BTdsgddXQmUroyXOwKR-gSPDhCn_tCMxlUrI
Message-ID: <CANNYZj-6bpHOuZLGV9dWacHu5YEEw1x-SW0B99Y1OqOCq-9rZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] core-image-weston: Add wayland as required feature.
To: contact@schnwalter.eu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225389

On Tue, 28 Oct 2025 at 11:23, Walter Werner SCHNEIDER via
lists.openembedded.org <contact=schnwalter.eu@lists.openembedded.org>
wrote:
>
> Running bitbake on the image without a DISTRO causes a "Nothing PROVIDES
> 'weston-xwayland'" error, and it doesn't help new users understand how to
> get over the issue. With this change, you are guided by the errors and
> can easily fix your image build by either adding the required
> DISTRO_FEATURES or by setting a DISTRO, if you know the root cause.

Thanks, this is fine.

> The fist patch didn't include an explenation. The same also happens when
> trying to build core-image-sato without a DISTRO, I will provide a patch
> for that, if this is the correct fix for this type of issue.

I think it is, but do include an explanation, as this will help review
(in particular if someone objects and proposes a different approach).

Alex

