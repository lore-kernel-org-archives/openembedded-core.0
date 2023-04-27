Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F64C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:55:01 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.15104.1682582100063644219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PTWnrvFk;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso9032952e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682582098; x=1685174098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=agmBdzDMPFpKdGfukLrsxZWW9PHZmDVEy2zYmoCPaas=;
        b=PTWnrvFkg4R5A9pnE12juOUlGWb6C/T+Q8vZV3E7KSSaikRl0PpXvjqloBl2h13Bct
         WqmYVYKFmqlHJ+6TnlMLTrU3B8qmuq2MAb0FiXCa/8haiA7MSW8C2SEr9tCGRI8S/10K
         I1tWFgc8OcU71e2u0EOpDyEFvid2KtTzzHrv+UcbtIMLGbsmI+jvNRnSSHQPzyiXOaW5
         +/gaKve4hpkAlA/Y1g+3Py7/UwzS4pmUToC3mpgr7jsd4XjIoE0hqKHBKqLT92vWPfE3
         PLXD8ZJexMIJeSIKb6o1TOnWaMTP6Mf8BrLULAXJ6nLniCiOOpozEunExLRKerCjsZrr
         8rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682582098; x=1685174098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agmBdzDMPFpKdGfukLrsxZWW9PHZmDVEy2zYmoCPaas=;
        b=L0FI4ydXAWfi0ZO8R8Qzwyk2ge+fKOin+UNaNbrAqH+dtAqjypgqhwaxgIvWnA2uDj
         mVCZ1FidMnm8WtZM5U2K7nYyiFn7bQBlRdYg0lNovlTfMPLV8uXTWKow/9dUxnyh5sil
         UG5uneY5CJ8YknN365Caxwwd09bBNE0g4oUn4eset5TFU/HsmI3aOakemVHUUkV23UTT
         WU0faarTSXmbyBqnRyiHuOjEavR1p1xcVGjpbt/nZfNURwuFy5TnNhcgPChdleShK0/R
         cPA/Iqe1UDLifC4RMvoRtiZLcHMb54x2+X3KrwpEhnprvRkEsvDDDcNhEbHJC0nz9N4n
         oTXA==
X-Gm-Message-State: AC+VfDyuisTjJ+fy/qM0OUnkAWPchj6SX2q5bcGTAZri5XRsOIIsBheM
	SCNAfs/nbGN+y9Yoy6xdMOzSYdyaborLKzDu9Is=
X-Google-Smtp-Source: ACHHUZ50tv4yzKXqUUJmcZKcCIibaRCGLNue+IVkKDDMwmtNChQI7Me3Smv+ObMG81Rc/V2nXmKNA9ykyuucbs2AckE=
X-Received: by 2002:ac2:43a8:0:b0:4e8:44e3:f3da with SMTP id
 t8-20020ac243a8000000b004e844e3f3damr354876lfl.39.1682582097962; Thu, 27 Apr
 2023 00:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com> <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
In-Reply-To: <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Apr 2023 09:54:46 +0200
Message-ID: <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180482

On Thu, 27 Apr 2023 at 09:48, Khem Raj <raj.khem@gmail.com> wrote:

> It will break compatibility with older kernels because we are telling glibc that
> we have 5.15 at minimum so it will assume system calls which are available
> upto and including 5.15 and some of these syscalls may not be
> available in older kernels
> by next LTS it might be that 5.15 is commonly used but it still
> remains a problem for
> precompiled binaries and libraries etc. sadly

Once again, this affects target kernels only. There are no new
restrictions on the build host or sdk host kernel versions.

If you are using an older target kernel, set OLDEST_KERNEL to match.
If you are using precompiled items, I'm not sure what the problem
would be for them?

Alex

