Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249A2C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 09:56:41 +0000 (UTC)
Subject: [PATCH] package.bbclass: Fix broken dev package dependency.
To: openembedded-core@lists.openembedded.org
From: "Sreejith Ravi" <sreejith.ravi087@gmail.com>
X-Originating-Location: Richmond, England, GB (90.216.150.195)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jun 2024 02:56:31 -0700
Message-ID: <QrUS.1719222991270481706.aFEU@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="A8dN7aIC2I5Uxm8k77j7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 09:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201072

--A8dN7aIC2I5Uxm8k77j7
Content-Type: multipart/alternative; boundary="QovvOq6GOsD0ewGYx1R6"

--QovvOq6GOsD0ewGYx1R6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Currently, the process_pkgconfig() would process only the "Requires" key fi=
eld and ignore "Requires.private" while generating the dev dependency chain=
.

Example: usr/lib/pkgconfig/libical.pc
----------
Libs: -L${libdir} -lical -licalss -licalvcal
Libs.private: -lpthread
Requires.private: icu-i18n
----------
Depends field generated for libical-dev
Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)
------------

When trying to resolve the build time dependency with libical package using=
 =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the below error.
-----------
Package icu-i18n was not found in the pkg-config search path.
Perhaps you should add the directory containing `icu-i18n.pc'
to the PKG_CONFIG_PATH environment variable
Package 'icu-i18n', required by 'libical', not found
-----------

This patch will add the packages listed in "Requires.private" to the depend=
ency chain.

-------
Depends field generated with this change for libical-dev
Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)
-------

Other examples of packages generated with broken dev dependency.

libflac-dev : https://packages.debian.org/sid/libflac-dev
Without patch:
Depends: flac (=3D 1.3.3-r0), libflac, libflac++
with patch:
Depends: flac (=3D 1.3.3-r0), libflac, libflac++, libogg-dev

libglib2.0-dev : https://packages.debian.org/buster/libglib2.0-dev
without patch:
Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev
with patch:
Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev,
util-linux-dev, zlib-dev

--QovvOq6GOsD0ewGYx1R6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Currently, the process_pkgconfig() would process only the "Requires" key fi=
eld and ignore "Requires.private" while generating the dev dependency chain=
.<br /><br />Example: usr/lib/pkgconfig/libical.pc<br />----------<br />Lib=
s: -L${libdir} -lical -licalss -licalvcal<br />Libs.private: -lpthread<br /=
>Requires.private: icu-i18n<br />----------<br />Depends field generated fo=
r libical-dev<br />Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)<br />-----=
-------<br /><br />When trying to resolve the build time dependency with li=
bical package using &ldquo;-dev&rdquo; ipk generated, it will throw the bel=
ow error.<br />-----------<br />Package icu-i18n was not found in the pkg-c=
onfig search path.<br />Perhaps you should add the directory containing `ic=
u-i18n.pc'<br />to the PKG_CONFIG_PATH environment variable<br />Package 'i=
cu-i18n', required by 'libical', not found<br />-----------<br /><br />This=
 patch will add the packages listed in "Requires.private" to the dependency=
 chain.<br /><br />-------<br />Depends field generated with this change fo=
r libical-dev<br />Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)<b=
r />-------<br /><br />Other examples of packages generated with broken dev=
 dependency.<br /><br />libflac-dev : https://packages.debian.org/sid/libfl=
ac-dev<br />Without patch:<br />Depends: flac (=3D 1.3.3-r0), libflac, libf=
lac++<br />with patch:<br />Depends: flac (=3D 1.3.3-r0), libflac, libflac+=
+, libogg-dev<br /><br />libglib2.0-dev : https://packages.debian.org/buste=
r/libglib2.0-dev<br />without patch:<br />Depends: libffi-dev, libglib-2.0-=
0 (=3D 1:2.62.6-r0), libpcre-dev<br />with patch:<br />Depends: libffi-dev,=
 libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev,<br />&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;util-linux-dev, zlib-dev

--QovvOq6GOsD0ewGYx1R6--

--A8dN7aIC2I5Uxm8k77j7
Content-Type: application/octet-stream; name="0001-package.bbclass-Fix-broken-dev-package-dependency.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-package.bbclass-Fix-broken-dev-package-dependency.patch"

