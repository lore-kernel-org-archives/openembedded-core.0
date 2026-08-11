Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6980DC5B56D
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:23:50 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49437.1786433028783807243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RAkdx0Q9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KjpnIqIB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019fefb4bebb-a56cc437-f658-4f6b-8d2f-27b9139cb96c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433027;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=TqT7GORDUWTOOXORWXeWeaEuykdNFLOODIdU8f1RVR0=;
	b=RAkdx0Q9lZW8KJhCGun2b9OF8ohKp5sEkTkj02x8wUCehPg+zB7HES3GQQX7vR9z
	P0ETo/JtJevb2LnolPluv4ApiSd+zvg2+peRJOx+bN6pKryxFd/3U/hXVM2IKDFa28H
	+AqY8ZQTMouGOicUmVNyo1xLvhNbIQWXjvTbl7+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433027;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=TqT7GORDUWTOOXORWXeWeaEuykdNFLOODIdU8f1RVR0=;
	b=KjpnIqIBrzUo/5PfVexeG2G0SL94QV311Ex+RqDcuronce08e3O+EDi0zyh+7TQO
	QsQFqag+fFIg8/OOLYOuTHoOMts6MK9NC1YhZLUHzII8RErk9rOzYfZzpcKdf2aY+ci
	0CK0tTrcOSemyltMhO9njdeYTJdde0fXSk29UX2o=
Content-Type: multipart/mixed; boundary="===============4093934059285350589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 10.5p1 SUCCEEDED
Message-ID: <0101019fefb4bebb-a56cc437-f658-4f6b-8d2f-27b9139cb96c-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243156

--===============4093934059285350589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssh* to *10.5p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-10.4p1-10.5p1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d014df9577ee7807ff1b45dc0a7dbfe86d397f3c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 11 Aug 2026 05:27:02 +0000
Subject: [PATCH] openssh: upgrade 10.4p1 -> 10.5p1

Source: ChangeLog

