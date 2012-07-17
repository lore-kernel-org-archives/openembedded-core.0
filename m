Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrAQ4-0001Id-GO
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:14:40 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so446616bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HV1TS/9Pr9pOSxBoZhMrkDLjo96A5X0rzmUjrcpN+/I=;
	b=cMETQLSwzsa0dA2EhbnoeTA5Yo1W6FKo6BLgqXrGLCvNy+lUFTt3/hgYiQJRB6HgIu
	M9er1Mr5rh0gU8rY522bGZn6+Z736qM04IqUp0I43pWh5GJLIcur7eZ9K0qnh9GnzFBi
	LikK+OAmjN9JEIdU3z9ktYCbnEsC1OIKOncXoBDYKMAfmqz/lYf1QaTTzdPxq73FL+r6
	LI+8+wRwmYu7X8kM8KsQejSd8STviD56mSDkH1jprhs28ybSQn2zKsDnp1PEnGe9NkhD
	OusjmffGH8c6nmHis6pi6nF/wnStGiKDcS08bxJjTspL3Tf84Vl8/B6qpC1ApyN0CH6l
	eWfg==
Received: by 10.204.148.83 with SMTP id o19mr1599165bkv.74.1342541003127;
	Tue, 17 Jul 2012 09:03:23 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id 25sm10326092bkx.9.2012.07.17.09.03.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:03:22 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:03:08 +0300
Message-Id: <eb7f8d63b38012eff32b77de87606c460e0772a8.1342540673.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342540673.git.andrei@gherzan.ro>
References: <a>
	<8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342540673.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342540673.git.andrei@gherzan.ro>
References: <cover.1342540673.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmhVXtKukflPdztkjoDX4GgHvfi0mFsKuh/LEKjdYPg04n91aeiI6UJjTdbUI6l8HjW3wDQ
Subject: [PATCH V2 2/3] connman.inc: Add missing dependencies needed by some tests
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
X-List-Received-Date: Tue, 17 Jul 2012 16:14:40 -0000

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



