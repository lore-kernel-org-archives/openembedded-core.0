Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD99C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:04:07 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.90565.1749571446216158243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bU1INLFJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so2295377276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571445; x=1750176245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd+2QE0oDXfaC1rgBtb6bdYCMqu8TU8aSSXmOitQ7S8=;
        b=bU1INLFJakQIWj933xUuzH1w17nuwj7nbFrQKS+EIMy5iiMwXZOaxnP0ANqcbgcuLV
         Vq6FeBH38P5rhgaFFSGv9okjs6MWOBCY/gIzKWqAZK5meENCz8GpZRzNpZS2h5AC8NJC
         CvMneV0D/IPPA1c7RNMlSi+3Vyab/KB0egyP+w3ritfQ+6cDCxfdU/YNNM8EHtaR7d6y
         zHiR/Q5PwtZCCg7M23f9r/lfiJgEj2c9AxHb22PMzIvak6nZQZF5vUrKPmO9lYAHODzy
         It8n8t11W78OQ+1iw47uTy5bMtYy3+A4aEtRHyxbyqbPAUliVGthUVNB7oAkOP6atWdh
         Fa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571445; x=1750176245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd+2QE0oDXfaC1rgBtb6bdYCMqu8TU8aSSXmOitQ7S8=;
        b=nAKVvGf0EUc8cK4Ae3PCJmC7NuSwMAZVmj9iPW+k+xgK9cAYHwqBkNQyEqXfPZbgNA
         P+sGF+1p9jyMaBoWzkzCQT+QsmoOtvEAF/1cQEGRq2FWPxYSG9suX3L+VAog3r9TBQCO
         rekQFELtLP8OeTsSPeV4svBDiVEKqknsIpLFegQGvKBSpxx4kMeKhkh3MmX+ZVO7GdPd
         M5NpsluuthJUo9YGd1T1iAh2Jq7UD6eX1ptZT42K+Ap5w1pYmNSkGpxbBA3UpUlMmOKA
         x9codwQEiLwYoIeC3sYb3ern/ZUItmUYmtdqBhDs3Dysinxylr9Qva79t8/nch0rucVB
         ze4A==
X-Forwarded-Encrypted: i=1; AJvYcCW0R0spupBC3pZrs3A+w4/n1R6FmBT9B5rcUdjh7ipDXU8ZlUIXptDxhuxgUo2YkWQFyeRMffVVcld6PlxXjFW5Og==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxU+SWbtrB4OfVTkhVypKO0eqb77KqJBYMU+i2kXT0bz9VnMIlN
	zADRHqjjII5J1vL4NhYW/D1qOm+xx51qRhwbTGK0FFk4uIXJDTfKWgNt2TG1YIe3
X-Gm-Gg: ASbGncsfkcDllRhaOSJf5BBIe56gYc6nEJVv1nXsnPMYXhJVek85X5nvsltt4OurwH/
	1O4okT4vAV3kaRk23xoqaAx80TWt9HVcSkfreRdaBRKD3rucx6paABbXGOtbfYj1GGMpjDCfg6o
	VU0ri72owCX4m3XSfVDcUgJkaBUVkXwnJ8s7+3JjcP3F2DOzglc+/Yhbnb46V69bCkrsXXRonZi
	cOewGFQ1e7gPfYQtKpnJp78lLlv8bxqCnYf2+Ri+9spe0ePK4xi0L6AE1oINvZrzzengLT3kE3L
	/t5NF+tTCotNDRZmguWwFniiRLdQApNo2wj5G9kAwhhA3Ts357uyr1TNi2g9Tdmiph2VjbD1het
	FXePDTwT9wZDmqYN0ocpv
X-Google-Smtp-Source: AGHT+IHD7q1bG354qzFXT+1LOL4zRR2E5+SitLNdhfcg6j5doyjb/D7v21VD1Lvuw2/8K8nwaP8dDg==
X-Received: by 2002:a05:6902:248b:b0:e81:b9ff:cf04 with SMTP id 3f1490d57ef6-e81fd959867mr225785276.15.1749571444824;
        Tue, 10 Jun 2025 09:04:04 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a400dc83sm2916111276.8.2025.06.10.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:04:04 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: alex.kanavin@gmail.com
Cc: alex@linutronix.de,
	openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 8/9] insane/do_qa_unpack: add checks that ensure S is set correctly
Date: Tue, 10 Jun 2025 12:04:02 -0400
Message-ID: <20250610160402.888760-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610094400.1653931-8-alex.kanavin@gmail.com>
References: <20250610094400.1653931-8-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218368

> From: Alexander Kanavin <alex@linutronix.de>
> 
> The checks are fatal, as this avoids rather more cryptic errors further
> down the build. Example:
> 
> ERROR: gnu-config-native-20240823+git-r0 do_unpack: Recipes that set S = "${WORKDIR}/git" or S = "${UNPACKDIR}/git" should remove that assignment, as S set by bitbake.conf in oe-core now works.
> ERROR: perlcross-native-1.6.2-r0 do_unpack: S should be set relative to UNPACKDIR, e.g. replace WORKDIR with UNPACKDIR in "S = ${WORKDIR}/perl-cross-${PV}"
> 
> Dropping the S = ${WORKDIR}/git assignment (addressing the first error) can be done
> with a single sed command when there is a lot of recipes:
> 
> sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name *.bb`

Perhaps, given the patches that you are posting, your find commands should cover the include files too?

 `find . -name *.bb -o -name *.inc`

Thanks,
Jason 


