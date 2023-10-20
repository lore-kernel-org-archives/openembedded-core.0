Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA6BCDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:36:56 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.50037.1697791012645605459
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RdxMgooi;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso7897881fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697791011; x=1698395811; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8EsgUbdH2fTMnOePtLklE+tnGleK7btdqxMMkwNLavo=;
        b=RdxMgooiq5eBL7G81G9RmczjvkDCbf8bh3ApFgg2GmlqLtn35Asy5pOMFsYbiaIj/x
         Vj+mM8frQvQ6+hH7Kxe4ECuRRCJ3YSi357CmkCS1hBLcW5BT8ix5jr5IxuT5bwQqnBzF
         ernxSV3NOnVgsa/BAUHoiTlWPYvjbe6O5xL9zI9+RcAMUUvCi22sOlcsjQ9q3VQsrCEe
         uUBL3dr6bOP+8Ktl4rOTMrpCgox72sMz4oql50DSX8Cg9OjhkgpHHzRe+cF203SDZjbV
         VxLPGu7lyF0v75DTwMp7wgGeUlHjZ9CNnNbXajigjADm4/fmycRYFADdsuoGtsp98935
         D2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697791011; x=1698395811;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EsgUbdH2fTMnOePtLklE+tnGleK7btdqxMMkwNLavo=;
        b=AEMyIkdc1oc6Obqvw5foHvUp1x85tyYq9UM6bE5fvK7uc6zkYFFHf+GcbJDzSnrUtm
         2kVSamW0optxcNUMRu9fKInQhkh4xOVD5V83OyS//HdiqCTIFwuzrX+iLjblBgoxD74K
         Z/NgSwwggrmqwb12hKU9Xyfi056tf1xQSvCofg+ZR+SffekpxnrgqINgGW5/i5O60Zjb
         FScAN/SRsAR7niXW3x7Chj4ba2oUcPoMYzMA4gnsGJ+8ZeRYd48xGOxO3pQ28YIQao4k
         seoKC0deG4O9HW9q+MYFQUu+1ZItL1R6MxssgQG3nSR8EH66MI0dQGs8/LLqmCI2Udqs
         tw6Q==
X-Gm-Message-State: AOJu0YxkkQGqDbpJzHky8S7N3XraAKWCdtjnLK4bt2qWLba4KI6qRWT4
	mDsyKjol2cNPeqB/v2GnFof7ideDsh7JYYIofIrYxhrPDrE=
X-Google-Smtp-Source: AGHT+IH2G1tn42iHBe1Ys9VpV/U20GNjvSlOo4JwhGKidhPVz7FlkAuPYSrnugGRytEO9CJZ1UCqUXXfPE8uyhMO9pU=
X-Received: by 2002:a2e:7a10:0:b0:2b6:da88:a2d0 with SMTP id
 v16-20020a2e7a10000000b002b6da88a2d0mr843111ljc.47.1697791010528; Fri, 20 Oct
 2023 01:36:50 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 20 Oct 2023 10:36:38 +0200
Message-ID: <CAApg2=QBDi4jOA=N95paA+-0D-ZV7uQwCYuw0YWnkvk2B3DHig@mail.gmail.com>
Subject: CVE work synchronization proposal
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189510

Hello everyone,
We have a constant flow of work on pending CVEs. During my discussion
with multiple people, there is a common need for synchronization of
this work to avoid duplication or forgotten fixes.

We have a decision on the tooling to make: do we want to create a
Bugzilla entry for each new open CVE? An alternative is to use a wiki
page (this has been prototyped by Ross) with heavy scripting to
automate the tedious part.

Today I propose you to use a special wiki page and the following procedure:

On the wiki page, always add all additional information after a ; sign
to allow scripting. The first part of each line (until ";" ) will be
auto-generated. The second part contains information about the issue,
like who is investigating or what the situation is.

There is a separate list for each branch, as we realize that people
concentrate on various branches.

Workflow:

* Mark name of a person preparing a patch for each branch
* If you have additional information (like a link to a patch), add it
to the record
* If a patch is posted to the mailing list, post a link to it (this
will be automated)
* When a patch reaches the "next" branch, mark it too (this will be
automated too)
* When the patch reaches the final branch, the line of the CVE is
automatically removed (this is already automated)
* The list is (re)generated every day


Please have a look at the procedure proposal and how the tracking
might look like:

https://wiki.yoctoproject.org/wiki/Synchronization_CVEs

Kind regards,
Marta

