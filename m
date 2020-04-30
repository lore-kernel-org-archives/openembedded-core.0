Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.702.1588204927544373133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 17:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uHQFDao6;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bkylerussell@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 20so3996726qkl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 17:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WldSJEZJoy1v/p09ULQcN0acUogc1OF6BDmBlePsfCY=;
        b=uHQFDao6yfbkuJEHDSEDCLJdGt5m6lvpmw8Xq6BVeAJhS9yhupZTwqxAd1pmYkNviC
         3igYr429vD9FPkdlR88C5+mr4bDXhSdfQ8JfHidtoPEr9fCjTS5b+UEgZufY0iY0MICd
         +WIKL6UHupFq+NxlbOOZo6voRaDOnLNodHN4xrp9kpirixhKBYzkYV0qSm0nL9160t72
         xeo5WYGlmpc9EKsu8AkeabVEY0TCtoQjv9VdGEjQmbER0YwrUMNvY6BmAndvtqrNY4pn
         8nZHzveSnTpvKnN1HhfMIFl9JTY2dlBxKtca4CNV83QelgSaS1Tkk0UoyaLF2xikeTOm
         6Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WldSJEZJoy1v/p09ULQcN0acUogc1OF6BDmBlePsfCY=;
        b=tjvXfbr5dvZwtVMxVqLhiUYAK8yoyCYXeG9eQOLMDazvQRJaWfFQiT+vmXsGMOSCv3
         bgL6e7jnazMptZGbYAfaI+MpfcJFrpslj3mhP6Me3ktRZV0avn6XjhOLmNX/HP0Zq2Ly
         r3Eic7AGfBk+PATrpeQqlimiDV01nxNA6zZwqtIQyxhvH6N34xcSE90XN7zzb3L7ggxy
         +m4zcvZJOKJ1XFT1OAgxgkDpDHKxJXpy05zudyz8jxnoChG7lmOmWSPENCmdrKKeY0O8
         A713Byb5UhmajEO0kue0e3ZTa+l9MirQVEF1FWKPdVRjkEo/mAAQ+rBa7EZw1oVFEhkM
         Sx2Q==
X-Gm-Message-State: AGi0PuYSwmPeYQlz6KujI3YbVT6KC55YXnuGFE3YKjAun7lk7YDOPjsT
	wQ5JBtc52pgtsg4uoLv+1FQf19EN
X-Google-Smtp-Source: APiQypIoifK00sw4tmaktsuqGIMLHhT1U4ITnuTSL/NatFKvsxn7q3/zym0vnf2OE4H+aYqgL4/Rlg==
X-Received: by 2002:a05:620a:103b:: with SMTP id a27mr1047777qkk.16.1588204926138;
        Wed, 29 Apr 2020 17:02:06 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.lexmark.ds ([2605:a000:160c:874b:7138:3470:3455:502])
        by smtp.gmail.com with ESMTPSA id 190sm535330qkj.87.2020.04.29.17.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 17:02:05 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com,
	richard.purdie@linuxfoundation.org,
	Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH v2 0/1] patch.py: don't apply striplevel to git am command
Date: Wed, 29 Apr 2020 20:01:44 -0400
Message-Id: <20200430000145.8359-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFrQVPMFCxHN4hzp2ktmP0wEH1Bp571z1KkSL5pfbHdWcuaFQg@mail.gmail.com>
References: <CAFrQVPMFCxHN4hzp2ktmP0wEH1Bp571z1KkSL5pfbHdWcuaFQg@mail.gmail.com>

Here's an updated patch that I hope will be a little more clear.  I've dropped
the change to git apply since that wasn't behaving as I expected, then added
a selftest on llvm that demonstrates the issue I'm trying to resolve.  Without
the change in patch.py included here, the selftest that I'm proposing will fail.

One might argue, "Well, if you change the default PATCHTOOL, you could also
just change your patch SRC_URIs and drop the striplevel parameter."  While
that may be true, the same failure can also be demonstrated using devtool on
llvm without modifying PATCHTOOL at all, since by default devtool also uses
GitApplyTree.  So if you don't consider "modifying a recipe's PATCHTOOL without
also modify its SRC_URI patches" to be a valid workflow, devtool is another
common workflow where this behavior could be encountered.

Hope that helps,

Kyle

Kyle Russell (1):
  patch.py: don't apply striplevel to git am command

 .../llvm/files/0001-Test-new-file.patch        | 17 +++++++++++++++++
 .../recipes-test/llvm/llvm_%.bbappend          |  2 ++
 meta/lib/oe/patch.py                           |  2 +-
 meta/lib/oeqa/selftest/cases/bbtests.py        | 18 ++++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch
 create mode 100644 meta-selftest/recipes-test/llvm/llvm_%.bbappend

-- 
2.17.1

