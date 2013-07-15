Return-Path: <andre.draszik@linaro.org>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 80F7561663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 16:50:04 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id fs12so9548227lab.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 09:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=0WWox6F7qyAa0ust9qSFThZOh2J1aOalf8wnvqK/tqY=;
	b=a1/UCwHuLAoGhTiyFjWdhErynFArtmhCShGdbzeorOb2ya7WYwKrEqy4BQp+d8mHcq
	12wkkFLYMgKUGLvkZJa2bzIm/7cAUqBb11dCXVLE4bOLhy9LltwnhPWIKE4T7Nw32t0w
	KJ8Sk6jjN9DRBqnS0gyV6CoVTOg2svaVt3OTgQECnhihCxfTG3bATjPrXaD8IlnUM4sW
	D1aWyV1u1+W/Qa98T8Ac6XZ/ndYDdnkqCYQgI/WilbW/fwaL/ahpCnUIw7JoAdYkwUr0
	sOb9+royONrTHf9o0Zhgqxo/BthZgubuQkAivTEe9Oc1csIr1aH2FncShriiam3TYqOk
	GT2g==
MIME-Version: 1.0
X-Received: by 10.152.87.234 with SMTP id bb10mr25483628lab.55.1373907003928; 
	Mon, 15 Jul 2013 09:50:03 -0700 (PDT)
Received: by 10.112.126.99 with HTTP; Mon, 15 Jul 2013 09:50:03 -0700 (PDT)
Date: Mon, 15 Jul 2013 17:50:03 +0100
Message-ID: <CAPaOLoJa1UjGaPqVeSmJavm0rMzNoFE6+KzfDO3ALOjRJeJ3Hg@mail.gmail.com>
From: Andre Draszik <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkVN1fxI3GAy4N+A3yTflJVx1ehma8LchUogqJ+oXb5ceWHe11VTCdiPdnRBVxaw/BKAhZq
Subject: use kernel build system for dtb compilation
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
X-List-Received-Date: Mon, 15 Jul 2013 16:50:04 -0000
X-Groupsio-MsgNum: 41960
Content-Type: multipart/mixed; boundary=001a11c34f70ec839f04e18fa6ba

--001a11c34f70ec839f04e18fa6ba
Content-Type: multipart/alternative; boundary=001a11c34f70ec839b04e18fa6b8

--001a11c34f70ec839b04e18fa6b8
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have a use-case where I need to compile the dtb using the kernel build
system, and the kernel's device tree compiler:
- In dylan, dtc is outdated and can not compile our dts, as that needs
additional include files. dtc in dylan does not understand the include path
option -i, although the dtc that comes with linux-3.4.x does support it.
- Irrespective of the version of the dtc (dylan vs. master), the kernel
build system supports running dtsp files through CPP, which we also need

The attached patch changes linux-dtb.inc to support such a use-case

If KERNEL_DEVICETREE points to file(s) in arch/${ARCH}/boot/dts, instead of
full paths (relative to ${S}), kbuild is used, otherwise behaviour is
unchanged.

An alternative would be to copy what the kernel's Makefile is doing, but
that seems pointless, and still requires updating dtc to something more
recent in dylan.


What do you think about attached (incomplete) patch?


Cheers,
Andre'

--001a11c34f70ec839b04e18fa6b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi,<br><br></div>I have a us=
e-case where I need to compile the dtb using the kernel build system, and t=
he kernel&#39;s device tree compiler:<br></div>- In dylan, dtc is outdated =
and can not compile our dts, as that needs additional include files. dtc in=
 dylan does not understand the include path option -i, although the dtc tha=
t comes with linux-3.4.x does support it.<br>
</div>- Irrespective of the version of the dtc (dylan vs. master), the kern=
el build system supports running dtsp files through CPP, which we also need=
<br><br></div>The attached patch changes linux-dtb.inc to support such a us=
e-case<br>
<br>If KERNEL_DEVICETREE points to file(s) in arch/${ARCH}/boot/dts, instea=
d of full paths (relative to ${S}), kbuild is used, otherwise behaviour is =
unchanged.<br><br></div><div>An alternative would be to copy what the kerne=
l&#39;s Makefile is doing, but that seems pointless, and still requires upd=
ating dtc to something more recent in dylan.<br>
<br><br></div>What do you think about attached (incomplete) patch?<br><br><=
br></div>Cheers,<br>Andre&#39;<br></div>

--001a11c34f70ec839b04e18fa6b8--

--001a11c34f70ec839f04e18fa6ba
Content-Type: application/octet-stream; 
	name="0001-linux-dtb-allow-to-build-dtb-using-kernel-build-syst.patch"
Content-Disposition: attachment; 
	filename="0001-linux-dtb-allow-to-build-dtb-using-kernel-build-syst.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hj5wmllp0

