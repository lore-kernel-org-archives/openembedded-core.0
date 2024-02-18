Return-Path: <dave.elek.96@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4EBDC4829E
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 09:43:21 +0000 (UTC)
Subject: systemd-firstboot not triggered on read/write /etc folder
To: openembedded-core@lists.openembedded.org
From: dave.elek.96@gmail.com
X-Originating-Location: Budapest, HU (31.46.251.245)
X-Originating-Platform: Linux Firefox 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 18 Feb 2024 01:43:14 -0800
Message-ID: <vkHb.1708249394873752860.quep@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="uMWnq1wofcYSqZPxVY8w"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 09:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195823

--uMWnq1wofcYSqZPxVY8w
Content-Type: multipart/alternative; boundary="9iT6v2kSBUKWQIMbMCuB"

--9iT6v2kSBUKWQIMbMCuB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

In the systemd-systemctl there is a *systemctl* script used for some config=
uration/settings for the systemd services (e.g. enabling services).

In this script if we call the *preset_all* command, it will create an empty=
 /etc/machine-id file. This is required on read-only /etc folder, otherwise=
 the systemd will fail to boot. However on read-write /etc folder this file=
 is still created, which prevents systemd to satisfy the ConditionFirstBoot=
 condition. This is used in systemd services, for example for systemd-first=
boot, where you can configure the root password, localization, hostname, et=
c.

The preset_all command is triggered from the image.bbclass file. A quick so=
lution in my case was to add a task in my own layer, which deletes the /etc=
/machine-id file, but I think it would be great, to prevent others from the=
 headache it can cause to investigate/fix this.

I attached the patch file about my proposed solution.

Waiting for you reply soon,
David

--9iT6v2kSBUKWQIMbMCuB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!<br /><br />In the systemd-systemctl there is a <strong>systemctl</stron=
g> script used for some configuration/settings for the systemd services (e.=
g. enabling services).<br /><br />In this script if we call the <strong>pre=
set_all</strong> command, it will create an empty <em>/etc/machine-id</em> =
file. This is required on read-only <em>/etc</em> folder, otherwise the sys=
temd will fail to boot. However on read-write /etc folder this file is stil=
l created, which prevents systemd to satisfy the ConditionFirstBoot conditi=
on. This is used in systemd services, for example for systemd-firstboot, wh=
ere you can configure the root password, localization, hostname, etc.<br />=
<br />The preset_all command is triggered from the <em>image.bbclass</em> f=
ile. A quick solution in my case was to add a task in my own layer, which d=
eletes the <em>/etc/machine-id</em> file, but I think it would be great, to=
 prevent others from the headache it can cause to investigate/fix this.<br =
/><br />I attached the patch file about my proposed solution.<br /><br />Wa=
iting for you reply soon,<br />David

--9iT6v2kSBUKWQIMbMCuB--

--uMWnq1wofcYSqZPxVY8w
Content-Type: text/x-patch; name="0001-image.bbclass-add-readonly-parameter-in-systemd_pres.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-image.bbclass-add-readonly-parameter-in-systemd_pres.patch"

