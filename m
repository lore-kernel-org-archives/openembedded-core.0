Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 409 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Jun 2014 15:17:01 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.9])
	by mail.openembedded.org (Postfix) with ESMTP id EFCE66FEE6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:17:01 +0000 (UTC)
Received: from [216.82.249.147:36556] by server-9.bemta-12.messagelabs.com id
	58/D6-09667-5D80F935; Mon, 16 Jun 2014 15:10:13 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-10.tower-29.messagelabs.com!1402931412!30490736!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14618 invoked from network); 16 Jun 2014 15:10:12 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-10.tower-29.messagelabs.com with RC4-SHA encrypted SMTP;
	16 Jun 2014 15:10:12 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 16 Jun 2014 10:10:03 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Mon, 16 Jun 2014 10:10:11 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Mon, 16 Jun 2014 17:10:09 +0200
Message-ID: <539F08D0.7060602@digi.com>
Date: Mon, 16 Jun 2014 17:10:08 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1396927648.git.Chong.Lu@windriver.com>	<539EDD51.9060508@digi.com>
	<CAJTo0LbcPqL+E78x1jUX6JH_BBc-uuEV8KDjELap9OJidPtYqA@mail.gmail.com>
In-Reply-To: <CAJTo0LbcPqL+E78x1jUX6JH_BBc-uuEV8KDjELap9OJidPtYqA@mail.gmail.com>
Subject: Re: [backport to Daisy] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Mon, 16 Jun 2014 15:17:09 -0000
X-Groupsio-MsgNum: 54167
Content-Type: multipart/mixed; boundary="------------050207010605000108040206"

--------------050207010605000108040206
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ross,

On 16/06/14 15:31, Burton, Ross wrote:
> If you'd be willing to backport the patch, verify that it works, and
> send it to the list, then that would be much appreciated and speed
> integration.

Attached the obvious cherry-pick of the commit from *master* with a 
basic conflict solved. But I don't think this is acceptable in an 
already-released stable branch "Daisy" as it involves a recipe rename 
(dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb) that probably will break 
the projects of current users of yocto Daisy.

Instead, would a basic change like the following be enough?:

-RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 
'dbus-ptest-ptest', '', d)}"
+RDEPENDS_dbus = "${@base_contains('PTEST_ENABLED', '1', 
'dbus-ptest-ptest', '', d)}"

This does not change any recipe name so it seems suitable for a bug-fix 
only branch but unfortunately this goes beyond my skills in Yocto and 
ptest framework so any advise would be appreciated.

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.

--------------050207010605000108040206
Content-Type: text/x-diff;
	name="0001-dbus-fix-a-hard-dependency-about-dbus-ptest.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-dbus-fix-a-hard-dependency-about-dbus-ptest.patch"

From 1395fc67a29b568daae191cc69089bed5124f311 Mon Sep 17 00:00:00 2001
From: Chong Lu <Chong.Lu@windriver.com>
Date: Tue, 8 Apr 2014 11:30:56 +0800
Subject: [PATCH] dbus: fix a hard dependency about dbus-ptest

If image contains dbus and ptest is in DISTRO_FEATURES, dbus-ptest package
is installed, regardless of whether ptest-pkgs is in IMAGE_FEATURES. This
issue will increase size for most small images.
This patch fixes this problem.

[YOCTO #5702]

(From OE-Core rev: 0416583f014138656babdf78a574357ae5ff25bd)

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Javier Viguera <javier.viguera@digi.com>

Conflicts:
	meta/recipes-core/dbus/dbus.inc
---
 meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} | 0
 meta/recipes-core/dbus/dbus.inc                                      | 4 +++-
 2 files changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus-ptest_1.6.18.bb => dbus-test_1.6.18.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-test_1.6.18.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
rename to meta/recipes-core/dbus/dbus-test_1.6.18.bb
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5727ae77b223..9a9a00af371a 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -6,9 +6,11 @@ LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 DEPENDS = "expat virtual/libintl"
-RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
 RDEPENDS_dbus_class-native = ""
 RDEPENDS_dbus_class-nativesdk = ""
+PACKAGES += "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
+ALLOW_EMPTY_dbus-ptest = "1"
+RDEPENDS_dbus-ptest_class-target = "dbus-test-ptest"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \

--------------050207010605000108040206--
