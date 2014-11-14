Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCB9565CD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 23:53:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAENrsqu028400
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 15:53:55 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 14 Nov 2014 15:53:54 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 17:53:53 -0600
Message-ID: <1416009233-188121-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH][dizzy] toolchain-shar-template.sh: Do not offer sudo as an option
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
X-List-Received-Date: Fri, 14 Nov 2014 23:54:02 -0000
Content-Type: text/plain

From: Jeffrey C Honig <jeffrey.honig@windriver.com>


NOTE: This is being set to the list for Yocto Project compliance,
we don't expect this patch to be merged!


We do not want to offer our users the ability to automatically run
sudo.

Using sudo from within a script can be considered a potential
security issue by some customers.

This also ensures that the person doing the installation understands
the ramifications of where they are installing the code.

WR SDK extensions may not work properly if owned by root as well.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/files/toolchain-shar-template.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/files/toolchain-shar-template.sh b/meta/files/toolchain-shar-template.sh
index d79797d..6334e14 100644
--- a/meta/files/toolchain-shar-template.sh
+++ b/meta/files/toolchain-shar-template.sh
@@ -99,6 +99,7 @@ mkdir -p $target_sdk_dir >/dev/null 2>&1
 
 # if don't have the right to access dir, gain by sudo 
 if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; then 
+	echo "Sorry, you do not have permission to install the SDK to \"$target_sdk_dir\"." && exit 1
 	SUDO_EXEC=$(which "sudo")
 	if [ -z $SUDO_EXEC ]; then
 		echo "No command 'sudo' found, please install sudo first. Abort!"
-- 
1.9.3


