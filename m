Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D871DCD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 10:22:51 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32035.1778840569481730598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 03:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oNIJkdng;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b5232009a6so91624486d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 03:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778840568; cv=none;
        d=google.com; s=arc-20240605;
        b=OYlgscwN7UUwEzkjLWVbWV3oQ6xQm7isHHDho2Efa5ngwhJXr+7zBRpjSw+/l4qKZe
         2Ii6hjvocb6ravm1ZoeGyr8uxhHgWnZTzUIL1RfLctB7JY0J3BYZh9uPz31Bw3iQRLS9
         1TwKku/Q7jK8M4ZUKNyurlHBhaxq0xJFP8AI/rVtF4cK13KCWAAM1UB1mS7M3rqMnlJ8
         lPWn85ZoKue+g7ul6EDtcXgOpQgtXCl00vcO3zDzb4vc0xwphW5pWGb7FZrmW0rdYoCb
         jzO8oKNcurJYpgip2YMlF5H+RdM3sWmqsE3EIDMPjnjJJ5su1m0sJl9l34OfvxRfILLc
         lk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nrMTFTcxvwZSGkQ9WfGuWRux9FQtHSDi9IP2vl/e6bM=;
        fh=6F1/nDtUGDFe4hKV6F+Sifpm15x7ighjUhOO0UDrHsE=;
        b=eX0kl48QBYaY0B6gHhTEqG2kZz/6jNT/SpWiPbWv/IPHE2JTqtOjdVcA+1GQRKSh3O
         LaRyOyTGs9e8dIdavcJAY8MJCG97l8kd8hX7BX7+V+EjmAJr2HaY8Lu01vglgdLYBTBa
         lvYBftR1w/hkZkQNRQgFZBIqhKez76kQ7NKeVUaKOhsumWBXMSXlkh8mnOdD5Y0sWUjo
         EdXfId2dygzlWTELUVlsDZgxzbP49AOJlq/Zep3ROtaVXqOzUCCIuKe4JICNby0TFnWX
         vtuDmMyblp++F0G86wzLBwx8V/zwwYQQENX32tQg6AXF+Rb7xnKE+i2gK7VmjxypXihd
         pkkg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778840568; x=1779445368; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nrMTFTcxvwZSGkQ9WfGuWRux9FQtHSDi9IP2vl/e6bM=;
        b=oNIJkdngNu23QB+dxtaisZgX7FY4t70I7CpIhRUEJbJBejuBJXdfWTpC8MrWA8mYEh
         VojNmzbX3Ia51O/MVY7EgkyHk4PwN1wo977LrEbvWRo2RvxBaSUgtWvW0Jsw5kg7cj/b
         QkZ5RTR5TPK2qqNNj9RqLCdac14mNFmsKnYXCxW8BWp/+5MnW552qk/2S0x5/XKtINZE
         A7Z0m4zBnege+lqs8eZ/owcZg5nMvjObm22CCk+7yttLGXVclNng7NCPg+xADUafuOJ2
         xgk4fbL6neGcMPKmOO4w6JEfcsDeQrLLzR/Fq+KeK+SLtiVPE71oDZjNxNt1Xg67lprD
         spPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840568; x=1779445368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrMTFTcxvwZSGkQ9WfGuWRux9FQtHSDi9IP2vl/e6bM=;
        b=JuKjbHfae1Tttga9hMrOE7M10IWEschls5HbIRa13BOM8VVZl12rQJPe8CV/cBXplm
         jatbOjKG3eJJ0MVre55b5Ov5ybaaCG1jqlfuOVaduYdVhEfF/kbV9YK3n57Tlx3b1+KV
         zv14JEu1UwtMdgbvdQ0iHZV1OQqvsilbT9jQ6EPrIhjS4+mBQRmJdtUTVJIcCTfqOF/l
         iSj/nY4kDWFm+vIcoOqDcOxNbybjvcLBEFlIQWXFTbE1su5RMtDevFsCS2HEW+ikqOCM
         ZVFchKV2f/z/CNCqfxFZrwlw1pn5wJztbI2ko/Eyeqwak6eK/cxYNjLe92GKI+OvQozy
         Ewtw==
X-Forwarded-Encrypted: i=1; AFNElJ8LDhjW2sbUo1OZFgWCFxnCThZCJdtasy2jlIocHjmdOqtxIVRiqxO1GrfmPKPqU7Grxcuy71MySM0NfbEx8w1j9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwtcsZTj83Ug28abib1fLHDP3vtMc/ovWDivNMMvBt7by6zbGZb
	AVnQKshN2gMeZfguEY2zwPHppHi7hd0oVnPHN4p/wbXtPo3XArubtNFu/y55Mc1s4lUVKfR+FSO
	f99GSaEbhgwxtLLusmapeJ3HvqBs9CGY=
X-Gm-Gg: Acq92OHbssBFDVdgD99OwVZWpeermd44d8iVyWcSFO5iesGv4J8o6NbwAf+nMRQ0T9G
	rjjtmtVQthsJ7skcAbrM4kx+srwqNkBIq/2ZYQE85RA1W5DsnPzajMaDnl9NRahdCXQhEE42b4v
	+PIgyhsIposIICIZFGSlj3sXz1HcmANRaP3OaVGeQpc5Yv2E4tFtXCTxwdAqYP3SMwrL66PpB4I
	bxsZ8Ellg9mr5YeNU4PHl3mBJUZvQwjbJO4CWoVaFHcno4urh+ux1DUJBM1GcJ0vXKCHNDyUibc
	EOKAfbRwKXD7aHQPWq0KtkZRrH8RG48tBIhvcRaJSGp+sQGPj5bZ
X-Received: by 2002:a05:6214:2e46:b0:8ba:ad10:97b with SMTP id
 6a1803df08f44-8ca0fc06e26mr58429086d6.41.1778840568508; Fri, 15 May 2026
 03:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <DIIC2A22J8TH.2IC6O1ZQ1MODS@bootlin.com> <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602B1780BBA2AD5C925D884ED042@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 May 2026 12:22:37 +0200
X-Gm-Features: AVHnY4Jr70KllB1jGmSIuC6ilrkpNdAtnA2SgJok51EBUr5xUWP4zuognoh8BAU
Message-ID: <CANNYZj8pf8FtsRjZpnMGP2egY+Wc9aw4ZDz2DR=rqv74Oopk1w@mail.gmail.com>
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Qi.Chen@windriver.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 10:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237078

On Fri, 15 May 2026 at 11:06, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> I examined the error messages on autobuilder. The key part is:
> upstream-stable-release-point.bbclass:18: SyntaxWarning: invalid escape sequence '\\.'\n  return '\\.'.join(stable_parts)\n
>
> However, the actual codes are:
> '\.'.join(stable_parts)
>
> There seems to be an extra '\' there. Interestingly, even if I manually added an extra '\' to the codes, the test ('oe-selftest -r recipetool.RecipetoolAppendTests.test_recipetool_appendfile_add_bindir) still passed.
>
> Could you please help me check how to reproduce this issue?

Hello Chen,

I'm not sure why you're not seeing this, but the fix is almost
certainly prefixing the string with r, e.g. making it a raw string.
Oe-core has had lots of similar fixes recently, e.g.:

https://git.openembedded.org/openembedded-core/commit/?id=24b0ba00d4f0b4d9834f7693ecb6032dfc534a80

Alex

