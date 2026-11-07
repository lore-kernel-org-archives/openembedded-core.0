Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4630.1794032731697870095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 22:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DZnIAifJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Uk9Kuv7z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1b4af025b-c783e036-e85b-445d-8726-e0639cc77b6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794032730;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=lUbpdLDAhz4NZk3xFOHQPZgSouVWrtUNo1IpOmHFF9s=;
	b=DZnIAifJaXPgHTU/6DENuq87myvzENj5kVwQVZjyDRvbLwWnRcI20TWvcaGgdauB
	DB1zNIbUQRMzbZX99gQLcHvZ6PJ4uvWvERXV0cCcLSaKH/qohjr2nfr1AnWCprEUoAX
	avHKOHROK7SdZOtmyWcEzoWvmnG7eJwfSbsVK6/c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794032730;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=lUbpdLDAhz4NZk3xFOHQPZgSouVWrtUNo1IpOmHFF9s=;
	b=Uk9Kuv7zI+tKAMNCxxuE5KSLdRWtbgYR6vEtIrnmHogafv9ccH7g9/G3bRvdt+eK
	R+opZxVl4/4CNcxbqt7TMY0cggKszolsA5kRTb48TwK8MdI1BU4rwE7NUDYsJ1P+TI3
	A5cIKM8W54U6GSDMg3CcjhMrCAO3pRZsWdEnERJw=
Content-Type: multipart/mixed; boundary="===============3841597446463757775=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodulemd: upgrading to 2.15.4 SUCCEEDED
Message-ID: <010101a1b4af025b-c783e036-e85b-445d-8726-e0639cc77b6a-000000@us-west-2.amazonses.com>
Date: Sat, 7 Nov 2026 06:25:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.07-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 06:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249725

--===============3841597446463757775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libmodulemd* to *2.15.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.15.3-2.15.4.patch
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
From c70950dedf2f33c14778e314fcc71910f00c5fc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 7 Nov 2026 05:29:19 +0000
Subject: [PATCH] libmodulemd: upgrade 2.15.3 -> 2.15.4

2.15.4      2026-11-06

