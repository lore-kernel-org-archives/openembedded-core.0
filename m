Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D420FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 11:30:58 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12617.1777894250685995629
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 04:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=a51+2Pzh;
 spf=pass (domain: siemens.com, ip: 40.107.130.3, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfLEax96y/Sd+8SMWwPAhqJal+PRt476u+cfBbgTSr70FiXvY5A7h1bgg4UGggTBCtCTsHSwYBgVQFwr6DnDbPS7W1Z6fsym+8n61OBqSfKTqj2vUcs4zvZ+CaVMFzMiVtB1XddJXAFVdbXLkxzcQ1uBkJ2zRnrV8oaVe9cFpPIjMtt6IRsgDaecQbB61C8GPwgrd0fVz6rd/2pr04xJP69rWySFFxdADYwN5jgF39epuFqxnmw8KvVHULBTTJ3UpNoaK3NEguJykkMQ5B9wC81DNQkH9yiHusRupq7wDvbUosBYYhWJTAVhGiAjz02D5StztrAz+U94a9RL5oL4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtF57yhP/6IGUb7qsMpK+5+3/6pjrCMhVeMWdCi98Ww=;
 b=hY9gnGmYH1Lk31aXU7kBxOq9lnKb0AY3GUcc0NRlTq6OdJ+3ZK4FYY76tsXOZ4M6SRospnkpmwPyUYBiQ5TrjCRVCbvDfQLTG8k6GXmRjHdQmdFaNW4isDtapXN9ycIDKdFriBsYykjpJW4eMnBVAoWLxtBZAQetIV8BT4RnJ2vwGYZJBlt4iH+7RisC3t1dGOcvDxqk+xtMxvpgaCN1u74Rtz6jq9WVlkI281SUHOATX4gRepaMUJZlBV20zx8ZpBg/3xDCx7lmE7I942SYVj6tf2JxT00CwHeZ/qU6yVsC8t4KHZ4WU4Pv7+8rNfO3e3jh9vgp4DvqP/Knp+TOnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtF57yhP/6IGUb7qsMpK+5+3/6pjrCMhVeMWdCi98Ww=;
 b=a51+2Pzhhn7NDy18h7bAOIf+H1TI6z9YOUb07lBSqcN9ZuU1rzD4TOe4mEtQl+pNlLgmj4Vq3yIW/5C9Xd0dBpAOPaQrjeSCp7RGPKzUtkoxaOW6FP6muR/YQA8MWw+z2kCEYW9DW0Y8vWgGkkOyeiA8xnFhrtBmOLjnbBgR6GGNRGkxsKNt2Bxbjn5dcI35RtE2sY7AWxZay0JMq/voiF9IT7huoXARRaOFoIkjPggtXBG42edl3+0pheT5k1n5k7NJTwcjF7q3l+MqDRKq/hzMvmcIca1oSftMQacCiCCkKO/NfvmeUVU2FDtbpdNVBnU5kuAExonETkLJo+GeTA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6085.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:580::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 11:30:46 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%4]) with mapi id 15.20.9846.032; Mon, 4 May 2026
 11:30:46 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "nmjain23@gmail.com" <nmjain23@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "sana.kazi@bmwtechworks.in" <sana.kazi@bmwtechworks.in>
Subject: RE: [OE-core] [meta][scarthgap][PATCH] python3-urllib3: fix
 CVE-2025-50182
Thread-Topic: [OE-core] [meta][scarthgap][PATCH] python3-urllib3: fix
 CVE-2025-50182
Thread-Index: AQHc27h8vQpnwKlozkuud0kFWKqxl7X9unIQ
Date: Mon, 4 May 2026 11:30:46 +0000
Message-ID: 
 <AS1PR10MB56978609DAFD2170767C166EFD312@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260504112321.1912618-1-namanj1@kpit.com>
