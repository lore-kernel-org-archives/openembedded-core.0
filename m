Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.14345.1604235185368014649
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 04:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a/5xqrA5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id b8so11456936wrn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 04:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJXNJJ6WuTAcPmOfxS6eODGdPncHoi846cZ6grPvJlo=;
        b=a/5xqrA51atJSLE3GPSKlPlFFOCytx5Ve5nfTQ7nFs1VvYuVyqaUPw7ycRmZyUbWTt
         tcJ5OE3AtZEe/vqeXBkyWUFdpeXcOTPIfyocZHb5UqmKfpyGbYPkEUBC91XGl9zpbY9+
         zup18caV0+5kBWh/Os4JiItdVyNV0uPTv1lHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VJXNJJ6WuTAcPmOfxS6eODGdPncHoi846cZ6grPvJlo=;
        b=E7vJQNbZ/WDDp/lHXZHF3MyT6IA80bClRBLcFI44CnSYwwungdSAL+DbhuibFcBJYQ
         NRTphwh4VGefGjgLMz23HukbHJ/3bxS+iKkdI3i3Ou45BFXUdqwsUzvAvgFB0k7zYHzr
         35dNyqHGl89ZLTdc7yF6p6bN5lTNrfpAEJt3OByZXT/7Y6EqmvkpGXwPF26s4DUKx3x4
         lncj5rHalMAXcbfU32GMzDSQZcxKAQPwSLDTEVPOyR+4J9F/3rYHZewkcFntb7yyJxG3
         ASLL1GVBFsCQq81TEikEIrTj+sENChiUXrA7Tu0jx30OolEYeq0L5KlHjxrlLcW3D7Oh
         b20g==
X-Gm-Message-State: AOAM531mMWc5lJky3Doyw/kpVbnnfpRYg6fmdP1IbceV4Y+8o62k41GC
	cgMen9AUIwKNz0blSC9UlScWfSFjKU5TUA==
X-Google-Smtp-Source: ABdhPJzE/p2sRU8YnsbZB3nO0etzIzMmyrB6I4KNY1ksPZ82S0j/2BmM1aa6gUl7uwpSihFIV5KARw==
X-Received: by 2002:adf:f104:: with SMTP id r4mr14574590wro.202.1604235183630;
        Sun, 01 Nov 2020 04:53:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id v123sm11806735wme.7.2020.11.01.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 04:53:03 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Viswanath Kraleti <vkraleti@codeaurora.org>
Subject: [PATCH 0/2] Example of how prebuilt binaries and locked sstate could work
Date: Sun,  1 Nov 2020 12:53:00 +0000
Message-Id: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the Yocto Project Summit, there was some talk about how prebuilt binaries could
be better supported. There was some discussion about how "locked sstate" could 
actually handle this quite neatly. I thought I'd have a look at that and came up 
with a few patches to illustrate what I was talking about.

Rather than talk about this in abstract terms, I've written this up as an oeqa
selftest, you can run it as "oe-selftest -r binaryonly". The selftest patch commit
message contains information about the example "binaryonly" implementation.

This series is a proof of concept and there are a list of known issues:

This patch series depends upon:
 * the libxcb owner/group fix I sent out
 * a bitbake patch to siggen in bitbake master-next to remove what I think is a 
   misfunctioning optimisation to get_unihash
 * a fix to sstatesig in OE-Core master-next to adapt to the above bitbake fix

This series contains a patch to enable sstate for do_install globally. As noted
in the patch, whilst it builds, there are some rules missing to make it work 
optimially.

There is a bug in the way locked hashes were being handled by dependent tasks. The
two patches in master-next mentioned above are attempts to try and fix that, they 
certainly make this selftest work but I have concerns they may break something else.
I'm therefore performing wider autobuilder testing to see if that shows any issues.

The proof of concept here isn't 100% complete. In particular:

* We need a more generic/usable way to lock/unlock specific tasks in recipes,
  the test just generates a file of the right format for now to show how it works.
* A warning is shown for the locked recipe. We need a way to specify not to warn
  for a specific list of recipes.
* If the sstate object the recipe is locked to is unavailable it will currently
  fail the build obtusely. We need to write some kind of user readable error.
* There is no mechanism to ship specific sstate within a layer, we'd probably
  need one for this. The existing mirror syntax will probably help/work.
* The source date epoch and populate_lic tasks need to be properly handled, I've
  just ignored them in this demo.

I'd note that the BBPATH trick to enable/disable the source build could be done
as separate layers, I just didn't want to add multiple layers to OE-Core just for
this. The reason for this trick is that in many cases, the URLs and build process
for the source needs to be kept separate and not disclosed. That source inc is 
therefore designed to be seperable.

Richard Purdie (2):
  sstate: Promote do_install to an sstate test
  selftest: Add binaryonly example and selftest

 .../xz-binaryonly-src.inc                     | 16 +++++++++
 meta-selftest/classes/binaryonly-src.bbclass  |  9 +++++
 meta-selftest/classes/binaryonly.bbclass      |  9 +++++
 .../xz-binaryonly/xz-binaryonly_5.2.5.bb      | 36 +++++++++++++++++++
 meta/classes/base.bbclass                     | 10 ++++++
 meta/classes/staging.bbclass                  |  2 +-
 meta/lib/oe/sstatesig.py                      |  2 +-
 meta/lib/oeqa/selftest/cases/binaryonly.py    | 34 ++++++++++++++++++
 8 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/binaryonly-secretsource/xz-binaryonly-src.inc
 create mode 100644 meta-selftest/classes/binaryonly-src.bbclass
 create mode 100644 meta-selftest/classes/binaryonly.bbclass
 create mode 100644 meta-selftest/recipes-binaryonly/xz-binaryonly/xz-binaryonly_5.2.5.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/binaryonly.py

-- 
2.25.1

