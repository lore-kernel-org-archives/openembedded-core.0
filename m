Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC3FD24463
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:09:58 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50683.1764871793725663640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 10:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2Vr7NjDJ;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-882475d8851so13303316d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 10:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764871792; x=1765476592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1+TPQd2+15jZwtBaY024mGfQB0Ve/05THShw8NH9oE=;
        b=2Vr7NjDJJ0WVpRav/fF0EbalSdjx6R9wWu0PsMq1YCq3mimWfozWtdRfiDAewmvOVk
         3pKdBi6gcL3lv4LswPSWkw56hOU2G6BO0cEBQXvcwrrXYzHcvu28ysD2danBvHy6mjw9
         8gmA+fpa0Mpd5H4uNUcFOraMYArXwnw9aE0cvv1RiI9/4meIGlwuO8d0IGaS2CtkQgdG
         2/L7Ep/q0tYtrQXwttxnI6SsD1vunI33HPFnn1MYzgoKMhyM/VCHUEEH4On0SmuwpkRQ
         qZP0YCvSOVMbV7Z2u/lo6OXBIYwY9YAuv1Q0peDJRXjdRsBAX0bTn3xySPva3ViWO+AE
         Nu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764871792; x=1765476592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1+TPQd2+15jZwtBaY024mGfQB0Ve/05THShw8NH9oE=;
        b=HdqOlHC9I6IoXvzxCbFve3oZ5YPH2kuFRydOV/ewo7Zb0J9mteL2pnzjeBplV/PbDC
         THnYpxt+GuSXBfzLXS4GgwhexaxouGdPxJq+Nyvkq02JSZ1ftcpwrnNpfoL9Czcs+FSg
         pQ0tsWaIwvujvk8VHRnuIgbuXbTEg+hhjqppMT9FuXPzRtLBdxOP3dVFDwp2HtJ/sW8W
         F2I7S+CE84//xGi6bVeIqfaewyE2zAlpEnSgXlx1+VYiCsv5ruTm/cxPQ0ll1xX3nFtb
         iwob1pFD7vZuphbw/ZiOJ2wHq6KT+itQoIc5ri/V9BXY3+ZI/qfU0RxYnAGwBHP1EnPu
         UWCQ==
X-Gm-Message-State: AOJu0Ywe3sHUFafPKQ2pSKuhPxYbV21FbdHylcJqFmUaDPxACYGvDkhA
	0zDaAiCxit2WsFR9d9HIAtP8bOltlVuxp9IyeNVpgrLVyz2r12rfq9z75fKiYTmZLDWIyx4pSvc
	spvPydJ4=
X-Gm-Gg: ASbGnctTsVCDpNam0bKxXvqgOlU7PoaJ8oyamLPfH/XlxNlZQgj56Bb83IO3MuXpLGS
	Sr7iyIE83hZFk5NsXG2J5WKC8KKk4vjXEzFOxy3qRs2tUYrzDwmPKXiAY/MHfbApkL6/HD1Aj0Z
	wp3bP8vFlEa/sdvU1Nu+Of84B8H6eKrTNFjqUeXtCTC3KF3JC7verY1Rx41fo+QAMU7cMN/yiV+
	bj6gmQsQAhUv4VuFZvCiK/DK74XDGfJAQOOctVhMbHBMHYz4VtGXAwisRz3bcYP+obDGdi0JHy8
	9JDhM+nuT+ALzaPgqD11JKvw8Z5caP4rrD9I60zc4uR+kZzg1CVIaXbPAaAb/xxofhj/VdKpgwn
	9HRXExFkIMupEYhf6WSUFo2M0d1W/XueFTxahUBEpqdhWGadS/BPEH1wUsOtVRR/RGaWqC/2ERN
	sayr/q+9W2xSGT24w=
X-Google-Smtp-Source: AGHT+IH6PTaVNYrWvvkiRZ5TjLjVUu9mo6n6hvFEu8MQjVD8fgA1DN7k5mpDVmT4Z9zwQg1aJCkMVA==
X-Received: by 2002:a05:6214:246a:b0:880:5730:d3db with SMTP id 6a1803df08f44-888194bf531mr97340606d6.21.1764871787582;
        Thu, 04 Dec 2025 10:09:47 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-888287d4408sm15338496d6.45.2025.12.04.10.09.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:09:47 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/6] python3: upgrade to 3.14.0
Date: Thu,  4 Dec 2025 13:09:39 -0500
Message-ID: <20251204180945.3112334-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 18:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227315

Here goes the first attempt at upgrading the python3 recipe to 3.14.0. This will
likely break some stuff, so it'd be good to start testing it early before
Wrynose begins the build phase. You can see the specific commits for more
details, but I will note that in addition to the buildall-qemu, reproducibility,
and ptest checks I've reported in the python3 upgrade patch itself, I've also
done the following on my build machine (F43):

- bitbake core-image-ptest-all (which is how I found the problems fixed by the
  bcrypt, jsonpointer, and pytest changes);
- bitbake -k world (which IIRC is where I found the rpm issue).

Trevor Gamblin (6):
  python3: upgrade 3.13.9 -> 3.14.0
  python_pep517: add --prefix to nativepython3 call
  python3-bcrypt: upgrade 4.3.0 -> 5.0.0
  rpm: handle CMake Python paths in do_configure
  python3-pytest: add python3-misc to RDEPENDS
  python3-jsonpointer: add python3-misc to RDEPENDS

 meta/classes-recipe/python3-dir.bbclass       |    2 +-
 meta/classes-recipe/python_pep517.bbclass     |    2 +-
 .../python/python3-bcrypt-crates.inc          |   90 +-
 ...crypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} |    2 +-
 .../python/python3-jsonpointer_3.0.0.bb       |    1 +
 .../python/python3-pytest_8.4.2.bb            |    1 +
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
 ...-use-prefix-value-from-build-configu.patch |   35 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   37 +-
 ...ctive_children-skip-problematic-test.patch |   17 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   31 +
 ...-test_unix_console.test_cursor_back_.patch |   46 +
 ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
 .../python/python3/python3-manifest.json      |    3 +-
 .../{python3_3.13.9.bb => python3_3.14.0.bb}  |   20 +-
 meta/recipes-devtools/rpm/rpm_4.20.1.bb       |    5 +
 16 files changed, 248 insertions(+), 1528 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} (86%)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.9.bb => python3_3.14.0.bb} (95%)

-- 
2.52.0


