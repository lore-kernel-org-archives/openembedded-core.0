Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA76C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:10:20 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.11978.1741864217640671667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 04:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Swi57DNM;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8fca43972so8076546d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741864217; x=1742469017; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2N8RyYS8amnpX1lxkY8VgBdx2Xp+5Y48rXKCm13w0nA=;
        b=Swi57DNMTQomTU357+WHnHxO8OgZtd9g1//YxbS9RNNLrBqciNSqMeIo+d/ncCtcyX
         9k3Pheeu9iO24CuOlCQtDq5APFAddR03zoV0jrAwTf+E263/0SeBx8/ncAk8PKUJbfHS
         /HNjHWd4TGbLeKu+f6c0VG33IqrLNuK12e4+Js8GDQyxybGzaoF5LE7mWziQvPgOnwmK
         3yY0pZzOEBRJRQB2QNDQ+LeeR7y+dDzsjvwCP3OolSRX1sVt3NFVtA9i2JSsp9ZynZww
         o79AFTb9QNUr8TGW6Q3ifn1CdUcdFoVak387s+yNBGdVnn4SW+RculvyqJWx6QEEzAGq
         2SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741864217; x=1742469017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N8RyYS8amnpX1lxkY8VgBdx2Xp+5Y48rXKCm13w0nA=;
        b=YJGdasuoevE201fo8bPLpPjA6dVY4L+kW6ECtYf6atis1n1FLak99T4A3I1WZg1M7J
         jZGzg9squgTp+YXB6ueO9e8WpEj3Bl8Qf7iS+2IyyDu0Vl+bUAL0V5rfx0DtuqK/rxaX
         SyoMRnQl7igivYXuI8XpWdXeiDExRQ+GQCik3rcA4XKBn16hb9V4FPbgeL0PEdGHBRFx
         G8Qr4I/VNrpb2s7ph+zrhp3TJFGkPaLrsIqQClCjy0BHLZq4XHJF7xIKWZqmp8x6rJdl
         5RAQho+IxZf6y6+8d1W9xU+44b2JlDhs9hK0yP8haH5BzQaEV150MMOoC5zosLE2niQh
         lyRQ==
X-Gm-Message-State: AOJu0Yy8lpjz9QiwJAROO/K9D9eYxrqgrZ5jYDpY1YvIoic2J9VgEIAe
	4Qe/HxkadsjsYfUJsmNkTCSa5MNHwbQ8lB8x2QUO6RPuZ9EBZGA2h6OfNwjDzOdGHt7UUwIzeeY
	B79+0kIGJcIWtgw1mktmIWHzOoaXCo192
X-Gm-Gg: ASbGnctKNSg3A8o9c4GCNjs1Q+sLilKv6bVKfQyPjZCGfTUjrEnHrA8IY4wTWrE1km3
	90EFc+SKOJtWd6irl3W7VSg25pmQE9v8/+xtl3JKyGCs+pH9+sw3V3z7YCn5QqVKJNFM+svA7zb
	MJH82zdiOUi/cTBPkicLIRRPuN
X-Google-Smtp-Source: AGHT+IFKH+rXLpLFFm6Enb4Gzpxpbcrtqd2E7dmjD/nM4fpfFdREZQsW9i9ItyBEQJ/GRxK6PHgQmeZkSZsktP/vL/c=
X-Received: by 2002:a05:6214:500f:b0:6e8:f3af:ed56 with SMTP id
 6a1803df08f44-6e9005e7562mr326418906d6.13.1741864216682; Thu, 13 Mar 2025
 04:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250311125919.2325099-1-quic_bpothuno@quicinc.com>
In-Reply-To: <20250311125919.2325099-1-quic_bpothuno@quicinc.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Mar 2025 12:10:04 +0100
X-Gm-Features: AQ5f1JqrH1ZrlduPMrU-P6CK8tP3xAcOWRDiGgsrxO3eV0LNHmvVqvKl1YAQJjo
Message-ID: <CANNYZj-OP48y-NB8E70RFkroL=8qZAVQRbsZdpu98zsm4zmHMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] dhcpcd: upgrade 10.1.0 -> 10.2.2
To: quic_bpothuno@quicinc.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212763

On Tue, 11 Mar 2025 at 13:59, Balaji Pothunoori via
lists.openembedded.org
<quic_bpothuno=quicinc.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
> -SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
> +SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"

The version (PV) is encoded in the recipe filename itself, so you need
to rename the file: dhcpcd_10.2.2.bb

Alex

