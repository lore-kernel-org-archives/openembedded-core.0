Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E079C982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 19:19:20 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18032.1789845551236022545
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 12:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BmUrV8qK;
 spf=pass (domain: konsulko.com, ip: 74.125.228.43, mailfrom: tim.orling@konsulko.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso2265215b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 12:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789845550; x=1790450350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bvjd+ZAzcxwFhlpAekL7AcvI7PuXZmMpnpVhvixlxxs=;
        b=BmUrV8qKLEc0Ds2QMyvLaXitd043ore9U3y48KYDrL/Dwcp9//qQNCtpwAPp7Sm6DJ
         K+Phz/T5MWfSLk6CcFso9ATbMRsm20u8OFVj35YuAwYTHRdSj1U7eiFVVDdCNIfVk0vu
         CCTOWgMWm06m0VY9ZY7PuzcSyspvgNHMQ3wK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845550; x=1790450350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bvjd+ZAzcxwFhlpAekL7AcvI7PuXZmMpnpVhvixlxxs=;
        b=AWpx3ruc8/WOA/Zsdft+5b8dYgBcwwt6EPGBkLWiBH4XARaOZBzw7rXnLf0PP1kRby
         SWj4L2mEDEOlOZp5H8y1yqqz8+0kWucvqi8TQq1xpS6OSowruKiVymgtNyBXVk/RMhmA
         apuPuLQLfM8QwNNkGuyfy2cDNxXL/9918hhTScHFZEQSaT06y1QhkcLQB7kNH0S0NqaD
         yBGIk0pXLj8nZu17mP6f4emH2oxfbP/Vzw6Iob4w4FDwlcw39rpWjJx4cqooIgiIdj4c
         9XshEW5jCeuEEr49gzhMuyINAoirv9jhmdXrqw/Qzvv5+rYNoN2DHYEirAGy0WdSvEzo
         vkOQ==
X-Gm-Message-State: AFuF++kswOhCOKgTnAfwnzCWVPF59OhjmFFRIEawPjq5I1fn4CZN5tiv
	Rf75Cs33LLkFTcUl5+iIe57CunWnT1xJheIHbki3garStUm9QHXFtpgKvfM/oU1NIQRIXIu7yo4
	tdaTj
X-Gm-Gg: AYBFou0cfUp+PM6F8mbRaC/U9hpejIz2I3t9+rz/mPYkeqj6NRPWSri6GnTqI7kRKC9
	sOA/pfK+Ttd6NwL4Mgl23TSapcehUVWb6F7m/yO3iMCnLdDmK598sQQFETNkmGRM5LiP++0E4aP
	boanXST4NH+q9xlP4ikpKbRcuGwRpxGkn+MBnOVve/JMGdxH9/V/B42chyGX6K1RiXQVplPc82q
	1qqzMHg+jaexNs1sAaEbywGf4+clTbBHv7ii8WTL9J6oP/lqup5X5EBDzAKr63GmadQ2PP9n0zb
	ohMNdtSvE/CSSJh9e8MrfCmUJXNNnS87/DmSL3gK72g8H6E9u4Ksyw7ovQ8yKGDbGjqJ77+HYrh
	+OJPveTDujD6YeWT4k7F+BwsKdzsoP8Hy+0zjeeAKNcSC42pWcfi2FPJusSPbzCSCxwtnDT8Y2I
	SkOFZj8aLB3llD41QfDCcTQ7D12wQOq7CqHRfAH+4jOxvVTbarMAIFTByLCntQXtYH5Mo4VWQ6T
	/+6XN9GVOdu6tlpoA==
X-Received: by 2002:a05:6a00:2d0c:b0:871:41fa:d1d6 with SMTP id d2e1a72fcca58-874dceef795mr9550516b3a.14.1789845550530;
        Sat, 19 Sep 2026 12:19:10 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a3d3c104sm1243267b3a.0.2026.09.19.12.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:19:09 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-more-itertools: upgrade 10.6.0 -> 10.8.0
Date: Sat, 19 Sep 2026 12:18:15 -0700
Message-ID: <20260919191814.1147283-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 19:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246244

From: Tim Orling <tim.orling@konsulko.com>

This is the last release before flit_core 4+ is required.

Add PYPI_PACKAGE for normalized PEP-625 'more_itertools' sdist.

For upstream release notes see:
https://github.com/more-itertools/more-itertools/blob/v10.8.0/docs/versions.rst

For a full comparison of changes, see:
https://github.com/more-itertools/more-itertools/compare/v10.6.0...v10.8.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on core-image-ptest-python3-more-itertools for
qemux86-64:

Testsuite summary
TOTAL: 20562
PASS: 20561
SKIP: 1
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 9
END: /usr/lib/python3-more-itertools/ptest

 ...e-itertools_10.6.0.bb => python3-more-itertools_10.8.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.6.0.bb => python3-more-itertools_10.8.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb b/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
index 5447a7af8e..32fcc5694b 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.6.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "2cd7fad1009c31cc9fb6a035108509e6547547a7a738374f10bd49a09eb3ee3b"
+SRC_URI[sha256sum] = "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd"
+
+PYPI_PACKAGE = "more_itertools"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.3


