Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1Uct7v-0000Xn-Mg
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 10:01:29 +0200
Received: by mail-oa0-f49.google.com with SMTP id k14so3282448oag.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 00:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=1TuJLk5PdnZUbv5P597aqlp6KPBpjdF9rXg08NF1U3k=;
	b=XQpBxkJt2JShBor26OkK00TP+VoRwGoNTw7y2aeYpCUFDihKcCKJrrC2iUBv0xDq+V
	DrJqqz6lgb65AOI9ePOM51h1u8k2/1nXWN3eAQPC1VXAzM70xnGl+79V0Y/0oVkI2EhX
	gCYxcyvyiS575hjR8MiXQS8I9X2iVh1+/i8ADIWVyl+zfCsYgglUwsVP7C7HxERkLcgR
	ttgZxk1RnZjOovUYoWU7WkfT+TP7tzCcrNedewC5oPHp4kvRydEwe+9HsR9AW4UKVzO9
	sGkvv1cqWMr8sXEjiYPSSXe4QuSxGUyuFCDIfRuphqzQg3SwG5ixVXSTQ2UJBBVLmimi
	Gglg==
MIME-Version: 1.0
X-Received: by 10.182.78.41 with SMTP id y9mr19040475obw.69.1368690193238;
	Thu, 16 May 2013 00:43:13 -0700 (PDT)
Received: by 10.76.141.6 with HTTP; Thu, 16 May 2013 00:43:13 -0700 (PDT)
Date: Thu, 16 May 2013 09:43:13 +0200
Message-ID: <CA+AhUGx6qdRMA2-1eau9cuxjGrCTS8n-7Tiw-YurcL6Q896AvQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnIotAYtYBdICmjFwBIvFOiojHRqNiyB7x9Y2IYOO3kGVSraDqggQTfn7AyhSW8Q0ciU2w9
Subject: systemd depends on util-linux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 08:01:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I have stumbled upon a build error for systemd a few times, where it
fails to build due to missing blkid/blkid.h.

| src/udev/udev-builtin-blkid.c:30:25: fatal error: blkid/blkid.h: No
such file or directory

I think this happens when systemd is built before util-linux and can
be fixed with an explicit DEPEND +=3D "util-linux" in systemd_199.bb.

Cheers,
Erik Bot=F6


diff --git a/meta/recipes-core/systemd/systemd_199.bb
b/meta/recipes-core/systemd/systemd_199.bb
index b1cc046..bf59281 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM =3D
"file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
 PROVIDES =3D "udev"

 PE =3D "1"
-PR =3D "r4"
+PR =3D "r5"

-DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native
gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0
qemu-native"
+DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native
gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0
qemu-native util-linux"
 DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}=
"

 SECTION =3D "base/shell"


