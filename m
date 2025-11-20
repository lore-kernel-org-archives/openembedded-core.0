Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F67CF8848
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 11:47:05 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32376.1763639216789467969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 03:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O2273AYK;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-882379c0b14so5187116d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 03:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763639216; x=1764244016; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UiKiRoSgd68uecuHG4IP/mKndE41D+Q/tQcqBimbctc=;
        b=O2273AYKN9jj4YdyslWbZl1mGNTZdeCQehdZ9U7nQfcE4cQyVgoh1ti7yVffwNnl2c
         UuPCQ6dw8LP3bwcElLNB2/m+iquX0EuvGAxigNAWwGQvegvtb6gqauqjZvd9UVSXqbkS
         QaCaMTz1ZjiYE1TVsKZJ/hyx1DzF12o+q9nlFa0flz8VtZrTM9/FuVqHIS8aTRFZ+N3+
         Zk47CzeBOGNH3wj5zbMylAiTvm0hVJu/oYsD7HZDAO/ZFVPMLrgEV6kZbVNqouLN4oKB
         /w3aMV6sIYdMfefb1xIHO1EsGelk7OWTHo0DTgkmMGyd534+y+b45XuKqnQD1CNbVHyV
         7HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763639216; x=1764244016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiKiRoSgd68uecuHG4IP/mKndE41D+Q/tQcqBimbctc=;
        b=C4k/5JD5OjMEY/O8oP+1pSUDs3ySSjWTVESmxKtzcO6HFo76vPaWDTeUnEhqjvZYZt
         K/IBgHwoFnEmV+ChBxFpZRDGesU32vqHXiwp5l4TuiK2G42chqkbvSAFyKWbiiPoSRXJ
         GL0B3YDwBuupMOyLJoJQ7XyXQhNQ6higvpVRZdF9CMjBF3OysmwUjgTgH9rgTIZXve18
         O27Y28zfN7VV/bvn0mdOipcWdGhjFRfw11S2Yn8fmsj6xjkNTZUMRwiRQIivrxFTi7D4
         HlTtuOb6gt6r6iot+efgITj2IF5Tx6ANuQKmFksEiEJ+zKVo+sTRP+7pkwa+7Rax1gKr
         z6QQ==
X-Gm-Message-State: AOJu0Yw4nbVTA4BgBRDXN68tCjbDzWfZdm5jqBh0YkfSrtZ8Cx3UFVrA
	QnZA4WqN+MUMewgwomNEQfRQlD7ElmiUCRc5FO3wu786DcNIEoYaz5b7ylMU7upHmVTqWzoIF+I
	Vz2SaQHM2SBSwlNiokVqfQCHaCN0pO30jZw==
X-Gm-Gg: ASbGncvj6V25fgdYE7P/1bVT+8BgUhZS+PKXXn9gI8naUygK7sXF4/HeJpbJ28eFIwV
	dYv9H2FafG4GGkkgrpN9peYa8SNW+ZHFAsDRIwVdHEL0GAOr8pRsHfUG5KXuDxIzNDdBcMUwjSD
	GpwZjIeCCYWc/aYf0yIaeoQD0WbeZm7Zo7tAZ0/+MsxK+RC43UYD+9lc8jPZHIqHRWe3PN06GcW
	sjPipmPKRijFDa/aErgyCi9CiaZ6KeTm9N+/Q765kiyZ9l0I82KK+Olsx0rn50Mcou/vUFJc8rE
	bHKOCgcH45d4pBe/F7yId68CxIfJEg==
X-Google-Smtp-Source: AGHT+IEAJ6zjQ6faJceiZBgcPD8mbXTxFtCZkDDmLxju7i53ZqyFvlDY4armU/IUuG1+zEkXLu4SnLWvfhRtK3majJE=
X-Received: by 2002:a05:6214:43c8:b0:87d:f2e9:262d with SMTP id
 6a1803df08f44-8846ed8f179mr33017036d6.11.1763639215650; Thu, 20 Nov 2025
 03:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20251120114041.193806-1-changqing.li@windriver.com>
In-Reply-To: <20251120114041.193806-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Nov 2025 12:46:44 +0100
X-Gm-Features: AWmQ_blQemHy8uBmsXyzTePKANQsGMa2K4jINxo0KehU7BviRzNBcN4c7x0cmjM
Message-ID: <CANNYZj8mj1ag5M_gh_sWTmBr0teW-Q2=LyDi1VDzzcfWNYokkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add new variable FIXED_SOURCE_DATE_EPOCH
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 11:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226615

On Thu, 20 Nov 2025 at 12:40, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Here is SRC_URI of jquery:
> SRC_URI = "\
>     https://code.jquery.com/${BP}.js;name=js;subdir=${BP} \
>     https://code.jquery.com/${BP}.min.js;name=min;subdir=${BP} \
>     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
>     "
> When ${BP}.js/${BP}.min.js/${BP}.min.map are downloaded in a git repo,
> and this git repo is cloned locally as a PREMIRRORS. In this case, mtime
> of these files will be current time when checking out.

I don't understand. Is SRC_URI tweaked in a .bbappend to something
else? Can you provide a way to observe the issue?

The bar for adding new variables to bitbake.conf is high, and we
should strive to avoid that.

Alex

