Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.97])
	by mail.openembedded.org (Postfix) with ESMTP id B80747182C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 12:48:19 +0000 (UTC)
Received: from [216.82.254.211] by server-1.bemta-7.messagelabs.com id
	67/A3-02996-49833E45; Tue, 17 Feb 2015 12:48:20 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-201.messagelabs.com!1424177299!9311786!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.13.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4382 invoked from network); 17 Feb 2015 12:48:20 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-4.tower-201.messagelabs.com with RC4-SHA encrypted SMTP;
	17 Feb 2015 12:48:20 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Tue, 17 Feb 2015 06:48:25 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 17 Feb 2015 06:48:18 -0600
Received: from log-cln-jviguera.digi.com (10.101.2.54) by
	dor-sms-xch01.digi.com (10.49.8.99) with Microsoft SMTP Server (TLS) id
	14.3.224.2; Tue, 17 Feb 2015 13:48:16 +0100
From: Javier Viguera <javier.viguera@digi.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 13:48:14 +0100
Message-ID: <1424177294-41586-1-git-send-email-javier.viguera@digi.com>
X-Mailer: git-send-email 2.3.0
MIME-Version: 1.0
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: [PATCH][master][dizzy][daisy] utils.bbclass: fix create_cmdline_wrapper
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
X-List-Received-Date: Tue, 17 Feb 2015 12:48:27 -0000
Content-Type: text/plain

Similar to commit 4569d74 for create_wrapper function, this commit fixes
hardcoded absolute build paths in create_cmdline_wrapper.

Otherwise we end up with incorrect paths in users of this function. For
example the 'file' wrapper in current released toolchain:

exec -a
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-arm/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-file/5.18-r0/image//opt/poky/1.7.1/sysroots/x86_64-pokysdk-linux/usr/bin/file
`dirname $realpath`/file.real --magic-file
/opt/poky/1.7.1/sysroots/x86_64-pokysdk-linux/usr/share/misc/magic.mgc
"$@"

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta/classes/utils.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 0f2a48409170..80e90e87778b 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -259,11 +259,11 @@ create_cmdline_wrapper () {
 	echo "Generating wrapper script for $cmd"
 
 	mv $cmd $cmd.real
-	cmdname=`basename $cmd`.real
+	cmdname=`basename $cmd`
 	cat <<END >$cmd
 #!/bin/bash
 realpath=\`readlink -fn \$0\`
-exec -a $cmd \`dirname \$realpath\`/$cmdname $@ "\$@"
+exec -a \`dirname \$realpath\`/$cmdname \`dirname \$realpath\`/$cmdname.real $@ "\$@"
 END
 	chmod +x $cmd
 }

