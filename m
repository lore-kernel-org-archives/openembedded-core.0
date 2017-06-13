Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01623782E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:49:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5D9nrTD024616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Jun 2017 10:49:54 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dKiSP-0002Yb-Qo; Tue, 13 Jun 2017 10:49:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 10:49:50 +0100
Message-Id: <1497347392-9776-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 13 Jun 2017 10:49:54 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/5] utils: Exclude OVERRIDES from hashes in multilib functions
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
X-List-Received-Date: Tue, 13 Jun 2017 09:49:56 -0000

---
 meta/classes/utils.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 96463ab..081e662 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -369,6 +369,7 @@ def get_multilib_datastore(variant, d):
     localdata.setVar("OVERRIDES", overrides)
     localdata.setVar("MLPREFIX", variant + "-")
     return localdata
+get_multilib_datastore[vardepsexclude] = "OVERRIDES"
 
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
     """Return a string of all ${var} in all multilib tune configuration"""
@@ -431,6 +432,7 @@ def all_multilib_tune_list(vars, d):
         values[v].append(localdata.getVar(v))
         values['ml'].append(item)
     return values
+all_multilib_tune_list[vardepsexclude] = "OVERRIDES"
 
 # If the user hasn't set up their name/email, set some defaults
 check_git_config() {
-- 
2.7.4


