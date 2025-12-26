Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E629E8FDAC
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 18:31:29 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157807.1766773887985564664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Dec 2025 10:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bsyGmBbL;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4f4a88e75a5so66925951cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 10:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766773887; x=1767378687; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=skPrY2eiL06tYKIt4EddcJPC7014bVOwZfRY59e3RZM=;
        b=bsyGmBbL8GqToWuUbclwCRJvBICXp/r+nmG+xcJoX7MszlWb0xc9x9Z+e1J78JfsGO
         l56To+oUROLTQmkMO/rDC3fXFvQl8UX6EGy/2o50Eh4s7cfwd7XfHNFrhbvMFb8HH2+6
         5oveWJqt0RdYpzpk5CQ9YkogFN4RYBx8lOZKCM9xTEhTpl0HXP8qNmn0bJ8BaNbVWfn2
         DHZUdwcMh7U1v0M+PtkRWQJaRJitC1a6gtRKfI1e3E+cHhAw1EA7CC+p3dhb6GsnOEnv
         aOd7nDCPV6LgSJghuLjboGdJfQgg1cx4/i9/cyPDZ7dDdmwOcyKYacreoG0SfJ6fyZuI
         BTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773887; x=1767378687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skPrY2eiL06tYKIt4EddcJPC7014bVOwZfRY59e3RZM=;
        b=jaAq8UUj4WAkx/oZ+V72kncDrS/+04695kGLEENXKGbYfnLqt3e+NXlCdJ8uBeUzKV
         4e7ndOtNJLf5DPM6DN9Y7b8pC4UbIi1ybt75g/fcNrpU8Z6zM8/bbYlrVAW3vMtO/OAf
         sVgBd3f0orgyprwjh0CobOBlXeGokKe0GKy8UlaATjwKu+zugDpZSARBwAlSRXMSrdTN
         qM2qSjZt8tr9cB0NO8qUtNPDLSGSyOi2/trMOCVTtIH3VJyeA5R2zsGhV2FZeFaDOn5R
         +jQC6Cfh5q62esHf5Ds4pKlhHiVpD6RdeEv5W5EVaV3Vt4gTwvNA2AoVUQ6V6l1Abk3j
         2A+w==
X-Gm-Message-State: AOJu0YwaRxnAX1XAlZtcobVOs2aN3tuz650cl1AaVLMaXOp9kerpRjMa
	wPVWpI8gucbZTwWWP3g/0E7SzdQuI47VMi0GoGNna1zx4giVtjSRF2UjS0bu+ggTmNs7AFsatay
	Y7m9EkNXi4aIi4db2fyTABDnp3TYBnlk=
X-Gm-Gg: AY/fxX649qm8CKvqyf80Q8Lo3sHGO4Ol8ztV3+c2krWHLx+7w7hJzaW7C5/J08ESfBK
	keKXZMqe06E1oj6qDjdy0WJ6Q2HbW9QFXdTpZyn+3yoWeq60TlyqGzqil8QJvkmwrH+sEnxMjfz
	pbhhdxJ7zAVJ3adxmV6pNb70T9RFNioflBSiPaD1wCTYNINL5+wmXwXtnEGWS9cjkVqfyDeb3Us
	JjrABPU5dfRBjWnDaeJADHKEUzifS6lrOglWInzo+H+Nu0J0DTfi98YT4ZeDRxDXLAHpA==
X-Google-Smtp-Source: AGHT+IFcONGQlqMRV+SMuImhccMxrw2IikJQ02t8ix5jfhV/JL0bI038fwfR6b6hSEtqPaGbC9NAMYyzwWSnk4Dos4g=
X-Received: by 2002:a05:622a:4c0d:b0:4f1:8412:46df with SMTP id
 d75a77b69052e-4f4abcd0a33mr357559251cf.13.1766773886747; Fri, 26 Dec 2025
 10:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20251226073545.11152-1-mark.yang@lge.com>
In-Reply-To: <20251226073545.11152-1-mark.yang@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Dec 2025 19:31:15 +0100
X-Gm-Features: AQt7F2pUyTGlET4DhKTupi74HouersGr3jbq3Ju0a2SBvoRZuhFKcRftgcfjNkc
Message-ID: <CANNYZj9LnX1-9TGMcNJ_E_VMF=TxuX9Y4V-6o2RvJB2ANQonPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.py: warn if target is not a valid ELF
 file in dwarfsrcfiles
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 18:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228550

Can you please provide a way to reproduce and observe the issue? I'm
somewhat confused as to what the original issue is: is dwarfsrcfiles
called on an .a file? That is not an ELF file regardless of whether
clang-with-lto is enabled, so why does it work in one case but not in
the other?

Alex
On Fri, 26 Dec 2025 at 08:36, mark.yang via lists.openembedded.org
<mark.yang=lge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> When using the Clang toolchain with LTO, intermediate .o files are generated as
> LLVM bitcode files instead of ELF files. While .so libraries are ultimately
> ELF, .a files are not. In this case, dwarfsrcfiles always fails.
>
> Adding the -ffat-lto-objects option allows the Clang toolchain to produce .o
> files that are recognized as ELF, but this is not always a suitable solution
> as it causes issues when used in conjunction with -fsanitize=cfi.
>
> Therefore, we need to handle cases where dwarfsrcfiles encounters a file that
> is not a valid ELF. Change the behavior from a fatal error to a warning to
> notify the user.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta/lib/oe/package.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index baaa0cba02..56b9bcd546 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -782,8 +782,12 @@ def source_info(file, d, fatal=True):
>      if retval != 0 and retval != 255:
>          msg = "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else "")
>          if fatal:
> -            bb.fatal(msg)
> -        bb.note(msg)
> +            if "not a valid ELF file" in output:
> +                bb.warn(msg)
> +            else:
> +                bb.fatal(msg)
> +        else:
> +            bb.note(msg)
>
>      debugsources = parse_debugsources_from_dwarfsrcfiles_output(output)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228547): https://lists.openembedded.org/g/openembedded-core/message/228547
> Mute This Topic: https://lists.openembedded.org/mt/116947501/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

