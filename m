Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1A8C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 18:18:16 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.29292.1741112290442596205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 10:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVWOlDhw;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e889e77249so48301816d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 10:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741112289; x=1741717089; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tBl6+FjvG34Riwk8W8pt3EOePIiwyFKJTY1I0dEZwoA=;
        b=FVWOlDhw5tLdc1id6d9EAxy3Wf3iqAmvVedNcR/VlYTarRNX/aSyr5NqviMDUlLP1E
         tk2W2sT9gGmbYaR4f2iorZUBhBBKd9B9TMuytwOfe/xXLrc8ZkRnti2RE0IjaJIfty+8
         SPyFuIOVi+fLd7yG5eSMuBc43XQyXv44iVJEG0kwDIhQpDHZzS0bN/jeNS1/dMtDbgM+
         EdWp//5mjgOtsQmSLxNqqievqb+wPoAKkfPSwif3M/276x6oKHBP7n/bBhcKAfuJKpXL
         pZcug2IZcKayyQ72p3fzUOJCMOiXqNuBzY8/q3ypqYSgnyNNAJFWgTvcYk13LepSoUhF
         3nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741112289; x=1741717089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBl6+FjvG34Riwk8W8pt3EOePIiwyFKJTY1I0dEZwoA=;
        b=mb54EAkEj1M877oBYLKG3dabfgPcJFNg8+6+PaR859Gas4qDm6yHpjPkwBGvwEX7kD
         dbiSf4TlBad/g4XTO1sywaZg4uRsNNtSjEH3sZO2q7bxcoeJSNNDwFcSOMnMEH/Hxz5d
         VqfjGY938hkQ7sFRjvB3YCfHyAra1ICV5SdnF9MjVpv1T1h29wBAKjBG43tOFC/3G6O/
         sWlrw9c2syXyRa6wZiQN3fNyLpU2r/9tETZIZx2g4FOZsUselvADlZzr5EAM7LevdtBW
         BeoQ+wmMVMQcrJIuntdzr6TUXPK2av7XNgHaoTYRkVsRZCKjvuXJPGPVUMUct+sFOJ42
         Wf/w==
X-Forwarded-Encrypted: i=1; AJvYcCW34QpdcCyWqp1THtThLm6GvzQRoZydDRJ3p8uJby2TwJFvV47qEioMGJxcoQiCUAXpvwSrQ2+VQJyXsVTcQyrjAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywje3gQUlYbbCVI8zMKmP3GbnyhmgtrKM++SnyUkX9BXMsC4eY2
	N/EjtCuzqg+78a86OjlhUSbZZ1Bk6jUJjwzpev366dTi87FJsNLsmZUzXOMI9uLB7YCv6gkZVNT
	78RYqN3q+gfzrTKLSq0hkrUntdnywL1/I
X-Gm-Gg: ASbGncuLsNVW4pda2rhPf4Q9De41SkBSFt4Pz6KOly0AYG1c3UpTVucnkK+G1AERHUS
	haJXT15D3G75fpEPnDt0BRR1GkjgdE/CuC1jeGjJOejF+Jfvn1T9UhQqCVCP92UpjPpAXoCRTYu
	kv7JG2wA7x7Q3TQ+oWvApRPdeCFATj1IwYP5EMoTA6Y1xQbpKfqQFL4XfE5RH9
X-Google-Smtp-Source: AGHT+IHrI5XY50KuooR4eUveHmsPlX5RDf6sdu8uJfbKyELN17P/OxCc7KFLt8CUYVCNusbf6n53cvoLqpmJ3+di6DQ=
X-Received: by 2002:a05:6214:501e:b0:6e8:7bc8:a850 with SMTP id
 6a1803df08f44-6e8e6c67472mr4986246d6.0.1741112289436; Tue, 04 Mar 2025
 10:18:09 -0800 (PST)
MIME-Version: 1.0
References: <010101955174417f-41791d06-a857-406f-b753-24fcd292bc21-000000@us-west-2.amazonses.com>
 <22c66e46-c188-4ad9-b527-8aedbab9ee0a@gmail.com>
In-Reply-To: <22c66e46-c188-4ad9-b527-8aedbab9ee0a@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Mar 2025 19:17:57 +0100
X-Gm-Features: AQ5f1JremNLaemOTezwU96G0iEjZwWBx_5chgLgs9IsTlt6PmyOvLNjawBMMpYE
Message-ID: <CANNYZj8VDwt5VRX07hevzgrBs_mJ4snyJKnEPtkiBuA2AQWT7A@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rpm-sequoia-crypto-policy: upgrading to
 ff7551bbb3011f17cb8c6aac03f64682dde14c21 FAILED
To: zboszor@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 18:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212290

On Mon, 3 Mar 2025 at 06:50, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
wrote:

> > INFO: Extracting current version source...
> > INFO: Extracting upgraded version source...
> > ERROR: Execution of 'git checkout ff7551bbb3011f17cb8c6aac03f64682dde14c21' failed with exit code 128:
> > fatal: reference is not a tree: ff7551bbb3011f17cb8c6aac03f64682dde14c21
>
> Do I have to do anything with this?
>
> The new commit ID is correct for the new git tip of
> the fedora-crypto-policies repository.
>
> The error looks like a checkout problem.

I would appreciate if you re-run 'devtool upgrade
rpm-sequoia-crypto-policy' and see where that commit id comes from and
why its checkout fails :-/

Otherwise, you can submit a SRCREV update to the latest revision. Or
AUH will keep pestering you about it every two weeks. This is what
recipe maintainers are expected to do.

You can also ask upstream via github issue ticket to start making
meaningful tags :)

Alex

