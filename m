Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B29CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 10:51:04 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.44245.1759109323152496729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 18:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wkennington-com.20230601.gappssmtp.com header.s=20230601 header.b=hmzf2fpW;
 spf=none, err=permanent DNS error (domain: wkennington.com, ip: 209.85.214.174, mailfrom: william@wkennington.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2570bf6058aso57918545ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 18:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1759109322; x=1759714122; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GjI+6vFnZJFrA685sAOQIUnsSdrNeHmdJgboF3SAWlA=;
        b=hmzf2fpWjMJRIWbcdiGMuX9BT8xWWrx4Uk6zmpzMglWZmJxowTgQhoZwBU7qp03scQ
         pWRj6LWKMYXZGbHtHOKNiCCs+oxSbbgp3VenRTT7R27tQ36CaZlu52hRdqTwlcHKZjuY
         urgUwgpv8bcxB951C7BdQHM000cKmRON/SEZZ5sNaQgSSs4vXJ6ZfgqlZ/ll3d0JaSq7
         H3YNkWz0yrXTlFEmnqe2cmKLQNLWiKaXQdjTl1jSeVz1eVn2S1FkIzjZfTxutokLt0ow
         JOK8ePcNMCs4qTucKwZijC4LKHM3bXak3ZUm1dJM/fkQlnikBUmIh0hWhFnNOHFSB3ri
         5p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759109322; x=1759714122;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjI+6vFnZJFrA685sAOQIUnsSdrNeHmdJgboF3SAWlA=;
        b=rfQjSISs4Gmye8b+qZm2njrgxaDGp93cIZ1asTwnewhu7nibQOM38svIMEiSM21IhX
         +eqEIh643+jE020Mm/+ffBcy48XBW+hse1uznVV/Ug64VWR9j3Ywp8Ldu7sh0QWYatX1
         CcUmLU89PsiDdALhtbj+l0X1DWHxaEefA2M4ALumhhl6HQZNkMoVPzYjzqqBdJTPDzlt
         hEqYWfYcXPwBJaAUb9B+icTeYF+Ic7kq3JZMFL6o2BUcqpQyNrO0Qg6/gTVl1IVEroOA
         POp+STtdhJGRPPwHgtdN0PK63eHrIFnRaD+gdLnK7dJ4XqfpbVuDjcynjnrlbxPx6lqD
         0AzQ==
X-Gm-Message-State: AOJu0YxMTC70HxJwYSeJv46k7BugHhEn5ChFEtsn2UkgmlFPQa1qR7vz
	chT3opEHQmBlLaCKW2tOEMeRFwAUfJUUZbeYGIcTX7GrZrLbrhjUTQvZ0oFW1BlNrmJc7PcvWI0
	rXP0Wp3cI/CAeFPuBA4t3WL0PCIX7e7oTZ4VXrXOnkuBEiW0iaSYsXvah/w==
X-Gm-Gg: ASbGncu/Tp4mWGUVIGed6181HBNpgLtDhFj0vV2DOKRBiI+a4MiEFmtP54p01JbCAQ+
	jAICS5h8tF38PC2SolUQsaARo2kJ9OkG+6DooLUqvC6K6krnOVvtuvXdBMzJ3Be4Ksl2WmTYk+H
	oZxhfLdfSKVN/s9WAqd7ZowEyUhAdAcg9ki3XCTCvqWNXQLD/AvHAz6o4cJfU0qrIyIBRXagJUn
	YC/+tU4z6DFGwEHo6JfjOjcUdYwxobyjP7h6zlUIQ==
X-Google-Smtp-Source: AGHT+IEAPs5A7SwXYYD8tZ8Gcm1izUMbmsEuDmGz9qEZjUtnsexAzSGniYvEDmr1RaMeL1/RwY2n6TiqRKoVA99O4bw=
X-Received: by 2002:a17:90b:1642:b0:327:e018:204a with SMTP id
 98e67ed59e1d1-3342a13b705mr18284949a91.0.1759108951794; Sun, 28 Sep 2025
 18:22:31 -0700 (PDT)
MIME-Version: 1.0
From: William Kennington <william@wkennington.com>
Date: Sun, 28 Sep 2025 18:22:21 -0700
X-Gm-Features: AS18NWDhysXNMpD4eL88Tb5ijRAqqpNZ5rk4J5pNHvqXbi_SnTslb8nmhv6Lwg0
Message-ID: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com>
Subject: Distro wide LTO broken?
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224137

If I add the following to my distro, the build breaks for the openssl
and other core packages due to having build path impurities in the
static libraries created.

```
require conf/distro/include/lto.inc
DISTRO_FEATURES += "lto"
```

The errors I get are all like
```
ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
/usr/lib/libssl.a in package openssl-staticdev contains reference to
TMPDIR [buildpaths]
ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
/usr/lib/libcrypto.a in package openssl-staticdev contains reference
to TMPDIR [buildpaths]
ERROR: openssl-3.5.2-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in:
/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/openssl/3.5.2/temp/log.do_package_qa.118335
ERROR: Task (/srv/yocto/poky/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_package_qa)
failed with exit code '1'
```

Probably there is just some kind of flag missing in the LTO build
options to filter out the build directory, as -ffile-prefix-map and
whatnot are already present in the builds. I haven't yet figured out
exactly what is contributing to this impurity.

Prior to rebasing on the latest master, LTO was working fine globally.

