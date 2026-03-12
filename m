Return-Path: <eduardo.barbosa@toradex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269A11067020
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:54:11 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22147.1773323646293203792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 06:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=MBUYdekZ;
 spf=pass (domain: toradex.com, ip: 194.104.109.113, mailfrom: eduardo.barbosa@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1773323644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wxR2qndKMBmwaOgmULiQyAvGy8emAUhYnx114AI4o58=;
	b=MBUYdekZfAx9WrN74pjIBbiM5rPs4VHIZWhIde5oh94nK9E8sGqh4xzRhiPgOPPeCFNJeF
	7YgAs6w54C76vY+richOny77yUBKY5IDdE5eUlpuPm3lJPGhJxt1E17hMABg2Kx3y1hjtW
	8NSGqgrSFBlN73vkW6paScrOnyc4Z24=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020140.outbound.protection.outlook.com
 [52.101.188.140]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-69-RP5JWNT0OkinvXmV3kdueQ-1; Thu, 12 Mar 2026 14:54:03 +0100
X-MC-Unique: RP5JWNT0OkinvXmV3kdueQ-1
X-Mimecast-MFC-AGG-ID: RP5JWNT0OkinvXmV3kdueQ_1773323643
Received: from GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:52::13)
 by ZR0P278MB1202.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:81::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 13:54:00 +0000
Received: from GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
 ([fe80::46ec:170a:9f40:3d07]) by GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
 ([fe80::46ec:170a:9f40:3d07%4]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 13:54:00 +0000
From: Eduardo Ferreira Barbosa <eduardo.barbosa@toradex.com>
To: Eduardo Ferreira <eduardo.f120@yahoo.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] go: Fix CVE-2025-61726.patch variable
 ordering
Thread-Topic: [OE-core][scarthgap][PATCH] go: Fix CVE-2025-61726.patch
 variable ordering
Thread-Index: AQHcr+VcAIs/MyDtkkyJrkabjiugILWq7zba
Date: Thu, 12 Mar 2026 13:54:00 +0000
Message-ID: <GV0P278MB0767EE53CCFA8EE22A5559A3E844A@GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM>
References: <20260309165351.311700-1-eduardo.f120.ref@yahoo.com>
 <20260309165351.311700-1-eduardo.f120@yahoo.com>
