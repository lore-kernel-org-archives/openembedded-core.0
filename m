Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxWcx-00066s-0V
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 07:10:15 +0200
Received: by pbbrq2 with SMTP id rq2so2129531pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zGQ8YW1zghGs6Vw4OOcm1TM8x8KW75kZl7p4Oy1tGbc=;
	b=Ajre+VWqLk4dmjPvIZR+AhINHnVMcVO/vjCgsL7SyYBA68LNO9lQbMuKUE32w+W1kW
	/7Fae6ZaT9+pMIetBect2Y5ANS45v8nMoYfXT4p7fg5BjxWO3t3e+M9+uSMtrzda7/fK
	8TZcrjXfxYge94WDJxt5lHRjUByaqP3zyYLQvG5fziI1SLsJ1ify5Dl9ekKXUrzBlNbN
	RPsrqwb8XOuOCVIxjP1oFk+wajipJQ5lTFie21W6y84wk/9TI0B7FehZEvGlRJGoYDTb
	KUuPl6Ed34hkbd65ATMrfxt5PmLb0ad6TP6w0sq7P3AqE07b6DCJTfuxKwr/8WOFzreZ
	qYjQ==
Received: by 10.68.227.37 with SMTP id rx5mr2491122pbc.47.1344056312767;
	Fri, 03 Aug 2012 21:58:32 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id qa5sm4286005pbb.19.2012.08.03.21.58.31
	(version=SSLv3 cipher=OTHER); Fri, 03 Aug 2012 21:58:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 21:58:21 -0700
Message-Id: <1344056301-3710-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344056301-3710-1-git-send-email-raj.khem@gmail.com>
References: <1344056301-3710-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] populate_sdk_rpm.bbclass: Depend do_populate_sdk task on createrepo-native
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
X-List-Received-Date: Sat, 04 Aug 2012 05:10:15 -0000

Now that we have moved the rpm-createsolvedb.py
script to createrepo-native for good reason of
python-native dependency, we have to make sure
that it is staged before its used, unlike before
where it was under scripts/ dir and always existed
outside the realm of package management.

Fixes build error when doing meta-toolchain builds from
scratch

|
/home/kraj/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/meta-toolchain-1.0-r7/temp/run.populate_sdk_image.26712:
line 610: rpm-createsolvedb.py: command not found
| DEBUG: Python function do_populate_sdk finished
| ERROR: Function failed: populate_sdk_image (see
/home/kraj/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/meta-toolchain-1.0-r7/temp/log.do_populate_sdk.26712
for further information)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/populate_sdk_rpm.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index b4b27ba..1c54049 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -1,5 +1,6 @@
 do_populate_sdk[depends] += "rpm-native:do_populate_sysroot"
 do_populate_sdk[depends] += "rpmresolve-native:do_populate_sysroot"
+do_populate_sdk[depends] += "createrepo-native:do_populate_sysroot"
 do_populate_sdk[recrdeptask] += "do_package_write_rpm"
 
 rpmlibdir = "/var/lib/rpm"
-- 
1.7.5.4



