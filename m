Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 30D49601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 03:36:49 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 73so51028425otj.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2017 19:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=DTLd+vkfEAsmchJtERdJUSSl9CzoPa9IRDalXFOcU3Y=;
	b=PWRtQWXj4QaTXa/sqfVFvRZrrtt2xtpHx1bMojL2k93JasS7Hj88IKfmzzgKlwxzOj
	Ogs50AEF0INwohzRChM0+pZar36i+3wm7Dhd3+nVl17cWoWvbbSBJCS7XXuMovgoebeg
	l88Zd9aLhvC93D1Gba6mBRbCKV5Y55ncE9QNxUgdCcUyfybWsS+cRrB3hkZP5xaKwv6D
	9wgIUnV0W93z6MyRIm/hC7tRoH/XbET1VeS4pxY9OfMj+ie++1rzNbDyf0MTO48bJ94J
	w58W5L3pbGCowphYbV8VsrijfUpCYR8hxCNoxFFPEXqSNsp/Xmd4I5eWQ6V82gHwdZc3
	DUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DTLd+vkfEAsmchJtERdJUSSl9CzoPa9IRDalXFOcU3Y=;
	b=tPLJcD+9da9Y0ly7kIfm4CW4OSikWcR/Z+ZQrMrRXVDW+vvhyGxcVVlrvV7B/tmcgk
	lvY7RR21qsvAvNdx5epzbjoMEdqMmXihDA6UXwVnYAs/v0QhSqToJi3BXmd/LdNt0q3O
	cTQ3ENrVymmoVSw/GIZ9ZhJS1wl4Uu2LQxAByqtUZL0AWEJaVS7ZSTCumQPUQenEofmY
	e4DD1GExyQkDxN3HU31Im6zPq2y/BRFltfceBIRKi0hlEB8Bvu4ECASSmLfTMDNTCrAp
	VCWR3/bpUcZLeKckXAlGlRPWRruR1mN0Z40ESOxkq69+fcrVShYciY49tdJKkrWkjLZ7
	HAXg==
X-Gm-Message-State: AMke39mvvnQy/xRSQDUnEARgX3/ghB4GPqulHx9zDtAm0dlfIkbiihZmKVktbz+Z0DH07xDNK/65M+GPf9Izuw==
X-Received: by 10.157.14.25 with SMTP id c25mr8250372otc.56.1486870610038;
	Sat, 11 Feb 2017 19:36:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.89.98 with HTTP; Sat, 11 Feb 2017 19:36:49 -0800 (PST)
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Sat, 11 Feb 2017 19:36:49 -0800
Message-ID: <CAOLEWZXZ4v4PRWubOr0joQqs+4HBXL+r9ubkPf8pGDKU0n1HWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] RfC: Incomplete morty toolchain config (gcc-6.2 in poky and oe-core)
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
X-List-Received-Date: Sun, 12 Feb 2017 03:36:50 -0000
X-Groupsio-MsgNum: 93202
Content-Type: multipart/mixed; boundary=001a113e02be8a0f1f05484d0a6d

--001a113e02be8a0f1f05484d0a6d
Content-Type: multipart/alternative; boundary=001a113e02be8a0f1905484d0a6b

--001a113e02be8a0f1905484d0a6b
Content-Type: text/plain; charset=UTF-8

Above toolchain breaks in both possible sets of metadata on hardened host
(hardened amd64 profile with PAX kernel).  This issue does not occur on
krogoth or older branches with 5.4 or previous gcc versions.

Rolling back to 5.4 toolchain in morty results in random build failures
from the kernel killing gcc processes:

[122053.140618] PAX: terminating task:
/home/sarnold/foss-boundary-morty/oe-core/build-nitrogen6x/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/5.4.0/cc1plus(cc1plus):7943,
uid/euid: 1002/1002, PC

The 6.2 toolchain build error (failure to link gcov/other due to relocs) is
caused by incomplete no-PIE flags not being included in ALL* flag
variables, which is fixed in the attached Gentoo patch.

