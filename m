Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E32CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:21:53 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70572.1778574108853081104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 01:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nAk0P4Wy;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8ee9ec26edaso627083885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 01:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778574108; cv=none;
        d=google.com; s=arc-20240605;
        b=le0wTVKu1QApwTN4K1EYoMBx/qrYwLSKtaozpp1yUqk4Q7Mmg31XnSw2tF8Lahmvn5
         pZBImo1/L5jeCUDdpD4lOjSVFt8B8zE5MvC7guQZAu1W21R3Uvs3ypGSH4deOjqpqlqW
         2CJTlDz2K2YotoiKpblC1yjnUc4g3H8pYSB8YmObki1aMbiqXuzJez5QVkYUxKAK1OdH
         6THUASTNF+TjVGVP3EhuzRvE1xB3lbJSp1liJ5qEMeqdlxbvnLQ/x+UfUw3sJPlWAI4E
         eafyJIcfKOX8JuIr3ANZ565QG86bXEshSnFfZpzYYQQoDIQ7LGGD3+g4nj381yhLvj8e
         9GhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bRGXJ8KsSwuyD9Hor7NTpnGuKVjqPh5O2DuFYIWWOyo=;
        fh=6D08F4ViEPMn9fNUTnXxh/MfSY/OtXZrNXQvtB6wCB0=;
        b=VuhC+krevrW/R/lnt1miSt6ev0nQk8JSpXFFcstsCu6DWOcv6YiCEzgagpFpUMA/Nt
         0RCq6PjEmzvSInGy+3FQNdobof/yFIy9uLcfdGqGShPsPhcLfL8D4UWzJ8m6ySFhYpeQ
         O2uCxGfjY7I1dQNJXL7tepB3jvZpgcD6DYnFIN5cOwvtPmj78IFBWacPqAxf8P6wtaRU
         gvQmr+5P3xn+TqVpK1cLzQRXfuL6hGhb4sU+MAk7hb+CJ1q/PYsmVHOGilX8qd+pQr/s
         zGIRkmL+Ny7o/F3m06ArghgRhVgdsag7vJvv9Ywu8AiL3G17nv0x2wpGNrNmqVSeNZdN
         mV9A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778574108; x=1779178908; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bRGXJ8KsSwuyD9Hor7NTpnGuKVjqPh5O2DuFYIWWOyo=;
        b=nAk0P4WyaXyJk2KTYxeP2jelh29lWRRqfDpUX3e77WVdXSToUWZ95lf4WfsvULmLIu
         5GMuNi/4Jr7QWS0d5FhPMZNA+4/4/lD2n6ut4Re/RivaA13hqDmSBC+DY1VmNSgDxxl3
         Qod65cq1Us4anri5xg5xrvvxJwiyk6FM1uOQujTWczHd80E9d0McXJ8pun5NKXnx7QeD
         msI1VfoHOqJgfJJGOQqBktBFSH8CnUUwbqPoCmfbL8n0x9yfjM6W2+tbQWDIv+JcHzQB
         YODwQiZa820BtPIlrTjYpFTfT0cwm9NHUB3YGeBxVqa30hA/BPV/6y+LR3PrjyVqSsAb
         JvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574108; x=1779178908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRGXJ8KsSwuyD9Hor7NTpnGuKVjqPh5O2DuFYIWWOyo=;
        b=rouL5S+oDci4j7WbW1IV/GTDVb2FlPNaT2FDY+fsHCBXtIvpmIxB5hkTfACV/KPYFJ
         XMCF/YNzM7A7VePEGjwm84XB0FjMTsgFDoBY3SWDyk07tRSbk4aiXcVf/qwEcw0Z5z0E
         aSWzTRrZ974anOCgpQ2tRU8N7kWJ+0Ou4aVC8dVIoxJ2Ucbjm9NJ70/gfHpStMy8J3jE
         fjUvcd8gwtiRDBACpuVTUibHS8eMgBtTsUspfM9QETgJVsReajDl/IhW7MbFVKvppW3Q
         BhWiKaAeW3b473pLE4qDUA/EQtbWNTfzxFuKS9Tv65Ze1vyh2MacdX7oW23LLr3AO/6O
         +UJg==
X-Gm-Message-State: AOJu0YxmHE9g5gEbCl00XxCmE7mLvlUmJNyOc3HpRWGzEhIS/PEGdCTo
	IYJB6YbwPsDCD4pYmT2Ad/PniXVHkg3I951IZrdr6xKVGfExO8/mkXisAQyJAqmUpXfnGg3IEkq
	8l7S9cfnqPPeM9Vut6QcAzcOTwX2dtc0FNRwq
X-Gm-Gg: Acq92OGtR/uImsxqZwwf8UF4NCFxklT5Av6ng55UtzPObxYHSer35Heo2XUcu1Zg2MS
	vEzK4tcFX1aw362AVAa+RL50PUNXzcrLYEJ3RZrkMVWiRpivhDcb1HEXHvBRtH3vK6PBdj6WF9E
	n7OEHb1ZIFEK5SiG7yD4XkcF/sP6qN1myTN2MsKXWG9aYwK3rFHs7dOR89KqsxZF6GCOhB6Rqmr
	rg1XgjXW+w17fRCTKTNnEosl9BOKR61s1avJ/QqLnq23/dNQBe7TFyp8BqeLGIzevigUbhiMbho
	6Na8mYeyUT+d/k7iwa4Rz6MfWoib3pLjmNHWPmpLo+VbN0b9vc0W
X-Received: by 2002:a05:622a:2c7:b0:50e:6302:340b with SMTP id
 d75a77b69052e-514d2270321mr26309061cf.53.1778574107744; Tue, 12 May 2026
 01:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260512032614.2814369-1-Qi.Chen@windriver.com> <20260512032614.2814369-2-Qi.Chen@windriver.com>
In-Reply-To: <20260512032614.2814369-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 May 2026 10:21:35 +0200
X-Gm-Features: AVHnY4KdeRlwatmxSp9FNwSSUm5MGtzXQ5q8PScH_bK75FecqHldWr-WM5V8gJ8
Message-ID: <CANNYZj-0da2o5EuriBVvxGB9=+G_Gro98ZyW9BNzA=6ciPGPpQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V4 2/7] upstream-stable-release-point.bbclass:
 add bbclass for stable point upgrade
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 08:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236859

On Tue, 12 May 2026 at 05:26, <Qi.Chen@windriver.com> wrote:
> +STABLE_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
> +UPSTREAM_STABLE_RELEASE_REGEX = "${STABLE_VERSION_REGEX}\..+"

I think we can make this even more universal:

UPSTREAM_STABLE_RELEASE_REGEX ?= "${STABLE_VERSION_REGEX}.*"

E.g.
- use ?= so the variable can be overridden with a custom
recipe-specific expression (that still has STABLE_VERSION_REGEX in it)
- do not require that . separates the stable series and stable release
part (this will allow openssh to inherit the class)
- do not require that the stable release suffix is non-empty (this
will cover e.g. systemd when there are no stable maintenance releases
yet, e.g. if PV is at 261 but 261.1 is not yet out, then 261 will be
reported as latest stable release, which is more accurate than 'no
stable release was found')

Other than that, looks good.

Alex

