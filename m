Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1563ACD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 12:16:01 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6159.1778674559687445449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 05:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=j3NGcJ6c;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7c2fa14795aso27263067b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778674559; cv=none;
        d=google.com; s=arc-20240605;
        b=C9Oty49+mRZHCvkIxwxn9tSGkxEPqjYjb/mxvwahXHff+6c0OicbPhZR33SPX9WIZZ
         0ZpVwcF6PfqqU/+MXxjs1Vt7496iUWazoi1w4tSkQFUPa6R/5YfUOsqVx6YotPkiJhCG
         gm7KnA3zPiwuGIGyGrGDa/kF4GnwwC3wTt+rzfrrmfGTEHq7BzhTpL+QIEBQW4K8oZ7e
         KiNWup7LCElZ+rJBWqn9Pvf5M6/bbzR/RfG3t8aHSXbPEqFl6CqjAALS9BCDUx5qdaVx
         V6trMEc/OBBQBT3HawHYW8kzvkoDpZA7l3vJTTITct/MYJUujvyRijYOVquMTj8pKqa5
         2E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ISv54XdLHqTSF5j0ExnAQuOjEVrvMUB9K0cpNHFiYpI=;
        fh=STxI6ZU+B4k4hQRbZNGJkI3s4uh7iqpTa+oS8bKJPVI=;
        b=ghg5KL1/Dx5xTdDhG7/Q3YyLwValsX4ToYhpitmOiGAKblIReVVN1YBsltBkL/+tu6
         I+oowJMxC2hiovJ9+dcM5o/GLYO7CMa8JI2Clc/synpHPEcYlWxvm3RmiXGh2HDL7iw7
         K10qu9kr5WkkdTYyTLdA9xg5u5Ypq9iy/xpz1e6/ZJFlczf3vh6c5fS6xOApYL2f9CkO
         DQnVZjCXNU4UYthkPc3T81DO8rvLVA6t6ywdSW7VAbhn+yh7nyCOJd5OR5iev3DWEXbh
         S3H5+7aGXYgBLTsBv7RABD6bfudrWnjJGqWu/cVN+sta/P/pL5NwrINJpiKmxW/5RYKy
         GUtw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778674559; x=1779279359; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ISv54XdLHqTSF5j0ExnAQuOjEVrvMUB9K0cpNHFiYpI=;
        b=j3NGcJ6cFho1O2jeWEDigtVAo3wtFn9Do9AMmHMpv0sQOLc1reMsMuA7EFSFdCXcEW
         gIjtZsnfOuzFtlYdm9Lg/VwYTMBndirmwGUwh2prwp99ViGWg3zv2uSYvSVl8KSD/bXN
         3XD7fEnnhjAyjebcDqWRWWupP6hBoeNNQwqweOdGRm9Wera1wSdcVeOhN/C8uaQ1HD5l
         L3P74RVM7BWnFNIhVNqqClmYP3qQucEGxZyB56mywE/dRKlxKW31hM7tQnYIdUFFtsEA
         loy5aBAaHNWKKghVXicfwYy+d0xhwVEsg1tzObqqkBI/ME6IOyji/4xIMkswRt7riSu8
         TGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674559; x=1779279359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISv54XdLHqTSF5j0ExnAQuOjEVrvMUB9K0cpNHFiYpI=;
        b=JPX/v0kmb0nsYOeMhYNQpoVd9xeHWEjSIdiQ5lVJd8fUqMsLWA9+l8tgtE3GfSRVWG
         RU88sSmEV+rrsWjhVtivfa3uFD+6k1pt60Q9m030ipocrTSOhm175Bvw+ywsbg5Fh3yc
         qldxuutAUNoN88HfHEUFV4xZ/LB1RbcOlzwmFdQhJmsmTDLTxTxxcJBh0aviTDzjwB1x
         AoSVevypNra1Js5nxkPHQDId2aTBcxii+yMJ8n+Nazy5cqg7JOul+5hJHh0hypp5VNaq
         DqnbqXOBp7X6BYfPtEyJN3TWe2b/IiVQETovt00qYMbkzWLkiE5fJERVQo/5DVGAWhnE
         VuDA==