In-Reply-To: <20260309165351.311700-1-eduardo.f120@yahoo.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV0P278MB0767:EE_|ZR0P278MB1202:EE_
x-ms-office365-filtering-correlation-id: 5e1a922f-f315-45f7-27ae-08de803ed022
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|13003099007|8096899003|56012099003|22082099003|18002099003|7053199007|38070700021
x-microsoft-antispam-message-info: clWlMxQJ6v29TfK81noiHJLjcanzmXfOS4mLSKxFjkWLJNn89Z486AejCMixK3o9+t/ifBkM1uwwhRtb4Skbl0jO7AKTx9QY7gQ+GEiT2OQoQvvH6h7n5lgBfAPkppg+XU8oOEfKAul5DM1YdC2mX39oD1sMCmCViL5t5ILWJ/nt4Z2Tdgaxx7MtajcKiex4I6ZCGT3TQ65fNTKV00gsGpKMGvv5kaCBeUhkZAlJP5ijieKCJlnj++O9m0dkOeDplM9x7Zjxc20dC69JTgtpjDGGwI0ha3yuFHNcfJzdLTj1CDCsVKvuEX9QtGJU1V+NTSbps+Gn/FSFayCRG3j7fjeTKRknOObWrCpckTb83mTkuFuzuT9Gsx1AfEtwn+2IU9mTpiyPCy57A+xzISucc//mGizSKfD1xy5kNqBQxTJoFWuIMzABcHsK2zu/Vyy+ZLI/eqbJvso/AMw92im76d7vg1pYXJ5y+uESIN9qP8/2Sk2gP0wgeATIGqenYoEkPXe0ndrag+vL+5dyFEjqG1V7tcCgd3GG6plLJQ6bxAy8RpVeKRGDPrBIOovhyxv7EwGSuS1OffrVSAIMDA8B3fYu4p2FinAM33IDW79rSBZKo6dZX3hnVG/N17FSkI+YF26V5mPxgpvS3bqwvElh/6zQln3Vxzilo/N7T//nhj/0x0K766bBGbVWfc/C+xQeW9ISWnqWTdW4k0b0echVfmMlkxpVRBDegp3227aLAv9wRR5l21jR2k4mIfZPLs8w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(13003099007)(8096899003)(56012099003)(22082099003)(18002099003)(7053199007)(38070700021);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mEKyL5etLFv2nM4s80vNwQUUjRIoeyh5oPCDVilWF1SApv55s4WTGBwj9L7N?=
 =?us-ascii?Q?DjvCPEM5CxZJorflOyNbKBNHiqQ4YRVT4LG0KLcMk6HDMPV6LSEG0jIOduBo?=
 =?us-ascii?Q?NOPus+EjbJE5iSTX1E0OtMk/HZ4IHSsVGv0LWa4f2LrNr3ce7s0FAUr2G1Pw?=
 =?us-ascii?Q?zg0/JHeTMNwobaDroptSGWaJR8ELuW6mXXFEZQ6a91Oa3xpI3HXcpbbq53gw?=
 =?us-ascii?Q?kHel+byVYGn0+IpRIDpeja1NUbbbYoLHshil9AlWUyGveV3exYA/cfsCQ5qu?=
 =?us-ascii?Q?7FmEr4+KO7z26FqhYggmvZs3qTgyd+PZX8SUzFBjEfYrpf2amLTk7NNDB9kg?=
 =?us-ascii?Q?4w59GKPLvgujB0+eM4A7BavfoB0mPmchBTgJpPqNvd0thwKhI0PA5wdexwdO?=
 =?us-ascii?Q?PEogd6paFZgRduUWctTdnvGPUvlBvM+WyFHp3zgk5sHCUiZ48TjJwUP88Bxf?=
 =?us-ascii?Q?dKLxPnft7o78OVbwcy4owN6XcuC701OPjC576P0mrAW1I97LeWofYVH4h42T?=
 =?us-ascii?Q?X67ujWhpLiyu54HBgVjWiGTIY0tQOd6bIcGolr4kYuStjKbGULKGOcUoaRGv?=
 =?us-ascii?Q?O5dMOJi0eD3fvw+4C2Yfta2wnESPeVgLNaCtZw73QicCri64pTj9YV48oDQR?=
 =?us-ascii?Q?KubRUF2yxnqsOvwmOu2IQCYIfzb4+esKLbPyXCrswnEG1iqi846Ojzu+RLYR?=
 =?us-ascii?Q?d6bP4lHTWLZc0uw+tDw0NYonV36M4wLrq1+waiKuII/zMA39gzmvA5zE30Kq?=
 =?us-ascii?Q?e6fMnJVMzfr+R3DcQuLCTN0/1ov6YPWAKLQTmlDCM8qRtw4wGelO9KNb6hG2?=
 =?us-ascii?Q?gPS31Lrw2F3iyi2qbG4jteZ2oAdUTCrihKW2QXUEPeYesUaJLNUnU9DiwZSR?=
 =?us-ascii?Q?+c18mqWg90kTNi+I+7aljsZXBK6ddxBaJtghn5UrpF0/aZ0Su9Z2ZOTJlUPI?=
 =?us-ascii?Q?xT6nukZi8IQYZlYg9G8f7eWXsWMYpcxzAlgvVmKJFSW8sCwgeTqzpg5rvR9p?=
 =?us-ascii?Q?0xoyK6o/PKEZcWgkr4LK5jbhXjOsCVpnGyLjhBC1VZL3p1TkDo4QvrIsHM0d?=
 =?us-ascii?Q?uLmTeq/pzNsRnfqp/9JMPFR+4P1uoYBHZd7fGMGnJ2kiN4dVSFNjrTqhr4OF?=
 =?us-ascii?Q?J+r+Gx3gkCynf9mLshtNoOXC1EoC4nCJUFdnlZStKzrHBuydaZkx779/yaM3?=
 =?us-ascii?Q?psI0wC4vQ9/7BUWjFtENZ84ElTiMETL1z8LwRA7d0uDiFyqXCJ1IEypYONTh?=
 =?us-ascii?Q?n3k84CGgVxzOK9uXuWiw+efHSwxveE7i5rWsBrd69rC+2h4hp9g0IJq7UgPN?=
 =?us-ascii?Q?qJ95A5wxwh/NJkWAk/dE4RCq/THTBtSmH9ejeA0IBeeO/U6gB4UwWeKKWM3J?=
 =?us-ascii?Q?tmhA/eszPllGReVAGFnRzSePwr5zT02kyl4B8ByaRFJTyfi/FtAfArWPZ+Ku?=
 =?us-ascii?Q?kXsGKpyW1u8R4dX8KbNn9yq3o7x2kezq/ndJCndWvwxq/HbRfed1kR7W84X5?=
 =?us-ascii?Q?WHI66GJ2mjc93zi8Ernj//+e9FLfb8tMnzp2kRUHNuNOmtfz089rMo3MFfp0?=
 =?us-ascii?Q?gm0l2bvxCC1cB4UaBq9txWUcV8vcIuQo3t+19acqFuiZcsX6pjxl7hZLyi3d?=
 =?us-ascii?Q?JWSMnUg6/qPFfthv5hxk4jvtm7Oy2EDl/ws3SGX+jlsDh6QyzAYdj0eUsp29?=
 =?us-ascii?Q?bvcPT3WMv6E8PAXrqNYdjS9sTqcSYJaCR9+6kXtL+FYsLLN+ZAvFoNIVCIpp?=
 =?us-ascii?Q?3Iua44AedqGhTK7OJvNEZgtIkUpgaJjyZaKUtVv71QyMQ9gmKcM9CZGSALDz?=
