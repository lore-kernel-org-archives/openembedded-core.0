Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EF7C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 09:08:08 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.8626.1720516083195350006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 02:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mPxjnZcI;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso5836584e87.2;
        Tue, 09 Jul 2024 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720516081; x=1721120881; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z4ph0tNgPs9Ea/UNfcdC0aYmrYsflpZZbKCW0CGl9o=;
        b=mPxjnZcIEwXJQAMcHFpM46ZG452VlsSvsLl+4a0ylitdHYFBK1wMKQH6BDWOWViiAj
         Y6g10TOkO50tUJbf1s9xekotn5ZyEo8bLtXP3h1E0TJYbCefi2YisCIant1yNmRORHwy
         BTd5dNLS4AtWIAKXan7IGK1jvqwKK2U0OKXtLfFf9CAg25OHl9ioJOXE6buHrZVPWsE/
         awba3b+dOTcZHzaOQSwi6vybmj5fBKHwC69xdVaoEEa5+g5g9L76VYuMh28arTW1QlCZ
         w3ExaO/gpERVIIF+hN3dXZrF/BRYE1+VpGnU3Vga2lHQQmCZ/SWiT3aNgWQGJNG4Ep30
         daaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720516081; x=1721120881;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Z4ph0tNgPs9Ea/UNfcdC0aYmrYsflpZZbKCW0CGl9o=;
        b=WZXk+sNaqtaiKciHZdZnzi+bQ8ylzBsuuQNmeAPFPn4EJ2lTtFRVaiUoEHyjeR7TTg
         4coqCMP2M5AyGmHTgZ5uRMvam2eYrSkpMLxzPBBBQr0Es+ZfsGyB8wNGBMrtIY96Oxlp
         qn0kTNIc/ovY73owYHcXJ0cmYs/85Sr8jovA6TeGlDo47AcgC9EKL1jM4fiGvOtrenjb
         paNPLr79B3HJEfDxeVugoOb3CaJCwd6f5dvSFWQSiWcV/BggRq7cYPBuisLR+B9DnCoP
         tzqZUiTqopA50eSqa42b1Q/Rk0O+hyII4hLDZq0aa8RJckv+I47vrV0R/Vn2gO0dlaT5
         g2sg==
X-Forwarded-Encrypted: i=1; AJvYcCV2e0Rr0o+Q2WigmazAgkU9hxAwtiVUFH9kxsMiVlL874fD7r7Yu6LIWqpqYAYJUAQ0RSkCYCYqd/OgLOX3LuZ/ykdaObpFMqg3xzemwgDY8Zq+oIOdZwKXbA==
X-Gm-Message-State: AOJu0YzldW+BvNweph8I55Ev9aGe866gLuGOGX/qkDKwnZ7UZ5Maft7W
	KQ+wJeioK23HzTpCjEY3ovqX2y2nvLMnRkX9votwaRu+et4j8yJraSTXAYOA
X-Google-Smtp-Source: AGHT+IFxUaPMRY83rn7f0qKoMkUcrqY1pYf3J1WRsf3hquET9SmXaTQ4F0wOZrQMjtl5zlfTrOaAMA==
X-Received: by 2002:ac2:5e85:0:b0:52e:9f7a:1512 with SMTP id 2adb3069b0e04-52eb99d5a15mr1007294e87.65.1720516080406;
        Tue, 09 Jul 2024 02:08:00 -0700 (PDT)
Received: from [10.139.6.226] ([154.47.27.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1ff9sm32278765e9.18.2024.07.09.02.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:07:59 -0700 (PDT)
Message-ID: <90fa0de1-c966-41cc-a093-d4f28ee3907f@gmail.com>
Date: Tue, 9 Jul 2024 11:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: OE-core <openembedded-core@lists.openembedded.org>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Bugzilla account
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201650

Hey,
Perhaps I'm really missing something, but how do I create an account on 
Bugzilla?

This page 
https://wiki.yoctoproject.org/wiki/Bugzilla_Configuration_and_Bug_Tracking#Get_an_Account 
a "New Account" in the footer area, but I can't find it.

Thanks,
Slava

