Subject: Re: [blacksail][PATCH v2 1/4] curl: fix CVE-2026-87865
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 02:30:14 -0800
References: <20261125132619.3518022-1-joaomarcos.costa@bootlin.com> <20261125132619.3518022-2-joaomarcos.costa@bootlin.com>
In-Reply-To: <20261125132619.3518022-2-joaomarcos.costa@bootlin.com>
Message-ID: <1290473.1795689014694184643@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="B60ctxgXdFHNgrnJnHtP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 10:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251291

--B60ctxgXdFHNgrnJnHtP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Joao, Yoann,

I noticed that test3500 invokes %SRCDIR/libtest/test3500.pl in its precheck=
,
but the Blacksail recipe does not install this script into the ptest packag=
e.

Adding it to EXTRA_DIST includes it in the source distribution;
the recipe still needs to install it explicitly. Otherwise, the
precheck cannot run when libssh2/SFTP support is enabled.

Could you include the following in do_install_ptest() , after
creating the tests/libtest directory?

My Wrynose v2 backport already includes this installation:
https://lists.openembedded.org/g/openembedded-core/message/250999

Thanks,
Darsh

On Wed, Nov 25, 2026 at 06:57 PM, Joao Marcos Costa wrote:

>=20
> This vulnerability, marked as High [1], was fixed upstream [2] since
> v8.23.0.
>=20
> Backport the fix to curl v8.22.0.
>=20
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-87865
> [2] https://curl.se/docs/CVE-2026-87865.html
>=20
> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric)
> <joaomarcos.costa@bootlin.com>
> ---
> .../curl/curl/CVE-2026-87865.patch | 216 ++++++++++++++++++
> meta/recipes-support/curl/curl_8.22.0.bb | 1 +
> 2 files changed, 217 insertions(+)
> create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch
>=20
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-87865.patch
> b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
> new file mode 100644
> index 0000000000..32a7441c95
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-87865.patch
> @@ -0,0 +1,216 @@
> +From a7622dc02ccc01f7438227f1920db08268a6ccb0 Mon Sep 17 00:00:00 2001
> +From: Bobbeh Rhino <bobbeh@rhino.Rhino>
> +Date: Tue, 8 Sep 2026 06:33:27 -0400
> +Subject: [PATCH] libssh2: match hashed known_hosts entries by host
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +libssh2 does not expose the plaintext name for hashed entries. Check
> +each entry key against the requested hostname before using its key type.
> +Otherwise an unrelated hashed entry can select the wrong algorithm.
> +
> +Add an SFTP regression test 3500 with an unrelated hashed entry before
> +the requested host.
> +
> +Closes #22874
> +
> +CVE: CVE-2026-87865
> +Upstream-Status: Backport [ https://github.com/curl/curl/commit/323c184b=
6bdf5b1988a10c0a61560
> ]
> +
> +Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> +---
> + lib/vssh/libssh2.c | 16 +++++++--
> + tests/data/Makefile.am | 2 ++
> + tests/data/test3500 | 47 +++++++++++++++++++++++++
> + tests/libtest/Makefile.am | 3 +-
> + tests/libtest/test3500.pl | 72 +++++++++++++++++++++++++++++++++++++++
> + 5 files changed, 136 insertions(+), 4 deletions(-)
> + create mode 100644 tests/data/test3500
> + create mode 100755 tests/libtest/test3500.pl
> +
> +diff --git a/lib/vssh/libssh2.c b/lib/vssh/libssh2.c
> +index 24a651d30e..cd28cde76f 100644
> +--- a/lib/vssh/libssh2.c
> ++++ b/lib/vssh/libssh2.c
> +@@ -685,9 +685,19 @@ static CURLcode ssh_force_knownhost_key_type(struct
> Curl_easy *data,
> + break;
> + }
> + }
> +- else {
> +- found =3D TRUE;
> +- break;
> ++ else if(store->key) {
> ++ int keycheck =3D libssh2_knownhost_checkp(
> ++ sshc->kh, conn->origin->hostname,
> ++ (conn->origin->port !=3D PORT_SSH) ? conn->origin->port : -1,
> ++ store->key, strlen(store->key),
> ++ LIBSSH2_KNOWNHOST_TYPE_PLAIN |
> ++ LIBSSH2_KNOWNHOST_KEYENC_BASE64 |
> ++ (store->typemask & LIBSSH2_KNOWNHOST_KEY_MASK),
> ++ NULL);
> ++ if(keycheck =3D=3D LIBSSH2_KNOWNHOST_CHECK_MATCH) {
> ++ found =3D TRUE;
> ++ break;
> ++ }
> + }
> + }
> + }
> +diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
> +index 3b32fce7bb..4a27927b1c 100644
> +--- a/tests/data/Makefile.am
> ++++ b/tests/data/Makefile.am
> +@@ -2090,6 +2090,8 @@ TESTCASES =3D \
> + test3400 \
> + test3401 \
> + \
> ++ test3500 \
> ++ \
> + test4000 \
> + test4001 \
> + \
> +diff --git a/tests/data/test3500 b/tests/data/test3500
> +new file mode 100644
> +index 0000000000..1bcf3bc17d
> +--- /dev/null
> ++++ b/tests/data/test3500
> +@@ -0,0 +1,47 @@
> ++<?xml version=3D"1.0" encoding=3D"US-ASCII"?>
> ++<testcase>
> ++<info>
> ++<keywords>
> ++SFTP
> ++known_hosts
> ++libssh2
> ++</keywords>
> ++</info>
> ++
> ++# Server-side
> ++<reply>
> ++<data>
> ++Test data
> ++for hashed known hosts
> ++</data>
> ++</reply>
> ++
> ++# Client-side
> ++<client>
> ++<server>
> ++sftp
> ++</server>
> ++<features>
> ++sftp
> ++libssh2
> ++!badlibssh
> ++</features>
> ++<precheck>
> ++%PERL %SRCDIR/libtest/test3500.pl %LOGDIR/server/curl_host_key.pub
> %LOGDIR/known%TESTNUMBER "[%HOSTIP]:%SSHPORT"
> ++</precheck>
> ++<name>
> ++SFTP matches requested hashed known_hosts entry
> ++</name>
> ++<command>
> ++--knownhosts %LOGDIR/known%TESTNUMBER --key
> %LOGDIR/server/curl_client_key --pubkey %LOGDIR/server/curl_client_key.pu=
b
> -u %USER: sftp://%HOSTIP:%SSHPORT%SFTP_PWD/%LOGDIR/file%TESTNUMBER.txt
> ++</command>
> ++<file name=3D"%LOGDIR/file%TESTNUMBER.txt">
> ++Test data
> ++for hashed known hosts
> ++</file>
> ++</client>
> ++
> ++# Verify data after the test has been "shot"
> ++<verify>
> ++</verify>
> ++</testcase>
> +diff --git a/tests/libtest/Makefile.am b/tests/libtest/Makefile.am
> +index 74eb150742..8fdf484b55 100644
> +--- a/tests/libtest/Makefile.am
> ++++ b/tests/libtest/Makefile.am
> +@@ -49,7 +49,8 @@ EXTRA_DIST =3D CMakeLists.txt $(FIRST_C) $(FIRST_H)
> $(UTILS_C) $(UTILS_H) $(TESTS_
> + test1022.pl \
> + test307.pl \
> + test610.pl \
> +- test613.pl
> ++ test613.pl \
> ++ test3500.pl
> +
> + CFLAGS +=3D @CURL_CFLAG_EXTRAS@
> +
> +diff --git a/tests/libtest/test3500.pl b/tests/libtest/test3500.pl
> +new file mode 100755
> +index 0000000000..d95f54cecf
> +--- /dev/null
> ++++ b/tests/libtest/test3500.pl
> +@@ -0,0 +1,72 @@
> ++#!/usr/bin/env perl
> ++#**********************************************************************=
*****
>=20
> ++# _ _ ____ _
> ++# Project ___| | | | _ \| |
> ++# / __| | | | |_) | |
> ++# | (__| |_| | _ <| |___
> ++# \___|\___/|_| \_\_____|
> ++#
> ++# Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
> ++#
> ++# This software is licensed as described in the file COPYING, which
> ++# you should have received as part of this distribution. The terms
> ++# are also available at https://curl.se/docs/copyright.html.
> ++#
> ++# You may opt to use, copy, modify, merge, publish, distribute and/or
> sell
> ++# copies of the Software, and permit persons to whom the Software is
> ++# furnished to do so, under the terms of the COPYING file.
> ++#
> ++# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF
> ANY
> ++# KIND, either express or implied.
> ++#
> ++# SPDX-License-Identifier: curl
> ++#
> ++#######################################################################=
####
>=20
> ++use strict;
> ++use warnings;
> ++
> ++use Digest::SHA qw(hmac_sha1);
> ++use MIME::Base64 qw(encode_base64);
> ++
> ++sub errout {
> ++ print $_[0] . "\n";
> ++ exit 1;
> ++}
> ++
> ++if(@ARGV !=3D 3) {
> ++ errout "Usage: $0 host-public-key known-hosts-file target";
> ++}
> ++
> ++my ($hostkey_file, $knownhosts_file, $target) =3D @ARGV;
> ++open(my $hostkey, "<", $hostkey_file) or errout "$!";
> ++my $hostkey_line =3D <$hostkey>;
> ++close($hostkey) or errout "$!";
> ++
> ++my ($hostkey_algo, $hostkey_data) =3D split(/\s+/, $hostkey_line);
> ++if(!$hostkey_algo || !$hostkey_data) {
> ++ errout "Failed parsing SSH host public key";
> ++}
> ++
> ++my $rsa_key =3D
> ++ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgSyqrUP2xhqLqkyopVapoKeucYIp" =
.
>=20
> ++ "ZXeUqj+Q9WLWyXka5re62Y3R/lxZUXtkJjlpdD2LNMFenNlDQvPaXH5Utllt+c3z" .
> ++ "wOkOLy7RXX5S37SfQFm/0fPkZqoZfMDB6XDcwA4cakjCRn4oZyKs8dWAxoNaTtYc" .
> ++ "nKKMJ6rmc8PttykJw9fwiKAjPyYf21/BMvWIzu9req+TrDA/Jcd2UAug94CikJIX" .
> ++ "uwKmSYleAOo4eJWx8GyujgEgZn05eq+K1LSg9RqRVIxOdqjoE5K3abBfs0rmUuLd" .
> ++ "MFh7nHseTFXYbKzpz46V7iZMfFuoyURrzVsqGUm+/m7dxBM98In12kOm3";
> ++my $ed25519_key =3D
> ++ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqmXRY8k+W9GtpWxYru6ELAXYHdXq" .
> ++ "jf33ziITGTiJUN";
> ++my $other_key =3D $hostkey_algo eq "ssh-ed25519" ? $rsa_key :
> $ed25519_key;
> ++
> ++my $salt =3D "curl-knownhosts-test";
> ++my $salt64 =3D encode_base64($salt, "");
> ++my $hash64 =3D encode_base64(hmac_sha1("unrelated.invalid", $salt), "")=
;
> ++my $target_hash64 =3D encode_base64(hmac_sha1($target, $salt), "");
> ++
> ++open(my $knownhosts, ">", $knownhosts_file) or errout "$!";
> ++print $knownhosts "|1|$salt64|$hash64 $other_key\n";
> ++print $knownhosts "|1|$salt64|$target_hash64 $hostkey_algo
> $hostkey_data\n";
> ++close($knownhosts) or errout "$!";
> ++
> ++exit 0;
> diff --git a/meta/recipes-support/curl/curl_8.22.0.bb
> b/meta/recipes-support/curl/curl_8.22.0.bb
> index 95d5801ad5..979e416249 100644
> --- a/meta/recipes-support/curl/curl_8.22.0.bb
> +++ b/meta/recipes-support/curl/curl_8.22.0.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D " \
> file://CVE-2026-92388-1.patch \
> file://CVE-2026-92388-2.patch \
> file://CVE-2026-92389.patch \
> + file://CVE-2026-87865.patch \
> "
>=20
> SRC_URI:append:class-nativesdk =3D " \
> --
> 2.55.0

--B60ctxgXdFHNgrnJnHtP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Joao, Yoann,<br /><br />
<p><span>I noticed that test3500 invokes %SRCDIR/libtest/test3500.pl</span>=
<span> in its precheck,<br /></span><span>but the Blacksail </span><span>re=
cipe does not install this script into the ptest package.</span></p>
<p><span>Adding it to EXTRA_DIST includes it in the source distribution;</s=
pan><br /><span>the recipe still needs to install it explicitly. Otherwise,=
 the</span><br /><span>precheck cannot run when libssh2/SFTP support is ena=
bled.</span></p>
<p><span>Could you include the following in do_install_ptest()</span><span>=
, after</span><br /><span>creating the tests/libtest </span><span>directory=
?<br /><br />My Wrynose v2 backport already includes this installation:<br =
/><a href=3D"https://lists.openembedded.org/g/openembedded-core/message/250=
999" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/op=
enembedded-core/message/250999</a><br /><br />Thanks,<br />Darsh</span></p>
On Wed, Nov 25, 2026 at 06:57 PM, Joao Marcos Costa wrote:</div>
<div>
<blockquote>This vulnerability, marked as High [1], was fixed upstream [2] =
since<br />v8.23.0.<br /><br />Backport the fix to curl v8.22.0.<br /><br /=
>[1] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-87865" target=3D"=
_blank" rel=3D"noopener">https://nvd.nist.gov/vuln/detail/cve-2026-87865</a=
><br />[2] <a href=3D"https://curl.se/docs/CVE-2026-87865.html" target=3D"_=
blank" rel=3D"noopener">https://curl.se/docs/CVE-2026-87865.html</a><br /><=
br />Signed-off-by: Jo&atilde;o Marcos Costa (Schneider Electric) &lt;joaom=
arcos.costa@bootlin.com&gt;<br />---<br />.../curl/curl/CVE-2026-87865.patc=
h | 216 ++++++++++++++++++<br />meta/recipes-support/curl/curl_8.22.0.bb | =
1 +<br />2 files changed, 217 insertions(+)<br />create mode 100644 meta/re=
cipes-support/curl/curl/CVE-2026-87865.patch<br /><br />diff --git a/meta/r=
ecipes-support/curl/curl/CVE-2026-87865.patch b/meta/recipes-support/curl/c=
url/CVE-2026-87865.patch<br />new file mode 100644<br />index 0000000000..3=
2a7441c95<br />--- /dev/null<br />+++ b/meta/recipes-support/curl/curl/CVE-=
2026-87865.patch<br />@@ -0,0 +1,216 @@<br />+From a7622dc02ccc01f7438227f1=
920db08268a6ccb0 Mon Sep 17 00:00:00 2001<br />+From: Bobbeh Rhino &lt;bobb=
eh@rhino.Rhino&gt;<br />+Date: Tue, 8 Sep 2026 06:33:27 -0400<br />+Subject=
: [PATCH] libssh2: match hashed known_hosts entries by host<br />+MIME-Vers=
ion: 1.0<br />+Content-Type: text/plain; charset=3DUTF-8<br />+Content-Tran=
sfer-Encoding: 8bit<br />+<br />+libssh2 does not expose the plaintext name=
 for hashed entries. Check<br />+each entry key against the requested hostn=
ame before using its key type.<br />+Otherwise an unrelated hashed entry ca=
n select the wrong algorithm.<br />+<br />+Add an SFTP regression test 3500=
 with an unrelated hashed entry before<br />+the requested host.<br />+<br =
/>+Closes #22874<br />+<br />+CVE: CVE-2026-87865<br />+Upstream-Status: Ba=
ckport [<a href=3D"https://github.com/curl/curl/commit/323c184b6bdf5b1988a1=
0c0a61560" target=3D"_blank" rel=3D"noopener">https://github.com/curl/curl/=
commit/323c184b6bdf5b1988a10c0a61560</a>]<br />+<br />+Signed-off-by: Jo&at=
ilde;o Marcos Costa &lt;joaomarcos.costa@bootlin.com&gt;<br />+---<br />+ l=
ib/vssh/libssh2.c | 16 +++++++--<br />+ tests/data/Makefile.am | 2 ++<br />=
+ tests/data/test3500 | 47 +++++++++++++++++++++++++<br />+ tests/libtest/M=
akefile.am | 3 +-<br />+ tests/libtest/test3500.pl | 72 +++++++++++++++++++=
++++++++++++++++++++<br />+ 5 files changed, 136 insertions(+), 4 deletions=
(-)<br />+ create mode 100644 tests/data/test3500<br />+ create mode 100755=
 tests/libtest/test3500.pl<br />+<br />+diff --git a/lib/vssh/libssh2.c b/l=
ib/vssh/libssh2.c<br />+index 24a651d30e..cd28cde76f 100644<br />+--- a/lib=
/vssh/libssh2.c<br />++++ b/lib/vssh/libssh2.c<br />+@@ -685,9 +685,19 @@ s=
tatic CURLcode ssh_force_knownhost_key_type(struct Curl_easy *data,<br />+ =
break;<br />+ }<br />+ }<br />+- else {<br />+- found =3D TRUE;<br />+- bre=
ak;<br />++ else if(store-&gt;key) {<br />++ int keycheck =3D libssh2_known=
host_checkp(<br />++ sshc-&gt;kh, conn-&gt;origin-&gt;hostname,<br />++ (co=
nn-&gt;origin-&gt;port !=3D PORT_SSH) ? conn-&gt;origin-&gt;port : -1,<br /=
>++ store-&gt;key, strlen(store-&gt;key),<br />++ LIBSSH2_KNOWNHOST_TYPE_PL=
AIN |<br />++ LIBSSH2_KNOWNHOST_KEYENC_BASE64 |<br />++ (store-&gt;typemask=
 &amp; LIBSSH2_KNOWNHOST_KEY_MASK),<br />++ NULL);<br />++ if(keycheck =3D=
=3D LIBSSH2_KNOWNHOST_CHECK_MATCH) {<br />++ found =3D TRUE;<br />++ break;=
<br />++ }<br />+ }<br />+ }<br />+ }<br />+diff --git a/tests/data/Makefil=
e.am b/tests/data/Makefile.am<br />+index 3b32fce7bb..4a27927b1c 100644<br =
/>+--- a/tests/data/Makefile.am<br />++++ b/tests/data/Makefile.am<br />+@@=
 -2090,6 +2090,8 @@ TESTCASES =3D \<br />+ test3400 \<br />+ test3401 \<br =