Possibly incompatible fixes:
- Compressed YAML files which decompress to much are rejected
  (CVE-2026-92823). If libmodulemd is built with "rpmio" feature,
  modulemd_module_index_update_from_file() decompresses compressed input
  files. Small compressed files can decompress to very large data. Then
  processing the large data consumes unexpectedly large amount of memory. This
  amplification of use of resources can be interpreted as a denial of service.
  To avoid it, a limit for decompressed data was imposed. The limit is
  a maximum of 64 MiB and 64 times the compressed size of the input file. When
  the limit is reached, a Glib warning is emitted and
  modulemd_module_index_update_from_file() returns FALSE. This flaw was added
  with aad63a59ca02be2cc7afb6e6c8a0c3bd5a036dd6 commit ("Add helpers for
  reading compressed files") and first released in 2.8.0 version.

- Introduce a recursion limit for YAML documents (CVE-2026-92822). Parsing
  a modulemd document with "xmd" YAML tree with enormously nested nodes may
  exhaust all heap or stack memory when duplicating subdocuments in
  modulemd_yaml_parse_document_type_internal(). This is fixed by adding
  a "recursion_limit" build-time option defining a maximal depth of acceptable
  YAML documents. Default is 64. This flaw was confirmed in current 2.15.3
  version and back to 1.4.0 version. Earlier versions might be affected as well.

Other fixes:
- Iterating over checksums in modulemd_module_stream_v2_emit_rpm_map() was
  fixed (CVE-2026-92824). When serializing a module index into a YAML string
  where a number of hash types was different from a number of hashes of
  a particular type in "rpm-map" modulemd-v2 YAML element, not all hashes were
  serialized or an invalid memory was read. This flaw was introduced with
  b5abf3bbedd211a403122fccfec192581e2bbe8f commit ("Add rpm-map to
  ModuleStreamV2") and first released in 2.2.0 version.
- Harden modulemd_module_add_translation() against null-pointer dereferences.
- Harden modulemd_module_add_obsoletes() against null-pointer dereferences.
---
 .../{libmodulemd_2.15.3.bb => libmodulemd_2.15.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libmodulemd/{libmodulemd_2.15.3.bb => libmodulemd_2.15.4.bb} (94%)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.4.bb
similarity index 94%
rename from meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
rename to meta/recipes-devtools/libmodulemd/libmodulemd_2.15.4.bb
index 4627e53428..52558707b5 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.3.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_2.15.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=${PV}"
 
-SRCREV = "a8f1c5b1243a8e844a276094007a2bbf8a13b40f"
+SRCREV = "2f75d47da15a4e4847c3deeb3101b58ad67a0723"
 
 inherit meson gobject-introspection pkgconfig manpages
 
-- 
2.47.1


--===============3841597446463757775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libmodulemd: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd: SRC_URI changed from "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=2.15.3" to "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main;tag=2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1839616 to 1843920 (+0%)
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/.debug/libmodulemd.so.2.15.3", added "/usr/lib/.debug/libmodulemd.so.2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-dev: PKGSIZE changed from 996849 to 997717 (+0%)
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 1225411 to 1231131 (+0%)
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-src: FILELIST: directory renamed /usr/src/debug/libmodulemd/2.15.3/modulemd/include/modulemd-2.0 -> /usr/src/debug/libmodulemd/2.15.4/modulemd/include/modulemd-2.0, directory renamed /usr/src/debug/libmodulemd/2.15.3/modulemd -> /usr/src/debug/libmodulemd/2.15.4/modulemd, directory renamed /usr/src/debug/libmodulemd/2.15.3/modulemd/include/private -> /usr/src/debug/libmodulemd/2.15.4/modulemd/include/private
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.15.3 [default] to 2.15.4 [default]
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: PV changed from "2.15.3" to "2.15.4"
packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.15.3", added "/usr/lib/libmodulemd.so.2.15.4"
Changes to packages/x86-64-v3-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.15.3 to libmodulemd.so.2.15.4
  /usr/lib/libmodulemd.so.2.15.3 moved to /usr/lib/libmodulemd.so.2.15.4

--===============3841597446463757775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libmodulemd-changelog.txt"

2.15.4      2026-11-06

Possibly incompatible fixes:
- Compressed YAML files which decompress to much are rejected
  (CVE-2026-92823). If libmodulemd is built with "rpmio" feature,
  modulemd_module_index_update_from_file() decompresses compressed input
  files. Small compressed files can decompress to very large data. Then
  processing the large data consumes unexpectedly large amount of memory. This
  amplification of use of resources can be interpreted as a denial of service.
  To avoid it, a limit for decompressed data was imposed. The limit is
  a maximum of 64 MiB and 64 times the compressed size of the input file. When
  the limit is reached, a Glib warning is emitted and
  modulemd_module_index_update_from_file() returns FALSE. This flaw was added
  with aad63a59ca02be2cc7afb6e6c8a0c3bd5a036dd6 commit ("Add helpers for
  reading compressed files") and first released in 2.8.0 version.

- Introduce a recursion limit for YAML documents (CVE-2026-92822). Parsing
  a modulemd document with "xmd" YAML tree with enormously nested nodes may
  exhaust all heap or stack memory when duplicating subdocuments in
  modulemd_yaml_parse_document_type_internal(). This is fixed by adding
  a "recursion_limit" build-time option defining a maximal depth of acceptable
  YAML documents. Default is 64. This flaw was confirmed in current 2.15.3
  version and back to 1.4.0 version. Earlier versions might be affected as well.

Other fixes:
- Iterating over checksums in modulemd_module_stream_v2_emit_rpm_map() was
  fixed (CVE-2026-92824). When serializing a module index into a YAML string
  where a number of hash types was different from a number of hashes of
  a particular type in "rpm-map" modulemd-v2 YAML element, not all hashes were
  serialized or an invalid memory was read. This flaw was introduced with
  b5abf3bbedd211a403122fccfec192581e2bbe8f commit ("Add rpm-map to
  ModuleStreamV2") and first released in 2.2.0 version.
- Harden modulemd_module_add_translation() against null-pointer dereferences.
- Harden modulemd_module_add_obsoletes() against null-pointer dereferences.

--===============3841597446463757775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.15.3", added "/usr/lib/libmodulemd.so.2.15.4"
Changes to packages/x86-64-v3-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.15.3 to libmodulemd.so.2.15.4
  /usr/lib/libmodulemd.so.2.15.3 moved to /usr/lib/libmodulemd.so.2.15.4

--===============3841597446463757775==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.15.3-2.15.4.patch"

RnJvbSBjNzA5NTBkZWRmMmYzM2MxNDc3OGUzMTRmY2M3MTkxMGYwMGM1ZmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNyBOb3YgMjAyNiAwNToyOToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym1vZHVsZW1kOiB1cGdyYWRlIDIuMTUuMyAtPiAyLjE1LjQKCjIuMTUuNCAgICAgIDIwMjYtMTEt
MDYKClBvc3NpYmx5IGluY29tcGF0aWJsZSBmaXhlczoKLSBDb21wcmVzc2VkIFlBTUwgZmlsZXMg
d2hpY2ggZGVjb21wcmVzcyB0byBtdWNoIGFyZSByZWplY3RlZAogIChDVkUtMjAyNi05MjgyMyku
IElmIGxpYm1vZHVsZW1kIGlzIGJ1aWx0IHdpdGggInJwbWlvIiBmZWF0dXJlLAogIG1vZHVsZW1k
X21vZHVsZV9pbmRleF91cGRhdGVfZnJvbV9maWxlKCkgZGVjb21wcmVzc2VzIGNvbXByZXNzZWQg
aW5wdXQKICBmaWxlcy4gU21hbGwgY29tcHJlc3NlZCBmaWxlcyBjYW4gZGVjb21wcmVzcyB0byB2
ZXJ5IGxhcmdlIGRhdGEuIFRoZW4KICBwcm9jZXNzaW5nIHRoZSBsYXJnZSBkYXRhIGNvbnN1bWVz
IHVuZXhwZWN0ZWRseSBsYXJnZSBhbW91bnQgb2YgbWVtb3J5LiBUaGlzCiAgYW1wbGlmaWNhdGlv
biBvZiB1c2Ugb2YgcmVzb3VyY2VzIGNhbiBiZSBpbnRlcnByZXRlZCBhcyBhIGRlbmlhbCBvZiBz
ZXJ2aWNlLgogIFRvIGF2b2lkIGl0LCBhIGxpbWl0IGZvciBkZWNvbXByZXNzZWQgZGF0YSB3YXMg
aW1wb3NlZC4gVGhlIGxpbWl0IGlzCiAgYSBtYXhpbXVtIG9mIDY0IE1pQiBhbmQgNjQgdGltZXMg
dGhlIGNvbXByZXNzZWQgc2l6ZSBvZiB0aGUgaW5wdXQgZmlsZS4gV2hlbgogIHRoZSBsaW1pdCBp
cyByZWFjaGVkLCBhIEdsaWIgd2FybmluZyBpcyBlbWl0dGVkIGFuZAogIG1vZHVsZW1kX21vZHVs
ZV9pbmRleF91cGRhdGVfZnJvbV9maWxlKCkgcmV0dXJucyBGQUxTRS4gVGhpcyBmbGF3IHdhcyBh
ZGRlZAogIHdpdGggYWFkNjNhNTljYTAyYmUyY2M3YWZiNmU2YzhhMGMzYmQ1YTAzNmRkNiBjb21t
aXQgKCJBZGQgaGVscGVycyBmb3IKICByZWFkaW5nIGNvbXByZXNzZWQgZmlsZXMiKSBhbmQgZmly
c3QgcmVsZWFzZWQgaW4gMi44LjAgdmVyc2lvbi4KCi0gSW50cm9kdWNlIGEgcmVjdXJzaW9uIGxp
bWl0IGZvciBZQU1MIGRvY3VtZW50cyAoQ1ZFLTIwMjYtOTI4MjIpLiBQYXJzaW5nCiAgYSBtb2R1
bGVtZCBkb2N1bWVudCB3aXRoICJ4bWQiIFlBTUwgdHJlZSB3aXRoIGVub3Jtb3VzbHkgbmVzdGVk
IG5vZGVzIG1heQogIGV4aGF1c3QgYWxsIGhlYXAgb3Igc3RhY2sgbWVtb3J5IHdoZW4gZHVwbGlj
YXRpbmcgc3ViZG9jdW1lbnRzIGluCiAgbW9kdWxlbWRfeWFtbF9wYXJzZV9kb2N1bWVudF90eXBl
X2ludGVybmFsKCkuIFRoaXMgaXMgZml4ZWQgYnkgYWRkaW5nCiAgYSAicmVjdXJzaW9uX2xpbWl0
IiBidWlsZC10aW1lIG9wdGlvbiBkZWZpbmluZyBhIG1heGltYWwgZGVwdGggb2YgYWNjZXB0YWJs
ZQogIFlBTUwgZG9jdW1lbnRzLiBEZWZhdWx0IGlzIDY0LiBUaGlzIGZsYXcgd2FzIGNvbmZpcm1l
ZCBpbiBjdXJyZW50IDIuMTUuMwogIHZlcnNpb24gYW5kIGJhY2sgdG8gMS40LjAgdmVyc2lvbi4g
RWFybGllciB2ZXJzaW9ucyBtaWdodCBiZSBhZmZlY3RlZCBhcyB3ZWxsLgoKT3RoZXIgZml4ZXM6
Ci0gSXRlcmF0aW5nIG92ZXIgY2hlY2tzdW1zIGluIG1vZHVsZW1kX21vZHVsZV9zdHJlYW1fdjJf
ZW1pdF9ycG1fbWFwKCkgd2FzCiAgZml4ZWQgKENWRS0yMDI2LTkyODI0KS4gV2hlbiBzZXJpYWxp
emluZyBhIG1vZHVsZSBpbmRleCBpbnRvIGEgWUFNTCBzdHJpbmcKICB3aGVyZSBhIG51bWJlciBv
ZiBoYXNoIHR5cGVzIHdhcyBkaWZmZXJlbnQgZnJvbSBhIG51bWJlciBvZiBoYXNoZXMgb2YKICBh
IHBhcnRpY3VsYXIgdHlwZSBpbiAicnBtLW1hcCIgbW9kdWxlbWQtdjIgWUFNTCBlbGVtZW50LCBu
b3QgYWxsIGhhc2hlcyB3ZXJlCiAgc2VyaWFsaXplZCBvciBhbiBpbnZhbGlkIG1lbW9yeSB3YXMg
cmVhZC4gVGhpcyBmbGF3IHdhcyBpbnRyb2R1Y2VkIHdpdGgKICBiNWFiZjNiYmVkZDIxMWE0MDMx
MjJmY2NmZWMxOTI1ODFlMmJiZThmIGNvbW1pdCAoIkFkZCBycG0tbWFwIHRvCiAgTW9kdWxlU3Ry
ZWFtVjIiKSBhbmQgZmlyc3QgcmVsZWFzZWQgaW4gMi4yLjAgdmVyc2lvbi4KLSBIYXJkZW4gbW9k
dWxlbWRfbW9kdWxlX2FkZF90cmFuc2xhdGlvbigpIGFnYWluc3QgbnVsbC1wb2ludGVyIGRlcmVm
ZXJlbmNlcy4KLSBIYXJkZW4gbW9kdWxlbWRfbW9kdWxlX2FkZF9vYnNvbGV0ZXMoKSBhZ2FpbnN0
IG51bGwtcG9pbnRlciBkZXJlZmVyZW5jZXMuCi0tLQogLi4uL3tsaWJtb2R1bGVtZF8yLjE1LjMu
YmIgPT4gbGlibW9kdWxlbWRfMi4xNS40LmJifSAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYm1vZHVsZW1kL3tsaWJtb2R1bGVtZF8yLjE1LjMuYmIgPT4gbGlibW9kdWxl
bWRfMi4xNS40LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9s
aWJtb2R1bGVtZC9saWJtb2R1bGVtZF8yLjE1LjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGlibW9kdWxlbWQvbGlibW9kdWxlbWRfMi4xNS40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJtb2R1bGVtZC9saWJtb2R1bGVtZF8y
LjE1LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJtb2R1bGVtZC9saWJt
b2R1bGVtZF8yLjE1LjQuYmIKaW5kZXggNDYyN2U1MzQyOC4uNTI1NTg3MDdiNSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYm1vZHVsZW1kL2xpYm1vZHVsZW1kXzIuMTUuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlibW9kdWxlbWQvbGlibW9kdWxlbWRfMi4x
NS40LmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT0yNWEzOTI3YmZmM2VlNGY1YjIxYmNiMGVkM2ZjZDZiYiIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL2ZlZG9yYS1tb2R1bGFyaXR5L2xpYm1vZHVsZW1kO3Byb3RvY29sPWh0dHBz
O2JyYW5jaD1tYWluO3RhZz0ke1BWfSIKIAotU1JDUkVWID0gImE4ZjFjNWIxMjQzYThlODQ0YTI3
NjA5NDAwN2EyYmJmOGExM2I0MGYiCitTUkNSRVYgPSAiMmY3NWQ0N2RhMTVhNGU0ODQ3YzNkZWVi
MzEwMWI1OGFkNjdhMDcyMyIKIAogaW5oZXJpdCBtZXNvbiBnb2JqZWN0LWludHJvc3BlY3Rpb24g
cGtnY29uZmlnIG1hbnBhZ2VzCiAKLS0gCjIuNDcuMQoK

--===============3841597446463757775==--
