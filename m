Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6A96160155
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 09:47:21 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hr1so4118281wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 01:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/xCPbvE4xt24cKtoOdJGvUqaeyIXxF9VjLMcD/apPrI=;
	b=X2Hp4aTlTzhUYl6ubotlPbfIusoCQYR82Jht0r55wx+dD8+y4we8zuojXXEmGyd6ci
	aiWR4L/dRYrb29gTfElmcYJPQdA/mGHj6HrPjpeysYN+CviURfARQpvqQ1Lor0pUUOPa
	jjeg5y/aegjS740sSWfXU0nwTjUcijB8IoVpHTZYdnW0cro9+hVYU7TQpb9k41VhZhEO
	LjcH4KZOgR8SgX4Djr0F+wckPZcpycj0naYeuEvL/HAFCO7B9AFjZFDLwHRwvugiC4wx
	zT0J7G88qha593JfQrJ+AdwI3ql52UxCT/tU8O/jl5QFDHu6VGjRRJ6IaVRxUw4xklM7
	i2/Q==
X-Gm-Message-State: ALoCoQmtok/sUPZE03cRBo+5tP/prjCAvZn0zYPMGtKKBNUzts0bQvwkIbf/w1Segr7kRdqurXkU
X-Received: by 10.180.85.6 with SMTP id d6mr13801253wiz.48.1390297641787;
	Tue, 21 Jan 2014 01:47:21 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id q15sm6686517wjw.18.2014.01.21.01.47.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 01:47:21 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 10:47:12 +0100
Message-Id: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 21 Jan 2014 09:47:21 -0000

Marks original commit message and variable documentation state that stripping and splitting are independent of eachother, but package.bbclass ANDs the two INHIBIT flags to see which files can be stripped and/or split.

Original behaviour:

INHIBIT_PACKAGE_STRIP: no strip, no debug split
INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split

Behaviour after this patch:

INHIBIT_PACKAGE_STRIP: no strip, no debug split
INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/package.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 768047c..fa0b7eb 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -781,8 +781,7 @@ python split_and_strip_files () {
     kernmods = []
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
-    if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) != '1') and \
-            (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
+    if (d.getVar('INHIBIT_PACKAGE_STRIP', True) != '1'):
         for root, dirs, files in cpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
-- 
1.8.4.2