/>+ \<br />++ test3500 \<br />++ \<br />+ test4000 \<br />+ test4001 \<br /=
>+ \<br />+diff --git a/tests/data/test3500 b/tests/data/test3500<br />+new=
 file mode 100644<br />+index 0000000000..1bcf3bc17d<br />+--- /dev/null<br=
 />++++ b/tests/data/test3500<br />+@@ -0,0 +1,47 @@<br />++&lt;?xml versio=
n=3D"1.0" encoding=3D"US-ASCII"?&gt;<br />++&lt;testcase&gt;<br />++&lt;inf=
o&gt;<br />++&lt;keywords&gt;<br />++SFTP<br />++known_hosts<br />++libssh2=
<br />++&lt;/keywords&gt;<br />++&lt;/info&gt;<br />++<br />++# Server-side=
<br />++&lt;reply&gt;<br />++&lt;data&gt;<br />++Test data<br />++for hashe=
d known hosts<br />++&lt;/data&gt;<br />++&lt;/reply&gt;<br />++<br />++# C=
lient-side<br />++&lt;client&gt;<br />++&lt;server&gt;<br />++sftp<br />++&=
lt;/server&gt;<br />++&lt;features&gt;<br />++sftp<br />++libssh2<br />++!b=
adlibssh<br />++&lt;/features&gt;<br />++&lt;precheck&gt;<br />++%PERL %SRC=
DIR/libtest/test3500.pl %LOGDIR/server/curl_host_key.pub %LOGDIR/known%TEST=
NUMBER "[%HOSTIP]:%SSHPORT"<br />++&lt;/precheck&gt;<br />++&lt;name&gt;<br=
 />++SFTP matches requested hashed known_hosts entry<br />++&lt;/name&gt;<b=
