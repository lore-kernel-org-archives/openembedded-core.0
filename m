Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CBCCD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 09:43:01 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31537.1778838176441365718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 02:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=Bv6ffmsR;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.89, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyId/9m5zBAJ1bfqPT/MTPkZeg48gXrkELdphvQdg0Bh3jwy98THTrt96ls4vQefYKLSGkqDANWRQlRPnjXOMTQNxJ3S/mzx1xhMTRNN6FuxubBstIqzvEIe0InJb0ClQZha0NEMopQ/NmBl1hKoV1zpUI0q+Px+6crJhvhLuTvazmYZHO6K22Cf/OA5KAXTJqlTgoAvYIG+a8lkqR7p19/gna5sliI2XHpMqP2jTjZjcDHvm1PNS5wx8H8Yhp1bVUXsjpW699mfQyJL/5WTzevSMr71UXXxMoDIlDeBVh2t7rxk4HNVVh9IYCB0+jSIZ293/LKz9U6HeclZfdoV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr+JChs0aFedizfGKkadTxaZx7T4K+SpS7zYZIWpoPw=;
 b=rv7Id3eOKjCsKJasJdTfsvBKSjQ7Cxp28KdYmZ9jlvyQEUYaorNo2VdoFyo3P7BLDlJlLwrHT2bi4Ucbbf/geRiI2X28FuZBPzAn86fALe52dGahFRnV74c86yLXr/cyXbkgcucHtq71BviMCnanTLHoQ7b6t5QRtB2a9tCV3Ibg6fywRGVG2tSqSVyVnUkwy2e0Ru3tNVOaRBDWBdiMF65XWzOsvyB0misRxt3xokDhsGYLhWIkCX7VDMyzjV8X71DdaFzcNKmxmspb6QACRnKNoE18b0s3CUhG0VKQpeJx4cFGshZchlHtGEbmnh7X3SpF5TFCvHQT6bXTWyh0Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr+JChs0aFedizfGKkadTxaZx7T4K+SpS7zYZIWpoPw=;
 b=Bv6ffmsRoOr30daKMsQsPKN/pjJVF3/Pw8ke2zNbLMfe4lYVOqtF1h6GxjtMLweWrg1NloWd0P/y/plEq3lsQduM7XKXurPU9R/rDQLFRfhkRy/HVwLPBT0IOuwHCTUBOdE3/Lk699mMvNtgYldXIBy33yI+F4YTAhgFcS3yDH8egvawUUB7v4kbPcJqypRv7J0UlVU0YjxRo93zpTna8Zadpa5nrkk/9L0DxeZZzVggXBEawkjgwu6nSSQ5BgDWpXTvsj6cKYkUnQP4zHCshKE9DjsAse3ois4XptIj5HCZ3+2QHoVshoQTwI8SxEmphSJSaxobkZFJVffSe+VeQg==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEYPR06MB8113.apcprd06.prod.outlook.com (2603:1096:101:2db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 09:42:52 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 09:42:52 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v1] kernel-fit-image: Check signing key files based on
 algorithm
Thread-Topic: [PATCH v1] kernel-fit-image: Check signing key files based on
 algorithm