X-Forwarded-Encrypted: i=1; AFNElJ+SBva1A08iyUqXGMcbXUvMGxgGv1pswuoswcpJbldHAPB5vIxt9DsCHKGvjm0OEBEY6OElnvk99gEHthQYZWwXVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLF3bjh3JVzbt4MN05FKJqE6hYIpqLRE6XcTLfewEzzyWymDuJ
	6XfS6lsjyzRSFmfEhi5g6cdeeQNgfGsaLrWLkj+2p/Tts/e48fywl1aFwWEnJ7SFEJXXk+0I9MD
	sRhLjFSPcsDt1eXeZ867sobeYtinb6TU=
X-Gm-Gg: Acq92OEqjVK704qq3EI+qiOm15CK2rQRbkTD87xLJyoQPbYZcaZLo1XBC3psYxCXOwH
	5QpRp1GOC1bEtBXU0n7cHMBFQCHsfNhclyA/TQc8J1IlhCl/yuKZmbqJwW1028Z+mViXED4AtP9
	n/Xck0C+FyC6zzw3XPstRVCi4ClqGz89FeT0zuWzwhwaOCESdSSOYfGxSB8dmiyE1AS56URQ6uS
	zADnkdVbUXRRNcddXxAsplbyBY2G2ob4eqlBT2EojgUPgpXl2he07DjBHKEvWk+IxSTVBAtVS93
	O0/hGgb3Irn4Upy0e3LMQUM4i6RIJ5Gq/x+hCCrvbQ==
X-Received: by 2002:a05:690c:e3cd:b0:79e:766d:81df with SMTP id
 00721157ae682-7c6dc4aeb9dmr24329447b3.33.1778674558571; Wed, 13 May 2026
 05:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260511133450.50595-1-tarun@centricular.com> <20260513071155.1215141-1-tarun@centricular.com>
 <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com>
 <885d89d6d131a5b1649189936537154f290e1dc6.camel@centricular.com>
 <CANNYZj8TutyAOc_Kz2+r02iDY8VQ_JaoGk5oHbrZSk5Er=UYBg@mail.gmail.com> <f30852d76ecd85f3f437f508ccbbb2591f410353.camel@centricular.com>
In-Reply-To: <f30852d76ecd85f3f437f508ccbbb2591f410353.camel@centricular.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 May 2026 14:15:47 +0200
X-Gm-Features: AVHnY4LXe4dcwXWQhpfkItZGzYCiYyQYC2xj6Ch8G6uBuYo-7iV6qqrAxIsdmPg
Message-ID: <CANNYZj9CND_HxCwiWUyt1Boej19_5Nnm76NXhZ+NtazYD-Zukw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: add new package
To: Nirbheek Chauhan <nirbheek@centricular.com>
Cc: tarun@centricular.com, openembedded-core@lists.openembedded.org, 
	sebastian@centricular.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236966

On Wed, 13 May 2026 at 14:03, Nirbheek Chauhan <nirbheek@centricular.com> wrote:

> Yes, this means each plugin has its own copy of gtk-rs, gstreamer-rs,
> and other common crates. The reasons for this are complicated:
>
> https://viruta.org/rust-stable-abi.html#rust_does_not_have_a_stable_abi
>
> If you see the librsvg recipe, it does the same thing. Tarun is going
> to change these git repo URLs to also use crates.io links in V3.

Are these copies listed in Cargo.toml of the plugins? If so, they
shouldn't be manually specified in SRC_URI, instead they should be in
the auto-generated gstreamer1.0-plugins-rs-crates.inc, and the build
process should be able find and use them.

There are concerns over discovering and fixing a critical security
issue in one of the components, when they are vendored into the source
tree this way, all because the compiler team can't settle on an ABI.
I'm sure you've seen that many times before. The issue is general to
rust (or node.js or any number of similar approaches to dependency
management) and not gstreamer-specific, but I still wanted to mention
it. The problem is, when it happens, it's the integrators that have to
deal with it, not the compiler writers and not the component writers.

Alex

