Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 123436B1A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 02:49:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA62naOd022386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Nov 2013 18:49:36 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 5 Nov 2013 18:49:35 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Nov 2013 10:50:43 +0800
Message-ID: <167b611b04f6bb4f26ae7265d1e22263f66ba617.1383706191.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383706191.git.Qi.Chen@windriver.com>
References: <cover.1383706191.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] extrausers.bbclass: avoid infinite loop
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
X-List-Received-Date: Wed, 06 Nov 2013 02:49:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Avoid infinite loop if the last record in EXTRA_USRES_PARAMS doesn't
end with a semicolon.

It's possible the the users will write configurations like below.

INHERIT += "extrausers"
EXTRA_USERS_PARAMS = "useradd tester; useradd developer"

In such situation, the do_rootfs task will enter an infinite loop.
An infinite loop is never acceptable.

This patch fixes the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/extrausers.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 8670a2a..faf57b1 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -54,6 +54,10 @@ set_user_group () {
 				bbfatal "Invalid command in EXTRA_USERS_PARAMS: $cmd"
 				;;
 		esac
+		# Avoid infinite loop if the last parameter doesn't end with ';'
+		if [ "$setting" = "$remaining" ]; then
+			break
+		fi
 		# iterate to the next setting
 		setting=`echo $remaining | cut -d ';' -f1`
 		remaining=`echo $remaining | cut -d ';' -f2-`
-- 
1.7.9.5


