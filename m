Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD05C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 10:14:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.44])
 by mx.groups.io with SMTP id smtpd.web10.7750.1644920086847686900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 02:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=hTp7nN6q;
 spf=pass (domain: outlook.com, ip: 40.92.73.44,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS5VrdBn0erNzRSnluYqQNPHPK/2SSOLUgfzlGDdiirVImLd8SDyzgUgXtcJBUbC6Py1qBdOapgWCd26RxMT7SyZcwtkQy8W1f0RhOTsKsStP1QWsJtC7NQMKyspQhl9Fl8fXoDKyF4cAHAEvj2rB9sVkgk+vZfdMaAkpTwStNIMkl/rqOCIQyF2mpkI5S6Ru+kR6dfrefxtAkJtp8SV/QgqJ5wz8Hj39rjVDFYLJny2PiznnUxM/tlLGSi+EDMNu4cKGH0PRexeGJqPt1rLo7zCpoXJw8nXgP4FKRpo4WgvkQ+wJgZbiKD6W/s99YlhnTjPlfImDBGGVns2AKXOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v824gTeXb+3GS24NtAwGMP5IYZTNoLRoyMzbSihgLyE=;
 b=EsiLyLaF8TfymuBa5Gk949i7ifSOnDfNgyY4FG46DzCmSld7YnfHAzKcrLkoOZ1OLQJ4WW1fUDAOyg0t0wNccSoWC+4LTNBPJMrpq8n3z0zugxjb52A9/ZMZTUFptlQj0HwKmEXkc70fkpGaGMUqQi5GdixcDRhPVyActGZdLSpcETaMEDucDYTeX2rL4x7Gcu1R2o7hAEb3V+5j3LPcOa9S//+yyKCgi9LvFHmxUTv89nZNPl7zzq6IhA8WlLNpXWjgxYMBlpjrl/gMvKDZqNa/7nl0NasrkEYS5/RkKZycusyB+IZEPzPgdMfETHrF3tOex8ycxfWrkgUgGPESQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v824gTeXb+3GS24NtAwGMP5IYZTNoLRoyMzbSihgLyE=;
 b=hTp7nN6qQ05PHZMb7+rqloNSmt7welpbbhA7igd/HFGd5SQSTT6za5A1p+a4AEHeIy2P1tymEz6UrpB7B/RbBTTvaMPUnNRPNDjU7yFBRmlxVq61+5Mc+lQlpCH9LmGKgjRZwxNfdTOvJ9aoGqP/ev11gq3XsiwlyxFQtClw82wPQX0wFzUHEZt9B3VqvSFKB5tlO49YLmJpQ8vt5NkuB4z4r9BtBrJX41DDafi7gL6vNVYFTOAOYTlVhvjINWcgXH5h05eRuY6CcUieZVihsirSEGp4VcaLYRSw0SuyVSSEEhdn/1fDnPa4A13s2cn0bHKZm6uacq+3AgPvfeGQ8Q==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3732.eurprd09.prod.outlook.com (2603:10a6:208:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 10:14:43 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702%9]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 10:14:43 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] ruby: fix DEPENDS append
Date: Tue, 15 Feb 2022 11:14:32 +0100
Message-ID: 
 <AM9PR09MB46428E587CC197A200966B8AA8349@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [2NdDZ/WFsyaaRlrDkdI6UJbHVxoYVtLKF2xs3syrr/EPxKcJAdBITHj7gRo/tfYI]
X-ClientProxiedBy: AM6P195CA0026.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::39) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20220215101432.909092-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f1529ff-05e1-43cc-4081-08d9f06bfc4c
X-MS-Exchange-SLBlob-MailProps: 
	KBSGuA5p8vBzZY9Kbc/wKrEz2aS3BuPqEl/yeHp8LjWUo5jt/aQGwQKq07Si9go+Waw4TUvvjumzvioOnwZggm3lWamf6kx7zB6v7jVxdVi4/PqaB6pfHICIFXJML2JKLk0gq6/BsfwsPUhfDe1mI0Ih3V8QT+MPlkCW7QirJGgPOSyR/QGScUlD6E3zyZeFAAVCXLVA25rVm07ey3+2r0S2UnEQjvAJ+Bvgi3y/jZTMEd+70haYJstHBjsuWzSoPgHGSvmPrWxk+Ss1cKNm7hHQSxFYwPApXfiQsNLXC0fnNFdg+VG/A/AdXbPEc9QFJYwQRUFBAUu+VV1vgEpZaeUEWm5om75Htsi0Bwy4F4waeqpRcyYC2+79xitr9CcfI7Gvm31GxCOnDHAamXLMga/ge7DgA8VETHp3wRb5df3u5ZAeafAd62QV0bEUi7XzlvefaruH4gbFv+XOMedc1okHt6uBjWzkpA9uAWvImvz8FAJVVzkx7NDWyY+x2lLiIrNjN4rPh1eQzTZ2UrCgYDZdVkXQztloU6gfa5X4Rd/Sr3+ihyX5DIkEOrWRHXjRhqWY/fScpvmVB8QTILbSQjgJCqz33c2pou/Vaf33iZWBJhmxlIV41C8pnX9Tvn4wq4wk5TnBHF596KnUapEJ5NUlPPOG6JxtidHlmQ/DLx3Sk77KwY4c4LDWlaJmShdq7jK9jBbWEOChRguq+SFfuONXo8AdbEGK+oPwJgrOfn6e9AZaI/ELRrGcKTDWyVO036K/UUNRfOxvi71eAtRphpk5hNaGXGDDHR96u+TFI0I=