Thread-Index: AQHc5E8yVorB/k0zaUColFebuiYitQ==
Date: Fri, 15 May 2026 09:42:51 +0000
Message-ID: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEYPR06MB8113:EE_
x-ms-office365-filtering-correlation-id: 68571461-c337-4b94-3915-08deb2665549
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003;
x-microsoft-antispam-message-info: 
 1MzUX95yLNT2bgdsfhN25nRNd8nN6dSx4/u7ahvbJCZz9K9GDMte78pZVB3w82AV7Im+xrRsVjLqahfPamz6mex5eBAtGd0nFEwbEhnukVPJ7HDrjvHGc/Rzb7PDokByiBwGrdg8URyeq+AJZrujarcJA2kOzhV9OcB/FOyP+qN+58W0e2IFjG0HSBcInXR/3HRxXwZ99abSZwupUdnXDMV47YJ0CrfgyOx4O2Hh7EPuigUje+OzKqlfZJ/AMFweGXlSZR1xmW6/YVU14jpdUo/U/9anjUDSCpD8jktsXc7RXgevdYWtJncUbIXuBoOMtqxCbuebxhclsEE5yrC7LhVT1lG1kR1LLM+iFkBqKkY4V3JspD5Eulo1Ke962UcsTJc5Gyk+TYqXKlzAwUKd1AfGqP9s+gJ/cJu+yk8dTqEE+REkxDt1lAV1gHKP0m3OiDvHS8or5BFePSSOmwUmSHbZ6IbU9KlLeqNNCAnpTtrC8l3n/k9ApcpNh+/Z/8jXAXOjFJOSDTGPaBpYudnRUq5uiAGOpj1q5pGPXww9rrkaCHJRPRmLbdOkpl/WTMJBm6Z5w6OdkEmEsGVGLwun6Tm+7CN4U7CkE1OtIlV31ZR6+8E5m1YUbJi3yDeDZfSgYc5GsgSEPQXKd3D1XtrAvlrRt//b5TmVdue0eYdkFVRAU6rPu1QYaOROYGEcFSsyB6JPFDjTJ4XtiVvI8uFzpEV4MQlaxPCVtIS1dBO8t/k4Qd7LE5Kqlc3ideuNmTZN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XsBBTUxAmYEiq3PQhvSBC7mf84rRLd3XSKJTWmdJ4n/Q9NmO1I05M1mxtxO1?=
 =?us-ascii?Q?3jTfleiCctmUWoZqTbz644Vr9MJdkdBYJGlloGu5Jmo2tdWcu7C5wch0a27p?=
 =?us-ascii?Q?Ba/ccmJ8GRLvNq25qCvtKhPFpc477BokZ/M07u2MQR1suRNs+gFbZXz4eB3l?=
 =?us-ascii?Q?4ACTHBsCXd9aupJq5W1xTepk9puZRdk/8ykKXr8oaVTPIdB9FGA+HQFwON6P?=
 =?us-ascii?Q?Uq0H+2owF4AanAMTt7W1bw4pTNo3Fp8xqvv1/It0mFFTs706pbtjnBixAkr7?=
 =?us-ascii?Q?6p2SUrJDs6NNpIE5h4xgizq5Y+sjpx7zogg2kv3ZXPyZ+40IyA/y3BRn2Eh1?=
 =?us-ascii?Q?wroVBtR93cdXemU8PeGZ0LBnWPPje2xXvy/MXVTnPYSR4LeLR7tEnhwPmwwK?=
 =?us-ascii?Q?I8K5tXSQRAU98Y9eBSChdLxemUwh0zckCeI8xhIJvSa4sb3VoVPcd2MGtnhq?=
 =?us-ascii?Q?jHUgPuUmIe12RCBcZtYYXLqOIPbIuuXBiDnExtqjaasjoI77ynZgxms9tzum?=
 =?us-ascii?Q?aB5XKNbSnfybv9XyOMiurP7hCQi2T4TIdBrBaYMV+Bi7PDaebA4WV1c6fnaO?=
 =?us-ascii?Q?u8Uy+AHLvy6R1G0jI2o9WXYMjUczsonPMrdYLDdgLiwdhtqziiLnHvE8phAU?=
 =?us-ascii?Q?NMHUvZ+5Sk+Uy3fXI0V9UuDtxIq9Nvysz3VAxdQkI2XlkGWi7sE6KX+Bx7wM?=
 =?us-ascii?Q?x6AKDj4zhkf+o8mPDTqdzge8KzkPz1nh/QIxpEBZHtsv+qPw/dktQgG24y8o?=
 =?us-ascii?Q?V6f4w4LeWAM4qJyGB25ZdzgaUvMBGEn0qlezkK/G7+V+ypSFUZlBJon2Xxza?=
 =?us-ascii?Q?E8pN+oX/fdn8BXBx0scZtPzVHHQ3icr8EnjdXtkzubltEGl1JVsj/QC3AGix?=
 =?us-ascii?Q?3d9nOm9PKLnsGyma7OlVpobVyaeFG9IlB91I6s8yQYX4n41hJcOAl5GKMkIF?=
 =?us-ascii?Q?cE4wUHvOqp3ip7NpSXsAhbJpjxtDFhEQe45lk+mp7qozIej5PBHJxu7p3CtH?=
 =?us-ascii?Q?F+vEaSEw6Idgkx8GBa3suuQdnaEZpUnBoTosw9kPPYQzAgpf6oLs57jEF3an?=
 =?us-ascii?Q?9CQYyFpriQab5XbQ6ViiSqS3ZqYiDr1h/R6NiIygvIUVV3WpxpfR6M+1sTZz?=
 =?us-ascii?Q?/L+lh1rM0S3GcPC6YfuaEoLlIG4vneC1lplsDmeh79VeYEiTPl1H8ghvzIRT?=
 =?us-ascii?Q?IvXVGjJ7bxOp1SZTBzvLYFkRaDjkWU1SGpHpgR6ah7dOrEQ6C+yfQQHlXoUf?=
 =?us-ascii?Q?cebGF6HLCfo3KRpPDsqY6wlUJmP83wRY7M0xPw48AkfbVmzccybdkmJhx6L+?=
 =?us-ascii?Q?LftMHvE56kb1fSiYlr45mdom6KUiLN4KHfCN/7ydVC35z58lhA9kXEXmWKz6?=
 =?us-ascii?Q?B+znScRAnng004IFnm7uNpSTDYmG8AxhCzR+pHgo7P0A+KFwV5P6wicy4lA1?=
 =?us-ascii?Q?E8Go/K1u0EKvQMqg9rG0dMwtj/VvDGIItm1raxIpq/lRhsO0brb0aR/vv8EX?=
 =?us-ascii?Q?yvLDyWrZwi6lfToS3ubAx+p2N0GAgiiA0jST86aB0zPjE7ZQ+z4g8VFGpRrz?=
 =?us-ascii?Q?pnJIjvHs0cBo7d4waVWlwoBUkZMl5hESYelbftAcyeRCLlfKMFUovHLgQchV?=
 =?us-ascii?Q?uLEgUVVGOEVHPes6ThZE26At9qqVn8DSy66gEQBtx6RAUNlYRsdmy6BZi90D?=
 =?us-ascii?Q?90oBEdX5II+SvLO6RTe66hFv41zXvVYeIk3BOjTAkNQuq4nlLMnoILQKbrF8?=
 =?us-ascii?Q?GZPscG3JqA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68571461-c337-4b94-3915-08deb2665549
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 09:42:52.0087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IvCxwYgkB4J2E/m80+3kredXmEU+ulu5aeiFBY4+GbyMDpDB7k1W14mCC5xWYeTKuy4NGkC4Q26uXnvpzw38CYOv5jDjANDVLByQlVaIVwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 09:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237076

