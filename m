Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCB0CCD1BF
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 10:53:31 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.17224.1761216804889865400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 03:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bq/8CJIZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-87be45cba29so6004206d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216804; x=1761821604; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVjNR0gabH4P73kTACINSpXRLI7kPjnl+XFe6rpgEIE=;
        b=Bq/8CJIZAeFhGoxTSnu4RDABZB3iz/JgI1969qjGxG1ze6umIBH+t9/3B/17cdtA3P
         e8tIy/wKbA+6XoQO8Vb3dM6JIATdMUrj6XMYQFkrsHMis70H7PnEbqdganT6dx+tVIPy
         VKbtfsio6kU1ZEVlUmQo2R1F5omQj61wSPZ1BbZ/sa7/Fx2iAwsdzR62C+GtAJcHjf6T
         5SsoWpAwnYHYzpr5xghJxW6L3eakh2ML8o79k3W3c/QJNQ+UvBYcRPj4StKp1uEAUR13
         Oc9owbxKBjDEYKmBmxgi+6R52/LOInvYGjtz/biAtuJ9u5K/chrq9N3sR5QzVZ+8RbWL
         GSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216804; x=1761821604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVjNR0gabH4P73kTACINSpXRLI7kPjnl+XFe6rpgEIE=;
        b=PCsYlF1CLRjvP7JiC63w06suHUZhUNlyBd2rQQ+Id+dUZBYeNHtLXAUBCQttMDq3i/
         2AonSz8v2T2QyEocfVSaupKijnjONaRYtJP9jzW+rFT16baoK7m6ZVjJb0ASKH+SkXp3
         DGwe7ITfJs+FHA2iMkUh/Qxt3rpgzVH7pZCapSvntriayzw0eaGBUAV7CWMhUapTiUk5
         FgOJ8QLpCAk+jm8B8QhgGul65GmLocwiYdqGdaUyd2cAKpFf8m0N8M7rUg8ss6Ttxv+S
         B+rMP1iC7NFVKc8sc+N/g+ddYLsigUAz0Xn/opGoTdyapzRxRXPbXxFehfXgso89M4Ci
         K/bA==
X-Gm-Message-State: AOJu0YxnpCVHU4tUp/RMer6FSF/MIq2h1yHtiiAyOTXIMTgzmAw6/68k
	USHX7uYhKTCFK0/Rcur99gzf9COYgat0cI1pWx67c2RiScQqB1fg+05k5se4wnnZZezWV0IGpWQ
	JLHtl6AwsdlKSxdjyJ6M+vdryhfd8HUk2sA==
X-Gm-Gg: ASbGnctLVdTX1iWRAsi5HI4RZdxQQy88KTwRSO/NvtQynd977FFFozG2aQ+xOdYApjP
	k7G7DIy2HFVuqDuPC44DeFID2YKIB5qHg18Rb/xRDjWkItuXquJ7472RYBVV88HPhDL3+EQjwEi
	ilyeBBB0DO/ludHyOFdyssvmnQxQBHdkI48s2Vabdnh2vLJ4iQW5aMC9ZqKDeDBrtVca862s6QC
	qHWBvUOYMmABbnXRfsjtsAQBrbzVW8RqwrvgenrAT+kVD0AjjO4ST1jELWek4POcqs1l48Nbigg
	hORYo01/N1B5tyMRA7ttK5dpmezzshwaV09+OnwbHvnZkHw4ykf3Ea7TyXhfw4UCvSoQ
X-Google-Smtp-Source: AGHT+IE7Cq45FdFR5PCM3eSyGOq8RbmHP2eCVoy51yRCH2F3KAFym15OL27dlzu1k4rkE9MLnDAh57tksU69iDpqv/o=
X-Received: by 2002:a05:6214:d8f:b0:87c:1d89:a245 with SMTP id
 6a1803df08f44-87c20639474mr283054916d6.49.1761216803883; Thu, 23 Oct 2025
 03:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <c9b01153cce85ee303c68507f6afcc74903dc3de.1761070660.git.joerg.sommer@navimatix.de>
In-Reply-To: <c9b01153cce85ee303c68507f6afcc74903dc3de.1761070660.git.joerg.sommer@navimatix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Oct 2025 12:53:13 +0200
X-Gm-Features: AWmQ_bkRvMUyQqjAIlXppIaB6spCrDRwenM8_H7NLtkccWG9X1bWPCoKBYdjGI4
Message-ID: <CANNYZj8Dm2f=XC8sKcKq0c_1emmVtjS52bX7_N1Yp4cFG86eQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gtk+3: Update 3.24.43 -> 3.24.51
To: joerg.sommer@navimatix.de
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 10:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225232

On Tue, 21 Oct 2025 at 20:20, J=C3=B6rg Sommer via lists.openembedded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> According to https://www.gtk.org/docs/installations/linux/#gtk-v3x the ne=
w
> place for downloads is download.gnome.org aka $GNOME_MIRROR (ftp.g.o
> redirects to this). And new versions are without `+`.

"Let's change the name of the project in the middle of LTS cycle, and
hope downstreams magically find it".

Grrr. Thanks for noticing!

Anyway, there's a number of other recipes in core that use
ftp.gnome.org, can you update their SRC_URIs in a separate patch
please?

Alex

