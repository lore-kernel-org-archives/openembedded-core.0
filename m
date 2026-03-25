Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900D8109C041
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 16:43:09 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27161.1774456979425094311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 09:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=V60nwltK;
 spf=pass (domain: ericsson.com, ip: 52.101.70.64, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHF+VkIN+GVO+EYUlehEAzldPLCo06kC9YDgPOlkGbnTIyxMX66RBFVdxWLmE16yL1is15/sLSLCcY27PBBwaf+Y5PNjUUpP3VPoYa+fI9lrGDpTFc4q9LTyNvX7CWw1Lk/+aP2SGF36VUtqT1bq5yeWccoERtn6jcBRLi9piZ9Tne7VQ33/w7ZWwhhp4TWndbUw6rTNDjiOzaCzSTNZg53BUUstVvP6x/w5uxW56IkH5AQBiRJXYA3h1UlcJCZpPsI40Mv3XYsCX6DUqY4uA0eqBYLxHvdUepUNictMoOdcORrZqQLQHtBkkvzdp1PMdvof+0e1yGshsvGOtP5qBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4lte+dWY+oQc5hfz+kedBdh798ql1hzRgxV8tB9Ogg=;
 b=bXdmTmPQjMaZulVv4fisfyZ3WrZR4uAprw0tvOWrVBsdxTQI/RKyDfkrVmFPuiLmFTcZekqucSLGdd8e184SMnvEL0gXn8kRDBbMttEzSVVZvABY5Wc7781wR/K6NnXA5mupPE4Xo10pA2syaGYRZBsIUa3BXCxujF6wkSzGl1NeioMfXmLlSKtp/sD3boWTvqQE1PId2dl71GYPtWJIuq54aBT7MJ/MnL3kJMCNTRrdzakkWn4NezHujz902RQRtTYGkeuUTVbDnutUixGg50PJPHC/9BBrJ2Q0izEJhkdT4XmQwBgU7Qf3AYl7abe1c8UIP2tasrKRcXKbhDFp5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4lte+dWY+oQc5hfz+kedBdh798ql1hzRgxV8tB9Ogg=;
 b=V60nwltKW3K0G5bmWAr61a3QZ8Ovu1Mr2M/s1g4vARyqpbHy8TKMKkMU1bl74v63hiUQCGWtFSCZBTo87jgLBIpOmnqukwFB2zeeiN7LG09oIGKxfntUeABrqFyxnC+b8rN3u77bsTnT8QBhcds494r439YzoTSKBlqBZFfBPr9iDLmbCUBreMye9Zxq9dX6yYKAt8sfbuuA8gGfi4n0sDnDwPPNUmp0yu3NjS7xicr8NTeXLGdoGvguj+ZuiL1Bcpma8Mnnm40ePoYuRaCgHOnlEjd7eVopNxPoBCmiirP+RF1mMTfA5IeAl7kYVdHaICzy+kr4b0+EvCbMYR/mPg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by OSKPR07MB10520.eurprd07.prod.outlook.com (2603:10a6:e10:9e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 16:42:55 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 16:42:55 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Topic: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Index: AQHcvEecTK7jl1ZqZUu5QJvzt2t3LrW/clsAgAAA9WA=
Date: Wed, 25 Mar 2026 16:42:55 +0000
Message-ID: 
 <PA3PR07MB107216974CEE71E160309E9E18A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
	 <20260325084021.3915804-2-daniel.turull@ericsson.com>
 <136e62fde93b3b6a61cbd476f2b19724500b8643.camel@linuxfoundation.org>
In-Reply-To: 
 <136e62fde93b3b6a61cbd476f2b19724500b8643.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|OSKPR07MB10520:EE_
x-ms-office365-filtering-correlation-id: 796cb8ff-fe8a-42e0-af5c-08de8a8d908e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|8096899003|38070700021|13003099007|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 S+1TdBvUqodtxMmSYtJA2JEHJzsWpnagT4skAciGqc331D5S04zQq4tyuEO6InlX1gWHkKVSOGSoL2EyG+Gk7c+ZELDs0kLh+7wAlsQjA28VUIHuQv+5QfuEB1dksJpb4nj7P2bhA0oxakCv89ZDqA5kkvA/c+BNN7vUExzp2o4ti1rh6qcFKdk2ys9DwxV/VCeu7FKvfrk8ya9Nwcmt0RnDviI2S9zpUW0Bsa/QrJsjQtKVVKF7KVcgMoBjfVGj0i9QlyIW/Qmn41KJ3AdAYvnELxXCMZa/vz9Ig8DTwP6olIbP5pvSnV55gCkKrz7XsSdnN14CwtcD/k+k6s5pPoRlBWhwXFxiJQEg8nDsib5yR0Ds1JHxXat/35ICLxBty4W9RA+GMCAH9i/59L1MJLALb8PjHzduPaf7YF8HnGUko2CV61/3hFBYpSg/7WbFJcWhzZWKS3pbyYP7yrcTuyYR4TymqcyQb72NCS2zZ7S25kXKicpDw8aAKprFM07u4KMExHv15FiHdG+Pwgk5KQxT9HvuuOeEbbX/fIeujpvQ9u5dS7lfeU01CDmPQAjO1aHwwHnbznUSYSGsPwhWfgUMuKJf0aI5azL9Hj9R4G9luIw9/7VqYN0nZ71L1FA4Danpu8+WskdP/pvHKJZgNyHVFacqkr/4R/B4MGX13nMA8LaFzHSSPsrOLGbH1TwKGBibYUx9+HCBNgetjjOC7PNj3CyN+ISQF9XooJkO6kEgjt6JfXcgXuqvK3iSWjZyRZOr5ICm5H3mCFex4LWikKPcFcCJlXDxteWyLHRvmZM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(8096899003)(38070700021)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?PE7TcVVgHhcAkDaIy0UCY8LR73QACR6iB248q7uo0YKc1IfHdx0wKb+7?=
 =?Windows-1252?Q?R51VVPjGGjCoiXMKHYKSaXfYuVLfRT+R0aeDi6IC3Q8ABU7S9CD0K+cF?=
 =?Windows-1252?Q?iz4GPvJzrTJnFGkevDg/lxdjK/h+ROE8JtTRYsSbyUcKmZgO+OVlVHEO?=
 =?Windows-1252?Q?vou1CCA3l/hrZ3dZg7a7tmEZ/OSYiQAwODUXdjtVFWhfD85M9ivlrA+w?=
 =?Windows-1252?Q?eSZZdhMLSHixmE/q3FYxAk2GXxtMFlT4TLWYHVh+f5l/Ha8qD6aLwGxU?=
 =?Windows-1252?Q?uM8afMUsnVtEVcNJV2D9IzaFr9tfWT8RlqbKCHULIUg/TjsXsaeQzg8l?=
 =?Windows-1252?Q?dgsaw/Dp71bjGm5V3BuJqXDyt3TwULKJRS8o+psbhfh7ym0PGKA+Zci4?=
 =?Windows-1252?Q?jKDUI+MBwBMESWSNUNbTTgJou7NFDR0qSxfLz5iUcU8PtyU7Rufy8eN+?=
 =?Windows-1252?Q?ERVgCyoS/2/cTC+g4AMUQdRHXhE4wHEDT5vgcuZfi3v3PwUEpMkYEloo?=
 =?Windows-1252?Q?haYZa57AJ+UJjsTzkeN6qvXZMmBk918mxaRYiWUPireTPgOkDca1AT9l?=
 =?Windows-1252?Q?iskNWON7TsQjZkXwDOPdOuQkRNhdSL6IzTmNVtWEZXa+tTHqZ+l77MbT?=
 =?Windows-1252?Q?VdAVhL9VTEg4dybFNRoD6qenOIa1Z5CWbl8uHWQQhrjo/yPlqTeYYd5C?=
 =?Windows-1252?Q?Bn7R/f8QeeXwGc7isX024eTEvqcBb7qmIwjO5IqouMgykXcMmt50QrtK?=
 =?Windows-1252?Q?1X2FYWY4z8npdQhmjIqEx6/SoZ7+JtXttIGKKxfxF3iV3FclCJOX4oS9?=
 =?Windows-1252?Q?aT8S2rYqDwHbjiSFQfaDJXxRbZ0eqcraWRPH9Kq46+IN/xc/yWOtGlVB?=
 =?Windows-1252?Q?PpINEZsRahCIFnYLc3dBORnKM260MMGXKDbfJ7YZp24hzNHaq8Di/UxX?=
 =?Windows-1252?Q?Bx+QkDN0d1W2C5WdBcGUS6C1cYRCesfD5t1e59rRmBhrtZGWz0N38H+8?=
 =?Windows-1252?Q?7g5wPLiZKxdiHHsXUVtQyJmrCYINLK3D9cR4qpHoMW3KaI//k5McMems?=
 =?Windows-1252?Q?+lN+GPEMWSapFttJrAguDHfmxpJvNyQfA0O8NBkrGs7dnrvyMtYjxPB6?=
 =?Windows-1252?Q?Xj+MjvDHIlbIjqh1Y9rDg/lC9CACGY0vidvN6hV05AchgjpWExqNJf7Q?=
 =?Windows-1252?Q?QiOVwDwJL+f46Fe8icSZYXZRpzhcoaPTC9S8zN7gPmhFw+CmwFdf9KF4?=
 =?Windows-1252?Q?wOr6ahGGw5ZEwfsrOyeAplKJpxM4grc0933yEn7bwa70/A0VlHnQgk0Q?=
 =?Windows-1252?Q?kOXznIHLdEEDNcAQdc1cdR8M7gAcYCGrvfTWw/xGu+Bp07DGE/642MY/?=
 =?Windows-1252?Q?cTr8Gtz+Bylpd4cXXqJtsoLG1FRXWrwR6dO2KmRsbWDPp3B4PY7aLxbC?=
 =?Windows-1252?Q?ehTlg3VzJvkYowogc3TyqGg9Mq7Aszhpn4ViAaN81WvRoj1Uw4kjdvuj?=
 =?Windows-1252?Q?cdNN4+Whp/7vDL8+dC2/34ilhqBWy1BRjyCWJ/tzxssVgIP2PKLoDWg3?=
 =?Windows-1252?Q?D0N00Lka8Mlsw+zNpiSOtlq30/cY9YHscUgx9RCqoqvXOm+tMnxTCp1A?=
 =?Windows-1252?Q?cmFk+MgB9Ly2itJnuleezv/RGWIv15BTDn5giUG33/Oaj81aGHyKRSr4?=
 =?Windows-1252?Q?W0hsywL5lC9816cv1YzzpYc1iUyRLSP/FhYmmWUFEYg8Gqb13PbpASAr?=
 =?Windows-1252?Q?fNUcJdv4yung3jw7z7YNYi+m+w3FQil3OQyELdU9vXQQ1X9kofLabDX3?=
 =?Windows-1252?Q?roGEWgoS7J04p4yGAYaZlcYnqnNSZeHW2/d/z0FN23N04eom20SHtsi1?=
 =?Windows-1252?Q?A4PeSKPZiRcBrcE2nM6oSjKC8QE9M3LB+j9z5xkOJqlj02QBVv+Haudf?=
 =?Windows-1252?Q?sy4EpqB9?=
x-ms-exchange-antispam-messagedata-1: 
 xN58GnqjsU0wFBCiVsxw9Adw4L7DwhqIwJCm7MHsimLwRQpLyv/Lt0db
Content-Type: multipart/alternative;
	boundary="_000_PA3PR07MB107216974CEE71E160309E9E18A49APA3PR07MB10721eu_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796cb8ff-fe8a-42e0-af5c-08de8a8d908e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 16:42:55.2925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2dZh16cwC+rhJqewRgqPjfpWv/jR4ZH9yBhPpvo2+0Q7PGXz8sid4JqjYBCc1L0PxtiY74vYZmK2aJ5noQ/jmEE5K50AvVDNwjJglfOtCKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR07MB10520
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 16:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233928

--_000_PA3PR07MB107216974CEE71E160309E9E18A49APA3PR07MB10721eu_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sure,
I=92ll try to send a new patch tomorrow with your suggestion and all the co=
mments that I have received. We are running the testimage with ltp for qemu=
arm64, qemux86-64 and qemuriscv64.

Best regards,
Daniel
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
Sent: Wednesday, March 25, 2026 5:36 PM
To: Daniel Turull <daniel.turull@ericsson.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Cc: pratik.farkase@est.tech <pratik.farkase@est.tech>
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk

On Wed, 2026-03-25 at 09:40 +0100, daniel.turull@ericsson.com wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> runltp has been removed from ltp and kirk is the official tool to
> invoke linux ltp tests.
>
> See:
> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Flinux-test-project%2Fltp%2Fcommit%2F6efd3605dc005c3ed135b463f182174=
e24bdce1b&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7Cca4e7536591a44feb=
4fd08de8a8c9c1f%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C63910053369160=
6542%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl=
AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dcgqr%2F=
rR99Ty%2F75pasLCYawpw0qV%2FAZ4sXUDWH%2B2ka9c%3D&reserved=3D0<https://github=
.com/linux-test-project/ltp/commit/6efd3605dc005c3ed135b463f182174e24bdce1b=
>
>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> Assisted-by: Claude, Anthropic
> ---
>  meta/lib/oeqa/runtime/cases/ltp.py        | 16 ++++++-------
>  meta/lib/oeqa/runtime/cases/ltp_stress.py | 16 +++++++++----
>  meta/lib/oeqa/utils/logparser.py          | 29 +++++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20260130.bb |  1 +
>  4 files changed, 50 insertions(+), 12 deletions(-)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/c=
ases/ltp.py
> index 0ffdbe23e4..11c4814090 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
> @@ -12,7 +12,7 @@ import pprint
>  from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.runtime.decorator.package import OEHasPackage
> -from oeqa.utils.logparser import LtpParser
> +from oeqa.utils.logparser import LtpKirkParser
>
>  class LtpTestBase(OERuntimeTestCase):
>
> @@ -66,9 +66,9 @@ class LtpTest(LtpTestBase):
>
>      def runltp(self, ltp_group):
>              # LTP appends to log files, so ensure we start with a clean =
log
> -            self.target.deleteFiles("/opt/ltp/results/", ltp_group)
> +            self.target.deleteFiles("/opt/ltp/results/", "%s.json" % ltp=
_group)
>
> -            cmd =3D '/opt/ltp/runltp -f %s -q -r /opt/ltp -l /opt/ltp/re=
sults/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
> +            cmd =3D 'kirk --run-suite %s --json-report /opt/ltp/results/=
%s.json -n' % (ltp_group, ltp_group)
>
>              starttime =3D time.time()
>              (status, output) =3D self.target.run(cmd, timeout=3D1200)
> @@ -87,14 +87,14 @@ class LtpTest(LtpTestBase):
>              self.extras['ltpresult.rawlogs']['log'] =3D self.extras['ltp=
result.rawlogs']['log'] + output
>
>              # Copy the machine-readable test results locally so we can p=
arse it
> -            dst =3D os.path.join(self.ltptest_log_dir, ltp_group)
> -            remote_src =3D "/opt/ltp/results/%s" % ltp_group
> +            dst =3D os.path.join(self.ltptest_log_dir, "%s.json" % ltp_g=
roup)
> +            remote_src =3D "/opt/ltp/results/%s.json" % ltp_group
>              (status, output) =3D self.target.copyFrom(remote_src, dst, T=
rue)
>              if status:
>                  msg =3D 'File could not be copied. Output: %s' % output
>                  self.target.logger.warning(msg)
>
> -            parser =3D LtpParser()
> +            parser =3D LtpKirkParser()
>              results, sections  =3D parser.parse(dst)
>
>              sections['duration'] =3D int(endtime-starttime)
> @@ -113,9 +113,9 @@ class LtpTest(LtpTestBase):
>
>      # LTP runtime tests
>      @OETestDepends(['ssh.SSHTest.test_ssh'])
> -    @OEHasPackage(["ltp"])
> +    @OEHasPackage(["ltp", "python3-kirk"])
>      def test_ltp_help(self):
> -        (status, output) =3D self.target.run('/opt/ltp/runltp --help')
> +        (status, output) =3D self.target.run('kirk --help')
>          msg =3D 'Failed to get ltp help. Output: %s' % output
>          self.assertEqual(status, 0, msg=3Dmsg)
>
> diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/ru=
ntime/cases/ltp_stress.py
> index ce6f4bf59d..cf84ec1182 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
> @@ -13,7 +13,7 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.runtime.decorator.package import OEHasPackage
>  from oeqa.core.decorator.data import skipIfQemu
> -from oeqa.utils.logparser import LtpParser
> +from oeqa.utils.logparser import LtpKirkParser
>
>  class LtpStressBase(OERuntimeTestCase):
>
> @@ -60,7 +60,7 @@ class LtpStressBase(OERuntimeTestCase):
>  class LtpStressTest(LtpStressBase):
>
>      def runltp(self, stress_group):
> -            cmd =3D '/opt/ltp/runltp -f %s -p -q 2>@1 | tee /opt/ltp/res=
ults/%s' % (stress_group, stress_group)
> +            cmd =3D 'kirk --run-suite %s --json-report /opt/ltp/results/=
%s.json -n' % (stress_group, stress_group)
>              starttime =3D time.time()
>              (status, output) =3D self.target.run(cmd)
>              endtime =3D time.time()
> @@ -69,8 +69,16 @@ class LtpStressTest(LtpStressBase):
>
>              self.extras['ltpstressresult.rawlogs']['log'] =3D self.extra=
s['ltpstressresult.rawlogs']['log'] + output
>
> -            parser =3D LtpParser()
> -            results, sections  =3D parser.parse(os.path.join(self.ltptes=
t_log_dir, "%s" % stress_group))
> +            # Copy kirk JSON report from target
> +            dst =3D os.path.join(self.ltptest_log_dir, "%s.json" % stres=
s_group)
> +            remote_src =3D "/opt/ltp/results/%s.json" % stress_group
> +            (status, output) =3D self.target.copyFrom(remote_src, dst, T=
rue)
> +            if status:
> +                msg =3D 'File could not be copied. Output: %s' % output
> +                self.target.logger.warning(msg)
> +
> +            parser =3D LtpKirkParser()
> +            results, sections  =3D parser.parse(dst)
>
>              runtime =3D int(endtime-starttime)
>              sections['duration'] =3D runtime
> diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logpa=
rser.py
> index c479864162..a907421fab 100644
> --- a/meta/lib/oeqa/utils/logparser.py
> +++ b/meta/lib/oeqa/utils/logparser.py
> @@ -5,6 +5,7 @@
>  #
>
>  import enum
> +import json
>  import os
>  import re
>
> @@ -158,6 +159,34 @@ class LtpParser:
>          return results, section
>
>
> +class LtpKirkParser:
> +    """Parse kirk JSON report into the same format as LtpParser."""
> +
> +    STATUS_MAP =3D {
> +        "pass": "PASSED",
> +        "fail": "FAILED",
> +        "brok": "FAILED",
> +        "conf": "SKIPPED",
> +        "warn": "PASSED",
> +    }
> +
> +    def parse(self, jsonfile):
> +        with open(jsonfile, errors=3D"replace") as f:
> +            report =3D json.load(f)
> +
> +        results =3D {}
> +        section =3D {"duration": 0, "log": ""}
> +
> +        for entry in report.get("results", []):
> +            results[entry["test_fqn"]] =3D self.STATUS_MAP.get(entry.get=
("status", ""), "FAILED")
> +            test =3D entry.get("test", {})
> +            section["log"] +=3D test.get("log", "")
> +
> +        section["duration"] =3D int(report.get("stats", {}).get("runtime=
", 0))
> +
> +        return results, section
> +
> +

FWIW we can probably just update the LtpParser class directly rather
than creating a wrapper around it since runltp will be no more in the
next release anyway.

Cheers,

Richard

--_000_PA3PR07MB107216974CEE71E160309E9E18A49APA3PR07MB10721eu_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sure,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I=92ll try to send a new patch tomorrow with your suggestion and all the co=
mments that I have received. We are running the testimage with ltp for qemu=
arm64, qemux86-64 and qemuriscv64.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Best regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Daniel</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif;"><b>From:</b>&nbsp;openembedded-core@lists.openembedded.org &lt=
;openembedded-core@lists.openembedded.org&gt; on behalf of Richard Purdie v=
ia lists.openembedded.org &lt;richard.purdie=3Dlinuxfoundation.org@lists.op=
enembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, March 25, 2026 5:36 PM<br>
<b>To:</b>&nbsp;Daniel Turull &lt;daniel.turull@ericsson.com&gt;; openembed=
ded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.or=
g&gt;<br>
<b>Cc:</b>&nbsp;pratik.farkase@est.tech &lt;pratik.farkase@est.tech&gt;<br>
<b>Subject:</b>&nbsp;Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with ki=
rk</span>
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;">On Wed, 2026-03-25 at 0=
9:40 +0100, daniel.turull@ericsson.com wrote:<br>
&gt; From: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt;<br>
&gt; runltp has been removed from ltp and kirk is the official tool to<br>
&gt; invoke linux ltp tests.<br>
&gt;<br>
&gt; See:<br>
&gt; <a href=3D"https://github.com/linux-test-project/ltp/commit/6efd3605dc=
005c3ed135b463f182174e24bdce1b">
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Flinux-test-project%2Fltp%2Fcommit%2F6efd3605dc005c3ed135b463f182174e2=
4bdce1b&amp;data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7Cca4e7536591a44f=
eb4fd08de8a8c9c1f%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C0%7C639100533691=
606542%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dc=
gqr%2FrR99Ty%2F75pasLCYawpw0qV%2FAZ4sXUDWH%2B2ka9c%3D&amp;reserved=3D0</a><=
br>
&gt;<br>
&gt; Signed-off-by: Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
&gt; Assisted-by: Claude, Anthropic<br>
&gt; ---<br>
&gt; &nbsp;meta/lib/oeqa/runtime/cases/ltp.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | 16 ++++++-------<br>
&gt; &nbsp;meta/lib/oeqa/runtime/cases/ltp_stress.py | 16 +++++++++----<br>
&gt; &nbsp;meta/lib/oeqa/utils/logparser.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | 29 +++++++++++++++++++++++<br>
&gt; &nbsp;meta/recipes-extended/ltp/ltp_20260130.bb |&nbsp; 1 +<br>
&gt; &nbsp;4 files changed, 50 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtim=
e/cases/ltp.py<br>
&gt; index 0ffdbe23e4..11c4814090 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/ltp.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/ltp.py<br>
&gt; @@ -12,7 +12,7 @@ import pprint<br>
&gt; &nbsp;from oeqa.runtime.case import OERuntimeTestCase<br>
&gt; &nbsp;from oeqa.core.decorator.depends import OETestDepends<br>
&gt; &nbsp;from oeqa.runtime.decorator.package import OEHasPackage<br>
&gt; -from oeqa.utils.logparser import LtpParser<br>
&gt; +from oeqa.utils.logparser import LtpKirkParser<br>
&gt; &nbsp;<br>
&gt; &nbsp;class LtpTestBase(OERuntimeTestCase):<br>
&gt; &nbsp;<br>
&gt; @@ -66,9 +66,9 @@ class LtpTest(LtpTestBase):<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; def runltp(self, ltp_group):<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; # LTP appends to log files, so ensure we start with a clean log<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
lf.target.deleteFiles(&quot;/opt/ltp/results/&quot;, ltp_group)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
lf.target.deleteFiles(&quot;/opt/ltp/results/&quot;, &quot;%s.json&quot; % =
ltp_group)<br>
&gt; &nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cm=
d =3D '/opt/ltp/runltp -f %s -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d =
/opt/ltp' % (ltp_group, ltp_group)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cm=
d =3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s.json -n' % (lt=
p_group, ltp_group)<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; starttime =3D time.time()<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (status, output) =3D self.target.run(cmd, timeout=3D1200)<br>
&gt; @@ -87,14 +87,14 @@ class LtpTest(LtpTestBase):<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; self.extras['ltpresult.rawlogs']['log'] =3D self.extras['ltpresult.rawlo=
gs']['log'] + output<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; # Copy the machine-readable test results locally so we can parse it<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ds=
t =3D os.path.join(self.ltptest_log_dir, ltp_group)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
mote_src =3D &quot;/opt/ltp/results/%s&quot; % ltp_group<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ds=
t =3D os.path.join(self.ltptest_log_dir, &quot;%s.json&quot; % ltp_group)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
mote_src =3D &quot;/opt/ltp/results/%s.json&quot; % ltp_group<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (status, output) =3D self.target.copyFrom(remote_src, dst, True)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if status:<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; msg =3D 'File could not be copied. Output: %s' %=
 output<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; self.target.logger.warning(msg)<br>
&gt; &nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
rser =3D LtpParser()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
rser =3D LtpKirkParser()<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; results, sections&nbsp; =3D parser.parse(dst)<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; sections['duration'] =3D int(endtime-starttime)<br>
&gt; @@ -113,9 +113,9 @@ class LtpTest(LtpTestBase):<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; # LTP runtime tests<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; @OETestDepends(['ssh.SSHTest.test_ssh'])<br>
&gt; -&nbsp;&nbsp;&nbsp; @OEHasPackage([&quot;ltp&quot;])<br>
&gt; +&nbsp;&nbsp;&nbsp; @OEHasPackage([&quot;ltp&quot;, &quot;python3-kirk=
&quot;])<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; def test_ltp_help(self):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (status, output) =3D self.=
target.run('/opt/ltp/runltp --help')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (status, output) =3D self.=
target.run('kirk --help')<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg =3D 'Failed to ge=
t ltp help. Output: %s' % output<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; self.assertEqual(stat=
us, 0, msg=3Dmsg)<br>
&gt; &nbsp;<br>
&gt; diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa=
/runtime/cases/ltp_stress.py<br>
&gt; index ce6f4bf59d..cf84ec1182 100644<br>
&gt; --- a/meta/lib/oeqa/runtime/cases/ltp_stress.py<br>
&gt; +++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py<br>
&gt; @@ -13,7 +13,7 @@ from oeqa.runtime.case import OERuntimeTestCase<br>
&gt; &nbsp;from oeqa.core.decorator.depends import OETestDepends<br>
&gt; &nbsp;from oeqa.runtime.decorator.package import OEHasPackage<br>
&gt; &nbsp;from oeqa.core.decorator.data import skipIfQemu<br>
&gt; -from oeqa.utils.logparser import LtpParser<br>
&gt; +from oeqa.utils.logparser import LtpKirkParser<br>
&gt; &nbsp;<br>
&gt; &nbsp;class LtpStressBase(OERuntimeTestCase):<br>
&gt; &nbsp;<br>
&gt; @@ -60,7 +60,7 @@ class LtpStressBase(OERuntimeTestCase):<br>
&gt; &nbsp;class LtpStressTest(LtpStressBase):<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; def runltp(self, stress_group):<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cm=
d =3D '/opt/ltp/runltp -f %s -p -q 2&gt;@1 | tee /opt/ltp/results/%s' % (st=
ress_group, stress_group)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cm=
d =3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s.json -n' % (st=
ress_group, stress_group)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; starttime =3D time.time()<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; (status, output) =3D self.target.run(cmd)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; endtime =3D time.time()<br>
&gt; @@ -69,8 +69,16 @@ class LtpStressTest(LtpStressBase):<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; self.extras['ltpstressresult.rawlogs']['log'] =3D self.extras['ltpstress=
result.rawlogs']['log'] + output<br>
&gt; &nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
rser =3D LtpParser()<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
sults, sections&nbsp; =3D parser.parse(os.path.join(self.ltptest_log_dir, &=
quot;%s&quot; % stress_group))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
Copy kirk JSON report from target<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ds=
t =3D os.path.join(self.ltptest_log_dir, &quot;%s.json&quot; % stress_group=
)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
mote_src =3D &quot;/opt/ltp/results/%s.json&quot; % stress_group<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (s=
tatus, output) =3D self.target.copyFrom(remote_src, dst, True)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if=
 status:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; msg =3D 'File could not be copied. Output: %s' % outp=
ut<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; self.target.logger.warning(msg)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pa=
rser =3D LtpKirkParser()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
sults, sections&nbsp; =3D parser.parse(dst)<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; runtime =3D int(endtime-starttime)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; sections['duration'] =3D runtime<br>
&gt; diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/lo=
gparser.py<br>
&gt; index c479864162..a907421fab 100644<br>
&gt; --- a/meta/lib/oeqa/utils/logparser.py<br>
&gt; +++ b/meta/lib/oeqa/utils/logparser.py<br>
&gt; @@ -5,6 +5,7 @@<br>
&gt; &nbsp;#<br>
&gt; &nbsp;<br>
&gt; &nbsp;import enum<br>
&gt; +import json<br>
&gt; &nbsp;import os<br>
&gt; &nbsp;import re<br>
&gt; &nbsp;<br>
&gt; @@ -158,6 +159,34 @@ class LtpParser:<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return results, secti=
on<br>
&gt; &nbsp;<br>
&gt; &nbsp;<br>
&gt; +class LtpKirkParser:<br>
&gt; +&nbsp;&nbsp;&nbsp; &quot;&quot;&quot;Parse kirk JSON report into the =
same format as LtpParser.&quot;&quot;&quot;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; STATUS_MAP =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pass&quot;: &quot;PA=
SSED&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fail&quot;: &quot;FA=
ILED&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;brok&quot;: &quot;FA=
ILED&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;conf&quot;: &quot;SK=
IPPED&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;warn&quot;: &quot;PA=
SSED&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; def parse(self, jsonfile):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; with open(jsonfile, errors=
=3D&quot;replace&quot;) as f:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
port =3D json.load(f)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; results =3D {}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; section =3D {&quot;duratio=
n&quot;: 0, &quot;log&quot;: &quot;&quot;}<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for entry in report.get(&q=
uot;results&quot;, []):<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
sults[entry[&quot;test_fqn&quot;]] =3D self.STATUS_MAP.get(entry.get(&quot;=
status&quot;, &quot;&quot;), &quot;FAILED&quot;)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; te=
st =3D entry.get(&quot;test&quot;, {})<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
ction[&quot;log&quot;] +=3D test.get(&quot;log&quot;, &quot;&quot;)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; section[&quot;duration&quo=
t;] =3D int(report.get(&quot;stats&quot;, {}).get(&quot;runtime&quot;, 0))<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return results, section<br=
>
&gt; +<br>
&gt; +<br>
<br>
FWIW we can probably just update the LtpParser class directly rather<br>
than creating a wrapper around it since runltp will be no more in the<br>
next release anyway.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</div>
</div>
</body>
</html>

--_000_PA3PR07MB107216974CEE71E160309E9E18A49APA3PR07MB10721eu_--

