Return-Path: <mburtin@connected-labs.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 03AD4601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:48:41 +0000 (UTC)
Received: by wizk4 with SMTP id k4so158118985wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding;
	bh=TaIG2cRMqa0V5jM0owzugHUWFIuWAFcJReB1NUt0XB0=;
	b=HyUatQF/Bn+/n6TmtujBQcQDWAKm+NCqjZPst7VwslxNx784ZmdE3whCrjxbgOLjMR
	zrD4Bjz9hFWsGR/aC4pEydQhuIgQYUvxIpAtbyxo4Omhw1r9mFEF4O5jhTQvA9IRDQRL
	OZzLV3tbp8FiRBeMhTxKZhSXENTWGfGh56AnzhCYSHqMeODvzcYLCYCBemkFJJTg5gMn
	dd6kksgFjACa1xluOIb4jqddTWKY0kLxOYtxkkWLZ/6mz1v7WXHGIiliA0w7LGwVMR6N
	pN7Zm3ppN/cwXGyzBe5WUDlga3NOQXFG79r3YKPAPUYIOOz31/iDcELUnYgjE1lXtm7+
	OpRw==
X-Gm-Message-State: ALoCoQlzFO5fekyOgoZ2R/5gBw938qC8tX54ubKUUO0tTgkJZrkyFC7lE9cJUNOaTSFiYqng34rc
X-Received: by 10.194.177.133 with SMTP id cq5mr30324888wjc.145.1432133322119; 
	Wed, 20 May 2015 07:48:42 -0700 (PDT)
Received: from mburtin-desktop.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id x3sm3834402wiy.20.2015.05.20.07.48.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 May 2015 07:48:41 -0700 (PDT)
Sender: =?UTF-8?Q?Micha=C3=ABl_Burtin?= <mburtin@connected-labs.com>
From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <mburtin@voxtok.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 16:48:19 +0200
Message-Id: <1432133299-2215-1-git-send-email-mburtin@voxtok.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <smennetrier@voxtok.com>,
	=?UTF-8?q?Micha=C3=ABl=20Burtin?= <mburtin@voxtok.com>
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
X-List-Received-Date: Wed, 20 May 2015 14:48:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sébastien Mennetrier <smennetrier@voxtok.com>

The rpm process replace all the "%name" in the spec file by the name of
the package. So, if the package is composed of some files or directories
named "%name...", the rpm package process failed.

Replace all "%" present in files or directories names by "%%%%%%%%" to
correctly escape "%".

Signed-off-by: Sébastien Mennetrier <smennetrier@voxtok.com>
Signed-off-by: Michaël Burtin <mburtin@voxtok.com>
---
 meta/classes/package_rpm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e305e8b..3e8ae3d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -196,6 +196,7 @@ python write_specfile () {
             path = rootpath.replace(walkpath, "")
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
+            path = path.replace("%", "%%%%%%%%")
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
@@ -214,6 +215,7 @@ python write_specfile () {
                 for dir in dirs:
                     if dir == "CONTROL" or dir == "DEBIAN":
                         continue
+                    dir = dir.replace("%", "%%%%%%%%")
                     # All packages own the directories their files are in...
                     target.append('%dir "' + path + '/' + dir + '"')
             else:
@@ -227,6 +229,7 @@ python write_specfile () {
             for file in files:
                 if file == "CONTROL" or file == "DEBIAN":
                     continue
+                file = file.replace("%", "%%%%%%%%")
                 if conffiles.count(path + '/' + file):
                     target.append('%config "' + path + '/' + file + '"')
                 else:
-- 
2.1.4