RnJvbSA3M2JjM2YyNjI2NWRjNDZjYmE1NzhjMWRhMDgwYTJkNDAwMmRlMTk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/QW5kcj1DMz1BOT0yMERyYXN6aWs/PSA8YW5k
cmUuZHJhc3ppa0BzdC5jb20+CkRhdGU6IE1vbiwgMTUgSnVsIDIwMTMgMTY6NDI6MTUgKzAxMDAK
U3ViamVjdDogW1BBVENIXSBsaW51eC1kdGI6IGFsbG93IHRvIGJ1aWxkIGR0YiB1c2luZyBrZXJu
ZWwgYnVpbGQgc3lzdGVtCk1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpUaGUga2Vy
bmVsIGJ1aWxkIHN5c3RlbSBoYXMgbmF0aXZlIHN1cHBvcnQgZm9yIGRldmljZSB0cmVlCnNvdXJj
ZSBmaWxlcyB0aGF0IC9pbmNsdWRlLyBhZGRpdGlvbmFsIGZpbGVzIGZyb20gc3RhbmRhcmQKZGly
ZWN0b3JpZXMsIGFuZCBpdCBhbHNvIHN1cHBvcnRzIHRoZSBwcmUtcHJvY2Vzc2luZyBvZgpzb3Vy
Y2UgZmlsZShzKSB1c2luZyBDUFAuCgpUaGlzIGNvbW1pdHMgbGV0cyBPRSB1c2UgdGhlIGtidWls
ZCBzeXN0ZW0gaWYKJEtFUk5FTF9ERVZJQ0VUUkVFIHBvaW50cyB0byBmaWxlKHMpIHRoYXQgYXJl
IGxvY2F0ZWQgaW4KYXJjaC8ke0FSQ0h9L2Jvb3QvZHRzLwoKU3RpbGwgbWlzc2luZyBpcyBhIGNo
YW5nZSB0byB0aGUgZGVwZW5kZW5jeSB0cmFja2luZyBweXRob24KY29kZSBhZnRlciB3aGljaCB3
ZSB3b3VsZCBvbmx5IGFkZCB0aGUgZHRjLW5hdGl2ZSBkZXBlbmRlbmN5CmlmIHRoZSBrZXJuZWwg
YnVpbGQgc3lzdGVtIGlzIG5vdCB1c2VkLgoKU2lnbmVkLW9mZi1ieTogQW5kcsOpIERyYXN6aWsg
PGFuZHJlLmRyYXN6aWtAc3QuY29tPgotLS0KIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGlu
dXgtZHRiLmluYyB8IDYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvbGludXgtZHRiLmluYyBiL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbGludXgvbGludXgtZHRiLmluYwppbmRleCA3NzQ3NzE4Li43ZWVhODNhIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4LWR0Yi5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC1kdGIuaW5jCkBAIC0xLDMgKzEsNSBAQAoraW5oZXJp
dCBrZXJuZWwtYXJjaAorCiAjIFN1cHBvcnQgZm9yIGRldmljZSB0cmVlIGdlbmVyYXRpb24KIEZJ
TEVTX2tlcm5lbC1kZXZpY2V0cmVlID0gIi9ib290L2RldmljZXRyZWUqIgogS0VSTkVMX0RFVklD
RVRSRUVfRkxBR1MgPz0gIi1SIDggLXAgMHgzMDAwIgpAQCAtNSwyNCArNyw0OSBAQCBLRVJORUxf
REVWSUNFVFJFRV9GTEFHUyA/PSAiLVIgOCAtcCAweDMwMDAiCiBweXRob24gX19hbm9ueW1vdXMg
KCkgewogICAgIGRldmljZXRyZWUgPSBkLmdldFZhcigiS0VSTkVMX0RFVklDRVRSRUUiLCBUcnVl
KSBvciAnJwogICAgIGlmIGRldmljZXRyZWU6CisgICAgICAgICMgZml4bWU6IGFkZCBkZXBlbmRl
bmN5IG9ubHkgaWYgZmlsZSBub3QgZm91bmQKICAgICAgICAgZGVwZW5kcyA9IGQuZ2V0VmFyKCJE
RVBFTkRTIiwgVHJ1ZSkKICAgICAgICAgZC5zZXRWYXIoIkRFUEVORFMiLCAiJXMgZHRjLW5hdGl2
ZSIgJSBkZXBlbmRzKQogICAgICAgICBwYWNrYWdlcyA9IGQuZ2V0VmFyKCJQQUNLQUdFUyIsIFRy
dWUpCiAgICAgICAgIGQuc2V0VmFyKCJQQUNLQUdFUyIsICIlcyBrZXJuZWwtZGV2aWNldHJlZSIg
JSBwYWNrYWdlcykKIH0KIAotZG9faW5zdGFsbF9hcHBlbmQoKSB7Citkb19jb21waWxlX2FwcGVu
ZCgpIHsKIAlpZiB0ZXN0IC1uICIke0tFUk5FTF9ERVZJQ0VUUkVFfSI7IHRoZW4KIAkJZm9yIERU
U19GSUxFIGluICR7S0VSTkVMX0RFVklDRVRSRUV9OyBkbwogCQkJaWYgWyAhIC1mICR7RFRTX0ZJ
TEV9IF07IHRoZW4KLQkJCQllY2hvICJXYXJuaW5nOiAke0RUU19GSUxFfSBpcyBub3QgYXZhaWxh
YmxlISIKLQkJCQljb250aW51ZQorCQkJCWlmIFsgISAtZiBhcmNoLyR7QVJDSH0vYm9vdC9kdHMv
JHtEVFNfRklMRX0gXTsgdGhlbgorCQkJCQllY2hvICJXYXJuaW5nOiAke0RUU19GSUxFfSBpcyBu
b3QgYXZhaWxhYmxlISIKKwkJCQkJY29udGludWUKKwkJCQlmaQorCisJCQkJIyBzdGFuZGFyZCBi
dWlsZCB1c2luZyBrYnVpbGQKKwkJCQllY2hvICJJbmZvOiBzdGFuZGFyZCBrYnVpbGQgZm9yIGRl
dmljZSB0cmVlIGJsb2IiCisJCQkJRFRTX0JBU0VfTkFNRT1gYmFzZW5hbWUgJHtEVFNfRklMRX0g
fCBhd2sgLUYgIi4iICd7cHJpbnQgJDF9J2AKKworCQkJCXVuc2V0IENGTEFHUyBDUFBGTEFHUyBD
WFhGTEFHUyBMREZMQUdTIE1BQ0hJTkUKKwkJCQlvZV9ydW5tYWtlICR7RFRTX0JBU0VfTkFNRX0u
ZHRiIENDPSIke0tFUk5FTF9DQ30iIExEPSIke0tFUk5FTF9MRH0iICR7S0VSTkVMX0VYVFJBX0FS
R1N9CiAJCQlmaQorCQlkb25lCisJZmkKK30KKworZG9faW5zdGFsbF9hcHBlbmQoKSB7CisJaWYg
dGVzdCAtbiAiJHtLRVJORUxfREVWSUNFVFJFRX0iOyB0aGVuCisJCWZvciBEVFNfRklMRSBpbiAk
e0tFUk5FTF9ERVZJQ0VUUkVFfTsgZG8KIAkJCURUU19CQVNFX05BTUU9YGJhc2VuYW1lICR7RFRT
X0ZJTEV9IHwgYXdrIC1GICIuIiAne3ByaW50ICQxfSdgCi0JCQlEVEJfTkFNRT1gZWNobyAke0tF
Uk5FTF9JTUFHRV9CQVNFX05BTUV9IHwgc2VkICJzLyR7TUFDSElORX0vJHtEVFNfQkFTRV9OQU1F
fS9nImAKIAkJCURUQl9TWU1MSU5LX05BTUU9YGVjaG8gJHtLRVJORUxfSU1BR0VfU1lNTElOS19O
QU1FfSB8IHNlZCAicy8ke01BQ0hJTkV9LyR7RFRTX0JBU0VfTkFNRX0vZyJgCi0JCQlkdGMgLUkg
ZHRzIC1PIGR0YiAke0tFUk5FTF9ERVZJQ0VUUkVFX0ZMQUdTfSAtbyAke0RUU19CQVNFX05BTUV9
ICR7RFRTX0ZJTEV9Ci0JCQlpbnN0YWxsIC1tIDA2NDQgJHtEVFNfQkFTRV9OQU1FfSAke0R9L2Jv
b3QvZGV2aWNldHJlZS0ke0RUQl9TWU1MSU5LX05BTUV9LmR0YgorCQkJaWYgWyAhIC1mICR7RFRT
X0ZJTEV9IF07IHRoZW4KKwkJCQlpZiBbICEgLWYgYXJjaC8ke0FSQ0h9L2Jvb3QvZHRzLyR7RFRT
X0ZJTEV9IF07IHRoZW4KKwkJCQkJZWNobyAiV2FybmluZzogJHtEVFNfRklMRX0gaXMgbm90IGF2
YWlsYWJsZSEiCisJCQkJCWNvbnRpbnVlCisJCQkJZmkKKworCQkJCWluc3RhbGwgLW0gMDY0NCBh
cmNoLyR7QVJDSH0vYm9vdC8ke0RUU19CQVNFX05BTUV9LmR0YiAke0R9L2Jvb3QvZGV2aWNldHJl
ZS0ke0RUQl9TWU1MSU5LX05BTUV9LmR0YgorCQkJCWNvbnRpbnVlCisJCQlmaQorCQkJZHRjIC1J
IGR0cyAtTyBkdGIgJHtLRVJORUxfREVWSUNFVFJFRV9GTEFHU30gLW8gJHtEVFNfQkFTRV9OQU1F
fS5kdGIgJHtEVFNfRklMRX0KKwkJCWluc3RhbGwgLW0gMDY0NCAke0RUU19CQVNFX05BTUV9LmR0
YiAke0R9L2Jvb3QvZGV2aWNldHJlZS0ke0RUQl9TWU1MSU5LX05BTUV9LmR0YgogCQlkb25lCiAJ
ZmkKIH0KQEAgLTMwLDE1ICs1NywyOCBAQCBkb19pbnN0YWxsX2FwcGVuZCgpIHsKIGRvX2RlcGxv
eV9hcHBlbmQoKSB7CiAJaWYgdGVzdCAtbiAiJHtLRVJORUxfREVWSUNFVFJFRX0iOyB0aGVuCiAJ
CWZvciBEVFNfRklMRSBpbiAke0tFUk5FTF9ERVZJQ0VUUkVFfTsgZG8KKwkJCURUU19CQVNFX05B
TUU9YGJhc2VuYW1lICR7RFRTX0ZJTEV9IHwgYXdrIC1GICIuIiAne3ByaW50ICQxfSdgCiAJCQlp
ZiBbICEgLWYgJHtEVFNfRklMRX0gXTsgdGhlbgotCQkJCWVjaG8gIldhcm5pbmc6ICR7RFRTX0ZJ
TEV9IGlzIG5vdCBhdmFpbGFibGUhIgotCQkJCWNvbnRpbnVlCisJCQkJaWYgWyAhIC1mIGFyY2gv
JHtBUkNIfS9ib290L2R0cy8ke0RUU19GSUxFfSBdOyB0aGVuCisJCQkJCWVjaG8gIldhcm5pbmc6
ICR7RFRTX0ZJTEV9IGlzIG5vdCBhdmFpbGFibGUhIgorCQkJCQljb250aW51ZQorCQkJCWZpCisK
KwkJCQkjIHN0YW5kYXJkIGJ1aWxkIHVzaW5nIGtidWlsZAorCQkJCWVjaG8gIkluZm86IHN0YW5k
YXJkIGtidWlsZCBmb3IgZGV2aWNlIHRyZWUgYmxvYiIKIAkJCWZpCi0JCQlEVFNfQkFTRV9OQU1F
PWBiYXNlbmFtZSAke0RUU19GSUxFfSB8IGF3ayAtRiAiLiIgJ3twcmludCAkMX0nYAorCiAJCQlE
VEJfTkFNRT1gZWNobyAke0tFUk5FTF9JTUFHRV9CQVNFX05BTUV9IHwgc2VkICJzLyR7TUFDSElO
RX0vJHtEVFNfQkFTRV9OQU1FfS9nImAKIAkJCURUQl9TWU1MSU5LX05BTUU9YGVjaG8gJHtLRVJO
RUxfSU1BR0VfU1lNTElOS19OQU1FfSB8IHNlZCAicy8ke01BQ0hJTkV9LyR7RFRTX0JBU0VfTkFN
RX0vZyJgCisKIAkJCWluc3RhbGwgLWQgJHtERVBMT1lESVJ9Ci0JCQlpbnN0YWxsIC1tIDA2NDQg
JHtCfS8ke0RUU19CQVNFX05BTUV9ICR7REVQTE9ZRElSfS8ke0RUQl9OQU1FfS5kdGIKKworCQkJ
aWYgWyAtZiBhcmNoLyR7QVJDSH0vYm9vdC9kdHMvJHtEVFNfRklMRX0gXTsgdGhlbgorCQkJCWlu
c3RhbGwgLW0gMDY0NCAke0J9L2FyY2gvJHtBUkNIfS9ib290LyR7RFRTX0JBU0VfTkFNRX0uZHRi
ICR7REVQTE9ZRElSfS8ke0RUQl9OQU1FfS5kdGIKKwkJCWVsc2UKKwkJCQlpbnN0YWxsIC1tIDA2
NDQgJHtCfS8ke0RUU19CQVNFX05BTUV9LmR0YiAke0RFUExPWURJUn0vJHtEVEJfTkFNRX0uZHRi
CisJCQlmaQorCiAJCQljZCAke0RFUExPWURJUn0KIAkJCWxuIC1zZiAke0RUQl9OQU1FfS5kdGIg
JHtEVEJfU1lNTElOS19OQU1FfS5kdGIKIAkJCWNkIC0KLS0gCjEuOC4yCgo=

--001a11c34f70ec839f04e18fa6ba--
