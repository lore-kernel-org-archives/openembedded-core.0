Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2BE7D894
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:44:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549900800"; d="scan'208";a="58924079"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Apr 2019 14:44:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A203D4CD810E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 14:44:56 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 10 Apr 2019 14:45:00 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2019 23:44:10 +0800
Message-ID: <1554911050-2472-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: A203D4CD810E.A98E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] sanity: check_perl_modules bug fix
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
X-List-Received-Date: Wed, 10 Apr 2019 06:44:53 -0000
Content-Type: text/plain

Fix Python3 TypeError error in check_perl_modules:

Executing bitbake, the following error message will be throwed:

  File ".../poky/meta/classes/sanity.bbclass", line
979, in check_sanity_eventhandler
    check_sanity(sanity_data)
  File ".../poky/meta/classes/sanity.bbclass", line
943, in check_sanity
    check_sanity_version_change(status, sanity_data)
  File ".../poky/meta/classes/sanity.bbclass", line
637, in check_sanity_version_change
    status.addresult(check_perl_modules(d))
  File ".../poky/meta/classes/sanity.bbclass", line
563, in check_perl_modules
    errresult += e.output
TypeError: must be str, not bytes

So here, transfer e.output from bytes to str.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4cbb1f3..9429202 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -560,7 +560,7 @@ def check_perl_modules(sanity_data):
         try:
             subprocess.check_output(["perl", "-e", "use %s" % m])
         except subprocess.CalledProcessError as e:
-            errresult += e.output
+            errresult += bytes.decode(e.output)
             ret += "%s " % m
     if ret:
         return "Required perl module(s) not found: %s\n\n%s\n" % (ret, errresult)
-- 
1.8.3.1