x-ms-exchange-antispam-messagedata-1: aIX3mGKeP++/mg==
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: wHwViP/0tnZy0cUZh2pC5f91QA4KKVI3HL90AayyDC/8VMVzshg+YvzcENbJLBzX900pS8Ldnmj6FFYmsOBkvl4gEin+CRWsVIg9ubSIRmHNMvdNtq4O4kwJn+qF9Aov1ELDTdpGgeFmcKzWb3r+ot0qCJYV9OhIq8OQV9L9bkTkQr0In4Fr3AXfdeMV4+dbxqfBu1yJxgcXeo7Pltfv7lPuxCYQC4NtD98pjoeiY+/7ewhVmhmwd35VM+FpgWyyZHxtYG5hKqWz3xdSoG/votnFXwmJEjmiK1kjKDwoWY9YbBIYxf3QWHWV37E1w6QJM63TlqJcXo8xFONKBhHKJg==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1a922f-f315-45f7-27ae-08de803ed022
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 13:54:00.1016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qCgX0F1qlIEJPSDdF3NVbJLcnciOnYVf8CyDeWZH823gQf/RUCpfct+5BvFBKnixBzaGalzv3Ex5cQ4az7AhmYJ0MQMK2hJWBxG3pKOWzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1202
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HNG-86CFpivwnhP4CMUfJaiM6Tbmfe1rxFb7_sn80cA_1773323643
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_GV0P278MB0767EE53CCFA8EE22A5559A3E844AGV0P278MB0767CHEP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232956

--_000_GV0P278MB0767EE53CCFA8EE22A5559A3E844AGV0P278MB0767CHEP_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi, is this patch submission OK for review, or did I miss something with th=
is new version?

Thanks,
Eduardo
________________________________
From: Eduardo Ferreira <eduardo.f120@yahoo.com>
Sent: Monday, March 9, 2026 1:53 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Eduardo Ferreira Barbosa <eduardo.barbosa@toradex.com>
Subject: [OE-core][scarthgap][PATCH] go: Fix CVE-2025-61726.patch variable =
ordering

This message originated from outside your organization

From: Eduardo Ferreira <eduardo.barbosa@toradex.com>

Commit 6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)
introduced a patch backporting a fix for CVE-2025-61726, but
this patch also introduced a bug.

