Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D61DE63F3E
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:45:30 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15887.1771231523110244642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JbKKH16Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso22115695e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 00:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771231521; x=1771836321; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1r2bpNca9UzPoELcbz/4MQcifNShsBNwQhWU8kMB5dk=;
        b=JbKKH16QwWmEkiuuiM3xOfS8fcP6H8fZ8HCyFaIW8MHXl4MBfWPJ0hcmxBH3Qh7fJ3
         VtcUjRCMUBExKj9MvvwkLnNJelBKo1kyUiApjEBQiNIiTLswjvn7hpaZ7UJbHqqdYyYs
         wnRyEVptmRDpk0kTrrl8CS+a97gDvg0FLHqPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231521; x=1771836321;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1r2bpNca9UzPoELcbz/4MQcifNShsBNwQhWU8kMB5dk=;
        b=YrsUYxspY+bQzQz333bHWsJixOMTAG4R+o/619yKpdkxfqdBAIOXOYmUsD23F1SNcM
         IIhVwrYqep9PjUidFySnflyP3skGq/CYb3V1WEW3FlxPF2Se8GF9vsqkEsBSJzBt3tFl
         HTCUMvVjAuWqFLUCMp4uR27253Kx2clx84Ou8FDLIGo0wkK2U35qKyn6SXqQYIYaU/vb
         BEAeUNNQ7/UNv5M6XlaY1qjjAx+CHnsA0xeAXgF2X2EnvcKqH7Wk981HQboJhgyLcljq
         mJb0jVAn7zMH8IG24n4QaD12hbuXS/0sweiyc+2R3NoIjMibdLu3IodK8VQo7sEAzyEC
         yb/g==
X-Forwarded-Encrypted: i=1; AJvYcCWOtjRWoiRGHXaw+dVG/g8O+26KG/yph3hpWNMD8fI4JoaUbLHSmxrigCTDT7i2onsoTHcv8pEte2TIOLbJdAgk1g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy62YzKvvJgLsPGjvAEfAV9pb4NRmPw3PgPXcD6vrexkDMfKCvc
	ZOur4DKNKsgY/7xTUaXJWLOPSgh5JpSzUpeqKqnGieLGEzjxCy7bKzkAvv0qqhePM4k=
X-Gm-Gg: AZuq6aKWcb5tWsVnzi/gWf3tZAIFlcKlLd2UqBir48W073dzVEw7BxdyO4UKpG7LLd0
	HOcbqBFQNWtYUi+WwNL7zxuvpECN4CvmSKtnIAyuDV0/49p8xTvuzjLhUes8N4w689rzyVrrX1F
	y1sh+di2Itei/TVX7DyKeYNwZM4mP7z65SvvVzbrwtvevQTs6/f8+dUIStV6x9ARKHktFgKJGMb
	VxDNnfkb4X4u/YELS5vcbekVS5ReKHuqIBttYPXhM/o6y7K0xMAdbGSOr9FcuFnC1wTFaKKZZke
	JHt3c+MHAv9qnaq5hNrG1rvRq26fYtG2Vv4ObwYyXakoxjQ2614WMaX9qm3FS/fCUPA0xxVlnxq
	LG1qdNCMOX2XdQ1FxCz6DPuUPRof94kQUDs76w++k8znrl9N8eWtVl2ho1g8ITVij4wzX1dNWK4
	ahmD9wCTpangFECai4NEle7/oT3Zl3u0FWrpYIBcV5idY0CcqaPvt98C3ld7AgR1dI2D7IyNHI+
	13rvJwCI+7MwhEpy38i5DSEiQ==
X-Received: by 2002:a05:600d:6450:20b0:483:78e1:784 with SMTP id 5b1f17b1804b1-48378e107aemr102264805e9.4.1771231521470;
        Mon, 16 Feb 2026 00:45:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c30e:78c8:ded9:8375? ([2001:8b0:aba:5f3c:c30e:78c8:ded9:8375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm577952795e9.6.2026.02.16.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:45:20 -0800 (PST)
Message-ID: <6209dbd7b77f6218b5d3e01aefd293f03f2ca94f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: Stop supporting sysvinit
 compatibility
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 mathieu.dubois-briand@bootlin.com, 	openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2026 08:45:17 +0000
In-Reply-To: <869743bb-2db7-476a-b3b0-0a69805107bb@gmail.com>
References: <20260213175618.1801591-1-richard.purdie@linuxfoundation.org>
	 <DGFOGZFG9RCO.2210182JJUNRG@bootlin.com>
	 <1671a6263c305f54398e74a0a826387f343bbe34.camel@linuxfoundation.org>
	 <DGG6RBRHEHWH.3AZ2ZBL0IW4NP@bootlin.com>
	 <869743bb-2db7-476a-b3b0-0a69805107bb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231185

On Mon, 2026-02-16 at 08:42 +0100, Vyacheslav Yurkov wrote:
> On 16.02.2026 07:51, Mathieu Dubois-Briand via lists.openembedded.org wro=
te:
> > Just in case: I also noted following selftests:
> >=20
> > bbclasses.Systemd.test_systemd_and_sysvinit_in_distro
> > overlayfs.OverlayFSTests.test_not_all_units_installed
> > overlayfs.OverlayFSTests.test_not_all_units_installed_but_qa_skipped
> >=20
> > Thanks,
> > Mathieu
>=20
> Overlayfs feature doesn't use sysvinit.

Some of the overlayfs tests still have sysvinit compatibility enabled
which is why these tests started failing. I have a patch which tweaks
those just to use systemd only which fixes that.

Cheers,

Richard

