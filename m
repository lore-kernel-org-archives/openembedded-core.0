Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6211BE7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 08:34:28 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.46])
 by mx.groups.io with SMTP id smtpd.web11.14251.1736498058147241701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 00:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ULyDj7q4;
 spf=pass (domain: siemens.com, ip: 40.107.241.46, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6M4vGd8iKihfv1y/ZLU4cEc2h7ukh5YkwEsGccLGHR9Dba2q87TwInvMbFxDEd8S0Mn39Gm3qZON4Bj30Iz928Po+P59fq59mX14SPj9vJXCH+4ips3UtCPLM8Ueatb8Pvft+sE5WeidFKUsc/mVmfk1XAGvEwzCSgBtfdR0aXN7k+UUgp3mMM2hpDc3vqvcod2MYKoKSF1fcGNvec/DtTlfwi6ZzgbnIM7AE1u+/LpchHjNhxRhZV5ZiAOwCJeM2K0XBAQhWiIMS+yyXTnRtrIsHQ7JQKZdCoLNQXPEy+U3HJ7fT6bvh3tNkIUlPDbaEEdXrwB+WYskcN/dR0xgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJFMqJT4ubm86+2/fiQxdrN9Et5nTb3GHY3EBsEKM80=;
 b=iEl8CbBBWjC9Ifx4l6u/ASW+WC8LLeVGs6sg+jXOLaaTzaXhBW9vHA/8IekVRo6xvpkT1yXNm3LxKfMQ+zbvd1gu0hCykuSSvDGLXbWoY562KN7BKVPUf3NMPG8Xwxgy355CnaRyXnOZZbWX6fKlmjVlCHL5C2vsJ/YTWIgDdjuXbe9b6Si1VsORECPMTk8LaX5aGDLx00khaCiEJh0m9t8ZKxC0LdOeAuEMAvgefdltOLLotBCh1n5zJ2s/Ak/LOKCkyNNE/f9C7lcAPaIY8nyY+v25fgmge83HWJMdtDvRdzYa/zpBUoo8B6Ys4TM0eoDNyOx1ohMGuaU2frXXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJFMqJT4ubm86+2/fiQxdrN9Et5nTb3GHY3EBsEKM80=;
 b=ULyDj7q4CIyzNbxFr1H2fT3T43hrnaLRxO8KDm8ANZjl3eoYObYviEQEvkklXdXgs0i6vFZDVR6XHBhxZRN264v+mC6rmtrEMdKD+Ufjw3RzAgEmbj+/STBtVf3TKfBmZ2ofW1hp3yVyE27SJrIBW4AXEdBRIIlakvzsMVE0HvLq0wWaR0HVoCGBJsTF9fQOKHGsj89MYp0dDQiP9wsWZj5703Vn9mDg/YU82ZyCXRwT/bIl8qZ3C9j1BfS5AcQ0l1rF6RAK1w2GD/6R0lGj+SX1oLKNSX+INscnyxoFZV8GWX8V+BFVmwdEwloM4xfIycYN4HbRnS0S6jwhdSj63Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI0PR10MB8571.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.6; Fri, 10 Jan
 2025 08:34:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 08:34:14 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "colinmca242@gmail.com" <colinmca242@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
Thread-Topic: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
Thread-Index: AQHbWvA4guQ8bzoGTkiOEX1TDduSq7MPvfkw
Date: Fri, 10 Jan 2025 08:34:14 +0000
Message-ID: 
 <AS1PR10MB56970BFF91164C7A27D3A25BFD1C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20241230192224.113886-1-colinmca242@gmail.com>
 <20241230192224.113886-2-colinmca242@gmail.com>
In-Reply-To: <20241230192224.113886-2-colinmca242@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=917b2880-db5b-47ed-832e-4b3abe5592c4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-10T08:30:37Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI0PR10MB8571:EE_
x-ms-office365-filtering-correlation-id: 6bc535f2-5ac5-4aa1-b4cb-08dd315190a0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?P/u6j92a5BVWXLH/gKK49xDuFs+AIPMwXYRDro1sx5w99EdShRbEtSQvKpEY?=
 =?us-ascii?Q?oUjAdkNe/3KMn8bHg4irOE9IdrGT4tOyOG1IqNdz0LlnVViwPnHLjshi9Rmp?=
 =?us-ascii?Q?XsQVa3eOy2oWW8331eYO5vOn+Xse5D3zNLzsjZqwPlhZv9V9/iXPOFxVn08u?=
 =?us-ascii?Q?47VFivZHNncHPkP7XogE2XV96Hyfcr796OyBYm9L4ncwfB7jvdCIW22Kd0ap?=
 =?us-ascii?Q?lBm97bDHyYGzjbyh3aNCsav5M3duQiUo2SvxMykRSxuUDX4MDEasKwQf8L14?=
 =?us-ascii?Q?MPr3hBB4Dhr8OPAxoWxbbqfhJsEuu8CcZh4ojx2g8ZcMNSRlY/qjRH8JidMQ?=
 =?us-ascii?Q?bTKfibjwMTEH7YZocwlef6WBDQPlpuqU/N3Yv7+w5xjp7fl56tH20chmIruq?=
 =?us-ascii?Q?S1jWcqevu6zGKs3Lm4B/PgGK+dJwlMgM2D+7xEwdB3EqUqVeII0EBqb+TNFx?=
 =?us-ascii?Q?/sZI2pPDTGSby7064XnVWtKT43J7PV0DnEq2NTANEPuKsbalbSLv6I+wRN/z?=
 =?us-ascii?Q?G7xu3E2lxVkNOX6avJoijZbcPMYcVcgwJDG4TeZa1v89CK399naejvE0tWNt?=
 =?us-ascii?Q?of1mNIsNiBLjgYFEja/tjXlWpioJRPQpCoEFhzNW7v1ntAeNyLZBwRNEXxKV?=
 =?us-ascii?Q?yrWIIMkrnfXu2N8JVm1QEBRAzP/utKmBJLuAY9FWj94STimYDKInAf+/dYQ6?=
 =?us-ascii?Q?jaeJ/ZbWzjBDWorj2D9KiHDcKEw8TChrd2OGa9jkfvjKs38ZjA+ZTcrefReK?=
 =?us-ascii?Q?Pb1KyTAq8l5rb41jfi9xZ6IechpH9re5mgcu52wVj9rHjm5ikTnLzEY9CpV0?=
 =?us-ascii?Q?jx0t7z+i9flXBp5fcDLX7NqsQ1UhmRHOaXl/kpafBd3CITVH/1gxgAReuvft?=
 =?us-ascii?Q?av4xnkQmOtoBu/pvThCk1JcCcUTg56Air+Lm/EJu87ROcvwCdEMk6DcaX6FZ?=
 =?us-ascii?Q?im0bX68gP3iMIkXScuVlb8UQj9cLe8kop9R/8h/2NW1ZjCO25gkYW9fFLr5A?=
 =?us-ascii?Q?plPB4pYw/w3wI4Wpk7nvgpG9pp0jpnQBwXzM1zcc701MgR1pQFrrGqrua58y?=
 =?us-ascii?Q?COky01W20J62D4Z1o/eqSOnytoXVqk2usYT7fuIiNyywHOGKUkSaROEa3npC?=
 =?us-ascii?Q?Vj45EvXSfEuKgdl276Dcl84MhzwTtNmgSJumEsrjDb7rLOIiZval5R7egEAj?=
 =?us-ascii?Q?66vMoEKJ5X3AP5vCRTT8hHuJQJLGLIQEDIb6EAO0bQZO5eUUJwjYCmKtnrDH?=
 =?us-ascii?Q?BpkYP1VNrNsBaGKQ5H9Yop/oF/Yq8MdMQLIKuy217/W7TEJirUaX/E+5HhnL?=
 =?us-ascii?Q?9QSvC+fmPrQj7gVO2dY3r+5hf2nL1PIrKf6XFsaPHo2/drs14C52CveZ42NP?=
 =?us-ascii?Q?bX6NMjmu32Ni41DNzGahF14ISrsn4iCShpxfdYkd3B+Q+c4FZQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3SJjwPxr3137ccfiqg8CyfcGw8QryelSqB1UpFqcaNDW1cmQc5lEalLTeQ72?=
 =?us-ascii?Q?SLUn7GkNf8F9NuDewJUD5yewQ5AUfSWXvztUWvFzi6VwXuB72pipU+I8Dy7V?=
 =?us-ascii?Q?oqfxRRDKcOyGAMTE8CCS4M/gcAySqkcF1TMzemmUh438nN/SOjVOjok8tPBo?=
 =?us-ascii?Q?r8v0csJC25evdOZib7kb6CmMVM41rOJchbyUAa5h7EGgHDKJa/uEMtyLoQg+?=
 =?us-ascii?Q?u8/1p61WofMgI/+uWq5al4M44kGRl1fI+0ULoEL76G26uQTLnsb3ceWQBtJp?=
 =?us-ascii?Q?hpVyx/dhhahuFcsB0bbwMDkWa62Aftn6K4FS0eWMWCNuA2Vbjl/1hUK5nKbb?=
 =?us-ascii?Q?EXC2EHgUGVDSsGAP4ek8jOzXQO5cG8Ie/56rjr/k1u/v6W+dcFpvunMr1IR6?=
 =?us-ascii?Q?fMRGeoIRpksn2H4mjKFvdhkPyv2h3ugOTayk9i3xReD1JT0/kxxlTLeiAz7Z?=
 =?us-ascii?Q?AjHChlBj2Y9OcX8hX/PrhHoYNC6fp/J5FIZjBcembpa1AZ4XuIKWHpbvfXfe?=
 =?us-ascii?Q?POdR7hTIwOueXhBVVav/KxzgB+FG3ZjZcN0fT2llBQlQSSk8IUVI1XXInwpD?=
 =?us-ascii?Q?kvZueDiNZxcVkV43eZT3ZpIdfRbXbCl2UvMBoho8VMxKlZbuEhYQGDpJIrbr?=
 =?us-ascii?Q?+8KDSAOuSymQhUPt3x1T+uq2RaNEBFVbqPqYRNATP99cs3amSpp1bGomIO6e?=
 =?us-ascii?Q?JnByEgMdpazpv9mJqocncEAjcpxSfsvU97PjrYsNwUGFwvuPaWTy8Ln4hYk0?=
 =?us-ascii?Q?Mkh1MXH6qj8vjV6vD3UsUXOxd4cMPrvO0Dij9ScuNKJyP/ppQkkQuJNs7Yho?=
 =?us-ascii?Q?hCiDOKY5A5ciJFJQPbMJ/FLiG8T+fVCj2PziKZQzRPQx96uLwe8DOzv5zWJ1?=
 =?us-ascii?Q?xbKnd4Upr5BqY9VufgHsWM/43jKxqjqoC3rec5D1Z0H2Txzoxt/5aUEfDQye?=
 =?us-ascii?Q?U2kX8lO7IcVknwFyo3zFylYiWdHpKLPer+nPi+hTCv0rgXy+HpmZ9xzXwVLt?=
 =?us-ascii?Q?+yWKN+VJqF/XyvqhVmzWDOz9wn7w1RNYeUqHmlNN7o3653rNjqMr13XsDdaU?=
 =?us-ascii?Q?8nDuhBQuER/O+7doP0/Eg7/8nOorC+vyOIsWeOmDhaXQEXW6xGyoSZBqVXTn?=
 =?us-ascii?Q?YsU7vqbf6nihQHaVE+Jigs/fo+k9v30U+O+sSkKe0qsOBX1nbY0fDabA01qC?=
 =?us-ascii?Q?hKhB6W9mAzqPfEph2dGg1KNDzrkGKgrYeVgnpQnok/niL1K9T660rsb/ut6K?=
 =?us-ascii?Q?DpbvocpbEoBEIMPaZFtESXSiHLqeRXUtm5orrZPwzS4yMOs+glQA1widjoxl?=
 =?us-ascii?Q?aaQ4hdLE9AAt7jlD1KlGsszkNGxk/JoTt2CEF1w/t42labrxuq2irT3IyHBH?=
 =?us-ascii?Q?eGZgzEGF9YUD6H9Y1c1EawFYSjGj2g8ljAv2P8rthYdfL7zHwLSyvE2D7GhX?=
 =?us-ascii?Q?SNx/RdCy9PqQqBA91ZkQQD17XToPm5jc6dJ565hBkvQQnXbH1a1qmMI2K2aD?=
 =?us-ascii?Q?ie03C2gk7Xz6F0gUKl7DmbUNWMWhjktIjJIbEvpBJ/rXF76gkaz3ZIswBnVi?=
 =?us-ascii?Q?FgowD8h9NwjMK9UH7NAE3HG+kouF1n3qYQeW8EK9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc535f2-5ac5-4aa1-b4cb-08dd315190a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 08:34:14.5000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cX4OXQ0ibtORAn41keivLIMfZKG86HGnB5Dk2XppSUX3R6LMZ36MV+qrY5ykWsZGVAtDDjs7HCgXFUdauB5E9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 08:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209635

Hello,

This patch has caused a regression in detecting cve patches.
Master jumped by 32 CVEs after merging this commit.
These are for sure patched but it's not detected anymore.
See https://valkyrie.yocto.io/pub/non-release/patchmetrics/
(master should be identical to scarthgap/styhead except for kernel CVEs)

Reports cannot be used anymore for picking CVEs for TODO list.
So this patch should be reverted or fixed.

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Colin McAllister via
> lists.openembedded.org
> Sent: Monday, December 30, 2024 20:22
> To: openembedded-core@lists.openembedded.org
> Cc: Colin McAllister <colinmca242@gmail.com>
> Subject: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
>=20
> The cve_check functionality to parse CVE IDs from the patch filename and
> patch contents have been reworked to improve parsing and also utilize
> tests. This ensures that the parsing works as intended.
>=20
> Additionally, the new patched_cves dict has a few issues I tried to fix
> as well. If multiple patch files exist for a single CVE ID, only the
> last one will show up with the "resource" key. The value for the
> "resource" key has been updated to hold a list and return all patch
> files associated with a given CVE ID. Also, at the end of
> get_patch_cves, CVE_STATUS can overwrite an existing entry in the dict.
> This could cause an issue, for example, if a CVE has been addressed via
> a patch, but a CVE_STATUS line also exists that ignores the given CVE
> ID. A warning has been added if this ever happens.
>=20
> Signed-off-by: Colin McAllister <colinmca242@gmail.com>
> ---
>=20
> I noticed that there are some patches, especially in older verisons of
> Yocto, where the "CVE: " tag was used with multiple CVE IDs in different
> formats, like "CVE-YYYY-XXXX & CVE-YYYY-XXXX" or
> "CVE-YYYY-XXXX, CVE-YYYY-XXXX". Currently, only space-delimited CVE
> IDs will be parsed, but documentation doesn't indicate that is the only
> supported format. I figured it'd be nice to update the code to be able
> to support multiple formats, that way this patch could be backported to
> fix those patches. I also wanted to add unit tests to ensure the patch
> parsing behavior is preserved.
>=20
> I'd also like to update the patch filename parsing to parse multiple CVE
> IDs from the filename, but based on the comments, it seems like there
> was a reason why only the last CVE ID is extracted from the filename.
> I'd be happy to submit a V2 patch or an additional patch to update the
> function if that sounds good for the maintainers.
>=20
> V2 Changes:
> I mistakenly created this patch without fb3f440 applied. I updated
> get_patched_cves to return a dict instead of a set.
>=20
> I also improved the docstrings for these new functions to be more
> descriptive and also specify the return types.
>=20
> I also found a few issues with the dictionary object created by
> get_patched_cves that have now been addressed in this commit.
>=20
>  meta/lib/oe/cve_check.py                  | 166 ++++++++++++------
>  meta/lib/oeqa/selftest/cases/cve_check.py | 205
> ++++++++++++++++++++++
>  2 files changed, 317 insertions(+), 54 deletions(-)
>=20
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index 280f9f613d..85a899a880 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -5,9 +5,11 @@
>  #
>=20
>  import collections
> -import re
> -import itertools
>  import functools
> +import itertools
> +import os.path
> +import re
> +import oe.patch
>=20
>  _Version =3D collections.namedtuple(
>      "_Version", ["release", "patch_l", "pre_l", "pre_v"]
> @@ -71,76 +73,132 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
>      return _release, _patch, _pre
>=20
>=20
> -def get_patched_cves(d):
> +def parse_cve_from_filename(patch_filename):
>      """
> -    Get patches that solve CVEs using the "CVE: " tag.
> +    Parses CVE ID from the filename
> +
> +    Matches the last "CVE-YYYY-ID" in the file name, also if written
> +    in lowercase. Possible to have multiple CVE IDs in a single
> +    file name, but only the last one will be detected from the file name=
.
> +
> +    Returns the last CVE ID foudn in the filename. If no CVE ID is found
> +    an empty string is returned.
>      """
> +    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d{4,})",
> re.IGNORECASE)
>=20
> -    import re
> -    import oe.patch
> +    # Check patch file name for CVE ID
> +    fname_match =3D cve_file_name_match.search(patch_filename)
> +    return fname_match.group(1).upper() if fname_match else ""
>=20
> -    cve_match =3D re.compile(r"CVE:( CVE-\d{4}-\d+)+")
>=20
> -    # Matches the last "CVE-YYYY-ID" in the file name, also if written
> -    # in lowercase. Possible to have multiple CVE IDs in a single
> -    # file name, but only the last one will be detected from the file na=
me.
> -    # However, patch files contents addressing multiple CVE IDs are supp=
orted
> -    # (cve_match regular expression)
> -    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECA=
SE)
> +def parse_cves_from_patch_contents(patch_contents):
> +    """
> +    Parses CVE IDs from patch contents
>=20
> +    Matches all CVE IDs contained on a line that starts with "CVE: ". An=
y
> +    delimiter (',', '&', "and", etc.) can be used without any issues. Mu=
ltiple
> +    "CVE:" lines can also exist.
> +
> +    Returns a set of all CVE IDs found in the patch contents.
> +    """
> +    cve_ids =3D set()
> +    cve_match =3D re.compile(r"CVE-\d{4}-\d{4,}")
> +    # Search for one or more "CVE: " lines
> +    for line in patch_contents.split("\n"):
> +        if not line.startswith("CVE:"):
> +            continue
> +        cve_ids.update(cve_match.findall(line))
> +    return cve_ids
> +
> +
> +def parse_cves_from_patch_file(patch_file):
> +    """
> +    Parses CVE IDs associated with a particular patch file, using both t=
he
> filename
> +    and patch contents.
> +
> +    Returns a set of all CVE IDs found in the patch filename and content=
s.
> +    """
> +    cve_ids =3D set()
> +    filename_cve =3D parse_cve_from_filename(patch_file)
> +    if filename_cve:
> +        bb.debug(2, "Found %s from patch file name %s" % (filename_cve,
> patch_file))
> +        cve_ids.add(parse_cve_from_filename(patch_file))
> +
> +    # Remote patches won't be present and compressed patches won't be
> +    # unpacked, so say we're not scanning them
> +    if not os.path.isfile(patch_file):
> +        bb.note("%s is remote or compressed, not scanning content" %
> patch_file)
> +        return cve_ids
> +
> +    with open(patch_file, "r", encoding=3D"utf-8") as f:
> +        try:
> +            patch_text =3D f.read()
> +        except UnicodeDecodeError:
> +            bb.debug(
> +                1,
> +                "Failed to read patch %s using UTF-8 encoding"
> +                " trying with iso8859-1" % patch_file,
> +            )
> +            f.close()
> +            with open(patch_file, "r", encoding=3D"iso8859-1") as f:
> +                patch_text =3D f.read()
> +
> +    cve_ids.update(parse_cves_from_patch_contents(patch_text))
> +
> +    if not cve_ids:
> +        bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
> +    else:
> +        bb.debug(2, "Patch %s solves %s" % (patch_file, ",
> ".join(sorted(cve_ids))))
> +
> +    return cve_ids
> +
> +
> +def get_patched_cves(d):
> +    """
> +    Determines the CVE IDs that have been solved by either patches incud=
ed
> within
> +    SRC_URI or by setting CVE_STATUS.
> +
> +    Returns a dictionary with the CVE IDs as keys and an associated dict=
onary
> of
> +    relevant metadata as the value.
> +    """
>      patched_cves =3D {}
>      patches =3D oe.patch.src_patches(d)
>      bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
> +
> +    # Check each patch file
>      for url in patches:
>          patch_file =3D bb.fetch.decodeurl(url)[2]
> -
> -        # Check patch file name for CVE ID
> -        fname_match =3D cve_file_name_match.search(patch_file)
> -        if fname_match:
> -            cve =3D fname_match.group(1).upper()
> -            patched_cves[cve] =3D {"abbrev-status": "Patched", "status":=
 "fix-file-
> included", "resource": patch_file}
> -            bb.debug(2, "Found %s from patch file name %s" % (cve, patch=
_file))
> -
> -        # Remote patches won't be present and compressed patches won't b=
e
> -        # unpacked, so say we're not scanning them
> -        if not os.path.isfile(patch_file):
> -            bb.note("%s is remote or compressed, not scanning content" %
> patch_file)
> -            continue
> -
> -        with open(patch_file, "r", encoding=3D"utf-8") as f:
> -            try:
> -                patch_text =3D f.read()
> -            except UnicodeDecodeError:
> -                bb.debug(1, "Failed to read patch %s using UTF-8 encodin=
g"
> -                        " trying with iso8859-1" %  patch_file)
> -                f.close()
> -                with open(patch_file, "r", encoding=3D"iso8859-1") as f:
> -                    patch_text =3D f.read()
> -
> -        # Search for one or more "CVE: " lines
> -        text_match =3D False
> -        for match in cve_match.finditer(patch_text):
> -            # Get only the CVEs without the "CVE: " tag
> -            cves =3D patch_text[match.start()+5:match.end()]
> -            for cve in cves.split():
> -                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
> -                patched_cves[cve] =3D {"abbrev-status": "Patched", "stat=
us": "fix-file-
> included", "resource": patch_file}
> -                text_match =3D True
> -
> -        if not fname_match and not text_match:
> -            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
> +        for cve_id in parse_cves_from_patch_file(patch_file):
> +            if cve_id not in patched_cves:
> +                {
> +                    "abbrev-status": "Patched",
> +                    "status": "fix-file-included",
> +                    "resource": [patch_file],
> +                }
> +            else:
> +                patched_cves[cve_id]["resource"].append(patch_file)
>=20
>      # Search for additional patched CVEs
> -    for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status =3D decode_cve_status(d, cve)
> +    for cve_id in d.getVarFlags("CVE_STATUS") or {}:
> +        decoded_status =3D decode_cve_status(d, cve_id)
>          products =3D d.getVar("CVE_PRODUCT")
> -        if has_cve_product_match(decoded_status, products) =3D=3D True:
> -            patched_cves[cve] =3D {
> +        if has_cve_product_match(decoded_status, products):
> +            if cve_id in patched_cves:
> +                bb.warn(
> +                    'CVE_STATUS[%s] =3D "%s" is overwriting previous sta=
tus of "%s: %s"'
> +                    % (
> +                        cve_id,
> +                        d.getVarFlag("CVE_STATUS", cve_id),
> +                        patched_cves[cve_id]["abbrev-status"],
> +                        patched_cves[cve_id]["status"],
> +                    )
> +                )
> +            patched_cves[cve_id] =3D {
>                  "abbrev-status": decoded_status["mapping"],
>                  "status": decoded_status["detail"],
>                  "justification": decoded_status["description"],
>                  "affected-vendor": decoded_status["vendor"],
> -                "affected-product": decoded_status["product"]
> +                "affected-product": decoded_status["product"],
>              }
>=20
>      return patched_cves
> diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py
> b/meta/lib/oeqa/selftest/cases/cve_check.py
> index 3dd3e89d3e..511e4b81b4 100644
> --- a/meta/lib/oeqa/selftest/cases/cve_check.py
> +++ b/meta/lib/oeqa/selftest/cases/cve_check.py
> @@ -120,6 +120,211 @@ class CVECheck(OESelftestTestCase):
>          self.assertEqual(has_cve_product_match(status, "test glibca:glib=
c"), True)
>          self.assertEqual(has_cve_product_match(status, "glibca:glibc tes=
t"), True)
>=20
> +    def test_parse_cve_from_patch_filename(self):
> +        from oe.cve_check import parse_cve_from_filename
> +
> +        # Patch filename without CVE ID
> +        self.assertEqual(parse_cve_from_filename("0001-test.patch"), "")
> +
> +        # Patch with single CVE ID
> +        self.assertEqual(
> +            parse_cve_from_filename("CVE-2022-12345.patch"), "CVE-2022-
> 12345"
> +        )
> +
> +        # Patch with multiple CVE IDs
> +        self.assertEqual(
> +            parse_cve_from_filename("CVE-2022-41741-CVE-2022-
> 41742.patch"),
> +            "CVE-2022-41742",
> +        )
> +
> +        # Patches with CVE ID and appended text
> +        self.assertEqual(
> +            parse_cve_from_filename("CVE-2023-3019-0001.patch"), "CVE-
> 2023-3019"
> +        )
> +        self.assertEqual(
> +            parse_cve_from_filename("CVE-2024-21886-1.patch"), "CVE-2024=
-
> 21886"
> +        )
> +
> +        # Patch with CVE ID and prepended text
> +        self.assertEqual(
> +            parse_cve_from_filename("grep-CVE-2012-5667.patch"), "CVE-20=
12-
> 5667"
> +        )
> +        self.assertEqual(
> +            parse_cve_from_filename("0001-CVE-2012-5667.patch"), "CVE-
> 2012-5667"
> +        )
> +
> +        # Patch with CVE ID and both prepended and appended text
> +        self.assertEqual(
> +            parse_cve_from_filename(
> +                "0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565-0001.p=
atch"
> +            ),
> +            "CVE-2021-3565",
> +        )
> +
> +        # Only grab the last CVE ID in the filename
> +        self.assertEqual(
> +            parse_cve_from_filename("CVE-2012-5667-CVE-2012-5668.patch")=
,
> +            "CVE-2012-5668",
> +        )
> +
> +        # Test invalid CVE ID with incorrect length (must be at least 4 =
digits)
> +        self.assertEqual(
> +            parse_cve_from_filename("CVE-2024-001.patch"),
> +            "",
> +        )
> +
> +        # Test valid CVE ID with very long length
> +        self.assertEqual(
> +            parse_cve_from_filename("CVE-2024-
> 0000000000000000000000001.patch"),
> +            "CVE-2024-0000000000000000000000001",
> +        )
> +
> +    def test_parse_cve_from_patch_contents(self):
> +        import textwrap
> +        from oe.cve_check import parse_cves_from_patch_contents
> +
> +        # Standard patch file excerpt without any patches
> +        self.assertEqual(
> +            parse_cves_from_patch_contents(
> +                textwrap.dedent("""\
> +            remove "*" for root since we don't have a /etc/shadow so far=
.
> +
> +            Upstream-Status: Inappropriate [configuration]
> +
> +            Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> +
> +            --- base-passwd/passwd.master~nobash
> +            +++ base-passwd/passwd.master
> +            @@ -1,4 +1,4 @@
> +            -root:*:0:0:root:/root:/bin/sh
> +            +root::0:0:root:/root:/bin/sh
> +            daemon:*:1:1:daemon:/usr/sbin:/bin/sh
> +            bin:*:2:2:bin:/bin:/bin/sh
> +            sys:*:3:3:sys:/dev:/bin/sh
> +            """)
> +            ),
> +            set(),
> +        )
> +
> +        # Patch file with multiple CVE IDs (space-separated)
> +        self.assertEqual(
> +            parse_cves_from_patch_contents(
> +                textwrap.dedent("""\
> +                There is an assertion in function _cairo_arc_in_directio=
n().
> +
> +                CVE: CVE-2019-6461 CVE-2019-6462
> +                Upstream-Status: Pending
> +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> +                index 390397bae..1bde774a4 100644
> +                --- a/src/cairo-arc.c
> +                +++ b/src/cairo-arc.c
> +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t    =
      *cr,
> +                    if (cairo_status (cr))
> +                        return;
> +
> +                -    assert (angle_max >=3D angle_min);
> +                +    if (angle_max < angle_min)
> +                +       return;
> +
> +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRC=
LES) {
> +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_PI)=
;
> +            """),
> +            ),
> +            {"CVE-2019-6461", "CVE-2019-6462"},
> +        )
> +
> +        # Patch file with multiple CVE IDs (comma-separated w/ both spac=
e and
> no space)
> +        self.assertEqual(
> +            parse_cves_from_patch_contents(
> +                textwrap.dedent("""\
> +                There is an assertion in function _cairo_arc_in_directio=
n().
> +
> +                CVE: CVE-2019-6461,CVE-2019-6462, CVE-2019-6463
> +                Upstream-Status: Pending
> +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> +                index 390397bae..1bde774a4 100644
> +                --- a/src/cairo-arc.c
> +                +++ b/src/cairo-arc.c
> +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t    =
      *cr,
> +                    if (cairo_status (cr))
> +                        return;
> +
> +                -    assert (angle_max >=3D angle_min);
> +                +    if (angle_max < angle_min)
> +                +       return;
> +
> +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRC=
LES) {
> +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_PI)=
;
> +
> +            """),
> +            ),
> +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463"},
> +        )
> +
> +        # Patch file with multiple CVE IDs (&-separated)
> +        self.assertEqual(
> +            parse_cves_from_patch_contents(
> +                textwrap.dedent("""\
> +                There is an assertion in function _cairo_arc_in_directio=
n().
> +
> +                CVE: CVE-2019-6461 & CVE-2019-6462
> +                Upstream-Status: Pending
> +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> +                index 390397bae..1bde774a4 100644
> +                --- a/src/cairo-arc.c
> +                +++ b/src/cairo-arc.c
> +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t    =
      *cr,
> +                    if (cairo_status (cr))
> +                        return;
> +
> +                -    assert (angle_max >=3D angle_min);
> +                +    if (angle_max < angle_min)
> +                +       return;
> +
> +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRC=
LES) {
> +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_PI)=
;
> +            """),
> +            ),
> +            {"CVE-2019-6461", "CVE-2019-6462"},
> +        )
> +
> +        # Patch file with multiple lines with CVE IDs
> +        self.assertEqual(
> +            parse_cves_from_patch_contents(
> +                textwrap.dedent("""\
> +                There is an assertion in function _cairo_arc_in_directio=
n().
> +
> +                CVE: CVE-2019-6461 & CVE-2019-6462
> +
> +                CVE: CVE-2019-6463 & CVE-2019-6464
> +                Upstream-Status: Pending
> +                Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> +                index 390397bae..1bde774a4 100644
> +                --- a/src/cairo-arc.c
> +                +++ b/src/cairo-arc.c
> +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t    =
      *cr,
> +                    if (cairo_status (cr))
> +                        return;
> +
> +                -    assert (angle_max >=3D angle_min);
> +                +    if (angle_max < angle_min)
> +                +       return;
> +
> +                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRC=
LES) {
> +                    angle_max =3D fmod (angle_max - angle_min, 2 * M_PI)=
;
> +
> +            """),
> +            ),
> +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463", "CVE-
> 2019-6464"},
> +        )
>=20
>      def test_recipe_report_json(self):
>          config =3D """
> --
> 2.34.1