From Go's source code[1], they say that the 'All' table from 'godebugs'
should be populated alphabetically by Name. And 'Lookup'[2] function uses
binary search to try and find the variable.

Here's the trace:
Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docker App=
lication Container Engine.
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 11:34=
:53 http: panic serving @: godebug: Value of name not listed in godeb
ugs.All: urlmaxqueryparams
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 78 [ru=
nning]:
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*conn)=
.serve.func1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/server.=
go:1903 +0xb0
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8=
740?, 0x4000b526c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.go=
:770 +0x124
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry=
.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()<http://go.opentelemetr=
y.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry=
.io/otel/sdk@v1.19.0/trace/span.go:383<http://go.opentelemetry.io/otel/sdk@=
v1.19.0/trace/span.go:383> +0x2c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry=
.io/otel/sdk/trace.(*recordingSpan).End<http://go.opentelemetry.io/otel/sdk=
/trace.(*recordingSpan).End>(0x40011b4a80, {0x0, 0x0, 0x40
006441c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: go.opentelemetry=
.io/otel/sdk@v1.19.0/trace/span.go:421<http://go.opentelemetry.io/otel/sdk@=
v1.19.0/trace/span.go:421> +0x898
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8=
740?, 0x4000b526c0?})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.go=
:770 +0x124
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
.(*Setting).Value.func1()
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
/godebug.go:141 +0xd8
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).doS=
low(0x22?, 0x55748a9b60?)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:74 =
+0x100
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).Do(=
...)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:65
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
.(*Setting).Value(0x5575b21be0)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
/godebug.go:138 +0x50
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlParam=
sWithinMax(0x1)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go:9=
68 +0x3c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQue=
ry(0x400069a630, {0x0, 0x0})
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go:9=
85 +0xdc
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQue=
ry(...)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go:9=
58
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Reque=
st).ParseForm(0x4000bdab40)
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/request=
.go:1317 +0x33c
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/docke=
r/docker/api/server/httputils.ParseForm(0x0?)<http://github.com/docker/dock=
er/api/server/httputils.ParseForm(0x0?)>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: github.com/docke=
r/docker/api/server/httputils/httputils.go:104<http://github.com/docker/doc=
ker/api/server/httputils/httputils.go:104> +0x20

The 'Lookup' function was failing due to the wrong ordering and returning '=
nil',
which was not being checked properly and caused this issue.

The fix was to just reorder the line where 'urlmaxqueryparams' is being
added to respect the alphabetical ordering. And for that the whole CVE
patch was generated again.

This change was validated with docker-moby (original issue), where a contai=
ner
run successfully and no traces in the logs.

