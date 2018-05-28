Return-Path: <ishitsuka.sc@ncos.nec.co.jp>
X-Greylist: delayed 818 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 May 2018 06:41:42 UTC
Received: from tyo161.gate.nec.co.jp (tyo161.gate.nec.co.jp [114.179.232.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6E03B747E3
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 06:41:42 +0000 (UTC)
Received: from mailgate01.nec.co.jp ([114.179.233.122])
	by tyo161.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id w4S6S4QB020403
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 15:28:04 +0900
Received: from mailsv02.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
	by mailgate01.nec.co.jp (8.15.1/8.15.1) with ESMTP id w4S6S4N0031125
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 15:28:04 +0900
Received: from mail01b.kamome.nec.co.jp (mail01b.kamome.nec.co.jp [10.25.43.2])
	by mailsv02.nec.co.jp (8.15.1/8.15.1) with ESMTP id w4S6QGpE016238
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 15:28:04 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.142] [10.38.151.142]) by
	mail03.kamome.nec.co.jp with ESMTP id BT-MMP-757109;
	Mon, 28 May 2018 15:27:08 +0900
Received: from BPXM17GP.gisp.nec.co.jp ([10.38.151.209]) by
	BPXC14GP.gisp.nec.co.jp ([10.38.151.142]) with mapi id 14.03.0319.002;
	Mon, 28 May 2018 15:27:08 +0900
From: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] telnetd:Fix deadlock on cleanup
Thread-Index: AdP2S72BtbjSe1hGRA+y3gxwx+00Zw==
Date: Mon, 28 May 2018 06:27:07 +0000
Message-ID: <D3AF589C68C3694A8188BC776DB93B48A2F26982@BPXM17GP.gisp.nec.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.27.178.67]
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: [PATCH] telnetd:Fix deadlock on cleanup
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
X-List-Received-Date: Mon, 28 May 2018 06:41:43 -0000
X-Groupsio-MsgNum: 111783
Content-Language: ja-JP
Content-Type: multipart/mixed;
	boundary="_002_D3AF589C68C3694A8188BC776DB93B48A2F26982BPXM17GPgispnec_"

--_002_D3AF589C68C3694A8188BC776DB93B48A2F26982BPXM17GPgispnec_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi all,

I was able to reproduce the old problems shown below with netkit-telnet_0.1=
7.bb.

https://patchwork.openembedded.org/patch/96727/
https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455

The evaluated environment is,
 glibc  :2.2=20
 kernel :4.4.32

How to reproduce:

Run the script more than once in the background, and
please adjust CPU usage to 100%.

#!/bin/sh

HOST=3D"host.target"
USER=3D"root"
PASS=3D"password"

while :
  do
  expect -c "
  set timeout 10
  spawn telnet $HOST
  expect login:\  ; send \"$USER\r\"
  expect sword:\  ; send \"$PASS\r\"
  expect \"# \" ; send \"exit\r\"
  " > /dev/null
  done


Best regards,
Seiichi Ishitsuka

--_002_D3AF589C68C3694A8188BC776DB93B48A2F26982BPXM17GPgispnec_
Content-Type: application/octet-stream;
	name="0001-telnetd-Fix-deadlock-on-cleanup.patch"
Content-Description: 0001-telnetd-Fix-deadlock-on-cleanup.patch
Content-Disposition: attachment;
	filename="0001-telnetd-Fix-deadlock-on-cleanup.patch"; size=2957;
	creation-date="Mon, 28 May 2018 06:21:04 GMT";
	modification-date="Mon, 28 May 2018 06:20:31 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjZGY4ODI5Zjc0M2FkYjNlYzcyYzIzMWVlNTg0M2RhYmVkOTFiMzBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWlpY2hpIElzaGl0c3VrYSA8aXNoaXRzdWthLnNjQG5jb3Mu
