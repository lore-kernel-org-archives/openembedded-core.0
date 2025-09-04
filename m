Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE4BCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:42:19 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.36108.1756982532010427710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XiJkE2wM;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7211b09f639so9658456d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756982531; x=1757587331; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O2c6GDVTIL6sWfoLBVJVvfsz2AU2tdlIpAJMDcHDpy4=;
        b=XiJkE2wMe4cGZ11fk3TwRHsm3NXtTC/oX0vOOZZN6bZ2MjnkfXlxtsNW2IfJq/qEEz
         ZXzdtPCjs5Q7e88Xcdzoov+f/5QbNjwETK7gUNP/58Sk3s5Iw7y/ZzZTYyUIbr4t1BXm
         KxMMRqaVwJgUbqEyjMfrBf10nyg+F/eudcryPpc7fOEPTwqXtRbnGU+T7rQG5CALmzVy
         OcKFFcJEK9purzIo93L8MEQp5WlUuLWyerRI4LFmP/tJksSpOyV4QEzp1gQjV0+eMJc4
         kSh2x+jxEseWdS91VwLIb3vlK0sf6q0brtTNkUhRvJmgWIKQzWF3wS5AHdAOtsVQAneO
         ANuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756982531; x=1757587331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2c6GDVTIL6sWfoLBVJVvfsz2AU2tdlIpAJMDcHDpy4=;
        b=svm5XQk7bBfHOkaS6xDS7Vz0Wmp4n9/O3tH9ahkd1gNwvMFRisxEg6/dnaKOPKYVL3
         XIQQ6iB2otDQ+Z87oZzDq8NiaVHuNbTiB206oR1GuIIqQwTCaioF4wc5AXuJnI+5XTzz
         qb0PDV3CSLK1UeOxsavanhDr21rkC2rDpIPLXnc+cgh3szXMgoOOHH7ZcTBy12MC8Ifj
         aUmV62BbdkyPofO53PVvk0MK70VgA2qE7OhM7s7UYwkUShF0Pzks43zdu/ENks+fJMDK
         q3VMu/MC3cmvRaUVCAaggF/55z2+leqsfhj4y6jU5MdYelKm/dYLy29Y9cpN5cB6Leyv
         k9lw==
X-Forwarded-Encrypted: i=1; AJvYcCV9+JbLQeV0Iy7taELUKaEUXVuAJSEimoviRBgONpsiqIF+mNNfOFro+4YY+yOYO4IO6d3iNS9tsEtYMHLi+Mx18A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkNnL87GcNMghzEF8/YVD4tZkGPvirZbtA+fNmcKOKL8dFpqbu
	tXw2yGGF7nCw43davuYTMVvnD8z5vzXagaQuyfChDnVE5TmsxwOTanQyu5dI7WdYah439Ugl7gT
	eADU4MKj7UNkrMlHwN1+iuSefgVb3Qjw=
X-Gm-Gg: ASbGncuVeqQ7838h3c71s5SveWbO0WreOaOpXHCFd1geNlC9RcLmby8Qht9brCR+MEt
	ETakjy+IKBR6PHuR8w7SJFunyamcEcIoqG3i+/mvt/L3ylIXtVPDnUVyqfzrPNV3JJIq2NKPXbw
	Ozi9TmhxWxqBg784t50yEmSvYUPnZAuBWkbcSq8gB1jM4PYSJ9QZ1dsnJod0HX00NStmqcBr9ii
	mnhUpiZOtogMoPU/RrJd2gPo9OENYPoLpO/mdkB68MJmVpob9mfNSXcxLsPEYI9ZAmQ+Iz5CmnK
	XaznddIZXv40GihVAOurcF8l2fJJRbucbifE/vWiAkW/XnUF/MZO4xPiQ1NySA==
X-Google-Smtp-Source: AGHT+IGk5m22sgRaU+ezxuFzUIk8JutfFhGgg7Ux271V10rA01w+ozmnp7ceIbLaxLrxd8oulhZJwCWDlUsHsSWi33M=
X-Received: by 2002:a05:6214:dc7:b0:721:f9f9:f90b with SMTP id
 6a1803df08f44-721fa09436fmr89312736d6.5.1756982530918; Thu, 04 Sep 2025
 03:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250904051239.796948-1-raj.khem@gmail.com> <20250904051239.796948-2-raj.khem@gmail.com>
 <18620E3A795B18EF.28859@lists.openembedded.org>
In-Reply-To: <18620E3A795B18EF.28859@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Sep 2025 12:41:59 +0200
X-Gm-Features: Ac12FXy134M4J3nUZSp7GMLee-K5mZ2Wf1LDm-7Xz6o6KeSi6mtOW9hqnT5T_mE
Message-ID: <CANNYZj-msmmZEGsynGSmYPJC2hfj0fbhyU6Hcs_RweArq8JHUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] kexec-tools: Fix build with LLD linker
To: alex.kanavin@gmail.com
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222916

On Thu, 4 Sept 2025 at 12:40, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > +Upstream-Status: Pending
>
> Please no new pending patches without a good reason.

v2 fixes this, it would help to reply to v1 saying that.

Alex