In-Reply-To: <20260504112321.1912618-1-namanj1@kpit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=000d99fc-be2d-4a92-bb8f-d687907f429a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-05-04T11:27:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6085:EE_
x-ms-office365-filtering-correlation-id: c3244b64-57ae-4421-8c8d-08dea9d0959c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099003|13003099007|55112099003;
x-microsoft-antispam-message-info: 
 Z3Weo9d/EKYGjomwh/i+30l2PZVQ0QPPrv17/57/+R2xAJ57h32FYFWTA4m+nI2qxfTRCkhL0CxzAfhhk2GvNHQ6XqVMnu7HoJ+M04hvyzTo/KzYykvX73xYYiKxioDXfOhDPxZ5Y6G/3inXlka/lowncR/RcPhVyD+O0w/p00NJsGdRsylf781ED0BQXHlgzdB8QQ5pCK4Q+0sXeeLVgfqNlRoESDe2k+9gO5fm+96zL4YtwQxaTs6jQ9+0fPDxdMiff4xUiBIjw1TmQ0wH/+v6AuxULwjslHcDf6bA1CoLwuaI3GwT7qycRis25SskS2G89tc+ZoQ4SHwEwA5BmPWZZtM9ymBp8Kp74SNdteRd+a9NFj++oS5JTkifzbxGYvCYW4ZOIH38hHFBXNB+D8v9Wf3uc6G1bfCdvr75S3dXUFKekagrALWmRd3+aQaRI4FPtbMcVH2FD5QIj1QCQ7P9jBhqmfcHPzpSAlB1P6hvT9cK/wzoHv7VFA+rSh/GnHycxjYgJq3/E4MFQkxEFyT1F+xt1cd/uM91ytXJk/h/cQHvNChQgFwq4Tjf1IUnmUFaSyaWd7V6oXxRTnT7SdvaTS/BOF2NGhCJnkDungKjicscGtNZbPbK7F1xCY0sVZS7GtEyAJgaHJ2PvYFJVyJlA7mNzqyQYQWkkDI+YWWfA31Ia9A1ymHAL3x4iqIf2di+zGXKMTpXzKQHcSlujtyu02tUkOBehhUBuAKmjr8Lnw3ZWX89bAR4jF6G9OiB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003)(13003099007)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/31WvxFCiZJFBJjcz9mClrZ+PqeDPUvAwg/MVJLpg3OhRUyEKWnT7RIHh84+?=
 =?us-ascii?Q?46KHPgNKuHe+3tcDOGFa4yyHLPVLo00/IxGLOxSWEfbVZ9wAIltfK2I4ckRA?=
 =?us-ascii?Q?kkWIFo4wT1HSP8cWXFJjz6i7PG/JAnb7xfA1OqpoYkQu0fK9A2Y0NCnoLE6o?=
 =?us-ascii?Q?9hf9deE+exEz/9ZJaVVFG0bqVH77E0RBqEP2zW2Z5vED0W3DWAzQ6ARot/ah?=
 =?us-ascii?Q?tdJ2gWtVBXZGaqWwQ/BxHrwwkfE4Zqeo4KhpYxwaIS1+ksiMGbwstsLWTRgF?=
 =?us-ascii?Q?mgWrPAq/ZmhCmA6Bp7/MpRyr/D+2DbNDMjaiO1MntKExg+yj+onk0lYQFnDj?=
 =?us-ascii?Q?Dn23cKQ3o8TgYKSVfjMpEtS099ikDY0OVrglokphpXp+Qj4+lpDWRH8EtK+5?=
 =?us-ascii?Q?LUOPcg7g7bk7tETPhh5WNPZG9tM+Mu3nG2TGlC5u7WsmbReTNyt5irS1ycEq?=
 =?us-ascii?Q?PPKBHJ/CgfQ0QBCs/FcHS63286CvWkP8N9k5X1/1BsHmzMkzUQEZRwt3qwCo?=
 =?us-ascii?Q?qYEZMxkRN+X6rQ2ufkyYItIAmXA/VKhOSrj5OJT9PCVSxjV3pxdQBi5CeIH2?=
 =?us-ascii?Q?8/lPEKXvFTGcALy4NxhbXk3bebHYKoSKAqJHi4cRJ0w6a5zaHT8R1C8Ba+YO?=
 =?us-ascii?Q?f1Sfe+WaaXta/n+Bh2i0W0udYPZKvsUDFL+T16bEeWK1cd68HqqakjADwovZ?=
 =?us-ascii?Q?h2tzlFY1SOtNfhUn9GKZN5eEG2ZWvcGKg9JkDKj4r7LmUY0r0I355KxCqVEr?=
 =?us-ascii?Q?BJZvTr9egcX5S6VLh016TinESTbDRqBokloWfN4TmdOkaVckRJczUInPXgZJ?=
 =?us-ascii?Q?U6iUB5f70FcgGJIluJiszZ0373iA/cwKypvB2w5zHQ6r5hgw3ZFGGtZEfIWZ?=
 =?us-ascii?Q?ZDSmCRvwAp69MVni3QQHj/zAHbBZUGT51HM+TqviSDZaHOOTkmC62goMaeHw?=
 =?us-ascii?Q?jmDOrVpvNNf125tRSRv92IrRpZs1obw4488T5k0pBS/ibQFj9HfgXt+3FzvB?=
 =?us-ascii?Q?9mbQhW8y/Muh1NA73yJs4+0+cJvQZBl1s5FKngoASfe1LOvtHmSftZDnss5/?=
 =?us-ascii?Q?5/xREGZvjFN1d0kks0yfe3lqZslexPBAuDTmkx9gLBu09tWKmmgTY8i4G6Eu?=
 =?us-ascii?Q?FXUjPF2M+Iq5SV23RzFqfqBj0wJyJbD4+MY4P4KYvLWxL6e3wkXIKcbeSbMZ?=
 =?us-ascii?Q?T7Mq3hNubiAUvOU6QmoY3bv00/U/viv/FLqMv1Dd2dMrettFhQXUmvnnxb08?=
 =?us-ascii?Q?A8XfoXAt4/GOUfuRFJyFvuzcEH6/l2gOQBZSgEH8CWk2eLngJ4BArvikta0n?=
 =?us-ascii?Q?jGIoNQYePLcDnUQBwjKuZhT8Hijsmh5vryQ2a2caO5elmx6CAHgeahY03V0A?=
 =?us-ascii?Q?nx7KW/Pxp/v58RBZ0F9vcJ+nJ2saVCFXLBYgwXVWk3Z3YL6y6SpY3xQmoK2p?=
 =?us-ascii?Q?dB3IocTqprBSTAkpQIvAlKV/j95q6S4aPblXQ74GiPZ+PXnYXz2CWChj8G7C?=
 =?us-ascii?Q?YU2IUUXDBwube+AJCyTr87NIv5zpD41Nw9k+2q6F56Z4CZTEaSFPB4oJbDcA?=
 =?us-ascii?Q?St7e5c5mL3B8mUQ6H+bPxI3qOcNAGMqmHHNpI8sFHIpU00qhmhUEEV7wkBPh?=
 =?us-ascii?Q?Fia+jCrfwMldFpkQc8t11C18Mc216MJNcPWBkTuSFgX+noq1ms8EUQMLYEN1?=
 =?us-ascii?Q?cGd7bTUAIy0a0ZuZJSSvI9KMtPFTrL8GJRYpEFKnYcc7J6obz4iogGGtZuci?=
 =?us-ascii?Q?QFvFghF/3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3244b64-57ae-4421-8c8d-08dea9d0959c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 11:30:46.1222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2+X3gZ3jQVkB4s/V7ur/0UE/b791MTH+RNdcLjy5Sso7frjrg5JVzXfSo1BUnDSSVFIHikgHNBqrH1ryFuMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 11:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236449