RnJvbSBiNTU5YmU4MmZmYzE2YTAxMmQ0MGQ1ZjE1NzIyZWYwYmI4NDBlZTllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcmVlaml0aCBSYXZpIDxzcmVlaml0LnJhdmkwODdAZ21haWwu
Y29tPgpEYXRlOiBNb24sIDI0IEp1biAyMDI0IDEwOjE4OjEwICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gcGFja2FnZS5iYmNsYXNzOiBGaXggYnJva2VuIGRldiBwYWNrYWdlIGRlcGVuZGVuY3kuCk1J
TUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApD
b250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CgpDdXJyZW50bHksIHRoZSBwcm9jZXNzX3Br
Z2NvbmZpZygpIHdvdWxkIHByb2Nlc3Mgb25seSB0aGUKIlJlcXVpcmVzIiBrZXkgZmllbGQgYW5k
IGlnbm9yZSAiUmVxdWlyZXMucHJpdmF0ZSIgd2hpbGUKZ2VuZXJhdGluZyB0aGUgZGV2IGRlcGVu
ZGVuY3kgY2hhaW4uCgpFeGFtcGxlOiB1c3IvbGliL3BrZ2NvbmZpZy9saWJpY2FsLnBjCi0tLS0t
LS0tLS0KTGliczogLUwke2xpYmRpcn0gLWxpY2FsIC1saWNhbHNzIC1saWNhbHZjYWwKTGlicy5w
cml2YXRlOiAtbHB0aHJlYWQKUmVxdWlyZXMucHJpdmF0ZTogaWN1LWkxOG4KLS0tLS0tLS0tLQpE
ZXBlbmRzIGZpZWxkIGdlbmVyYXRlZCBmb3IgbGliaWNhbC1kZXYKRGVwZW5kczogZ2xpYi0yLjAt
ZGV2LCBsaWJpY2FsICg9IDMuMC43LXIwKQotLS0tLS0tLS0tLS0KCldoZW4gdHJ5aW5nIHRvIHJl
c29sdmUgdGhlIGJ1aWxkIHRpbWUgZGVwZW5kZW5jeSB3aXRoIGxpYmljYWwKcGFja2FnZSB1c2lu
ZyDigJwtZGV24oCdIGlwayBnZW5lcmF0ZWQsIGl0IHdpbGwgdGhyb3cgdGhlIGJlbG93IGVycm9y
LgotLS0tLS0tLS0tLQpQYWNrYWdlIGljdS1pMThuIHdhcyBub3QgZm91bmQgaW4gdGhlIHBrZy1j
b25maWcgc2VhcmNoIHBhdGguClBlcmhhcHMgeW91IHNob3VsZCBhZGQgdGhlIGRpcmVjdG9yeSBj
b250YWluaW5nIGBpY3UtaTE4bi5wYycKdG8gdGhlIFBLR19DT05GSUdfUEFUSCBlbnZpcm9ubWVu
dCB2YXJpYWJsZQpQYWNrYWdlICdpY3UtaTE4bicsIHJlcXVpcmVkIGJ5ICdsaWJpY2FsJywgbm90
IGZvdW5kCi0tLS0tLS0tLS0tCgpUaGlzIHBhdGNoIHdpbGwgYWRkIHRoZSBwYWNrYWdlcyBsaXN0
ZWQgaW4gIlJlcXVpcmVzLnByaXZhdGUiCnRvIHRoZSBkZXBlbmRlbmN5IGNoYWluLgoKLS0tLS0t
LQpEZXBlbmRzIGZpZWxkIGdlbmVyYXRlZCB3aXRoIHRoaXMgY2hhbmdlIGZvciBsaWJpY2FsLWRl
dgpEZXBlbmRzOiBnbGliLTIuMC1kZXYsIGljdS1kZXYsIGxpYmljYWwgKD0gMy4wLjctcjApCi0t
LS0tLS0KCk90aGVyIGV4YW1wbGVzIG9mIHBhY2thZ2VzIGdlbmVyYXRlZCB3aXRoIGJyb2tlbiBk
ZXYgZGVwZW5kZW5jeS4KCmxpYmZsYWMtZGV2IDogaHR0cHM6Ly9wYWNrYWdlcy5kZWJpYW4ub3Jn
L3NpZC9saWJmbGFjLWRldgpXaXRob3V0IHBhdGNoOgpEZXBlbmRzOiBmbGFjICg9IDEuMy4zLXIw
KSwgbGliZmxhYywgbGliZmxhYysrCndpdGggcGF0Y2g6CkRlcGVuZHM6IGZsYWMgKD0gMS4zLjMt
cjApLCBsaWJmbGFjLCBsaWJmbGFjKyssIGxpYm9nZy1kZXYKCmxpYmdsaWIyLjAtZGV2IDogaHR0
cHM6Ly9wYWNrYWdlcy5kZWJpYW4ub3JnL2J1c3Rlci9saWJnbGliMi4wLWRldgp3aXRob3V0IHBh
dGNoOgpEZXBlbmRzOiBsaWJmZmktZGV2LCBsaWJnbGliLTIuMC0wICg9IDE6Mi42Mi42LXIwKSwg
bGlicGNyZS1kZXYKd2l0aCBwYXRjaDoKRGVwZW5kczogbGliZmZpLWRldiwgbGliZ2xpYi0yLjAt
MCAoPSAxOjIuNjIuNi1yMCksIGxpYnBjcmUtZGV2LAogICAgICAgICB1dGlsLWxpbnV4LWRldiwg
emxpYi1kZXYKClNpZ25lZC1vZmYtYnk6IFNyZWVqaXRoIFJhdmkgPHNyZWVqaXQucmF2aTA4N0Bn
bWFpbC5jb20+Ci0tLQogbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21l
dGEvY2xhc3Nlcy9wYWNrYWdlLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvcGFja2FnZS5iYmNsYXNz
CmluZGV4IDY3MzUxYjI1MTAuLjA4NGZlNDI4ZTUgMTAwNjQ0Ci0tLSBhL21ldGEvY2xhc3Nlcy9w
YWNrYWdlLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcwpAQCAtMjE4
Miw3ICsyMTgyLDcgQEAgcHl0aG9uIHBhY2thZ2VfZG9fcGtnY29uZmlnICgpIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIG06CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGRyID0g
bS5ncm91cCgxKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV4cCA9IHBkLmV4cGFuZCht
Lmdyb3VwKDIpKQotICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIGhkciA9PSAnUmVxdWly
ZXMnOgorICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIGhkciA9PSAnUmVxdWlyZXMnIG9y
IGhkciA9PSAnUmVxdWlyZXMucHJpdmF0ZSc6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBrZ2NvbmZpZ19uZWVkZWRbcGtnXSArPSBleHAucmVwbGFjZSgnLCcsICcgJykuc3BsaXQo
KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZQogICAgICAgICAgICAg
ICAgICAgICAgICAgbSA9IHZhcl9yZS5tYXRjaChsKQotLSAKMi4zNC4xCgo=

--A8dN7aIC2I5Uxm8k77j7--

