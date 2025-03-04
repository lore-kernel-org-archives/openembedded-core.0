Return-Path: <johanneskauffmann@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE64C282C6
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:29:15 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.103.33.57])
 by mx.groups.io with SMTP id smtpd.web11.21687.1741094951014093809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 05:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hotmail.com header.s=selector1 header.b=A/uBpaRJ;
 spf=pass (domain: hotmail.com, ip: 52.103.33.57, mailfrom: johanneskauffmann@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvgwBd0jCdHQ8/lTKqkh89I7b8MVm1D9YcsZs5prcgLyO22lvQaLMdhd9x2VFDDkYYz1rDIqr1dTKijvv2KPfLkKplLQ3GD36FCmfSYzsWuUbF02BtwrU4peyIcfJEM27pUHubq9bW38tuErjD092dCo6a0mglB+E+6TSzaT7AKH2ZB4YK3UJ37AHxLpyi7VwbVU6Wx8k3WQFcUY/gcmZZyP0mt9xBRqIDvfpnzi7tWMBMaSw41gy3jGUlYHuQCpB5kOLeDoX8P7k9K2Sk1jV3nO5SEOAXWbJ780qfmM6xHS+hYqkJ27NZYoPJfeAQ9n7jMq4l0KsizqzEVTyPwP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fpCSgHZyHWmH9MHvOUBmO4NzbUtqOAL+cHYR73See4=;
 b=YF/wy+SPOzkfxgkdwhZO1JAXidfdkRSwNVAuq5bAvji012X63zUrDzzTaK2gSjqAWCDi5XNj8mmRE/yH/e5ko6axWABZT3hc41uDUHT0qqaSfx1p5ldP/Tb0wEMk757meG6hcyn+W962mQD9dcj3fFKEExtpNysajXnnri5LlIB8P12j84iXzDLtPBKA+0KkxhE0r5apXUDy7Eqi7vlB0CgW65KNLSeBfDaUQPa8RFCXB4PH7/stOnYuCSthcOGGLRaYAX/3x5pAvQIliQw+8S5IyLgfLLoU3GBlAvf5Xuxu3SQV3lHrA4uZMx5p2wVjWdpBF9Urd9OUpV+qUOjUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fpCSgHZyHWmH9MHvOUBmO4NzbUtqOAL+cHYR73See4=;
 b=A/uBpaRJ46TvTRs6qZdOP+dYBKbmb1PCneLA2K0lxdWeZUiRXSp7s/IfLeAmQXNjlFxPNOnilT2AW/b1orQAkEej7EggScUF6nuatIXVC1jgSOK8kdD19Q/o93qiXl0irYdBb7sswHI2z7IenFCQGuUbj4LeFXT27bKMpjEk0yLN5Z7nY+UJVEn2EN60ysUaVfaaXKBwe9dK7yVKuYtgib/zc1mGfnwZnrqIsoGm1ws7O0lWDiYdx6rNwCj857PK5gSaF6UAw1LAi32A3bcHt+LicQcPWwAkSjF3LyLrwzS5mx20MHm53+t1eRlsSpNXRyQTkMryxJeIGlfEUC6Kdw==
Received: from PAWPR02MB9054.eurprd02.prod.outlook.com (2603:10a6:102:337::21)
 by PA6PR02MB10712.eurprd02.prod.outlook.com (2603:10a6:102:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 13:29:08 +0000
Received: from PAWPR02MB9054.eurprd02.prod.outlook.com
 ([fe80::fc9d:63d6:522a:5540]) by PAWPR02MB9054.eurprd02.prod.outlook.com
 ([fe80::fc9d:63d6:522a:5540%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 13:29:08 +0000
Message-ID: 
 <PAWPR02MB905471C688941EB47A97DDACA6C82@PAWPR02MB9054.eurprd02.prod.outlook.com>
Date: Tue, 4 Mar 2025 14:29:06 +0100
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] mesa: Fix missing GLES3 headers in SDK sysroot
Content-Language: nl-NL
From: Johannes Kauffmann <johanneskauffmann@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0042.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::21) To PAWPR02MB9054.eurprd02.prod.outlook.com
 (2603:10a6:102:337::21)
X-Microsoft-Original-Message-ID: 
 <2ec8ab84-0c45-48d3-a830-08fbc25e584e@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWPR02MB9054:EE_|PA6PR02MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: ade9525c-4786-4b6a-5d3f-08dd5b208a11
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|15080799006|5062599005|6090799003|5072599009|461199028|8060799006|7092599003|19110799003|12071999003|41001999003|21061999003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TExsT3FiMlhFSnJzVVJHTC9IaDJXYnpkei8zbEY1NlYwTHBteW9ieWZBZzdJ?=
 =?utf-8?B?ejlLS1EwSUFRajJwSU1QZlMreWswWmN6QnFTaW12M1cvMm5JN2dSWFlnbzF4?=
 =?utf-8?B?c2ZEOGcrRmNOdzM3eFdsZ1MxUVBqVW05dkVrV0F5bTh4bmFXcnBqQTlJSjN1?=
 =?utf-8?B?RGo4V0dRaHJhZlEwUFkxMGp3WGdicC8wZTQ0cnVZSlJNdVowNy9WRGpLZnFJ?=
 =?utf-8?B?M295VWR3dEF0YW55eHBmYm1HS3FhN3ZYcTNIeSt1MitiUlI0Q0FBTm5BVldI?=
 =?utf-8?B?WWdtSzNQRkFHYW91WGo5d1dzZmRLak91bFNXZDlJR2UwRDlEM01jcW9LUEZ3?=
 =?utf-8?B?MEk0eVVYQUZCNkNCTkMydnBMcUx2WjZHa2V1dFRNc2UrWFNIRE9HL1ZaeGoy?=
 =?utf-8?B?ekYvbGhtZDFFRE5seWdUNzVDKzJrcnJDbGdaTmlDODlaMHdlV0VDNFEyaWR0?=
 =?utf-8?B?d1VPbjBla3ZiOXBtbGpiSWV3VG92b1NzWDJFUll4MkhmZHNMdDFaWDQrczJT?=
 =?utf-8?B?Qkk2Sk9nVkwxdU1oRGZjR3FMbENUN3hxVThTUkRyQmtIcUxsVm5kNkZUbllq?=
 =?utf-8?B?NkkzTXlzcFA1aTUvMmJia0dlNmxWVXAvaTk3NVloemVUZnZZUGE5V0x5L2tO?=
 =?utf-8?B?M24rdVV5dVdnUndNa0dOYXR6THd6dnptckZCUVRnTXlvejd6bmgwWGQxaTc2?=
 =?utf-8?B?QnVLbnVKVUZEVmJCNVpySWowQUQ0U1A0MXhFZnk2MjNPV0lITDIwM1VFaGd3?=
 =?utf-8?B?S1ozdTNRWFo2MUw4c3VlOXN6aVN2cEVaUnVuNFdBRktsdXBJT2VMRitPTE1B?=
 =?utf-8?B?VUVmM2U1Z005OW1hWVo5YS94TGpDS2o3RmRwVmJMZ05tYitMcVprblpHeE1y?=
 =?utf-8?B?YjNxdGY3bVljZzFMam5QVzJwS3dCTU5BdXdselYvclBQQldoNEVlcWlsQmNq?=
 =?utf-8?B?R3c3Q2FaNVY5S2VmTmdOMnc4VEVvSXhrUW9wTk4yZnFROUo2NGZxYStRQnJP?=
 =?utf-8?B?Zm5zQ2xrbEpVNGFCR2xnSGdZYTRGZkxxWE1HQ2lxOHpQOU1ydzAwKzBGSGY0?=
 =?utf-8?B?bGx4Z3BIY3A0dm9YWExCbzh4ZU1qMXZuUHB5RkpjMXNPUTk0Tnk3RTZZNmNN?=
 =?utf-8?B?UXpXZ0hqSFcwUDgzeTdaV2piOTU0cE5NZTdMME5oVlhaakZtR2JWZi91a2hI?=
 =?utf-8?B?a0NDaDlMSVY0bWl5NjN0Z1ZiUkNKYkVmQ3lSY2ZHeHcwVHFhZ3ByRElRVFZo?=
 =?utf-8?B?UElncDNxRlQzbzFPMktyRkpTdlhaRmkwTW9MNGFRT2JmRm1yTFEvZFF5Wktj?=
 =?utf-8?B?ZUtSZFhxY0Y0VnV0RFMwTmtZWXZZeVBibThBbngxSW9WdkVmTG0vWFYvc2ph?=
 =?utf-8?B?TW1PcmlUNG9mdmdSU2RHR05tSDJ1UGpEVmlFYmFtSkd0ZWxLOEp2ak1MeUg4?=
 =?utf-8?B?amZ1ZjJsTndzMXBTN05EcU5id1ladCtPbmpVVytOZDg3Nm5XRktBVVlUd2Zz?=
 =?utf-8?B?Y2NuY3pSVk5lWmZ6RE5XRnh5cllBcmk2Vm9ZUnZLVjJUQnVGUTM2WW9Hb0tH?=
 =?utf-8?B?ejVra0ZBSGF3Sys2VHd6SFVJMFYrQ2RsNTJQekU3cXFLVTFkbTJwSkRJcktJ?=
 =?utf-8?Q?9f1rBNWfJqSiN+Vov8rDwhFUVhdlwo11skXlJ8jrzR0M=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mi9Od2s1alZqc25PRnJYTElvTzAvNXNXeHpmNVlSbUV4dFhIZkh5VXc5Y1dr?=
 =?utf-8?B?ZG80RzJ2S09mNzdReWo5dFg4UklZMk0yc3kvU0dNZFkzenFvOVA0ZzFiYVRM?=
 =?utf-8?B?NUtMVTdxclJZSHVBZFhKb0ZDSTFiSlh4Rzg5VmZHL2Z0bVpPc0JFYjV1VG95?=
 =?utf-8?B?dnJkWUVVQ0dhOS9hM2JaMFAvSldhcnRPTFlpUXAvdFhoRWxadHNLTzh4Y2hp?=
 =?utf-8?B?S0FFeUg2NnJvTEVsOEkxaUt3WFNmNDZXNUhwWlYrZStoWEF0T2IzOGcxdkNE?=
 =?utf-8?B?M1R3c2w4RXhVSlkrT3AyN3NRWHdYc001OVJ0Tk0rT0R0a3hMcjAycVc1dGp1?=
 =?utf-8?B?SG9zNUI0R0JMRXh1dS9PQWxjVVVxWWt6Ni8rMGMvOXVkNWVJbmQ5V05pcitt?=
 =?utf-8?B?RDk1Vlk0NzBwSmJNc28rVUE3SVJjeUEwQXhVUTBacDA1TXFMK1NnZVBScmZ6?=
 =?utf-8?B?S2lQT2c4WDRvWFd5TklTaFNyOWlIWHdzME93aFBRRmxMNVhuWUZRYzNCVDhB?=
 =?utf-8?B?emJEOFFtNGdNZUlrbGk0RlJMZmdzMURsSm1jeXlVdi9pd2hnSEFnaURkWmx6?=
 =?utf-8?B?cjNEVnRwMlBId3B2UUYzNURwNHJMRGVJeW9MQzN0L2lUY3dKQ1JiWkcrR1pQ?=
 =?utf-8?B?Y2hEdHV5VHZQT1RLcFUvODBwVlN1b2U2TllGcE8wYm43ZzF5ajFLQVh1NGth?=
 =?utf-8?B?MU9jL3VsVGMvM2VkTzEyK2NIS0lpRDNIRHRQQ1Q0bUdSbzhVVkNxdlNBQXJ5?=
 =?utf-8?B?aVAwWGV5K0lHaUdBeHBEamFHVERCc1R1WFRhbWYxNlJ5S2VuellMSDVRdzV5?=
 =?utf-8?B?YVRDWUMrd0tycHhXY2VLVzJqdkErWUY1TW9Md3VLNDlma2ZmOVd1dEcwejJF?=
 =?utf-8?B?SXF0U0JJWEJoWlVTcVdISVdtQ2NUeHM2SXVGbHBjbTRtWnlBY243d09NZWdv?=
 =?utf-8?B?M1VVQUxqcnBMWGJIWmV5b0FCdm02NkxYNkd0MkdLSFplZkJjRUJLVjJMUmU4?=
 =?utf-8?B?alJDZ1NuY28zOEJmSHNpNTNnMVdwWUo3V3hMZFJMK0ZGVE9ETURRUDZzT25T?=
 =?utf-8?B?VUI1aXhBL0V5SnZOL1pQaUNZbDBmSlZ0R0sxcjI3RFh6S3NtMExHSjJzbDZ6?=
 =?utf-8?B?c0ZtZTdBT2VGNGFjbjVXd005SWtoREhWem9CK2twUzB5aTYwU1dWU2tqOXlT?=
 =?utf-8?B?ZjJveFFWWUsxT3FBR3NLQ1pGVFAyek5EdWh2YjNvNlpZWUpxdG1kUTBsWjRn?=
 =?utf-8?B?T1p0bkUvaVMzZ2VhaXJ0VTk2Q3JaYTMrc0tNRE01QndpY0Y2UUt2R2hjb3B5?=
 =?utf-8?B?Z1E1VTBYV1pwYkFqR1lkemFkUXVpZ1RLdlpmdnAwdDFEc0NscWVvaGRxWWlt?=
 =?utf-8?B?OFVPTGVWNXMxWFpZMXF1TVFXSmZ1L2xnSUM1czlsWjdJQ2NFVVZ4S09EZ2Uw?=
 =?utf-8?B?SEphdDBham5IWFRmYm1RRm1XRVhNVW4xdHF2bjY2T1dwa20yaVpheWRIL0Ru?=
 =?utf-8?B?OXdWeUd1UEtXNFJHWGJOcFcxMlAybXpTOC9Ic04rUGRpcmhHeU5KRy8zeGZL?=
 =?utf-8?B?MXUvNitxOWx0QytUSU9pR2w1MkxRYmFIQnpST01MdmNUSkErVzVqZ0FOc1Z3?=
 =?utf-8?B?SnBRdFVTaVZ6bVk4SzVzckp6bkJzZCszZDhhQkhtUnZWa0JYK3gwVWRaK3k2?=
 =?utf-8?B?YWd3QnJ0TW1MRk9DVk9JK1NSREUrUWxyd2FJMWlLN3djbVhScWtJd0Z3PT0=?=
X-OriginatorOrg: sct-15-20-7828-19-msonline-outlook-12d23.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ade9525c-4786-4b6a-5d3f-08dd5b208a11
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9054.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:29:07.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 13:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212283


Building weston with core-image-weston SDK fails:
```
../libweston/renderer-gl/gl-shader-config-color-transformation.c:29:10: fatal error: GLES3/gl3.h: No such file or directory
   29 | #include <GLES3/gl3.h>
      |          ^~~~~~~~~~~~~
```

Both GLES2 and GLES3 implementations are contained in libGLESv2.so.2,
which is packaged in libgles2-mesa. However, the headers are split
between libgles2-mesa-dev and libgles3-mesa-dev, which is why the
GLES3 headers end up missing in the SDK sysroot.

Add a dependency so the GLES3 headers are properly associated with
the GLES3 implementation.

(From OE-Core rev: 7e1308ec413e69a8427ac5998431005d9e4b8033)

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Johannes Kauffmann <johanneskauffmann@hotmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index afac8014fe..3c85a3ac55 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -191,6 +191,11 @@ RDEPENDS:${PN}-dev = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"

+# GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
+# Add a dependency so the GLES3 dev package is associated with its implementation.
+RDEPENDS:libgles2-mesa += "libgles3-mesa"
+ALLOW_EMPTY:libgles3-mesa = "1"
+
 RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"

 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-- 
2.43.0


