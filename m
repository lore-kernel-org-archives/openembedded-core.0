Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B11C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:53:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14709.1771649598639582292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iRHrIOxG;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f10628so16480575e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771649597; x=1772254397; darn=lists.openembedded.org;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sPgBEV7T4Onks7W/dOc2wjeUf/CIA136SrZRnu8w/Pg=;
        b=iRHrIOxGt5XJ7oJMWZsv6J8uT6cfD9SsJvcPRBF9t5CwMKlz1+C6RP5+4yAGrpZaI2
         Qm+vTigEnEp06eSN+CoRXGzYip82N+z0EhVuCINmUh0C3RYrG88pRoKIpKQxQVshyN5+
         6RiztW8g8/DKzazigh0H8O8IK0tlBD/RAkFhuLwKmYi2n/BIgGEysUTKJxVMXVP1CBiw
         DInCrdsdHYBNEpchx2Qtgf0RVwspLMAPoyqbgzxy124/c85cwq6/aIgZaxDONq71BFST
         A+k8rMqlbJj0ugbDRksJ8RPSIEV7mAE+W6g6j/5jn3ON4HKkYe5fZVhNGHFvXNbYAGVG
         rugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771649597; x=1772254397;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPgBEV7T4Onks7W/dOc2wjeUf/CIA136SrZRnu8w/Pg=;
        b=PLFPMFfFzXec2vY1oxZ51962k+v3WScKZV8rZIvPNDzsBCIaWmvPm0TObLIcP/atP6
         QdD7+zovQaXQQhSWJx99wg/40RoKj7q+q7o5O8EvDwoT964kyqUBzPYEZBWPEANtS/VF
         OpbB/CpuPs5cJP0CBhb302ie0FMzqi4TgMxTxUB2xLm/53KFprHeSZaCIbscWdrae3d2
         g4MzDuq2s7daw3Um3yiQWp2w4jf8EOViHKzuOowooY24fHawq0cA5Qw7TgJoMIJplh8L
         wuBno9mgcSB1e/3GjxkczAYNacv3Uc8Tjicc+ZKBgBndTqYFVnrmjfDJxsJDK8Dxym88
         oSvg==
X-Gm-Message-State: AOJu0YxeQrm1me4//yZaae10wF2/GoVwHq5uWUdfLRSJnM0bFqqtkHNj
	+N0p6WSMI67MnDXyDq+sGkRoxUbGyhWRcMBfy/Bgsir7lJyqPV/MThuHuvkiVQ==
X-Gm-Gg: AZuq6aLEua2ME0H4Dtcn2ZXc0zOi8oJqPQADYoTg4G9KudRndIAwZXX/bgEAKrTHK7H
	Iw6jZkdboDVURkzMLLi9MoSI2p35WaRRJPAGo37Ev2d2vSi9EHR9QDGoX3ZIgKgFEOzV4T21/6N
	ciiksiaieYZRPwCD5ofRyH3WgEiKd5P0nZmiOcKw5FOR5k/UxkL8kI8l4zB5anJJAgrBbN76oO1
	oslIi1x+cWzih91rmwdkEePVO6LdSkhQGGDz3MMN+22NiboaLgF+r4liuG7hMkhUHeEa9mVZx5E
	2+fSwI0rEbflpaQxxEhJVW7adFZ1rtdldGWxmEHWfekeaUZ/WlHk94OITrmbwdZGj/XEgo4ZcOD
	/OACiLbccYJnPL361DBdQI8+wgJQHldWATuBlyOggk9/2+1GaCSUb1qEIMRlAYN21Eo53kPoYYv
	Vs7dzlPcyawLdRKLDsvp1Uw+RNHRocfz+qTOGKL1aB21sVVbwDFlYX4CScUg==
X-Received: by 2002:a05:600c:608f:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-483a95bd993mr30825595e9.9.1771649596598;
        Fri, 20 Feb 2026 20:53:16 -0800 (PST)
Received: from [192.168.1.188] ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff1csm2590292f8f.20.2026.02.20.20.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:53:15 -0800 (PST)
Message-ID: <69993a3b.5d0a0220.ce6f7.e29a@mx.google.com>
Date: Fri, 20 Feb 2026 20:53:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, jpewhacker@gmail.com, Ross.Burton@arm.com
Subject: Re: [PATCH 0/1] spdx30: Runtime dependency detection from package manifests
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231576

SGksCgpQbGVhc2UgZGlzcmVnYXJkIHRoaXMgc2VyaWVzLiBJdCBoYXMgY29uZmxpY3RzIHdpdGgg
W1BBVENIIDAwLzE0XQoic3BkeDMwOiBFbmhhbmNlIFBVUkwgZ2VuZXJhdGlvbiBhbmQgU0JPTSBt
ZXRhZGF0YSBmb3IgU1BEWCAzLjAuMSIKYW5kIGluYWR2ZXJ0ZW50bHkgcmVtb3ZlcyBTUERYX0NP
TkNMVURFRF9MSUNFTlNFLgoKSSB3aWxsIHJlc3VibWl0IGFzIHYyLCBwcm9wZXJseSByZWJhc2Vk
IG9uIHRvcCBvZiB0aGUgUFVSTCBzZXJpZXMuCgpTb3JyeSBmb3IgdGhlIG5vaXNlLgoKUmVnYXJk
cywKU3RlZmFubyBUb25kbwo=

