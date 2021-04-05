Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.5884.1617634439479862425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=n7mu/3Xz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id c204so4562432pfc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMuNjxwYIUNXK7RSJdCDgWjvM2eyX9rFDfN6gyITYoU=;
        b=n7mu/3XzQWRFBa/k9PB+JI/ixqAhULR5QOIc7l1ZNdllATplmLsIzYdJM+XCj3NsIr
         /+4zsc8O4hzbOBdnF6WJacK3BYSKmRpSFkp97+Sn3abUrmll4rCRHR3QF3zzKhMdZjO7
         OT7sdL3NXKa2zuC4lx4RDewW/+dvYcOic91OjIyLoWx3uCOTocFTLwT1SajZlybDXQ28
         JC4yXARxBnrv9UEErwjzmD9/Om7YQXoc7gw7VZdWIZlh78ygRja1nh9frXiOHkyo5h85
         RV4oyS6vZwcN/7YikxHBe4PfBDeneN7I59LHf1VMpoWvgGGD7q4bb7yEj4ZJL9sPC4r+
         R2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMuNjxwYIUNXK7RSJdCDgWjvM2eyX9rFDfN6gyITYoU=;
        b=TINWGDNTTjuoQK1HJhJhSD8Wx914bb+LtH7L9jT+nkQnbf61jcmodp32HDnpso1Cyk
         zTO5Fn95ni4sVjGGRyzpeP2lY8uY3sCAGjNdbtAkx08DefRZxaW/TdVZkNyvVwrnkI5V
         ZBlC5lIKhzVC6UVvS3MlHrdtE+tmHLmu3caXPu7XdIiRxk5ungRpzz1OiCebraxahPKb
         6yBvjo0N9iXOyqnlU80Q30qmefbcVRM4H98o9UTqMx33V8fpIc+dhT64av1F55OsEdvi
         paAycVVsSiUBojHvB4H3MuFrdrcTdJwE/z9MsxN1hcV9JVy4wi3G5gj9MWs5Y+C1zZDa
         vWmg==
X-Gm-Message-State: AOAM531w+K6Q9liQMBsplQ4PMCWR0/N+fJaHFxKvagA1UG4hb0S2kcc1
	9GGOp97zhuR7vmsdHonZ7P7DtCbg+VyXwH1okPs=
X-Google-Smtp-Source: ABdhPJyut8DT0YlFLb9mzC+wQJzUqHV0zM99Czih4WpEYMn1x/GKPUkCNmya8g0Kipgq6jlTQjE6dQ==
X-Received: by 2002:a63:f40b:: with SMTP id g11mr23721605pgi.133.1617634438242;
        Mon, 05 Apr 2021 07:53:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g3sm15427734pfk.186.2021.04.05.07.53.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:53:57 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] RFC: Enable world reproducibility testing
Date: Mon,  5 Apr 2021 04:53:26 -1000
Message-Id: <cover.1617633691.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series enables world reproducibility testing so that we can begin monitoring
progress on reproducibile builds for dunfell. It also includes a version update for
diffoscope to better enable debugging failed packages.

The main downside to merging this series is increased autobuilder load to run the world
tests.

I've been testing this over the past couple of months and have updated the exclusion list for
dunfell as I've encountered intemittent reproducibility issues (see selftest/reproducible:
adjust exclusion list for dunfell)

Most recent passing test of a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2024

Once this patch is merged reproducibility reports will be published at:

https://www.yoctoproject.org/reproducible-build-results/?branch=dunfell

The following changes since commit d044d9c0cb672c499059eb273e399ce4aee17e0d:

  image,populate_sdk_base: move 'func' flag setting for sdk command vars (2021-04-02 04:21:56 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (3):
  selftest/reproducible: enable world reproducibility test
  selftest/reproducible: add an exclusion list for items that are not
    yet reproducible
  selftest/reproducible: track unusued entries in the exclusion list

Richard Purdie (2):
  selftest/reproducible: Sort the unused exclusion list
  diffoscope: Upgrade 136 -> 168

Steve Sakoman (1):
  selftest/reproducible: adjust exclusion list for dunfell

 meta/lib/oeqa/selftest/cases/reproducible.py  | 80 ++++++++++++++++++-
 .../{diffoscope_136.bb => diffoscope_168.bb}  | 15 ++--
 2 files changed, 84 insertions(+), 11 deletions(-)
 rename meta/recipes-support/diffoscope/{diffoscope_136.bb => diffoscope_168.bb} (46%)

-- 
2.25.1