I think this is the same as was already submitted and then rejected under
https://lists.openembedded.org/g/openembedded-core/message/220031

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Naman Jain via
> lists.openembedded.org
> Sent: Monday, May 4, 2026 1:23 PM
> To: openembedded-core@lists.openembedded.org
> Cc: sana.kazi@bmwtechworks.in
> Subject: [OE-core] [meta][scarthgap][PATCH] python3-urllib3: fix CVE-2025=
-50182
>=20
> From: Yogita Urade <yogita.urade@windriver.com>
>=20
> urllib3 is a user-friendly HTTP client library for Python. Prior
> to 2.5.0, urllib3 does not control redirects in browsers and
> Node.js. urllib3 supports being used in a Pyodide runtime utilizing
> the JavaScript Fetch API or falling back on XMLHttpRequest. This
> means Python libraries can be used to make HTTP requests from a
> browser or Node.js. Additionally, urllib3 provides a mechanism to
> control redirects, but the retries and redirect parameters are
> ignored with Pyodide; the runtime itself determines redirect
> behavior. This issue has been patched in version 2.5.0.
>=20
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-50182
>=20
> Upstream patch:
> https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42=
e97
> 36194f
>=20
> (From OE-Core rev: 082b865d9814e7e7aca4466551a035199aa8b563)
>=20
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> (cherry picked from commit 0372024fe7ab2cea5eddf686f9bee0f8f07a2000)
> Signed-off-by: Sana Kazi <sana.kazi@bmwtechworks.in>
> ---
>  .../python3-urllib3/CVE-2025-50182.patch      | 112 ++++++++++++++++++
>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025=
-
> 50182.patch
>=20
> diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.=
patch
> b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
> new file mode 100644
> index 0000000000..3c0efec119
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
> @@ -0,0 +1,112 @@
> +From 7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f Mon Sep 17 00:00:00
> 2001
> +From: Illia Volochii <illia.volochii@gmail.com>
> +Date: Wed, 18 Jun 2025 16:30:35 +0300
> +Subject: [PATCH] Merge commit from fork
> +
> +CVE: CVE-2025-50182
> +Upstream-Status: Backport
> [https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f4=
2e97
> 36194f]
> +
> +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> +---
> + docs/reference/contrib/emscripten.rst      |  2 +-
> + src/urllib3/contrib/emscripten/fetch.py    | 20 ++++++++++
> + test/contrib/emscripten/test_emscripten.py | 46 ++++++++++++++++++++++
> + 3 files changed, 67 insertions(+), 1 deletion(-)
> +
> +diff --git a/docs/reference/contrib/emscripten.rst
> b/docs/reference/contrib/emscripten.rst
> +index a8f1cda..4670757 100644
> +--- a/docs/reference/contrib/emscripten.rst
> ++++ b/docs/reference/contrib/emscripten.rst
> +@@ -68,7 +68,7 @@ Features which are usable with Emscripte
> + * Timeouts
> + * Retries
> + * Streaming (with Web Workers and Cross-Origin Isolation)
> +-* Redirects (determined by browser/runtime, not restrictable with urlli=
b3)
> ++* Redirects (urllib3 controls redirects in Node.js but not in browsers =
where
> behavior is determined by runtime)
> + * Decompressing response bodies
> +
> + Features which don't work with Emscripten:
> +diff --git a/src/urllib3/contrib/emscripten/fetch.py
> b/src/urllib3/contrib/emscripten/fetch.py
> +index a514306..6695821 100644
> +--- a/src/urllib3/contrib/emscripten/fetch.py
> ++++ b/src/urllib3/contrib/emscripten/fetch.py
> +@@ -403,6 +403,21 @@ def send_request(request: EmscriptenRequ
> +             raise _RequestError(err.message, request=3Drequest)
> +
> +
> ++def _is_node_js() -> bool:
> ++    """
> ++    Check if we are in Node.js.
> ++
> ++    :return: True if we are in Node.js.
> ++    :rtype: bool
> ++    """
> ++    return (
> ++        hasattr(js, "process")
> ++        and hasattr(js.process, "release")
> ++        # According to the Node.js documentation, the release name is a=
lways
> "node".
> ++        and js.process.release.name =3D=3D "node"
> ++    )
> ++
> ++
> + def streaming_ready() -> bool | None:
> +     if _fetcher:
> +         return _fetcher.streaming_ready
> +diff --git a/test/contrib/emscripten/test_emscripten.py
> b/test/contrib/emscripten/test_emscripten.py
> +index 5eaa674..fbf89fc 100644
> +--- a/test/contrib/emscripten/test_emscripten.py
> ++++ b/test/contrib/emscripten/test_emscripten.py
> +@@ -964,6 +964,51 @@ def test_redirects(
> +         selenium_coverage, testserver_http.http_host, testserver_http.h=
ttp_port
> +     )
> +
> ++@pytest.mark.with_jspi
> ++def test_disabled_redirects(
> ++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
> ++) -> None:
> ++    """
> ++    Test that urllib3 can control redirects in Node.js.
> ++    """
> ++
> ++    @run_in_pyodide  # type: ignore[misc]
> ++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: in=
t) -> None:
> ++        import pytest
> ++
> ++        from urllib3 import PoolManager, request
> ++        from urllib3.contrib.emscripten.fetch import _is_node_js
> ++        from urllib3.exceptions import MaxRetryError
> ++
> ++        if not _is_node_js():
> ++            pytest.skip("urllib3 does not control redirects in browsers=
.")
> ++
> ++        redirect_url =3D f"http://{host}:{port}/redirect"
> ++
> ++        with PoolManager(retries=3D0) as http:
> ++            with pytest.raises(MaxRetryError):
> ++                http.request("GET", redirect_url)
> ++
> ++            response =3D http.request("GET", redirect_url, redirect=3DF=
alse)
> ++            assert response.status =3D=3D 303
> ++
> ++        with PoolManager(retries=3DFalse) as http:
> ++            response =3D http.request("GET", redirect_url)
> ++            assert response.status =3D=3D 303
> ++
> ++        with pytest.raises(MaxRetryError):
> ++            request("GET", redirect_url, retries=3D0)
> ++
> ++        response =3D request("GET", redirect_url, redirect=3DFalse)
> ++        assert response.status =3D=3D 303
> ++
> ++        response =3D request("GET", redirect_url, retries=3D0, redirect=
=3DFalse)
> ++        assert response.status =3D=3D 303
> ++
> ++    pyodide_test(
> ++        selenium_coverage, testserver_http.http_host, testserver_http.h=
ttp_port
> ++    )
> ++
> +
> + @install_urllib3_wheel()
> + def test_insecure_requests_warning(
> +--
> +2.40.0
> diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta=
/recipes-
> devtools/python/python3-urllib3_2.2.2.bb
> index f6ac8f89ca..19c51b68a7 100644
> --- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> +++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
> @@ -12,6 +12,7 @@ SRC_URI +=3D " \
>      file://CVE-2025-66418.patch \
>      file://CVE-2025-66471.patch \
>      file://CVE-2026-21441.patch \
> +    file://CVE-2025-50182.patch \
>  "
>=20
>  RDEPENDS:${PN} +=3D "\
> --
> 2.34.1