r />++&lt;command&gt;<br />++--knownhosts %LOGDIR/known%TESTNUMBER --key %L=
OGDIR/server/curl_client_key --pubkey %LOGDIR/server/curl_client_key.pub -u=
 %USER: sftp://%HOSTIP:%SSHPORT%SFTP_PWD/%LOGDIR/file%TESTNUMBER.txt<br />+=
+&lt;/command&gt;<br />++&lt;file name=3D"%LOGDIR/file%TESTNUMBER.txt"&gt;<=
br />++Test data<br />++for hashed known hosts<br />++&lt;/file&gt;<br />++=
&lt;/client&gt;<br />++<br />++# Verify data after the test has been "shot"=
<br />++&lt;verify&gt;<br />++&lt;/verify&gt;<br />++&lt;/testcase&gt;<br /=
>+diff --git a/tests/libtest/Makefile.am b/tests/libtest/Makefile.am<br />+=
index 74eb150742..8fdf484b55 100644<br />+--- a/tests/libtest/Makefile.am<b=
r />++++ b/tests/libtest/Makefile.am<br />+@@ -49,7 +49,8 @@ EXTRA_DIST =3D=
 CMakeLists.txt $(FIRST_C) $(FIRST_H) $(UTILS_C) $(UTILS_H) $(TESTS_<br />+=
 test1022.pl \<br />+ test307.pl \<br />+ test610.pl \<br />+- test613.pl<b=
r />++ test613.pl \<br />++ test3500.pl<br />+ <br />+ CFLAGS +=3D @CURL_CF=
LAG_EXTRAS@<br />+ <br />+diff --git a/tests/libtest/test3500.pl b/tests/li=
btest/test3500.pl<br />+new file mode 100755<br />+index 0000000000..d95f54=
cecf<br />+--- /dev/null<br />++++ b/tests/libtest/test3500.pl<br />+@@ -0,=
0 +1,72 @@<br />++#!/usr/bin/env perl<br />++#*****************************=
**********************************************<br />++# _ _ ____ _<br />++#=
 Project ___| | | | _ \| |<br />++# / __| | | | |_) | |<br />++# | (__| |_|=
 | _ &lt;| |___<br />++# \___|\___/|_| \_\_____|<br />++#<br />++# Copyrigh=
t (C) Daniel Stenberg, &lt;daniel@haxx.se&gt;, et al.<br />++#<br />++# Thi=
s software is licensed as described in the file COPYING, which<br />++# you=
 should have received as part of this distribution. The terms<br />++# are =
also available at <a href=3D"https://curl.se/docs/copyright.html" target=3D=
"_blank" rel=3D"noopener">https://curl.se/docs/copyright.html</a>.<br />++#=
<br />++# You may opt to use, copy, modify, merge, publish, distribute and/=
or sell<br />++# copies of the Software, and permit persons to whom the Sof=
tware is<br />++# furnished to do so, under the terms of the COPYING file.<=
br />++#<br />++# This software is distributed on an "AS IS" basis, WITHOUT=
 WARRANTY OF ANY<br />++# KIND, either express or implied.<br />++#<br />++=
# SPDX-License-Identifier: curl<br />++#<br />++###########################=
################################################<br />++use strict;<br />++=
use warnings;<br />++<br />++use Digest::SHA qw(hmac_sha1);<br />++use MIME=
::Base64 qw(encode_base64);<br />++<br />++sub errout {<br />++ print $_[0]=
 . "\n";<br />++ exit 1;<br />++}<br />++<br />++if(@ARGV !=3D 3) {<br />++=
 errout "Usage: $0 host-public-key known-hosts-file target";<br />++}<br />=
++<br />++my ($hostkey_file, $knownhosts_file, $target) =3D @ARGV;<br />++o=
pen(my $hostkey, "&lt;", $hostkey_file) or errout "$!";<br />++my $hostkey_=
line =3D &lt;$hostkey&gt;;<br />++close($hostkey) or errout "$!";<br />++<b=
r />++my ($hostkey_algo, $hostkey_data) =3D split(/\s+/, $hostkey_line);<br=
 />++if(!$hostkey_algo || !$hostkey_data) {<br />++ errout "Failed parsing =
SSH host public key";<br />++}<br />++<br />++my $rsa_key =3D<br />++ "ssh-=
rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgSyqrUP2xhqLqkyopVapoKeucYIp" .<br />++ =
"ZXeUqj+Q9WLWyXka5re62Y3R/lxZUXtkJjlpdD2LNMFenNlDQvPaXH5Utllt+c3z" .<br />+=
+ "wOkOLy7RXX5S37SfQFm/0fPkZqoZfMDB6XDcwA4cakjCRn4oZyKs8dWAxoNaTtYc" .<br /=
>++ "nKKMJ6rmc8PttykJw9fwiKAjPyYf21/BMvWIzu9req+TrDA/Jcd2UAug94CikJIX" .<br=
 />++ "uwKmSYleAOo4eJWx8GyujgEgZn05eq+K1LSg9RqRVIxOdqjoE5K3abBfs0rmUuLd" .<=
br />++ "MFh7nHseTFXYbKzpz46V7iZMfFuoyURrzVsqGUm+/m7dxBM98In12kOm3";<br />+=
+my $ed25519_key =3D<br />++ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqmXRY8k=
+W9GtpWxYru6ELAXYHdXq" .<br />++ "jf33ziITGTiJUN";<br />++my $other_key =3D=
 $hostkey_algo eq "ssh-ed25519" ? $rsa_key : $ed25519_key;<br />++<br />++m=
y $salt =3D "curl-knownhosts-test";<br />++my $salt64 =3D encode_base64($sa=
lt, "");<br />++my $hash64 =3D encode_base64(hmac_sha1("unrelated.invalid",=
 $salt), "");<br />++my $target_hash64 =3D encode_base64(hmac_sha1($target,=
 $salt), "");<br />++<br />++open(my $knownhosts, "&gt;", $knownhosts_file)=
 or errout "$!";<br />++print $knownhosts "|1|$salt64|$hash64 $other_key\n"=
;<br />++print $knownhosts "|1|$salt64|$target_hash64 $hostkey_algo $hostke=
y_data\n";<br />++close($knownhosts) or errout "$!";<br />++<br />++exit 0;=
<br />diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-=
support/curl/curl_8.22.0.bb<br />index 95d5801ad5..979e416249 100644<br />-=
-- a/meta/recipes-support/curl/curl_8.22.0.bb<br />+++ b/meta/recipes-suppo=
rt/curl/curl_8.22.0.bb<br />@@ -17,6 +17,7 @@ SRC_URI =3D " \<br />file://C=
VE-2026-92388-1.patch \<br />file://CVE-2026-92388-2.patch \<br />file://CV=
E-2026-92389.patch \<br />+ file://CVE-2026-87865.patch \<br />"<br /><br /=
>SRC_URI:append:class-nativesdk =3D " \<br />-- <br />2.55.0</blockquote>
</div>

--B60ctxgXdFHNgrnJnHtP--
