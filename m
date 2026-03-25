Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F071106B529
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:48:15 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21706.1774442893906702891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jhenEp6H;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cd80f56b27so598602685a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774442893; cv=none;
        d=google.com; s=arc-20240605;
        b=c8ADwBzAWtAgvDyn1ISm1pK8R8HgYVmQX1DW64EubWZCCNtY7XFBohbxmd9KsT03fB
         ndacJpzEULvkyE2Unj3qaI5Cs1He+dYzica2hGc7Sec7x8gwEIfRXg6HC/+i+GTLs+GH
         OKR+p9VBEAbiv6WG7F4NVmWGo1fS2D0Mqp9nlqWDzX7O+6diopQC5ZMsKcdmjOIoirlj
         a+f5Lm3iZZxoRCuGr5qZuTgnAUJDN+0R8H8wi6IDP5yOIR5aoKj4B1AbQUS32wPo+c7D
         pRQK8fcheE9wOjFlpXSBdVdKvjNx50YfDcUvNX15yu+3Py10y6gcDrQqv0D8yC/Qag29
         GCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BILM20A0bP7R7e2ZzixSJRzCpSmzA/Vjg1NkYuT+V0k=;
        fh=3dFdSa06sIBSurIbwyKgVgvfprkdWimgIZOm9DdWiG8=;
        b=LnbFuKYj4JP+Thiwcb/XMyZEOMhDfoH7dMIcwMxsmSufSd+q773i8AthaE+0G8gtB3
         iXm4p38k+EZGJHqONX82+FgGExt4KN9OWy5MvKiiTl0BTSbtN+9nTrwt/byyZkpTb7KX
         c94Sb62vjiUtWRPTkijQNR634Lz3alj+MLtGRKVASDnLmNUD87c/0xaYQSTMXUzte2VH
         r8tVXtu6s7955ywbT4xoU+AqJ+aP2IFucw7PbtifnWQ282je2E6RTvlfam7Ii02tPAyA
         dDETqZR1yH2LCHdNkSp8UhJjzrK2OPaJ/0G9JQFsvbEV3h6a5hYzvPPvPLoTbcAglTuk
         kbvw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774442893; x=1775047693; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BILM20A0bP7R7e2ZzixSJRzCpSmzA/Vjg1NkYuT+V0k=;
        b=jhenEp6HSb9LarFyCv1YNp1mux2mbU06qkUrXa0yVSJPHsCEnDulWxCwRr1god+Qd3
         TGbXOriUAHpuTAOdfIWMe54xWaTWSch/d0usLXjwPvhF99WrxpHBkjeUbei8hfpf6lNP
         /2SnJhxst8fBYQecwLjkT8RBIqcb7s1EBhOylzkyuJqBc/eeQZ5X0K1TqtoGaNQgE/Dn
         xO7NMZN750tgwEpzdY/nnGLDK62lckWkcTJ7aSuI9noi1Jf9AuwluWATDnpHnYj9sIkL
         9u4T3w7HBQFoS27FmViOa0uyMkeWWNqEblYLa5Lr3ETeFJFGUFiaSaydomMhpCKpiO2g
         Kj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442893; x=1775047693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BILM20A0bP7R7e2ZzixSJRzCpSmzA/Vjg1NkYuT+V0k=;
        b=Ujqx06jfF4NRqORS4d2Sb2a6UHNmVThZl7dnmrgJIwWeAn6aXGtr9YuMrd/zlK914P
         Y5sOVtn0HhWhZSMXkKO3eONC1XHUmzk1PWNft9bHiaCE2M7uyeXEc8mqehzqS6ygtIfR
         aQ6vN2NFr3hIbD98gnjijmHPZzs/q44lFfLcBik2m4IDspcV7UTFld4GJNspoKALKm07
         loDRFDGata+qacHFReqiT9vzoJlYZSROEcK6+HJz5PbJD8AqO6JxPMeRClKIaAf3g9RI
         hv0yHKm/h7gE0s/OIgo9U5PP0EkZdMn/LNpOybjBCQAhI6PLelSgdZioOFeoTVy9cLFa
         dIVQ==
X-Gm-Message-State: AOJu0Ywq4QTHdnJIvm7aSmLJfHNNMcsY6SbRLthI6BGnIWqnJHfb+dxS
	QiFsfBhSh1POm7NVPb8HHANJyPQ/mAWMfEmWj+EBO6ObwSW1g/CdZweoevZHuyLkf3c2RKPDNpE
	HtBoLDwgFohWzjzAbUsf2KohYu4FaLnw=
X-Gm-Gg: ATEYQzxo4F6QJXV8YMwMCz65JCsgyXVNridW2oxZ9DzxJ1cENCDFHFoU8IZs8NfGH/D
	EfabYnVzEb6DODAVpstmjo2XhrNZkKq67VA/y9chFXTe/9knvgNgnT9NeS6QrnZnFkqX/yDzxDI
	0Ok0Yrfr6KjfDuJni5YlDd0iN5vezTIAgwWS9xg9KEStTOvTxXRXTQmkTyUftXeyWX1mvKG14Bc
	j0dNJk/I1IGcv1pKLsJpJcluItY9EG8SPYv9clyy5KR+PiFxlh5R7QGxaBtDrJvUNIl9hpsx3Xj
	Q5AtaLQ/Wwq7KLT6VPlL0oGql9z/EFE0nGdGZGLTjxK6lh7IfRlD
X-Received: by 2002:a05:620a:2986:b0:8cd:7271:65f0 with SMTP id
 af79cd13be357-8d0010eff5dmr428358585a.44.1774442892711; Wed, 25 Mar 2026
 05:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <openembedded-core@lists.openembedded.org> <20260325022916.2379819-1-hongxu.jia@windriver.com>
In-Reply-To: <20260325022916.2379819-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2026 13:48:01 +0100
X-Gm-Features: AQROBzBq6VAkZ4nC6qDXa1QgXtrDRUl6_4nyIibgheQg7OWWDp9c8i6zy06oxi4
Message-ID: <CANNYZj9GbGP0Rc_SSL-Ux7MBUiQ5_u4fq9__SdaFZ8cVTvaYWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3-numpy: add cpu-optimization option
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233901

> +PACKAGECONFIG[cpu-optimization] = "-Ddisable-optimization=false,-Ddisable-optimization=true"

Same concerns as v1. I do not think this patch is correct.

Alex

