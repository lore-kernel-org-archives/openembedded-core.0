Return-Path: <sebmennetrier@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D09086D417
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:09:28 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so4986725wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=qLYYTfiaHSTy0S3grf0hUJ/Ky8Sz1z+bgAFKRpM7hLo=;
	b=GtiqIBAnXzGfq06hBPFET99/pA876VsOmjENEG+KeFk0nWeAdSsXgiCh934SYeI5J/
	lzEqSHSc0Huh6BGGOnRvS0HT3IOMGaD4/haOWJQW3j0c8GRF9zx8K+LMkUZPHzUv+J8L
	b+yYsLZWV23yryPYJJxavxWB9tLlcgK1gm0WgVh08/yFWKlj/Y9kqHFGOeRihsoNgtMh
	s2rBJfr9tRjOlRxBPxWDTFBAWOIgDCfM4G+QRdCneoZ0+MBguZ4EwJP4xIDl5PYLQ1jN
	f5Ui5PSVZPtpvoAKcE05BTcMm8mpx6ZLj2Mzx1iXofXcVa2br/Xelft7yC0HosOxHuSs
	usAA==
X-Received: by 10.180.211.111 with SMTP id nb15mr159968wic.55.1383062969875;
	Tue, 29 Oct 2013 09:09:29 -0700 (PDT)
Received: from smennetrier-desktop.mpl.mstarsemi.fr ([94.103.137.126])
	by mx.google.com with ESMTPSA id w10sm6245766wia.4.2013.10.29.09.09.28
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Oct 2013 09:09:28 -0700 (PDT)
Sender: Sebastien MENNETRIER <sebmennetrier@gmail.com>
From: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 17:09:09 +0100
Message-Id: <1383062949-12318-1-git-send-email-s.mennetrier@innotis.org>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] package_rpm.bbclass : escape "%" in files and directories name
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
X-List-Received-Date: Tue, 29 Oct 2013 16:09:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #5397]

The rpm process replace all the "%name" in the spec file by the name of
the package. So, if the package is composed of some files or directories
named "%name...", the rpm package process failed.

Replace all "%" present in files or directories names by "[%]"

Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
---
 meta/classes/package_rpm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 36bad09..6c73e37 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -662,10 +662,13 @@ python write_specfile () {
     def walk_files(walkpath, target, conffiles):
         for rootpath, dirs, files in os.walk(walkpath):
             path = rootpath.replace(walkpath, "")
+            path = path.replace("%", "[%]")
             for dir in dirs:
+                dir = dir.replace("%", "[%]")
                 # All packages own the directories their files are in...
                 target.append('%dir "' + path + '/' + dir + '"')
             for file in files:
+                file = file.replace("%", "[%]")
                 if conffiles.count(path + '/' + file):
                     target.append('%config "' + path + '/' + file + '"')
                 else:
-- 
1.8.1.2


