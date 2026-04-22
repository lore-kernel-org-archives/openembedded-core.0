Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC69F9B61D
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:07:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79955.1776856060900722894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 04:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zp+zDrvw;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so5897522e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 04:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776856059; cv=none;
        d=google.com; s=arc-20240605;
        b=MfZvGa+iQtbUiNYnpZFaV6HzgIKTbjBfIG1b9tZoZF5C7AMamTA04kS1Aj1JOFpGMx
         kOMlBKqI07kz8T4qEZQ/mubJctoZ05XlUlW0d30T8VvCDp4qmOqC85jWtv+byEsvHDG2
         HPL2CAdutLuckHvMkTGa9rROy+IGza0x+hBG1I3Wq1wIGEB2ejikNDVCXhSWKwAqDLQn
         3IHEL54pjak3+5uNfrVFUxgJVWWjjR/BvcDsmtS4iu96Kn5/lONIuD7Prpy/OUXIBPe6
         wMtHVTMlq50dDIjvoRjQMhzxcOjyhAFtZxYeuCB5CosCUgrZliI/wbCf0HaNKTgItv7o
         GhZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UnlkdH2rvme/FPOJLphqjiooJBuSDOHmxyaBSavupfM=;
        fh=1u5+MVYV1jnHD5RRJkNkQlDRJDs6L++BhuUt92J19nQ=;
        b=Wgu8d0e3LzkeAZFu/BoUOXdFWKTv5KTuqB4UxWJ/dLqMZ5maTc7zOKSbXwDmIgtFOn
         FG/Z349UYP6vF6b8vr8vqI/naCTY4Bok9SUD6yKv9r31iSZOLcatN+vED2JBmV1XBacR
         +7zSm1irOsgkzCh0ITF3rj87FmFOE4+oJ75TOQYDL3Z8tLJ4hdFFtxyz4T28NIj76nr7
         w7oQpYFUkGd0+DkTd2VplpnvZDR6jLGriWAkO8xVYT5oeokmECOIga1DmoZ2bN+56dpm
         ZSXNlCbj3/Ozi+nOqiNUwdy0Cz+xCzIRMhkh1RfQIVuzYblh/H39BE55u1/GK5JS3fTS
         gjQQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776856059; x=1777460859; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnlkdH2rvme/FPOJLphqjiooJBuSDOHmxyaBSavupfM=;
        b=Zp+zDrvwytTHXgVYMz8+WJLH7t+wzdw6t5ROwAd9/XekCb+T2ZZeZLEyFnQ7YvxnX8
         L7dg3pBqja39TboL9Vy+2xNXFZ9G4hV2gfI2mLK2Mzh39zHCjW40gtcKP1eVYa2mjqgi
         Ml6o59sRZnIKnd+ZF6M18D5K++WdSbryJ7zlh0Vy/8KagG9CRLnhdxj/Pyc+OysRjRMm
         fLdOE6GqariT/Qw/q77nOYPXk44jawWe+eQVK5RXBnFdZDQMe7lhrt5uTtr9SbcwOG4N
         +Z/YtE443rmU/GBaHXGzdUPleH0sgvcMDepwrLDW1JXWblFUZTcm4tTmOpve3KXhrBzn
         6TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776856059; x=1777460859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnlkdH2rvme/FPOJLphqjiooJBuSDOHmxyaBSavupfM=;
        b=XugW2LA+1K16siTG+q5vEDVlOe12FYh7xIdG4tIyBkrVwAAIslRw7ufRiZpCe7i0zy
         UpTmzLsYkZ0B0xgv0DFjFPiZkhtbKZk3BZ8SpthajnVdiZg4aVDNrWPH2iujh4ZLLqqX
         WmHAiECw4oqXWooY060D0YAA9hRRe9tAb4yuua4km2ugJfKHmnI0hudET6gS06T6ZAQg
         Z26XlgR+m2dD1LkHYw+dXpJu1Ct5xlnxqBIOBI9wTBy2QujCvymnUPgoPFs4Lx2iA3LA
         3YZqFoAEdVOHUEptP8ADDRvs9tDg9k/9nJEjOxp9JtkFcgvDJk+DM3SSZIOm9POxb7VX
         0q1A==
X-Gm-Message-State: AOJu0Yz4gp9lrialFbDoFik2+lWyL0HXPv7AHkJKm7K+iQeC3tBj+5GV
	lYxKL3itlQuesF6OKiDmXi/d74gb2LFVWIzd6Y1xzv9myPWpr7cpDVIH4U5nvteWZgMO3pS7HgE
	KAR9Xh9Dov9HwpEgmajleIUM0ljtmN3k=
X-Gm-Gg: AeBDieuR2isTUAyLMsjNaUMPZFrS8FKNw5KWPUSLfvxjyl7phtupIGSRAuCc6Xp88AR
	CenuWaApyG2WfSGksz/4sHTfdyu9dHNOqanG2AyfPJh7OJwXzXMYB7waqGn3Zzmw6LDsg54oyxl
	s2I+EvI9YucIF26ZWbLykPtRNtrnY3pFy103Sd8+uHwW2o36f/udAiPnnaleXJ9af+P83G294N6
	iT9t9tF2YrdWHjeSWK04jWAiDxXVyoqKwPpK8h7oDNGXgqRWywp0QaCViGz5B13GxD5ZsL96t3D
	9L6iDK4HJ9Rkbpr2PiXwDlW2+/sV3NegE/ruU01jsqaAwAcBue3Y5xwvNoZPRVOY6XlbfnyEIsZ
	nmQiJ6BI=
X-Received: by 2002:a05:6512:3a8e:b0:5a4:10b5:624e with SMTP id
 2adb3069b0e04-5a4172da1e8mr7705872e87.24.1776856058446; Wed, 22 Apr 2026
 04:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260422103626.817-1-wangmy@fujitsu.com> <20260422103626.817-3-wangmy@fujitsu.com>
In-Reply-To: <20260422103626.817-3-wangmy@fujitsu.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 22 Apr 2026 08:07:26 -0300
X-Gm-Features: AQROBzBwEJw0W8SSJ9bGBtjM00ApUdA4nfxW_Bof80jpenINzyuO3xfqYY8YtkQ
Message-ID: <CAOMZO5CmWHY2NTa-CLpJMPMpAw6ntuGgXAx5Pb1RY5Eke5SZmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: upgrade 2026.01 -> 2026.04
To: wangmy@fujitsu.com, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 11:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235715

On Wed, Apr 22, 2026 at 7:36=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> CVE-2026-33243.patch
> removed since it's included 2026.04
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

I submitted the U-Boot upgrade on April 8th:

https://lists.openembedded.org/g/openembedded-core/message/234837

Not sure why it was not applied yet.

