Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C132C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 20:17:04 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.18111.1749154618438237838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 13:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OOUL3aQI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441ab63a415so13980635e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749154617; x=1749759417; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axwNOnVWHDmU3nJ07KTVlHQbSOthFmx64jCn6Pkn+v0=;
        b=OOUL3aQIdlpn/jN116g/ALx6vC09JyXqbE5te8CCH6IrynKXk76DIOtdtBCd0cBlhz
         jU9RefHR4wF2xfAYwq9g6eEra0kJ+OctvjBikqXzAnkP4TJHky8bU9Buo0zu/RIN42GM
         xlnU5yZsTCA9t3B3gKffxwe46XkJOJoONzYWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749154617; x=1749759417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axwNOnVWHDmU3nJ07KTVlHQbSOthFmx64jCn6Pkn+v0=;
        b=NH0SJv4uPN7Kc6DXwR31Zwgzyce+ljUbflu8uU4dRnwKeJF+NVirwaV4R8eAXYLGLB
         tH45ogSBxIceWKo7TBxwP6LPGXkFdbOUzwHo4T+U6igKcRkZ0EcBhJkzQwf/NDV3FE1G
         KZOcoTD3t9Pa/wqsBZsB62RPjju4gZ8lZLlJE9e9S9OwWLIZhrvH51DQdBD5+A408hrd
         kFEWrcyP51XlHqOFGKBc+th/TRYmYAEMLDjraxlQjGQ6D9258v0xFKxK28LstpAHUx1T
         GZbOHdDk5KsmB14GJ4hv8VxgCRftiKWQ6QU1rsvkxPTAzzutP2Iw9NjtYdG2fzxUsSFa
         4PaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHQmpgLnstzSWA5GDb1zeQukB/shmcRe62ATYhFzWJK+3aIvS4lr4WLkZRMcEd8bhFqYadxIgIK9aydaUiMKrn6g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRLU7cgUT0xYDzcMaDByhEpQQFC3TsYMiOe9X3kuciDrjJk/eZ
	Jx8SAYH2pfYIiV8uC6LzoAM0Mge1q7vL5bEe5c80Ra5xGhwiGjTDSMctQ53zihbmngY=
X-Gm-Gg: ASbGncsdEvfsxOXXm690StWoxzrKfk/PQS3KdZGCb3LzWMdU2C0r1YfsqLPIzNJNpYk
	fWBJGKU910NRJNDujrWf/YLCY0IguV5JW07ghhaDYuCTfSNUMwpnKo1RWeQV86BogtBrTUVKPXe
	jBJUCZDNcYD6ZB8OE212v2/ei7r/QiG2/01qdM2XCdKS6uLXeMGADGnNTzFFWsI4ifcTUdLG8uS
	vC+Sqsf5BvADWNVrSg6/to3lP2gsNnl83c3bLChUHYRSgZUjfY2VpiIVxQIHueYL5j7O1o0bDz9
	tuif5TghKakA9M73bGXRPLStvOqUuArLVlAvUIGjU5B22oS04Zw3UEgdEIFykffVmVMz16qsXIt
	Pb4wfwkKQlHRJVvVZx9QgY1KakHWiR+GDr/qnGzlj
X-Google-Smtp-Source: AGHT+IGPESxR/ymONaxaqcLdWBZYuF1RT7ulTuRsaj+VvvMwfvMucjk6Qnw/2V2v1DaSWcSk7BChfg==
X-Received: by 2002:a05:600c:1391:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-452012b351amr9752025e9.0.1749154616641;
        Thu, 05 Jun 2025 13:16:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9abe:6376:b08d:c647? ([2001:8b0:aba:5f3c:9abe:6376:b08d:c647])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce0b97sm3231675e9.9.2025.06.05.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 13:16:55 -0700 (PDT)
Message-ID: <afdd91a71d0ce9bbc3fbf6e6dbd2b3be3c81afb8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/16] libmodulemd: put version in recipe
 filename
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, "ross.burton@arm.com" <ross.burton@arm.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jun 2025 21:16:55 +0100
In-Reply-To: <AS1PR10MB569780F67AB030E8A0B92B50FD6FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250605153508.961682-1-ross.burton@arm.com>
	 <AS1PR10MB569780F67AB030E8A0B92B50FD6FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 20:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218083

On Thu, 2025-06-05 at 15:52 +0000, Peter Marko via
lists.openembedded.org wrote:
> Adding tag to SRC_URI should be done only on recipe upgrade.
> Reason is that build will fail if shallow tarball is generated before
> this change as it does not contain the tag.
> If we want to add tags to all recipes which are missing it. bitbake
> needs to be adapted to add tag names to filename to distinguish old
> and new shallow tarballs.

FWIW this recipe was literally just upgraded so we should be ok here.

Cheers,

Richard