depend
update version
upstream: add regress test for servers that hang durig banner write;
upstream: openssh-10.5
upstream: remove ml-dsa/x25519 from the default algorithm list for
upstream: make reading server banner non-blocking; prevents one
Use clang-20 when building hardenedmalloc for tests.
upstream: remove mlkem768brainpoolp256r1-sha256; requested by
upstream: move comment to a better place; suggested by markus@
upstream: add some options to allow setting or clearing the
upstream: Allow session-bind@openssh.com requests when the agent is
upstream: avoid potential realloc use-after-free in the client if a
upstream: fix up synopsis and tweak wording for -Z
upstream: document existence of
Re-allow PAMServiceName inside a Match block.
Rerun VM tests on regress Makefile change too
Run tests on regress Makefile changes too.
upstream: disable pubkey-priority test until I can fix it to not pick
upstream: Fix expected output for implicit ordering test. ok djm@
Don't enable Brainpool on AWS-LC or BoringSSL.
Correct filename in comment.
Fix OpenSSL ECC detection message.
Make EC_KEY_METHOD_new optional again.
upstream: crank up MaxAuthTries to avoid failures here
upstream: regression test for pubkey ordering in the client; ok
upstream: Tweak ordering of certificates tried during pubkey
upstream: Add a "ssh -Z user@host" mode that dumps the pubkeys that
upstream: fix ML-KEM/ECDH interop problem (does not affect
Require NISTP521 in libcrypto.
Remove support for libcrypto w/out ECC.
Add includes.h for compat interfaces.
upstream: Use ssh_mldsa44_ed25519_cleanup consistently to avoid
upstream: Fix $OpenBSD marker for easier syncing.
upstream: ssh: update kex unit test
upstream: Make mlkem768ecdh build with OPENSSL=no. ok djm@
upstream: pass back errors from ed25519 key generation, which
upstream: Move check of public key type against allowed algorithms
upstream: Fix double frees (impossible to reach outside of a test
upstream: ssh: implement mlkem768brainpoolp256r1-sha256; ok djm@
upstream: ssh: implement mlkem768nistp256-sha256; ok djm@
upstream: use sshpkt_fatal instead of plain fatal() for errors in
upstream: Automatically detect IPv6 support
upstream: Factor out all of the IPv6 addresses into variables.
Sync missed case-insensitivity changes.
Add obsd79 target.
Wording.
upstream: verify that ChannelTimeout in a Match block is effective
upstream: verify that RekeyLimit in a Match block is effective
upstream: Use -Ohashalg to restrict output to specfic hash instead
upstream: fix ChannelTimeout and RekeyLimit not being applied in
upstream: s/= - 1/= -1/; from serity---
upstream: move to a better place
upstream: use crypto_api.h #define constants for lengths; no
upstream: make authorized_keys "restrict" keyword apply correctly
upstream: in sshd config dump mode, write all directives in mixed
upstream: read ~/.ssh/id_mldsa44_ed25519 private key files by
upstream: document mldsa44-ed25519 host key and public key
upstream: when signing ho

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.4p1.bb => openssh_10.5p1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.4p1.bb => openssh_10.5p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index f424288e37..2c1c3f45ae 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From 5cc897fe2effe549e1e280c2f606bce8b532b61e Mon Sep 17 00:00:00 2001
+From 207d3428c1182de6c169f34a9e33a07c1bd00554 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.4p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 96903bbc0c..e4b6ddef9d 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            "
-SRC_URI[sha256sum] = "ef6026dd2aea8d56059638d5d3262902c892ceba9f88395835e0d06d3fb63238"
+SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.47.1


--===============4093934059285350589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/ecdsa256_openssh.pub /usr/lib/openssh/ptest/regress/ecdsa521_openssh.pub /usr/lib/openssh/ptest/regress/ecdsa384_openssh.pub /usr/lib/openssh/ptest/regress/pubkey-priority.sh /usr/lib/openssh/ptest/regress/ecdsa256_openssh.prv /usr/lib/openssh/ptest/regress/ecdsa384_openssh.prv /usr/lib/openssh/ptest/regress/ecdsa521_openssh.prv"

--===============4093934059285350589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="openssh-changelog.txt"

Changelog for openssh: 10.4p1 -> 10.5p1
Source: ChangeLog

depend
update version
upstream: add regress test for servers that hang durig banner write;
upstream: openssh-10.5
upstream: remove ml-dsa/x25519 from the default algorithm list for
upstream: make reading server banner non-blocking; prevents one
Use clang-20 when building hardenedmalloc for tests.
upstream: remove mlkem768brainpoolp256r1-sha256; requested by
upstream: move comment to a better place; suggested by markus@
upstream: add some options to allow setting or clearing the
upstream: Allow session-bind@openssh.com requests when the agent is
upstream: avoid potential realloc use-after-free in the client if a
upstream: fix up synopsis and tweak wording for -Z
upstream: document existence of
Re-allow PAMServiceName inside a Match block.
Rerun VM tests on regress Makefile change too
Run tests on regress Makefile changes too.
upstream: disable pubkey-priority test until I can fix it to not pick
upstream: Fix expected output for implicit ordering test. ok djm@
Don't enable Brainpool on AWS-LC or BoringSSL.
Correct filename in comment.
Fix OpenSSL ECC detection message.
Make EC_KEY_METHOD_new optional again.
upstream: crank up MaxAuthTries to avoid failures here
upstream: regression test for pubkey ordering in the client; ok
upstream: Tweak ordering of certificates tried during pubkey
upstream: Add a "ssh -Z user@host" mode that dumps the pubkeys that
upstream: fix ML-KEM/ECDH interop problem (does not affect
Require NISTP521 in libcrypto.
Remove support for libcrypto w/out ECC.
Add includes.h for compat interfaces.
upstream: Use ssh_mldsa44_ed25519_cleanup consistently to avoid
upstream: Fix $OpenBSD marker for easier syncing.
upstream: ssh: update kex unit test
upstream: Make mlkem768ecdh build with OPENSSL=no. ok djm@
upstream: pass back errors from ed25519 key generation, which
upstream: Move check of public key type against allowed algorithms
upstream: Fix double frees (impossible to reach outside of a test
upstream: ssh: implement mlkem768brainpoolp256r1-sha256; ok djm@
upstream: ssh: implement mlkem768nistp256-sha256; ok djm@
upstream: use sshpkt_fatal instead of plain fatal() for errors in
upstream: Automatically detect IPv6 support
upstream: Factor out all of the IPv6 addresses into variables.
Sync missed case-insensitivity changes.
Add obsd79 target.
Wording.
upstream: verify that ChannelTimeout in a Match block is effective
upstream: verify that RekeyLimit in a Match block is effective
upstream: Use -Ohashalg to restrict output to specfic hash instead
upstream: fix ChannelTimeout and RekeyLimit not being applied in
upstream: s/= - 1/= -1/; from serity---
upstream: move to a better place
upstream: use crypto_api.h #define constants for lengths; no
upstream: make authorized_keys "restrict" keyword apply correctly
upstream: in sshd config dump mode, write all directives in mixed
upstream: read ~/.ssh/id_mldsa44_ed25519 private key files by
upstream: document mldsa44-ed25519 host key and public key
upstream: when signing hostkey proofs for a client UpdateHostKeys
upstream: setproctitle(3) to identify sshd-session when its
upstream: delete list of ssh_config(5) options under
upstream: enable the ssh-mldsa44-ed25519@openssh.com signature
upstream: prefer fstat to stat when it's trivial to do so
upstream: Add tests for ecdsa 256, 384 and 521 keys in DNS
upstream: check sshd_config output case insensitively
upstream: Add SSHFP tests for ed25519 key type.
upstream: Restructure the SSHFP test in preparation for adding
remove README.tun
add some parentheses to clarify a && || condition
upstream: unused variables
upstream: fix GSSAPI option names, that I somehow screwed up while
Add 10.4 branch to status page.

--===============4093934059285350589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-10.4p1-10.5p1.patch"

RnJvbSBkMDE0ZGY5NTc3ZWU3ODA3ZmYxYjQ1ZGMwYTdkYmZlODZkMzk3ZjNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTEgQXVnIDIwMjYgMDU6Mjc6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NoOiB1cGdyYWRlIDEwLjRwMSAtPiAxMC41cDEKClNvdXJjZTogQ2hhbmdlTG9nCgpkZXBl
bmQKdXBkYXRlIHZlcnNpb24KdXBzdHJlYW06IGFkZCByZWdyZXNzIHRlc3QgZm9yIHNlcnZlcnMg
dGhhdCBoYW5nIGR1cmlnIGJhbm5lciB3cml0ZTsKdXBzdHJlYW06IG9wZW5zc2gtMTAuNQp1cHN0
cmVhbTogcmVtb3ZlIG1sLWRzYS94MjU1MTkgZnJvbSB0aGUgZGVmYXVsdCBhbGdvcml0aG0gbGlz
dCBmb3IKdXBzdHJlYW06IG1ha2UgcmVhZGluZyBzZXJ2ZXIgYmFubmVyIG5vbi1ibG9ja2luZzsg
cHJldmVudHMgb25lClVzZSBjbGFuZy0yMCB3aGVuIGJ1aWxkaW5nIGhhcmRlbmVkbWFsbG9jIGZv
ciB0ZXN0cy4KdXBzdHJlYW06IHJlbW92ZSBtbGtlbTc2OGJyYWlucG9vbHAyNTZyMS1zaGEyNTY7
IHJlcXVlc3RlZCBieQp1cHN0cmVhbTogbW92ZSBjb21tZW50IHRvIGEgYmV0dGVyIHBsYWNlOyBz
dWdnZXN0ZWQgYnkgbWFya3VzQAp1cHN0cmVhbTogYWRkIHNvbWUgb3B0aW9ucyB0byBhbGxvdyBz
ZXR0aW5nIG9yIGNsZWFyaW5nIHRoZQp1cHN0cmVhbTogQWxsb3cgc2Vzc2lvbi1iaW5kQG9wZW5z
c2guY29tIHJlcXVlc3RzIHdoZW4gdGhlIGFnZW50IGlzCnVwc3RyZWFtOiBhdm9pZCBwb3RlbnRp
YWwgcmVhbGxvYyB1c2UtYWZ0ZXItZnJlZSBpbiB0aGUgY2xpZW50IGlmIGEKdXBzdHJlYW06IGZp
eCB1cCBzeW5vcHNpcyBhbmQgdHdlYWsgd29yZGluZyBmb3IgLVoKdXBzdHJlYW06IGRvY3VtZW50
IGV4aXN0ZW5jZSBvZgpSZS1hbGxvdyBQQU1TZXJ2aWNlTmFtZSBpbnNpZGUgYSBNYXRjaCBibG9j
ay4KUmVydW4gVk0gdGVzdHMgb24gcmVncmVzcyBNYWtlZmlsZSBjaGFuZ2UgdG9vClJ1biB0ZXN0
cyBvbiByZWdyZXNzIE1ha2VmaWxlIGNoYW5nZXMgdG9vLgp1cHN0cmVhbTogZGlzYWJsZSBwdWJr
ZXktcHJpb3JpdHkgdGVzdCB1bnRpbCBJIGNhbiBmaXggaXQgdG8gbm90IHBpY2sKdXBzdHJlYW06
IEZpeCBleHBlY3RlZCBvdXRwdXQgZm9yIGltcGxpY2l0IG9yZGVyaW5nIHRlc3QuIG9rIGRqbUAK
RG9uJ3QgZW5hYmxlIEJyYWlucG9vbCBvbiBBV1MtTEMgb3IgQm9yaW5nU1NMLgpDb3JyZWN0IGZp
bGVuYW1lIGluIGNvbW1lbnQuCkZpeCBPcGVuU1NMIEVDQyBkZXRlY3Rpb24gbWVzc2FnZS4KTWFr
ZSBFQ19LRVlfTUVUSE9EX25ldyBvcHRpb25hbCBhZ2Fpbi4KdXBzdHJlYW06IGNyYW5rIHVwIE1h
eEF1dGhUcmllcyB0byBhdm9pZCBmYWlsdXJlcyBoZXJlCnVwc3RyZWFtOiByZWdyZXNzaW9uIHRl
c3QgZm9yIHB1YmtleSBvcmRlcmluZyBpbiB0aGUgY2xpZW50OyBvawp1cHN0cmVhbTogVHdlYWsg
b3JkZXJpbmcgb2YgY2VydGlmaWNhdGVzIHRyaWVkIGR1cmluZyBwdWJrZXkKdXBzdHJlYW06IEFk
ZCBhICJzc2ggLVogdXNlckBob3N0IiBtb2RlIHRoYXQgZHVtcHMgdGhlIHB1YmtleXMgdGhhdAp1
cHN0cmVhbTogZml4IE1MLUtFTS9FQ0RIIGludGVyb3AgcHJvYmxlbSAoZG9lcyBub3QgYWZmZWN0
ClJlcXVpcmUgTklTVFA1MjEgaW4gbGliY3J5cHRvLgpSZW1vdmUgc3VwcG9ydCBmb3IgbGliY3J5
cHRvIHcvb3V0IEVDQy4KQWRkIGluY2x1ZGVzLmggZm9yIGNvbXBhdCBpbnRlcmZhY2VzLgp1cHN0
cmVhbTogVXNlIHNzaF9tbGRzYTQ0X2VkMjU1MTlfY2xlYW51cCBjb25zaXN0ZW50bHkgdG8gYXZv
aWQKdXBzdHJlYW06IEZpeCAkT3BlbkJTRCBtYXJrZXIgZm9yIGVhc2llciBzeW5jaW5nLgp1cHN0
cmVhbTogc3NoOiB1cGRhdGUga2V4IHVuaXQgdGVzdAp1cHN0cmVhbTogTWFrZSBtbGtlbTc2OGVj
ZGggYnVpbGQgd2l0aCBPUEVOU1NMPW5vLiBvayBkam1ACnVwc3RyZWFtOiBwYXNzIGJhY2sgZXJy
b3JzIGZyb20gZWQyNTUxOSBrZXkgZ2VuZXJhdGlvbiwgd2hpY2gKdXBzdHJlYW06IE1vdmUgY2hl
Y2sgb2YgcHVibGljIGtleSB0eXBlIGFnYWluc3QgYWxsb3dlZCBhbGdvcml0aG1zCnVwc3RyZWFt
OiBGaXggZG91YmxlIGZyZWVzIChpbXBvc3NpYmxlIHRvIHJlYWNoIG91dHNpZGUgb2YgYSB0ZXN0
CnVwc3RyZWFtOiBzc2g6IGltcGxlbWVudCBtbGtlbTc2OGJyYWlucG9vbHAyNTZyMS1zaGEyNTY7
IG9rIGRqbUAKdXBzdHJlYW06IHNzaDogaW1wbGVtZW50IG1sa2VtNzY4bmlzdHAyNTYtc2hhMjU2
OyBvayBkam1ACnVwc3RyZWFtOiB1c2Ugc3NocGt0X2ZhdGFsIGluc3RlYWQgb2YgcGxhaW4gZmF0
YWwoKSBmb3IgZXJyb3JzIGluCnVwc3RyZWFtOiBBdXRvbWF0aWNhbGx5IGRldGVjdCBJUHY2IHN1
cHBvcnQKdXBzdHJlYW06IEZhY3RvciBvdXQgYWxsIG9mIHRoZSBJUHY2IGFkZHJlc3NlcyBpbnRv
IHZhcmlhYmxlcy4KU3luYyBtaXNzZWQgY2FzZS1pbnNlbnNpdGl2aXR5IGNoYW5nZXMuCkFkZCBv
YnNkNzkgdGFyZ2V0LgpXb3JkaW5nLgp1cHN0cmVhbTogdmVyaWZ5IHRoYXQgQ2hhbm5lbFRpbWVv
dXQgaW4gYSBNYXRjaCBibG9jayBpcyBlZmZlY3RpdmUKdXBzdHJlYW06IHZlcmlmeSB0aGF0IFJl
a2V5TGltaXQgaW4gYSBNYXRjaCBibG9jayBpcyBlZmZlY3RpdmUKdXBzdHJlYW06IFVzZSAtT2hh
c2hhbGcgdG8gcmVzdHJpY3Qgb3V0cHV0IHRvIHNwZWNmaWMgaGFzaCBpbnN0ZWFkCnVwc3RyZWFt
OiBmaXggQ2hhbm5lbFRpbWVvdXQgYW5kIFJla2V5TGltaXQgbm90IGJlaW5nIGFwcGxpZWQgaW4K
dXBzdHJlYW06IHMvPSAtIDEvPSAtMS87IGZyb20gc2VyaXR5LS0tCnVwc3RyZWFtOiBtb3ZlIHRv
IGEgYmV0dGVyIHBsYWNlCnVwc3RyZWFtOiB1c2UgY3J5cHRvX2FwaS5oICNkZWZpbmUgY29uc3Rh
bnRzIGZvciBsZW5ndGhzOyBubwp1cHN0cmVhbTogbWFrZSBhdXRob3JpemVkX2tleXMgInJlc3Ry
aWN0IiBrZXl3b3JkIGFwcGx5IGNvcnJlY3RseQp1cHN0cmVhbTogaW4gc3NoZCBjb25maWcgZHVt
cCBtb2RlLCB3cml0ZSBhbGwgZGlyZWN0aXZlcyBpbiBtaXhlZAp1cHN0cmVhbTogcmVhZCB+Ly5z
c2gvaWRfbWxkc2E0NF9lZDI1NTE5IHByaXZhdGUga2V5IGZpbGVzIGJ5CnVwc3RyZWFtOiBkb2N1
bWVudCBtbGRzYTQ0LWVkMjU1MTkgaG9zdCBrZXkgYW5kIHB1YmxpYyBrZXkKdXBzdHJlYW06IHdo
ZW4gc2lnbmluZyBobwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyAzMDAwIGNo
YXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0YWNobWVu
dCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLjEtcmVncmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0
LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaCB8IDIgKy0KIC4uLi9vcGVuc3NoL3tvcGVu
c3NoXzEwLjRwMS5iYiA9PiBvcGVuc3NoXzEwLjVwMS5iYn0gICAgICAgICAgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC97b3BlbnNzaF8xMC40cDEuYmIgPT4gb3Bl
bnNzaF8xMC41cDEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5k
LW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NoL29wZW5zc2gvMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1sb2ctaW5wdXQtYW5kLW91dHB1
dC1maWxlcy1vbi1lcnJvLnBhdGNoCmluZGV4IGY0MjQyODhlMzcuLjJjMWMzZjQ1YWUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoLzAwMDEtcmVn
cmVzcy1iYW5uZXIuc2gtbG9nLWlucHV0LWFuZC1vdXRwdXQtZmlsZXMtb24tZXJyby5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaC8wMDAxLXJlZ3Jl
c3MtYmFubmVyLnNoLWxvZy1pbnB1dC1hbmQtb3V0cHV0LWZpbGVzLW9uLWVycm8ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDVjYzg5N2ZlMmVmZmU1NDllMWUyODBjMmY2MDZiY2U4YjUzMmI2
MWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIwN2QzNDI4YzExODJkZTZjMTY5ZjM0
YTllMzNhMDdjMWJkMDA1NTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaWtrbyBS
YXBlbGkgPG1pa2tvLnJhcGVsaUBsaW5hcm8ub3JnPgogRGF0ZTogTW9uLCAxMSBTZXAgMjAyMyAw
OTo1NToyMSArMDEwMAogU3ViamVjdDogW1BBVENIXSByZWdyZXNzL2Jhbm5lci5zaDogbG9nIGlu
cHV0IGFuZCBvdXRwdXQgZmlsZXMgb24gZXJyb3IKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjRwMS5iYiBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzEwLjVwMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC40
cDEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3No
XzEwLjVwMS5iYgppbmRleCA5NjkwM2JiYzBjLi5lNGI2ZGRlZjlkIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF8xMC40cDEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NoL29wZW5zc2hfMTAuNXAxLmJiCkBAIC0yNSw3
ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAub3BlbmJzZC5vcmcvcHViL09wZW5CU0Qv
T3BlblNTSC9wb3J0YWJsZS9vcGVuc3NoLSR7UFZ9LnRhCiAgICAgICAgICAgIGZpbGU6Ly9zc2hk
X2NoZWNrX2tleXMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1yZWdyZXNzLWJhbm5lci5zaC1s
b2ctaW5wdXQtYW5kLW91dHB1dC1maWxlcy1vbi1lcnJvLnBhdGNoIFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImVmNjAyNmRkMmFlYThkNTYwNTk2MzhkNWQzMjYyOTAyYzg5
MmNlYmE5Zjg4Mzk1ODM1ZTBkMDZkM2ZiNjMyMzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDQ0
ZDI4YTgzOWVhOWRhZjk2OWNjNjkxNTBmZGU1OTkxMGIyYjM5MzYxZGFkODFhM2JkNmNiZDE5MjE4
ZGIxMSIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAwNy0yNzY4XSA9ICJub3QtYXBwbGljYWJsZS1jb25m
aWc6IFRoaXMgQ1ZFIGlzIHNwZWNpZmljIHRvIE9wZW5TU0ggd2l0aCB0aGUgcGFtIG9waWUgd2hp
Y2ggd2UgZG9uJ3QgYnVpbGQvdXNlIGhlcmUuIgogCi0tIAoyLjQ3LjEKCg==

--===============4093934059285350589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/openssh: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh: SRC_URI changed from "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.4p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch" to "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-10.5p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.service file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://sshd_check_keys file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 41198016 to 41270448 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-dev: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-doc: PKGSIZE changed from 360446 to 359571 (-0%)
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-keygen: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-locale: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2485461 to 2489557 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: FILELIST: added "/usr/lib/openssh/ptest/regress/ecdsa256_openssh.pub /usr/lib/openssh/ptest/regress/ecdsa384_openssh.pub /usr/lib/openssh/ptest/regress/ecdsa521_openssh.pub /usr/lib/openssh/ptest/regress/pubkey-priority.sh /usr/lib/openssh/ptest/regress/ecdsa384_openssh.prv /usr/lib/openssh/ptest/regress/ecdsa256_openssh.prv /usr/lib/openssh/ptest/regress/ecdsa521_openssh.prv"
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 8475073 to 8485841 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-scp: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp-server: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sftp: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-src: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-src: FILELIST: directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/authopt -> /usr/src/debug/openssh/10.5p1/regress/unittests/authopt, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/match -> /usr/src/debug/openssh/10.5p1/regress/unittests/match, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/conversion -> /usr/src/debug/openssh/10.5p1/regress/unittests/conversion, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/sshbuf -> /usr/src/debug/openssh/10.5p1/regress/unittests/sshbuf, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/misc -> /usr/src/debug/openssh/10.5p1/regress/unittests/misc, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/crypto -> /usr/src/debug/openssh/10.5p1/regress/unittests/crypto, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/sshsig -> /usr/src/debug/openssh/10.5p1/regress/unittests/sshsig, directory
  renamed /usr/src/debug/openssh/10.4p1/regress/unittests/bitmap -> /usr/src/debug/openssh/10.5p1/regress/unittests/bitmap, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/test_helper -> /usr/src/debug/openssh/10.5p1/regress/unittests/test_helper, directory renamed /usr/src/debug/openssh/10.4p1/regress -> /usr/src/debug/openssh/10.5p1/regress, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/kex -> /usr/src/debug/openssh/10.5p1/regress/unittests/kex, directory renamed /usr/src/debug/openssh/10.4p1/openbsd-compat -> /usr/src/debug/openssh/10.5p1/openbsd-compat, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/hostkeys -> /usr/src/debug/openssh/10.5p1/regress/unittests/hostkeys, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/servconf -> /usr/src/debug/openssh/10.5p1/regress/unittests/servconf, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/utf8 -> /usr/src/debug/openssh/10.5p1/regress/unittests/ut
 f8, directory renamed /usr/src/debug/openssh/10.4p1/regress/unittests/sshkey -> /usr/src/debug/openssh/10.5p1/regress/unittests/sshkey, removed "/usr/src/debug/openssh/10.4p1/krl.c /usr/src/debug/openssh/10.4p1/ssh-pkcs11.h /usr/src/debug/openssh/10.4p1/krl.h /usr/src/debug/openssh/10.4p1/ssherr-nolibcrypto.c /usr/src/debug/openssh/10.4p1/ssh_api.c /usr/src/debug/openssh/10.4p1/ssh-pkcs11-helper.c /usr/src/debug/openssh/10.4p1/auth-rhosts.c /usr/src/debug/openssh/10.4p1/sshd.c /usr/src/debug/openssh/10.4p1/ssh_api.h /usr/src/debug/openssh/10.4p1/readconf.c /usr/src/debug/openssh/10.4p1/uidswap.h /usr/src/debug/openssh/10.4p1/readconf.h /usr/src/debug/openssh/10.4p1/cipher-chachapoly.h /usr/src/debug/openssh/10.4p1/uidswap.c /usr/src/debug/openssh/10.4p1/bitmap.h /usr/src/debug/openssh/10.4p1/bitmap.c /usr/src/debug/openssh/10.4p1/hostfile.c /usr/src/debug/openssh/10.4p1/dns.c /usr/src/debug/openssh/10.4p1/compat.h /usr/src/debug/openssh/10.4p1/dns.h /usr/src/debug/openssh/10.4p1/ssh
 -add.c /usr/src/debug/openssh/10.4p1/hostfile.h /usr/src/debug/openssh/10.4p1/compat.c /usr/src/debug/openssh/10.4p1/misc.h /usr/src/debug/openssh/10.4p1/groupaccess.c /usr/src/debug/openssh/10.4p1/misc.c /usr/src/debug/openssh/10.4p1/sftp-common.h /usr/src/debug/openssh/10.4p1/rijndael.h /usr/src/debug/openssh/10.4p1/cleanup.c /usr/src/debug/openssh/10.4p1/srclimit.c /usr/src/debug/openssh/10.4p1/sftp-common.c /usr/src/debug/openssh/10.4p1/srclimit.h /usr/src/debug/openssh/10.4p1/clientloop.c /usr/src/debug/openssh/10.4p1/auth2-kbdint.c /usr/src/debug/openssh/10.4p1/ssh-agent.c /usr/src/debug/openssh/10.4p1/ssh-ecdsa.c /usr/src/debug/openssh/10.4p1/msg.c /usr/src/debug/openssh/10.4p1/ssherr.h /usr/src/debug/openssh/10.4p1/log.c /usr/src/debug/openssh/10.4p1/hmac.h /usr/src/debug/openssh/10.4p1/clientloop.h /usr/src/debug/openssh/10.4p1/msg.h /usr/src/debug/openssh/10.4p1/ssherr.c /usr/src/debug/openssh/10.4p1/log.h /usr/src/debug/openssh/10.4p1/auth.h /usr/src/debug/openssh/10.4p1/
 auth2-methods.c /usr/src/debug/openssh/10.4p1/xmalloc.h /usr/src/debug/openssh/10.4p1/sftp-server-main.c /usr/src/debug/openssh/10.4p1/auth.c /usr/src/debug/openssh/10.4p1/xmalloc.c /usr/src/debug/openssh/10.4p1/moduli.c /usr/src/debug/openssh/10.4p1/ed25519-openssl.c /usr/src/debug/openssh/10.4p1/cipher-aesctr.h /usr/src/debug/openssh/10.4p1/platform-tracing.c /usr/src/debug/openssh/10.4p1/entropy.h /usr/src/debug/openssh/10.4p1/match.c /usr/src/debug/openssh/10.4p1/digest-openssl.c /usr/src/debug/openssh/10.4p1/platform-misc.c /usr/src/debug/openssh/10.4p1/entropy.c /usr/src/debug/openssh/10.4p1/match.h /usr/src/debug/openssh/10.4p1/dh.h /usr/src/debug/openssh/10.4p1/sftp-realpath.c /usr/src/debug/openssh/10.4p1/kexgen.c /usr/src/debug/openssh/10.4p1/sshbuf-misc.c /usr/src/debug/openssh/10.4p1/dh.c /usr/src/debug/openssh/10.4p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.4p1/monitor.h /usr/src/debug/openssh/10.4p1/ssh-sk-client.c /usr/src/debug/openssh/10.4p1/ssherr-li
 bcrypto.c /usr/src/debug/openssh/10.4p1/monitor.c /usr/src/debug/openssh/10.4p1/ssh-sk-helper.c /usr/src/debug/openssh/10.4p1/ssh-ed25519.c /usr/src/debug/openssh/10.4p1/monitor_fdpass.c /usr/src/debug/openssh/10.4p1/auth-options.c /usr/src/debug/openssh/10.4p1/monitor_wrap.c /usr/src/debug/openssh/10.4p1/sftp.c /usr/src/debug/openssh/10.4p1/servconf.h /usr/src/debug/openssh/10.4p1/libcrux_internal.h /usr/src/debug/openssh/10.4p1/auth-options.h /usr/src/debug/openssh/10.4p1/monitor_wrap.h /usr/src/debug/openssh/10.4p1/monitor_fdpass.h /usr/src/debug/openssh/10.4p1/sftp.h /usr/src/debug/openssh/10.4p1/servconf.c /usr/src/debug/openssh/10.4p1/auth2-passwd.c /usr/src/debug/openssh/10.4p1/sshlogin.h /usr/src/debug/openssh/10.4p1/sshlogin.c /usr/src/debug/openssh/10.4p1/pkcs11.h /usr/src/debug/openssh/10.4p1/sshconnect2.c /usr/src/debug/openssh/10.4p1/libcrux-mlkem-mldsa.c /usr/src/debug/openssh/10.4p1/ssh-sandbox.h /usr/src/debug/openssh/10.4p1/ssh.c /usr/src/debug/openssh/10.4p1/nchan.
 c /usr/src/debug/openssh/10.4p1/addr.c /usr/src/debug/openssh/10.4p1/auth2-hostbased.c /usr/src/debug/openssh/10.4p1/platform.c /usr/src/debug/openssh/10.4p1/utf8.c /usr/src/debug/openssh/10.4p1/addr.h /usr/src/debug/openssh/10.4p1/platform.h /usr/src/debug/openssh/10.4p1/utf8.h /usr/src/debug/openssh/10.4p1/ssh-sk.h /usr/src/debug/openssh/10.4p1/sshkey.h /usr/src/debug/openssh/10.4p1/packet.h /usr/src/debug/openssh/10.4p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.4p1/kexgex.c /usr/src/debug/openssh/10.4p1/sshkey.c /usr/src/debug/openssh/10.4p1/kexecdh.c /usr/src/debug/openssh/10.4p1/packet.c /usr/src/debug/openssh/10.4p1/channels.c /usr/src/debug/openssh/10.4p1/atomicio.c /usr/src/debug/openssh/10.4p1/authfile.h /usr/src/debug/openssh/10.4p1/kex.h /usr/src/debug/openssh/10.4p1/atomicio.h /usr/src/debug/openssh/10.4p1/channels.h /usr/src/debug/openssh/10.4p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.4p1/kex.c /usr/src/debug/openssh/10.4p1/authfile.c /usr/src/debug/openssh/10.
 4p1/mux.c /usr/src/debug/openssh/10.4p1/loginrec.h /usr/src/debug/openssh/10.4p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.4p1/sftp-client.c /usr/src/debug/openssh/10.4p1/dispatch.h /usr/src/debug/openssh/10.4p1/misc-agent.c /usr/src/debug/openssh/10.4p1/loginrec.c /usr/src/debug/openssh/10.4p1/dispatch.c /usr/src/debug/openssh/10.4p1/sftp-client.h /usr/src/debug/openssh/10.4p1/session.c /usr/src/debug/openssh/10.4p1/sshtty.c /usr/src/debug/openssh/10.4p1/readpass.c /usr/src/debug/openssh/10.4p1/smult_curve25519_ref.c /usr/src/debug/openssh/10.4p1/session.h /usr/src/debug/openssh/10.4p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.4p1/kexdh.c /usr/src/debug/openssh/10.4p1/sshbuf-io.c /usr/src/debug/openssh/10.4p1/auth-pam.h /usr/src/debug/openssh/10.4p1/sshd-auth.c /usr/src/debug/openssh/10.4p1/poly1305.c /usr/src/debug/openssh/10.4p1/sshsig.c /usr/src/debug/openssh/10.4p1/poly1305.h /usr/src/debug/openssh/10.4p1/sshsig.h /usr/src/debug/openssh/10.4p1/auth-pam.c /usr/src
 /debug/openssh/10.4p1/kexgexs.c /usr/src/debug/openssh/10.4p1/sftp-server.c /usr/src/debug/openssh/10.4p1/kex-names.c /usr/src/debug/openssh/10.4p1/kexc25519.c /usr/src/debug/openssh/10.4p1/authfd.h /usr/src/debug/openssh/10.4p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.4p1/platform-pledge.c /usr/src/debug/openssh/10.4p1/fatal.c /usr/src/debug/openssh/10.4p1/authfd.c /usr/src/debug/openssh/10.4p1/ssh-rsa.c /usr/src/debug/openssh/10.4p1/sshbuf.c /usr/src/debug/openssh/10.4p1/mac.c /usr/src/debug/openssh/10.4p1/scp.c /usr/src/debug/openssh/10.4p1/auth2-chall.c /usr/src/debug/openssh/10.4p1/mac.h /usr/src/debug/openssh/10.4p1/sshbuf.h /usr/src/debug/openssh/10.4p1/sshd-session.c /usr/src/debug/openssh/10.4p1/addrmatch.c /usr/src/debug/openssh/10.4p1/crypto_api.h /usr/src/debug/openssh/10.4p1/sftp-glob.c /usr/src/debug/openssh/10.4p1/sntrup761.c /usr/src/debug/openssh/10.4p1/auth-passwd.c /usr/src/debug/openssh/10.4p1/ssh-keyscan.c /usr/src/debug/openssh/10.4p1/digest.h /usr/src/deb
 ug/openssh/10.4p1/ssh-keysign.c /usr/src/debug/openssh/10.4p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.4p1/serverloop.h /usr/src/debug/openssh/10.4p1/kexgexc.c /usr/src/debug/openssh/10.4p1/serverloop.c /usr/src/debug/openssh/10.4p1/auth2-none.c /usr/src/debug/openssh/10.4p1/platform-listen.c /usr/src/debug/openssh/10.4p1/ssh-mldsa-eddsa.c /usr/src/debug/openssh/10.4p1/ttymodes.c /usr/src/debug/openssh/10.4p1/auth-shadow.c /usr/src/debug/openssh/10.4p1/cipher.c /usr/src/debug/openssh/10.4p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.4p1/ttymodes.h /usr/src/debug/openssh/10.4p1/canohost.h /usr/src/debug/openssh/10.4p1/progressmeter.h /usr/src/debug/openssh/10.4p1/canohost.c /usr/src/debug/openssh/10.4p1/cipher.h /usr/src/debug/openssh/10.4p1/progressmeter.c /usr/src/debug/openssh/10.4p1/sftp-usergroup.h /usr/src/debug/openssh/10.4p1/groupaccess.h /usr/src/debug/openssh/10.4p1/umac.c /usr/src/debug/openssh/10.4p1/hmac.c /usr/src/debug/openssh/10.4p1/auth2.c /usr/src/debug/
 openssh/10.4p1/auth2-pubkey.c /usr/src/debug/openssh/10.4p1/ssh-keygen.c /usr/src/debug/openssh/10.4p1/umac.h /usr/src/debug/openssh/10.4p1/ssh-pkcs11.c /usr/src/debug/openssh/10.4p1/sshconnect.c /usr/src/debug/openssh/10.4p1/sftp-usergroup.c /usr/src/debug/openssh/10.4p1/sshpty.c /usr/src/debug/openssh/10.4p1/sshconnect.h /usr/src/debug/openssh/10.4p1/sshpty.h", added "/usr/src/debug/openssh/10.5p1/krl.c /usr/src/debug/openssh/10.5p1/ssh-pkcs11.h /usr/src/debug/openssh/10.5p1/krl.h /usr/src/debug/openssh/10.5p1/ssherr-nolibcrypto.c /usr/src/debug/openssh/10.5p1/ssh_api.c /usr/src/debug/openssh/10.5p1/ssh-pkcs11-helper.c /usr/src/debug/openssh/10.5p1/auth-rhosts.c /usr/src/debug/openssh/10.5p1/sshd.c /usr/src/debug/openssh/10.5p1/ssh_api.h /usr/src/debug/openssh/10.5p1/readconf.c /usr/src/debug/openssh/10.5p1/uidswap.h /usr/src/debug/openssh/10.5p1/readconf.h /usr/src/debug/openssh/10.5p1/cipher-chachapoly.h /usr/src/debug/openssh/10.5p1/uidswap.c /usr/src/debug/openssh/10.5p1/bitma
 p.h /usr/src/debug/openssh/10.5p1/bitmap.c /usr/src/debug/openssh/10.5p1/hostfile.c /usr/src/debug/openssh/10.5p1/dns.c /usr/src/debug/openssh/10.5p1/compat.h /usr/src/debug/openssh/10.5p1/dns.h /usr/src/debug/openssh/10.5p1/ssh-add.c /usr/src/debug/openssh/10.5p1/hostfile.h /usr/src/debug/openssh/10.5p1/compat.c /usr/src/debug/openssh/10.5p1/misc.h /usr/src/debug/openssh/10.5p1/groupaccess.c /usr/src/debug/openssh/10.5p1/misc.c /usr/src/debug/openssh/10.5p1/sftp-common.h /usr/src/debug/openssh/10.5p1/rijndael.h /usr/src/debug/openssh/10.5p1/cleanup.c /usr/src/debug/openssh/10.5p1/srclimit.c /usr/src/debug/openssh/10.5p1/sftp-common.c /usr/src/debug/openssh/10.5p1/srclimit.h /usr/src/debug/openssh/10.5p1/clientloop.c /usr/src/debug/openssh/10.5p1/auth2-kbdint.c /usr/src/debug/openssh/10.5p1/ssh-agent.c /usr/src/debug/openssh/10.5p1/ssh-ecdsa.c /usr/src/debug/openssh/10.5p1/msg.c /usr/src/debug/openssh/10.5p1/ssherr.h /usr/src/debug/openssh/10.5p1/log.c /usr/src/debug/openssh/10.5p1/
 hmac.h /usr/src/debug/openssh/10.5p1/clientloop.h /usr/src/debug/openssh/10.5p1/msg.h /usr/src/debug/openssh/10.5p1/ssherr.c /usr/src/debug/openssh/10.5p1/log.h /usr/src/debug/openssh/10.5p1/auth.h /usr/src/debug/openssh/10.5p1/auth2-methods.c /usr/src/debug/openssh/10.5p1/xmalloc.h /usr/src/debug/openssh/10.5p1/sftp-server-main.c /usr/src/debug/openssh/10.5p1/auth.c /usr/src/debug/openssh/10.5p1/xmalloc.c /usr/src/debug/openssh/10.5p1/moduli.c /usr/src/debug/openssh/10.5p1/ed25519-openssl.c /usr/src/debug/openssh/10.5p1/cipher-aesctr.h /usr/src/debug/openssh/10.5p1/platform-tracing.c /usr/src/debug/openssh/10.5p1/entropy.h /usr/src/debug/openssh/10.5p1/match.c /usr/src/debug/openssh/10.5p1/digest-openssl.c /usr/src/debug/openssh/10.5p1/platform-misc.c /usr/src/debug/openssh/10.5p1/entropy.c /usr/src/debug/openssh/10.5p1/match.h /usr/src/debug/openssh/10.5p1/dh.h /usr/src/debug/openssh/10.5p1/sftp-realpath.c /usr/src/debug/openssh/10.5p1/kexgen.c /usr/src/debug/openssh/10.5p1/sshbuf
 -misc.c /usr/src/debug/openssh/10.5p1/dh.c /usr/src/debug/openssh/10.5p1/cipher-chachapoly-libcrypto.c /usr/src/debug/openssh/10.5p1/monitor.h /usr/src/debug/openssh/10.5p1/ssh-sk-client.c /usr/src/debug/openssh/10.5p1/ssherr-libcrypto.c /usr/src/debug/openssh/10.5p1/monitor.c /usr/src/debug/openssh/10.5p1/ssh-sk-helper.c /usr/src/debug/openssh/10.5p1/ssh-ed25519.c /usr/src/debug/openssh/10.5p1/monitor_fdpass.c /usr/src/debug/openssh/10.5p1/auth-options.c /usr/src/debug/openssh/10.5p1/monitor_wrap.c /usr/src/debug/openssh/10.5p1/sftp.c /usr/src/debug/openssh/10.5p1/servconf.h /usr/src/debug/openssh/10.5p1/libcrux_internal.h /usr/src/debug/openssh/10.5p1/auth-options.h /usr/src/debug/openssh/10.5p1/monitor_wrap.h /usr/src/debug/openssh/10.5p1/monitor_fdpass.h /usr/src/debug/openssh/10.5p1/sftp.h /usr/src/debug/openssh/10.5p1/servconf.c /usr/src/debug/openssh/10.5p1/auth2-passwd.c /usr/src/debug/openssh/10.5p1/sshlogin.h /usr/src/debug/openssh/10.5p1/sshlogin.c /usr/src/debug/openssh/
 10.5p1/pkcs11.h /usr/src/debug/openssh/10.5p1/sshconnect2.c /usr/src/debug/openssh/10.5p1/libcrux-mlkem-mldsa.c /usr/src/debug/openssh/10.5p1/ssh-sandbox.h /usr/src/debug/openssh/10.5p1/ssh.c /usr/src/debug/openssh/10.5p1/nchan.c /usr/src/debug/openssh/10.5p1/addr.c /usr/src/debug/openssh/10.5p1/auth2-hostbased.c /usr/src/debug/openssh/10.5p1/platform.c /usr/src/debug/openssh/10.5p1/utf8.c /usr/src/debug/openssh/10.5p1/addr.h /usr/src/debug/openssh/10.5p1/platform.h /usr/src/debug/openssh/10.5p1/utf8.h /usr/src/debug/openssh/10.5p1/ssh-sk.h /usr/src/debug/openssh/10.5p1/sshkey.h /usr/src/debug/openssh/10.5p1/packet.h /usr/src/debug/openssh/10.5p1/ssh-pkcs11-client.c /usr/src/debug/openssh/10.5p1/kexgex.c /usr/src/debug/openssh/10.5p1/sshkey.c /usr/src/debug/openssh/10.5p1/kexecdh.c /usr/src/debug/openssh/10.5p1/packet.c /usr/src/debug/openssh/10.5p1/channels.c /usr/src/debug/openssh/10.5p1/atomicio.c /usr/src/debug/openssh/10.5p1/authfile.h /usr/src/debug/openssh/10.5p1/kex.h /usr/s
 rc/debug/openssh/10.5p1/atomicio.h /usr/src/debug/openssh/10.5p1/channels.h /usr/src/debug/openssh/10.5p1/auth2-pubkeyfile.c /usr/src/debug/openssh/10.5p1/kex.c /usr/src/debug/openssh/10.5p1/authfile.c /usr/src/debug/openssh/10.5p1/mux.c /usr/src/debug/openssh/10.5p1/loginrec.h /usr/src/debug/openssh/10.5p1/sandbox-seccomp-filter.c /usr/src/debug/openssh/10.5p1/sftp-client.c /usr/src/debug/openssh/10.5p1/dispatch.h /usr/src/debug/openssh/10.5p1/misc-agent.c /usr/src/debug/openssh/10.5p1/loginrec.c /usr/src/debug/openssh/10.5p1/dispatch.c /usr/src/debug/openssh/10.5p1/sftp-client.h /usr/src/debug/openssh/10.5p1/session.c /usr/src/debug/openssh/10.5p1/sshtty.c /usr/src/debug/openssh/10.5p1/readpass.c /usr/src/debug/openssh/10.5p1/smult_curve25519_ref.c /usr/src/debug/openssh/10.5p1/session.h /usr/src/debug/openssh/10.5p1/sshbuf-getput-basic.c /usr/src/debug/openssh/10.5p1/kexdh.c /usr/src/debug/openssh/10.5p1/sshbuf-io.c /usr/src/debug/openssh/10.5p1/auth-pam.h /usr/src/debug/openssh/
 10.5p1/sshd-auth.c /usr/src/debug/openssh/10.5p1/poly1305.c /usr/src/debug/openssh/10.5p1/sshsig.c /usr/src/debug/openssh/10.5p1/poly1305.h /usr/src/debug/openssh/10.5p1/sshsig.h /usr/src/debug/openssh/10.5p1/auth-pam.c /usr/src/debug/openssh/10.5p1/kexgexs.c /usr/src/debug/openssh/10.5p1/sftp-server.c /usr/src/debug/openssh/10.5p1/kex-names.c /usr/src/debug/openssh/10.5p1/kexc25519.c /usr/src/debug/openssh/10.5p1/authfd.h /usr/src/debug/openssh/10.5p1/kexmlkem768x25519.c /usr/src/debug/openssh/10.5p1/platform-pledge.c /usr/src/debug/openssh/10.5p1/fatal.c /usr/src/debug/openssh/10.5p1/authfd.c /usr/src/debug/openssh/10.5p1/ssh-rsa.c /usr/src/debug/openssh/10.5p1/sshbuf.c /usr/src/debug/openssh/10.5p1/mac.c /usr/src/debug/openssh/10.5p1/scp.c /usr/src/debug/openssh/10.5p1/auth2-chall.c /usr/src/debug/openssh/10.5p1/mac.h /usr/src/debug/openssh/10.5p1/sshbuf.h /usr/src/debug/openssh/10.5p1/sshd-session.c /usr/src/debug/openssh/10.5p1/addrmatch.c /usr/src/debug/openssh/10.5p1/kexmlkem
 768ecdh.c /usr/src/debug/openssh/10.5p1/crypto_api.h /usr/src/debug/openssh/10.5p1/sftp-glob.c /usr/src/debug/openssh/10.5p1/sntrup761.c /usr/src/debug/openssh/10.5p1/auth-passwd.c /usr/src/debug/openssh/10.5p1/ssh-keyscan.c /usr/src/debug/openssh/10.5p1/digest.h /usr/src/debug/openssh/10.5p1/ssh-keysign.c /usr/src/debug/openssh/10.5p1/sshbuf-getput-crypto.c /usr/src/debug/openssh/10.5p1/serverloop.h /usr/src/debug/openssh/10.5p1/kexgexc.c /usr/src/debug/openssh/10.5p1/serverloop.c /usr/src/debug/openssh/10.5p1/auth2-none.c /usr/src/debug/openssh/10.5p1/platform-listen.c /usr/src/debug/openssh/10.5p1/ssh-mldsa-eddsa.c /usr/src/debug/openssh/10.5p1/ttymodes.c /usr/src/debug/openssh/10.5p1/auth-shadow.c /usr/src/debug/openssh/10.5p1/cipher.c /usr/src/debug/openssh/10.5p1/kexsntrup761x25519.c /usr/src/debug/openssh/10.5p1/ttymodes.h /usr/src/debug/openssh/10.5p1/canohost.h /usr/src/debug/openssh/10.5p1/progressmeter.h /usr/src/debug/openssh/10.5p1/canohost.c /usr/src/debug/openssh/10.5
 p1/cipher.h /usr/src/debug/openssh/10.5p1/progressmeter.c /usr/src/debug/openssh/10.5p1/sftp-usergroup.h /usr/src/debug/openssh/10.5p1/groupaccess.h /usr/src/debug/openssh/10.5p1/umac.c /usr/src/debug/openssh/10.5p1/hmac.c /usr/src/debug/openssh/10.5p1/auth2.c /usr/src/debug/openssh/10.5p1/auth2-pubkey.c /usr/src/debug/openssh/10.5p1/ssh-keygen.c /usr/src/debug/openssh/10.5p1/umac.h /usr/src/debug/openssh/10.5p1/ssh-pkcs11.c /usr/src/debug/openssh/10.5p1/sshconnect.c /usr/src/debug/openssh/10.5p1/sftp-usergroup.c /usr/src/debug/openssh/10.5p1/sshpty.c /usr/src/debug/openssh/10.5p1/sshconnect.h /usr/src/debug/openssh/10.5p1/sshpty.h"
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-src: PKGSIZE changed from 4692018 to 4703712 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-ssh: PKGSIZE changed from 1016025 to 1020121 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 3486104 to 3494296 (+0%)
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh-staticdev: PKGV changed from 10.4p1 [default] to 10.5p1 [default]
packages/x86-64-v3-poky-linux/openssh/openssh: PV changed from "10.4p1" to "10.5p1"
packages/x86-64-v3-poky-linux/openssh/openssh: PKGV changed from 10.4p1 [default] to 10.5p1 [default]

--===============4093934059285350589==--

