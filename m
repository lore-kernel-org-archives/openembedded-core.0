Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D431C4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 17:58:59 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.17148.1713635931714104763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Apr 2024 10:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvskY4b1;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51acc258075so1797268e87.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Apr 2024 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713635930; x=1714240730; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M/kB3HyHeYyAb2BWF2uTA4u7BHGix9aB3KSuuChsIbw=;
        b=XvskY4b1w4TieSrLpgF8cOeGNZzPyELN6VsPbNk7qbjSjno8ICy/QwLRH2JmqQR12X
         +7Ei9l+Nyy5gjzmclE1qhoG5oS8NAQUltkRgz6XN9vm7dUU71QK43YJUayvbygsBhp7o
         yowgk5ZanNJ1lb3xn1tJc56KsleGLFqT3GQOgVc3jeYZTBHNw95Np+1iT5/GcUM8oMl9
         4JMcwsnZPOovD3ZL6mIbxN78LcxleAKrCfXvxZxbiGUVA/or+mN0KjFS3A1mjh6KWUtW
         NHH+QSDMCGhAHUo7OsNJme6MH/b6QXRPE9jT5QNoQLEdyXzNKmu29x//CRtC4zMWAfrZ
         k2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713635930; x=1714240730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/kB3HyHeYyAb2BWF2uTA4u7BHGix9aB3KSuuChsIbw=;
        b=lZqKyaC9mB8ikSvv3m/mhEPUA7JWyGUEgD4FzIaJhOgHbhs0HC0ghfUU6rVasItqd+
         E1MSJ9iC9Z9LkJ26+AjKvJQ23DhTh/GU7CkxrR86cZxVMGySa05jJSd4zERVQR9txPG2
         TARCfmTXiybDoOhXU4U5KejCBi79A6iJpCj+C1QE+D82JgNr/4MO24w23jL6JxEH4r+m
         5m+sCGQTGWjwEqRXEc4KZiDmLl4GRfynh0yrERMRR+mJjXqB8W64AU2HCvQsD6O+sFCL
         iCAope1Owcq9hqLMKtnVRpmferRC4rNyAP9BdIXGuHIZ6cLDxd/L1CDx/1UlZ1fdxKgE
         IEZw==
X-Gm-Message-State: AOJu0Yy3Gsyfvyc1bVhFToSf3caxiyz+SLNlIDaJT7R7MqMlFXc0eyQv
	9kEb7osK8Xg8WwxLv+oBf2G4Af+0fZFSlhkRPzYK2vgseHfp4xEQsIUgvRdOXtDT7HrCuG3laFp
	9kOrH6DulzAMAWNQV3wEcg/PtR+0=
X-Google-Smtp-Source: AGHT+IEVuXznWcba4wdTEPdqwewt06obHPQm+/49Lm3HAjTQgXLaPwG4e//F1nGgyLHDy7ySmZ5q41bKdz0/aju5Yng=
X-Received: by 2002:a19:6417:0:b0:519:796a:26d2 with SMTP id
 y23-20020a196417000000b00519796a26d2mr3480113lfb.35.1713635929627; Sat, 20
 Apr 2024 10:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240419121945.1920944-1-alex@linutronix.de> <20240419121945.1920944-4-alex@linutronix.de>
 <5e15b3d150e684bde770d7e1ec14806fb33a01d0.camel@linuxfoundation.org>
In-Reply-To: <5e15b3d150e684bde770d7e1ec14806fb33a01d0.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 20 Apr 2024 19:58:38 +0200
Message-ID: <CANNYZj9y61njDFgwbm+N_qA8_Nb0xS2X5i+V0CjcShRb7WzkMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/19] swig: merge .inc into .bb
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Apr 2024 17:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198569

On Sat, 20 Apr 2024 at 14:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Also, your patch From address is now getting corrupted on the mailing
> list, you probably need to add the From: lines to your patches when
> sending.

I think this has actually been happening for a while (I write patches
using linutronix email but send them over gmail smtp):

From: "Alexander Kanavin via lists.openembedded.org"
<alex.kanavin=gmail.com@lists.openembedded.org>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>

git format-patch has an option to force a From: at the start of the
patch which I'll enable.

Alex

