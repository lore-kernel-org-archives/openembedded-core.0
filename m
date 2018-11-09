Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 946156C1F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:20 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id 74-v6so2084088wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Bqw1i8PtZUHciR+JSoNSdZeG9yyA2Gl4sEwwjcXQscY=;
	b=LshgsES7toZKYp2zQJzVUP4Lli32C8kBGcF7bnYmrH7gNkZtcyPCPV8jF5JZsJEb4m
	xuNwd8iBFkHL9dLFHAnCaaCnF9IyneR23FTRQ5KiYYZzBIQZclGyDxtCGCZRWHBpF21k
	I8jACiFA86IvPFy3AAWQV2fIB+6H5cxQbzg84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Bqw1i8PtZUHciR+JSoNSdZeG9yyA2Gl4sEwwjcXQscY=;
	b=ebGe9wLZaKVUs0Hu2v26IICZJVYT+rnJ0EYIZ9UfLayRt87ga3Mmx5xgT6dqqnJYN0
	DTBNWpIckSUHUwL/+pDQ9Ed8quNh6Sq3dpCzgUnAU5RfLItlid5MROwgSkuJWpRvuKyQ
	V4oYfGSVQgfx4aRWERTH8/koupZrTQGSBARxlGZZzoMYDFjfZKHhCB9oTB//swzs9sEN
	5dghZBsZxAGLUIxFWH7DQp2BF0WA4CRozCvEd3EcMXD8Bgz5PUA6wDbFxw0YNAMpk9dK
	8oh2Sz1oYjzUR4F8zv0tF8ei6ODhxpzl+8xSjCbxEHf9AYey6lUWdAKeewTjD6CPQGzW
	VmtA==
X-Gm-Message-State: AGRZ1gJ8TqBlyk7QrmACi3QWsgdA0aJdFD3sVyv9TjAT00jhLAZbU1dW
	YiK2/983x64vfig/7k1SClLCpw55GAM=
X-Google-Smtp-Source: AJdET5fEgTiHBmCSVbJdXPjPMJxACLqTQwYn/HcNPIEhPp6vPCKN3+4CEV8P1lo5UydkBn91vGvpVQ==
X-Received: by 2002:a5d:4406:: with SMTP id
	z6-v6mr8390582wrq.294.1541773760895; 
	Fri, 09 Nov 2018 06:29:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:07 +0000
Message-Id: <20181109142912.23102-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/12] oeqa/runtime/utils/targetbuildproject: Use a subdir within ~/
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Nov 2018 14:29:21 -0000

Without doing this, the code can and sometimes does try and do "rm ~/"
which I think we'd all prefer it didn't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/utils/targetbuildproject.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
index 5af55d736e4..de17ba01f89 100644
--- a/meta/lib/oeqa/runtime/utils/targetbuildproject.py
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -7,10 +7,12 @@ class TargetBuildProject(BuildProject):
 
     def __init__(self, target, uri, foldername=None, dl_dir=None):
         self.target = target
-        self.targetdir = "~/"
+        self.targetdir = "~/buildtest/"
         BuildProject.__init__(self, uri, foldername, dl_dir=dl_dir)
 
     def download_archive(self):
+        self.target.run("mkdir " + self.targetdir + " || true")
+
         self._download_archive()
 
         status, output = self.target.copyTo(self.localarchive, self.targetdir)
-- 
2.17.1