RnJvbSAxMzdlM2JhYjZhZDVkMjI4MTA1ZTk5MzZmMDIwYTQ5ZWFhYTRjOTQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiRWxlaywgRGF2aWQiIDxkYXZlLmVsZWsuOTZAZ21haWwuY29t
PgpEYXRlOiBTYXQsIDE3IEZlYiAyMDI0IDE4OjM5OjIwICswMTAwClN1YmplY3Q6IFtQQVRDSF0g
aW1hZ2UuYmJjbGFzczogYWRkIHJlYWRvbmx5IHBhcmFtZXRlciBpbiBzeXN0ZW1kX3ByZXNldF9h
bGwKCklmIElNQUdFX0ZFQVRVUkVTIGNvbnRhaW5zIHJlYWQtb25seS1yb290ZnMgY2FsbCB0aGUg
c3lzdGVtY3RsIHNjcmlwdAp3aXRoIC0tcmVhZG9ubHkgYXJndW1lbnQuCgpzeXN0ZW1kLXN5c3Rl
bWN0bC9zeXN0ZW1jdGw6IGNoZWNrIGZvciByZWFkb25seSBhcmd1bWVudAppZiB0aGUgc2NyaXB0
IHdhcyBjYWxsZWQgd2l0aCB0aGlzIGFyZ3VtZW50LCBpdCB3aWxsIHByZXZlbnQgY3JlYXRpbmcK
dGhlIC9ldGMvbWFjaGluZS1pZCBmaWxlIHdoZW4gZXhlY3V0aW5nIHRoZSBwcmVzZXRfYWxsIGNv
bW1hbmQKCklmIHRoZSBzeXN0ZW0gaXMgcmVhZC13cml0ZSBhbmQgdGhlIC9ldGMvbWFjaGluZS1p
ZCBmaWxlIGV4aXN0cywgdGhlCnN5c3RlbWQtZmlyc3Rib290IGlzIG5vdCB0cmlnZ2VyZWQgKENv
bmRpdGlvbkZpcnN0Qm9vdD15ZXMgY29uZGl0aW9uIGlzCm5vdCBtZXQpLiBJbiByZWFkb25seSBy
b290ZnMgdGhlIGVtcHR5IG1hY2hpbmUtaWQgZmlsZSBtdXN0IGJlIGNyZWF0ZWQsCmJlY2F1c2Ug
b2YgdGhlIHN5c3RlbWQuCgpTaWduZWQtb2ZmLWJ5OiBFbGVrLCBEYXZpZCA8ZGF2ZS5lbGVrLjk2
QGdtYWlsLmNvbT4KLS0tCiBtZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1z
eXN0ZW1jdGwvc3lzdGVtY3RsIHwgOCArKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2ltYWdl
LmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcwppbmRleCAwMDQxM2Q1NmQxLi5l
NjhjZjc4MGU2IDEwMDY0NAotLS0gYS9tZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcworKysgYi9t
ZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcwpAQCAtNjY5LDcgKzY2OSw3IEBAIHJlcHJvZHVjaWJs
ZV9maW5hbF9pbWFnZV90YXNrICgpIHsKIAogc3lzdGVtZF9wcmVzZXRfYWxsICgpIHsKICAgICBp
ZiBbIC1lICR7SU1BR0VfUk9PVEZTfSR7cm9vdF9wcmVmaXh9L2xpYi9zeXN0ZW1kL3N5c3RlbWQg
XTsgdGhlbgotCXN5c3RlbWN0bCAtLXJvb3Q9IiR7SU1BR0VfUk9PVEZTfSIgLS1wcmVzZXQtbW9k
ZT1lbmFibGUtb25seSBwcmVzZXQtYWxsCisJc3lzdGVtY3RsIC0tcm9vdD0iJHtJTUFHRV9ST09U
RlN9IiAtLXByZXNldC1tb2RlPWVuYWJsZS1vbmx5IHByZXNldC1hbGwgJHtAYmIudXRpbHMuY29u
dGFpbnMoJ0lNQUdFX0ZFQVRVUkVTJywgJ3JlYWQtb25seS1yb290ZnMnLCAnLS1yZWFkb25seScs
ICcnLCBkKX0KICAgICBmaQogfQogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0bCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC1zeXN0ZW1jdGwvc3lzdGVtY3RsCmluZGV4IDBmZDdlMjQwODUuLjA4NTBhMzc1
NzUgMTAwNzU1Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0ZW1j
dGwvc3lzdGVtY3RsCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0
ZW1jdGwvc3lzdGVtY3RsCkBAIC0yNzMsNyArMjczLDcgQEAgZGVmIGNvbGxlY3Rfc2VydmljZXMo
cm9vdCk6CiAgICAgcmV0dXJuIHNlcnZpY2VzCiAKIAotZGVmIHByZXNldF9hbGwocm9vdCk6Citk
ZWYgcHJlc2V0X2FsbChyb290LCByZWFkb25seSk6CiAgICAgcHJlc2V0cyA9IFByZXNldHMoJ3N5
c3RlbS1wcmVzZXQnLCByb290KQogICAgIHNlcnZpY2VzID0gY29sbGVjdF9zZXJ2aWNlcyhyb290
KQogCkBAIC0yOTMsNyArMjkzLDggQEAgZGVmIHByZXNldF9hbGwocm9vdCk6CiAgICAgIyBGb3Ig
dGhlIHN0YXRlbGVzcyBjb25maWd1cmF0aW9uLCB3aGVyZSAvZXRjIGlzIGdlbmVyYXRlZCBhdCBy
dW50aW1lCiAgICAgIyAoZm9yIGV4YW1wbGUgb24gYSB0bXBmcyksIHRoaXMgc2NyaXB0IHNob3Vs
ZG4ndCBydW4gYXQgYWxsIGFuZCB3ZQogICAgICMgYWxsb3cgc3lzdGVtZCB0byBjb21wbGV0ZWx5
IHBvcHVsYXRlIC9ldGMuCi0gICAgKHJvb3QgLyBTWVNDT05GRElSIC8gIm1hY2hpbmUtaWQiKS50
b3VjaCgpCisgICAgaWYgcmVhZG9ubHk6CisgICAgICAgIChyb290IC8gU1lTQ09ORkRJUiAvICJt
YWNoaW5lLWlkIikudG91Y2goKQogCiAKIGRlZiBtYWluKCk6CkBAIC0zMDgsNiArMzA5LDcgQEAg
ZGVmIG1haW4oKToKICAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCctLXByZXNldC1tb2RlJywKICAg
ICAgICAgICAgICAgICAgICAgICAgIGNob2ljZXM9WydmdWxsJywgJ2VuYWJsZS1vbmx5JywgJ2Rp
c2FibGUtb25seSddLAogICAgICAgICAgICAgICAgICAgICAgICAgZGVmYXVsdD0nZnVsbCcpCisg
ICAgcGFyc2VyLmFkZF9hcmd1bWVudCgnLS1yZWFkb25seScsIGFjdGlvbj0nc3RvcmVfdHJ1ZScp
CiAKICAgICBhcmdzID0gcGFyc2VyLnBhcnNlX2FyZ3MoKQogCkBAIC0zNDEsNyArMzQzLDcgQEAg
ZGVmIG1haW4oKToKICAgICAgICAgICAgIHN5cy5leGl0KCJUb28gbWFueSBhcmd1bWVudHMuIikK
ICAgICAgICAgaWYgYXJncy5wcmVzZXRfbW9kZSAhPSAiZW5hYmxlLW9ubHkiOgogICAgICAgICAg
ICAgc3lzLmV4aXQoIk9ubHkgZW5hYmxlLW9ubHkgaXMgc3VwcG9ydGVkIGFzIHByZXNldC1tb2Rl
LiIpCi0gICAgICAgIHByZXNldF9hbGwocm9vdCkKKyAgICAgICAgcHJlc2V0X2FsbChyb290LCBh
cmdzLnJlYWRvbmx5KQogICAgIGVsc2U6CiAgICAgICAgIHJhaXNlIFJ1bnRpbWVFcnJvcigpCiAK
LS0gCjIuMjUuMQoK

--uMWnq1wofcYSqZPxVY8w--

