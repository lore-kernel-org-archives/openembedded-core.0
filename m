Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE06BC77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 23:11:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.4460.1685056298331856365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 16:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=OWElL1KR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso1549625e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685056296; x=1687648296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Ju6YkuWdL/2StvFW/dwNbEWU7ZIC6hT0feRwUHY5yU=;
        b=OWElL1KR3dFS9RoYrnZyexMgiKe+I4PgCI1YNkoTMlfvMihjLH0PrYyuhcGEoRhM+I
         91hifWEsnr6x9ZiS+LF1oKXtbpK490TR9thJkYBFnrsV87ZCNhma5GGagbx38is8RGkE
         ya5AhDb9OgV3LXml+Jyz/6MsLoWb+nU0m9Z4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685056296; x=1687648296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Ju6YkuWdL/2StvFW/dwNbEWU7ZIC6hT0feRwUHY5yU=;
        b=evQ9BT5OQOQMAmYCW/laMUVs6yvf4xh8ZqBJD/FltCsNIZ6UrvW5BNPrZK/IiNd/uN
         z50uA/UcAB46058w4Yq4eqbxN0V6EjkIzq38XAbZy9eZU9wClUGvuHOfbZFZ7j2mHszE
         n8m45BkF7ztDyf1MVOD8QFqU5m81gAQQdfE4WI2RvLKa73o2zPnS39IuJ9s9CW5bFyGl
         +CBmJ4gwD4xCrqSduMg18xtqa7Mjjjue56hTALHFRFeloO6p12927BHge64IqJ1a/7nO
         g2R5wluLikW+7bBDmY96BEdEYLJMijT+wKV3ojr0rNjESptWy2ue79fEZYgcDw0IT5+P
         fJhQ==
X-Gm-Message-State: AC+VfDzArJIDpcMLg4te4mathkRcyJ4uZI8YivCJgl6hc0S0Fq3jhFJD
	7PT5olRQkZw1fwWakAp2TnqrpA==
X-Google-Smtp-Source: ACHHUZ4fEx8G6jG2WSNpNJcqxsmtJSY8BWxU2qofpVYuWJJXR4Bj70dnUT9tP0zh/nn7319jv+Iy2w==
X-Received: by 2002:a7b:c3cd:0:b0:3f6:3bb:5129 with SMTP id t13-20020a7bc3cd000000b003f603bb5129mr63434wmj.23.1685056296491;
        Thu, 25 May 2023 16:11:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef? ([2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef])
        by smtp.gmail.com with ESMTPSA id n14-20020a1c720e000000b003f4b6bcbd8bsm3404591wmc.31.2023.05.25.16.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 16:11:36 -0700 (PDT)
Message-ID: <28102ff8beb52d22585d6e2b8567baac767f4e02.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/8] Remove usage of /var/volatile/tmp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
	 <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Markus Volk
	 <f_l_k@t-online.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 26 May 2023 00:11:35 +0100
In-Reply-To: <176283740A534785.15391@lists.openembedded.org>
References: <20230522172503.1651374-1-alex@linutronix.de>
	 <20230522172503.1651374-5-alex@linutronix.de>
	 <CBE8C9FE-27D0-437F-8CCF-5F13C0DBFE3B@arm.com>
	 <CANNYZj9V73Dd0hTquGLNn1W_A0oDF52eMQE124D5UWZWMF_zDg@mail.gmail.com>
	 <176283740A534785.15391@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 23:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181728

On Thu, 2023-05-25 at 23:29 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2023-05-23 at 11:04 +0200, Alexander Kanavin wrote:
> > Nothing depends on this patch and it can be dropped for testing or
> > merging. I pulled it in because otherwise glib update to 2.76 would
> > start failing its ptest, but I see that glib update landed in master
> > but this patch did not. Not sure how that happened, are ptests passing
> > as of current master?
>=20
> Interestingly it looks like switching to gcc 13 triggers the glib ptest
> warnings. Not sure why, it is probably the last issue we have with core
> before merging gcc 13 though.

We can fix the tests with:

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-c=
ore/glib-2.0/glib-2.0/run-ptest
index c476d67310d..831bc3b91f1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -6,5 +6,5 @@ if id -u glib2-test; then
 fi
 useradd glib2-test
 cd /tmp
-su glib2-test -c 'gnome-desktop-testing-runner glib'
+su glib2-test -c 'G_TEST_TMPDIR=3D`readlink -f /tmp` gnome-desktop-testing=
-runner glib'
 userdel glib2-test


Cheers,

Richard


