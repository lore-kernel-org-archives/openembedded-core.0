Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E661FCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:40:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.800.1761838825017441232
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 08:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8LhElSU;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4298b49f103so506617f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 08:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761838823; x=1762443623; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=toU+RYX6rMnkx8CX5Hpto/NKVCtaWm/iNcL67kl1X44=;
        b=i8LhElSUS0JkFIEDOAwYKWZmeDGD4ncUc+9BqbkaYkd4FhgK+p215rSYIhhV6fVkNk
         LCSCtyVqj/4x88bX6A3ArVpfBAFgKQp7QF75b5y237Dx0RllWNx3h+UH05Xf6/woGoai
         WoSsTw4buI0Yo1HQLTevWfAy+YMD/uioi63UEI4f/o1bIVWsvcK1S45fC45ezFgQOied
         9Lyj6DF8xcWIVuWpHgASRPy9sPJm3ejaqGpvWoRrkrrykTyOpK3fjtqvOYbBXWqRqIha
         m0fEvcrjBsqP/0Q3L/jwTI1HPDn/gE5AlAUgeSgQ/Z8MH8Ne92kEcMRZB1iTbZMSQ/An
         dkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761838823; x=1762443623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=toU+RYX6rMnkx8CX5Hpto/NKVCtaWm/iNcL67kl1X44=;
        b=fcMXsLYipCZKZMBo+M0Ys3TXN3GDBbeEs8nziUqas7or+ODk7Q7BBWbJ9cTTyQvbsy
         ax6w8OWbqRQPSkQfG2rRnLk1ztcjZuV5+pbDZrjvcqd6m8WJeNqM0wSmhlJRN4cbtzXp
         /VB4sQm7p7nhn0KQNGQnvsJoe20VTs1T7OHqdBGlEOB3h02QAkd/l3cFCmGukURc7vcd
         Yhky+P665KV6Z5txBqXM3+QLcqoeNTcDDl/9/92KiHAkfsjmEFibP5rL8YN2evdYO5Nr
         zp/VgPOGcjCnPAJFu6MG2X+7sNiHsMdQ7o6EOu9Ot1iBPpIhH5q59H9HFCkGemLPB50P
         XzDA==
X-Forwarded-Encrypted: i=1; AJvYcCX5uUUwKZ/cN/RlFRbseTVVzEtLL9DslcvLR6piPDDKsVdb7JCz4fpIieRBJozR+wRKy7actXT0iY/i+ykZYzV6ZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPoE4k1gUwWcqriyT8xuw/804BcC2c40dGZm8/I6okl/WsFe3F
	w3vfc0k3nt8QobLDxMnJCdED9CNn3j6yHDIT+ODit5+FdAPwDXZqzk++
X-Gm-Gg: ASbGnctBcmPTIfCHGzl1igo64GrLEWXTF4vstRTvP5+aJtpYW310CFZT7IieXqQWysI
	GPQD7mQ9My0iPog9vo/T98l7F4Zm/IfwRawOykRhi1pMRCu1MBTiAqKjO1rdJALIhy0aLr86gAv
	XYEzvvddOehZxHTYcniZX66BWl+1i6jH/Hn5BKITcXYXvJjIl3RXnIvj0ugutmyu3FJPWP+cIoq
	vy8/sdcOzgF78YO7BxblXKl3dJqVNgcWMbwkTS8gmO8rWhuZgewogWG6LPbZXlLIVqRmI+hZnbl
	BJGJBGrT3Q/Stw/4Anr28tQRCIkhjf9Z9pAxlTnkial7gV2woWsyTrDzQDEcvYmtA6RyPDg8edJ
	J03snnLl5KfS0ITmjT0+SwvSOHeRT/STN+ATS+8AuKhENkrbRs5w1j358Pjvmq8CvBK7sX/EOUc
	DZf7RHi77v7qeRy50oSdw=
X-Google-Smtp-Source: AGHT+IHNMVdQK8S9tylHJMfGaJJ9+OyRLq1xp7UWSBgN8XdRbEgZA9cHk8i6e/bkMSpowKgwrAngcA==
X-Received: by 2002:a05:6000:400b:b0:3eb:d906:e553 with SMTP id ffacd0b85a97d-429bd6b0fd0mr1608f8f.55.1761838823141;
        Thu, 30 Oct 2025 08:40:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9c6sm33320881f8f.36.2025.10.30.08.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 08:40:22 -0700 (PDT)
Message-ID: <ce4ea336-52f5-4da4-8180-f535039dc4b1@gmail.com>
Date: Thu, 30 Oct 2025 16:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta][master][PATCH] socat: Update LICENSE field
To: nmjain23@gmail.com, openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
References: <20251030044211.607841-1-namanj1@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251030044211.607841-1-namanj1@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225501

On 10/30/25 05:42, Naman Jain via lists.openembedded.org wrote:
> The below reference clearly states that GPL-2.0-with-OpenSSL-exception
> is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
> Therefore, update the correct license. Also add LGPL-2.1-or-later as
> socat uses it.

Is socat under LGPL? The only LGPL part I could find is some .c code
which is shipped embedded in an android specific shell script - but
maybe I'm searching wrong.

