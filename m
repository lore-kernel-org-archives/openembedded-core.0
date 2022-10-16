Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD2DC4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 12:02:16 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.28994.1665921731350982654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 05:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MEXsldFY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id u71so8243018pgd.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 05:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk3MtQKy2hN8jbIWIi55vhjKyZ35JiZPClTezmeZLMg=;
        b=MEXsldFYyb0NHUiiX/EZ8+6LiEzuX2cWpH8RcOBPk25rjqzdDj1c/frvsAcp0Bdwpp
         sMaVv26TpBOQwrIvG/1yeoYMXW7/EtC7el8LcTd8ifQ5we8xCC5Qy7TxHtrQ0Z2QVNbT
         JfFYZ1U0yZfeSTrDrr7bCt6SA1XHVS5lp8E/LjpyxL7sbJYZWe/6LcDcR66DyZG0S27l
         TNQMPnGJdeoP3A3xvUCC4h9OjOOEpoe1xiUk2z5NCh6w/br+D/eX0W7Ba/F5a01hlp1G
         EvFHmKdmIHZJn+sxu2CPteeFYStNgzlhTMi1/ssOj5cWq6zgsu+mSlaUOrzBFivHgM6O
         JyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk3MtQKy2hN8jbIWIi55vhjKyZ35JiZPClTezmeZLMg=;
        b=rioVv95yveirPhyAOHrgu7roIW/ct2iXBSCGrPklPchMLI8yYJk65J33rBaXn3ODIu
         851WsHwnLOlcweu6HLXhE/smcw/hN1NwD2AruLJE2kIs/I5mmnb5DLCClFUkUNXTi/L+
         Na8YCZagsyq4vKunxuPAt7ag3rUoz9RuiQNjKJDwu5k7AaF2EjfT9TPM7ZNlB0A6jnwi
         /JpYuELKhSMDy4Ck5WFP8CGy2TPWpdtxKpnEBxUGBShj8rMOPsHz79grNKFzvrlT/Hkz
         hqMPpNNh6yMNbcIfaPqtR1ph9cPJfG3fJj8MHyDtCesB02PJ12AAS2cSjJi/utwzZoKs
         M6jw==
X-Gm-Message-State: ACrzQf0DP4m2MBzh3m2qTVUqWtvZAP9xjMd3ILKVvQoREvblrzoGG+nO
	duVovb6oTNzLVI8ijCpEzRDN4Ie3PCdfL+cp
X-Google-Smtp-Source: AMsMyM4odHgws0RKbcEInNxpJrTkeVdI3OFRrhqbblpM8X70Yr01sMnfnOp5D/HCornBO8quAqoBoQ==
X-Received: by 2002:a63:824a:0:b0:46b:272f:d75f with SMTP id w71-20020a63824a000000b0046b272fd75fmr6171681pgd.268.1665921730230;
        Sun, 16 Oct 2022 05:02:10 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r8-20020aa79628000000b0056699fcdf6bsm4136044pfg.84.2022.10.16.05.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 05:02:09 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 91A189621B3; Sun, 16 Oct 2022 02:02:07 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 16 Oct 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221016120207.91A189621B3@nuc.router0800d9.com>
Date: Sun, 16 Oct 2022 02:02:07 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 12:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171892

Branch: master

New this week: 1 CVEs
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *

Removed this week: 0 CVEs

Full list:  Found 3 unpatched CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

