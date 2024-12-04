Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98871E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.21467.1733334906058967235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PwpMGrJv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fbd9be84bdso56883a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334905; x=1733939705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFA4VYSueA0SJ2dDR/xkHsPoevhxVn1ldTCtk+b/dkM=;
        b=PwpMGrJv3ZZJL1+obNjSLxwkcFrnxyg9H1lGSpghO/XxPnLpC6XoTO/RmcsZd6FRrf
         48ojb6mZBqr36Xm8mlKyV68xyztLlJJLA+Ec60khYrhIqBeUNacUkmqauU8HmwVLU7N/
         +Xz3dMLeY4ypolrYjEuFm8ZMQ/PUdhpRi4SMk1BfHrC26CkPEARVociPQ/iZZEy962K6
         HGpiFYiWh+FbHvRhUIpSxURwZEvYpO/3Tf/pzLXNSZXZSoBX1DVl7D7jns2r6zWWihb9
         lqnkOadLA626m7MAEWjzBYfsMhBqZ7rZM5TQRXvEjXA4jrEvs/VvWxzQSna8HjjVzwqA
         YE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334905; x=1733939705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFA4VYSueA0SJ2dDR/xkHsPoevhxVn1ldTCtk+b/dkM=;
        b=LKTOUl1GbuWBL6Z8LZFYmD5UMf4b1KeIE58M1JNDQv8Pi68VLIVqJowWIDCifjV3Bf
         aiDOSZxZoRxHMJyFBhpRYOBbSpfKoGjSyMZaswfXmSthjYOcLdnM4QEp3i0Ag4QDzopY
         +RIpbDQJsYLTeD0RBF8HePoSUkevTZ+MEek8/5UrZbb6f2xV/FlHpro7qkgnHiJyFLY8
         oWUBwInjkIVig1MvGWIdyoAv8F0IaH2zKdbZSWS6ZErjhKXy6C6MlXpx8H3Hir3SFSXa
         rDKmiPsBgVRcGeeVK9Ugzk9ZlFZ+GYrMoPJADDsNajekOnx1GM94mDyuBnjvcjzWg1mr
         U2eA==
X-Gm-Message-State: AOJu0YxcTFerNJeSU6ZS+YE3UHadBHm5cFHR9S3pFZbvfsUXYvVg8/AK
	qZQSXoaw2QJ1D9bkZNV33YuZruvYpZmgzUDHqWgriXnUcvhRkcfoZGzL4AKyUWxJWyAHYL9E9My
	k
X-Gm-Gg: ASbGncsSN3T+T67GHbsoz9jmtZwPIviCd6t2Podypu87h2jY+MLdDN5A4lcqlLVdoAa
	iXvEQJb+X7N0U17gZzDB431Q3LwV1E09xlvsNNdEdA6aOdFC/m1B1aAT1JegQ7qDa4/tdcBA6TQ
	flt/1wyXFQ4J0kSiGSBCMk35bcYGvTU0l1bSxn13kUVVduGEd4SYcbOQGi55Looaxn1axWqrslN
	48SsTbdOKO533Cj+o334SQIWdDW2gAIpinAqag=
X-Google-Smtp-Source: AGHT+IE8V74Ljwbke1J6o9g+jk61rdmpjmmeSCrkMKMOw3xclt3kaSa2unTQ0Llxm92bhyZL0vJzLw==
X-Received: by 2002:a05:6a20:748e:b0:1e0:d1f7:9437 with SMTP id adf61e73a8af0-1e1654134a8mr13635098637.38.1733334905253;
        Wed, 04 Dec 2024 09:55:05 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/38] selftest/reproducible: Clean up pathnames
Date: Wed,  4 Dec 2024 09:53:56 -0800
Message-Id: <13d844b15deba49a54676fa6f83ab4526ec74b9a.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208312

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several problems with these paths. Firstly they contain full
system paths which depend upon where the test was run. These are pretty
pointless and just take up a lot of space making the results files large.

Secondly, they contain the same path twice. The reference and target path
will always be the same thing in two different locations.

Strip off the prefix and remove the duplication. This does change the output
data but that can't really be avoided. It does shrink the results data and makes
it more readable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81a44de36e864b08687451fd85aeba7c529fd7f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index df7d9cc159..08c23227d3 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -191,7 +191,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def write_package_list(self, package_class, name, packages):
         self.extraresults['reproducible']['files'].setdefault(package_class, {})[name] = [
-                {'reference': p.reference, 'test': p.test} for p in packages]
+                p.reference.split("/./")[1] for p in packages]
 
     def copy_file(self, source, dest):
         bb.utils.mkdirhier(os.path.dirname(dest))
-- 
2.34.1


