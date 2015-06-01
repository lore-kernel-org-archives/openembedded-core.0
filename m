Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 98F2175681
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LENaw007311 for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:14:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JDDp5HvG2Aap
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 22:14:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LEAmC007308
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:14:21 +0100
Message-ID: <1433193250.404.177.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Jun 2015 22:14:10 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] soc-family.inc: Add a default SOC_FAMILY value
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
X-List-Received-Date: Mon, 01 Jun 2015 21:14:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Otherwise, if MACHINEOVERRIDES is expanded before SOC_FAMILY is set
(which may happen as MACHINEOVERRIDES is included in OVERRIDES) we can
see:

ExpansionError: Failure expanding variable MACHINEOVERRIDES, expression was
${@['', '${SOC_FAMILY}:']['${SOC_FAMILY}' != '']}p1022ds
which triggered exception SyntaxError: EOL while scanning string literal (MACHINEOVERRIDES, line 1)

To avoid this, give SOC_FAMILY a default empty value so it doesn't
get read as None.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/machine/include/soc-family.inc b/meta/conf/machine/include/soc-family.inc
index 0251da0..1ff0899 100644
--- a/meta/conf/machine/include/soc-family.inc
+++ b/meta/conf/machine/include/soc-family.inc
@@ -1,2 +1,3 @@
 # Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' and 'ti335x'
+SOC_FAMILY ??= ""
 MACHINEOVERRIDES =. "${@['', '${SOC_FAMILY}:']['${SOC_FAMILY}' != '']}"



