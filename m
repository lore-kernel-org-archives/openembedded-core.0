Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E06D2F7C9
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 09:16:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1865.1764926195318639696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 01:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvrJLdo9;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42e2ddb8a13so928653f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764926194; x=1765530994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/u695ork99wnBtP9DANi9PYTKosfDJuAvrZS50imfI=;
        b=bvrJLdo9v0CgSMUE8OJ6/OETG9HJLkdTd+ov0rc6llzNvTts0J1Abcv4wEm8qO4tse
         6+SG5m26NhOR0m/APqhvtyC/Pu0MJ+6gibAlVcjY6LWn0n8aR2pmGWY3YWjuDBZDMELX
         z4is5bW0knRFd2vLgKD5GDznpZOjr85ja8JETFjzcP2FRysLXmY7jOvW8B3CNl3Tqk7h
         h2V+l5FcJnShrJiemJBfGXgCdWzDmCla1tbY8+JfEH7DmBZN2jb1KdAgls0c0BVr4f6s
         sc7Urj8cGAJZs4NtYriVhxYQYxOYN7Z2V2We2OhHQmm8QUA9vAlz/u9YWGeu0FtnxkKu
         O2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764926194; x=1765530994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/u695ork99wnBtP9DANi9PYTKosfDJuAvrZS50imfI=;
        b=JdyXe8xph6i4SrHHe/Cbxun9pCDN5Hkmmj6U00ynF8LbihFlg7Zl+4unRgfYGxkFhu
         T1F91LjZytDDaO02xDkXfY7WGY3Cbl4W5CbuR9bQusjGGiWf7+RzfSD+dyaNS5q1LQZ3
         43sTYPWJpWgbJrELDX0nBf3lFgMrKQhEupXi+HrV9CIzG41acHqhw1Ki5nmAW7Y5eWSh
         I2Tkx29xcyA6syQyjBWLsnonbrKxVeo2PLGMhbwNcpxThLGane4w5kb99b7lwPHnqTZr
         KyZPrEzUrdLYUwGyYYX0mp23iHuKrrdbH6R5Ptu6DaNmZ0iHxSTmBys3arqNtMMaRfXF
         ADRw==
X-Gm-Message-State: AOJu0YzXY8yxIqFaIxn4Me0qjrw/Ui4i+VBc1+BgOPPDsJ+NkTlFiiVo
	ZzOyxeSIWfWt0q2T3p8oNEwrjExO5ylbHGBpf/Ky1nEmHNbSijMaO7ZQjDCt5g==
X-Gm-Gg: ASbGncvMCSA9xTXhdDNDqDnBLQ5W3ZMBIodY+xt6EuLY6HN6kG3S55B9gEPNzZv34KL
	UHO5aAoq669EuVH/sPryBB+UPaS/wADA2h1QDCRu2FB3lFn0JSBOlDrfxRVJCd/6Av2W2kyMXYr
	n0hwhLTZ6zEmQ/NNHynfKR/RT9blDyapysfcgLNYN5cXB5jU/WlisPz2SESe6SDkIyRrF5d0sza
	geIlxj1i5rPByF7gH3mXbwlm40Sz47a6Oyun8J0qIZouoB4LVeCG+RHcrBqjPlgpISRgKsuoYQ7
	RYaj+BBbBz0EC8IRDSV1cYFxu9GmVvfxirkuAFt9tHkpQYTy5JpaEvc4YMLzMSWKYYhqdBfsGHB
	1jOOtvC/IVuh5O3TT2yLKZb92HrPUKO3LsQMArbthUsOTbHcvyHcgm2wPqbK0uqPP73sUkTaY54
	XQruB8Fzb0
X-Google-Smtp-Source: AGHT+IFaw1Wi2CV8NKZU6nY/KX5nR+A/6wz1N8OLS2JKC3mhZ5qhZzJnAIVuc6J67uhGpwRdGONIEw==
X-Received: by 2002:a05:6000:2389:b0:42b:5448:7b1a with SMTP id ffacd0b85a97d-42f731c427dmr9670770f8f.39.1764926193360;
        Fri, 05 Dec 2025 01:16:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f80sm7786260f8f.41.2025.12.05.01.16.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 01:16:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PoC 0/1] LLM enriched CVE entries
Date: Fri,  5 Dec 2025 10:16:31 +0100
Message-ID: <20251205091632.1268768-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 09:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227343

Hello,

tl;dr: This is a proof of concept about using an LLM to enrich CVE feeds. 
Links are somewhere down below to see the difference. If you think it's 
useful, please say so. If you think it's not useful, please say so too.

