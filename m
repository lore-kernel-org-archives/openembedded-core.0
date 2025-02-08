Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D42C021A2
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 07:25:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.5056.1738999494098745908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 23:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V7xv0qGE;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38db570a639so1590208f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 23:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738999492; x=1739604292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=V7xv0qGEzFWgI+oPcfL6L4qU9N4bM760hcCKln2lGLik9lpv6uWLn9T0Phxlh3riLC
         jY+V4BKCvfWwG1U8MX9Fcqm47ZY6nbsfmbjlD2IqHYlV5Q4N3zV9Gnkm6Qei33Dz7TvY
         ifWXPAumPyTMo6yr6kxMJktFt4ZIuopmNPs4FoERTmRdKlUnJBXnOSQjX1Wo4ewZ7XHK
         hmGrdZg3dV1+VqMYAk3HpLRtqAG1G9cqm8KfQiKL395c9tpmuDTtDwa08YIZlCKMrOhd
         L+ChjH6l9JhRizZEe7qeV+xYFmrDcfl0LSpZ1ofa+Cf/EK47KEcnjQHc4aJq8oN/4Kbu
         ruug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738999492; x=1739604292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o22mLFF8SWm+DMx5EKMnMfIHDngILKUVZecNoG69GG8=;
        b=k0p+cfIdCUW8RnfR7JaKIYsKjyGAvgr5yu4rGU+i2sRv3I0gat6a4hJT8tFMYPd5hJ
         QvpYECHAYqgSFJ8B5IrPQ6qEGs3XJgd1tBtpI2xyikcXEoyWQDYNzHqgLPlu0iC9MW9S
         54KQDUN1aLHvlVEqKN2jwpHY3EEZtI+kVFaQt4QZl5Rm11mm4aBizdCOK74MEAMA95/1
         i82rU56I6i+lWOxly9F/itX7WrOOpS1Beu7CrS7f0bddr2LxgciQvywzElKPpYlwJE7e
         MePSWi+LKaFTYVXa3UqQM+iinfqTyof72WYKAia+V8PdYVZQ/1Nw8cKPeNvcIJe6KssA
         iGdQ==
X-Gm-Message-State: AOJu0Yy83h/kW+fzYCq5m+3+aZ6A9KZDullgJHy4t+hamDKkffZbDtjR
	tXwkW0TDzaevJxPeplU0VKLtk16lUC1LNcJUhB+lCuFN0sj15J2oI7ZaqQ==
X-Gm-Gg: ASbGnctUs98SgOsrCnTrX5WBnhHIMpjIsQpgyF+n2dylkHDnqY6FglqKZrFbDuyMMF7
	tqFJkgfrNqZHZCekEQOFTvAb9aD9xdyUTN4EuE02i8339/iq3/fCJZv+dONJ2MUSdazDdMQaLZD
	4IXXgILkLWhFtHwpDV9bb56bUkrvvWCBZu7U4DPVAZ0DDy/3SvBCaSjv6RPk2AzssnV609trNB+
	AJq5y1abwAUakhBUJfzthEJ/KnwjQ+21PHdIKUM0yXsQBwFyCfkKPFCL+QH0y4ld8wmZQnn0MQE
	mPkRwGrd2yEipNPC8tKMCGEZ4BAGXBW4gRi69IaD6G0BsA==
X-Google-Smtp-Source: AGHT+IF2Wr5p5j+le8pix5FdztNC/hXBjNQafE3zJhRiMoKpRgQer7b1keUoKPdQwKtBJ34twjJW7A==
X-Received: by 2002:adf:cc92:0:b0:38b:ee9f:52d5 with SMTP id ffacd0b85a97d-38dc995c031mr3578701f8f.16.1738999492179;
        Fri, 07 Feb 2025 23:24:52 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd07fa80csm2178356f8f.13.2025.02.07.23.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 23:24:51 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v10 5/5] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Sat,  8 Feb 2025 08:24:45 +0100
Message-ID: <20250208072445.986573-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208072445.986573-1-zboszor@gmail.com>
References: <20250208072445.986573-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 07:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211018

With all the pieces in place, the self test can be re-enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..4df45ba032 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +83,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
-- 
2.48.1


