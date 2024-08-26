Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343C6C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:43:01 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.49406.1724665371737741759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UiUBce05;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53345604960so4346377e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 02:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724665370; x=1725270170; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1d68DWPUL2R8cMEJupvkhcBlmZ9T8A3GCdO+EZm2wMU=;
        b=UiUBce05xYZs2BbWMN2X4Os12nP27PS829MZVjSS5uMdrFAVx0JKXc9iZsO4xVlapk
         wDv7TNBnZGhgTlbnNTM3bwlMB8tYV8il2rTOXwfTGa7l6nDThRsqxc+kMeQpiu7IsQhf
         mHdA2cKkdhdqhxOhY9U4FFa1deD6huVBWEq9KbLIMNNNNr4xUps78bCSMJl8CKckQ+Yo
         Vp7C1CHpt13MD9hcVNH1/DpDGV2JATdHeE/RyjSyC9m5nQVzUn3gXjv+Zz1PWWcoEbTC
         KF8hvlp+pOi67xkTmyvOCxdEtsc3Idz6VBl11OtfM7DZrzdeJFjI8+6ZEVU67NYrVDhx
         Dy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724665370; x=1725270170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d68DWPUL2R8cMEJupvkhcBlmZ9T8A3GCdO+EZm2wMU=;
        b=jxr0k+/jlI6a5vRlYflrwMVhJdT9+VQIRmmyBGYNjvokYKlijot+OMo3VTKezPnAb2
         ybR0t6413334zI/gf1wOnoLTETZcudfNaY2NvLeOhTpd4htb/Edy0Lq0szjxx+2goFqK
         ZpnB41/AAoVc6NIlzg0Q7H4i+mQDdx412h2wPo55VSMBR+Rfq4hMWK035Qtjvxv9bVN9
         k8leFygsJRv3IPdQQLwrPeO/P4XO4G4Owkt7WclBBQv8uF8PFRdqT1ls9o6fqZ5GymG7
         Bbt2uBIx3ft4lWjF0AFXFQwIx6Tpr230MS7gSE+RKazxJmJTOC3G1jvvleBCx9yamgB5
         DN2Q==
X-Gm-Message-State: AOJu0YxOFzUeuspMiV94huXxXm7LKlRdrN/eguu3t5fX+gQOrMq7k0J3
	WHibrRJcW2u+YVVFKk35rInLWY9FdIFAfRtq83OSuKBl4xl0cHuKWXWcrkhOUr+FRDeuS9kglXS
	J0yMuGDNZ5/xZ/yXCI43HALXbU+s=
X-Google-Smtp-Source: AGHT+IH6uooc4db9QNsl22F28FFA/tIAKXl7Y/uSVH0Z2HAAMGCSsbWy9o8y7JfzUxXjznWN68dBoorNpq221iLdAEA=
X-Received: by 2002:a05:6512:33d1:b0:533:3fc8:9ac0 with SMTP id
 2adb3069b0e04-53438784143mr5994105e87.34.1724665369098; Mon, 26 Aug 2024
 02:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
 <CANNYZj-aBjxP_usuhdoMNKvdcEAzw7-N2UiSqCTkoBqRAv9j4w@mail.gmail.com> <CAHirDJ_V1Tc4a268w1uUXYrNAd_MJCjuVJOY0YPwzjF3wvS9-Q@mail.gmail.com>
In-Reply-To: <CAHirDJ_V1Tc4a268w1uUXYrNAd_MJCjuVJOY0YPwzjF3wvS9-Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Aug 2024 11:42:37 +0200
Message-ID: <CANNYZj8cVdqCmftivNzBxvp0L6bsgHWwv4V0eAEyDvsAdAh8DA@mail.gmail.com>
Subject: Re: [OE-core] SDK in scarthgap after package_manager: Change
 complementary package handling to not include soft dependencies
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	Andreas Helbech Kleist <andreaskleist@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 09:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203743

On Mon, 26 Aug 2024 at 11:26, Claus Stovgaard <claus.stovgaard@gmail.com> wrote:
>
> Will look more into it eSDK, though I would expect other also has the
> need to generate SDK to support app teams without the specific app
> itself part of the SDK, but with all the dependencies for the app.

I was referring not to the classic 'esdk' (where you bundle a 'locked'
yocto build into a tarball and distribute that), but rather the new
'direct' sdk, where you run a few bitbake commands to populate
sysroots etc. (running them doesn't require 'knowing yocto'), and then
compose a regular SDK environment from that. This cuts out the need to
generate and distribute clunky SDK artifacts, but you do need well
functioning sstate infra. Then making changes to 'yocto' (e.g. new
boost) and fixing the apps becomes far simpler and more direct.

Docker images tend to grow huge without upper bounds, as every team
wants 'their stuff' in it, and you can never know if anything can be
trimmed out until someone comes screaming at you for breaking 'their'
team process.

I wouldn't say it's right for app devs to not care (or want to know
anything) about how their work is integrated into a complete system.
Well rounded experts should know the product pipeline.

If you want to stay with the current 'classic SDK tarball' approach,
I'd tweak TOOLCHAIN_ variables, possibly with a script that looks at
what apps produced by recipes actually use and need (so unnecessary
items don't linger in that list forever).

Alex

