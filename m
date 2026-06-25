Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F516CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:34:17 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14124.1782401653264288660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eUFs7AXZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-662f479a22bso2440190d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 08:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782401652; cv=none;
        d=google.com; s=arc-20260327;
        b=JtyU3PMO70xUj1wHn8AtI4N+t1VNj2OnSRZHoDuuIlOHvIhVhMTJp1x+JhShZs1FZu
         e/L0CcO1FcmAHPmnlXrsvU9VsPQ9mlRq+KMi4H1rlmUpnU2feahZ7HLORfb/hNGvDh4z
         vVVugLjOU+jaRfM7DqxVK4ncetwcMCOo2mKZ1WmWKfWzQxIFcydBIQzzXQgGzAyVJ3Lx
         5RDC2bwoavDCk0Wn1uqeFUWvcYADxv8NrT4qlrgwLowuzVGil09nGwclAO7aWuvEOJzT
         U8Yh/ClJrRnaxgzHGS6WSnLYJDxPbLIEfGwimJQBrY86qB/v1GioP0lCPybcDvEf9byU
         VvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r52c0c9CtMVQeCT/Q/udav9ETfHFM+zeTb/lIuM7dAQ=;
        fh=DP/AQ6gA6+6n7/32CpRcCT70qzuFCaB4ADe9QMEjDuw=;
        b=DlU6wVxu4t1VJT7P1YVyyrbCULHr7WQajv40wuhnkAyqYzJ8JgyqbNBc9x3nR6T8V6
         nl/nNu4Har0inITsfyZ5B2mBEP3NBIj05MJay5jTd+ImnXnBFHyeFFxlHDGWDvmb6s9J
         zqp9CJcPF2fcSBh8DEbqVTU/p1x/d5DfR10cJXULsDfml1JXNOXisUX49v4VBtR0o0Ro
         rHZVc2fpqKxs6VdzdmYwmt7ijFPf5TDj7Gnh4q4lj3b3YfMbSrace1fsMGkDkFDXWEmz
         aO3WtJ5A1x7AbWoYml3YaNipthtyjJzuzfgJf2vB0HYwUNs4qwjkH9wgOYJrP1d5iCd9
         SMeQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782401652; x=1783006452; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r52c0c9CtMVQeCT/Q/udav9ETfHFM+zeTb/lIuM7dAQ=;
        b=eUFs7AXZQvQJoxIWy/R06hWrYqwxfkOgmUimORf5wbsPNlz+8BcNONM3gaivEmllZg
         zLGZjuwJOzbe4vCrtCBIf5/bB46xF3NtzCTOa2yQSKgBo86MFUV46pPJrSP44V5zur9Q
         RPNJ7llTw0qc6PnwYuJ8XJfWSdmjXbFuOPV7+A8WAeyNV6TVwWsD6KTmtqv3WsbJEgUM
         e4RE8Uja6UwM53momavoTsET3BabiMIAaqKNrDD1f81dZaItj9290JNjQiMfklbpqipF
         f+noeXpfnhm2DwmzWNNSPZilosR7wEsyYB0lT3nwfLTlONrif8cSaH+GO7FlTT6il91a
         cCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782401652; x=1783006452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r52c0c9CtMVQeCT/Q/udav9ETfHFM+zeTb/lIuM7dAQ=;
        b=dmZRyF52nV3w54f5gIQKsUtXRxTTPkRn1NdDh4wYVhJ7luYAD7OXI38NZMBgkuDZe+
         mYR551QkKO/hQJ++t+06ca7bhhB/+i9wcDzwj/FAwiakv4Qcre4Q+gog+0NiiLePRZ5K
         p5Boz8QymDqS4Pq40iw9RDkWtvVJQvsJ+y82kOq/qiChmXd66oeQLGnS+N+G/eWE3TkX
         0WcX4e8ySGrpRlKGRoQyAVWiQKq95j8osXfMfcM/rvmY/VVn8eLhqWHiWk6doQHJdLrQ
         C9GTVibBqZLqkNavCcYbCVKJyz3u6wNK00pq0E8MZ8LRa44IvBBqpQ/ejeOPzf1/F3cr
         vCWA==
X-Gm-Message-State: AOJu0Yz4nIqnowXZkYhgS+cNthDtyyp4gupmqNRMDD+38oOzirlEhJJ6
	5zI6KS8LW3Db/gISi9xw0KLg2QPGh2zj7IU8iuj3U/J+Wqu0cjnLh+x7e1v9ebs+lLgoUDxnt3X
	yk9qRwpm6JKXRfMeO9Z5HOznxKNmEXaA=
X-Gm-Gg: AfdE7cmDcWxe2MLEAE69KmSTsnVTAtXf4uNwIyvRTJKI4k+YNR1RsZVb4pHKrSPsKcc
	ASUNx1B/qy1rjwkzWcrB+jLGR3PgcfQP5X1S2LRNN+FgMBOvvjL/F5fucv0CLkCx23LRWV7kJe9
	rt/0ruo8vvjH/9Y+7EuB/6zYkpW/rHsU/LP3LIR9LITf/YU0NHYmUfUp82VCPLqx2/MmG4FM2aQ
	fEDoHcY1BK/38aGvrdZgISPdTxK0XEDDKPfM/elXFWeAR5dzvJeZxFRnCOBdY+GGvoVYaL2Hg==
X-Received: by 2002:a05:690e:4089:b0:664:9032:6589 with SMTP id
 956f58d0204a3-66490326994mr1345890d50.1.1782401652197; Thu, 25 Jun 2026
 08:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260625134210.4046622-1-daniel.turull@ericsson.com> <20260625134210.4046622-3-daniel.turull@ericsson.com>
In-Reply-To: <20260625134210.4046622-3-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jun 2026 17:34:01 +0200
X-Gm-Features: AVVi8Cc-SJhqFkoyKCguxoRwdgQoGC64QOOch-vEo87Uapt5zh45LJgugzeHfmg
Message-ID: <CANNYZj-YEH6Nbk5A+ste7RNa0MyATwFZHO91Q1iC-+Qaf50JYA@mail.gmail.com>
Subject: Re: [PATCH 2/3] systemd: upgrade to 261
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, anders.heimer@est.tech, 
	qi.chen@windriver.com, richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239578

On Thu, 25 Jun 2026 at 15:42, <daniel.turull@ericsson.com> wrote:
> - Drop redundant tag= from SRC_URI (SRCREV already pins the commit)
> AI-Generated: Claude-opus-4.6
> -SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
> +SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"

I can only assume AI is using outdated knowledge in what tag= is used
for, and you didn't double check that. Please restore it. It's used to
verify that SRCREV matches the tag, and the recipe isn't accidentally
(or deliberately) fetching a random unrelated commit.

Alex

