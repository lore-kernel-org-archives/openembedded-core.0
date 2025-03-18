Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D66C35FF3
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:20:55 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.945.1742314851344566262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N+g+FlSw;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e91d323346so59924916d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742314850; x=1742919650; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7RZUqZ/Nz0eVuPBAbbZjdvudJwBH5o834O9gWPAowiM=;
        b=N+g+FlSw9lLk5oPOl2WgFP5SlCmZoFMR4PmXzu67Sar5p3vZO/LsXJl0Quv2F2/rkQ
         sZlEbMweMMYyftAulkNSpSeSPRnhC5ztcDVOR5UeFWnIVrgmY2oy3t0uzZUpeUzDxdRF
         uf7QbnR1sq7dCyungp+htmUgjtdq+c1ugRM2lU/BcqbMDOB2TqIg5g65n4+jJTiQW+6g
         iCsQVmNpnamGlebhjgc0SbMI6VJXDXyCBYprHJSS15mRCltksV1SNGurefGZpwL0IHM3
         cuvCMl0PVCmmLlUJFmQAqv7lx81KJQROpanPSPqRQvJD42X5AtMZAx6yoAEzl8xdOg0D
         iaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314850; x=1742919650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RZUqZ/Nz0eVuPBAbbZjdvudJwBH5o834O9gWPAowiM=;
        b=FVnt5D/SPHvXk2NFz5UQSp1a7757tP79pigxEK6acpb4AoQSNVdNHyLfed+ESLUDKa
         0E0k1nggXC5CjlvzGahkMULo/nPtRLUJkVUiVr3kRMwGBIu7wRi5051iMvINGt41VdIs
         ZwwFXVYjrH2njNdHuziAla5GQ2LWnvLy4PRuEdLljC0HseK/iYFUkyGLOQg/oBlqvuCj
         kHUEjxHjvc77TYFD4EfOmNy+fA+edrQPTCb0t0EckPFVFb7RTJzBRmh5wLSQzRm/+VGZ
         2w39wJ7akLe+0UjJiOWjr8j7preOyWagmhcX33JRFJkdk30tpwfYIb0s7MArDHMcNpUs
         QKTA==
X-Gm-Message-State: AOJu0YzV3vMnmOgFyDkeBK+NzwkDQAPOldfDDIjFP/+6rKKLJbK3tRgn
	lvXW1t1EU7tstp/Z95JDqQ4n404fjRzQ3MfmSlztKAwk1ZVf74KWBxrC40XwCuY7x/ExIGnbjIn
	3VZqVYFeDrh0+tT2jex6y7Qdzp+s=
X-Gm-Gg: ASbGncui5wC8hQbs1SeGEEvlF74drgUbDNRH/MAvS9sPaHTMpWCvbm0ODSNou82GBdX
	rkSQhPWGwxO/P3iKXKluM9tMdIXs5P95yC+0VmEZM/8ARw2UjECRO6w7fnfYX/SFJeI/8P0F2Vf
	9FvejwN53+crIgYxhQAO0cqr9sj9L6jqg8zGRUHo+rHvxamombfw3XRmZ1vH1d
X-Google-Smtp-Source: AGHT+IFCWT1Ll62bXryrgsh1FMC/XtUuf3U3nvXQhIvcu+GWz043Qr+STVJlF+wUO1I/ABhmZuhV0/EzXMKBlCUSkLY=
X-Received: by 2002:a05:6214:4a0a:b0:6e4:5317:64a0 with SMTP id
 6a1803df08f44-6eb1bbdb50bmr55596606d6.13.1742314850373; Tue, 18 Mar 2025
 09:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-5-raj.khem@gmail.com>
 <CANNYZj-_OsiNMuYvm8iVDvKrvcnGujFqN9_in_cB9qj-gdqVBg@mail.gmail.com> <CAMKF1sq=tF+-=ReffePVyaSY40DZNytGbbUOmyjSkOHox7FQUw@mail.gmail.com>
In-Reply-To: <CAMKF1sq=tF+-=ReffePVyaSY40DZNytGbbUOmyjSkOHox7FQUw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 17:20:39 +0100
X-Gm-Features: AQ5f1Jo37mg7ZACoVcBHYsy3S86AXVLuDlTjeVsv1L9h9AKG16W1LHd45o9_KJQ
Message-ID: <CANNYZj_f6aHR-1w=+zc2WaaB-zM3P2MLUdEQ=T9L5O8g4FP+rw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] ncurses: Upgrade to v6_5_20250315
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213222

On Tue, 18 Mar 2025 at 17:08, Khem Raj <raj.khem@gmail.com> wrote:
> > I know we had them in the past, but ncurses' YYYYMMDD are all random
> > development snapshots, and I wouldn't want to update to them. Is it
> > possible to cherry-pick needed fixes?
>
> Fedora is using these releases as well, so I am hoping that it is sane.

Fedora is wrong too. They're *not* releases. I have to put my foot
down here Khem:

https://github.com/ThomasDickey/ncurses-snapshots/blob/master/NEWS

Alex

