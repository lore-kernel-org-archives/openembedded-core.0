Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE8C60667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:58:48 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b14so30294359wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=xLDJgePmWtreYpQKw50O8iblqtKykTcH0h+TZ8pQw9k=;
	b=gQDw8axEtDpjRq3SY7nv74m+45oSwpwMyFDvx6EnuK3YEwegLV3kPTYdNnBnAC0hZs
	1OCloc/8292e94pRCJbX6c1OI8lSqfSbmAE0alqqAhkPh1pOdvDbyDk9ecgXJS5Pkc0D
	8BhyCE08Jb8xGDhSXsjTHMdYqBPrXbB4S0a/BBlX5AorEPmlpAY3DicUvAPlpwZSxFcw
	FgrP8HbHygzxLR5XaX3SWyhSQi1EWrvVObcXCubsEFuwbn1wFmAfnicy+22c99GM7Zzn
	DrCQIi5nw31j93636klChjlvQbBv4KBeuVG2nNU5QylbRRbKIgg6HHkKG8PY2Wf2NZiF
	56OA==
X-Received: by 10.194.9.169 with SMTP id a9mr100650330wjb.60.1452002329075;
	Tue, 05 Jan 2016 05:58:49 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	l194sm3719291wmb.14.2016.01.05.05.58.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 05:58:47 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Tue, 5 Jan 2016 14:58:46 +0100
Message-Id: <5A25F75E-2E79-42EA-82BF-31D469785EAA@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH] udev-extraconf: introduce multiple blacklist files for more complex setups
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
X-List-Received-Date: Tue, 05 Jan 2016 13:58:49 -0000
X-Groupsio-MsgNum: 75439
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D1080FCE-9ADB-4894-BB3D-E6E691C1C774";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_D1080FCE-9ADB-4894-BB3D-E6E691C1C774
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


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

+    install -d ${D}${sysconfdir}/udev/mount.blacklist.d
     install -m 0644 ${WORKDIR}/mount.blacklist     =
${D}${sysconfdir}/udev/

     install -d ${D}${sysconfdir}/udev/scripts/
--
1.9.1

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_D1080FCE-9ADB-4894-BB3D-E6E691C1C774
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWi8wXAAoJEESZlq7c5Qqd8qYP/1sG93TvcenOH0+ZVFxG8nra
DMPJs0hCeJ7VBT3U+7zFnAeBIayz1+xhclvEeblseOO65VhbBPoIKNzk9ulCzzDo
axpFFSWngb3BL6Yrz/cyqVT7hZuc1oFVH7w/SintC7za4HMdxsB/ab/BcVefdOII
CxUquae0UfHzDM/KwrTPgBqDhOvKJ/aH2Waecy1vgppOUaJxzVpal6UBZ69eKHVi
EOAoZgW7oQTbTUks4KrwyTE201j3CBuZTwvZV5Gpa6Wfg6wxkTFFt8cshT8uwKv4
RTMYUs0GGdIflCEI9M2eewM8L181PJHPB1dhlSME52oY7NoFjMgtKixavNxMQObG
x5+J8XdJX41cwPloZlYzuBaGljGIOoUDjXZ5s2DQpMpYsUFnFTgTfAXaTegcgGKu
YMOmrHNJhk3CzmhkI5SNCteoEJA0x8VlpmyRg3Vz2e/kHT5LJ9j+ZLOgfiAicgKy
Ma8jc5p+CbLOfQ+O6LHjdoZx4qKIAr8szVLiy3YfprN5b4l05nS+NA6xgAsOlWu8
k48l3ze3xyf9IFtP1T5nih88r0Bjbbavdu8aT0beE75Cc6IXsQ5s1TSBKUw5Lfa8
eMK3SSYvQbnGJPzprq8dM6YAtvJEWfdjidv6AD3bmSGKgNcteUfGmtBgUHaDwlP2
vZgJSZm98OiSx7+hyDQz
=ZyhQ
-----END PGP SIGNATURE-----

--Apple-Mail=_D1080FCE-9ADB-4894-BB3D-E6E691C1C774--
