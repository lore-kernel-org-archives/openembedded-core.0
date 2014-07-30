Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 829C56AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 06:29:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6U6TYls014891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 23:29:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 29 Jul 2014 23:29:33 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 14:26:27 +0800
Message-ID: <1406701587-23581-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH] python-smartpm: fix option typo of command channel
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
X-List-Received-Date: Wed, 30 Jul 2014 06:29:44 -0000
Content-Type: text/plain

When run smart, it fails:

root@qemu1:~# smart channel --remove-all
error: No action specified for command 'channel'

If no default value of arg 'dest' is provided in method add_option() of
optparse.OptionParser, it replaces hyphen('-') in new added option with
underscore('_') as dest.

In function ensure_action() it checks action strings with options from
optparse.OptionParser. So it is 'remove_all' which need to be checked
rather than 'remove-all'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python/python-smartpm/smart-improve-error-reporting.patch           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch b/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
index fece5b9..2ca0f6d 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-improve-error-reporting.patch
@@ -24,7 +24,7 @@ index aa76f91..63fbb35 100644
 +    opts.check_args_of_option("edit", 0)
 +    opts.check_args_of_option("enable", -1)
 +    opts.check_args_of_option("disable", -1)
-+    opts.ensure_action("channel", ["add", "set", "remove", "remove-all",
++    opts.ensure_action("channel", ["add", "set", "remove", "remove_all",
 +                       "list", "show", "yaml", "enable", "disable"])
 +    opts.check_remaining_args()
 +
-- 
1.9.1


