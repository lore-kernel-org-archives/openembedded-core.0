Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2026CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 10:10:26 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11328.1762423820794360776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 02:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VoupLakb;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-89ed2ee35bbso106579485a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 02:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762423820; x=1763028620; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUsaWyYq9kvl1AuWl/8LGMtXx+gLqBfLmUU5Ikn11yo=;
        b=VoupLakbq1sfLiAqZFEZsQ1iNjdmzVUZLqPsyQt3LsA7vYryRcWb21Uof+7chPqZaW
         /IRqzWsukmPI3iwZyDhNM94XrPTxAtzxnPxHNWi+pFuMP6C0kGAB6udgPXZk1m/YFj6t
         hOO1moPAmh6332Az0K8wLN9gq3k4clVxd9Pc1orD56z6sYYUDpEf8D0GAC6LY5dYzKkw
         0LQMAqYE7jV4PrCn3Zjh75Aj+rrrFtmfMqqDfpPr8Q4xcbypqxZ5QZ7nCL5rxPo4NVhs
         4XVEmrfCPVfOUCySfJvKk4smMAnX9HMOB4Uym4aniTPKMPI/YDYLnt0/7mWEZUG8USCH
         +CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423820; x=1763028620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUsaWyYq9kvl1AuWl/8LGMtXx+gLqBfLmUU5Ikn11yo=;
        b=ci80TplHtKY/5NxoIcY/uDDeRid/hakvy659sgQTMGENqw+jBC+zN2tIwx781DnfBB
         ChWNZpF/tO+B+hpQc++G3DCzwAYbWq6uvvT0RB4IGVCIaFaVlwVSpCTR8q7iQgtcgM26
         /1suDTm2lU5C91jBeHAcPI5thmN+mzwjrSRc/SWaW6oNb5vyWQ+k85VBT4xriIDrscJY
         Tnq8Iv12WDRI00ro824+z0Rzq7taHd0G0yUJcwf9LErSw+/3SSHJhsuWSAk39EK/kHOi
         AxblTkbHEy4lUwzi+JwECQM9wMkItal6Zk/1ZWyz5GwLTDsmgFmBpKSjn61lOja20I+s
         EHcw==
X-Forwarded-Encrypted: i=1; AJvYcCWKYkYpyohs9KFu5ApzOugTi1vQ/YECcUHvz22agHbh1J3BxIM46WQiQoYI/oxq68yuTWfay3u1MB3PoAkuRXOUzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRXxij3CGP+uFOXm/HKkjoPgNlMfiG1M00kYdIC2AqnvE2Hljr
	/YNZ1GQMU9j8miNU2KMAr8lKkf6sP95YDnKzwh6Ebw7/cgc7xEXJv+AIo2UKrJHATfZ9j5Qjjhl
	WI49TI4ypeH2M2egjf9b299flWS/NMUc=
X-Gm-Gg: ASbGnctIf84xXEwYUO/wvB61jbKifTYt8Hng1FrL5xq7HdQw8EZ2BiJFoQxtNOrmkGG
	XUlUlBND47FHrhesthTPzSqbIvN/tPhE+sGGfQZbbJbCXFJEvUktMp0fugpTFtbYqFXm94zEQ+Q
	dQMFUA2YIEHhAbrHqCne3hWoLN2rE1Nm8MQLDWRyxgZVgU5rf++gqK2LDsF23AEfwKrbwkJ4eK2
	Q+DzQ/JvmXTeqTCHy25FiADRhh8kFO60BEIqEVzeDPHT7Aabu5A20BKh8gD+gxD2Bwy
X-Google-Smtp-Source: AGHT+IHnmgmYZFPyjLKahV4k4pi+sLzh7moCfKQ9Y9nGCPdTU6CWhD29EWrLfkxk2dVEFOtsEYeJXFBB6vrA0GlmDWU=
X-Received: by 2002:a05:620a:c4d:b0:8a5:4246:686b with SMTP id
 af79cd13be357-8b220b257b2mr847927985a.36.1762423819623; Thu, 06 Nov 2025
 02:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20251105232333.2800541-1-yoann.congal@smile.fr>
 <CAJdd5Ga4O9AWOCg=NrOnwdd_m_u24L4OS+cqB0ojmT39zFhj1A@mail.gmail.com>
 <CAMSfU+7tVyd36J5ssaKeyPK4cxCtTsrgkOVejvXbaUM+n9fRMg@mail.gmail.com> <18755DC80A8D9F8D.418361@lists.openembedded.org>
In-Reply-To: <18755DC80A8D9F8D.418361@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Nov 2025 11:10:07 +0100
X-Gm-Features: AWmQ_bkKn6yiLFSEH9NcEM-WaVe9ewngzKDa26ekj3aECIZ9Aakw_EFQKHvwp6E
Message-ID: <CANNYZj_tN8ZHDSuY+6cETOjGSFPW0=AYjEg+JVASyJoRde5rTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-setup.schema.json: Add schema for
 "{THISDIR}" bb-layer
To: alex.kanavin@gmail.com
Cc: yoann.congal@smile.fr, Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 10:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225968

On Thu, 6 Nov 2025 at 09:32, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> Yep, the point is to formally document the meaning of {THISDIR} in the
> schema. Maybe we should've added a separate key, e.g.
> bb-layers-relative-to-config-file. Maybe we can still do that :)

I'm going to make patches. I do dislike having magic tokens in values
that need special processing.

Alex

