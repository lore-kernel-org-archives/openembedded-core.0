Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4B7C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 09:39:34 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.7636.1742290766130702405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 02:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TSD4TfzX;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd420f82e2so71511086d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 02:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742290765; x=1742895565; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L1wqBM3e1FYcejfSQ0yxRb5EGyk6bXhWfRB/INrt7dM=;
        b=TSD4TfzXbedaVsOHflei/1YGyZsVoq1GViF3ObDs3wy1/eFcblmLl0NHloZBwVGqBq
         seZqepHT4EMDo+L5qJeyr1WKIKrg8eA6p3KlPTdjxd7ApdHRTlq88sGECyhCwwDEhQK7
         QTcJfEqQ8PuqPqFVO3yBWY0xeRd/lbuP3aDkqWGS8VJUE1B8KD4FVUx/6q5v5DS6884N
         YpuuGZKgA22jdC42AZWS0V5lb1A4scSjasp1f0zKJmPfs658TYxo/V8HeNiMDim8QEbp
         3kJuBWv4EsirVGgkwDKFmFbdpHunCVgR/77jqLLyNvr5yicPGLTVJ7BcVN2EdCwtHVcA
         lQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742290765; x=1742895565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1wqBM3e1FYcejfSQ0yxRb5EGyk6bXhWfRB/INrt7dM=;
        b=I13UR6ib5/5QSp7JX6S8Q+NN8D/Eh7BOV+P1ZaPfXU+i9s1NZhvVbVQbXUJaihdoAk
         I2eMWAe3U8ToojkZHX2JLwOyoG17Jug7K+1CaVQV0bBlpdqZFtSf1aLgHGdOYgfv1rdd
         hvwJtzLttBfB/qAejAcVKYxIcQKbI2GvTob0Xqohz1tjnFf6IzNeTFNIkXQ2pNsKoKAS
         kf3aqReFKTPyHTXf4WFKnoScFgeTkaplA6AxyfphRnOwVkAe2CodCza6tbzHfz9EhvDJ
         fTM8GvS6uO83A4oMHfsVzft1QvRkrld51U7wMLCy0MTomcxjOezm4wbZDk4ZdwchPTyq
         cuIw==
X-Gm-Message-State: AOJu0Yy6u4WsKwF5RsuZHjZqu3hhtttpYrjT/1xAoh3KR46fO9DCh03v
	stR3wOdbEBGf7kGxoSzzu86BQm9hlQdQ0/Cy3SnaJ0jvUEYqbN4o22kLHNBGsr8uYDcFE5pA2Lo
	3ffmpoBrQWDcfgLZ4pt6cmhWaB4s=
X-Gm-Gg: ASbGncuBNjBmpeNySHpBGuGEtNPf2UQvDrJZr7oKr/UeZbb85ygV5u1G14tbN0kb3ud
	xIi+O0STwxqVwg6ATqPQEZnY7Y54OSsIaF1aqnJHKC1y31FoVh5Kv6viZmWTmCPPfFU9d60SCIC
	+to5SrWpDAv43Cay9RH927quXQorcKqfJS4NqEOMU22f+eZlh3UNaZqRMqz4PC
X-Google-Smtp-Source: AGHT+IFYYHi5CAAVo4zJLy4c4AK7L9nJFLa8DCuUXz8D2X9mUe4NKMeSZ5SvGUer4lv75Tcdo+/SkZwBD2DEgyGlpc4=
X-Received: by 2002:ad4:5f4b:0:b0:6ea:d033:2846 with SMTP id
 6a1803df08f44-6eaeaa754bbmr256349986d6.25.1742290765154; Tue, 18 Mar 2025
 02:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-8-raj.khem@gmail.com>
In-Reply-To: <20250318043846.2422141-8-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 10:39:14 +0100
X-Gm-Features: AQ5f1JqMMrHdmB3xBs2oQXhpmQyYBlvbrdj73-2-IncJyZrS__-Amj4f9hGtNdM
Message-ID: <CANNYZj9+PPHxyP8JMnMqy=cvunVBObcdPu+41Xi=z_NEs+xzEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/24] readline: Fixed build with GCC-15
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:39:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213191

On Tue, 18 Mar 2025 at 05:39, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +Fixes builds with GCC-15
> +Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
> +
> +Help getting packages like bluez5 building
> +
> +Upstream-Status: Pending

Please no new Pending.

Alex