[1] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go=
#L20<https://github.com/golang/go/blob/master/src/internal/godebugs/table.g=
o#L20>
[2] https://github.com/golang/go/blob/master/src/internal/godebugs/table.go=
#L100<https://github.com/golang/go/blob/master/src/internal/godebugs/table.=
go#L100>

Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
---
.../go/go/CVE-2025-61726.patch | 21 ++++++++++---------
1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipe=
s-devtools/go/go/CVE-2025-61726.patch
index ab053ff55c..bdd10bc933 100644
--- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch
@@ -1,4 +1,4 @@
-From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001
+From bf06767a9ac737387eee77c7eedd67c65e853ac2 Mon Sep 17 00:00:00 2001
From: Damien Neil <dneil@google.com>
Date: Mon, 3 Nov 2025 14:28:47 -0800
Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams
@@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao <shaojunyang@google.com>
TryBot-Bypass: Michael Pratt <mpratt@google.com>
(cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+Signed-off-by: Eduardo Ferreira <eduardo.barbosa@toradex.com>
---
doc/godebug.md | 7 +++++
src/internal/godebugs/table.go | 1 +
@@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore <deeratho@cisco.com>
5 files changed, 85 insertions(+)

diff --git a/doc/godebug.md b/doc/godebug.md
-index ae4f0576b4..635597ea42 100644
+index ae4f057..635597e 100644
--- a/doc/godebug.md
+++ b/doc/godebug.md
@@ -126,6 +126,13 @@ for example,
@@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644
to concerns around VCS injection attacks. This behavior can be renabled wit=
h the
setting `allowmultiplevcs=3D1`.
diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.g=
o
-index 33dcd81fc3..4ae043053c 100644
+index 33dcd81..7178df6 100644
--- a/src/internal/godebugs/table.go
+++ b/src/internal/godebugs/table.go
-@@ -52,6 +52,7 @@ var All =3D []Info{
+@@ -51,6 +51,7 @@ var All =3D []Info{
+ {Name: "tlsmaxrsasize", Package: "crypto/tls"},
{Name: "tlsrsakex", Package: "crypto/tls", Changed: 22, Old: "1"},
{Name: "tlsunsafeekm", Package: "crypto/tls", Changed: 22, Old: "1"},
- {Name: "x509sha1", Package: "crypto/x509"},
+ {Name: "urlmaxqueryparams", Package: "net/url", Changed: 24, Old: "0"},
+ {Name: "x509sha1", Package: "crypto/x509"},
{Name: "x509usefallbackroots", Package: "crypto/x509"},
{Name: "x509usepolicies", Package: "crypto/x509"},
- {Name: "zipinsecurepath", Package: "archive/zip"},
diff --git a/src/net/url/url.go b/src/net/url/url.go
-index d2ae03232f..5219e3c130 100644
+index d2ae032..cdca468 100644
--- a/src/net/url/url.go
+++ b/src/net/url/url.go
@@ -13,6 +13,7 @@ package url
@@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644
var key string
key, query, _ =3D strings.Cut(query, "&")
diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
-index fef236e40a..b2f8bd95fc 100644
+index fef236e..b2f8bd9 100644
--- a/src/net/url/url_test.go
+++ b/src/net/url/url_test.go
@@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {
@@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644
url *URL
out string
diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
-index 517ec0e0a4..335f7873b3 100644
+index 517ec0e..88d6d8c 100644
--- a/src/runtime/metrics/doc.go
+++ b/src/runtime/metrics/doc.go
@@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered l=
exicographically.
@@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644
The number of non-default behaviors executed by the crypto/x509
package due to a non-default GODEBUG=3Dx509sha1=3D... setting.
--
-2.35.6
+2.34.1
--
2.34.1

--_000_GV0P278MB0767EE53CCFA8EE22A5559A3E844AGV0P278MB0767CHEP_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi, is this patch submission OK for review, or did I miss something with th=
is new version?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Eduardo</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Eduardo Ferreira &lt;=
eduardo.f120@yahoo.com&gt;<br>
<b>Sent:</b> Monday, March 9, 2026 1:53 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Eduardo Ferreira Barbosa &lt;eduardo.barbosa@toradex.com&gt;<br>
<b>Subject:</b> [OE-core][scarthgap][PATCH] go: Fix CVE-2025-61726.patch va=
riable ordering</font>
<div>&nbsp;</div>
</div>
<div>This message originated from outside your organization<br>
<br>
From: Eduardo Ferreira &lt;eduardo.barbosa@toradex.com&gt;<br>
<br>
Commit 6a1ae4e792 (go 1.22.12: Fix CVE-2025-61726, 2026-02-11)<br>
introduced a patch backporting a fix for CVE-2025-61726, but<br>
this patch also introduced a bug.<br>
<br>
From Go's source code[1], they say that the 'All' table from 'godebugs'<br>
should be populated alphabetically by Name. And 'Lookup'[2] function uses<b=
r>
binary search to try and find the variable.<br>
<br>
Here's the trace:<br>
Mar 06 11:33:33 toradex-smarc-imx95-12594035 systemd[1]: Started Docker App=
lication Container Engine.<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: 2026/03/06 11:34=
:53 http: panic serving @: godebug: Value of name not listed in godeb<br>
ugs.All: urlmaxqueryparams<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: goroutine 78 [ru=
nning]:<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*conn)=
.serve.func1()<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/server.=
go:1903 +0xb0<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8=
740?, 0x4000b526c0?})<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.go=
:770 +0x124<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"http:=
//go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()">
go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End.deferwrap1()</a><br=
>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"http:=
//go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:383">
go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:383</a> +0x2c<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"http:=
//go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End">
go.opentelemetry.io/otel/sdk/trace.(*recordingSpan).End</a>(0x40011b4a80, {=
0x0, 0x0, 0x40<br>
006441c0?})<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"http:=
//go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:421">
go.opentelemetry.io/otel/sdk@v1.19.0/trace/span.go:421</a> +0x898<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: panic({0x55743e8=
740?, 0x4000b526c0?})<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: runtime/panic.go=
:770 +0x124<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
.(*Setting).Value.func1()<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
/godebug.go:141 +0xd8<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).doS=
low(0x22?, 0x55748a9b60?)<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:74 =
+0x100<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync.(*Once).Do(=
...)<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: sync/once.go:65<=
br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
.(*Setting).Value(0x5575b21be0)<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: internal/godebug=
/godebug.go:138 +0x50<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.urlParam=
sWithinMax(0x1)<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go:9=
68 +0x3c<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.parseQue=
ry(0x400069a630, {0x0, 0x0})<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go:9=
85 +0xdc<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url.ParseQue=
ry(...)<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/url/url.go:9=
58<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http.(*Reque=
st).ParseForm(0x4000bdab40)<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: net/http/request=
.go:1317 +0x33c<br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"http:=
//github.com/docker/docker/api/server/httputils.ParseForm(0x0?)">
github.com/docker/docker/api/server/httputils.ParseForm(0x0?)</a><br>
Mar 06 11:34:53 toradex-smarc-imx95-12594035 dockerd[839]: <a href=3D"http:=
//github.com/docker/docker/api/server/httputils/httputils.go:104">
github.com/docker/docker/api/server/httputils/httputils.go:104</a> +0x20<br=
>
<br>
The 'Lookup' function was failing due to the wrong ordering and returning '=
nil',<br>
which was not being checked properly and caused this issue.<br>
<br>
The fix was to just reorder the line where 'urlmaxqueryparams' is being<br>
added to respect the alphabetical ordering. And for that the whole CVE<br>
patch was generated again.<br>
<br>
This change was validated with docker-moby (original issue), where a contai=
ner<br>
run successfully and no traces in the logs.<br>
<br>
[1] <a href=3D"https://github.com/golang/go/blob/master/src/internal/godebu=
gs/table.go#L20">
https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L20=
</a><br>
[2] <a href=3D"https://github.com/golang/go/blob/master/src/internal/godebu=
gs/table.go#L100">
https://github.com/golang/go/blob/master/src/internal/godebugs/table.go#L10=
0</a><br>
<br>
Signed-off-by: Eduardo Ferreira &lt;eduardo.barbosa@toradex.com&gt;<br>
---<br>
.../go/go/CVE-2025-61726.patch | 21 ++++++++++---------<br>
1 file changed, 11 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61726.patch b/meta/recipe=
s-devtools/go/go/CVE-2025-61726.patch<br>
index ab053ff55c..bdd10bc933 100644<br>
--- a/meta/recipes-devtools/go/go/CVE-2025-61726.patch<br>
+++ b/meta/recipes-devtools/go/go/CVE-2025-61726.patch<br>
@@ -1,4 +1,4 @@<br>
-From 85050ca6146f3edb50ded0a352ab9edbd635effc Mon Sep 17 00:00:00 2001<br>
+From bf06767a9ac737387eee77c7eedd67c65e853ac2 Mon Sep 17 00:00:00 2001<br>
From: Damien Neil &lt;dneil@google.com&gt;<br>
Date: Mon, 3 Nov 2025 14:28:47 -0800<br>
Subject: [PATCH] [release-branch.go1.24] net/url: add urlmaxqueryparams<br>
@@ -36,6 +36,7 @@ Reviewed-by: Junyang Shao &lt;shaojunyang@google.com&gt;<=
br>
TryBot-Bypass: Michael Pratt &lt;mpratt@google.com&gt;<br>
(cherry picked from commit 85c794ddce26a092b0ea68d0fca79028b5069d5a)<br>
Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
+Signed-off-by: Eduardo Ferreira &lt;eduardo.barbosa@toradex.com&gt;<br>
---<br>
doc/godebug.md | 7 +++++<br>
src/internal/godebugs/table.go | 1 +<br>
@@ -45,7 +46,7 @@ Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<=
br>
5 files changed, 85 insertions(+)<br>
<br>
diff --git a/doc/godebug.md b/doc/godebug.md<br>
-index ae4f0576b4..635597ea42 100644<br>
+index ae4f057..635597e 100644<br>
--- a/doc/godebug.md<br>
+++ b/doc/godebug.md<br>
@@ -126,6 +126,13 @@ for example,<br>
@@ -63,19 +64,19 @@ index ae4f0576b4..635597ea42 100644<br>
to concerns around VCS injection attacks. This behavior can be renabled wit=
h the<br>
setting `allowmultiplevcs=3D1`.<br>
diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.g=
o<br>
-index 33dcd81fc3..4ae043053c 100644<br>
+index 33dcd81..7178df6 100644<br>
--- a/src/internal/godebugs/table.go<br>
+++ b/src/internal/godebugs/table.go<br>
-@@ -52,6 +52,7 @@ var All =3D []Info{<br>
+@@ -51,6 +51,7 @@ var All =3D []Info{<br>
+ {Name: &quot;tlsmaxrsasize&quot;, Package: &quot;crypto/tls&quot;},<br>
{Name: &quot;tlsrsakex&quot;, Package: &quot;crypto/tls&quot;, Changed: 22,=
 Old: &quot;1&quot;},<br>
{Name: &quot;tlsunsafeekm&quot;, Package: &quot;crypto/tls&quot;, Changed: =
22, Old: &quot;1&quot;},<br>
- {Name: &quot;x509sha1&quot;, Package: &quot;crypto/x509&quot;},<br>
+ {Name: &quot;urlmaxqueryparams&quot;, Package: &quot;net/url&quot;, Chang=
ed: 24, Old: &quot;0&quot;},<br>
+ {Name: &quot;x509sha1&quot;, Package: &quot;crypto/x509&quot;},<br>
{Name: &quot;x509usefallbackroots&quot;, Package: &quot;crypto/x509&quot;},=
<br>
{Name: &quot;x509usepolicies&quot;, Package: &quot;crypto/x509&quot;},<br>
- {Name: &quot;zipinsecurepath&quot;, Package: &quot;archive/zip&quot;},<br=
>
diff --git a/src/net/url/url.go b/src/net/url/url.go<br>
-index d2ae03232f..5219e3c130 100644<br>
+index d2ae032..cdca468 100644<br>
--- a/src/net/url/url.go<br>
+++ b/src/net/url/url.go<br>
@@ -13,6 +13,7 @@ package url<br>
@@ -118,7 +119,7 @@ index d2ae03232f..5219e3c130 100644<br>
var key string<br>
key, query, _ =3D strings.Cut(query, &quot;&amp;&quot;)<br>
diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go<br>
-index fef236e40a..b2f8bd95fc 100644<br>
+index fef236e..b2f8bd9 100644<br>
--- a/src/net/url/url_test.go<br>
+++ b/src/net/url/url_test.go<br>
@@ -1488,6 +1488,54 @@ func TestParseQuery(t *testing.T) {<br>
@@ -177,7 +178,7 @@ index fef236e40a..b2f8bd95fc 100644<br>
url *URL<br>
out string<br>
diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go<br>
-index 517ec0e0a4..335f7873b3 100644<br>
+index 517ec0e..88d6d8c 100644<br>
--- a/src/runtime/metrics/doc.go<br>
+++ b/src/runtime/metrics/doc.go<br>
@@ -328,6 +328,11 @@ Below is the full list of supported metrics, ordered l=
exicographically.<br>
@@ -193,4 +194,4 @@ index 517ec0e0a4..335f7873b3 100644<br>
The number of non-default behaviors executed by the crypto/x509<br>
package due to a non-default GODEBUG=3Dx509sha1=3D... setting.<br>
--<br>
-2.35.6<br>
+2.34.1<br>
-- <br>
2.34.1<br>
</div>
</body>
</html>

--_000_GV0P278MB0767EE53CCFA8EE22A5559A3E844AGV0P278MB0767CHEP_--


