Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D84CCF2C7
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 22:57:05 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5714.1792277823551553572
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 15:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1545076eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 15:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792277823; x=1792882623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kY2Tk+UoxCzOtq0VjOdSnfFjUAzft3+GFASBUGY8vlA=;
        b=rtfnmDIDG/9sny8CisK8Lys1YI1k2I4Q/6cEfcGtlXg7dJZS9ohzhHpr+WstucyTv+
         7ae8ToOZET4PwZrdBcg6XADYXyyFit8ov+U2IziiU+90r2MdLlcKGYyPGWc8ZK2JyIUm
         K1MBV6qSr9FFv7upXunBaURpME+x9yk7lSmwiUZMDdxk9Y0+HD4D9dZhJ7mN+9ZRLXlR
         dHRGIpIcik0vqXuWjd+DLQjW0rhOz2z2eky2b/q0rpLEDobyqKpkvJRWOfz+L7bjSxGY
         5HyjDjPXq/r+K//pYGctZrc6LC/LMTTBNwiNvkpRJZLcHlnrPl1kXfLKzxFotpVeXl+4
         BvxQ==
X-Gm-Message-State: AFq9FYIg8TzprEl7ADmVqCyCiyObyh5hVgFsJ5G60efbB0Gk3QmwY9Iw
	Y7JM1lOl8gRFLNLC6uKJkeUjUlOxUsxA5h9MDhJw2z+zBQmsz9slbd5yseofInMj
X-Gm-Gg: AYBFou2jini5K40Lfc5W5eY8WHgk8mDu02TTZmAeQ3WwNVTPpHyvD3r34IvyHOQudAQ
	gMBHy+xXUuUF2m8Xzxw1Z+mMwvF2MY9NT38bZvTQf/AYIy1wIEKcpTUfA9ugmPe4ut4ICAY+iNY
	m1uINX/BASUdTHHm+LarmlnF3Mva14lyGjVSssrIVViArm/x2kRm1TbqX8/OHJZBiWfztEkZqE6
	7bIOkyG5YyZSpiOZjVRHyQP8F4RIzzIo97S/nCeZ04uIhUAem5eLBnwtocr+2DDwCCibnKEt+0h
	Yp17jdAvHKzo88WpXmDMTGDKku0uW/00MoxH30xq/vs55nqq98WR8+AU+JhQf2BR+QxMg/tWdPr
	ONzHNBdxw6shT1Yhy8hqh+o/IinXvMN+IbXrWLmB3rzb8fsC+9VIy7kyaU6OdoECf7MNr+/MxD1
	lQjymf8JN2tvCZZiu+3KcwmLQqEZh1Sqrr5jxnhjmqI9ErZTcGrC86A6EBNyvQWmGvbYkqRBAtJ
	OM2oR7EWs9P9SA/Yfkve+JwvfOvy4NOkdM2S+30WRYNZJNZnUUOyHClOGANJMDQ9M00VWYcLU4n
	xZVZFm5+yEV1DHypy9e5w6Kxh0SXCIpubw3CzWlxSxs0vMM/dZEZlIzZ9Tgli3yUdQ18TtB9+/l
	x
X-Received: by 2002:a05:7022:7e0e:b0:154:fa0b:6df1 with SMTP id a92af1059eb24-185139aa6b9mr5665857c88.37.1792277822547;
        Sat, 17 Oct 2026 15:57:02 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm17361612c88.2.2026.10.17.15.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 15:57:01 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/3] yocto-check-layer: Faster BSP checks over many machines
Date: Sat, 17 Oct 2026 19:56:53 -0300
Message-ID: <20261017225656.680168-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 22:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248097

Checking a BSP layer over many machines is dominated by world signature
dumps: two per machine, plus four for the common tests. In CI the
machines are usually split into several runs, which repeat the common
tests and their dumps in each.

This series lets such runs select their tests and stops repeating a dump
whose result is already known:

- --run-tests, as in oe-test, so the common tests run once and the BSP
  tests in each group of machines;
- no initial (pre-layer) dump when test_signatures is not selected;
- reuse of a successful dump when the same one is asked for again,
  which test_world and test_machine_world do after test_signatures and
  test_machine_signatures. Failed dumps are not reused, so the world
  tests still report them.

A full run over N machines goes from 2N+4 dumps to N+3; a split run
does 3 dumps for the common tests and N for the BSP ones. Tested on
meta-freescale with two machines: 5 dumps instead of 8 with identical
results, and a recipe breaking world on one machine still fails
test_machine_world for that machine only.

This came out of the check-layer CI work for meta-freescale, which
currently does the same through a wrapper around yocto-check-layer.

Otavio Salvador (3):
  yocto-check-layer: Add --run-tests to select the tests to run
  yocto-check-layer: Skip initial signatures unless test_signatures runs
  checklayer: Reuse signatures of an identical successful world dump

 scripts/lib/checklayer/__init__.py | 13 ++++++++++++-
 scripts/yocto-check-layer          | 12 ++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

-- 
2.54.0


