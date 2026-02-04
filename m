Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FDEE95374
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 10:10:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17122.1770199827314835233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 02:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dbhF8AMg;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483100e97d8so3461735e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770199826; x=1770804626; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOLyWhcbC1qfk3vwbz4Pb+ln/X9CCtF3BZWrJRecwmw=;
        b=dbhF8AMgswozavpTPAEKU19NGGNWo8l01o+e0tT6ZXv4vC8Q4bPSxrmruHeLRUoRcr
         ciLfwqJJm4YGYVd2GbJUN+mO0Zd+8skk9bhdkiWUdjWOAwp57FoDOYufa84gY0IRjhSl
         LniZvx6ZtRUYxK78Lh01zD2LUzr+I6Zb9Ti/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770199826; x=1770804626;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOLyWhcbC1qfk3vwbz4Pb+ln/X9CCtF3BZWrJRecwmw=;
        b=sPrG30s0P8K5OIc2i0Q0yZk9bPA9tGx71+SbXt65xM2rjKUhgEWpkaIHxI1/vY0q4a
         3T40B8bofXziX5Z6HHlNgVeqt5IIPPZDibclXqEtf2zirwg9kfsQG4VqMnZXCLQdP1/t
         DSeAEDsYOcNyvBhUZlD7mWHnYicswOhP+NJ7ymOW7R7/W6+CaKZYXUyOvhaAK7tN/+0a
         eVi8kBWg7NkVeVSWcfKepg8W8UTmj9EuELZmGgl+LcSCOGXsjoHh1unyzmOTYBg+Vg25
         5YCoARyj0hZvk4El+y/1JB8qUCWq7H+DudH4RxvKg2Zbzx08ki3PVdgaekcdLI47px4F
         ZFsA==
X-Forwarded-Encrypted: i=1; AJvYcCVVN1Rb4M6doio1bZ9M6E0+ODPu5pARNaJxIza7xXYuw4y/u2y8AhgF2tH6Ya/HLvxGzJQtuVpvTCd15tWMHL3yEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzId3SaxHi6sAgAstC161VWhy6k9nghxyixJCuXVEpoPpqaSuQt
	At05KS7TaAAFCqEJYbOVSDlfBi6tvOJrDZlWEu5nZMaqnBGGup0CwvXHc3wW6DkmHO8=
X-Gm-Gg: AZuq6aJ+LQcEMx45/n4Dc65j9G/9Z2FcqIrqZdD3sG9aaUtD58t5Dc7EWiAutYojUnX
	EpUSo+9nX14yH3ti6QiX80KtlszBI35b1xOtqsQqZ6k2l7b9FDVHDo76BTYWQ22ip47CluT1xYv
	V69OgXqUpZPq12PYWeIbpe4BGrQhO6R2RF4YhCjnbyz/F3qw4mVOtzhfSZ0PrPv0xM9kvH7AyLP
	CW+5X2t1Ijw07qsHSWom+eHiUbarXQ44rF1uoCkSWYV2uCtFTLgAgxzQvNuNLlZNFFCcavbakUM
	4qEuDnPmHUL0dNmSx72uH/3eCCC9BO9cl/G2akHLVEzf3OAFOpW3yr7xTroQjPTd7Y2URMNUeMr
	1vuET0Z0GXB+yZDA8f1VoH30h/W5j0xQC7xjuhRgWRxxJjNWeFCBVlXS7BLvteHfl7pGuZvd4pv
	hUPOm5CTZRM97PQDwGQs6DdRzMWruegFm+bPtVFy9Tk1xztEWxvKhCfYryLhRu4F40Zp+YxFwU7
	Zh3rVGvFn41PQ==
X-Received: by 2002:a05:600c:4e0f:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-4830e98f6fbmr29950595e9.35.1770199825568;
        Wed, 04 Feb 2026 02:10:25 -0800 (PST)
Received: from localhost (2a01cb001331aa0002b8d20d4b496413.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2b8:d20d:4b49:6413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec4fe2fsm16272765e9.3.2026.02.04.02.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 02:10:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 11:10:24 +0100
Message-Id: <DG63GSU9MVS3.304EAXA47JAF9@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260110224453.395105-1-peter.marko@siemens.com>
In-Reply-To: <20260110224453.395105-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 10:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230507

On Sat Jan 10, 2026 at 11:44 PM CET, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Handles CVE-2025-68973.
>
> Refresh patches.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-support/gnupg/gnupg/relocate.patch    | 14 +++++++-------
>  .../gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}       |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb} (=
97%)

Hello,

I've tested that on autobuilder but got an error in oe-selftest-debian:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3138
  ERROR: autoconf-native-2.72e-r0 do_recipe_qa: GPG exited with code 2: gpg=
: signing failed: Corrupted protection
  gpg: signing failed: Corrupted protection
  ERROR: patch-native-2.7.6-r0 do_recipe_qa: GPG exited with code 2: gpg: s=
igning failed: Corrupted protection
  gpg: signing failed: Corrupted protection

I've started a build with this gnupg upgrade reverted to confirm that
this is indeed the cause:=20
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/3142

Can you look at this?
Thanks!

Regards,

--=20
Yoann Congal
Smile ECS


