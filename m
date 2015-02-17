Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A23371F05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1HMZitV027061 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:35:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TfJwe43sKqZs
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:35:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1HMZTOQ027043
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:35:40 GMT
Message-ID: <1424212529.25541.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 22:35:29 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] systemd: Extend searchpath to include user based unit files
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
X-List-Received-Date: Tue, 17 Feb 2015 22:35:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently we only handle system unit files. Pulseaudio adds user components
so add these to the search paths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c34884b..bb77c24 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -138,6 +138,7 @@ python systemd_populate_packages() {
         searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
         searchpaths.append(oe.path.join(d.getVar("nonarch_base_libdir", True), "systemd", "system"))
         searchpaths.append(oe.path.join(d.getVar("exec_prefix", True), d.getVar("nonarch_base_libdir", True), "systemd", "system"))
+        searchpaths.append(oe.path.join(d.getVar("exec_prefix", True), d.getVar("nonarch_base_libdir", True), "systemd", "user"))
         systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
         has_exactly_one_service = len(systemd_packages.split()) == 1
         if has_exactly_one_service:



