Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id CCC467478E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 19:17:01 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d14-v6so2673487pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=h1fcyFhOWaXb9W4bQRWa3jXY9CPs6Sldshy1y3j7FNw=;
	b=Kr49q59WUd6of/yLEJRaFqSoOvc/OqhXJkmSO1pr8dlOKHKVW0t0TDIy2WIh3QiE3h
	9OymjfRtF7WsCVO8vOlepjDu4fGploeVlm/5+2mIB9aIhgpmMejpRXu6SYSoEW10C0bL
	ODep4SvLe/xX8L636JZqtQhhLQoiNch1YRDlGdeLe4HUj2xxQ8MjthBPBOwP7BxGohoo
	EPhOSH2gI7o08881VMi3m48VZMNpkFA6KKol4DUTlYmMdp0G33t0elQXJ7/xsCT8YDrU
	HtrHLZzAi3rHejhaHqp6iFbCmUkfH0a2OXiUqZL3o1ngdSLxNacuTj8KH7CVRFDHm6Y+
	q6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h1fcyFhOWaXb9W4bQRWa3jXY9CPs6Sldshy1y3j7FNw=;
	b=XvRoqkKV2IUWqwcFkT8+5RG6AvJRdfbdqF3xULRDPcX4bJ16J0NVUp9/mIWqql/mQ4
	SCVJ2V3dcLoQTJODKPquwW2n9qVOY8fbD86Yvi7jGo7Gd/W0wbsry81vvM4jQtMc4EWJ
	AIuHFuIQiPqxSXxgljLhFTHnKmCVcOIpBWsMLtPbPa8B8pBEUz5lrq88/fXGpxKIup+J
	RgA/X2TKHfYvcS+wUMcyw/PPOWhdcUJ1OqBSxdFKiHBausDRwvu5ltydksBLVDgVKX2M
	2JZ0xe3hPbitMVVUy8GnH0E9NjgelXjUb1txoj0E5h8Xt4HSJS6qwFHMPuOESYxyzDMz
	0O5w==
X-Gm-Message-State: ALKqPwcRFfFaA6kTYwRMfbjVfRsEKr/plWdlyJcoTAEp/sVi2mjQntLZ
	I6ePkrCq9QpEvPojvzA++/1hnA==
X-Google-Smtp-Source: AB8JxZqVVG7iyn+P3hraPh1E3oIqBwkpSWOlbPAs9rwLoU0xJ9MC8cL6tTQtpJ0JsIkHEwCT8ns65g==
X-Received: by 2002:a63:6e05:: with SMTP id
	j5-v6mr3005656pgc.150.1527275822364; 
	Fri, 25 May 2018 12:17:02 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h65-v6sm60154782pfj.54.2018.05.25.12.17.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 12:17:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 12:16:54 -0700
Message-Id: <1527275816-6705-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH 1/3] package.bbclass: use single quotes for path passed to file in isELF()
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
X-List-Received-Date: Fri, 25 May 2018 19:17:01 -0000

Apparently there are recipes in the wild which generate files with
filenames containing '$' characters - which cause errors during
packaging.

Instead of adding another special case to escape '$' characters when
constructing the command passed to oe.utils.getstatusoutput(), switch
to using single quotes to quote the path - and therefore make isELF()
consistent with the way filenames and paths are quoted by every other
caller of oe.utils.getstatusoutput() in oe-core.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 7877761534b0c2492da6289e9f2269d41b6ed464)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a6f0a7a..531ca4a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -892,7 +892,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
-- 
1.9.1


