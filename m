Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADA0D3568F
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 08:16:20 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14169.1769528414607631026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 07:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wcGQxwpE;
 spf=pass (domain: est.tech, ip: 40.107.159.32, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruXuikqqHXK/Z113bN5ICk/JLViraHTI9nF3jg/eo69xw7wg+oMySrVIPUJQTdRfNRJxfIEyWhCvy4LnegNwdWByI5oknrCZP7bYvX1Pg6LYQs8Bqa69gFwo8UFKVktEj9uRh1CfKn0vju9jB3huFV2fXVtCU4DNCfoWIjxzT4IHlhhkvel7yPKnPeG2XGLPT/rXi06ltKW5vLCeQJIY4Hcel1DCPeDifkcrlIXBzGINUpkvYXtfZC0SDz4O9wQUzDJFgzgKOqYQbsjOOog2Lb9zHzrCiwfVr1LLa8eWOw5A+DqxsoJD+O7Xj1Uv9NtQDj3Djqg1KIj+P3+7r+Q3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FSKKzXYPLzEEHaTNuHKu+uHavGhAPWM64eV8ce7JRw=;
 b=u7OniFdOPt69gtzO2WEeocX5nm46VJcW1B91xg2Jb/XhgPk8ufYsHSsl4Zr+rszq2aApc0Y16EudfnLeY7BLCcjUz7XWBGKtJb+gtkLKin4H9CjxxJT7j1Fu32edEzjzp8D28T5J2i+B3eMRHSBmQ/eUNgPtozq9HeDtAK0XjJK4dY2KfAL+2/PN1e5Z6VMdVvQQMOWHuTG6yCP7Rs3tMZcbImHQq1hxfsSHIWBeResOgTvIWKuXlKhL2pieslY9jFRG+EPppsM+bDSvLoIGqBnF26ZoBwKWT0T+ml5GAISbk86Re2V5ZL9n+1+Bmf+uZXGO0ls8gTh0CGOy97MKDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FSKKzXYPLzEEHaTNuHKu+uHavGhAPWM64eV8ce7JRw=;
 b=wcGQxwpEkvlDIH6oLPXEZo5pV/AVn8BUzvLLp56LZsH1yj5xrRbFLDsFfgVqEvLI9IVerGgVy8a3fPERtR1YPmA6ZsAhXyjAzA6QST7jZ4E8GKDUAxK1fbQkmMJ8WvT5VSafPdQldKZ+/mfjvsoQlx5dTb44EnOnb93LJMgUQPMHKFxVrRU2r9n3C34/mnrzQgrNf0KSHDORzCBPh2Bk//CB4yjNIkF8SPe1v+s+Z8D/jU2y8V2t6YVE+2CXhUA+xhr6QTolEwrMDI1ww6C7adQ3EDbn0jSqOaaUo42sP/lQZ8Q/JWfFwrrHqPE+x8Ogb+49sZ67aa4viu/7G1Ldtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AS1P189MB1963.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 15:40:10 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:40:09 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [PATCH v2] Backport fix for CVE-2026-21441 Python3 urllib3
Date: Tue, 27 Jan 2026 16:39:57 +0100
Message-ID: <20260127154003.96816-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AS1P189MB1963:EE_
X-MS-Office365-Filtering-Correlation-Id: 701f2948-a60d-45a2-6a1b-08de5dba5a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B7kJ4SB4asQjzgPkXv3bSKtui5pvvfFhqJrRUmBvuCmm4nYWQcjIKv19w8xK?=
 =?us-ascii?Q?zReUBHl7P3H1IT0oI0VKDrDtEDH1awheQ7gG0NZKqdvhp0nk4KsmR5RFpcVe?=
 =?us-ascii?Q?0vzl6Xjuy2fIKuDoNn/xHCHpMR5xrlghgxVz1MgBmwAuDvlFv4oXSkBGZ1L4?=
 =?us-ascii?Q?Au8XOA2WeQPWAjkwdAF1vLahiDCQdYmg4CL+vAdXlIvNPS1UoSf5mmcOQKrr?=
 =?us-ascii?Q?7H098wZMvNHi8eolptg016gD/NSmPuJ5LsZmvnkRbKIOlP91bDP4oRCzJ3/F?=
 =?us-ascii?Q?ceIOUqy2wAjHRRh949DhdqodHvhPQekOL/s3gQnl3A/LG+sr3WdA8ywuBfNA?=
 =?us-ascii?Q?13jGTpGL1G47f5iU+SU6EeQPXoggYvHEHLz6WwH/Aa1ylgL7c4LeigEoQMfT?=
 =?us-ascii?Q?iJfSNrwHpKuXgMMsopLvQk9zLjOre/fyAXdOXxQR/htNNYMluyy4oj7dk94P?=
 =?us-ascii?Q?M1bVli6MRDUARzWD6W/eAO4tCbZZiV8opEU2hm72Zh/XGDOcvbO0P4N01iBW?=
 =?us-ascii?Q?ja+14aLOLxUgbbpbAlIUETfpeNAd/NikKINuNrn9l/uaokzjz9pWUL5GtImi?=
 =?us-ascii?Q?V0uvcVHOK1UV+VxIRC3cCfjm1Emrj27yTk7xxYNmRwrGPkrhNJqs8xzxEjWb?=
 =?us-ascii?Q?1igkI5CXMzxdSNwlq8NhOPlGT6fAuoyUUaP3SwSGi+oyiZrXNfusRHVB39cW?=
 =?us-ascii?Q?Gon2XnLiosSMPEM8NQUTXMoAXtyBk5ti+FyJ8WkWwTTvUp1Pzy0oCpBsTa2F?=
 =?us-ascii?Q?Upq9tYH5/pspej+j1N9GG60hyWI4FJQW6aef4Pr3EHlTrOE/nh9Av/M94to3?=
 =?us-ascii?Q?hkiNtJJrSBm8kXyjRnCZ0mcOZZmLFKlIB3nQ7JfLWAhr0g01YcPaIXoqq0mT?=
 =?us-ascii?Q?3SP/YqVem1N88+P0XyQdQCVuL9021kmKM9EaSoBYJaA6/0nQoXyXYyAK3+0P?=
 =?us-ascii?Q?K/qWRGHzUYmDZP9jQvpkfXx+uEETzfFu5+PvhU/O4a7fnfPzFEv3cu1QrANr?=
 =?us-ascii?Q?iTB6MgFYKjPdJDK3aHDS9QRw9XN6elRZPHqvVr+JqCyJTg7eW5obVeJRaV1C?=
 =?us-ascii?Q?adpVVsuLCA0RHXqJ6xGhn0Ski4PFTqcRLSrsbQJm08pIHB364f+nx8YC3JsE?=
 =?us-ascii?Q?mkgKN3obZqbqIx2B+NVmKNXaKGMjgBiqa7AQ9Ku8ZwFEyc7eEegi7Q/rl7Wo?=
 =?us-ascii?Q?10HeCJUhQ26CyTxZaB7zzsHWYDobLFw06kryJe/JSFno3WouZgbFz6RuyP1G?=
 =?us-ascii?Q?8S24vq/+jePCoMKn9HRW50HjHP3tKi+TF5/8dOc6uV9FQZQVCkOayQP/vXEw?=
 =?us-ascii?Q?1iBenaEUrG+c2GsR+ptlDKUXpdILMet1/Uwjz0kAE/LjzGxNDmIzHIu4+2tS?=
 =?us-ascii?Q?ACdDypT+QfudKSN4f7UAqS3tx3Kt99XBuNeDVJ6LEp1foc9czAFcIAxSd9QJ?=
 =?us-ascii?Q?c+Sxb9/5rxPSMdvJnxBWa7Mihnl43auK5nwe9Qan2kVLBCGoKe5E7YKetZO2?=
 =?us-ascii?Q?FqTtQlcLGW0C3QdKMxaYc4aD9BaxuPCT3AyaeYR1adeeGhdHIVi9YRYd8LQ+?=
 =?us-ascii?Q?lZwboftOgiB9XZIlVcgnk06h2E4DJIlDVMYEqL4G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2j2zrHjYxWMt/5+gzOyHDr3+vi+vU8/cCagcXtwMCUcnZFX5J6w5EuIK0iGv?=
 =?us-ascii?Q?64NCCUueVZCpi+nNaFM8iRbfPUqLlAY2FvvHDhndQh7x1VvvUhe9VFalFhLe?=
 =?us-ascii?Q?aHLltc96anPEQG24ATzv1Faaying7rhC9r3Ari0MvyAySKzaXdGaJ9lwoS4I?=
 =?us-ascii?Q?HhEbh5/8XxJ5uUI6qFHd1Jc9hpAj43biQ4fqtx85v5BNaj76EIg3yiFCALap?=
 =?us-ascii?Q?/EJrGWyr260Mc6lWUy/vOWmJD/5U7uuMNhae6YVLRBPik51pPvZKbRDwD/bU?=
 =?us-ascii?Q?EwlTXfuiMjWJUUea2rBi80PCxDSgH3U7Tyrq70Ldp21lCK4fhtdaUIMao2wU?=
 =?us-ascii?Q?sRq0cwHqcX2FVFT/q656ZhOgJWvAjC2d6BhS6e51E0AKrQKqCZbT2pLrtJHI?=
 =?us-ascii?Q?eTqy5YsKFxs+HkngRE3ZitzF3tnPFwBMAO4AhmGD51ay/HjsPYcfdv7yeKrl?=
 =?us-ascii?Q?0/cz3Z0bnMayd9RdnH6o8F4IsXUexhMzgx2paSs2hneqGQuVY/kA3JOXal4g?=
 =?us-ascii?Q?D3yQ/7krryutbKIBFtERyJpjvfq88K78Qvd1n9q+2dWWyv0je2nfvZLL8vhW?=
 =?us-ascii?Q?+qL9VoLB+9HGlaLyY+eXhJTiNioVs4486JFpFSD+/Cjl0jL/Z/fREKROvLaU?=
 =?us-ascii?Q?86PE0gvqE3u2uC2U1sK9s4HKSCt4VrQOu2Bfhsf226pQJGl+UKv8a1o7rT8G?=
 =?us-ascii?Q?IAto34Vos2sp9Md1KG/aXqc5GeCRyy8L0HMX8kHG7pB2RDgHzugAy+ZwkYlD?=
 =?us-ascii?Q?agFXXoRCD6G+4H6K1ViALsTwnN6nDQ8d0LEqEYQUsuX3pfamDDKnl/4Spd8N?=
 =?us-ascii?Q?hAZahocp6uwaekRHT8iJieHnc8kD0OkBKd6SroQhkhITNpURLbqFQMopopgf?=
 =?us-ascii?Q?S9zS9gBXGsFjaeN9by2ajc7kinIHxulFc9Fptzq0st/aOJng6Dj4OJF7lk9E?=
 =?us-ascii?Q?/T7NYaHBnWGniyGESxIGPSMmyRsgaY6A+Fm5obf6yvmWlDfcIRFs/0kKsmxV?=
 =?us-ascii?Q?6i2VSd2cHK12ueCWSe5/n0C/nLuVEcyC8mJT0Kb6EnFIeJBa363/DKnPzj8K?=
 =?us-ascii?Q?i/1jumIW8u3UdfiBNTkMI9f2+FLJNuaBWX2/WVGY3vAVP0FxHSO6/UwMC8Ri?=
 =?us-ascii?Q?gFYZndjH++NawfaXkuu8oN/RNec2DPft1EWfLmBEE/tYw0uUSjfewRhu6x5f?=
 =?us-ascii?Q?u1lZI/uML2woFXgydHDFOSCHjxPMrdGGgvlV4XAxH7qVN36y/THAbiF11f9K?=
 =?us-ascii?Q?GXALRjyn4zoLZn7NN1ZMURhkSN7E+L3N2LWGWXXzODULyFkxYZDfx+i50DDX?=
 =?us-ascii?Q?SU2GGbOSdhHpAEM7bXeLlAO0KkCPYZ1i38YVUWceWp7yVMopSfB77jRm96q9?=
 =?us-ascii?Q?Xm2ZsI5oXMXCKr+SpSvOfUWUDgi/4BihZbDOKhFWOLycZ7hZo3IKYpsQLER/?=
 =?us-ascii?Q?zUKwLCW8Ds1d1NvwiAm7vne7Wxx6QxHJjFpFcdbkHd1l6nBPJU4czaAo2u2K?=
 =?us-ascii?Q?QBqIqZG9IK2pesBWKXNs63gC8OjsUiX+bABXAynE8aTVnMitZdjbWvhlCxDv?=
 =?us-ascii?Q?r8VGWyCqio+lod9uP5w0C+3am4jzru64UfbqyAGvkJ72nQorAoJcyjzKxUMc?=
 =?us-ascii?Q?P1HIB3BB+0tj52WYjaXPALVLJt9X4d2osndlanKySuaTm83KeAQ8WJ/6SB7P?=
 =?us-ascii?Q?3WeLRcp+DSJjrybiHrx/MYVekZmNPWGfuzOzYir+BG62APwf1LG+YgxBERFR?=
 =?us-ascii?Q?sL+dnzLmHVw02NO7Fm8p6FFyfrl/tSg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 701f2948-a60d-45a2-6a1b-08de5dba5a31
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:40:09.2788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PXg0U7/Zz1Szojym3qU5WIAg/ReWt0gkcSMXTrorDsxlYywO4vup/wzoYCSOCTmgkZsaIrcPgDrCRZRUkWjy12xiq7DThiHxMAuFoUFmTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1963
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 08:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230083

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report : https://nvd.nist.gov/vuln/deta=
il/CVE-2026-21441
Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python3-urllib3/CVE-2026-21441.patch      | 105 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-2=
1441.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.pa=
tch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
new file mode 100644
index 0000000000..16af67af31
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
@@ -0,0 +1,105 @@
+From 686d2bdd4affd3c86e605f54a72afe53c920f72f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 7 Jan 2026 18:07:30 +0200
+Subject: [PATCH] Backport fix CVE-2026-21441 python urllib3
+
+Original commit: 8864ac407bba8607950025e0979c4c69bc7abc7b
+Original-author: Illia Volochii <illia.volochii@gmail.com>
+
+Bugfixes
+--------
+
+- Fixed a high-severity security issue where decompression-bomb safeguards=
 of
+  the streaming API were bypassed when HTTP redirects were followed.
+  (`GHSA-38jv-5279-wg99 <https://github.com/urllib3/urllib3/security/advis=
ories/GHSA-38jv-5279-wg99>`__)
+
+* Stop decoding response content during redirects needlessly
+
+* Rename the new query parameter
+
+* Add a changelog entry
+
+Fixes CVE-2026-21441
+CVE: CVE-2026-21441
+
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/8864a=
c407bba8607950025e0979c4c69bc7abc7b]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ dummyserver/app.py                           |  8 +++++++-
+ src/urllib3/response.py                      |  6 +++++-
+ test/with_dummyserver/test_connectionpool.py | 19 +++++++++++++++++++
+ 3 files changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/dummyserver/app.py b/dummyserver/app.py
+index 9fc9d1b7..c4978152 100644
+--- a/dummyserver/app.py
++++ b/dummyserver/app.py
+@@ -233,10 +233,16 @@ async def redirect() -> ResponseReturnValue:
+     values =3D await request.values
+     target =3D values.get("target", "/")
+     status =3D values.get("status", "303 See Other")
++    compressed =3D values.get("compressed") =3D=3D "true"
+     status_code =3D status.split(" ")[0]
+=20
+     headers =3D [("Location", target)]
+-    return await make_response("", status_code, headers)
++    if compressed:
++        headers.append(("Content-Encoding", "gzip"))
++        data =3D gzip.compress(b"foo")
++    else:
++        data =3D b""
++    return await make_response(data, status_code, headers)
+=20
+=20
+ @hypercorn_app.route("/redirect_after")
+diff --git a/src/urllib3/response.py b/src/urllib3/response.py
+index a0273d65..909da62b 100644
+--- a/src/urllib3/response.py
++++ b/src/urllib3/response.py
+@@ -646,7 +646,11 @@ class HTTPResponse(BaseHTTPResponse):
+         Unread data in the HTTPResponse connection blocks the connection =
from being released back to the pool.
+         """
+         try:
+-            self.read()
++            self.read(
++                # Do not spend resources decoding the content unless
++                # decoding has already been initiated.
++                decode_content=3Dself._has_decoded_content,
++            )
+         except (HTTPError, OSError, BaseSSLError, HTTPException):
+             pass
+=20
+diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_dumm=
yserver/test_connectionpool.py
+index 4fbe6a4f..ebcdf9bf 100644
+--- a/test/with_dummyserver/test_connectionpool.py
++++ b/test/with_dummyserver/test_connectionpool.py
+@@ -480,6 +480,25 @@ class TestConnectionPool(HypercornDummyServerTestCase=
):
+             assert r.status =3D=3D 200
+             assert r.data =3D=3D b"Dummy server!"
+=20
++    @mock.patch("urllib3.response.GzipDecoder.decompress")
++    def test_no_decoding_with_redirect_when_preload_disabled(
++        self, gzip_decompress: mock.MagicMock
++    ) -> None:
++        """
++        Test that urllib3 does not attempt to decode a gzipped redirect
++        response when `preload_content` is set to `False`.
++        """
++        with HTTPConnectionPool(self.host, self.port) as pool:
++            # Three requests are expected: two redirects and one final / =
200 OK.
++            response =3D pool.request(
++                "GET",
++                "/redirect",
++                fields=3D{"target": "/redirect?compressed=3Dtrue", "compr=
essed": "true"},
++                preload_content=3DFalse,
++            )
++        assert response.status =3D=3D 200
++        gzip_decompress.assert_not_called()
++
+     def test_303_redirect_makes_request_lose_body(self) -> None:
+         with HTTPConnectionPool(self.host, self.port) as pool:
+             response =3D pool.request(
+--=20
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/r=
ecipes-devtools/python/python3-urllib3_2.2.2.bb
index 620927322a..f6ac8f89ca 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -11,6 +11,7 @@ SRC_URI +=3D " \
     file://CVE-2025-50181.patch \
     file://CVE-2025-66418.patch \
     file://CVE-2025-66471.patch \
+    file://CVE-2026-21441.patch \
 "
=20
 RDEPENDS:${PN} +=3D "\
--=20
2.34.1