Motivation: the CVE checker associates CVEs with recipes based on the 
CPE information in the CVE entry. Unfortunately there are quite a few 
CVE entries missing this information entirely, making it impossible to 
associate them with any recipes. Looking at this year so far there are 
over 66000 CVE's opened, of which over 15000 are missing CPEs. Though 
older entries seem to have better CPE-to-CVE ratio, but for this PoC 
I'm mostly interested in the latest vulnerabilities.

The idea: in case CPE information is missing, try to derive it from 
the human language description and the reference links of the CVE, 
using an LLM. The intuition would be that a good portion of the derived 
data would be usable, and even though it wouldn't be perfect, it would 
catch more valid CVEs than without it.

Here I would like to describe my experiments and experiences with the above idea.

The setup: I used a local LLM with ollama, running llama3.1:8b model. 
The hardware is Ryzen 5950X, 32GB RAM, RTX3060 with 12GB VRAM, 
running EndeavourOS. The prompt is part of the patch.

The initial load takes a very long time (that's why I restricted the 
amount for this PoC). Deriving a missing CPE ID takes about a second. 
My initial approach was to work on all post-2020 CVEs. It took about 
an hour to process up to the start of 2024, but it failed during a 
test run (due to a processing bug in my code, the performance remained 
unchanged). After fixing my code I rectricted the CVEs to process only 
the entries from 2025 - I wanted to see finally some results to see 
if it makes any difference. Processing the current year ultimately 
took 280 minutes. (I have also skipped the CVEs associated with 
the linux kernel to speed up the process.).

It was using 2 CPU cores completely, indicating that it could be parallelized, 
but looking further it turned out that my GPU is the bottleneck, it was 
showing 96-98% utilization with nvidia-smi, and ollama was using ~5.5GB 
VRAM. (Another idea would be to group the CVEs before sending them to 
the LLM, but it's untested.)

During processing the entries I noticed that the model produced some strange 
hallucinations - I did expect incorrect vendor/product details, but strangely 
it also produced incorrect data structures in its response, like instead of 
"CPE_ID" key, it returns "OVP_ID" sometimes. This seems to be a problem with 
a very small portion, and currently I drop these. It tends to miss some asterisks 
also from the final CPE id. This seems to happen quite frequently, around 20% 
of the cases. I've heard that intimidating the LLM with some F-bombs in 
the prompt helps, but haven't tried that yet - for now I try to salvage 
the ones that only miss 1 asterisk.

This also means that this CPE-derivation is not 100% reproducible - but the 
idea is still that only a small portion is not reproducible, and we are 
also only interested in a small portion. And in the code you might also 
notice that I do some postprocessing of the response... well, LLMs are 
like that today, I guess. There is no free lunch.

There are some links with the actual results, executed on a few days old oe-core. 
Only CVE-2025-* entries were processed with LLM:

Without LLM, cve-summary.json (~30MB uncompressed): https://sarvari.me/yocto/llm/without_llm.json.tar.gz
Without LLM, human readable unpatched extract: https://sarvari.me/yocto/llm/no-llm.txt
With LLM, cve-summary.json (~30MB uncompressed): https://sarvari.me/yocto/llm/with_llm.json.tar.gz
With LLM, human readable unpatched extract: https://sarvari.me/yocto/llm/llm.txt
With LLM + commentary about each LLM-guessed entry (LibreOffice Calc, I recommend this): https://sarvari.me/yocto/llm/llm_cves_with_comments.ods

This patch is just a proof of concept.
I'm not sure if/how it could be integrated in the project's 
infra - especially the initial load is very heavy, and the patch requires GPU(s).

As a personal opinion, the final result turned out to be better than I 
initially expected. But I can't deny that it also brings noise, especially 
due to missing/incorrectly extracted version info. And of course it doesn't 
make the CVE info complete - it just extends what we have now.

If you would like to try it out, I recommend to delete/backup the 
downloads/CVE_CHECK2/nvdfkie_1-1.db file before trying. (Delete it after trying 
also, because the patch changes the schema a bit)

What do you think? If you are not completely averse to LLMs and this idea, 
I could spend more time on this, and submit something that's more than a PoC.

Looking forward to all kind of feedback, opinion and recommendations, be it 
positive or negative.

Thank you for coming to my TED talk.

---

Gyorgy Sarvari (1):
  cve-update-db: bolt LLM on top of it

 meta/classes/cve-check.bbclass                |   6 +-
 .../recipes-core/meta/cve-update-db-native.bb | 138 ++++++++++++++++--
 2 files changed, 131 insertions(+), 13 deletions(-)


