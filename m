Return-Path: <Jef.Driesen@niko.eu>
X-Greylist: delayed 596 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Sep 2017 08:48:13 UTC
Received: from relay06.secure-mail.be (relay06.secure-mail.be [195.13.7.9])
	by mail.openembedded.org (Postfix) with ESMTP id 57ACD6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 08:48:12 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2B3CADdBc5Z/7lOx1RdSQYMgmZLVBCBF?=
	=?us-ascii?q?QedcJghDoIECh+FHAKEKUEWAQEBAQEBAQEBAQFqKIIzIoJDAYERARkDAQILJjA?=
	=?us-ascii?q?dCgQTCAaKJAMBqWSLQwEBAQEBBQEBAQEBARMPCQGDIYExUYswHxoVCQwggnaCM?=
	=?us-ascii?q?QWYPIhvhDyDIoNfBYs0hW6FKYVaAooRiz2BOSYFLEJMe4V1HIFndoV4gTOBEAE?=
	=?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A2B3CADdBc5Z/7lOx1RdSQYMgmZLVBCBFQedcJghDoIECh+?=
	=?us-ascii?q?FHAKEKUEWAQEBAQEBAQEBAQFqKIIzIoJDAYERARkDAQILJjAdCgQTCAaKJAMBq?=
	=?us-ascii?q?WSLQwEBAQEBBQEBAQEBARMPCQGDIYExUYswHxoVCQwggnaCMQWYPIhvhDyDIoN?=
	=?us-ascii?q?fBYs0hW6FKYVaAooRiz2BOSYFLEJMe4V1HIFndoV4gTOBEAEBAQ?=
Received: from edge.nikogroup.be ([84.199.78.185])
	by relay06.secure-mail.be with ESMTP; 29 Sep 2017 10:38:17 +0200
Received: from HUB.NIKO.LAN (172.22.10.201) by EDGE.nikogroup.be
	(192.168.22.31) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 29 Sep 2017 10:38:20 +0200
Received: from MBX.NIKO.LAN ([::1]) by HUB.NIKO.LAN ([::1]) with mapi id
	14.03.0224.002; Fri, 29 Sep 2017 10:38:16 +0200
From: <Jef.Driesen@niko.eu>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] Small improvement for the initscripts package
Thread-Index: AQHTOPkyug4RbXCTlkS3EIoEWRxT8w==
Date: Fri, 29 Sep 2017 08:38:15 +0000
Message-ID: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
Accept-Language: en-US, nl-BE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.10.222]
x-exclaimer-md-config: ea9a6d46-d5fe-4ddc-9ba9-49fab8e88ad4
MIME-Version: 1.0
Subject: [PATCH] Small improvement for the initscripts package
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
X-List-Received-Date: Fri, 29 Sep 2017 08:48:13 -0000
X-Groupsio-MsgNum: 103489
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_FAB9E48578194042BE5C63B8BE47610339682897MBXNIKOLAN_"

--_002_FAB9E48578194042BE5C63B8BE47610339682897MBXNIKOLAN_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Attached is a small patch to remove the empty initscripts-{dev,doc,dbg} pac=
kages.

For our system, we are using some custom initscripts. Because of that, some=
 files conflict with the initscripts package, and thus the initscript packa=
ge gets removed from our build. But when trying to build an sdk, somehow th=
e initscripts-dev package gets pulled in, and since that has an automatic d=
ependency on initscripts, our build fails.

I've been trying to find out why this happens, but without much success so =
far. But I did found a simple workaround: remove the initscripts-dev packag=
e completely. Since the initscripts recipe contains some shell scripts the =
initscript-dev is empty anyway.

I've fixed this locally with a bbappend, but this is probably something tha=
t can be applied upstream.

Jef
Disclaimer

This e-mail and its attachments is intended only for the person(s) or entit=
y to which it is addressed. If you receive this e-mail by mistake, please d=
elete this e-mail from your system and destroy all copies of it. It may con=
tain confidential and/or privileged information. You should not copy it or =
use it for any purpose nor disclose its contents to any person unless allow=
ed by a written document between the sender and the addressee.

--_002_FAB9E48578194042BE5C63B8BE47610339682897MBXNIKOLAN_
Content-Type: text/x-patch; name="0001-Remove-empty-packages.patch"
Content-Description: 0001-Remove-empty-packages.patch
Content-Disposition: attachment;
	filename="0001-Remove-empty-packages.patch"; size=1177;
	creation-date="Fri, 29 Sep 2017 07:25:19 GMT";
	modification-date="Fri, 29 Sep 2017 07:25:19 GMT"
Content-Transfer-Encoding: base64

RnJvbSA5MzkwNGI5N2VkMzY3OGY2YzRhNzdlNjUwNGQyZDA1ZTk2N2IwZDcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZWYgRHJpZXNlbiA8amVmLmRyaWVzZW5Abmlrby5ldT4KRGF0
ZTogRnJpLCAyOSBTZXAgMjAxNyAwOTowOTo0MyArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIFJlbW92
ZSBlbXB0eSBwYWNrYWdlcwoKQmVjYXVzZSB0aGUgaW5pdHNjcmlwdHMgcmVjaXBlIGNvbnRhaW5z
IG9ubHkgc29tZSBzaGVsbCBzY3JpcHRzLCB0aGUgc3RhbmRhcmQKcGFja2FnZXMgKGUuZy4gJHtQ
Tn0tZGJnICR7UE59LXN0YXRpY2RldiAke1BOfS1kZXYgJHtQTn0tZG9jLCBldGMpIGFyZSBhbGwK
ZW1wdHkgYW5kIGNhbiBiZSByZW1vdmVkLgoKU2lnbmVkLW9mZi1ieTogSmVmIERyaWVzZW4gPGpl
Zi5kcmllc2VuQG5pa28uZXU+Ci0tLQogbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHNjcmlwdHMvaW5p
dHNjcmlwdHNfMS4wLmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHNjcmlwdHMv
aW5pdHNjcmlwdHNfMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHNjcmlwdHMvaW5pdHNj
cmlwdHNfMS4wLmJiCmluZGV4IGY5MGRlNmUuLmNiMDU2YjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXRzY3JpcHRzXzEuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9pbml0c2NyaXB0cy9pbml0c2NyaXB0c18xLjAuYmIKQEAgLTQ2LDcgKzQ2LDcgQEAg
aW5oZXJpdCB1cGRhdGUtYWx0ZXJuYXRpdmVzCiBERVBFTkRTX2FwcGVuZCA9ICIgdXBkYXRlLXJj
LmQtbmF0aXZlIgogREVQRU5EU19hcHBlbmQgPSAiICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNU
Uk9fRkVBVFVSRVMnLCdzeXN0ZW1kJywnc3lzdGVtZC1zeXN0ZW1jdGwtbmF0aXZlJywnJyxkKX0i
CiAKLVBBQ0tBR0VTID0rICIke1BOfS1mdW5jdGlvbnMiCitQQUNLQUdFUyA9ICIke1BOfS1mdW5j
dGlvbnMgJHtQTn0iCiBSREVQRU5EU18ke1BOfSA9ICIke1BOfS1mdW5jdGlvbnMgXAogICAgICAg
ICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsJ3NlbGlu
dXgnLCdiYXNoJywnJyxkKX0gXAogCQkgIgotLSAKMi43LjQKCg==

--_002_FAB9E48578194042BE5C63B8BE47610339682897MBXNIKOLAN_--
