Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE82C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:44:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25350.1787672661704075762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 08:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=17aWBqdh;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2541707f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787672660; x=1788277460; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NivpddMWGaLTsFrUWtn9WL0iZcduZgHZ85xUg3adxXo=;
        b=17aWBqdhd7ao2MSAzmciuK7hOIv5c6vheR8ZFQPH1mNAw4oPOIZoBPhOwLvYp+XMpr
         miChoDSsLiCcBMjoZ89ebb9u6/q8vtDch/k8DO6VqtfM527ZAIpIsbZ4TJ+qnrvxnhTK
         DzngcTWichULhAgxr7JoAIaTqKOqJOBfemDV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672660; x=1788277460;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NivpddMWGaLTsFrUWtn9WL0iZcduZgHZ85xUg3adxXo=;
        b=C4PdVVbkaMvRxxGDUaodSLke1q0Br2NQBlIUDk6AS7+CopzpuL0tGYsiI6hhteSX9Z
         DHfRQr6U+SVycJLfRlD1AtIczAGm3ePRb/bIixiahRxOoi+/+xkRzomz3DzPnHnlLtx8
         wEwwo0NdzCwVXg+0Lxk229IXTDYVNcXVC/1BGt0CYxwF18O84Qr5qXFFFyzBj+7n6XEu
         Ro/TgaMsvhtKQH7/AVlOD3VVg2aZEQNQaaiBPPqmYIQBPHw2EXtkcj7xfJ2NJa6UPhWu
         kkybRiMFTxivGXA6C0K/Bpg3vSizDFmcd6eO+vEr9BlDpX6Jqnme3IKPYg2PCeMncU1y
         Hkjw==
X-Forwarded-Encrypted: i=1; AHgh+RoWcK/aWjiMWqEJBl54DtlDszJFSMk44GmGFOiS9ot6XDW47YSUBvFlQdgxgTS2XTZUKqE4+4vN1V6xkna/BdCmdQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++m1R9FY7x5+ZDa3IFMYF++jV4EXI/esZyZeKpy4oUHN/m+v+U7i
	fRzg1hrM/R0MJKsCjWnNAlQcJ/wTUEoWNnW6FmC8hDCAeEzUdvYuQ/H1XTSc7N2I89s=
X-Gm-Gg: AR+sD11y3NVLPkXX4nKVDjwYRGIYDHCfEAc1WTUZbPVvGV2Xjbh8oRbaS8ZK5G/38ay
	Q7wBA2Gq2psRRDxgs0j4qoy5A1qcw9LWhcCls7NE9Zh6FqPxbdwTNwA6JV3G3om+Jb/oe7PeIMf
	v1V5u2i2v6ZAM704q6g1U/yN11pkRYlLn/hq69CR0zuiHylVU5rVrikBFQNXgpzIhJilJcwel7B
	nedWoLwSmNGJcWZglBHcm8mPfGhgcxJWFC8Q5WngH4A/Fn43NkTP44hsSYVbs/sHycQxyHaWxmZ
	IpFX3ZfIV8HFTWF2HohCo63MwDP4jUYA8OgJvMvsENdLqIxqVAaAVvJc7JHv2t65uH49XonVyyj
	2A0xxDums+351liOX0c0LJxneavrppawxPrgywGkTXGYArQNdefNU7KlD5GlIj4kAHwaIho3xLZ
	ccH1D4VDIvyqeF3cpx0nENYiL/lY2c3j9CQUXqDqPYQQryWxt0M7kH0aJ3392NOz+AV4+ObiCdQ
	nHl18CGmqddxCfL8k+XtHj5qQPlb0QOp+zVlVX3+sHrOC2SdQfkfvRHP88=
X-Received: by 2002:a05:6000:702:b0:47f:5369:bba with SMTP id ffacd0b85a97d-482e26bfca7mr61265f8f.15.1787672659917;
        Tue, 25 Aug 2026 08:44:19 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b78e07sm11882771f8f.9.2026.08.25.08.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:44:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 17:44:19 +0200
Message-Id: <DKY52I8FGN8J.2H64IXFQ1XRPU@smile.fr>
To: "Amaury Couderc" <amaury.couderc@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3][scarthgap] python3: fix CVE-2026-7210
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260706132712.51931-1-amaury.couderc@est.tech>
 <DK2VN8KB0RQM.2Q9LKRBCIRRGZ@smile.fr> <DKXW4CIOR10C.2WL3O0DP768DB@smile.fr>
 <AMBP189MB319674C0B7921A10AB796FAFF8AF2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AMBP189MB319674C0B7921A10AB796FAFF8AF2@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 15:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244248

On Tue Aug 25, 2026 at 4:13 PM CEST, Amaury Couderc wrote:
> Hi Yoann,
>
> Thanks for the reminder, I believe I sent a v4 of this patch here
> https://lists.openembedded.org/g/openembedded-core/message/242445
>
> Later on this patch has been merged in scarthgap the 18th of august:
> https://github.com/openembedded/openembedded-core/blob/scarthgap/meta/rec=
ipes-devtools/python/python3/CVE-2026-7210.patch
>
> Here are the changes to v4:
>
> [yocto: Use weak symbol detection for XML_SetHashSalt16Bytes instead of
> XML_COMBINED_VERSION >=3D 20800, since our backported expat 2.6.4 provide=
s
> the function but does not bump the version macros.]
>
> Let me know if you need further input from my side ,
>
> Kind Regards,
>
> Amaury

Nope, thanks!
The patchwork data needed an update, its done now.

Regards,
--=20
Yoann Congal
Smile ECS


