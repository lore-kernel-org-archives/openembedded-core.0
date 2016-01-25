Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 60B82731E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0PF7blj013904; Mon, 25 Jan 2016 15:07:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8joj8K9exDH2; Mon, 25 Jan 2016 15:07:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0PF7YRl013899
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 25 Jan 2016 15:07:35 GMT
Message-ID: <1453734454.25948.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 15:07:34 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
Subject: [PATCH] kernel: Clean DEPLOYDIR before do_deploy runs
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
X-List-Received-Date: Mon, 25 Jan 2016 15:07:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we don't do this, the deploy sstate object contains an every
increasing number of modules tarballs and kernel images, one per
execution of "-c deploy -f".

Cleaning the directory before we start makes things much tidier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index dee6f7d..f37affc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -511,6 +511,7 @@ kernel_do_deploy() {
 		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
 	fi
 }
+do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
 



