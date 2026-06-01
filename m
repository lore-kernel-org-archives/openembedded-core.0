Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8026CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:08:32 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4216.1780333702448732918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 10:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iLGNzkmO;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6605d7181c8so2215331d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 10:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333701; cv=none;
        d=google.com; s=arc-20240605;
        b=HRLuegdnYqyLrE2ge3HTkms8J/tGthGhf6dZK0Z+w9k8mUB9UqSFWw9YKjba1uurfU
         2Ufm7Na86ckgYngt1UBpNE70GLVDAQygJQHuCJZSGmkr+FHpi6yeirgXspabGsh9/RKH
         rVwegouOX0k0+dNldmBHaeaWgvc3iQR4wqONq75b4NfWfcItpkAQ6T98rZTAGz0NcVzG
         d2VnvNCR0+DXuaJvVF4RHv9YADgmPZHMHopGBtoSuYjZDD4Ypt0Afs0xW9b3tKFWTfPf
         ZD5koK6cQhfNaCBAxkFTa5dxQK3PLkEAhcOpEKxKqjovmkz6BmNam0OM8S4Hja84nA0a
         1Hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qYr7ldzb9Q0LuY4M85qHLAP7HQLzGNeNYTATIL+ARaw=;
        fh=6D08F4ViEPMn9fNUTnXxh/MfSY/OtXZrNXQvtB6wCB0=;
        b=aRbRJuqz77yESFqFVqFYo2KvSOq7KFLXsXiDR1Rry/MrbVPvQ5/VfPWH8TOaBiyQOB
         XrLKFU8ECezo3UqLKVoZrdTwJ0dqphrn9i09OFZojnSgxiijWU6G2GLhmhsM6z9onXb5
         YMB82gISfgcb8yT7d6OW+Wg3j7T9VpNswMFOgJm0H+5ank0V3qc5I+qGIGNabDuslwf6
         v/zLQ5G1LWXTRficWuMUrXtKmlhE6oe+uy8wYhjbaVU4H+JiRhJgUIOIQZojF/Aygs/b
         nm2RmyWrNSxz492loM0SHBhpfyaTyIr1AOHNXFWTXTZua0dON0K2oCei5JIzggrzqsZW
         Idrg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333701; x=1780938501; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYr7ldzb9Q0LuY4M85qHLAP7HQLzGNeNYTATIL+ARaw=;
        b=iLGNzkmOhcT5XVQq7sITOj2Ecwa15ZrLf09noQpb5sizqHk0IJqYx66DMTmdukzjWZ
         SE5JWN6n+QB6bilLIGqlrlVA7CqWdVIrDZBZbsOgKca3NEWmnRrgjf0vVLJ0f1LU30tJ
         sR9W1aaEopXDAWPXb9KU+vCO3YxO89wS2bRgfyL6PUZFiqgnIxYzJ8MlxThsa/bICYYL
         38ZmruaDvhh/r6RD1wKZgzyLKH7qsGzgREePuSX3ly3n65V9hLd7JovTEWypDhLFPtCN
         XI+NeEGgGD6oWr7ngO4HiCQoI575IwGy+COBrUlphMZ0m07C+o4V2dbOPURLADzGA3zk
         jmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333701; x=1780938501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYr7ldzb9Q0LuY4M85qHLAP7HQLzGNeNYTATIL+ARaw=;
        b=kpG66DhX1LL4wvfVoU4jj2zRwxdo1MXVHyuQKI3rcBH/Ujcrbzm1uOMuYaH+scqXGP
         3HhKOnc+PGxPqQCZNNUyK72bFdecdvmAiTJQ0TZ5l07c/7S/KUX7eJvaO897tU+5l7al
         h2A2/ZD6XBda2C4qcjZe6M0hp216dSS5ULniDFVWlFB+gnQgtLMjgNsprY58Yw0C62mi
         kg2L4o+c7JgHuv4X9CY5ZNEcIqHnLLV9kzSxhUKdyoZpO4Q9ypwQp9egKqbmDExbbdvR
         n5pU86aBbnCKYU8iv+DNwIB8XEWKTVj2w2X0foJFA4SnJjWPHv3DOm+eLTGYdMD7mer2
         QIgw==
X-Gm-Message-State: AOJu0YxEK0/z/XZvxPGSGp8fB9mVAR34L5a67SrasjRYZrAEEITlZ4r3
	ECjAA+CI1qlw+PFWCEjFVumA5ErudQki732oNdvb+Wa3srpcvB7O05SDOXbrmgkmih74RlwKMg6
	wuQNyvq1XIHNESSIN2YoUhsQ+/mjKIVLpdA==
X-Gm-Gg: Acq92OFUQ+v+DQ/yhsb+d5iZnA/JnU47y74XWCE1emhGhr6rrxuQude6JaZ++tG0KML
	B+Sgbrcxid/gS7+Irlpme6XFszuaCGuPKRI2VKSG5rP3mjduB9X/K/LgStQSUzgTr8CR4U3m5Lh
	P2hitYHPDygXLARivztrR4lPZtcHiVOHOCjDiPexZjGs6LREHsYd4iZo1r2obG5w9fDtvWMQGqW
	bVu2+mBvw3dE7hY6meuyJ/iGqdnWbN98FpAs3q60EDX31HMR6RUDIRokbOGOpfLtJz6+QmmBJbt
	P2Ad/i2hdPpTxceEU/eJwauxTPARShZLo+K0Y8UqzJ17hXF5zZ3N
X-Received: by 2002:a05:690e:1243:b0:660:6318:eec8 with SMTP id
 956f58d0204a3-6606319046fmr8957189d50.56.1780333701391; Mon, 01 Jun 2026
 10:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260518055558.3982813-1-Qi.Chen@windriver.com>
In-Reply-To: <20260518055558.3982813-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2026 19:08:09 +0200
X-Gm-Features: AVHnY4LBrTD3G2IIhx_yzQm5ZKca005FB4QumgcHUU2-OVyRZR32dI3R8XEgRJ8
Message-ID: <CANNYZj8N8gizUO3NpiH_tL3urg6L5hnWo8y3oQwfCLKpJeLO-Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH V6 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 17:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237972

On Mon, 18 May 2026 at 07:56, <Qi.Chen@windriver.com> wrote:
> We want the ability to do stable version upgrades for recipes.
> To this end, add an optional stable_upgrade parameter to the
> get_recipe_upgrade_status function, which defaults to False and
> when enabled will try to get the latest stable version of the recipe.
>
> The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
> it, it will be used as the filter_regex. If it's not set explicitly,
> it means that there's no stable updates or the recipe hasn't been
> checked yet.

Hello Chen,

can you also add support for this to 'devtool latest-version' and
'devtool check-upgrade-status' and 'devtool upgrade' which would use
this when --stable option is passed in? So that stable updates can be
checked for and upgraded to without having to set up and run AUH.

Alex

