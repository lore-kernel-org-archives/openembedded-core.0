Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238C1C5AD5A
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:19:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18977.1786317585244395473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DhSeMhS2;
 spf=pass (domain: konsulko.com, ip: 209.85.210.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1157703b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786317585; x=1786922385; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pTsIWvC7IOnQ533NLXByQ/qX7+6q+gtiHVsSv8G0SnE=;
        b=DhSeMhS2a/Ar8TYi+p1zYRNFVaQVm++DNeqjpdDd11pcIbaqwAS6UFDbDyg01+BCsC
         EcGHLkeWe7MqWXSY0WxcB3BdF8NxbYdAaKZePWZ8MrM3wDTpNqzYYD0z/Eyp14FYfAIx
         BoIydBxXvwwFhYLgf3cZaFBjlGpw/ByZL5jTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786317585; x=1786922385;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTsIWvC7IOnQ533NLXByQ/qX7+6q+gtiHVsSv8G0SnE=;
        b=blpSxwaIal3+AMwZBDWlRQCTk3TW0uHWRqk6rNBrpHsqpSjMl0/0iOURsHibiMJ27r
         x67u1JmFGRKJ4fJlHi1ScVHCZZtZ0BU/p3Iltz/Zn6q5KPr3L04ZFLCYe35Nyyd3eMZR
         C0FYeu0BTRP/jCGEtsIfJ0Xl9z4FGWObnlnL34GhUjHvl1pZcQLzbj4BNcpQanm3hDoD
         KDTSOR/wMqFbyFJMFpAjQ7L9mSKnn1GKhe1J9sH3Md564TDnT7rkovy2iL9cBfiNit4y
         kva9fnQydVoaTFPc3pxSnfZFSIX4gTU+WuDk3339rFc8mHM9sip6zKUOnKqhPAnqffBE
         pA8A==
X-Gm-Message-State: AOJu0YyxNkzWTK64QEe4KtZwkusKrFOyfZwsXsUrJrJTD5knqRXz585d
	z1DpIqCEjniir8YIwwKpcIvfQmqLsos7/GWypeNF+nl9lk1U6T04h9xwL4ZKWR7gtIPF3wqVIkK
	4myYP
X-Gm-Gg: AR+sD13+naTAek6TSb42DovK9cJdHo4ec94Nojn0E7R18h8uq3W5G4IQjW3sUP0Ho2J
	AYQMS4O3PEbOtc6mMcGtliCQjmOecV9U1p+5NXCNhQlxCM/F+cMzRgOJdaPqhJwvCyl/315zJkq
	VyKIcjrzADtL+TP//oh/hgb/oUUnOOkuUQfINiH3o+CXM3znnR/TO5coNqccWsVrv1FQJR8mH8x
	KEYpcd9pfEgQ2m+bgYxpIYbEI07oRgz2UdcMT22Z08BNGsKxmBvHR/DiwChiqNSZ4cFObPKAykS
	PqyejnGiHOAcFf3f0knOFi+tvtlknwtAdRH6FgVZSOur7fk0z49yDDz6QkHoz6TXCb+X1vUs/hj
	+lCyHD1OSl6YqM9upezCg7mDrXTKvc4TobZ1TB7iQ5KnD9d4cDV3ZDOFENR8nP+N+fLZt+a3NIg
	NbkfwZv6CFtYh2iQZv2KYjKhanMxOmUb49J4XKapwhJlZ8z9u7fcZ2c7ztcO7Ma9kTYpPMc8mX8
	CJz9Q==
X-Received: by 2002:a05:6a00:2985:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84f696a146emr17783044b3a.24.1786317584600;
        Sun, 09 Aug 2026 16:19:44 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58998bsm2976866b3a.55.2026.08.09.16.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:19:44 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/3] pypi.bbclass: improve UPSTREAM_CHECK_REGEX
Date: Sun,  9 Aug 2026 16:19:02 -0700
Message-ID: <20260809231901.366919-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809231901.366919-2-tim.orling@konsulko.com>
References: <20260809231901.366919-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243081

From: Tim Orling <tim.orling@konsulko.com>

UPSTREAM_CHECK_REGEX was case-sensitive, but PyPI's simple index now lists
lowercase sdist filenames (e.g. gitpython-*.tar.gz) for packages whose
PYPI_PACKAGE is mixed-case (e.g. GitPython).

Added an (?i) inline flag so the regex matches regardless of case — this
fixes AUH detection for python3-git and any other pypi.bbclass recipe hit
by the same upstream lowercase-normalization trend, without needing
per-recipe overrides.

This will not magically fix fetching, but WILL at least mean AUH will
detect more upstream releases and maintainers will see when the
resulting default PYPI_SRC_URI is failing.

A fix for some recipes might be to set:

PYPI_SRC_URI = ""${@pypi_src_uri(d).lower()}"

but it is premature to set that globally, as legacy recipes with
releases before the PEP-625 normalization still exist.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes-recipe/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index bd21557c60..0897994bb6 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -51,7 +51,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE ?= "${PYPI_PACKAGE}"
 #
 # NOTE: All URLs for the simple API MUST request canonical normalized URLs per the spec
 UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}/"
-UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
+UPSTREAM_CHECK_REGEX ?= "(?i)${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
 
-- 
2.47.3


