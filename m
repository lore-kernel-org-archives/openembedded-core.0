Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id B3A8A737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:24:35 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so59860791igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 02:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=b3rzBEV3IHbOWU/6ec7bQUb83wuUFcIoSPh0/UCCs5g=;
	b=dKy7Ak6L2z6G8ouNDM3g7nsYDK+5fh37blKjIQ0xB48JHXWqPv/ew8FYA7geztCdhg
	P1ctSYdeSleRqOCE+mG+98ld1kl2JzjlDNGQGfxpvozQIZ6Uc0DJO33+86YocuK2xvHW
	q01wT3RdOOocKafHStxb8og4iuIbePTRlT7Vm7HXnZo1PLAo0K1dHsS7twulsNfzmrkm
	fKTph29lPigoXYv+1F7VROqVrG/NwsK1GZgl9NlAp7npxG4S8MwlFMZ4djJ1pNcH7Z6y
	LygdgtxQeQp1yYSQRVIGSDfWwcEPo5+HPiAbTNfZdRSIvgNkVjIw6YF8J4D4kmoYx4sv
	35mA==
X-Gm-Message-State: ALoCoQkEofxRpYhhqTQG4hychjtnoPYFjfsy5vJKZdV+awkNw8dmRC7hPuvvgtEmz5UF3MN1Pawi
X-Received: by 10.50.79.233 with SMTP id m9mr18707212igx.45.1428571476999;
	Thu, 09 Apr 2015 02:24:36 -0700 (PDT)
Received: from syncev.vlan14.01.org (p5DE8CDA6.dip0.t-ipconnect.de.
	[93.232.205.166])
	by mx.google.com with ESMTPSA id s5sm3251036igh.6.2015.04.09.02.24.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 02:24:35 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 02:24:23 -0700
Message-Id: <3f62af56bcd0df857a22bb5fcef6b19224ac2012.1428571193.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <a7349833ae2b74d2bb145dcd0fef8c95db1ae8e7.1428571193.git.patrick.ohly@intel.com>
References: <a7349833ae2b74d2bb145dcd0fef8c95db1ae8e7.1428571193.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1428571193.git.patrick.ohly@intel.com>
References: <cover.1428571193.git.patrick.ohly@intel.com>
Subject: [PATCH 2/3] oeqa/runtime/systemd.py: skip instead of failing without avahi
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
X-List-Received-Date: Thu, 09 Apr 2015 09:24:36 -0000

The SystemdServiceTests assume that avahi-daemon is installed,
which is not necessarily the case depending on the image being
tested.

Better check this dependency before starting the tests and skip
them if the service is not installed. This has to be done for
each test instead of for the entire module, because other
tests in the module can run without avavi.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oeqa/runtime/systemd.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime/systemd.py
index 5935edd..c74394c 100644
--- a/meta/lib/oeqa/runtime/systemd.py
+++ b/meta/lib/oeqa/runtime/systemd.py
@@ -67,13 +67,19 @@ class SystemdBasicTests(SystemdTest):
 
 class SystemdServiceTests(SystemdTest):
 
+    def check_for_avahi(self):
+        if not self.hasPackage('avahi-daemon'):
+            raise unittest.SkipTest("Testcase dependency not met: need avahi-daemon installed on target")
+
     @skipUnlessPassed('test_systemd_basic')
     def test_systemd_status(self):
+        self.check_for_avahi()
         self.systemctl('status --full', 'avahi-daemon.service')
 
     @testcase(695)
     @skipUnlessPassed('test_systemd_status')
     def test_systemd_stop_start(self):
+        self.check_for_avahi()
         self.systemctl('stop', 'avahi-daemon.service')
         self.systemctl('is-active', 'avahi-daemon.service', expected=3, verbose=True)
         self.systemctl('start','avahi-daemon.service')
@@ -82,6 +88,7 @@ class SystemdServiceTests(SystemdTest):
     @testcase(696)
     @skipUnlessPassed('test_systemd_basic')
     def test_systemd_disable_enable(self):
+        self.check_for_avahi()
         self.systemctl('disable', 'avahi-daemon.service')
         self.systemctl('is-enabled', 'avahi-daemon.service', expected=1)
         self.systemctl('enable', 'avahi-daemon.service')
-- 
1.8.4.5


