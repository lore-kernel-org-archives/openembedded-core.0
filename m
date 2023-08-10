Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA49C001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:32:17 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.22116.1691685133898874823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=knkHErMD;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe1c285690so1678155e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691685132; x=1692289932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hsVow30qCFsrV3t/B2JJ2+edJvBU9u9h05Ve+4c18IQ=;
        b=knkHErMDpfTc6PA8fAHg6nvANTXBz2h8ShSMG6j4ciazy66LFN8XOt9shho/UHfI5I
         hyBs7ogiZEFZ8YqvjS+4s6+M4xq3yZRcCMQU41ZWihVsCrkmEuOhAC0OrLB06fCvo5BN
         3I6H0f3WPxPV5bjIfVTiCjZXyXkLKWzgnw319Gmjch9RqrxWpv1Q+htkkBbiEbg8Qxeo
         i0njAeDig/1C9qLlZgaJjqV4jK6Msdr7DQvepVLGUzd81GnaKtiHaE0U1x45iMLsIJoi
         3yM/XEKxa9L4yfF1te4zMjTDnUk0z5MZz/ZcP9Ivr0x/Brx3rCZyxaPZr4LDX22NRGJo
         aYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685132; x=1692289932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsVow30qCFsrV3t/B2JJ2+edJvBU9u9h05Ve+4c18IQ=;
        b=O1ew3TJtmeTNXUCQHc5EJECi1+K/G4OBdes13Mmiu5SfYjxM8jQU5BA6FNAJDb+7CS
         ZZoRlOugO/hvBbpgYxvkKxX4Y4DqkLxqCDMVvtEhup8xX7dXQ8NNXEyh8IfbQT3YLVkc
         PwMQsD73BOFY9pBAhN79aBXvI+sxgOLEHFIabMEUMVp60FF7RAONJi+uCgyeIBFPBYTH
         gD9B9taU1To/oxQQoIGrC8kJba413LiLyMc+KuLwYdG74+74ioeTFv4qvYW+ntvUFcm+
         4c5UB+uRLCkF8RL6d1sbvICRmbZHk1jCkHH8QPzSb2Z7t/NRpO0ycANgr8D9pSD5UQej
         SpiA==
X-Gm-Message-State: AOJu0YwqlNtei3CYGS40cGqiNKsuZ4vXA9XvEWMBK7m09wEEHzGiB81j
	7YA8p3fpjIf1gciEEhKrNSGn7EJpJj1GBQANnd388aXE
X-Google-Smtp-Source: AGHT+IGHK2ODR9pec4J6NsX0lcrjDfOCqdChBUgzDx3SC3zm46cy0hCm0ZB/oNiunEg4nubgmlSEv+WZy3ICRzV+Mdc=
X-Received: by 2002:ac2:5637:0:b0:4f8:6dfd:faa0 with SMTP id
 b23-20020ac25637000000b004f86dfdfaa0mr2128528lff.2.1691685131989; Thu, 10 Aug
 2023 09:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
 <CANNYZj9AacW-XB2G-6sHQobui1LGBHUMQTxV5EU=7ordJayWQw@mail.gmail.com>
 <eb94b91c02dbade5945a8883a95ed04d2ee31961.camel@linuxfoundation.org>
 <CANNYZj-L2P96Ev=xbr5LWoL7OvyVU6hGkCajksgMgxPNF4ZQ2w@mail.gmail.com> <bff014f2950bfbd1f3027a85992eb7c0f4e108b4.camel@linuxfoundation.org>
In-Reply-To: <bff014f2950bfbd1f3027a85992eb7c0f4e108b4.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Aug 2023 18:32:00 +0200
Message-ID: <CANNYZj8oojCWS-rV0tOfOGYN4fCqAAX793U0nbX_y1ZSOk3ohQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Update config to match
 ongoing changes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185813

On Thu, 10 Aug 2023 at 18:24, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm thinking having usrmerge disabled makes it more likely we'd notice
> a "bad" tool path creeping into builds rather than the case where the
> host and target share the same paths. That isn't a reproducibility
> case, more a general one.

But then should we really drop usrmerge/systemd from reproducibility
as the bad path wouldn't be noticed until runtime (or maybe in
package_qa), and that is tested elsewhere?

FWIW, I'm not particularly happy that systemd is nowadays de facto
dictating filesystem layouts. Or that you can use any libc you like,
as long as it's glibc. And that all/most key developers are employed
by Microsoft. Monocultures are not good, even if source code is
available.

Alex

