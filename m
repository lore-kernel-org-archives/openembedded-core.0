Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B829BC6FD18
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:59:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.10435.1682179192673851061
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NEh9mf85;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2fc3f1d6f8cso1721412f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682179191; x=1684771191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bRwJ2yRs0fH6JARo3krwJH9yvbmd9VgO9NShZ7Kp+Lk=;
        b=NEh9mf854y1jGzni+1+rgoX4h0oZgxU7AEZFPkzt3kpLFBWqiOaHQg2Gatvy0vG/mW
         Fcw0Q7GViscwbQiI5lUlRQpjeaY+PnM2WgKVDvENC0A30Zo0+F91CCjKrhctuDlZ+tUO
         er4cvL50Nr9aMwtQ9tAGEwZHl/BWHvwQeZ4bmzmqSyWA0jbOULU00Ywvhf8BofmOeawv
         r5dAdK0U7vMY+nSNgRhwqG6EP7FyhlMLbpNxqCfvUbgzCNOMSxfgcYEI7B1eNEeN144K
         DZmco1RHt48KnGOkmi4FheCTRVpe4E0Q8IXWCPW0hKQq/WNHHb3Z5Ekthr/RP3NIRoZE
         alPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179191; x=1684771191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRwJ2yRs0fH6JARo3krwJH9yvbmd9VgO9NShZ7Kp+Lk=;
        b=CVTGbddRW3ILEdaPKuSSRmDCxlHtATN4T6GVvXH2ez9VsBSNMw5ygZP9q0998p4qs1
         NPjgCAWhoG6pw6cG7xglYBlWB1rNcu2NW5kOShj0GXJwztbpELLdts2UxkfDbSPjVg/D
         dsdj21VFTnnHgA3GuRhSXfBQcl9oy361WRf0Xl/WLImnvw3PWMS+qwxnOMQi8zbQwZDq
         FkWTOUfEVzJ1a5tyfB9f6fW8W8FaUgBdwk92aSSkqkq16/vAkbwuj+Ktl8AagbCsbIw8
         2RYXXNWQKHofiJVSBOHfe/kYnZ978/6c6PYf5Uu7p1nafFzLubTmAWuch8o+3ntz6tfP
         MoFg==
X-Gm-Message-State: AAQBX9dalBF2i18HAFYSby2ax8igTNaMgmYtMVw0UbwfpUDvn7/73xIe
	/Zz5JpDBiy7zeljH4JkeWgGncZ+6YEw=
X-Google-Smtp-Source: AKy350YXJGqAMWdXVCWy8+fgfnM4lGBs9KANbxLTihFaZfX5W20TV7TBOPo7jLWGUo6vuVIvquQv6g==
X-Received: by 2002:adf:e946:0:b0:2fe:d540:8c8e with SMTP id m6-20020adfe946000000b002fed5408c8emr6044850wrn.19.1682179190393;
        Sat, 22 Apr 2023 08:59:50 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:446e:1477:ec70:1aee])
        by smtp.gmail.com with ESMTPSA id e29-20020a5d595d000000b002fddcb73162sm6798184wri.71.2023.04.22.08.59.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:59:49 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Create class for building rust unit test
Date: Sat, 22 Apr 2023 17:59:40 +0200
Message-Id: <cover.1682178812.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180319

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This brings the possibility to use this class to build and ship
unit tests of rust projects, the class also create (or modified)
standard run-ptest script to run the generated rust test suite.

It has been tested successfully with core-image-sato under qemu
for zvariant-ptest and python3-bcrypt-ptest (though the last one
didn't define any unit tests).

Note that I tried to do the same with python3-cryptography but fail
to build the test suite and I don't know how to do it with the rust
extension module build by python setuptools. There must be some kind
of way for doing that so maybe someone will put some work in it (
because python3-cryptography rust extension do have unit tests).

Moreover, in the class, I didn't manage to share data between
do_compile_ptest_base and do_install_ptest_base cleanly (I tried
to d.setVar in compile and d.getVar in install but it seems that
the data store doens't recognize my new variable) so I used a file
for that. I'm sure there is a clever way for doing that, so feel
free to tell me.

The following changes since commit 45a8bb6e4676899d40525e7d5ad1c1ddefee3185:

  apt-util: Fix ptest on musl (2023-04-20 11:56:03 +0100)

are available in the Git repository at:

  https://gitlab.com/fmartinsons/openembedded-core cargo-add-ptest

Frederic Martinsons (3):
  ptest-cargo.bbclass: create class
  python3-bcrypt: enable build of unit tests
  zvariant: add ptest feature for zvariant test suite

 .../zvariant/zvariant_3.12.0.bb               |  11 +-
 meta/classes-recipe/ptest-cargo.bbclass       | 108 ++++++++++++++++++
 .../python/python3-bcrypt_4.0.1.bb            |   4 +-
 3 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass

-- 
2.34.1


