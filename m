Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C096A70734
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 10:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9AAYsR5005624; Fri, 10 Oct 2014 11:36:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xakxvpWph4Cb; Fri, 10 Oct 2014 11:36:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s9AAaP82005705
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 10 Oct 2014 11:36:26 +0100
Message-ID: <1412937419.10719.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 10 Oct 2014 11:36:59 +0100
In-Reply-To: <54372DEF.7080101@windriver.com>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
	<543719D4.9080308@windriver.com>
	<CAP9ODKqHaOc6W0+WpyrdhQjXWaD++MdfMiUFWh0aKZVC0uJq8Q@mail.gmail.com>
	<54372DEF.7080101@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] toolchains-scripts: Add support for target environment scripts
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
X-List-Received-Date: Fri, 10 Oct 2014 10:37:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In a similar way to the previous script which adds support for native
environment scripts, this adds support for target environment scripts
too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 11ffbe5..2244cf7 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -76,6 +76,11 @@ toolchain_shared_env_script () {
     cat >> $script <<EOF
 
 # Append environment subscripts
+if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
+    for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
+	    source \$envfile
+    done
+fi
 if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
     for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
 	    source \$envfile



