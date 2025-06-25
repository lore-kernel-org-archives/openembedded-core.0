Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72345C7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 10:46:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.12507.1750848384126753560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 03:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZN7coGXh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4530921461aso11738295e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 03:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750848382; x=1751453182; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDZj8BwP7zWQMWu66nc+x0OGz4U94E6doQdThE+uwY8=;
        b=ZN7coGXh6BBd1t1zmGNwfwfGm0i9PQcsXZFl4eEgPLIXGJ55g/uGKHTWcY2N21Ynz5
         /2yoYgf/PABXEPsAw3whs+by6F+EZ3cjnvPUUTleL9iuT83VIUEabFaT1J1RmlRYi++B
         0EEliAb0I85T0tDdbB48izi9Q8DYdnFi0+nTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848382; x=1751453182;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDZj8BwP7zWQMWu66nc+x0OGz4U94E6doQdThE+uwY8=;
        b=iu+P3z8vrCVmoSkiW3fE4Q8DxYY8CZiXoKUTg39bxh1vTg/h4PSpPOi0hi4Po8KYa5
         Vyn//2xgUgBi8UCTjYIN9O3bDJuK4Tat0RoVrQkS9GIpeaOJvVfezHY20ats14rzXo0L
         gVbsGfrq7k89C/cVWDSEDXQLKxfkDjZEN5o718lsLYACktErO549ET0EKZ7e4z5mhzhR
         INBSpKB4q6r/9vkZQGAluhLFzn2CkU2GSxgj9NVdHdgCv/BaiL1cR+tnosWGIQr+M2Iz
         pDT+Gbd1WCsjVB9/O0oZTAHJj6fzADDbqfjncniT5GwdcDLwcRPQo8tjPfF3C3+h9WvL
         VqVg==
X-Forwarded-Encrypted: i=1; AJvYcCUebqwkla23K/lDdNWnKFDe4ysLxpHOpY2l8ofV++OUbGJ8P/xQosAGyW6GnRRNY99rBmcrvnqEltPGlk0LSOaXGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySXuWfNVlyDcz+leFP+n7CclROFlR1B4xOEIcj6+RIOEbfRnnP
	SLgwbw3YTxI4lqL31w5z6GDZShIuxK2WkkgoobKJiFVh5Wbxsbn4g/bhE/9pueAjDRo=
X-Gm-Gg: ASbGncv/3V6dQKx3l+lkzy2z6huTj+ymdHwSLR9qoX9Jxi2jORNrUg15JceZep5ONn5
	1nV9sULbBAsENV+jcPXC7dmJmlq2XxqNfRJ02nVss8bF/LWmzSp/bnvRrUJmFoSxkbYjV5YU69d
	ZeiyjflaYWZd9bIo7PQKVyoNNqnvLT0Lm3PtmQ3N/kGQ0cw9iQOeB5Uo+Xrb+vVgOXgTgHxWFjY
	Pkxdjj7BDR5dpqvODwtJQbOmQSLlzdKmoaT0SOhTe2dTzwYPJNzhlNjvUnnN8B1twiUwSAGfUKr
	0xaLh8s0GV1UfPq94VtGlWkCn7Dsho8azJtYqIfd4WrzqLdcfFrDHbHXg5l3ZYQda1Tnq3T2vS2
	qTGLNGRnm3nMg/1rnavTPPufJKeZi5A6Onc2TxI/V2ih8htZcOJ8=
X-Google-Smtp-Source: AGHT+IGN54aNRpZmVJiwgO97WloVKeRFlcPJvxTR5wCH12KvzpJbL1x91WfsvyjhWOZoChBKCrOS+w==
X-Received: by 2002:a05:600c:4fd2:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45381ab4403mr21192875e9.6.1750848382512;
        Wed, 25 Jun 2025 03:46:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514? ([2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm16136275e9.23.2025.06.25.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:46:21 -0700 (PDT)
Message-ID: <64bb84dc0d44185080fbd0f8a2c8bd4e6cff4987.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: restore
 BUILDHISTORY_PRESERVE files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fbberton@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2025 11:46:20 +0100
In-Reply-To: <12213779-fcd9-4091-b340-44eb200bc97f@gmail.com>
References: <20250115153149.1827119-1-pmi183@gmail.com>
	 <089b2ea3388321570537e1f7adef3a24efe3250e.camel@linuxfoundation.org>
	 <12213779-fcd9-4091-b340-44eb200bc97f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 10:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219317

On Wed, 2025-06-25 at 11:26 +0100, Fabio Berton wrote:
> Thanks for looking into this. I was wondering if there is a way to
> know whether BUILDHISTORY_PRESERVE, or another variable, is not
> intended to be part of the end user API?

This is something we struggle with and don't have well defined. A sign
in this case is that it isn't in the manual though...

Cheers,

Richard

