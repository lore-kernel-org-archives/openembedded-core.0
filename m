Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F3CE8FDB9
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 20:50:09 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.159672.1766782203925435349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Dec 2025 12:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJsKNGd6;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88888d80590so113454316d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766782203; x=1767387003; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7b2gjGKUgItLT418pKlu+0ruYhXnMiKlr+HU1SXEHU=;
        b=BJsKNGd6fzerjvc6sXDxMfCuv65GsWWxq+OMoPU5j/8iNMf683FeSbpq8aTM/uKOOo
         iq+hrqlUTZl+hQ+t8wy0BxZPV+tfLqm6LGjTcUN5jH6zYZkpmw+Hu+f28yPMbnG+X9Pu
         rrcTrsRLPiX9icjbHDI2dnko41Wi0RF39Z4gCsNjGdY0gP9FuQoOGMTg8TgqaKrbKE59
         wID2uPbQ5m/KTarnMnyN5KAMa/+wBRPr1OVt3Ru7OHoNDIDJ3FSjFDYJ+6gYe2tgl7Ip
         PSnQkiprlERJN/ZZUjwfhtJ/2/gQI2QZouG9imTmt25JzGu/2sZgn4qpnRHqND/rfGtj
         xejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766782203; x=1767387003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7b2gjGKUgItLT418pKlu+0ruYhXnMiKlr+HU1SXEHU=;
        b=RnsSfAkSoHxRrCjFx4V07YcbbpUHWDW3ue9M7WYCeI6kj63lOcwIqm0TTdP7yWaVUt
         P+Lhk+Y78mp5YGNBqJPXrro77lPf50Oc2Br3op9YtPOuGW2rYzfxssCE3jxePM/WQLxv
         dHVPZR5gqpBGxFSy0owBEPtDZL9lffgjWw4lVUttzSavbUDHy/JtVsNqdjaTXTlslcvI
         +sTobeeaZ/zuSa8FWzkOZaawaWh1Lk5jlaFJS7BHTGzhp+9VMQnNFVfi0eJthgoIYVWo
         tU+G0SnV5poKgvWm+8eWzWj/U+n/qYo0a0Y+nXrvEdU/7R1YHM9LfPcrCoIFqP2QueS7
         4K2g==
X-Gm-Message-State: AOJu0Yz2gGyK5z8U/ALZGndQZcm9FpE7mlggeATlD5Jp9IjAgplgb4H9
	Zd89vyYw7zUlYGY00inZr4uxFXDzKp+Ft/raEUaQzmKlTIj1w9XzTyZjZg+1SIJLlAjf46Kdary
	qrnfBcx3/Iz4YS8iRZAtXBtNnOuehhwo=
X-Gm-Gg: AY/fxX6DxXod1I3lanpX8K4VT4G84vKdkMddQyGjNdfZjWFTAZuy5ZTHPT7LKI+8+8o
	Z6TVm3i7Unt5/4SwYNNfcbFhyXIP2Xcpx22YdwQc8Yzhi6+qWwgGp7VDpTwhjaJoiliFnUTxM8W
	CdalDhnihZ4qUGSgCoRn3O233usOGpdlFA2IQ8tv2Gl/cb1OFPIPGJqdSXMKZjq7sMeGVTVl5Oh
	zQuAEaCiqSONHKUnYm40BCiyzeLo1yWErhx2WvXJusBz5KIenImtGA3vFAEcFIK30Qm2w==
X-Google-Smtp-Source: AGHT+IHDi8hZVUg//3AF5OqQJxkfe5WSL62/NXEUFdzpRs8EV7S1KmdzSHV/a778RxIwKT6Tgx8Vhz66diKwPg0ODfs=
X-Received: by 2002:a05:6214:224e:b0:88a:311f:14ad with SMTP id
 6a1803df08f44-88d858c4d98mr388996036d6.21.1766782202979; Fri, 26 Dec 2025
 12:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20251224150805.3312684-1-adrian.freihofer@siemens.com> <20251224150805.3312684-2-adrian.freihofer@siemens.com>
In-Reply-To: <20251224150805.3312684-2-adrian.freihofer@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Dec 2025 21:49:51 +0100
X-Gm-Features: AQt7F2r7cVgNUsNEGpz5_oCixFdzFb1OIU0_JvTeFbeH6iLLCoP4KOFbq1LIqyM
Message-ID: <CANNYZj_7grpudncVeo8g5RybFwGevoBR0Ab9Wnos1jsohCvUAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oe-setup-vscode: improve bitbake-setup compatibility
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 20:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228552

On Wed, 24 Dec 2025 at 16:08, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=siemens.com@lists.openembedded.org> wrote:
>  ws_builddir="$(echo "$BUILDDIR" | sed -e "s|$OEINIT|\${workspaceFolder}|g")"
> +bb_dir="$(dirname "$(which bitbake)" | sed 's|/bin$||')"

This assumes bitbake executable is in PATH, which may or may not be
true. I'd rather pass it in as an explicit command line parameter.

Alex