X-MS-TrafficTypeDiagnostic: AM0PR09MB3732:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ok9Ld4xYCpFe+XrHe8hzUfh3TndTKJHZuKHTVGKFfU+zF6kgvTNC4GCpUThl5sCPOk8bQgg3mqlPwMXAyBrrKpLfyGMTiTh+h41Qx392saR8PUfbLBTLGmmISP90JU738cb27VelAcU28HUNOIOt5mLk1KEqYqIObCVX1+4iO9TupJy0IzIXBze3u85h8b3jBJtgNLjGRlCdZfsN+loASwpU9i71QORjs1hEwQcQ1eE9lqV5XhKRYdhMkobOuydHYFK9bXhNw57xK584xCDwFxyMLJirNQGUY6GRwPzD+B+4tRrTPrhBtCBUFJ5X697RTKePVHJfmzxjBnvRy/yKA6O6TKrR9CbDT5qVH7Yi24FbnSQj6MKdNC4KyIwR0Oi2DXjDAcaiNGdixvcCrxArReU3VIbOK6JrSife+KfeaCV4PjxnMnLaaZ2V2rxEzi75nXcmEgICoDNX5bSa5zPzBRe6Yl23g527crU5xDo1/mcKdiazC76WL2ho+S2C+K+sZjwyBRcwNff2eEJzC5DtkNUn6TzOdV3Mc+fSr9+cOXS8rSMDDK31ESxCoadZCXbtPJPxzG01q/+xHqEcxB59CZmQxZWces8eBBQbqNxdX6DYkguLe/QP2j9RtsXgw5Rg
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OszYijEMWY+DdCcssjxIagTkTZDQLWvPgorMFkosGm1/j4ifZQbDzMFpjMmB?=
 =?us-ascii?Q?gpuxe/fFR18Vr+BkQ8hmJFz//PeuQVBzp2ld5znxJ74c9hSL5IgV4KJczcBr?=
 =?us-ascii?Q?iFegE2ZTKga6kArClwS9UMmNbdF50urLRDBcXylbb1uVgQahv+bSCnE8WDHS?=
 =?us-ascii?Q?xcu6t1J/olpmKtaGLkTSmWoSZ+n66sMYBvmrsSVc/UheXu6zgAVwPfyQaTYa?=
 =?us-ascii?Q?leXmrCTFZi354ohAS8Ul+FDYN5LBy2nV+6MA56gOgXveGbItps4gnUnRoOdf?=
 =?us-ascii?Q?NztFIkv9z9iluZXpYXKqkiENDkOZDpPkytOh8O2DMF48M3WldvFE9nQK9yjg?=
 =?us-ascii?Q?52mQEH7O/1YJgG/xjewNBhvwPx8OcN5O3hibA9ndrBouipfxSsESY/fyzyJk?=
 =?us-ascii?Q?yusxloZzEw/gANxW/AOoMkkkl1WWbZ1EbfQKsEJp7F4ADYfVK6+97xbABzZO?=
 =?us-ascii?Q?KgqbO3F4F/JMNTPoqwIJ3XsSnymgOzJL7vhtbtDbikXV0U6iVYHqbR3+3cWK?=
 =?us-ascii?Q?j69nFU7Sqw2Wc/EhS6AE3Z9WDbBaqd/KIr+niOycfiuy2dlTMSDmdEBoHX9C?=
 =?us-ascii?Q?HOVQ9XojG0vKkJAAflZMPeeqh+NYcRUoR7R0VNd0UeEj9Di6JRX29dK9BNzD?=
 =?us-ascii?Q?RK1veuyQTiSX5nC7PYI08HChwC/P/1sVGk//RWCRO1/3pzazX21LqkeUKj3G?=
 =?us-ascii?Q?K8x4k5uldJA/ThImau/Lbr2y+mMArKmNWs6KnXtS+L7lkOiFI4hPUb0UhIBx?=
 =?us-ascii?Q?Gmv83ktLCRsJleIMR2ywvmDqQJ9OiK1UCB2n3JR46s3JJ6a/8LeZzKrt2uzd?=
 =?us-ascii?Q?3NEdudLCw2aaKiQtYt7moZH3KqZEfCzvbJVTLpov6dBh4Hz6Xi3UeHtlB+Wp?=
 =?us-ascii?Q?qnwol1BUKsrCfIyS5/jHRFPS1fzoukOC7zoJ8+GRY8VLLU4ChD9r+Bt448GZ?=
 =?us-ascii?Q?/wNKbZSaK0WhKNrfmVlqgYIWmWbt8++U89Ajd/mlX4t+O52KofSZfTPEXhfP?=
 =?us-ascii?Q?qV2TowOFiAxWWHRVc5sV4b3nng=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f1529ff-05e1-43cc-4081-08d9f06bfc4c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 10:14:43.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3732
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 10:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161744

recent change create a blank scope of DEPENDS for class-target,
basically leaving out all general dependencies, leading to the effect
that ruby will be shipped without the runtime dependencies of zlib,
openssl and libffi, making the corresponding gems unusable at runtime.

As the class-target scope should be appended only the correct override
is append:class-target

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ru=
by/ruby.inc
index 7cb2181c33..35d3bfd344 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5b8c8755986879=
6979806100db3f3805 \
                     "
=20
 DEPENDS =3D "zlib openssl libyaml gdbm readline libffi"
-DEPENDS:class-target:append =3D " ruby-native"
+DEPENDS:append:class-target =3D " ruby-native"
=20
 SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI =3D "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.ta=
r.gz \
--=20
2.25.1