bmVjLmNvLmpwPgpEYXRlOiBUdWUsIDggTWF5IDIwMTggMDk6NTM6MzQgKzA5MDAKU3ViamVjdDog
W1BBVENIXSB0ZWxuZXRkOkZpeCBkZWFkbG9jayBvbiBjbGVhbnVwCgp0aGUgcGF0Y2ggY29tZXMg
ZnJvbToKaHR0cHM6Ly9sYXVuY2hwYWRsaWJyYXJpYW4ubmV0LzM3ODgyOTczLzAwMDEtdGVsbmV0
ZC1GaXgtZGVhZGxvY2stb24tY2xlYW51cC5wYXRjaAoKVGhlIGNsZWFudXAgZnVuY3Rpb24gaW4g
dGVsbmV0ZCBpcyBjYWxsZWQgYm90aCBkaXJlY3RseSBhbmQgb24gU0lHQ0hMRApzaWduYWxzLiBU
aGlzLCB1bmZvcnR1bmF0ZWx5LCB0cmlnZ2VyZWQgYSBkZWFkbG9jayBpbiBnbGliYyAyLjIgd2hp
bGUKcnVubmluZyBvbiBhIDQuNC4zMiBrZXJuZWwuCgpXaGF0IHdlIHdlcmUgc2VlaW5nIGlzIGhh
bmdzIGxpa2UgdGhlc2U6CgooZ2RiKSBidAogIzAgIDB4NDg5ZmVlNmMgaW4gX19sbGxfbG9ja193
YWl0X3ByaXZhdGUgKGZ1dGV4PTB4NDhhNWU5YTQgPF9fbGliY191dG1wX2xvY2s+KSBhdCAuL2xv
d2xldmVsbG9jay5jOjMzCiAjMSAgMHg0OGEyNzkzNCBpbiBfX3V0bXBuYW1lIChmaWxlPTB4NDhh
YzEyNzggIi92YXIvcnVuL3V0bXAiKSBhdCB1dG1wbmFtZS5jOjQyCiAjMiAgMHg0OGFjMGVjMCBp
biBsb2dvdXQgKGxpbmU9MHgyN2U5ZCAicHRzLzExIikgYXQgbG9nb3V0LmM6MzIKCkhvdyB0byBy
ZXByb2R1Y2U6CgpSdW4gdGhlIHNjcmlwdCBtb3JlIHRoYW4gb25jZSBpbiB0aGUgYmFja2dyb3Vu
ZC4KCiAjIS9iaW4vc2gKCiBIT1NUPSJob3N0LnRhcmdldCIKIFVTRVI9InJvb3QiCiBQQVNTPSJw
YXNzd29yZCIKCiB3aGlsZSA6CiBkbwogICBleHBlY3QgLWMgIgogICBzZXQgdGltZW91dCAxMAog
ICBzcGF3biB0ZWxuZXQgJEhPU1QKICAgZXhwZWN0IGxvZ2luOlwgIDsgc2VuZCBcIiRVU0VSXHJc
IgogICBleHBlY3Qgc3dvcmQ6XCAgOyBzZW5kIFwiJFBBU1NcclwiCiAgIGV4cGVjdCBcIiMgXCIg
OyBzZW5kIFwiZXhpdFxyXCIKICIgPiAvZGV2L251bGwKIGRvbmUKClNpZ25lZC1vZmYtYnk6IFNl
aWljaGkgSXNoaXRzdWthIDxpc2hpdHN1a2Euc2NAbmNvcy5uZWMuY28uanA+Ci0tLQogdGVsbmV0
ZC9leHQuaCAgICAgIHwgIDEgKwogdGVsbmV0ZC9zeXNfdGVybS5jIHwgMTcgKysrKysrKysrKysr
KysrKy0KIHRlbG5ldGQvdGVsbmV0ZC5jICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVsbmV0ZC9leHQuaCBi
L3RlbG5ldGQvZXh0LmgKaW5kZXggYjk4ZDZlYy4uMDhmOWQwNyAxMDA2NDQKLS0tIGEvdGVsbmV0
ZC9leHQuaAorKysgYi90ZWxuZXRkL2V4dC5oCkBAIC05Nyw2ICs5Nyw3IEBAIHZvaWQgYWRkX3Ns
YyhpbnQsIGludCwgaW50KTsKIHZvaWQgY2hlY2tfc2xjKHZvaWQpOwogdm9pZCBjaGFuZ2Vfc2xj
KGludCwgaW50LCBpbnQpOwogdm9pZCBjbGVhbnVwKGludCk7Cit2b2lkIGNsZWFudXBfc2lnaGFu
ZGxlcihpbnQpOwogdm9pZCBjbGllbnRzdGF0KGludCwgaW50LCBpbnQpOwogdm9pZCBjb3B5X3Rl
cm1idWYoY2hhciAqLCBpbnQpOwogdm9pZCBkZWZlcnNsYyh2b2lkKTsKZGlmZiAtLWdpdCBhL3Rl
bG5ldGQvc3lzX3Rlcm0uYyBiL3RlbG5ldGQvc3lzX3Rlcm0uYwppbmRleCA1YjRhYTg0Li5jNGZi
MGY3IDEwMDY0NAotLS0gYS90ZWxuZXRkL3N5c190ZXJtLmMKKysrIGIvdGVsbmV0ZC9zeXNfdGVy
bS5jCkBAIC03MTksNyArNzE5LDcgQEAgc3RhdGljIHZvaWQgYWRkYXJnKHN0cnVjdCBhcmd2X3N0
dWZmICphdnMsIGNvbnN0IGNoYXIgKnZhbCkgewogICogVGhpcyBpcyB0aGUgcm91dGluZSB0byBj
YWxsIHdoZW4gd2UgYXJlIGFsbCB0aHJvdWdoLCB0bwogICogY2xlYW4gdXAgYW55dGhpbmcgdGhh
dCBuZWVkcyB0byBiZSBjbGVhbmVkIHVwLgogICovCi12b2lkIGNsZWFudXAoaW50IHNpZykgewor
dm9pZCBjbGVhbnVwX3NpZ2hhbmRsZXIoaW50IHNpZykgewogICAgIGNoYXIgKnA7CiAgICAgKHZv
aWQpc2lnOwogCkBAIC03NDIsMyArNzQyLDE4IEBAIHZvaWQgY2xlYW51cChpbnQgc2lnKSB7CiAg
ICAgc2h1dGRvd24obmV0LCAyKTsKICAgICBleGl0KDApOwogfQorCit2b2lkIGNsZWFudXAoaW50
IHNpZykgeworICAgIHNpZ3NldF90IG1hc2ssIG9sZG1hc2s7CisKKyAgICAvKiBTZXQgdXAgdGhl
IG1hc2sgb2Ygc2lnbmFscyB0byB0ZW1wb3JhcmlseSBibG9jay4gKi8KKyAgICBzaWdlbXB0eXNl
dCAoJm1hc2spOworICAgIHNpZ2FkZHNldCAoJm1hc2ssIFNJR0NITEQpOworCisgICAgLyogQmxv
Y2sgU0lHQ0hMRCB3aGlsZSBydW5uaW5nIGNsZWFudXAgKi8KKyAgICBzaWdwcm9jbWFzayAoU0lH
X0JMT0NLLCAmbWFzaywgJm9sZG1hc2spOworCisgICAgY2xlYW51cF9zaWdoYW5kbGVyKHNpZyk7
CisgICAgLyogVGVjaG5pY2FsbHkgbm90IG5lZWRlZCBzaW5jZSBjbGVhbnVwX3NpZ2hhbmRsZXIg
ZXhpdHMgKi8KKyAgICBzaWdwcm9jbWFzayAoU0lHX1VOQkxPQ0ssICZtYXNrLCBOVUxMKTsKK30K
ZGlmZiAtLWdpdCBhL3RlbG5ldGQvdGVsbmV0ZC5jIGIvdGVsbmV0ZC90ZWxuZXRkLmMKaW5kZXgg
OWFjZTgzOC4uNzg4OTE5YyAxMDA2NDQKLS0tIGEvdGVsbmV0ZC90ZWxuZXRkLmMKKysrIGIvdGVs
bmV0ZC90ZWxuZXRkLmMKQEAgLTgzMyw3ICs4MzMsNyBAQCB2b2lkIHRlbG5ldChpbnQgZiwgaW50
IHApCiAgICAgc2lnbmFsKFNJR1RUT1UsIFNJR19JR04pOwogI2VuZGlmCiAgICAgCi0gICAgc2ln
bmFsKFNJR0NITEQsIGNsZWFudXApOworICAgIHNpZ25hbChTSUdDSExELCBjbGVhbnVwX3NpZ2hh
bmRsZXIpOwogICAgIAogI2lmZGVmIFRJT0NOT1RUWQogICAgIHsKLS0gCjIuNi40Cgo=

--_002_D3AF589C68C3694A8188BC776DB93B48A2F26982BPXM17GPgispnec_--
