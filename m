Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id EA37D6080F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 16:40:59 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a66so86940105wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=IJqlIi/vcV+XimedLUOHJQAnmbPD8I4yqTaeDaxLWAA=;
	b=mkjnmJqnF4D0S3yo/ZJ3IvZMtUSTuoBWS4GifmYj1vHWDYtT54zV91nBNGoksrpBYX
	aUu77VGilCBQw2ssLzg2QVfzp+YyeczOuNMFTiG4g/7tW0FzSAIyPZzOyFWRSIkkmJi7
	Vk+go6NrPm0AVEHL6lhwQiXqhYQjAKkpcquZsM5K571N+QNG5e27HTNrd+zXIEnHV56G
	qGxmlU/NADZbwPgqoHrYbvs07e1d6Dhr6SCYYbcT56bdMFIK5dSJSus5rAyAHDR4O3Dl
	WsNjiljB8O0mgh3lVx1Pqwlui8iBi2obmXH4ESGg8leBUqyO2/bhgSBb+fxlMSLvg0o7
	LrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IJqlIi/vcV+XimedLUOHJQAnmbPD8I4yqTaeDaxLWAA=;
	b=SIONxe2nuoUbbxWxxe0MKytEzGJ8H5cvYKwdlwC4GcGmOPtooUV5JK8wQuj2ASJn2x
	CCRwOnMElIyXw+XFFi4rN4yFWaFsaE1WWqYJyacJpG7HHzJegSFqPmWTmVMljx2sC/nF
	hegqzBIPCc4O3UkqCFJ1YGsKO3yTCzQsDd8p4QDq+cxsYZ/08RBecdi1+EegBBg1jjBV
	W/aradWE+UfJkKolGGS1wSMAG02FzRde7U2SOul5HzpOpeih7n4jnHP8zCg75W6cvv9J
	IG4Eyrs7MXjlucNCQXggfGzUf5lySQE/t0bjNDA5WfficZENvUsCcfn4Wykpaj+V0Wbx
	NRSg==
X-Gm-Message-State: ALyK8tLwjJNsByxk66WHSOb2aqJVVatIg1Y7oAZxFfpWpiP5qX15eKBgc9jn2DPuPy8lu+MF
X-Received: by 10.194.0.178 with SMTP id 18mr17161413wjf.64.1466440859276;
	Mon, 20 Jun 2016 09:40:59 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id kc8sm659236wjb.0.2016.06.20.09.40.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 09:40:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 17:40:52 +0100
Message-Id: <1466440854-16120-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/3] oeqa/targetbuild: fix folder name estimate logic
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
X-List-Received-Date: Mon, 20 Jun 2016 16:41:01 -0000

The re.sub() used to transform a tarball into a best guess folder name wasn't
right, as there isn't enough escaping and tar.xz was missing.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index d538f6b..6177a12 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -17,9 +17,10 @@ class BuildProject(metaclass=ABCMeta):
         self.uri = uri
         self.archive = os.path.basename(uri)
         self.localarchive = os.path.join(tmpdir,self.archive)
-        self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
         if foldername:
             self.fname = foldername
+        else:
+            self.fname = re.sub(r'\.tar\.bz2$|\.tar\.gz$|\.tar\.xz$', '', self.archive)
 
     # Download self.archive to self.localarchive
     def _download_archive(self):
-- 
2.8.1


