Return-Path: <JHarris@westell.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCB0C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 18:56:04 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.2441.1715799363757609294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 11:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ekeXVKhV;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: jefftharris@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-43dff9da88fso35508161cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715799363; x=1716404163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5kx3QhVdZ/bMaqEaPCOreM5PbVEpuzhijHoo6Z1RS4=;
        b=ekeXVKhVgGrKttccO4qUXCbJTc9CL7zUj/4U0H/UxdgPeVruxBWbhcH2fTECJyAwQZ
         Bx5xsLSFzBdbe+PwXd9PUuKepupCYfVMuEVoI+HzR6iGqb71zpET6Us31B615G+FDkIS
         5jhkyo9qVCG6JGWIzNjAtqjE68ek0rgA4ZvUh/UilZZ5ybKsnyypOZZ/FBCTtmhYOT63
         SG54BM08WGsO4yyohzSbPLCHLlfJswLRkHGF8EKyRuPmGWWhT9WUXUZc0fgYEqvTil04
         Z45ps8xQxs7myVesFXxQ/qCLzRNtlSfyxIG2RwrthHsmhvAY83jg9hfn32W2je3bvzyp
         bG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715799363; x=1716404163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5kx3QhVdZ/bMaqEaPCOreM5PbVEpuzhijHoo6Z1RS4=;
        b=hQCRsXcQwgilB/83KsYW92l9nZSJs8vBjscFiiuyahiT0FTiZzO8b2CMedx56e+QpJ
         4RWI0OfNZYBHCs64iSvaYqjhDUgzf5qdg0T/MyuLH8kImvLNBwepqefaP7FJBGL+frHW
         rk+l/8YschIKJ5yDxSm6vQpPsGcxQt4s3UUu0z72wD4PKNC5/w+0VBQbqe3FvkHh+uTv
         uN92Pnyw4wIlnZ86t09dIm215/SvPjLuuowbN0o50evGMwZV0SeyjC2ZpRz8AHEbbicQ
         9GmkQwwSm6GQNroehMPSrnnPpEJkpVWtg8DPtVww/P6H5jxFSRJZrWrnRFR1XJMABP4l
         hC8A==
X-Gm-Message-State: AOJu0Yx+oCKwh5GKiiIqThQmuxBC/RwUuqy1+BBU8txhM6gXtdtkTzUR
	25OuFpMObalY897Z1ry7A9zGl4adOYDPU+fBA50pKSVQJyZaIX1mfW1SKNQV
X-Google-Smtp-Source: AGHT+IFaylzPsgh3KQS3tSSngKU6FXYpa5Jv3qSb7ScD17FlgN8np/eo6jWdUTXqfNptYCBzpWob0A==
X-Received: by 2002:a05:622a:2288:b0:43d:f37a:dbe4 with SMTP id d75a77b69052e-43dfdb0a0ddmr205793971cf.8.1715799362556;
        Wed, 15 May 2024 11:56:02 -0700 (PDT)
Received: from clarinet.com (syn-024-160-195-130.res.spectrum.com. [24.160.195.130])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df5516115sm86413591cf.45.2024.05.15.11.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 11:56:02 -0700 (PDT)
From: Jeff Harris <jefftharris@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeff Harris <jefftharris@gmail.com>
Subject: [scarthgap][PATCH 0/2] Port devtool update-recipe/finish fix to scarthgap
Date: Wed, 15 May 2024 14:55:58 -0400
Message-ID: <20240515185600.3456234-1-jefftharris@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 18:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199426

Cherry-pick the fixes by Julien Stephan in master to the scarthgap branch.

Verified 'oe-selftest -r devtool' succeeds

Julien Stephan (2):
  devtool: standard: update-recipe/finish: fix update localfile in
    another layer
  oeqa/selftest/devtool: add test for updating local files into another
    layer

 meta/lib/oeqa/selftest/cases/devtool.py | 20 ++++++++++++++++++--
 scripts/lib/devtool/standard.py         | 23 ++++++++++++++---------
 2 files changed, 32 insertions(+), 11 deletions(-)

-- 
2.45.0


