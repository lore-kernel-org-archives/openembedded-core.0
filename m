Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB40BCD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:34:18 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33394.1779359657568929961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pDYtY4ki;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9125284a8ecso689427585a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 03:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779359656; cv=none;
        d=google.com; s=arc-20240605;
        b=NulCPViG0wb1it+w8oqnzd8XXKEgn7z1N/0zZvhbPeTzw+TDke+URVefn701Dsh0Nl
         mT6/UQFiKmrSOP1/g9l6Uw1zF/PlhfjiyynwQTPnC1XuTuja8F7KDAr5YLovPlaJZfyr
         4Hoh+VuCDE99Ekf29B7ImvVOFcbVP5iJnah/XG+ywgT+BXDAuW4pzY52SoPTC+MdtIwE
         PjllSqoRyqPd39i4rnw4GWUXsQSQQizb4BWr9fqjcuYqniqvYJ8CKCSGTtQyHM9Nu3w2
         r6+1xxJvrs4gTndtiGj6oDZa3Y6pKqozzGJaY3FpHCBk/tYMl7khr+BEvNbYm35OydWy
         L7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XNYOSGgUJ/6FxZ2ih+20owvSB28I7wIWyd+JkzDxoPE=;
        fh=ewRA8nFUVELd8y4LP29c+gI2IAa2uP29XqVRWFrcvd0=;
        b=FBXki1uWtu0OW92aJuyLlzdN5p3M9xaiUP/c+ZvYbfN5COZAa4YdwmY8XI/tQgsOA6
         9ZMYiBoIUAEnaR6uMWNuSzvYq8v2Ddrmlmk3quRTsOpTBOC3mO08eQYYp5NEFCfbxEZj
         5SF2kjQN72UOVDQw7fQTMuuB6FKOM/dGS/VHlyoYi4kigPiC9+B/4VtDHGYMZeKvEDuJ
         o9NmsLrGNpnMyVyEPwvmkCnS8W8ohsJbh297g7uiQoz0HcJpLbbbWuyuGhG6UvauygyX
         wDl7X2DKRCdr3LRTlSwv+kjAHKy70O5ZvUdqaQMIKUogHGLsr3uu3Te7AV7zrMvDkQ7g
         X0qw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779359656; x=1779964456; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XNYOSGgUJ/6FxZ2ih+20owvSB28I7wIWyd+JkzDxoPE=;
        b=pDYtY4kiHz6Ytxb9vueTf2NRkxTU4Cn/wq7c+9CLARvj6xUZA65/sX6VY4GfMvKK2Y
         gTKNYE0ZKWRF726gxV3SyKG6MepCe9ABthRaTUCzl3uv56GIhL0PujndEWt5M4hdVf2+
         bEC1JygeeJuEiW8t6GnPIfhfuz+Fjse4cVGka1IM43rAm98xfQ17oxc3Hm1Y5W7M4OSY
         t5lOS9Nj1bH2Bhkuo5YuRRrMYooehw7ktZLP3TS4HNo9XhZwOPq9uUCtkZTZkOHoXxpI
         HIJleQJFEFMFwO5Yl572cOc9K++iKjBGUyjacwsqwShgkixG2UrvVBukhpMv57SliDUX
         mM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779359656; x=1779964456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNYOSGgUJ/6FxZ2ih+20owvSB28I7wIWyd+JkzDxoPE=;
        b=NNb3gL9NVqgBE0/RR56z3hI2pjT+CiaHl9LwxYY0ena/GHVSnRruMn1l9KJNQ3i78Y
         dCdw/CfOwduwo2N7IbTU6RmRK49PprJGg3FHBVKIBQWjRFIrst7Rh9UlHXuLPPF5sLdd
         5rr+CjL7uynC+eKx0ohfG1oYoexrYf61gcKgSJoFaFoF2TN0aW8MErpEgBRsQpg2ylXd
         V6XCcUmL7Rp0FT4s2ej99+ewgEd3L93+Da5sOQWziGHv3/XWRvIXthIwBwq+W1rhiRQE
         ZSkjnpc6fdMzsbnWHmNwUujwTCwti1Bi4QDyE5Ir45VMHoCAbGQuulg1oqJHkxF896C9
         9CDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GEys8OBMUOj+ENDn0p8YRHbm0A6V35855FHp04e8wVcrnh7aOFRB86RzmfKL5v0Lm8qIVM+UWDm51qxef36QqjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzR9T7K9GAu4GE1MN3v0L/w0yvBZi1ytzzF/crlEDYvqa8tOK09
	CfkISuOXTGIhbX1xZGc8cA7237efMG1wiDJLg+sB788OT6MpuDyNZG2NDGAQQEwqT4vnX6gIn61
	IaBauggPvLIRIF4iWlKd4a6SmkylXEB4=
X-Gm-Gg: Acq92OG+OT767a9R5e0NxMW1/qKK9GJNJyKplcalRT6gKPgxyB/TH5J+NO7Z+d1TgrU
	F97OeEBNGL68cQRZ3KUL5HW4CeXnzEMWvjfcUAzCv4GfsaITKxBCFAi/cM2kiHtgj+SzsZjVKbr
	gafvCoI9LBco1oxND1G5zbdL2flgzBLS4hbVOqEpNog0DbXgi1ArLB7SBev25GZvj8zNVC9cpoK
	a43vW4EKMS4LZo2ISA690lD2/81zIF7tfFkeVV4H4BfWWs4wh+y0CPkZ35QhRN2h6P9UCKElDk2
	tl4rQ/bAexsQdTg1Esm5jOREikJ0o5oT6CTEZeTBIw==
X-Received: by 2002:a05:622a:4a8b:b0:50d:7f66:dca with SMTP id
 d75a77b69052e-516c559259cmr28375171cf.33.1779359656574; Thu, 21 May 2026
 03:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260519090517.1201609-1-alexander.sverdlin@siemens.com> <484fb04a4b512d8456d42720ad89a8bbe8d85b20.camel@pbarker.dev>
In-Reply-To: <484fb04a4b512d8456d42720ad89a8bbe8d85b20.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 May 2026 12:34:05 +0200
X-Gm-Features: AVHnY4I4O2_w4wLHOq-cdEdgLwH1X4gsmFcJNA05E1mUD9frmOiU_aW81MRl40M
Message-ID: <CANNYZj9DKnVpJWmq13MJV2XJvUcRSqyvBgqdr1opaRoQ2tgTGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] initramfs-framework: replace eval-based
 bootparam parser
To: paul@pbarker.dev
Cc: "A. Sverdlin" <alexander.sverdlin@siemens.com>, 
	openembedded-core@lists.openembedded.org, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237502

On Thu, 21 May 2026 at 12:25, Paul Barker via lists.openembedded.org
<paul=pbarker.dev@lists.openembedded.org> wrote:

> The main issue here is that this replaces comprehensible code with
> incomprehensible line noise, reducing maintainability. If you want to
> remove eval calls from this script, it needs to be done in a different
> way.

It's not exactly relevant, but I've always wondered why regex
expressions are ultra-terse to the point of inscrutability. Has anyone
ever came up with a way to write regular expression in human-readable
form? I'd be curious to see how that looks like.

If you need to understand or formulate a regex, this site is a
life-saver: https://regex101.com/

I agree with Paul's point otherwise.

Alex

