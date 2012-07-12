Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpNps-0003kC-PO
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:09:56 +0200
Received: by ggnp4 with SMTP id p4so2530236ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 10:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HV1TS/9Pr9pOSxBoZhMrkDLjo96A5X0rzmUjrcpN+/I=;
	b=MyBwwOHWuDQmiyr9XF/oUg6+gDxQl/WmUjXprEOir1qsugia00wbD/XJrWd6BPh97U
	kVrGFwFoyQx5kIn30ecjbpp997tbKtavIvs06S7ilWHxZh1tXfHehwsbHjvhX2wNztok
	6vEbBv64Sc/DocswaLl4GwlvAAx29N6H4/p0dURwZrsyoE4IzXdlO6exa5RMcWLuawFC
	MxuMOUX3nc3ccfF9eQsqdCLnt1pxF7XfeMnl9VDN/czOx9H2OSd7OBwehuDOJiZb2txp
	qzG7M2RZ4QYhDrNy+B0gklC3CHqdYcJRvRKQAzKpb2cF0zgg6PmvqDGaASWubYvbMrNL
	gb8Q==
Received: by 10.50.186.196 with SMTP id fm4mr18328454igc.34.1342115921848;
	Thu, 12 Jul 2012 10:58:41 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id dw5sm12369igc.6.2012.07.12.10.58.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 10:58:41 -0700 (PDT)
From: andrei@gherzan.ro
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 20:58:30 +0300
Message-Id: <48e46c28bc9fb10fc5fe491d48a769bdf1d93361.1342115559.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <16418209b96e9a5d79efe74290d13a67c9aed91f.1342115559.git.andrei@gherzan.ro>
References: <16418209b96e9a5d79efe74290d13a67c9aed91f.1342115559.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342115559.git.andrei@gherzan.ro>
References: <cover.1342115559.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmPz5u3n6Zpg0Ev3xXPjEdKLKva/yoOrjWMC6+2h7/dqsYhQFyQr7xrgpCP1L++LahqBUvP
Subject: [PATCH 2/2] connman.inc: Add missing dependencies needed by some tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 18:09:57 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Some tests need:
* gobject and optparse module (ex: test-session)
* subprocess and fnctl module (ex: backtrace)
* urllib module (ex: get-proxy-autoconfig)

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 12378e9..58cac0b 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -113,7 +113,7 @@ PACKAGES =+ "${PN}-tools ${PN}-tests"
 FILES_${PN}-tools = "${bindir}/wispr"
 
 FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
-RDEPENDS_${PN}-tests = "python-dbus"
+RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-subprocess python-fcntl python-netclient"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
-- 
1.7.9.5



