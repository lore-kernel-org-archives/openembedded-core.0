Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D67C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:22:19 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.46])
 by mx.groups.io with SMTP id smtpd.web10.101.1668788531729681590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:22:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LdbeZ8Rj;
 spf=pass (domain: arm.com, ip: 40.107.104.46, mailfrom: anton.antonov@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsPYfB+ET1fysselbzfJ0pACMfh5SmNezeR7m1lG+hc=;
 b=LdbeZ8RjQlneHRsdKAOinKQhSEEQyVZULy9yDNEdBG4Hd7re4+ND57mw/DYvfUKCX/CeWppNGCk6T6lGqNlw8VbeBSNCxTFjeU0IlyBb328TDQWmW6U/bDdpl4c1rOnPkKBc10dalYo/uRhZS7ack/Fqz0b10sHdDEKVSbb5Kww=
Received: from AS9PR06CA0397.eurprd06.prod.outlook.com (2603:10a6:20b:461::8)
 by GV1PR08MB7915.eurprd08.prod.outlook.com (2603:10a6:150:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 16:22:08 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::97) by AS9PR06CA0397.outlook.office365.com
 (2603:10a6:20b:461::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 16:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 16:22:07 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Fri, 18 Nov 2022 16:22:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 492e4a64c0dae119
X-CR-MTA-TID: 64aa7808
Received: from e3db11f0bf1c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C7F70261-A0E7-4413-801F-0BD1E4B679C6.1;
	Fri, 18 Nov 2022 16:22:00 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3db11f0bf1c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 18 Nov 2022 16:22:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS0cS3dfBb2h/zHFJ6yPmoMPaEIj7rKKl+2N5Hah21/H96TDmFDu7w8G56T22p8QHdapeAoj3rJ27oq1F65SpUCY/eb07xZ5xA0IhhSSs2OsuYpgExSZkA6mmIA6oRVPjx/fBzSbOCA/mIJUse5bVF1XnxB8U/j4CN+Kzpzd07nFchKt9cWKQIGY9ieQ4wwmTyqUAzGyp/1ssHU9HIdzsJJj26t7qkHCIH6cDQBoTIqYyL6pglTgOHYeEwBbO6pBOdw2GM3hipNr/XOnXAACRWZHJFv708IrdpfCQzTaVWhsH0ggBiGt+d1kumiZb0Vz8bDXXJkhnX9WNWb3mMURrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsPYfB+ET1fysselbzfJ0pACMfh5SmNezeR7m1lG+hc=;
 b=jIcpWIj7bKbKYP4WzNRNML3tfMMVS0BDFeQ3N//gDShK9//Rdy9OVgZK7R8OTLDUiywdU28I7C//TQ5mFdgVWVnHvshNa2bnZ7e6bRKBTRfa6yBIxnSqtFeSUVGNd8ep2Qe5P2AHOaMN8hR93hxfuXu0WWek/XX2oGVYapGklLR9pedaP2iLRuHxl0ltiQ6OU3jRl/jskb9TvL+L/jg955Lj5LG1a/24/IO+STYwDKHlLo+0+2DwniN6J41vDVUkEY9EDUYudM+X4KFU/MjFDKufvyeuvqK+l9GWNtw5eVQPTAIpVivsbd6JfC+gu2K82Qchb3EhSWrd/QdxHewn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsPYfB+ET1fysselbzfJ0pACMfh5SmNezeR7m1lG+hc=;
 b=LdbeZ8RjQlneHRsdKAOinKQhSEEQyVZULy9yDNEdBG4Hd7re4+ND57mw/DYvfUKCX/CeWppNGCk6T6lGqNlw8VbeBSNCxTFjeU0IlyBb328TDQWmW6U/bDdpl4c1rOnPkKBc10dalYo/uRhZS7ack/Fqz0b10sHdDEKVSbb5Kww=
Received: from AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24)
 by AS8PR08MB8297.eurprd08.prod.outlook.com (2603:10a6:20b:537::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Fri, 18 Nov
 2022 16:21:57 +0000
Received: from AM7PR08MB5320.eurprd08.prod.outlook.com
 ([fe80::ba79:f42e:a934:d12b]) by AM7PR08MB5320.eurprd08.prod.outlook.com
 ([fe80::ba79:f42e:a934:d12b%4]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 16:21:57 +0000
From: Anton Antonov <Anton.Antonov@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Topic: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Index: AQHY+1/drvhiEUgbakGXLpqCRSQQZK5E1dnI
Date: Fri, 18 Nov 2022 16:21:57 +0000
Message-ID: 
 <AM7PR08MB53201A46A1080F4AAFA7E318FC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
 <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
In-Reply-To: 
 <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM7PR08MB5320:EE_|AS8PR08MB8297:EE_|AM7EUR03FT027:EE_|GV1PR08MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7f4248-1ef7-480d-bb97-08dac98109b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8T/KYZ9Ie+ZvJvYbqof5JCNekr5taN2js1t8RqlT7cO0NRXbyydb8rMqVwaKmRz04O74z4UMogPkYE0CJyWRIehslDUCNPzCs++i8UwNrggk2NWgPwdnxl++EVOVyV1wEU0czOjEvCspHiKnjW+/RMruFX7pUuhQ4k6SSenFIKVRxJ5v03ATveDSqVVQNozc9sD31Bb4EeZD/Ajx3LIZEei5OYetZ4QnBqnQiIqs/Ghb6zgCtPaZ0R7jlsUssy6k7cv63LrSzI4TpehGlYuD/3y8TULwaHSJF9I7MpwuqbOf0VYwMoy5oR1cVaPECnGa7CSPKASB9R+zG0ZweEBSBo8H6IiDJXRLeZ+Ij2NdFuMTXmjTVgP1XKPODlKqagf1KVdxX43mqsZkNdGpxdVcmJZ6GfrbPZDoyWfeUcWtKfnS85rqm8PVXC0dnwTed/N5i8oaj2Q8p1g7lC6m+fdEeEvEqLIxVHarc97kPzM3F3b1zONxQKv2iJHC7QIg3bv/ubS4ozVBOepUeCsOROjFdYzZY9Cyn1ewTrm7I64lbtCE6VcMkm9Yi18T0IH+xGrGFAHIuhfnhscZ+KviFOIdgWKVh2Yi0wPevcZM6MuFv9QqALTGazwEdjYvBHK9+S1aLzu+JwbTWBzOGuWAUIRPhWDg1Lf95UBNwkAJpOV9jzvylc6Kp0zZU80npNSUCowADVujSIXiraCq2CCZk1XH89/6bSW5N1wYBoU+YmdOaK0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5320.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(316002)(26005)(9686003)(110136005)(55236004)(7696005)(55016003)(6506007)(2906002)(38070700005)(91956017)(4001150100001)(53546011)(166002)(33656002)(8676002)(76116006)(41300700001)(66556008)(8936002)(9326002)(66446008)(86362001)(5660300002)(64756008)(186003)(66476007)(52536014)(66946007)(122000001)(478600001)(71200400001)(38100700002)(966005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM7PR08MB53201A46A1080F4AAFA7E318FC099AM7PR08MB5320eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e0cbbce1-129c-46bf-67f6-08dac9810394
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ICdx9DvDP67mPXjrO9PbiK72zOLVQoEIvGCwnby1K4tMi9cwgjNCM9VU2H9vPGsVcPskcuLQoi7jabf8NgW8hWfxdNzYKnM5UEeJxo4RDL8qLyASJbeZt7XgvxCRQldD+OprkkIBnYa82QAoHem7Don0GNUXfMjAMbYhAXrr2PCvwYYlYo82Akvu0xcQ27qdHGAWl63dGpafpweQCoJWn31CeFJHWwOEB1hdQQy5EHMLSZGNhnmcRWpprh101/datrfVW0FOLPVNpHzaghR7s9TtAOrdDjUl7JHzNKkJALP6LUpKJliHiAgyFXp9aWSyLiDMu/28F+tBABMOlZ6ktAwXo1C56Ju4BDZhRaA6H8v3GN0K3ksCCvOMGWwFMjlQUzjFB23xkmD17V3m9HlwG/m+8NYHG+JwmnswCPt9hvN1qDTGc1Bcgxw0kgV8rRpbawvhCuec4pKFXYhIRHxdiK+8ar+GaQfoB9yPhky3ugzqNcpd3Klq8SS1WBmGOQw6xlEyIgpqxaLwITxMz95FO7GhqB3DO6A9GK/D829uE2FQCYmg3N+Ruq5kSAhLTD8Cs1LwHTgDi4uzw4MqlIZWRRtb4gntJX/ydJFKgV/+9MRc8UDn3gku7CWIvjyf+lSrVyDtUHIks2Pp3mNTVsODUKDJjyMnusPsCToS3qZnWmxp03rABcIuUtvNesjoODGevGbwihQDuR12A9tujfMBOWyOoZ5OauRg9RhKqostsn6FZEQLD+V9oUwTR6rac2R+I+SgNIEdMAcvXd9XggnYdsw0SN5HAIO0uUvOWpF9yUY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(40480700001)(86362001)(166002)(356005)(81166007)(8936002)(33656002)(4001150100001)(55016003)(53546011)(9326002)(52536014)(9686003)(26005)(2906002)(7696005)(70586007)(316002)(6506007)(966005)(478600001)(110136005)(5660300002)(8676002)(70206006)(41300700001)(36860700001)(82740400003)(82310400005)(186003)(336012)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 16:22:07.6303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7f4248-1ef7-480d-bb97-08dac98109b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7915
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173476

--_000_AM7PR08MB53201A46A1080F4AAFA7E318FC099AM7PR08MB5320eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

  I=92ve tested your approach. It doesn=92t work for whatever reason. CRATE=
_CC_NO_DEFAULTS is empty exported for native recipes:

$ MACHINE=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS
# $CRATE_CC_NO_DEFAULTS [3 operations]
#     [export] "${'1' if d.getVar('CRATE_CC_NO_DEFAULTS') =3D=3D 'true' els=
e '0'}"
export CRATE_CC_NO_DEFAULTS=3D""
# $CRATE_CC_NO_DEFAULTS:class-native
CRATE_CC_NO_DEFAULTS:class-native=3D""


  I also tried:
CRATE_CC_NO_DEFAULTS[export] =3D "${@oe.utils.conditional('CRATE_CC_NO_DEFA=
ULTS', '', '0', '1', d)}"
with the same result =96 empty export.

Cheers,
Anton

From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Friday, 18 November 2022 at 15:10
To: Anton Antonov <Anton.Antonov@arm.com>, openembedded-core@lists.openembe=
dded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default c=
ompiler flags defined in CC crate
On Fri, 2022-11-18 at 14:42 +0000, Anton Antonov wrote:
> Rust crates build dependecy C libraries using "CC" crate.
> This crate adds some default compiler parameters depending on target arch=
.
> For some target archs these parameters conflict with the parameters defin=
ed by OE.
>
> Warnings/errors like this can be seen in the case:
>
> cc1: error: switch '-mcpu=3Dcortex-a15' conflicts with switch '-march=3Da=
rmv7-a+fp' [-Werror]
>
> Lets use the OE parameters only by exporting CRATE_CC_NO_DEFAULTS.
> https://github.com/rust-lang/cc-rs#external-configuration-via-environment=
-variables
>
> This patch fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1494=
7
>
> Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index 2710b4325d..4135335043 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -401,3 +401,21 @@ python do_rust_gen_targets () {
>  addtask rust_gen_targets after do_patch before do_compile
>  do_rust_gen_targets[dirs] +=3D "${RUST_TARGETS_DIR}"
>
> +# For building C dependecies only use compiler parameters defined in OE-=
core
> +# and ignore the default parameters defined in the CC crate.
> +# https://github.com/rust-lang/cc-rs#external-configuration-via-environm=
ent-variables
> +# For rust native recipes we still rely on the CC crate parameters.
> +
> +CRATE_CC_NO_DEFAULTS:class-target ?=3D "true"
> +CRATE_CC_NO_DEFAULTS:class-nativesdk ?=3D "true"
> +CRATE_CC_NO_DEFAULTS:class-native ?=3D ""
> +
> +# The CC crate checks for CRATE_CC_NO_DEFAULTS existence not value.
> +# Even empty CRATE_CC_NO_DEFAULTS will be taken into account.
> +# So, don't export it if empty.
> +do_compile:prepend() {
> +    if [ -n "${CRATE_CC_NO_DEFAULTS}" ]; then
> +        export CRATE_CC_NO_DEFAULTS=3D"${CRATE_CC_NO_DEFAULTS}"
> +        bbnote "CRATE_CC_NO_DEFAULTS is exported"
> +    fi
> +}

That looks like a good start. I wondered if this might work as a
slightly cleaner solution?:

CRATE_CC_NO_DEFAULTS =3D "true"
CRATE_CC_NO_DEFAULTS:class-native =3D ""
CRATE_CC_NO_DEFAULTS[export] =3D "${'1' if d.getVar('CRATE_CC_NO_DEFAULTS')=
 =3D=3D 'true' else '0'}"

Cheers,

Richard

--_000_AM7PR08MB53201A46A1080F4AAFA7E318FC099AM7PR08MB5320eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Times New Roman \(Body CS\)";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Hi Richar=
d,<br>
<br>
&nbsp; I=92ve tested your approach. It doesn=92t work for whatever reason. =
CRATE_CC_NO_DEFAULTS is empty exported for native recipes:<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">$ MACHINE=
=3Dqemuarm bitbake rust-native -e |grep CRATE_CC_NO_DEFAULTS<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS [3 operations]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">#&nbsp;&n=
bsp;&nbsp;&nbsp; [export] &quot;${'1' if d.getVar('CRATE_CC_NO_DEFAULTS') =
=3D=3D 'true' else '0'}&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">export CR=
ATE_CC_NO_DEFAULTS=3D&quot;&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"># $CRATE_=
CC_NO_DEFAULTS:class-native<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">CRATE_CC_=
NO_DEFAULTS:class-native=3D&quot;&quot;<br>
<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">&nbsp; I =
also tried:<br>
CRATE_CC_NO_DEFAULTS[export] =3D &quot;${@oe.utils.conditional('CRATE_CC_NO=
_DEFAULTS', '', '0', '1', d)}&quot;<br>
with the same result =96 empty export.<br>
<br>
Cheers,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Anton<br>
<br>
<o:p></o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Date: </b>Friday, 18 November 2022 at 15:10<br>
<b>To: </b>Anton Antonov &lt;Anton.Antonov@arm.com&gt;, openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject: </b>Re: [OE-core] [langdale][master][PATCH] rust: Do not use de=
fault compiler flags defined in CC crate<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal">On Fri, 2022-11-18 at 14:42 +0000, Anton Antonov wro=
te:<br>
&gt; Rust crates build dependecy C libraries using &quot;CC&quot; crate.<br=
>
&gt; This crate adds some default compiler parameters depending on target a=
rch.<br>
&gt; For some target archs these parameters conflict with the parameters de=
fined by OE.<br>
&gt; <br>
&gt; Warnings/errors like this can be seen in the case:<br>
&gt; <br>
&gt; cc1: error: switch '-mcpu=3Dcortex-a15' conflicts with switch '-march=
=3Darmv7-a+fp' [-Werror]<br>
&gt; <br>
&gt; Lets use the OE parameters only by exporting CRATE_CC_NO_DEFAULTS.<br>
&gt; <a href=3D"https://github.com/rust-lang/cc-rs#external-configuration-v=
ia-environment-variables">
https://github.com/rust-lang/cc-rs#external-configuration-via-environment-v=
ariables</a><br>
&gt; <br>
&gt; This patch fixes <a href=3D"https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D14947">
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14947</a><br>
&gt; <br>
&gt; Signed-off-by: Anton Antonov &lt;Anton.Antonov@arm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes-recipe/rust-target-config.bbclass | 18 ++++++++++++=
++++++<br>
&gt;&nbsp; 1 file changed, 18 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/cla=
sses-recipe/rust-target-config.bbclass<br>
&gt; index 2710b4325d..4135335043 100644<br>
&gt; --- a/meta/classes-recipe/rust-target-config.bbclass<br>
&gt; +++ b/meta/classes-recipe/rust-target-config.bbclass<br>
&gt; @@ -401,3 +401,21 @@ python do_rust_gen_targets () {<br>
&gt;&nbsp; addtask rust_gen_targets after do_patch before do_compile<br>
&gt;&nbsp; do_rust_gen_targets[dirs] +=3D &quot;${RUST_TARGETS_DIR}&quot;<b=
r>
&gt;&nbsp; <br>
&gt; +# For building C dependecies only use compiler parameters defined in =
OE-core<br>
&gt; +# and ignore the default parameters defined in the CC crate.<br>
&gt; +# <a href=3D"https://github.com/rust-lang/cc-rs#external-configuratio=
n-via-environment-variables">
https://github.com/rust-lang/cc-rs#external-configuration-via-environment-v=
ariables</a><br>
&gt; +# For rust native recipes we still rely on the CC crate parameters.<b=
r>
&gt; +<br>
&gt; +CRATE_CC_NO_DEFAULTS:class-target ?=3D &quot;true&quot;<br>
&gt; +CRATE_CC_NO_DEFAULTS:class-nativesdk ?=3D &quot;true&quot;<br>
&gt; +CRATE_CC_NO_DEFAULTS:class-native ?=3D &quot;&quot;<br>
&gt; +<br>
&gt; +# The CC crate checks for CRATE_CC_NO_DEFAULTS existence not value.<b=
r>
&gt; +# Even empty CRATE_CC_NO_DEFAULTS will be taken into account.<br>
&gt; +# So, don't export it if empty.<br>
&gt; +do_compile:prepend() {<br>
&gt; +&nbsp;&nbsp;&nbsp; if [ -n &quot;${CRATE_CC_NO_DEFAULTS}&quot; ]; the=
n<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export CRATE_CC_NO_DEFAULT=
S=3D&quot;${CRATE_CC_NO_DEFAULTS}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bbnote &quot;CRATE_CC_NO_D=
EFAULTS is exported&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp; fi<br>
&gt; +}<br>
<br>
That looks like a good start. I wondered if this might work as a<br>
slightly cleaner solution?:<br>
<br>
CRATE_CC_NO_DEFAULTS =3D &quot;true&quot;<br>
CRATE_CC_NO_DEFAULTS:class-native =3D &quot;&quot;<br>
CRATE_CC_NO_DEFAULTS[export] =3D &quot;${'1' if d.getVar('CRATE_CC_NO_DEFAU=
LTS') =3D=3D 'true' else '0'}&quot;<br>
<br>
Cheers,<br>
<br>
Richard<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_AM7PR08MB53201A46A1080F4AAFA7E318FC099AM7PR08MB5320eurp_--

