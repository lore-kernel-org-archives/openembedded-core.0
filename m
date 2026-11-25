Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36431.1795585767945942558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=epUEzb0M;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=z2oaWH3N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a2114076c8-c0853212-4bba-41fc-ba24-bbfb85c0b43b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gmuXEk4NEjJ8MN+/jhErcKyB7Oj1eCRS4B5MMMzIlKE=;
	b=epUEzb0MGAsyHrEWn5meSalvNOJTQBvbTO6IegkP/MUlCraqT1lyHTILAqqgX4L0
	wsNHLKtTae5w5EeQlHImNi9XavlUXplGPRH9+iL5vQs4JWLerA0t3iEINlck4zHJn6m
	N/II+SPggK+V3ByIa4TtUb+/Ju2RGPQoRlVd00+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585767;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gmuXEk4NEjJ8MN+/jhErcKyB7Oj1eCRS4B5MMMzIlKE=;
	b=z2oaWH3N7I8U/XR5apQn8yg97UnsxCs8NzYYjBP6t5OAjGhJG//iDutM85Jfc6F0
	m05BWN5w2kJ9TFvdyXWmAD4cVS3j23HkqAez4z6Wyh3Zd7b/+mf5+3csyu2Fa/6zJkZ
	VrLeVdt3NcDx96HkQ5U64pg0a/NrVWzi0/s7Bt6c=
Content-Type: multipart/mixed; boundary="===============1035362484584829101=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcap: upgrading to 1.11.1 SUCCEEDED
Message-ID: <010101a2114076c8-c0853212-4bba-41fc-ba24-bbfb85c0b43b-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251149

--===============1035362484584829101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpcap* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcap-upgrade-1.11.0-1.11.1.patch
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
From e6261894d4fe335362085e93e0d3d51b1e235cfb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:11:41 +0000
Subject: [PATCH] libpcap: upgrade 1.11.0 -> 1.11.1

