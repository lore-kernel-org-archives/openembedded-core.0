Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A48ACD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 09:17:39 +0000 (UTC)
Received: from SEYPR02CU001.outbound.protection.outlook.com (SEYPR02CU001.outbound.protection.outlook.com [40.107.44.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17512.1779182251285799074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=G4mi8TBg;
 spf=pass (domain: aspeedtech.com, ip: 40.107.44.90, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGKldn+v5awdZAqu1k/67/dvJGjMN1UDJRQzP3+kFh+B5Is6VzpylHI9TUP43ytNyeJ3buXE/Fb+B/Niv/byPoiLshhIX13fXAOGVIrXC0k8QOeF3VhfvNXqDNReIUbIwmLo3AIOH7qXbiCUyfp7BH5W/O3SjnGvfXk2puHhgUs7Vf7hQaihhgaG42D+Xv8vsYJKHx/m0VcGJCa2+QV7ExhVotsvjJyVhfLoNClHfBhOG48M9LlvETbZizzW9vOrbm0WpnFx0fM4pvnfkxWCrVYy+bDg/oRYwAuO6Azv8G73pW8DKhgi1Foc3vMy8FvYlCXfsaeF/+tTSfWm4ddLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFqPXdSn45R41vNef9ULxYqYwGGx5mmfnVt+f1xjX0c=;
 b=EoIg1Z+aWeWK6tSOT3LqWYev0DXbCNT779YSe7MngnbWcvN5JAfOYbkiS/4tSsoO4Q/Vabw/vvUzg5BHP3AOFILo2GKenw2oEcpBfPCr6pj0J/+2UlrVAIo8bUdjJfnFG64ZeKapkNkrGfAWpcB9uzMIRKIAVI9eLilhsRDj6LqmmriXPck9+VqoxTZdTegMedzhf+Z2zVZGxjrhV54Fa2A7H0Ng0LMiurvbFTxUIRH6Ch4+sIKw8M4K0Ndt8ybrA0fgcY5sYVehoAczhBUJZwZIZcPYp766r0eMIxxIbrKvksxriUgnX4ekbQApfmARVS/5WmBz+zrGi6waPEBtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFqPXdSn45R41vNef9ULxYqYwGGx5mmfnVt+f1xjX0c=;
 b=G4mi8TBg7MJ+LKxjnZpRcxIcsra+FzTDH9yejN30u0YSgA+eJIKUh5qe2v47yxCcAa0o86z2n9sDL/nvmRPT1WfcF5lbaHeJNdMn+OtCBLVmhos4YwyqyPmdpgQUEaa8osbdXL0/ZQesMGU8o057ijRMXOHc1DghoDGmB9S3wt4gg/USqilyblya8X052Ogz5AfZg1HJZjHh0s8orD57bUuleXcgpGkbTqAPIMvFBoraakydp9vj42jMsPN3ZMz+KYSPGuYcSpZF88P/UdBenHiwmJ2mUu4DC+BxRYtJREKFZBwfbtynNosykxarZWZTRb+MvGpnMajpyBdNNEJwIQ==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by TY0PR06MB4983.apcprd06.prod.outlook.com (2603:1096:400:1ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 09:17:25 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 09:17:25 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v2] kernel-fit-image: Validate key files expected by mkimage
 for the selected algorithm
Thread-Topic: [PATCH v2] kernel-fit-image: Validate key files expected by
 mkimage for the selected algorithm
Thread-Index: AQHc53BOqXjrgeIA106nYEPPt/418A==
Date: Tue, 19 May 2026 09:17:24 +0000
Message-ID: <20260519091721.2953889-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|TY0PR06MB4983:EE_
x-ms-office365-filtering-correlation-id: ca885a3b-e9a4-4395-a97d-08deb58770c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 LKRLh5S6/5zkd3VOm752ZBoCxZj10DUd6LxqRbP1yWwo0k5UQ7UyABdSTfnSLfHXlZcjZIwqfGUE3zrY/Yy9egcm66FuRlBRWqzd71AOnPyxh7B4R8IH9o/oWy5sGwLpohkuZS3zJUEnb9y9kPF+FdfqZT8Zu9R8ZJdzKDL5acqGf7ljbQ5YqsK1msI0xGKRoKXQR7I51ln3Lw//UyJMSjessCTn20rcOeVxo8e6BnUiE+3chhSD7r+mYrCYjfoOTDHq0esVtcNILcUTqvDOXfrlHyqKj0rbkne/4/jcIspGCrCPQg1UepW+9P6rc9ev6gFR2JEgpO0mAXsCLiN32o2vj8SuYtQyt8mgIOAiwoE1BMURp5pMfAyLcbIQoIcteanmzXCLOb1ao/iWYO0unIfWiFvQRzvH5Uzitk9wBmWUzzuUqnoWQ/yqMth1vGTh/AJL3M4Of1pB06QziA7xpy5K12Rqd3Qu9sd+gJ5CKys5LU+7dnTygLwSmkoA2bxEEiZgQK6lQajjPSxysnSpNwprgJZi4Jth1S2F7uYRoXJ5nPKwXBm73H23rp0XzNbnnguOLBnAVXIMc0Zlq4tiSAIMNWDhDENtV9EhTG5lXPe8TgBvOnQ8f6pgs+Jm7doRpswrOawx01/aDssT0ho7i+j7/mbztqy4SbE8nrNkXquKkoqLyhwkwnKIzwGARxreg35j+LUTJbRdyMnJ2/RipHY/6uQK7ysT+1VZ+Qs3eyXlOcN3UJHpu48ZP3xiMrD5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UEXJFwJGC69umM+Ec5x2HmBQW4Wk/p9MvEvG5krfPkueE0HGFR15EbdpAncY?=
 =?us-ascii?Q?Mdb6suBt1AMQ8TsSneWjOaqGU3LP6UGnb3Gd6qJ6w5QSOQkP0k7ADZcha/k5?=
 =?us-ascii?Q?MVDHPpZVp1oBeLOpmPMamvglW/yYTRjdp37GSN7iVGdQQI5ecprm2mGe4aBg?=
 =?us-ascii?Q?xFGuVDenmCNT9MnccRbnn/UAssiBNr42tgvnpBieE8qTOcP4i5Zr2R8xKZsM?=
 =?us-ascii?Q?VD8JWqBpms2VN/OrlXLgPz8r93mShlShwsGAHHffXA9m0OXJYHX2fIKM323w?=
 =?us-ascii?Q?GoS/gKedV6NwNHLZ2OZWK7PrFtLCOecHFMSgmI2oML1JsNWKi4EnOTsTMImQ?=
 =?us-ascii?Q?lOch42BRsVk4mtZYgTm0ONixzw1pVXxp7KoHes/vc40ZcYhZt1IYWvdBZZuz?=
 =?us-ascii?Q?j4UXHAocWsVZ64PzmPKzeSL8ANj/9Zo1pFjCZlX/ZD8NuvXpi+DYaOiiAPuB?=
 =?us-ascii?Q?/Rbn+AIQgNp/Hu4QhOedhj65wO32E8Z8Ccrunzm/rM5DI6xD/OomYorEV2ov?=
 =?us-ascii?Q?49tBWnIa647KRzFADVhdC0tEZBwLhIjdW2Ihk/ToIHsyMr3XRFndV/zT+45N?=
 =?us-ascii?Q?SwW+x9O5eVOJ4LPZs34ByROhdUx6GXuJ5XmQIsBWx1PWJ1Ps6WwwB5HZmG1M?=
 =?us-ascii?Q?YR/+nnSd93e2ZEcwOGKP3BUsakyBbrtt54mPVa36kL6gQAGE1R5JrSulxHNo?=
 =?us-ascii?Q?VcrniDOtrLmUTDMfgWSwVbV4pc+yeGu47hpHLzl0oENAxpN51+HptfaMe3Uv?=
 =?us-ascii?Q?jnTso6ShhsFNbTEsXZKqNTzhQSQdogm1CNF+v1wYi0kpMieQXhFPfZxowz9n?=
 =?us-ascii?Q?6lz0GG5iBeDUI3yKycI1tocC6AckzknmF4mEuGzy2jL71hUks0L2pYCZBpFj?=
 =?us-ascii?Q?sGXS11ysqvw3IRiATqKtaewoNDmcCSTxvA4VVsjDPNtF7OUqSMl+FDVO7e7r?=
 =?us-ascii?Q?6AkQHdCbzc4tltmwVZ7sp/mlQNENNugytTk4d9ARt/4CTUZDoFfDVkAIqsOJ?=
 =?us-ascii?Q?S8hXpEkVpbxdbIArC5SNlrcL4vcpGobmRobMDVmdydBS7OLrEpm5FXZ36I/J?=
 =?us-ascii?Q?A0WQ7wjNE5qi5LnhKv8eozZntUXCJf1Sx0YBNkCVNrQQVBB8O+PZQp6r0iol?=
 =?us-ascii?Q?8PvUmUpNN+8i/uIKwDkbDg+q6Tvz3i5GqUMdY6SckKlBciML97aXAaF8ETxZ?=
 =?us-ascii?Q?CVeXeZqAmc/1/AfXlpsQcVz0IFfxHvZ4ZaBM5q02+thzLerK6JAFaIRceqHR?=
 =?us-ascii?Q?S/8zk9P0Ui8EZtwdAFYdrKgE9oBoMAGbwO0vWnynGOr9h01VN9X8RpPtcGVN?=
 =?us-ascii?Q?eCbbg2MzAKY1Ir0SZwO4XTYXmsNzMeqaFw3rTUyK5W0phxQVKZCXIM9dNstM?=
 =?us-ascii?Q?FSDv/Bwr0AvFRSHm5y687Opj26UGdLstRzdNh/qj80iDDtsJs6Biexx2f4rT?=
 =?us-ascii?Q?7UvoLz3twLRmctCOWXzCvxpKSTLklX8r91kO49DSyR2FdUN3VtpBB4iS060o?=
 =?us-ascii?Q?N8RZURnSjlmyxKqoHegvzqdkFec5zrX/t7SgySl1RawW4+FkjfRZfqDJRHF2?=
 =?us-ascii?Q?J7LvKWmyYbwNDjznU1hnHwb/6TdsHf2hu9Z1hFkbaBoBPzCJlpisqeDgytc0?=
 =?us-ascii?Q?4XnfZCPJ8ncH047PD+hqHizJOXDp/Ss2ZTSW0JOR6Cv4DPyp4VfYBkPdgNSK?=
 =?us-ascii?Q?aHOD3ggY+nlaTog3k2S8nPRcxufu2Xvy6GI1PEYELhuqxIUyVmckhDCglUTx?=
 =?us-ascii?Q?AW1HjQMXyQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca885a3b-e9a4-4395-a97d-08deb58770c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 09:17:25.0069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +O7NMQXkOrk14Wv8kMdkI4ch53ojcU4IfZwtI/Pc6jGmtxNzlR39OGCDfvuN2QXyzyGnOPHEtQKf5DusFyumVyr/3vsVMrKBn3xDlesD5J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237298

The signing key validation in run_mkimage_sign() unconditionally=0A=
required <keyname>.key and <keyname>.crt regardless of the signing=0A=
algorithm.=0A=
=0A=
However, mkimage handles RSA and ECDSA keys differently. RSA signing=0A=
uses separate .key and .crt files, while ECDSA signing uses a single=0A=
.pem file.=0A=
=0A=
As a result, OE/fitimage.py required users of ECDSA signing to provide=0A=
unused .key and .crt files only to satisfy the validation checks.=0A=
=0A=
Refactor the validation logic into _check_sign_key_files() and validate=0A=
the required files according to the selected signing algorithm:=0A=
- ECDSA: requires <keyname>.pem=0A=
- RSA: requires <keyname>.key and <keyname>.crt=0A=
=0A=
Detect the algorithm by scanning all comma-separated parts of the algo=0A=
string so the field order does not matter (e.g. "sha256,ecdsa384").=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/lib/oe/fitimage.py | 18 ++++++++++++++----=0A=
 1 file changed, 14 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py=0A=
index 881d0eae0a..24a5c67600 100644=0A=
--- a/meta/lib/oe/fitimage.py=0A=
+++ b/meta/lib/oe/fitimage.py=0A=
@@ -574,6 +574,18 @@ class ItsNodeRootKernel(ItsNode):=0A=
         except subprocess.CalledProcessError as e:=0A=
             bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {=
e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\nit=
sflile: {os.path.abspath(itsfile)}")=0A=
 =0A=
+    def _check_sign_key_files(self, key_path, algo):=0A=
+        """Validate key files expected by mkimage for the selected algorit=
hm"""=0A=
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

