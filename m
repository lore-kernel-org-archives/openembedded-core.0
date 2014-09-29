Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 48B08716B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 16:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8TGj3NK008751 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:45:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WeT3SHuaWFMB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:45:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8TGj25e008748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:45:03 +0100
Message-ID: <1412009135.6893.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Sep 2014 17:45:35 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] staging: Exclude MULTI_PROVIDER_WHISTLIST from do_populate_sysroot
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
X-List-Received-Date: Mon, 29 Sep 2014 16:45:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you switch between multilib and non-multilib builds, pretty much
everything rebuilds due to the use of MULTI_PROVIDER_WHITELIST
in do_populate_sysroot. It doesn't need to do this so exclude
that variable for checksum purposes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 40ce5c5..10198fd 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -105,6 +105,7 @@ python do_populate_sysroot () {
 }
 
 do_populate_sysroot[vardeps] += "${SYSROOT_PREPROCESS_FUNCS}"
+do_populate_sysroot[vardepsexclude] += "MULTI_PROVIDER_WHITELIST"
 
 SSTATETASKS += "do_populate_sysroot"
 do_populate_sysroot[cleandirs] = "${SYSROOT_DESTDIR}"



