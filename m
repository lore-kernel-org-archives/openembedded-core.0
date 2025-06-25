Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E14C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 17:13:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.21567.1750871603067345444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 10:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AskQOG+2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450dd065828so428165e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750871601; x=1751476401; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=57R6oT75S9sWrlPyIFAk1M0PxXvl8YLB7A85zdeGINQ=;
        b=AskQOG+2+iMmZGl9SbN6bWl3eLBPZeWrBY8MAHxirrMT5k9Xxcb3EoED9OWpv1qqCn
         osfj+5nen10hboweYhxwV3Eijv5Tcnc1AVT80VryfUwvElWhL7wJD/yfi8aEasFtn8lR
         UnHz4810nuvoKGqP/BeCCXReHdUzl06I8wkqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750871601; x=1751476401;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57R6oT75S9sWrlPyIFAk1M0PxXvl8YLB7A85zdeGINQ=;
        b=lWKtNEW05EEI8JuFK1Awi12/KRXdslZUnQ1CddKTVQ+5W3PxrPawo8xZHRYWFgbLEW
         30KUArHMszMAGE4eThdEj0EiiwOI6dc+m4jRzW8kw5+rj+XSiytVTPwgEql+Yd+twEoc
         lsXNKzAE1GzPODcZd1zIq/5oMRI7H1NkH2oMkGAp5USgvJr/H/N8Z6ZQjeSv3DYSAd3Y
         3ooJ42JoXtDhVRZy+op4snel8PBKLr6GgP0AzGYBpOj5ODkClb1QVht3082F67e16a+U
         IJZNCnuQEKJlNt1NWDlEZHHqf+8JFMTqTdMTJL3u6bTFsefKg0rWlYtICZc71mhrVmKw
         LYZg==
X-Gm-Message-State: AOJu0YztXp/pPEcyl6gC8fb92XGA+WtoK6eyhaViQ2LEyETR/6mDzw7t
	BQFcw4v3AT22xTjOWQqma6+5WrX11CWuET/xagKx9jemyqlMVPipu5kYkLI4mf2t8Z6X8t8JyYW
	UVr7d
X-Gm-Gg: ASbGncueMhudV5ErlH//Tt+jYvzzMtOKOeEy4M0dHUvvCx7R+fTJZf92JAgQoMMJcfC
	nDa905V4aIISm2C1Fcut1Ed6KPrpscLRMMKforPfAkz644wBqW1FyfBdKZmhb84f3Vck8LdUHC8
	z9adR/D9U5OvXoukTMFgim6YtOgV/ZaxuSTWWv3dHWLy2Xcf4y5fiIZPkutHPLuxmuJrIFds+3J
	i0hXLTGCCVe7W+faPMb9I2koY+5vPx+JVHZuDLxvIOKyrmLjiP4nj5HaeQIRkcoxMRp2MjTZz+X
	6NU1VX13CUoz/OYv+6WTOhZ7kzFxNfe2SRxV35bGINHnvn35IV0xRKkWjXuwlb98JeB/caTdo2C
	h4rbJOPZgvNYzzn7sQqo1AwxwBj+cfN+95ONQyIz+Jy2tE/+DObPf8rljnZJpCA==
X-Google-Smtp-Source: AGHT+IH9kSepWvwMwV/3M0Kxt6M1j3iToyExW9aYI40qiiIIpvvz6ceLxTbnK08q/bkbRAz1+t3CSw==
X-Received: by 2002:a05:600c:1c1a:b0:453:9bf:6f79 with SMTP id 5b1f17b1804b1-45381afda30mr36763625e9.26.1750871601016;
        Wed, 25 Jun 2025 10:13:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514? ([2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069d78sm5071795f8f.45.2025.06.25.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 10:13:20 -0700 (PDT)
Message-ID: <eab41ac83919be1cb88800635f43a898f13891f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/sstatetests: Improve/fix sstate
 creation tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: "antonin.godard" <antonin.godard@bootlin.com>
Date: Wed, 25 Jun 2025 18:13:19 +0100
In-Reply-To: <184C4D7CC1E90D29.24592@lists.openembedded.org>
References: <20250625135227.3106042-1-richard.purdie@linuxfoundation.org>
	 <184C4D7CC1E90D29.24592@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 17:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219327

T24gV2VkLCAyMDI1LTA2LTI1IGF0IDE0OjUyICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG1vZGUgPSBvcy5zdGF0KG9zLnBhdGguam9pbihyb290LCBkaXJlY3RvcnkpKS5zdF9t
b2RlICYgMG83NzcKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIG1vZGUgIT0g
MG83NzU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJhZHBlcm1z
LmFwcGVuZCgiJXM6ICVzIHZzICVzIiAlIChvcy5wYXRoLmpvaW4ocm9vdCwgZGlyZWN0b3J5KSwg
bW9kZSwgbzA3NzUpKQoKSSBmaXhlZCB0aGUgdHlwbyBvbiB0aGUgYnJhbmNoLi4uCgood2hpY2gg
d2FzIGNhdXNpbmcgQW50b25pbidzIHNlbGZ0ZXN0IHRvIGZhaWwgYXMgeW91IG5lZWQgdGhlIHNz
dGF0ZSB1bWFzayBmaXggdG9vKQoKQ2hlZXJzLAoKUmljaGFyZAo=


