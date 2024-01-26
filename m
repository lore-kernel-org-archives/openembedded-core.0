Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC93C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 12:18:41 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.14352.1706271517092657714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 04:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWFwWwh8;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5101f2dfd97so430037e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 04:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706271515; x=1706876315; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eXbv6RSOPKYWpHeX1GNiCskHHseLOPDkzdEUmc1W5a0=;
        b=aWFwWwh8awRC/0V4IlnWwuL1es9lIeE2LPi9kiqui2OZG/Ft6/y9fQE+dl0mFzEdIm
         STX/UYGBRWhpvIFJSgi17E38QE4v1dm4YIRCk+g6iGOedOXCYL5sekwujgfzsjP1ZDhu
         20PO/n4j/GjLH9mQiZmvIkdmGw/iOMqVsFfqfBCSc1piYJM8FzD72g/geqkS0en+yfzB
         Eq1+jumOPGGoCGxvkAQzm1LByUOTO/sF5TB9aAYKZmnvUx8lsHqwyivtgdRGtaRFdRsc
         ejiaT5MblnJULr9QwmhKUymJpu9OgorvDhzLfbLVJah4y8XNUejDGGQDYoyEWTg2NRWH
         6+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706271515; x=1706876315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXbv6RSOPKYWpHeX1GNiCskHHseLOPDkzdEUmc1W5a0=;
        b=CCVOKF6+qP7EMiOLTl7HulPqgFMEzTRe24n4yxTIajtF5MiOakcAXWUUHxvIpBqYk8
         Sd4iemZtSWOdat1LGsc5FJFRpmyrMgJYdWM4jiNQLNtSBR+eqf55TFcc44ZFYM4fzBXS
         ifpRAdsT9ywQeNhX/gLK/aB79JifnssugBjPG+lJorb/F4MCRjy71cwpUpXzM98QrODY
         gi+tA6OQQ2k2lDeHlwCf38Bj2mETp9zn6TS1gRlBSbbV46qKrtPI4R3BUpb1erR61mPG
         QPqRAek3ranZff9fRfdqbECni11fuEhFECZ1DraIrPMOVEqTgsI4vwXnmG5FbCzmInYH
         qL+w==
X-Gm-Message-State: AOJu0Yx8c4+uhGNTNdrGty27q46BZTNWmQNUOOB3XxmWy9Af23vuYeFH
	aSTUA7TqqZJHtf6oUoE0A5eV+SM/Ucx/QEdNGcMx0tDWkYmww3/6ynoeRyi5ud6C7nT/NP8GOXE
	TgyTVAqa20Wqsm4ltV+R6O2GQoLY=
X-Google-Smtp-Source: AGHT+IFnplT3KwF12cSKoHlN8lExidxiPpoKwY/dSE7B3Wu7Y7d8gbLEYfc4KR5eom14jdFsEX9+edzGtUR6IefAQQo=
X-Received: by 2002:ac2:4434:0:b0:50e:3649:8649 with SMTP id
 w20-20020ac24434000000b0050e36498649mr587822lfl.61.1706271514852; Fri, 26 Jan
 2024 04:18:34 -0800 (PST)
MIME-Version: 1.0
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
In-Reply-To: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 13:18:23 +0100
Message-ID: <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
 appears to hardcode important tunable params
To: Joakim.Tjernlund@infinera.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 12:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194355

On Fri, 26 Jan 2024 at 12:09, Joakim Tjernlund via
lists.openembedded.org
<Joakim.Tjernlund=infinera.com@lists.openembedded.org> wrote:
> These are hardcoded settings too of which some could need need tewaking, DISTRO_FEATURES for sure.
>
> So reproducible builds does not seem usable outside poky or am I missing something here ?

That is not the intention. If there are obstacles to reusability, we'd
like to eliminate them.

To comply with selftest/context.py things you likely need to create a
special configuration with these extra settings, and perhaps save it
as a config template, but that doesn't mean making a special distro.
There are various reasons for all these restrictions for running
selftests and some of it probably don't apply or can be solved better,
but as of now they're enforced.

systemd has been dropped from DISTRO_FEATURES in master, so you can
backport that change if that's what is problematic. You can also copy
and tweak the whole repro selftest if it's truly unsuitable.

Alex

