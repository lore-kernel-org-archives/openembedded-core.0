Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C511D47CC3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 10:06:35 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2838.1768557992754143357
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 02:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rj3Ics1k;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88888c41a13so27190036d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768557992; x=1769162792; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+BT+QftmT0tvIs0eggUqm9AxI/auW0jzEbH0aiUEMYA=;
        b=Rj3Ics1kygZUi51P4J4V4AYoErd+LO0o3EXrd58a6+WPEduOknRSZdz7jnbXPJnI48
         MHj3eGCbYbev4iVAqbjphkYjYsFI0XRllT6z7I5Q8mXLXaUCx8GS5tG4aukQ9UMlrTqV
         GQSKgptJEcqQLvgn2hn377NiigOXAHPkeLOZcYocZu/cHaPJHTMD8NuOZUYO+VFxGiZ8
         c6T2FEf2yRGiszYlPQqYeZ86V6uHHDsO+0V5edNUsRGdnGHDVkTXLaDBCAPbR2gbXFgR
         k/RfFjLctV3Efhpwf4emKf+mt8UnI7So5zYildsQRq66ABe3DCfipfam01WEMBl4nNQW
         o4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557992; x=1769162792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BT+QftmT0tvIs0eggUqm9AxI/auW0jzEbH0aiUEMYA=;
        b=pRjrt+LWm+mzM4VBNxy+Z/Ovq7+F6qtWyGkJo6GNg9VhP4M4pITTYmq4M2tllySIXJ
         l7B6NyL5dOLZ7xkEeuE1z6+L5cd6BKL3UplYkPz0+Hom7zq8X5d2GW3pAxezRVhfmju5
         HcfR4DnxudVeEOXm2ecZf1ssXh4zyXrVmTztZq5muFgYC85k6dvOLZKK9zJg37Yu1Zwb
         XRnpb2+7d3zDtSr1yirSHGOmFW4SJw+fY7r5LPJBIi5GnTko+cat6y3djLu116+0B78W
         U0W3s2KXuWH/e0grm+N34KBVt8uJCzx0k+GAKKHzdIu0d55T6xjE7f1TK5W4M+F5WuLX
         x//w==
X-Forwarded-Encrypted: i=1; AJvYcCXe7uXPLImtFv99PE/Yb/h88vxZrebqnPbZoGHZLc8m/lpxpq04KmJSQ9BviqrFHzl9JEhaEIaVxgJ4jt7iV9jeFA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyONutZzHwLs9oSVUu5HqUG7Wa2cknCO5T9rCDSuG7hOr2sgqbb
	bGg3kNFIpVngNeJVXxdsQWugDPec/Z7KhpP2LW4jXkFN8POm9aFg7sjOb+f2RdkdmDKzGYxUIsb
	8hXwqlsT279HKWMUKAwnfyVmWu4MS/ws=
X-Gm-Gg: AY/fxX4G9GoCzC8ksvTv3JtzRDCs/NsSkZLHNCOqAE2UyDvukHoMi8H9IlTk66uuMDW
	vq7Y6Alhwy4cxUdt5+hdKosZtFa3XyEZ6YJ+PR9p+aVVgE/mjHqENkEMt3AlI5f98MCahl2yw+4
	8wvSz66d9+e63ZgV9aS/pMNDq3wn/1wwXDc7xGDyjxn1X5EhS+RhMhpOi8w8FbVwVNEzbFOd9v6
	CUBn0U7o+NCMqhyUxI1kPVf2BAcP4gmRBNDtQUTDckASbqh1oRRAruu//9wxrojPH8dAG4AR4Ym
	GCz2
X-Received: by 2002:a05:6214:1c4c:b0:890:2a3a:1bd2 with SMTP id
 6a1803df08f44-8942dd06b3dmr31257916d6.4.1768557991814; Fri, 16 Jan 2026
 02:06:31 -0800 (PST)
MIME-Version: 1.0
References: <20260115132728.3570868-1-adam.duskett@amarulasolutions.com>
 <DFPWYFPKCFJX.2BQFT0MCMX3QY@bootlin.com> <CAHDQB6ObMtbbVbEf3KTQv3QA9OsNRtwcQH2KvLYj8iDPkqWt-g@mail.gmail.com>
 <CAHDQB6Po6vK=JPJphNEzizwxCYrsh85mvLact5rPWWNy2rVcdg@mail.gmail.com>
In-Reply-To: <CAHDQB6Po6vK=JPJphNEzizwxCYrsh85mvLact5rPWWNy2rVcdg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Jan 2026 11:06:19 +0100
X-Gm-Features: AZwV_QiOtbSFzuRHi1F7mCTWc0VTe4sp60GkGOAXr8lHaP51xClrl3d9ZzJcqT8
Message-ID: <CANNYZj-LU2j0T4quLn4Dd7dp3KfKjbu_mcvnU94fE_c4dicg8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] systemd: upgrade from 258.1 to 258.3
To: adam.duskett@amarulasolutions.com
Cc: Antonin Godard <antonin.godard@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229540

On Fri, 16 Jan 2026 at 11:04, Adam Duskett via lists.openembedded.org
<adam.duskett=amarulasolutions.com@lists.openembedded.org> wrote:
> So maybe it's best to just wait for 258.4

Or look into updating to 259 :)

Alex

