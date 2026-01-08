Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C42CF6AB9
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:50:01 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3296.1767865791391554002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VyCw0bNA;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee158187aaso31135001cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 01:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767865790; x=1768470590; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2OXKDVd/eqV+dxKTVTLpTcKPaIrmdmBllxVeUSuatEk=;
        b=VyCw0bNAqb53uANt4y/PqztUEbGUvpBoO3k3w/qnw4QbAVSArChbiy36eLC+bjIvFU
         MG67IagV14Cae5Q0ybDb0fNiEqFKfbSwRRj36KdPAZesZqlPGgX+S2FBXeQf49Wp4PVq
         JKRegnCjOcaJg0T+8ezI+azREbeXCjRwok7dPTIXgCOtZmenG2ujsw9Gy6MBg/oXsZTO
         UiVU8lY5I0nZICyCXiGF3DlaPhPDULJiRtDepiliWvrw6BjTNOJQZUB1qCiRJX1vENID
         Rm/iZJgAtJkh0iHmYRPt3ydlVqShNspqavytu87CawRlrkgWX98q6XRMxummQGz6RGX2
         qq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865790; x=1768470590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OXKDVd/eqV+dxKTVTLpTcKPaIrmdmBllxVeUSuatEk=;
        b=upICElk03BdD6OnaIVGfqF5iniI+lVyJi0/R/ZcRHs6kYaFgNxKq6mSLbDWn7tgXN7
         LB7XP05/gx0OtnLhWFX3k8wgdLK6mdksZgEMsajsIcBEz/+9X99Y1DXp8G6BqOJL0heX
         73R0kEbLt+w2uAQNGaxNcIYKLg8+byLrA4fQ725Ec8FOgSSnTQ/3cztl3YHMAAV5b2OK
         4hYFvOX2Hn9SqtuZJjf506CFn/DoBGm9l8vMigNx6nwQVUxy1zEyJAunJIXa1WteVFUc
         a04D0akY8h5BHzRue2BppWVy4uReMKFL+nOelhPlOz0wrokNS+Z1qGRvlAhTXTSJ8I4b
         bnxg==
X-Forwarded-Encrypted: i=1; AJvYcCUBKgQKjqRzbPfuHFzgHz8EtwWsr91S6NfNB0pDuH1vHGqL88uLwK6DO9VDQ0k3l+dyCXYsC6FYOIjUkb2Noble6Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLCsNBxS/HtlrzQDoUTtiSaCIQLeG6J/WfvkhMjKu2IlYRWJOV
	nzzlyLEH3tpvlgyZstNGij4DcLPtdT/HjdZ5n9MXx42Mio19yBBYzpiLgzhGMw7N0Utkf2wEb8r
	AkYJG7Hs+7gFC9+zIUUkNkNQjIKZ+etAsBQ==
X-Gm-Gg: AY/fxX51XxqXBI98rIvwQYmOIIVjXkWpFnzIs1zVo71WbAiS88DQWGknAGV/0IggNWY
	Sz0GGsyv0XZFxnudcFD6UKNPUuNN/PFR9xLRUcC3Vcn7gTo+sX7Jx/+sTRQB9DF/EOqFjg4CS2W
	DqDMNC7TZ+o5GoRxZ9i1TZcygZGeJEowIQ6RjgiqfHwG/ts5HhK8VGn8RauRE6lfLgrWEVsO1LN
	DiNudYkUCz53LCt2HBka/LNvX0yJk2zdP6BlFbOmGLXVofFpO899T3L6NgjYNwTlEutfB8j0GLg
	GCNPPrq6xYlfO7rHK9C9UIpkOyS+2g==
X-Google-Smtp-Source: AGHT+IFXttIBaHe5Vt0vcnm7wovDuRvDFyEyuR+G9XA8S04xhI6lSPaRFDrHghgVKBGBNRvscSVVTybfwnRZhC+hPw8=
X-Received: by 2002:a05:622a:1a86:b0:4e6:ebe3:9403 with SMTP id
 d75a77b69052e-4ffb4a6d332mr71745291cf.41.1767865790314; Thu, 08 Jan 2026
 01:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20260108014101.1974-1-liuyd.fnst@fujitsu.com> <63ef01a65fa6fb80985291625e7dba560faa53e7.camel@pbarker.dev>
In-Reply-To: <63ef01a65fa6fb80985291625e7dba560faa53e7.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Jan 2026 10:49:38 +0100
X-Gm-Features: AQt7F2ph0wZj7760oX479RhuqN-OLTMoN2bLmfFMRxzp8cl5XLqMpI2QyEUgCOE
Message-ID: <CANNYZj-=U+tTgqr58uDuj=vmC57Uj8d4WGvz7n5=8uYyOoUCVQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0
To: paul@pbarker.dev
Cc: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229051

On Thu, 8 Jan 2026 at 10:46, Paul Barker via lists.openembedded.org
<paul=pbarker.dev@lists.openembedded.org> wrote:
> As a side note, when we upgrade a recipe across multiple upstream
> versions we should include the changelog entries in our commit message
> for each version we skip across, especially if there's a major version
> bump in there as it's often because of some backwards incompatibility.

I'd clarify this a bit: either there's a complete changelog for each
in-between version, or no changelog at all. It can be tedious to
produce them, especially if there's a lot of recipes updates in a
patchset, and it's not a strict requirement.

Alex

