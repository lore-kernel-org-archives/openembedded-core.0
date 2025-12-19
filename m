Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404B2D74951
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:36 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9346.1766114608944709197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f99qIpNJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so1418898b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114608; x=1766719408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1HSsAen3I4I1sz/npG6XSWfSBhyMBvnFP2IQQwjwsI=;
        b=f99qIpNJ2SNKTHL64ac8wuoaftno1BkPC2an16sLqiKaoOo13nlYPAreBCIfV1VOPu
         Fuh876jUaTFjKF9EpMwBlg5w1Dks9BIBdO/4gs1Czn3WrGPQDbEAd9aVxfwAEdhf4ek1
         trAZaA4pCIfWHFPq3J09pvgLsQn80Hv7agB5U6YvpaHLB9XJ0MFIzhhIIWkGSpdbXiPc
         /xv6cT2zq6gs35KCSa3OE+534Z6i4ZOyQ9+0BufIQvQSBE5E2Xf5SfmjJ4i7BOkJpEIH
         /S6jCNnXcA7vD2Irkl8KeX8rjIacBl8gEv0ArOqa6aiJKSj0XpoZTR0/HO+3IMHaHlxS
         SqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114608; x=1766719408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o1HSsAen3I4I1sz/npG6XSWfSBhyMBvnFP2IQQwjwsI=;
        b=jMCpR3mQgSZbs2HqkHUTYdghxpWcZdU+IKNTBLSqcZpuO1TvYB7ZILgJEP4dWAvbjd
         NGV1wf3kmj66rVoISYAdoKi8ptT8uPYO2tC6vUOR3TWXBuUOIYnX2fd+v7MPF0xmDDa7
         VDe4d1oZ6CwTKuEiGBHaF/wqFHywma9Cc+sJgdSZxlfvc6yhIuUUPG5vSGxvprhD/tI0
         uZ0CC/eHPtMYE1sZM0IDEtdls082u2o4q5kWvmDxa0o23ZiKXl2zBEOMw4k+JIn9j1sO
         lE+78xvH8KXkHV/NrWqsIISCftcrH/rF3kud+W7A6G2MUjMK+0MCUxWMtGyUW9a47L9H
         SzdA==
X-Gm-Message-State: AOJu0YwFTHHv5Fjf/23g+zyvVgWlNsBOUOfUOjj8mgp+/NUSbzm2vaBE
	2NjRhBT9JmsoNpiKPjJ5tXoBFSla+kG9S/vYEDzsqgFpP4YeXTFidPXME2x/qg==
X-Gm-Gg: AY/fxX4p0zCN6YYwXy3ipfeJEFAQhLDm/13bcnawpfPhAbBu2cIWfw8Zbi5eboXr7Zl
	e1iuXy4cGgl7BblF5BPa1ok1AonhmxdhKC3a2KLEpSnkYUcrF4Ip7tUZ1lq70mL8EZuNcP/gYm6
	w4oUH0nInM5zhWPj8fm7ZX3NfDWPJ3SPPvax8d1QvDt5PbR85u8df1gzdkbLhwZkTvt/Hjj/Vvm
	r+6rX33yEvOFPgTajs7dvAGlI2IZfZYpwFwuyCTMzZ9TBU+uCNxAxw3MLcYk4+6cfq4oPW1so6b
	sHZt5mtmADCW6QIcHbZOBa8LmfGyKuthueR6wDcod3k0aTXmBJhLSa/t/C2qDbp+7wAZ9rKGsMP
	mKw6SAxd6HL6YW0WPAJWaGYOiNVfp2Rsa2FlXcKTbHvV5RbNstHE96lpagnrnBmUasnbbKmP/n9
	lWWtYPmQE/umCIzAnJgCONY1ep
X-Google-Smtp-Source: AGHT+IFojRFEkKxyq22wcs/fZXtpbfn+VXgSiBlJFjiYhFi3QhDz4oZ0EOX2J9BDDPXLOUA3ZOaCKw==
X-Received: by 2002:a05:6a00:ac0c:b0:7f6:fbe2:a4b7 with SMTP id d2e1a72fcca58-7ff64403b99mr1449569b3a.3.1766114608068;
        Thu, 18 Dec 2025 19:23:28 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:27 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 27/29] cups: upgrade from 2.4.14 to 2.4.15
Date: Fri, 19 Dec 2025 08:52:06 +0530
Message-ID: <20251219032209.960840-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228195

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade cups from 2.4.14 to 2.4.15.

- Fix various cupsd issues which cause local DoS (CVE-2025-61915)
- Fix unresponsive cupsd process caused by slow client (CVE-2025-58436)
- Fixed potential crash in cups-driverd when there are duplicate PPDs (Issue #1355)
- Fixed error recovery when scanning for PPDs in cups-driverd (Issue #1416)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c4ad96193c2e892aa06912808d21e7f861fb9c5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.14.bb b/meta/recipes-extended/cups/cups_2.4.15.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.14.bb
rename to meta/recipes-extended/cups/cups_2.4.15.bb
index 5d5a1dc97f..dc22771db3 100644
--- a/meta/recipes-extended/cups/cups_2.4.14.bb
+++ b/meta/recipes-extended/cups/cups_2.4.15.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699"
+SRC_URI[sha256sum] = "eff0bbd48ff1abcbb8e46e28e85aefaffa391a1d9c4d8dc92ab3822a13008d7f"

