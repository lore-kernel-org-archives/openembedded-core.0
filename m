Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D2E104950E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:10:59 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16882.1773220259063668284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ex4Oe4Gx;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-509006c070eso38456091cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 02:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773220258; cv=none;
        d=google.com; s=arc-20240605;
        b=a6BDmDypn31sJTxqLX99k85KLPKDBn+fSER4Ev0/e7lgl6UJiF8xtaP65Q/a2+InyD
         3NIxovBhl6SfjMAyUKKCRfNS3ixeWv/mvdy/Gnp5isLk0piFBiX5+2LTp0Y9lQdx9hGG
         WUGoIlCZQs6JbCbcMz0Fd0S/BA7/V8NEqihGRwFC1LTJ5O8dhNVR78kYH2y7E4hsTQYZ
         o6asOAcxto9/eaI/mDIgbaGG10rA5AdY4BDwczWX5vfu2tJjqkFbc16wPILzmMHR679N
         oyda5hyzPE1yEIpIZzIEwPpBs/b9Zn0mdg3rWGGJcY/xcFyA63crMieH7nlkYuo+4IxG
         3R0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mI7vkCOgx9gE9rZnwAWIko65LYGrMlvkvYaIvnKvH4Q=;
        fh=DBggI1vwST8sHZz5miDAs3Kfl5FaV5CpuZRclKXf2+w=;
        b=NV1Ns10cjcZk/X0W1xZcWni6/aBxF5xZG2brnonITxzCiJNpPRDPx/SfVdxy2zove1
         o2qjJe62SViZp3uZOPDNfsSdDRFWUPrIgFnhZ5A99eohkYSqN2R1nM03yvcN1jz7arXD
         FKRzhBPO8lnjcy+MrekfihEb+2WoDGHacMZ/XkcFfPRCzzK9j7mC/jrG4L/PfkzYhJIC
         3GgB3j1pO6pPHVIe09AfPpGIBPMlG+vQjQBXZ5/WGl1W0ORcd0bsWcoD4rTHKSBgifRC
         5F2z5Tq6xG7kGGSUWnZ2inHyH2MdkqBEzWpbhdu0Xihdnp5wNtrhSNVjFzC4E++4k7VW
         ay3g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773220258; x=1773825058; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mI7vkCOgx9gE9rZnwAWIko65LYGrMlvkvYaIvnKvH4Q=;
        b=ex4Oe4GxXD0j9fjCtfE7rJ4uE3tF6Q3bW61x5eLa+xcHeZIRTHzxgBrGj19DB0Eb8h
         305BsFTTYok5X16fm5tx8VEwDhas2FjH+mSiwZyO9iCXyJxWhvhlbkqbjGMLnIdeEvRo
         VKm323uVq4FRF3IkG4473CUNqiXIIHwkcrzqvIMQEmiBHcJJGXKCIFO8wCjtSinx/Ffo
         QB1klGZuKHhsm89c2ySerSqi8bTBCAYIFwyNxmHk5IRaX38RVAXglpBI7nquKz9s7v6O
         y+WKbtUniXeh75uOU8PN73VroS0yoGFAB3Nynr2w1hEves8ymsHTWPMPKvsgIS9E7E3w
         s2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773220258; x=1773825058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI7vkCOgx9gE9rZnwAWIko65LYGrMlvkvYaIvnKvH4Q=;
        b=n88keALkOddLmHC33ijvy3BARn85zd4kAbQQ9qwOiUJ+ynjFM5K1bHFe/uMQYtN4tl
         5P25QO4MysH1d8X5RDxODbvRLuraGAwL8n1zu7ZcoDBNbQtCnGb3AHpDUmruWfTPQ6hY
         IXFDfn2HjhLY6oPbj3tSZIR0PXc74Y26tHcSHkDuYKLk/gC3bmfNEqUZcW0ntQmHNpEH
         PeC/bLC3tpcqhZQxTysu6Mb1QJR2OnU5P2gws2RK7WSAV3nys+Itf5321j74BVlHZEiy
         Ql3Xb2qZhmHbdPhqvHfvs99FvGWdIfOOnh2hWp3PSYhWBIKtvage8DGzE8XaasfVBGsT
         XkkQ==
X-Gm-Message-State: AOJu0Yw5F0gcruhcQjMqu6Rrc8MRza2khTvfwRdP4/z77vWDk9Ns0H6l
	O30Z1svY3IDbXfqxTS4HhiYqUDPzLWg+Wiz9E22bLfmd2yH83ZSFRDSwY5LUMGoxT62eiWKr9GU
	sLpHfcQCYUn+0oAYjkOE7rWOM7Wu7yjlPiA==
X-Gm-Gg: ATEYQzwqMhbOtKaF4MNQefcOtASzs/t1J8rjY4mqQEP7vakFlhQaR4nScm9hZ5LdBqQ
	OsSxhs+EgVx3tYjxCZW6aRPc7G646JjujIMvwJvzb/xuEpTogD88SQ/oOFHogCOg6QCxgYlJtK3
	kTWShGdFRR2/l1xopkdTW7FWKqMtjigciaxs4QZ5zcX7KEfo3JuaV0e81wS5wiw3l9BachWcfw2
	bM3QmIMO3OONwdEZnRXOUtLBHlnhgbrWs6jcl9pbeGE7xxlf20ZWPjcueGHDMD8Adm2ml+RUMDQ
	LOy5OKWLrB/27aq8ExM9lhdD7BBhGbcysnZjtA5FVQ==
X-Received: by 2002:ac8:584c:0:b0:509:39b5:a97d with SMTP id
 d75a77b69052e-5093a1cb3a2mr21070331cf.68.1773220257908; Wed, 11 Mar 2026
 02:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260310181354.2396448-1-alex.kanavin@gmail.com> <131089.1773216425426295510@lists.openembedded.org>
In-Reply-To: <131089.1773216425426295510@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2026 10:10:46 +0100
X-Gm-Features: AaiRm538f57p3JG3KYa0R5nPpiLAkjx-S2usODwMs0wGqvuvcx6cw3iXqiAakak
Message-ID: <CANNYZj9qxB+81hVcnyNWoodrP-tGM1beuxJJK4xt+fkma3zvXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: dynamically link with llvm for all rust variants
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232846

On Wed, 11 Mar 2026 at 09:07, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> This change need tweaks in rust.py and rust recipe to support multilib builds.
> Without tweaks rust selftest and rust multilib builds will fail.
>
> Required changes can be found here :
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=deepesh/sunil-rust-issue&id=44ce23e12e411ef9a1724e79c2b6ac6d5f0ddedc

Right, can you rebase and send your version please then?

Alex

