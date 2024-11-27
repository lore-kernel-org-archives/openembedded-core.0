Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E19D66BB7
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:57 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.64660.1732680707536110747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a5uOOnQq;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3ea411ef5a9so1550562b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680707; x=1733285507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kcb7TDklw9FpjjotIA51UGDl+fRDLriBhNGuPyvKIQE=;
        b=a5uOOnQqg2aO80HPAMO3MN5/CE9DQcik/L2Im55xWdVRNW6ZpS5YInI6wGgicjeJsQ
         dfDs2lG8wbxLNwWojOrME0g2d3/47RVncTPz3qSRMx8pSFmu+xaG1uNPiHbdhl7vV3wi
         R0bCgdSRLrWCMS/+BrrzSM/9N6dm+0wYNcOcpzrOQ0O7lvDonkLIrMObDs79PrE47LnQ
         OSJQ5qfrfVBtuyvHTFarKpRUcS2tdi7xLaBH4CO6s+xNJlSrYHXBKind0GH+XQBzg2QL
         lJApjG/oPRTJPmJV9bxoXAninPQhOfyXLVReUZ0idO8iwOBiKNvCFJYZy9Q4phWsRMEw
         70uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680707; x=1733285507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kcb7TDklw9FpjjotIA51UGDl+fRDLriBhNGuPyvKIQE=;
        b=ETRvmBTqiP0Eo0IEEyX5B3jX2IFLIOwDeQuFKhRpo1MS9Gqsd9ySt+wncaNk2ktDLQ
         G2OZ0cCh+Ltk23BJv61L8KqJ/QzxEpWjP7q5R6R62WTfMSOlDABhLb8uzhlYhelGK3U7
         OnHzrsvHp8bLCp9NXWGipp9TkrFqwnR1tjxqgG7Odi2L4rd3e6qo0O30pCJo+DlwGE1B
         +8Gls0WY/veG6OCK3RxAYTW5uPv0S6Vg2YivYyHRuBs4q9cAEN0XLQuD0AAa3vAvswTl
         GHMSfU6Fc1Eq5SUDRAnBbxpUyjTKnZsvUaMtCxVH2KKoKuYIFFCkxhV3vPPkXzGqlxv5
         Qm8w==
X-Gm-Message-State: AOJu0Yw2XEgCA4zQd4CU/zt9Yjx9rzpH0d3wG/Mp8uBY5/jEH7eeejOn
	SpIW1vfEec01BpT02d8aVUMcQTS1K59dyuWEZSP1M8qQUQGCvL80loJtBpwrOVg7JS+SIxQWhS6
	t
X-Gm-Gg: ASbGncuWcZkylKvvEr5HEOYzNOexvWoH5naPXduf1NTMGYfSL5+YGwlKluySZlzp0Hw
	IZNLnEKeb2TQ9xRHz0iXwNO2ou+MMCe4X96zSuVPWiD78mZiN3YwAqljxsSK3j/mx5u73qeD06+
	9C6BHtjIdDc0gEhwLHnfv70vauE6MA73vG5LUbtZG8Z2S9enW2DH7cPbvQJb3vPTG1ziJPbwo8g
	5VnmmprwGSIVZ1gxZAerW11KsWxQ0RaGTk0uok=
X-Google-Smtp-Source: AGHT+IFKurp6lgFEzG+0hXF7yE7NdOc/UeiSfojU/wrNmPt/PxVFmHZ0OUEL+eSjvt3cyEq8QMy6jw==
X-Received: by 2002:a05:6808:1807:b0:3e7:a15c:4692 with SMTP id 5614622812f47-3ea6dd4e5f9mr1575729b6e.27.1732680706475;
        Tue, 26 Nov 2024 20:11:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/18] cve-check: fix malformed cve status description with : characters
Date: Tue, 26 Nov 2024 20:11:22 -0800
Message-Id: <5cd34a34879ad424f3b1637b48892d6fa037861d.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207896

From: Peter Marko <peter.marko@siemens.com>

When CPE is not provided and character ":" is in cve status description,
current code takes only last part of split function.
This works only if there is no ":" in description, otherwise it drops
the other split parts.

Do a new split of the original string to take the whole description unchanged.
This fixes following entries from world build of poky+meta-oe+meta-python:

tiff-4.6.0-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2015-7313
CVE_STATUS:  fixed-version: Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue
description: //security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue
corrected:   Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue

gnupg-2.5.0-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2022-3219
CVE_STATUS:  upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993
description: //dev.gnupg.org/T5993
corrected:   Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993

libyaml-0.2.5-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2024-35325
CVE_STATUS:  upstream-wontfix: Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303
description: //github.com/yaml/libyaml/issues/303
corrected:   Upstream thinks this is a misuse (or wrong use) of the libyaml API - https://github.com/yaml/libyaml/issues/303

libyaml-0.2.5-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2024-35326
CVE_STATUS:  upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
description: //github.com/yaml/libyaml/issues/302
corrected:   Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302

libyaml-0.2.5-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2024-35328
CVE_STATUS:  upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302
description: //github.com/yaml/libyaml/issues/302
corrected:   Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302

cpio-2.15-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2023-7216
CVE_STATUS:  disputed: intended behaviour, see https://lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html
description: //lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html
corrected:   intended behaviour, see https://lists.gnu.org/archive/html/bug-cpio/2024-03/msg00000.html

openssh-9.9p1-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2023-51767
CVE_STATUS:  upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1.
description: //bugzilla.mindrot.org/show_bug.cgi?id=3656#c1.
corrected:   It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1.

cups-2.4.10-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2021-25317
CVE_STATUS:  not-applicable-config: This concerns /var/log/cups having lp ownership, our /var/log/cups is root:root, so this doesn't apply.
description: root, so this doesn't apply.
corrected:   This concerns /var/log/cups having lp ownership, our /var/log/cups is root:root, so this doesn't apply.

unzip-1_6.0-r0 do_cve_check: CVE_STATUS with 3 parts for CVE-2008-0888
CVE_STATUS:  fixed-version: Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source
description: //bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source
corrected:   Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source

syslog-ng-4.7.0-r0 do_cve_check: CVE_STATUS with 6 parts for CVE-2022-38725
CVE_STATUS:  cpe-incorrect: cve-check wrongly matches cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32
description: syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32
corrected:   cve-check wrongly matches cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc33dd9176726cb4b2d2f142ed1bc655da8e0a9f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 268adfb528..647a94f5af 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -257,7 +257,7 @@ def decode_cve_status(d, cve):
     else:
         # Other case: no CPE, the syntax is then:
         # detail: description
-        description = status_split[len(status_split)-1].strip() if (len(status_split) > 1) else ""
+        description = status.split(':', 1)[1].strip() if (len(status_split) > 1) else ""
 
     status_out["vendor"] = vendor
     status_out["product"] = product
-- 
2.34.1


