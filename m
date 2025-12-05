Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0B0D2F7DB
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 11:12:30 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3183.1764933142665195215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 03:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0dSwqU+;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8823dfa84c5so20182326d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 03:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764933142; x=1765537942; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0d/LactEeJ54PBsJqTokI10peBIOUYoCK1JDrXSzBjI=;
        b=A0dSwqU+dawH1jN5UCdIxl+xMfxMvBTkdYqwiTBL8GtgDQRPw8N/MPFKKT+mJITD5p
         h7mbcrPW6LyCGJvYfADXIQoDURxsvL8yz9PWuXcqKSjuzUgv8V+AKL38otpqkNF46Y+Z
         jcnPhqIlNZ/5QyCeTzwhC2XGPAarM6KZUPtStHIqmQu1lh7Pid+H4jfv3FQCkXCBp/O0
         V67wGE3fjHVNnzxBR3I8JMI1uhdQSagHIRKSM6RW12P7fES4DwV+E95v2R/D5Dfu6f0z
         j6V7xIsil3WiP0MYQH2WfjtFuv9nCSBez5ULgLa8JlhbjnPdh9WATR4ll85BLDuRpB6t
         gzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933142; x=1765537942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0d/LactEeJ54PBsJqTokI10peBIOUYoCK1JDrXSzBjI=;
        b=AfR76yvE0xoMBqVxgS+NB6nhXVen0ffXVW8ByQe8BVlo8JdojZTGJVsZKsPCfZMI2g
         U4Zssb8oTuLjVnoFUyGfzd3et2tRVXMlanqsKIgY97wUtNOXgjbieme7br6Gvj59Pipu
         LN7tiPmdCkNPBUxjwdvDm0kR4YUfeVztKytG7hl3Ou467LwWKWLEy0QRy7jsqKum45zH
         gF71c66uvVR+EUq++zmotJdAJ+oPvRepgGiEXwVrLBHLVEYHwZGKBRxOEcJccu+1MBqW
         cXdTR87KRzjZCGpynQSKQe3Q/NgFH3PHKZXa6bplMaqzM0l05GVuPySS5aIgTFZ735By
         tnAA==
X-Gm-Message-State: AOJu0YzoWvXn65NbBomD3WfveEQRAu9YggEGzGT+bTKEy8eU4iDctFkN
	OhVnDI39cXzbboLqd/HVMxBcDNJzudWeJp/TA1o2qIGKpwqIYoZf3XapzvciVFj237cDx14207E
	BfUhGBgQYrhbzBP3vr1YbavTFAEPqXI4=
X-Gm-Gg: ASbGncsvdtX3zgpXouA6yescCgXvMN5cSEYR6XeUHglZYJwnotjaw0r52zEbf7vfbEm
	CfwHjZ8bbPszMrJqxlAmxk4GvnDM5uHAdM1uKkPo/KZMJcUYT3KdFIKSNTxlh6cWKUL3SrTPH/j
	wdQeXKqhGYN5nhYSVdv2MSvyaCo8QK3SrgrsXaFqhuW6gSRGz+SxW3k9KQaW2NFEQXbHav1ZSYM
	Y8ubXTKWi0McbEYDWchYXZwKoM0v0MY1YAg+vN07SmiC9UKe1QaQEHf1niA83TolDZdtDL2MMDJ
	Nbr6dWacgnUihkIj7zwr4SJrkNi5XA==
X-Google-Smtp-Source: AGHT+IG6vqjtADfBkTx8CCWR5I6Hjlqpc3EpzSQVaA3XVzyaIAbPhCEh6C3AQgcy1nVH/8tVP++rvGr1noJV7HrD3ZQ=
X-Received: by 2002:a05:6214:2c0f:b0:882:44cc:f587 with SMTP id
 6a1803df08f44-88819495173mr125590046d6.1.1764933141604; Fri, 05 Dec 2025
 03:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20251204180945.3112334-1-tgamblin@baylibre.com> <20251204180945.3112334-2-tgamblin@baylibre.com>
In-Reply-To: <20251204180945.3112334-2-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Dec 2025 12:12:09 +0100
X-Gm-Features: AQt7F2qsXNQfReIWfsNKJx23akaMZKqvfe6_ZMnPw3yAcdapeyCTNTMCmDtZFy0
Message-ID: <CANNYZj_u6QbzrytPkMkevKb2Or+nwOTQkrB2zpMhD5rQxRW3qA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/6] python3: upgrade 3.13.9 -> 3.14.0
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 11:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227349

On Thu, 4 Dec 2025 at 19:09, Trevor Gamblin via lists.openembedded.org
<tgamblin=baylibre.com@lists.openembedded.org> wrote:
> -@@ -548,6 +548,7 @@ class TimeTestCase(unittest.TestCase):
> +@@ -551,9 +551,17 @@ def test_perf_counter(self):
>       @unittest.skipIf(
>           support.is_wasi, "process_time not available on WASI"
>       )
>  +    @unittest.skip('timing related test, dependent on load')
> +     @unittest.skipIf(
> +         support.is_emscripten, "process_time present but doesn't exclude sleep"
> +     )
> ++    @unittest.skipIf(
> ++        support.is_wasi, "process_time not available on WASI"
> ++    )
> ++    @unittest.skip('timing related test, dependent on load')
> ++    @unittest.skipIf(
> ++        support.is_wasi, "process_time not available on WASI"
> ++    )
>       def test_process_time(self):
>           # process_time() should not include time spend during a sleep
>           start = time.process_time()

This adds unrelated and/or duplicate lines, if I am reading 'diff of a
diff' correctly? The needed skip is already there?

Alex

