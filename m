Return-Path: <william@wkennington.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29ECCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 05:56:42 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.47212.1759125400431248816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Sep 2025 22:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wkennington-com.20230601.gappssmtp.com header.s=20230601 header.b=AFQrWFDw;
 spf=none, err=permanent DNS error (domain: wkennington.com, ip: 209.85.216.49, mailfrom: william@wkennington.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-329a41dc2ebso3302456a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Sep 2025 22:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1759125399; x=1759730199; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GjI+6vFnZJFrA685sAOQIUnsSdrNeHmdJgboF3SAWlA=;
        b=AFQrWFDw2B/jKOK9cKUvCYS0gOz1MU/C1euH1OfCZBAc/d6UiahEsY9h318m9RX1HI
         mFIgbWzmEX6e4Z6deqNlMbQJChxV4E2Rb3W/GtlpCx/vyEMX6ou+V2uR8EbVzprQ1mBC
         qGbK35qB93X1gLl7ckm2t6FNMjtSeEyqT8JhlnRkUNfeQve8mWqLapFo6B3FvndYEjQX
         F1KaYeXB0eFjeim57Q2dYLZFWuJkdlaUm4Ye10Ufsjk6Zxj5doHkGc0vcZ0Xeb1XRqUm
         NE9sODSMX7gOFEOf0MX9qy/qEBWI/r8N2zxWDqet8kVL7ujv8PGkOviYI9pEFdyKQG5u
         QpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125399; x=1759730199;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjI+6vFnZJFrA685sAOQIUnsSdrNeHmdJgboF3SAWlA=;
        b=ARxhrAVV7OHiJe4RLOyNxbEEB6gLbgP9fpf9zoN36Hi4U81D1AzfwRAKcyLPAxctV6
         MIOZBeTbzw9Z2OG8FWwXv3u2i7Ul4jwQEOjQKnhAHrsz+E8wiRzhOh7pTHLbak8fjVxV
         s7yESW15KG5gQYX2+Krs2sRCUiJa+buV3Bfc2EwWab5pS1cz096aMGrcfjdG1M4YRRlN
         MilyDtZn1z0S+iLw2eWDmBlX1/3sT01u4tU6Ce/328AWGwvqzIK7gCGTmv/AH+DsIi/T
         aeKX8PVCufWZsUlniwn6cIB2lfXg2eRDkAzOXOWkHbduY5rDmyeN0OOzyScSbpFtVlOx
         Vnhg==
X-Gm-Message-State: AOJu0YzfKZjF0w0kisAPO41oVZqdjN03mIW2dhK8/zBw4tbiY1HTqRYr
	lcAuYfqr/gkAAUGnDL70l49FWlYNUpMBuQDoNR3MCXZmxDIoBdFTbbknh+zm4V2zYaeb4lLP5su
	g0qvezHOx4+Nip+YJJF7yAZHFR70aSWOSHwia4W2bpPosaCYcvibwmkWvrw==
X-Gm-Gg: ASbGnctsur6DoIJTWY+agxMmwN+mMIC9+mVxtDaWLUe03WPsShbjfBWhrpqsJAP5l4f
	M52zoa4UELK0k4QQYYgmRfsqfpaff6l+RDSdtDkdQoW1VzF4QWn+oIxwgn02b4JwX/P93PIpPfR
	3NXaQ5Bb8+quzeAOvkxypmKmPG0CLjImK8JWBo76UTwkOI17rFQ7ZWHPCeP16lPMHv1+Nl/GnH9
	oUljPAEwqNnu9At2c3dCIbScNEq/iaVhkhQMKRHSUkq5+6ia26o
X-Google-Smtp-Source: AGHT+IHE9DOiAQkTssdVSkHjoGluP9o7X54IBfaV/Jf60mYTYd39tY6NfolBT/bBGYbUYatXWqM0lOQ+rMw6VstosBs=
X-Received: by 2002:a17:90b:3ece:b0:32b:6145:fa63 with SMTP id
 98e67ed59e1d1-3342a216f73mr15556817a91.4.1759125399345; Sun, 28 Sep 2025
 22:56:39 -0700 (PDT)
MIME-Version: 1.0
From: William Kennington <william@wkennington.com>
Date: Sun, 28 Sep 2025 22:56:28 -0700
X-Gm-Features: AS18NWAxp6R39gBl4bVfLfJ3o8FAeyhOVU90I8Xlrp1C6UKT6M0TPTDGCM51jXk
Message-ID: <CAD_4BXhMymbdUj-KqRZA5bN6imMvz8+OQt2EsiALs3wYhmtVPw@mail.gmail.com>
Subject: Distro Wide LTO Broken?
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 05:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224117

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