Tuesday, November 24, 2026 / The Tcpdump Group
  Summary for 1.11.1 libpcap release
    Source code:
      Fix function names in two error messages.
      Have pcap_fileno() return -1 rather than PCAP_ERROR if the HANDLE
        is invalid, as the return value isn't a general error.
      Indicate no-capture and no-inject devices.
      Require libpcap [internal-only] config.h in [internal-only] pcap-int.h.
      Use more parentheses in BPF_STMT() and BPF_JUMP().
    General:
      Set all the file descriptors/HANDLEs to an invalid value in
        pcap_open_dead().
    Building and testing:
      At the build time require atexit(3) not to crash.
      Require config.h to be from the libpcap build.
      Test for <sysexits.h> instead of specific OSes.
      mkdep: Use mktemp(1) if it is available.
      mkdep: Propagate compiler errors.
      Enable out-of-tree invocation of autogen.sh.
      testprogs: Factor fcodetest out of filtertest.
      Avoid some compiler builtins in Clang < 9.0.0.
    Packet filtering:
      Fix validation of "/", "%", "<<" and ">>" 2nd operand.
      Fix a dangling register index in "proto[expr]".
      Fix a register index leak in "protochain".
      Fix the skipping of AH in "protochain".
    Haiku:
      Fix a compiler warning. (Issue #1738)
    rpcap:
      Properly check for a network error in one case. (Pull request
        #1793)
    Documentation:
      Note in pcap_fileno(3PCAP) and pcap_get_selectable_fd(3PCAP) that
        the descriptors returned by those routines must not be
        closed. (Issue #1722)
      Update a few OS-specific README files.
    Linux:
      Include sysfs rx_dropped in pcap_stat.ps_ifdrop (GH bug 1328).
    QNX:
      Fix DLT_PFSYNC definition on QNX 8.0.
    Link-layer types:
      Add LINKTYPE_ETW2/DLT_ETW2.
---
 .../libpcap/{libpcap_1.11.0.bb => libpcap_1.11.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.11.0.bb => libpcap_1.11.1.bb} (96%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.11.1.bb
similarity index 96%
rename from meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.11.1.bb
index ef1ff0fff8..2d5064df3f 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.11.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9237f5bae9dcf3a91823d9963ec43b7c0e2e3374ef2ad57d92c8cd39530f4723"
+SRC_URI[sha256sum] = "ac3b1ee6c6b3a52f77d530b4b54d08f8adcb9929c2c47ac5bfd3db70e73df6da"
 
 inherit autotools binconfig-disabled pkgconfig ptest
 
-- 
2.47.1


--===============1035362484584829101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpcap: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap: SRC_URI changed from "https://www.tcpdump.org/release/libpcap-1.11.0.tar.xz file://run-ptest" to "https://www.tcpdump.org/release/libpcap-1.11.1.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/libpcap: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PKGSIZE changed from 4473696 to 4640088 (+4%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: FILELIST: removed "/usr/lib/.debug/libpcap.so.1.11.0", added "/usr/lib/.debug/libpcap.so.1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PKGSIZE changed from 179022 to 179972 (+1%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PKGSIZE changed from 276698 to 278252 (+1%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-locale: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-ptest: PKGSIZE changed from 1960528 to 2097178 (+7%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-ptest: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-ptest: FILELIST: added "/usr/lib/libpcap/ptest/tests/filter/AH-in-AH-CVE-2026-6554.pcap /usr/lib/libpcap/ptest/tests/filter/AH-in-AH.pcap"
packages/x86-64-v3-poky-linux/libpcap/libpcap-ptest: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PKGSIZE changed from 1655777 to 1663241 (+0%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: FILELIST: directory renamed /usr/src/debug/libpcap/1.11.0 -> /usr/src/debug/libpcap/1.11.1, directory renamed /usr/src/debug/libpcap/1.11.0/pcap -> /usr/src/debug/libpcap/1.11.1/pcap, removed "/usr/src/debug/libpcap/1.11.0/testprogs/translatetest.c /usr/src/debug/libpcap/1.11.0/testprogs/filtertest.c /usr/src/debug/libpcap/1.11.0/testprogs/enumeratetest.c", added "/usr/src/debug/libpcap/1.11.1/testprogs/enumeratetest.c /usr/src/debug/libpcap/1.11.1/testprogs/test-util.c /usr/src/debug/libpcap/1.11.1/testprogs/translatetest.c /usr/src/debug/libpcap/1.11.1/testprogs/test-util.h /usr/src/debug/libpcap/1.11.1/testprogs/filtertest.c"
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PKGSIZE changed from 1836298 to 1888094 (+3%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.11.0", added "/usr/lib/libpcap.so.1.11.1"
packages/x86-64-v3-poky-linux/libpcap/libpcap: PV changed from "1.11.0" to "1.11.1"
Changes to packages/x86-64-v3-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.11.0 to libpcap.so.1.11.1
  /usr/lib/libpcap.so.1.11.0 moved to /usr/lib/libpcap.so.1.11.1

--===============1035362484584829101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpcap/libpcap-ptest: FILELIST: added "/usr/lib/libpcap/ptest/tests/filter/AH-in-AH.pcap /usr/lib/libpcap/ptest/tests/filter/AH-in-AH-CVE-2026-6554.pcap"
packages/x86-64-v3-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.11.0", added "/usr/lib/libpcap.so.1.11.1"
Changes to packages/x86-64-v3-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.11.0 to libpcap.so.1.11.1
  /usr/lib/libpcap.so.1.11.0 moved to /usr/lib/libpcap.so.1.11.1

--===============1035362484584829101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpcap-changelog.txt"

Tuesday, November 24, 2026 / The Tcpdump Group
  Summary for 1.11.1 libpcap release
    Source code:
      Fix function names in two error messages.
      Have pcap_fileno() return -1 rather than PCAP_ERROR if the HANDLE
        is invalid, as the return value isn't a general error.
      Indicate no-capture and no-inject devices.
      Require libpcap [internal-only] config.h in [internal-only] pcap-int.h.
      Use more parentheses in BPF_STMT() and BPF_JUMP().
    General:
      Set all the file descriptors/HANDLEs to an invalid value in
        pcap_open_dead().
    Building and testing:
      At the build time require atexit(3) not to crash.
      Require config.h to be from the libpcap build.
      Test for <sysexits.h> instead of specific OSes.
      mkdep: Use mktemp(1) if it is available.
      mkdep: Propagate compiler errors.
      Enable out-of-tree invocation of autogen.sh.
      testprogs: Factor fcodetest out of filtertest.
      Avoid some compiler builtins in Clang < 9.0.0.
    Packet filtering:
      Fix validation of "/", "%", "<<" and ">>" 2nd operand.
      Fix a dangling register index in "proto[expr]".
      Fix a register index leak in "protochain".
      Fix the skipping of AH in "protochain".
    Haiku:
      Fix a compiler warning. (Issue #1738)
    rpcap:
      Properly check for a network error in one case. (Pull request
        #1793)
    Documentation:
      Note in pcap_fileno(3PCAP) and pcap_get_selectable_fd(3PCAP) that
        the descriptors returned by those routines must not be
        closed. (Issue #1722)
      Update a few OS-specific README files.
    Linux:
      Include sysfs rx_dropped in pcap_stat.ps_ifdrop (GH bug 1328).
    QNX:
      Fix DLT_PFSYNC definition on QNX 8.0.
    Link-layer types:
      Add LINKTYPE_ETW2/DLT_ETW2.

--===============1035362484584829101==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcap-upgrade-1.11.0-1.11.1.patch"

RnJvbSBlNjI2MTg5NGQ0ZmUzMzUzNjIwODVlOTNlMGQzZDUxYjFlMjM1Y2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6MTE6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwY2FwOiB1cGdyYWRlIDEuMTEuMCAtPiAxLjExLjEKClR1ZXNkYXksIE5vdmVtYmVyIDI0LCAy
MDI2IC8gVGhlIFRjcGR1bXAgR3JvdXAKICBTdW1tYXJ5IGZvciAxLjExLjEgbGlicGNhcCByZWxl
YXNlCiAgICBTb3VyY2UgY29kZToKICAgICAgRml4IGZ1bmN0aW9uIG5hbWVzIGluIHR3byBlcnJv
ciBtZXNzYWdlcy4KICAgICAgSGF2ZSBwY2FwX2ZpbGVubygpIHJldHVybiAtMSByYXRoZXIgdGhh
biBQQ0FQX0VSUk9SIGlmIHRoZSBIQU5ETEUKICAgICAgICBpcyBpbnZhbGlkLCBhcyB0aGUgcmV0
dXJuIHZhbHVlIGlzbid0IGEgZ2VuZXJhbCBlcnJvci4KICAgICAgSW5kaWNhdGUgbm8tY2FwdHVy
ZSBhbmQgbm8taW5qZWN0IGRldmljZXMuCiAgICAgIFJlcXVpcmUgbGlicGNhcCBbaW50ZXJuYWwt
b25seV0gY29uZmlnLmggaW4gW2ludGVybmFsLW9ubHldIHBjYXAtaW50LmguCiAgICAgIFVzZSBt
b3JlIHBhcmVudGhlc2VzIGluIEJQRl9TVE1UKCkgYW5kIEJQRl9KVU1QKCkuCiAgICBHZW5lcmFs
OgogICAgICBTZXQgYWxsIHRoZSBmaWxlIGRlc2NyaXB0b3JzL0hBTkRMRXMgdG8gYW4gaW52YWxp
ZCB2YWx1ZSBpbgogICAgICAgIHBjYXBfb3Blbl9kZWFkKCkuCiAgICBCdWlsZGluZyBhbmQgdGVz
dGluZzoKICAgICAgQXQgdGhlIGJ1aWxkIHRpbWUgcmVxdWlyZSBhdGV4aXQoMykgbm90IHRvIGNy
YXNoLgogICAgICBSZXF1aXJlIGNvbmZpZy5oIHRvIGJlIGZyb20gdGhlIGxpYnBjYXAgYnVpbGQu
CiAgICAgIFRlc3QgZm9yIDxzeXNleGl0cy5oPiBpbnN0ZWFkIG9mIHNwZWNpZmljIE9TZXMuCiAg
ICAgIG1rZGVwOiBVc2UgbWt0ZW1wKDEpIGlmIGl0IGlzIGF2YWlsYWJsZS4KICAgICAgbWtkZXA6
IFByb3BhZ2F0ZSBjb21waWxlciBlcnJvcnMuCiAgICAgIEVuYWJsZSBvdXQtb2YtdHJlZSBpbnZv
Y2F0aW9uIG9mIGF1dG9nZW4uc2guCiAgICAgIHRlc3Rwcm9nczogRmFjdG9yIGZjb2RldGVzdCBv
dXQgb2YgZmlsdGVydGVzdC4KICAgICAgQXZvaWQgc29tZSBjb21waWxlciBidWlsdGlucyBpbiBD
bGFuZyA8IDkuMC4wLgogICAgUGFja2V0IGZpbHRlcmluZzoKICAgICAgRml4IHZhbGlkYXRpb24g
b2YgIi8iLCAiJSIsICI8PCIgYW5kICI+PiIgMm5kIG9wZXJhbmQuCiAgICAgIEZpeCBhIGRhbmds
aW5nIHJlZ2lzdGVyIGluZGV4IGluICJwcm90b1tleHByXSIuCiAgICAgIEZpeCBhIHJlZ2lzdGVy
IGluZGV4IGxlYWsgaW4gInByb3RvY2hhaW4iLgogICAgICBGaXggdGhlIHNraXBwaW5nIG9mIEFI
IGluICJwcm90b2NoYWluIi4KICAgIEhhaWt1OgogICAgICBGaXggYSBjb21waWxlciB3YXJuaW5n
LiAoSXNzdWUgIzE3MzgpCiAgICBycGNhcDoKICAgICAgUHJvcGVybHkgY2hlY2sgZm9yIGEgbmV0
d29yayBlcnJvciBpbiBvbmUgY2FzZS4gKFB1bGwgcmVxdWVzdAogICAgICAgICMxNzkzKQogICAg
RG9jdW1lbnRhdGlvbjoKICAgICAgTm90ZSBpbiBwY2FwX2ZpbGVubygzUENBUCkgYW5kIHBjYXBf
Z2V0X3NlbGVjdGFibGVfZmQoM1BDQVApIHRoYXQKICAgICAgICB0aGUgZGVzY3JpcHRvcnMgcmV0
dXJuZWQgYnkgdGhvc2Ugcm91dGluZXMgbXVzdCBub3QgYmUKICAgICAgICBjbG9zZWQuIChJc3N1
ZSAjMTcyMikKICAgICAgVXBkYXRlIGEgZmV3IE9TLXNwZWNpZmljIFJFQURNRSBmaWxlcy4KICAg
IExpbnV4OgogICAgICBJbmNsdWRlIHN5c2ZzIHJ4X2Ryb3BwZWQgaW4gcGNhcF9zdGF0LnBzX2lm
ZHJvcCAoR0ggYnVnIDEzMjgpLgogICAgUU5YOgogICAgICBGaXggRExUX1BGU1lOQyBkZWZpbml0
aW9uIG9uIFFOWCA4LjAuCiAgICBMaW5rLWxheWVyIHR5cGVzOgogICAgICBBZGQgTElOS1RZUEVf
RVRXMi9ETFRfRVRXMi4KLS0tCiAuLi4vbGlicGNhcC97bGlicGNhcF8xLjExLjAuYmIgPT4gbGli
cGNhcF8xLjExLjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2xpYnBjYXAve2xpYnBjYXBfMS4xMS4wLmJiID0+IGxpYnBjYXBfMS4xMS4xLmJifSAoOTYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwXzEu
MTEuMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwXzEuMTEu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwXzEuMTEuMS5iYgppbmRleCBlZjFmZjBmZmY4Li4y
ZDUwNjRkZjNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAv
bGlicGNhcF8xLjExLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJwY2Fw
L2xpYnBjYXBfMS4xMS4xLmJiCkBAIC0xMyw3ICsxMyw3IEBAIERFUEVORFMgPSAiZmxleC1uYXRp
dmUgYmlzb24tbmF0aXZlIgogU1JDX1VSSSA9ICJodHRwczovL3d3dy50Y3BkdW1wLm9yZy9yZWxl
YXNlLyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTIzN2Y1YmFlOWRjZjNhOTE4MjNkOTk2M2Vj
NDNiN2MwZTJlMzM3NGVmMmFkNTdkOTJjOGNkMzk1MzBmNDcyMyIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhYzNiMWVlNmM2YjNhNTJmNzdkNTMwYjRiNTRkMDhmOGFkY2I5OTI5YzJjNDdhYzViZmQz
ZGI3MGU3M2RmNmRhIgogCiBpbmhlcml0IGF1dG90b29scyBiaW5jb25maWctZGlzYWJsZWQgcGtn
Y29uZmlnIHB0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============1035362484584829101==--
