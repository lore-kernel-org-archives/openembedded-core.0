Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4A5F46137
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:52:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19492.1774277560887725347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4MXRmOV;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso3136317f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277559; x=1774882359; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6dgpZhr3V0MQBIrH3UDtU8cUoS3WQNQxbfgzgFC44g=;
        b=H4MXRmOVDYBwRkV2dXPSaR4ctncsC4HkhSca56RpqwWHjvYaPBUica8paG9PFn0rCC
         rMqZFm2ErDK3a28fZ3W/QnwjNTK/+tMsnKU9HJ2npTOzsW5NCNneAQWB8fgj+Gh0U8WQ
         fU6VABU8sYCG+76i9nazZZqT1MqdrlsKOE1Tykrx2Q8aOJDWgrb3EGSLEvaHKwxEAQBw
         WqJMUldivvCGCbkSQvO+k4oHjyKYssp+Tp529UfxYi66d2/0CdZT2W9HoEtfUP4OX6KY
         680Qy8YsRp9kAw8bnAM8b6v7NIEMyE2aXhjZCiN5vp5UBePvdiLweg/G6E9HUkf9YPRr
         /p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277559; x=1774882359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6dgpZhr3V0MQBIrH3UDtU8cUoS3WQNQxbfgzgFC44g=;
        b=X2ma5t4I3N2Mcm6ADXh4USeuffaYmS8m4nbBJUY7gRAKB+n0rag+lxK0GA1omecJXk
         bQQF5wYsYksMbZVx+KAoBdXyuwq4IggdAFUZQqRvrxuO40JWuhZBa/WjluNWFFJJzy6b
         fO5CEq/Qn1So4Tv6nWyVbVbPis3umCGTqdvUQaFR/GqvJw48NN7Y/FeMTTpBeGB5ZDIL
         Oxt237kl7YOv46+o/9VvP6QyKBmRgEVKqKlpHvW6qLZ2bwITCBz2r2EkTpXyQx/myW83
         S+LB+yGwX+6UOUBrQzC4n+TI3NdCufbAiJDhVz09aA6IVuXiR+VOhL9DfRvSi1em89aj
         lVTw==
X-Forwarded-Encrypted: i=1; AJvYcCWZDCOwsgcKlJ84ElojrdcC3/pUU1yVItMk2COak0QcAhP2EagDza8q9U762i7kFCEAt7iyNh6O/HnSlU6tsvhq/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzY9ERwjdD19AgAM9n4GaKWycZ/+OYUdOYxlLur+Id16eVGiRF5
	9dHcwWf5LSAx+CtLMvT8V0l5dMepZa5CqdMfczeNhKpvEgnk+yXWeCEk
X-Gm-Gg: ATEYQzx4b3opj8OU3D23v4cL8FG16Ejq9sMAxkDA4WNOGUR7P4p7gh0lIHHNmv/dywa
	pbmyvgOzIiVsiIhpQYB1hJW9bjR7QV431ee5ECxA/90rE9otfVm7w+kdhY+XRi361/R4PpITOlt
	DoOcHaAx3OvWhNlSIxUHzxrWxf4wNrIIOMiNS3NNVb1ctHSdE7utXYZOviyMv5i2FRRPeJVzOf2
	JFDUQ8CVa+kwfFoH5WCZ4f9Sjv0oczP7smJt+6ak1oUYRBxex6GLdXwT1LCNQJMxoYZf9JxCWkL
	JESVjulKnm1SOiNESTiNiPXHcK7ePE92xNq+s7/4uaCjI1ijmGyxW0soefh+ZVf6PGv7hIPiP9S
	hW5efW9tawzm/nY/xhdTJyAjNJZN8GOrpISwSplI3CrN6sG8nEvwPvU3+DViAmtDRBakjCsdbJt
	bMJte3fJ3kd3uQuBm5kuOhrSDC+9JDu7xdmYaxMsvst/KfloaETqqLx4yZERjquZ3O2w==
X-Received: by 2002:a05:6000:2303:b0:439:c24b:ec15 with SMTP id ffacd0b85a97d-43b6423caacmr20954804f8f.5.1774277559072;
        Mon, 23 Mar 2026 07:52:39 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm28717585f8f.15.2026.03.23.07.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:52:38 -0700 (PDT)
Message-ID: <d8c59726-e8b9-4dc2-9bf9-48b0647d10dc@gmail.com>
Date: Mon, 23 Mar 2026 15:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 "Zoltan Boszormenyi via lists.openembedded.org"
 <zboszor=gmail.com@lists.openembedded.org>,
 openembedded-core@lists.openembedded.org
References: <20260312120024.3745232-1-zboszor@gmail.com>
 <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
 <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
 <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
 <CANNYZj-Z3TKK9RTas0dnn__fvoo+-jP8SRjjLzhKBghR7NiWWQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-Z3TKK9RTas0dnn__fvoo+-jP8SRjjLzhKBghR7NiWWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233742

2026. 03. 23. 15:47 keltezéssel, Alexander Kanavin írta:
> On Mon, 23 Mar 2026 at 15:40, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> I also see other issues popping up, first in python3-installer-native.
>>
>> Probably this setting ("python-freethreading") should be a
>> DISTRO_FEATURE and then the python3 recipe would use that
>> to enable its PACKAGECONFIG.
>>
>> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
> In patch review it was suggested that we should actually have two
> co-installable recipes, rather than an exclusive choice between.

Which implies doubling every python3-* recipes, too.