I've tested it on two build machines with both oe-core and poky builds and
both the toolchain and PAX are happy now.  I would highly recommend fixing
the no-PIE config; I probably have time to extract a patch and mail it
as-is, otherwise I'm fine if someone else fixes it.

Steve

--001a113e02be8a0f1905484d0a6b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Above toolchain breaks in both possible set=
s of metadata on hardened host (hardened amd64 profile with PAX kernel).=C2=
=A0 This issue does not occur on krogoth or older branches with 5.4 or prev=
ious gcc versions.<br><br></div><div>Rolling back to 5.4 toolchain in morty=
 results in random build failures from the kernel killing gcc processes:<br=
><br>[122053.140618] PAX: terminating task: /home/sarnold/foss-boundary-mor=
ty/oe-core/build-nitrogen6x/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm=
-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/5.4.0/cc1plus(cc1plus):7943, uid=
/euid: 1002/1002, PC<br></div><div><br></div>The 6.2 toolchain build error =
(failure to link gcov/other due to relocs) is caused by incomplete no-PIE f=
lags not being included in ALL* flag variables, which is fixed in the attac=
hed Gentoo patch.<br><br></div>I&#39;ve tested it on two build machines wit=
h both oe-core and poky builds and both the toolchain and PAX are happy now=
.=C2=A0 I would highly recommend fixing the no-PIE config; I probably have =
time to extract a patch and mail it as-is, otherwise I&#39;m fine if someon=
e else fixes it.<br><br></div>Steve<br></div>

--001a113e02be8a0f1905484d0a6b--

--001a113e02be8a0f1f05484d0a6d
Content-Type: text/x-patch; charset=US-ASCII; name="54_all_nopie-all-flags.patch"
Content-Disposition: attachment; filename="54_all_nopie-all-flags.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iz24d5qj0

V2UgbmVlZCB0byBwYXNzIE5PX1BJRV9DRkxBR1MgdG8gQUxMXyogc28gZ2NjIGRvbid0IGZhaWwg
d2hlbgp3ZSBjb21waWxlIGl0IHdpdGggb2xkZXIgZ2NjIGFuZCBwaWUuCgotLS0gYS9nY2MvTWFr
ZWZpbGUuaW4JMjAxNS0wNi0yNSAxOToxODoxMi4wMDAwMDAwMDAgKzAyMDAKKysrIGIvZ2NjL01h
a2VmaWxlLmluCTIwMTYtMDQtMjIgMDA6MTI6NTQuMDI5MTc4ODYwICswMjAwCkBAIC05OTEsMTAg
Kzk5MSwxMCBAQCBBTExfQ1hYRkxBR1MgPSAkKFRfQ0ZMQUdTKSAkKENGTEFHUy0kQCkKIEFMTF9D
UFBGTEFHUyA9ICQoSU5DTFVERVMpICQoQ1BQRkxBR1MpCiAKICMgVGhpcyBpcyB0aGUgdmFyaWFi
bGUgdG8gdXNlIHdoZW4gdXNpbmcgJChDT01QSUxFUikuCi1BTExfQ09NUElMRVJGTEFHUyA9ICQo
QUxMX0NYWEZMQUdTKQorQUxMX0NPTVBJTEVSRkxBR1MgPSAkKE5PX1BJRV9DRkxBR1MpICQoQUxM
X0NYWEZMQUdTKQogCiAjIFRoaXMgaXMgdGhlIHZhcmlhYmxlIHRvIHVzZSB3aGVuIHVzaW5nICQo
TElOS0VSKS4KLUFMTF9MSU5LRVJGTEFHUyA9ICQoQUxMX0NYWEZMQUdTKQorQUxMX0xJTktFUkZM
QUdTID0gJChOT19QSUVfQ0ZMQUdTKSAkKEFMTF9DWFhGTEFHUykKIAogIyBCdWlsZCBhbmQgaG9z
dCBzdXBwb3J0IGxpYnJhcmllcy4KIAo=

--001a113e02be8a0f1f05484d0a6d--
