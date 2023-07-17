Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E89BEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 20:16:52 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.5256.1689625001695637427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 13:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=q2OCuXPC;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b74209fb60so72475361fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 13:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689625000; x=1692217000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMCp4hyJbpS2dmIbK3cAzzZy0NJetGxXzNmVEgH8xXI=;
        b=q2OCuXPCqwxEsMMLxbTwrpczmS6bWObivElUlkiy+v8zzFc1UQ+2RkX2DCvnnVRIwi
         ChyqZHCGwPnXeGWM+RO8kk+XmLBYK+es+I5r6vzYnaX1WRKeIcIql+sj39cl5fidy+ur
         1BJyLjV8KonImJ13ut9kIhwsacZOe51BoaqwqB2gWl3UbX1va+UfcrVbKt4Ulg2y8gSf
         NKP4Pm3jz4IldUsO9dWUDF4xICWC66yfoxInLeDnKJX2XiA0MN/VK0g7pMGd4q90WgSk
         tXlbbXCCXVA3DsHMX1iaXgJ2dyNwaW6KvIvIH7Cjap3ewkhys5QeLtOAmZioGb1HqRGw
         SbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689625000; x=1692217000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMCp4hyJbpS2dmIbK3cAzzZy0NJetGxXzNmVEgH8xXI=;
        b=dziIFoWBsvF//9T2n7U3iO7P3R9hWJv6Tij+URqFjdQejUBG0a8wtsLlFOIJgBXWSU
         rmVOmvQn7oDZBD0bIko6H8URi5pzDTxcyamMS5T/QVjvVfqtY+pq0eX/JW4eXOXXK2YH
         44/IoVQNNHTjNw5GhtJLSqpBpXB+mjvpBoA5bad+CI0tKJeDwECB5iQA1LSJCeXMYjiK
         p1BIcD3RlPK5fz3rVeLuqHz/OzjynyP3EHfZ6yn/yvNAFq9izWIURCbTEqPhCNAwN4qN
         uLlAtRveSi0SXzQLFHM7ESNDoSmrBcmPh425/+2bZmaKqQABFntyVUgVXavQW5pe6Pcs
         U+Qw==
X-Gm-Message-State: ABy/qLbJiUYjUIwcmuVh5ouaXBuMuYeet28+rP16Lss+tP7CUia5npmt
	aj6lYvd9PS2Ypu8ogCZdJKyKS6rR3IOe+l1eihw=
X-Google-Smtp-Source: APBJJlGJNNDFQjSWzoeCeZBbg2gKdnQUhvmEPsWDtH+QANlA1NyUrQxEIgQkZ0Fcn5aq8sAP44wt9F13g9OsRZ0LeA0=
X-Received: by 2002:a05:6512:602:b0:4fd:bec3:776a with SMTP id
 b2-20020a056512060200b004fdbec3776amr2209225lfe.61.1689624999591; Mon, 17 Jul
 2023 13:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230711172545.738677-1-tgamblin@baylibre.com>
 <CANNYZj-7ZzO65GN+_X+peMDFp31Q1M9Tx8OEfj0p0PS4VB5Ecg@mail.gmail.com> <c42e28fd-7c9f-ed6c-d2f7-8b0930233808@baylibre.com>
In-Reply-To: <c42e28fd-7c9f-ed6c-d2f7-8b0930233808@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jul 2023 22:16:30 +0200
Message-ID: <CANNYZj_hZVaTs1JR9FabZW2cbVQfW6hSqwfHcTE8z2X_ONddJw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: parallelize ptests, add test_cppext dependencies
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184478

On Mon, 17 Jul 2023 at 15:06, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> AssertionError:
> ptests which had no test results:
> ['python3']

This happens when the test prints no PASS: and no FAIL:, this is used
to catch regressed ptests that don't test anything but don't return an
error either.

Can you run run-ptest manually and check what it prints? There should
be at least one PASS:

Alex