The key file validation in run_mkimage_sign() unconditionally required=0A=
.key and .crt regardless of the signing algorithm. This prevented ECDSA=0A=
signing which uses a single .pem file.=0A=
=0A=
Extract the check into _check_sign_key_files() and detect the algorithm=0A=
from the algo string (e.g. "sha256,ecdsa384") by scanning all=0A=
comma-separated parts so field order does not matter:=0A=
- ECDSA: requires <keyname>.pem=0A=
- RSA  : requires <keyname>.key and <keyname>.crt=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/lib/oe/fitimage.py | 18 ++++++++++++++----=0A=
 1 file changed, 14 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py=0A=
index 881d0eae0a..e6ff66ca43 100644=0A=
--- a/meta/lib/oe/fitimage.py=0A=
+++ b/meta/lib/oe/fitimage.py=0A=
@@ -574,6 +574,18 @@ class ItsNodeRootKernel(ItsNode):=0A=
         except subprocess.CalledProcessError as e:=0A=
             bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {=
e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\nit=
sflile: {os.path.abspath(itsfile)}")=0A=
 =0A=
+    def _check_sign_key_files(self, key_path, algo):=0A=
+        """Check signing key files: ECDSA needs .pem, RSA needs .key + .cr=
t."""=0A=
+        algo_parts =3D [p.strip().lower() for p in algo.split(',')]=0A=
+        is_ecdsa =3D any(p.startswith('ecdsa') for p in algo_parts)=0A=
+=0A=
+        if is_ecdsa:=0A=
+            if not os.path.exists(key_path + '.pem'):=0A=
+                bb.fatal("ECDSA signing requires '%s.pem'" % key_path)=0A=
+        else:=0A=
+            if not os.path.exists(key_path + '.key') or not os.path.exists=
(key_path + '.crt'):=0A=
+                bb.fatal("%s.key or .crt does not exist" % key_path)=0A=
+=0A=
     def run_mkimage_sign(self, fitfile):=0A=
         if not self._sign_enable:=0A=
             bb.debug(1, "FIT image signing is disabled. Skipping signing."=
)=0A=
@@ -581,12 +593,10 @@ class ItsNodeRootKernel(ItsNode):=0A=
 =0A=
         # Some sanity checks because mkimage exits with 0 also without nee=
ded keys=0A=
         sign_key_path =3D os.path.join(self._sign_keydir, self._sign_keyna=
me_conf)=0A=
-        if not os.path.exists(sign_key_path + '.key') or not os.path.exist=
s(sign_key_path + '.crt'):=0A=
-            bb.fatal("%s.key or .crt does not exist" % sign_key_path)=0A=
+        self._check_sign_key_files(sign_key_path, self._sign_algo)=0A=
         if self._sign_individual:=0A=
             sign_key_img_path =3D os.path.join(self._sign_keydir, self._si=
gn_keyname_img)=0A=
-            if not os.path.exists(sign_key_img_path + '.key') or not os.pa=
th.exists(sign_key_img_path + '.crt'):=0A=
-                bb.fatal("%s.key or .crt does not exist" % sign_key_img_pa=
th)=0A=
+            self._check_sign_key_files(sign_key_img_path, self._sign_algo)=
=0A=
 =0A=
         cmd =3D [=0A=
             self._mkimage_sign,=0A=
-- =0A=
2.43.0=0A=

