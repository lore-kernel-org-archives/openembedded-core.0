Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8521EC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 09:21:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2586.1784452902407169990
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 02:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pj9v9yZu;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so70828915e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784452901; x=1785057701; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IHjCYl7KSGgkdtKUowDQw6CRW7zLtUTan9/H2/fiiBk=;
        b=Pj9v9yZuoktyTLd6L5vp3iOJ7nEcxQ7BgIbgvUrQm+vuw3hkugGKQ0uQPLO89mSqjd
         L+lkoGt8d3t53Bhosxot4/Ik7QCN5F6cxT2g5OCW2PXBiBFkMSjLoGrdCALiGKo/xIFX
         YX7L2BUP9v2IRQnYoHP1hstVzj8nqI4DtTXz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784452901; x=1785057701;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IHjCYl7KSGgkdtKUowDQw6CRW7zLtUTan9/H2/fiiBk=;
        b=VZQvXPWjHzGPdN/KO2tQwOxlgvs15Mgb8B7V7MKSFZ19WI2wbt1JJ9TNKbphZrZhMA
         lg8Q54U3D5WObPFJvh4k8DZzD0I7bq/adK63yfVvpDP5SYMk7mn41JK6v7YdqSpubB3V
         422Eegut5i33gmOc2zJdrbe4wWPe0wVKX2N0jfehLq70L0019IchYcGpzR9wFB5cli54
         U249eAxEvd9wPEFSzht2uP8NLv8yxyu+apsUtWX6wFptI6iMuavKk8frC1k1N+3bXfkP
         x0r3xMGoYnSAQqU+x+vvFgbpM5WmzEmmF5nd4Cc6VF97ZsG9THkR/OE/hCyo53bmkEuX
         OKvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1GRBBSasF98ia5wzc1HlMRnluWwpZABdClDDRwyyBGtSlDKvp2B6PoOdhZze2eO1xzmj+MjWfkw682qkus+ULYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzapZyJWpnu+84urGjrDzs/8ZE+S0Bx/AzhklV1XKyP+zgcpc9U
	Pi6wa/V48EOhRqttiqHQXS/E254aRMCf7KVzBg9qh3ptlh7cuoP48oLSMdL2kQrNYZE=
X-Gm-Gg: AfdE7cn8qkOWOhOnBhF2VD7O5cAQgz0oR0p22/YLfjrJi4PJ5ZwHtuV8hb6CvAuoYc4
	LN3vrglXV1RSHClMzv3n+OfB3eY9HoiKQj5lwf6omhRk5khytI+c71Y4qYgBX6hBEePe5sPtbH/
	UUBCbVwS5Cc/kVxuUq/z7eB4kPSGwvWUbtdUSgszsRI5TR5+qs/F9yO7s+QFumg0R7Zlo/chH2S
	w+NiA2sTx/P7kzeJbDZ6uoTjU87ZGhh/Pdjl9jshPB6GHTQidnyibYjPp3VOrSzRdJgHKjNV+F2
	EmFf/ZaI1mt3F7rZhBrCDZI4EVKjgoeJtpv+LEguY0qxNlxAACqst78OrvqJ383HPTijjCI2UTr
	DBZDzomENLNo0WE+bt4OYxwiTmVkW5/h0E06aYdbUb71qWq66IKMyu1iZyI75/mkQnPHWwkh8wR
	VhyV2WKBSsFuduicL36oUaozzOQ5yzHoUOcOqHqwDB/nFSGDnG8dxgXdqI/lm8h2sE8cc=
X-Received: by 2002:a05:600c:b99:b0:495:4cba:e288 with SMTP id 5b1f17b1804b1-4954cbae4cdmr87622455e9.15.1784452900652;
        Sun, 19 Jul 2026 02:21:40 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee926dsm18083763f8f.35.2026.07.19.02.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 02:21:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 11:21:40 +0200
Message-Id: <DK2FRDB1WEDD.3RQXTQBQYUFIM@smile.fr>
Subject: Re: [OE-core] [poky][scarthgap][PATCH v4] systemd: backport patch
 to fix journal-file issue
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <sureshannaiah.mailbox@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260525192952.2813974-1-sureshannaiah.mailbox@gmail.com>
 <DJRK6ZWTJOER.251NKDM8K0T0@smile.fr>
In-Reply-To: <DJRK6ZWTJOER.251NKDM8K0T0@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 09:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241281

On Mon Jul 6, 2026 at 4:30 PM CEST, Yoann Congal wrote:
> On Mon May 25, 2026 at 9:29 PM CEST, Suresh H A via lists.openembedded.or=
g wrote:
>> Backport patch to fix systemd journal-file assertion on removed or corru=
pted files.
>>
>> Extracted from systemd MR:
>> https://github.com/systemd/systemd/pull/40378
>>
>> Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
>> ---
>>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>>  2 files changed, 66 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-=
do-not-trigger-assertion-on-removed-or-.patch
>
> Hello,
>
> As far as I can tell, this patch is needed on wrynose (and master, but
> there is a work in progress 260 upgrade).
>
> Can ou send it there so I can accept this on scarthgap?
>
> Thanks!

Hello,

I will now drop this patch. Please send a new submission if the above
situation changes.

Regards,
--=20
Yoann Congal
Smile ECS


