Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E291BC43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:05:16 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6867.1783512310618372745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 05:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YFUQLaoN;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f186025973so6316376d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783512309; cv=none;
        d=google.com; s=arc-20260327;
        b=L2uPpcG0HS/4LZCA7e/edtFHbpdEnzH0a2zlOuelNEYPc76hUEIhu9BkaX5fwgUg0U
         59xjHMXfDXyeVtt8PCmN5F5aPCdUNoBrU1zYCELcWFviKvoZw8gflYujUazycSFY1GAh
         wGfltKTfmPC5x1dZ1i2Si+c2/Z5uzn9AxaRltcT0op68GBh1CCHAmiONEQjJKwo1Ec66
         o9ayVcroRVKCADb0j4nz2y1IOV4USkLkcz8sS+yaSlM3z/AGxdsOOqaKQQEFmOn2fNeF
         cPYi/qsZ7qQpblHDsksWU4YiIgniIsrDXs5DEJdiYn5U9dsG9VpOm0zXqvDcLGDwcfDG
         pZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CiBEo1cNzQ2a3Y8rJBT0Fx4FOxkTO8Z+XN7x4VgKq+M=;
        fh=fDq0W2i3w4UCs3XAS96L/mrnY0ELhh/lsJwqL51845Y=;
        b=ccZOkST4n7UkLxjpG7RKJKB9iV3UtGEN4fVVNgH+QMSYY32u/USbgeP+veFLQVr3SX
         fiN/y/ypfGqZRGmHfNRqSNK5TARr5OlRGd11IcImqabc/BrYKEh6u1TAAOD9ftVdoocY
         8aGgx29Vte2AwX/QOhz8GL9Dw+QR0BpWLF9/xAjU2jwW+lVCtzw2UtjJIHDWKfMA4Fgw
         /Wk7D8AGzuYJ7ONx9RJNFC6KTTT7XX/vl5aXJRtu9L+3xBvkiMOs+ACHmnYNBp0+X2mS
         N8oYxfSVKfY5TK76uKCVekVxRCw8kMsXBx/sdynjLdrQ50aNOBQUiRyrznuxNipt1U6r
         oOOg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512309; x=1784117109; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CiBEo1cNzQ2a3Y8rJBT0Fx4FOxkTO8Z+XN7x4VgKq+M=;
        b=YFUQLaoN2R9DHXAAo/G2o2PG1BkEAXcXUv+j3GBqUCoyyoBzycpk7fajXE3fxuhO9T
         Mq6K5rLnfiVlHI7wrSC8r7+zLgpCvDyDaaIFONdUEITV1mz5SA9N2XXv+p9ujtqLL7/1
         2tI609kV2IlWGNntyqW5IMm/Qb0F502Xi8dAMfN+GhOEUxq/uTiQjQtj5n8dfCsqBIJW
         krhjGi6f1Uca3uZXopxXkfrWSX2q5r3lGHXrfImzYMuOxM+GETc3qZa0EOAbXif9OOkp
         CZHBvA5+nxDYoNRBUZI+a74/LJXQaAH5GMj7SRoP21y9ldFbv464vsgDwbSDXJZb8zU/
         ieMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512309; x=1784117109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CiBEo1cNzQ2a3Y8rJBT0Fx4FOxkTO8Z+XN7x4VgKq+M=;
        b=q1CHSt3lZTKbLnryczPCQs9nOapnvqVMeO2mUbNkq+rNXx90yFlN8BUNdETzqicfj5
         j9pRD7QXvAxoHe3EGv4vcGCE/TS35cgzGHAS97lTHdab/qTBr8t4/jccbKZMCied4WaV
         /xKggWQF00ChPWTkyrXLq8IFEoURMBMdOXngXW1thv0LEDVKTIYV8FOh5wxWULIiJoeT
         mlS4ge6Ki4b24l9OxC0td2mwzx7Ujorl47CtfReso0w/EsLQuMhmx3O1gMPksqHbsFcD
         h83X58YMFEN0isQxffnI7BU4uStnuVsTp01yljuPHfxryPQHi+EKpSyK0dlHKdt6deEN
         RYKA==
X-Gm-Message-State: AOJu0YxyEUD0Ccx6FvPPh8Y7cpimkzQPk02fQrXZY0mwN6q5F5bkudk/
	pdaHkngWzVcJ1OFEeLx1b27ucEVzJZEWX/0uX51gYochQMpyAsHdprUH+9ZErIgdeWrLRBIcHdQ
	m0fX7MgpVhlVqYsgc3xPgh7AVOEgJYnVzAA==
X-Gm-Gg: AfdE7clkdUzsE9e8vtN9av5Y5yDj0C6EP3Ws7W48F9qxjC8ehSgz4ijo+MuxO0lVh6Y
	28WYCoyFzSJEDxoFHGwE5KgVYxQSFc6BamD0XgIHFJtJrXqaLjMh4Hb/USLDYMUZtE/YAj7kOtW
	f/bA9BAIOAYmY+RxCluc/ngQhu+ZqlA1B832WYGg+vg8oriENcIJLfdWMI2UBEm6rd+3ycAYwSW
	pWlj6iYO+Hh27tjYHrwHFA92VPV3726q6RYFxK3oHQz48qPtZd83WimHxA4W84JeoyDVte5gKlR
	dwMLcPxCIEPv0UiQ9N7t4toz8s/GWrghpLZ7uZdQog==
X-Received: by 2002:a05:6214:5007:b0:8f2:306e:87d8 with SMTP id
 6a1803df08f44-8fec304adebmr19206666d6.32.1783512309635; Wed, 08 Jul 2026
 05:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
 <20260706171701.70536-20-alex.kanavin@gmail.com> <DJSYF64M2ODH.ZWMOARCI56C4@bootlin.com>
In-Reply-To: <DJSYF64M2ODH.ZWMOARCI56C4@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jul 2026 14:04:58 +0200
X-Gm-Features: AVVi8CcJyjTZoQgRZgkxQQCFIIJYGDDUHuZMWVibBlTTu1a4196YQSJCvPDqao0
Message-ID: <CANNYZj8COf7OS-JX-mEgYnPWUo+YYDgVeHa-BQ2w_TrjgWV0Cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 20/45] libical: upgrade 3.0.20 -> 4.0.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 12:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240480

On Wed, 8 Jul 2026 at 07:52, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> I believe re-sending the libical upgrade without the bluez patch should
> be enough.

Thanks, I just re-sent the tweaked patch.

Alex

