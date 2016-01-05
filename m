Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id D49706011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:11:43 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f206so28892192wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 08:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=AUPBIcLak+W4BgwRREo3M5XgOrF9spJ0ib995e5qSGE=;
	b=CrmriEJi32he2IcZMxeALNNbxKrl1T3OnUeocqbssLZGQTROT6M5ZQAyEcwfFqsCdA
	iQL4Gu+PWofzNoDdivdQfhEnLLs20XS0G4zJ290DYris/lkVrmTnf1EL3CJUC5Tc6Gp8
	GZN/hcDX9lreuibsbDsnFnH2MLtPckE6Jot3TYOB+IxGzhWMF/SjMH1Kz5xWJhp5hF+J
	KmE0wgtiwVm2kSXzFWn5EIVfK8OGZLzMVX22yv4wxKv6v3zOpgNAjIpLEm4NqIFi6Oao
	+bJl2+fz8ZIUgNqDcoiCmCuTBFnwNTJhMjV6F7cxcaGjualuhgey5XhfYxqOdMaREAGK
	GVQQ==
X-Received: by 10.194.5.74 with SMTP id q10mr101846883wjq.138.1452010303911;
	Tue, 05 Jan 2016 08:11:43 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	ke10sm91465949wjb.3.2016.01.05.08.11.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 08:11:43 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <6B13FBFC-89E1-45DE-9A15-611426D85CF0@gmail.com>
Date: Tue, 5 Jan 2016 17:11:42 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH RESEND] udev-extraconf: introduce multiple blacklist files for more complex setups
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
X-List-Received-Date: Tue, 05 Jan 2016 16:11:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


In cases where a target image wants prevent the recovery partition is =
mounted
automatically, but the recovery partition identifier moves with the =
device
(internal flash, sd card, usb stick, ...), device/machine dependend =
extra
blacklists might be desired.

The grep utility prints the file name for each match when there is more
than one file to search. Add -h to suppress the prefixing of file names
on output.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 meta/recipes-core/udev/udev-extraconf_1.1.bb   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh =
b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 3eea910..d760328 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -8,7 +8,7 @@
 MOUNT=3D"/bin/mount"
 PMOUNT=3D"/usr/bin/pmount"
 UMOUNT=3D"/bin/umount"
-for line in `grep -v ^# /etc/udev/mount.blacklist`
+for line in `grep -h -v ^# /etc/udev/mount.blacklist =
/etc/udev/mount.blacklist.d/*`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
 	then
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb =
b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 6fbd925..ecd4a8a 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -23,6 +23,7 @@ do_install() {
     install -m 0644 ${WORKDIR}/autonet.rules       =
${D}${sysconfdir}/udev/rules.d/autonet.rules
     install -m 0644 ${WORKDIR}/localextra.rules    =
${D}${sysconfdir}/udev/rules.d/localextra.rules
=20
+    install -d ${D}${sysconfdir}/udev/mount.blacklist.d
     install -m 0644 ${WORKDIR}/mount.blacklist     =
${D}${sysconfdir}/udev/
=20
     install -d ${D}${sysconfdir}/udev/scripts/
--=20
1.9.1

This time without signing the mail, maybe that corrupted the patch?

--=20
Jens Rehsack - rehsack@gmail.com


