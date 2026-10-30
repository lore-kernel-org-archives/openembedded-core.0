Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7870.1793353351130815932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 02:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wsikAP+B;
 spf=pass (domain: est.tech, ip: 52.101.69.66, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lb17STV10HlFBCHj0nBpdzzxzai4FygwTsbddQdPzmlH+rc3UAzQTg5rMcuJeC0nLZpnWutGgmnMp4OmjUNWDpw1Nw99ugLEMPK6GsUpYXQcyD1MCt5ZXufWo6z/suC3AKI/CACphWrRHC/Q80P/oqUKTuFIRAYwfy9DCnu1PJmvYLuaWuaNkj1xWh7dfH9UxhveDlChTV7ddYdn7uMvWVLrpP1bNvfBOEKfkGXiJsqSYc+dZxVLjyrQDOzUruAyTeaq1idWd4TxoNxKWa//b5hpKoz/NpLfYXg+7FKB4rZxNzFPXqNmuZ5ahgjB8NyfqpiEdPCutVttQ54HXbQi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAPnQXT8bIfe/FC4pVJowli10eRpzhoCbsPgK284PO8=;
 b=ikKU0XTsm+XBXZidzgdybMHBd2vyKuOo0ef01+wKFlWHN5VBs6cfLeD/Vet455THTxroB79HOXObpS/mYt6YZ79gskWkjmb2TAN7XjwNKxl2ai/RzElv5Fo/b+j1hSwuccS7MupPuw+n4Jz/a3F9rnblv73MtbLoKhBEE3Uwy7Z1bQKKwhSSU2V2hDsxiRYbPwzhCWv0/LwxRqJlhNoyZat1XnHP0qP6jeAhZj2khT2Ezu0qXn9OWxWmGvsxJh1uTx2HkA80B9IOqxLRXTnpo+8chw/LITtfnn0cjpB+suZ7+OurpekmsDUkIQjDHIFDCPOaG7vfJ5a4DTEj4RAebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAPnQXT8bIfe/FC4pVJowli10eRpzhoCbsPgK284PO8=;
 b=wsikAP+BnaJJ3dkwsWX7VM+OIurjvIKo8ei8YrcKdf3A36qUc0cHOwO1irmA4D5m+4WEvU9xnJDJEDwm5H6iyvs9VbKetVaFmqu9yDKaGbzDF9DY2z3m/FXmDS6HqYotcq9eKVLTxlUruNZV8fHkE15w6y7fPgoH5t6VLvZScseTvQLzPCuAw+R8DgXjDGSbRtU+SB6jkTH2eXvocNpINjzBMSJd5A7kUhpYhRHb/F/krxDwZutB7HlGucwEeaHTUUL89X+xBp4E6lF85b0f5ZsN7Th31JpLlbqpakmeuAgNbx+fKkybM5K4ImIFzXJ02de1LSo/jgx81SNogA+l0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by VE1P189MB1024.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:42:26 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 09:42:26 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [blacksail][PATCH] curl: fix CVE-2026-92389
Date: Fri, 30 Oct 2026 10:42:23 +0100
Message-ID: <20261030094223.30260-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::22) To AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:305::16)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1666:EE_|VE1P189MB1024:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f733fe-1445-4fc3-66af-08df366a1b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|13003099007|56012099006|11063799006|261026135527099003|261026121527099003|261026130827099003|261026140227099003|261028144727099003|10067099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003|261022115727099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info: sze5aa10OB99/gz1bO9uHyuU3srcgRCPnIWR1cagRde1FGsE8OPHu7LesbL61Mjn1Yz3os+nTXr6rp7s7r1Migz1O0Rgx0ggo7ZLNQnCapFulI4TW1k9QkjhshrhWR5c6tlOq+mtTqyBZ4TilYtdPnaWuuv62uaGWHdBWxl8MdVZhjRQMSyXbkLkq7UHVks7wD8nexduOhySMo1dRoczenbD85ZSvD6+ptM9QoTnuWu7m2oMA8nf29x/Apzo/bVqam5QncL3SqXDmxjElSrLDXyY5NlTgrwCQPWxFU5jbPOp19Na+j1GReJNRD7DK4LeCXTL3TUcPjHi221zPfh/DAqS3R48Kt9SXm5XV5yaRFQmNgJlfIeAT/qfs4iXRDwNSXX4hcbSzIRnk+XkTw9Z5JnkK0ZMeVAXuy67ngzO6OXlcupAMijlReel5Pi5IP1+YVJR70gWk0L/j3DZru8KskSBXmNZMtzGeF65ziV3dXaP/2kn2L9QGJvW98xFYEx4+5C+pblfTkpk7LdfNj56zFS22Rks0wMSRQmn49qEPqYsIdphVoPPj4r+XcfSALA9OMZjZ5/yxnVwCbzHfQfaliAkWXugekcVYUgoZ4taDXZoCDCsDGoHViNYo3/pr/Tksg+kkaojAQWqdYzcZDJ/t4oicBOh7rnuMKPOKv/d82k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(13003099007)(56012099006)(11063799006)(261026135527099003)(261026121527099003)(261026130827099003)(261026140227099003)(261028144727099003)(10067099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003)(261022115727099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5d0Dm9N+JqLatbCLO1k/OGGyCL7S2Quy1vZzD7SGGWiByaOsmJXh5toT5KD?=
 =?us-ascii?Q?gnP7XkjXkJv6zgu7kcIzpu4yzVoLfDKVQNNqpU8hLGHVZCfQBnEzz34X/Orp?=
 =?us-ascii?Q?bw+hRyk7Lrhc/i8eNuGDTUSqvz44yZKdKxEoB9TqA+dUEiK+C7RFMNR7CuED?=
 =?us-ascii?Q?K4gk9KWcDEW7yGEvmA7noKZLKAHN9j11h1w7huEAzYTQ4LB2wsxUWxOA99Su?=
 =?us-ascii?Q?ruxE56K+OwtwaKJxab40Wzb6pAe5GRkS2XPKdf7X4/6f3iBkKBiE5YY7XEVE?=
 =?us-ascii?Q?R11ppVfaSHtmsMgl50/BmfENP2d5Fkr3TUOpkDx5UW1l00BdHbKi+bcw2TNK?=
 =?us-ascii?Q?pJCg9zCAGdMhw1B/4Kn4NrIVvVRW+ztlnTiw+r+iJs4ZyN3/OtN9Q01KdOvU?=
 =?us-ascii?Q?a79KLeraUkj9pLpkxh5/Cp9Ldg2VQbd+IrMb/OjKxKTQXHC1/Naq49YkgqY0?=
 =?us-ascii?Q?XjHM//C53G9DK2vaPYi3O9vhCKm3xYGnYxs4Qpy3AbFBYKzPt3QWRK2ReubV?=
 =?us-ascii?Q?2vEPBeo0ihFHy15+To+TkCZPCBDYmRlaBNinTJ2oWHw8k3LR+jD55wvHIpGJ?=
 =?us-ascii?Q?HDeapITtXz5pu26eRCcBSKy82k1GLlrP9MNH1MyFJ0iH4WIb7d4JhDdQ2USN?=
 =?us-ascii?Q?pDvzczoEgeGmJ7X0awTzbA2/OWqXC6O8Qjn3zWiFVwkrtjsFvaHfFwc+XdAE?=
 =?us-ascii?Q?cjviAwHIW2HeYBVMSFA3jyWz7yZB1xq2I2bOTPd0zYc7SuZ7p5vEVC6M71cL?=
 =?us-ascii?Q?GhLgghhnAW6qLB6WgJHWeuJwROW6j9wQ9UGXAe+lXrJV3m7G6/bPjpqdAUEJ?=
 =?us-ascii?Q?YS+o3/xaRhBMJnWUduLyhWYSpC7+Fru6Dgiw8ctT2N+ZV63a9rBpW87hByy6?=
 =?us-ascii?Q?AB6BPDHOQQ1G0LJT3yK+r+qBxOfhvv2+3NUfgCfV2FJNxTvHL872aR7Aw/mI?=
 =?us-ascii?Q?/QZO6Tah5nWEjOlf+e9UJf91Ge2TSilBeUOaddR3QO5OzDywts+DSBNiD+ZH?=
 =?us-ascii?Q?kDOJYXpUrZLVTqnvGRGMkmHpXiP3V3e7CxinWKh1xSOhWejIDVru4qZwRCo1?=
 =?us-ascii?Q?gIbnNanjL6+qULzuvgdp/V0x6YpAo3lQmLOfOuKxcm5AWdfRQn8890JCxLcD?=
 =?us-ascii?Q?NnAwJMN/6qUnlmuF6kB1bL/nqPdq3OAaQ9uEwbc0Scc07tyRB1JBNiUE9gBm?=
 =?us-ascii?Q?YVbP5EpuWabBEdejzGzMEtNrdqufXwFregc4Ku+1hcL6jSpeUMeBAxs/n0P9?=
 =?us-ascii?Q?UXtrOHUgPnlm/ZKZoI0cxPR75PPVm/EKoqGt714CU0BtwFNAHqOJnqTnESGY?=
 =?us-ascii?Q?CCKW+ATc+kBZa6dwgWGKf+0zUJPbK4ds/bijusFl/g0nQECRO3noJjI45uwj?=
 =?us-ascii?Q?a/1bn0yXv1oXwpb3gamGz1DBHbYD9Vx/fFKIaQSGHfxlRfGy/cXaMY++osgL?=
 =?us-ascii?Q?iZz4RfrJSiV57Y2mZ7QGC1w8W0SrLaw9f5a5dBJgADd46IE3vrm0MuF18bv3?=
 =?us-ascii?Q?a4izygw4PoJGLYbH+nVOKsVVzyr/mHAemCue0Pxonja0ssyosA/b0mNFgvss?=
 =?us-ascii?Q?Gp5QS5rhJAswC2svdnDuvBlWt1TXbyk6fwlvxgZvC9uBpv0mtWM/N6Jnuq3N?=
 =?us-ascii?Q?eoW0Pj+ZGRVl7ghsjtQgnBJv5RH+YU+ff5oOcEemZWCpSSMV1gWM0hwAfYJP?=
 =?us-ascii?Q?QmJvuhQO0v1ykdOUwtboaC6103tOpgsOsbC05pz9ELkVANKRnRHCZoozlTls?=
 =?us-ascii?Q?d3HNcoYuAEPqhaOC6iVDjdDk1TNai1s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f733fe-1445-4fc3-66af-08df366a1b16
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:42:25.9921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85iRdsLgW0bJWiP8iE9GkggmdRjOR6j8omTXxQLcBpJzJjUWdd8WYAI+L+0wB92+tzrApvY+otzD+za9QrshjU20NV0/7OFMAWWVCjX6f60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 09:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249010
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-92389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92389

Upstream fix:
  https://github.com/curl/curl/commit/63dd390fab905a239a97e270

Tested with ptest:
Before: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-92389.patch            | 53 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 0000000000..9bd685f320
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,53 @@
+From 83182969a364dac093c621990e4a140a7407e478 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 23:46:44 +0200
+Subject: [PATCH] tftp: verify direction in a few places
+
+Closes #22974
+
+CVE: CVE-2026-92389
+Upstream-Status: Backport [https://github.com/curl/curl/commit/63dd390fab9=
05a239a97e270]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/tftp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index d95da69dc3..b6d1cee601 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -366,6 +366,9 @@ static CURLcode tftp_tx(struct tftp_conn *state, tftp_=
event_t event)
+   char *bufptr;
+   bool eos;
+=20
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+=20
+   case TFTP_EVENT_ACK:
+@@ -773,10 +776,14 @@ static CURLcode tftp_send_first(struct tftp_conn *st=
ate,
+     break;
+=20
+   case TFTP_EVENT_ACK: /* Connected for transmit */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_tx(state, event);
+     break;
+=20
+   case TFTP_EVENT_DATA: /* Connected for receive */
++    if(data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_rx(state, event);
+     break;
+=20
+@@ -1077,6 +1084,8 @@ static CURLcode tftp_receive_packet(struct Curl_easy=
 *data,
+=20
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Do not pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) =3D=3D getrpacketblock(&state->rpac=
ket))) {
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-suppor=
t/curl/curl_8.22.0.bb
index 0d9596b1f3..95d5801ad5 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -16,6 +16,7 @@ SRC_URI =3D " \
     file://no-test-timeout.patch \
     file://CVE-2026-92388-1.patch \
     file://CVE-2026-92388-2.patch \
+    file://CVE-2026-92389.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
