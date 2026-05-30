Return-Path: <toertel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E54CD5BD0
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 08:49:09 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2978.1780130941149346903
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 01:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VWsIr7g9;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: toertel@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cce8873b56so13605616d6.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 01:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780130940; cv=none;
        d=google.com; s=arc-20240605;
        b=HLeZh33GpE8yLttegdqDbEuLtwi+gT0tSDCkoQQs5RdgQd32PfloZ7vzlF3JELoQsW
         MX5hg9IUzb7iDOslkrwqxJJ6zI0i/2BO50zTAyIrZopg0V+gvGqFMbW+xC3Omqzz9Zgw
         Y3aSYKpLwn0EzIQZ3a3CPXKjOO3jOnYWValVo4Vo6A/EZE89U1YLxznajUFmkTfzZMMd
         2cm8zILUdBmFI4+nKv1QkYWT/Rc7kWe5CSjQjp92+6rPzdEkhIZG4Tvtast/NKdVG8Iy
         Rme67mQ1RVHAgTC2PfFAyXlb4RPMqtpMnml9cMmTUiK7LOTtSBALG5tqZXpqbO4AXYM6
         UOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ahm8Oasmbrwyfu1yuY22Mekpizj8hLOGPY5qYU7zNsA=;
        fh=4yOe2IOIG25Y6VSJZ/qHYYEbRjGhwkQSOD2pekspnSQ=;
        b=LocVnBnUv0+RrRSaLnCjKHvKDP5gqvbv1bHTGyYIvvMc575ylb2BYKMCF3i+8eQ130
         qz7EtHhj7ri8wfhsTYf5g7MCJWMt1b1O4V0XbwrkIcEysE8rP0TvdjGupvdWqO6Ls2Sv
         rpdh120uWfYXgT4p/ZlzLJGIqqxSMxLgUP9Vn95EBewIMXte1AU95zAodev+OGihfdZP
         d1BaSxNm9hNKx77VICbX8++QLUlXMl2Zu2WxqYjCh9lhteXG0ahdcykPDlnL3L7sowBH
         dXRWFb9ZPIajc5ij+f7HMCQ/6N7g1tJiZk7fdxAXM5hPoXjCW8KbEQ/cey5//uSTLk0E
         HLqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780130940; x=1780735740; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ahm8Oasmbrwyfu1yuY22Mekpizj8hLOGPY5qYU7zNsA=;
        b=VWsIr7g9JSI6rKJ2NL/kY0f20H9ae6PpV+ltR2cvhzo5vM/XlLHbvxovxNGpuOJjIV
         Bz+N1SZYa+MVShxkPODv9raowTjqnb/hTfYZ1BTAY2RSlOSy20K2W0GUfw3vlZWVxAFx
         +BgbQpN22vD+0Sb8sACDOmT8xizS0x2+/unAod+g/j3+agUt8n4knmKSaYxWYvuwwfTu
         BqW3ph5VUSc0F85YgDepn8lJdS3E9t/GKzHzU4dvA6qMGHojqpQ8w52DXFcAGwRCTHJ9
         w/pH8YklMnRyVDnK8fKS4XDZUeO3h7zWM1EhDmQGrpqM5/QcGw/um3PNUXRsdVI1bcoO
         XmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780130940; x=1780735740;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahm8Oasmbrwyfu1yuY22Mekpizj8hLOGPY5qYU7zNsA=;
        b=YX3OLc9V/jFVrQP/FFQgDVhaf1Xr2GKl9iJnD7dJzMY18SiK8mNsW0NTVK3dP+OgT7
         NieyM0ByzbnnYR73eLJpsBOQYwgec9MM1xdIMwr9Pp7vz98048EYOp6FZuGh35f4OemJ
         M2YZSM21yoLZILOpKpWH9djHdsoG1vLdEpQabpcS4mc3Tph4ZAkgYxUPYCmYZucM/Lsc
         /rBaoAC43PcAFQni9mVjCu9bP3+aWo+NzVkBjme0hUS5T+Oqq2YKCW4/xN+CZwM4C6Rr
         DZ/R7S8wOmlmRF4aik4a/jQQXfuYqYVnRGJZD/pvaPaqU3FvEesPp9IRuOT6psuNVA23
         1gOQ==
X-Gm-Message-State: AOJu0YyxCEeMSwGNqzmqonVlyfUdqzaAlCu5AQBW022bkMbmIiAI94Qx
	rnwoHA8M/eS2J+kxDwwUi+cZkcMD3k+EBl5bYh5rniO2WDneK0McQi7+RUkTMjHyCU4N0ON2nHB
	xuMGCfVtiImNXdT2ZNez3F3hP7VWRAH0Zd/8c
X-Gm-Gg: Acq92OGahPZaRydoDDcEhdt0vcOQC34tNgV7+TTwz5+kRxT/BHu5m4Al0xIqsSCdVVT
	c1+L5VNQz714NlSkc+wXbHi1EUjShBF+9uHkXn0vLzTDTW8bHYyG2nCTH/0kVPeNZjktgc2us7c
	pvJdV9eA7f+7icgzp5PZrq0wDTT2unLKkzYklgpK+uHwL5gCCwGHDilplpquh2SIVgWvwkUmoEk
	zhKaxvOmdLTA/aOcHYTs0jPQOo0tm/oxsPp2ipwYIaAbw7vlI8IvAa5E9oZr+0S3ZNjXbUHRFhM
	a0tFWVsvPQGSO5sEsPcXuGS3+ksD0xTMyxIm2TFmTbdNjn+UXQ==
X-Received: by 2002:a05:6214:2dca:b0:8ac:a91c:c8d with SMTP id
 6a1803df08f44-8ccf035362fmr38017036d6.14.1780130940162; Sat, 30 May 2026
 01:49:00 -0700 (PDT)
MIME-Version: 1.0
From: Mark Jonas <toertel@gmail.com>
Date: Sat, 30 May 2026 10:48:49 +0200
X-Gm-Features: AVHnY4I_zezodguoIo9uA1Qjf3gWWKY0j1SKJ17zjkWy8EYN1w_jrk_afiUfYl4
Message-ID: <CAEE5dN3wn0du6EP-dcMOwjZAqLkfWnw9Um6JvyObeNQNgjssiA@mail.gmail.com>
Subject: [wrynose] Backport request: libsdl2: Fix compilation error with DirectFB
To: Yoann Congal <yoann.congal@smile.fr>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 08:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237774

Hi Yoann,

I kindly ask for backporting of 7b989a6 "libsdl2: Fix compilation
error with DirectFB" from master to wrynose.

The commit fixes a compilation error when using libsdl2 in combination
with DirectFB.

Thank you,
Mark

