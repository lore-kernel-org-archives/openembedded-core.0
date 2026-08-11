Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE6DC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:56:36 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50821.1786442189054495216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 02:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lYkz8E7p;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52d590ce5cdso2193461cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 02:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786442188; cv=none;
        d=google.com; s=arc-20260327;
        b=il4bRjH/T7nMYuzmOS9levvYVyKDIIVrBh51YKwMESzdwR7TzEYzlwZEVS9GcXXwti
         /XigXPwgqpf832to9SMdrHXB8fvMaO1xKuAO9HLbz2HvcKLrX0M8r0h3UjS7DG8JpLVf
         UtDWgJJFELQo/n2hjZoJIbk5Qm8DLJd6qjHwQmFGAuOLV+/XDOJyJLrxFqcV9J2kftIF
         kZvMYAVkFUfTWUPcc0Iyo/g/T4g7IAgRGZenSBWcwC0edSgLEYmaMbjXNrtjdVuRW/gb
         noApJTbQD9zl8CjY/ELQENcdgYzJAgpllSLoR9+oxCp9tJyzHowV0UNXxr80h9Hk5uCu
         NCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vZFFsIjxLDvxJRrZtXcN3q5DSGO6W723rIA8iAFwFYU=;
        fh=+RM+TpM6nuk7iP5pCpejrvP5WFbkj7K/9Pq6e47cg5g=;
        b=PQwY7lRsSHm1UTeDro/ciit2h//4VSBUAQoWHhLY9AeAEHcIZT2CxBuZnvihBuWF9T
         4QjbOOiIfyIkvvj7vf7az+c+otDi4E1eXu3t6ULQMJQhPejHxcnzeylWmYxCyCxXXWD+
         FJoHzzHKcH3eOZkKBxVeCHPNtK4dgdZncjGTvjYIIoEL8Et+Fr0LcIvLrIBrtH17KJqM
         6vEBMIxAIpoE2IxSghk/6sUyo6owURJQ0MCUR4qlJWLLzRQvgQ3sCFeGDgxYKGkLZPFI
         mRM+qXOF3w/uLbCHy14RnxcxMWxv2pmHqG20xTq9iW2MtgXcXN1gC+exiqSW3rVx90GR
         xEzg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786442188; x=1787046988; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZFFsIjxLDvxJRrZtXcN3q5DSGO6W723rIA8iAFwFYU=;
        b=lYkz8E7pacMCICVgrqRvrwSiiPfs903dQyqM3l6hGra6th0ER9BUi5C+47sPo8Czu2
         KdITXpL9sh6uNzAoyvrDCWSzB7eN8+hIBqyHL0gtqtB/WG1gEIMUDoKHlwozWNVMCwE5
         occL6BPjDEwtUG5Jpd27U5i6/RkTdHXlWRbm+RHsa7Y06LGHn7T/el5tYUwlRlINtRj3
         rjqO6abwfuVIuiyDEL2HX+povtmoA94P6Fj9EEQRuQGZCXrNmMcmsghwnxqqu9Lqbewi
         VaA58YhzgMafO67UBipQbzfoPDS0sC5vNrN+MGGhDSOSYiKz75RZxUoSGhe3EAI3NGTL
         lduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442188; x=1787046988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vZFFsIjxLDvxJRrZtXcN3q5DSGO6W723rIA8iAFwFYU=;
        b=W6BTuXkRCAXT+l2YGKIkyhfumq10tr3Fe54xLnbnedOV5mOybfmdw8ERc/d4wD7mdS
         yG5+JQNIR9xQwwbi2MaaMfsJPLcnzE+J8wynEWYIlq56zdVCBd8/KnKEIohKO4kMLf/7
         vGqc5ubRb8Yq30jnwVYAN/VnYmu3FluYRArNd3BJezyKCam6mDVzRU6iRYKEKx+VLNRF
         BnUqf9ksm4O7JmCsiSkv6ehQW6ON/k4PYS1bxWmlIpF3XhCwPhTKI1TEFYz/ob1QrjBO
         wEfHwCUnOewXiu7rFMkWZRR+jWIJjemGrk5/UyxpxG5F+Gii6oMmz9/+LVOslZxwn0di
         tk8A==
X-Gm-Message-State: AOJu0Ywv2IGaSXSJ+zfcBi88Qu56Eowcegv7IDQ7r2qSE4GHfR/1PXdZ
	BmMc/1TwdlZJ4YPLuhpp76KBF1KLd9UD0Liu9qfNixJJXvB8mTBZdL5uZBO2tVBoZcgflid8y86
	Uqlqm4jZjpu1Z4WOFNCwiF8mMXVPCjTqFeg==
X-Gm-Gg: AR+sD11pfYYzAyw7C7vXUQLIdpFZyK08cy0uKkZzUHbEgzroFNotlQ5yTSsDLjj9WVF
	f32wRUrFD4o90igP3xAdLx1cza9mxXNRndzNbBLN8RwGLtkCEDzng05F4pKL8PXIyhXuG4NFUFl
	WXBgD1vWp9kq1osUAUlrvl7pQZgx5hJfodGUOH0GUQWkgmmhPsTdx8bzqMcZP6MK8iJFR3fONji
	eDA/TiDKdLPG380mgRW8FiWqDr+7ib0sOLdu4M9W9Xi/UxH+RCwSlXdpgTEqofPtLaLOrmUD2zT
	e9s026m3FANQmixgSY0a6ZhbKgbp6jdnkpLp2vlhD2oF1heUHCAgaMHxtwOwVWkj6jpt5zJdH4l
	DKdfwZ2bGAVCvTw==
X-Received: by 2002:ac8:5a0e:0:b0:515:189c:e0f8 with SMTP id
 d75a77b69052e-52d5851719dmr16473161cf.17.1786442187848; Tue, 11 Aug 2026
 02:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260810-fix-boost-v1-0-4e838b3d43b4@windriver.com> <20260810-fix-boost-v1-1-4e838b3d43b4@windriver.com>
In-Reply-To: <20260810-fix-boost-v1-1-4e838b3d43b4@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Aug 2026 11:56:16 +0200
X-Gm-Features: AUfX_myz9-_CXDWzNaCqoOjXQFMw4S487JQ14ROc4vGy9PcD8OixZDSUU5Tm6pk
Message-ID: <CANNYZj-pANF+9UZU_FUin7f75OueH_QyC8yXjQs7z3cCEjLgaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] boost: Use python3-native executable
To: rob.woolley@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 09:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243179

On Mon, 10 Aug 2026 at 19:36, Rob Woolley via lists.openembedded.org
<rob.woolley=windriver.com@lists.openembedded.org> wrote:
> The Boost build system executes Python in the compile task to
> import the Numpy module and print the include directory.

This needs a bit more careful look. How is the include directory used?
Is it correct to ask for the native include directory in a cross
compile build, combined with putting python3-numpy-native into the
native sysroot? Do we need to inherit python3targetconfig instread to
obtain target values? Does the build system simply import numpy to
check it's present (still not a correct thing in cross compile), or
does it then ask 'things' from it?

Alex

