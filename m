Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E58C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:33:21 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.21276.1754472797609070297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HlTIqK1y;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-707453b0306so52665836d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 02:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754472796; x=1755077596; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qwWeW+BnDYYgkUJeJUOtzn+QgCseyoDIUBimj89yCgk=;
        b=HlTIqK1yVQPe76zYxpQbHJJGVoovMpj4NsteHw+gmRsDM3M12BUYSOzbkK49Jkd9B9
         Kc0Gc9aOO/l0hnLb6atOE8/QMXzyykUaJLetkEshmdKqTvNoOCkQXJ9W/z1QkLr6i0bD
         agB0b6Wn32vFHpF7Bmx8XlMnLnacNcyMW0e1lMCYdgj0aJMAcL8JdBs9aBfNtnG2I83g
         ZUKNDTJfd84YnRzKmBww9Fhp5bQb9925DknObJO4dOswx1CGs52arGehAEKm2vJT21rQ
         EzoT/fnaetxpnz1CLs3WCyHMJRRrSBtA3UTSsHFtshaN3db4AnJbBrXrLkYDPnWu4VJg
         OKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472796; x=1755077596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwWeW+BnDYYgkUJeJUOtzn+QgCseyoDIUBimj89yCgk=;
        b=R8I5F+icaK3y9LEiIGdzSdkbEOGDdlrI1JgopxQzqUF0cqvkN42YRyEH+DQ1tSFFBj
         vB90lZzCiyIpEcPEdc38Q7isQ/GuTrU1fgg5vqyM1u+yQFFdaDj+OkNuGX68AEk+GV36
         6XabdCp1VIGl+/MFREvBUOsps86kw/qDQxTrHZS659cig7dYsTzaespMVXE2SQCleu24
         wExODXIZDkDVMXxJHkWlFpOBlvVfywayDzqTZdZMERYH07vttKeH3StD+2EuiKL0RCAN
         CIH23PkfmTXJI7jU06eMuvnpESYTQsNfFS+zgrngnUIGqrKdNlrdBxjhy8xFfdhd15PQ
         Bqpw==
X-Forwarded-Encrypted: i=1; AJvYcCUG7ea/8TeGIcAye/Cu5UO+/PCsUUme76z1LGbKgw5kcFHI5LAi0jEu45TC9i2+0hwvNOTZUP2pH421Q6UlRVfY5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxr/oIXwSXUiEy0z0Z9oM74Cf3txOCV53pg/uhZRPYn41JNDjXX
	911PQJYr+Wgsql53NTgqBhrT5dZ3mhrIcQKb3u4hl7IilqawoaEcV+FODQpzdhcETJeyTtrq562
	mIhxn7t+JwPTcTppwLSS5rTMgGpdQJ+GQGA==
X-Gm-Gg: ASbGncs1UWsH8EMA1CKF9/QtrWSurS2VKOFovLu7LCRa1DaA19TkKy66qOwW/tNfq6q
	wHnqRT4YQ8inzCI6RNftnYfmfAE0Y9m97sZTgtFEKW5HeyHXkGQm2M+gegk2a6Gno5tUlQgLqa3
	wQ8JWgNwc78WhpHT2kMTgwoeAWS0WYXFSk2cHhiNv7PRr9Z3T15oh3nloU3y/h0id1vbq778VNq
	elRm5GhxTgHqrUSCfUjwBYm989CISWsdb2DBHMI5ZWquOdvWUMt
X-Google-Smtp-Source: AGHT+IFs85SxnwKOhcZ5ijyHn1fRoKvGE2fEtQe+WSEjuXPGfnOmNzV9v59uHGa4Rws98fnRI8/jor/yjxiUEUsylD4=
X-Received: by 2002:a05:6214:f04:b0:707:5319:d3d5 with SMTP id
 6a1803df08f44-7097af41662mr21835756d6.35.1754472796558; Wed, 06 Aug 2025
 02:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250806091849.785-1-liuyd.fnst@fujitsu.com> <010101987eb83520-e293ebe2-9abb-4125-a405-8238d321f6ad-000000@us-west-2.amazonses.com>
In-Reply-To: <010101987eb83520-e293ebe2-9abb-4125-a405-8238d321f6ad-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Aug 2025 11:33:05 +0200
X-Gm-Features: Ac12FXzOJW76aTahEhoclt7iynznC6lUS3vzyM1P-ueOAq2f7tIRcfJUpZgk0qc
Message-ID: <CANNYZj-NO9h1MR5mxaDrBiVEo0Y-N81ZMqfaYvXnuPYcQAd0aQ@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core] [PATCH v2] vulkan-{headers,loader,tools,utility-libraries,validation-layers,volk},
 spirv-{tools,headers}, glslang: upgrade 1.4.313 -> 1.4.321
To: patchtest@automation.yoctoproject.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 09:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221521

On Wed, 6 Aug 2025 at 11:31, Patchtest via lists.openembedded.org
<patchtest=automation.yoctoproject.org@lists.openembedded.org> wrote:
> Testing patch /home/patchtest/share/mboxes/v2-vulkan--headers-loader-tools-utility-libraries-validation-layers-volk-spirv--tools-headers-glslang-upgrade-1.4.313---1.4.321.patch
>
> FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 131 characters) (test_mbox.TestMbox.test_shortlog_length)

Note that this is only a recommendation and not strictly required, but
if you want, the shorter version would be:

vulkan: upgrade 1.4.313 -> 1.4.321

Alex

