Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED868FCD0C8
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 07:38:27 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8700.1773819500137426581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 00:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KGFziFdT;
 spf=pass (domain: siemens.com, ip: 52.101.84.0, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XknTwlGp6qGhEgi8wH5ZOImp9NjqhubSDqse/nFZKC4giGP/qILXd9AYTGTaJGywIzMNN9qz8MCAUugGvGvvGgMj8WFfO2/tZgiVV7XPALVQWNRE1tPF4W2URwYSe3KswaltdqBJGP0bgdMhesfd1pHLvXhZ03v3stm5HONJxuI2wUKj+I2lkHRYPbemaTBNqw0pvGINirBKGZN/Tm9LBeE51ArGAvbsyuTaIOGKp7KN1yqcP1NtyDyENwyVEIxv6rL+kl/yZGXWqynm6LYIKkXffBK5xzgam33u3lz1d0VFyFErjvtZxTVxkJ1wjnbdk/3AdB/zBRjhWnZQC4gCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbPIFv3Obfw5+tTisC9FdkhE0asT9AAovHgpUtpSITQ=;
 b=zKW9c07ivK5JoI21NgylIWI87Wu1b/BvOGRKo33+yB04Yw9yOnJbJa01adH6wx8boi6/x7fPq2Q6KVt4D72wvmB3y7e3ozJX+gNUHDc8ps49RJVinSXY0ID2Ipno7X7kAsplLJEMDpeeMg09fLIqJC4A+bWGU8qaTi9FhGGDT/TQbxWLaIAZlmf9cibfhCDu3s89ljlc7Yp7Tx54DhUY24FjFoV1Vcf/Z1C1thDNoUoWIFcachR9Fd86ZrMkutjAgqtrdNTTUN6Vqy4FgafN+5ky208CK/JxElD9ke7haUQ6poMHOWPLIrAJgi9WwqV2YuIcqZ7iidpZAbfPsHMMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbPIFv3Obfw5+tTisC9FdkhE0asT9AAovHgpUtpSITQ=;
 b=KGFziFdT8iIQySYDFhsbpHX9kQYVLHyJXoUFkqLpCdqJPAtT12wO3ZchcaDKLavQLt8fqfhgCFrDbA3vE+o7ntF8Wi3Q7xn3KCxZKrwwyGgUasy34gBVHZ0Hd5mMKB+1cH2vaIoPoI7rPc3mF0lb0om5vkKW+qvjsrOLigmz0vOLNppYgMRzq0RiU1dDuR40wB/+edW3gwZfpcHWJ6/HfyoGZ78vAnK7I+PGsPtzt26DygFP/zXpl8uY4bDbwmmWmlMkS1fHXXiFdATWWR7QItyVDvao75jsIR8DUtefgIT4s85VnY96zUnFycvsc3ZvSXBzaCFtJErjRAYMNwh0Lg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7360.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:444::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Wed, 18 Mar
 2026 07:38:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 07:38:14 +0000
From: "Marko, Peter (FT D EU SK BFS1)" <Peter.Marko@siemens.com>
To: "hetpat@cisco.com" <hetpat@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>,
	"vchavda@cisco.com" <vchavda@cisco.com>, Marta Rybczynska
	<rybczynska@gmail.com>
Subject: RE: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs
 during analysis
Thread-Topic: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs
 during analysis
Thread-Index: AQHctpmcrsC0XKDNrEyQluMY0EuipLWz5Xhw
Date: Wed, 18 Mar 2026 07:38:14 +0000
Message-ID: 
 <AS1PR10MB569768AA9E03C3745824BC09FD4EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260318053906.26606-1-hetpat@cisco.com>
 <20260318053906.26606-3-hetpat@cisco.com>
In-Reply-To: <20260318053906.26606-3-hetpat@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ddf75072-f6c2-442e-94cc-2de829e7b27c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-18T07:32:11Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7360:EE_
x-ms-office365-filtering-correlation-id: 4c1d4060-f420-486b-2bb3-08de84c1507e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700021|55112099003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 BW71ud22YQahsdjF3dd8pwimfrS+y3PxIkMO5nQ7HEwVrFckXczPlKylpw7jxt8wr+QjgMt0wyZX1PkgldEhJRi+0TL893Y+Y244+MrqTAvywSbi38eKmKS83F/oPEnN3HQMUtcApGZCjk9PA1gxPAuHeUPhmkry6SiQGts8BIaulp9OQDqySYqaalvJTjCpfVp3fxWkByUEfVmwe4zQfeoc/zYSKYrb/Veeu96ty+87V3ueqnb1cF0XE7JNjn1fFK3klNyc61U8WYiy7BeJF9n5WtXddp8Savg/lHJutMaXM6N2N5C7PGH9UsJxzI0Ih+TrWV5hx/FffkAJLKQIiZs2k4Hi7+T6y9g38b5X94Fbb5Mm/koTO0rH9jKPidlGdZKYckV1XawKkDr740aUFwhDCw89rYgywxKkNEzsr7mfPAqPkNHGSX0wQ4BaYFFp47ftsEcDwPumOJKfDlzX+n3DTk+7dLajbyRA1YL9rJbHvwqY2j3/jzpONrmczaG20egyGYitSUVnlj2J5rJVNeCbkPqsj3BvqoW+nE5iJsfP/Njk2peRc9VHOHf7HxHWnZZgYDuoQr18p+lil0Nk/dgKYMkJJyPaaDwZi+7lnmGpL+GTDV07ybitkFdA/MMr9U0pu7ZONcMpGKQHDmH4S2mt0MKajmeqAMmsktcDvq6+wa1bUnvmrIAeQGzjO+cbjD0fh6YyhQ484F/AwVqyyMymkVqRNj3MlvAagmagcFdqr7rEOxe3puXyQkDizXYD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700021)(55112099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0/dN+uEDn5wGmxThd1z1U+8c8rzHFr7EEjVIwg0diEqiBPxTetjOLBc6S9mM?=
 =?us-ascii?Q?bBeTSKFERlzzUI0o+wPcmRhfq1t1x/GEI/HRKOVRX4KKxze/JGxc5nPUG7yP?=
 =?us-ascii?Q?LiHa+m2X/ZQQ1eYDiAGneAevih5i0iv7r5Fus2tUFFSMMz8NSWewbdns630a?=
 =?us-ascii?Q?Dvwt2XtC6tCcCS2naVRqUWe/pI7V/0DpdCpQt/wMcOPpcACyXxWMKgtlQL+n?=
 =?us-ascii?Q?1h5ZbOJBAOY2oQ38qREp8kI/eZJrem1SLWK7pIkTD0OueS6RKGN4/YKUOR6U?=
 =?us-ascii?Q?+PufIxvUEDKB0QhEwwv7lYu2bBmu+axDZd7WI3JCRmVdiZKenji6gZNwVVwZ?=
 =?us-ascii?Q?568xuQkQB63Twgvlri+TJkbmjGuH8w5N5k/RB7SMYq/UR5rMX7zwx0925Ryl?=
 =?us-ascii?Q?s3AZKrBfJK5bHtaFGXnNN6xbEN1VrXT6b5wu9apcB5zDsmFlSug5JMYcPVYa?=
 =?us-ascii?Q?n9GAjZRl6Msqn6sSl+3G5xvLNsw0QMGxZljvXtvlz4TxRGPkCCKOsMYgRSjQ?=
 =?us-ascii?Q?5yQ/cdil7vjReqEy7ao/Xsshg1YqwHEz4kRukVsEk7Xgucw3CYXQvZMNJum0?=
 =?us-ascii?Q?OFiaC2W8iD146xasz0aptI7L35vBAQQFCRRWg9jbk7SIA19l0L0lYuMXUyLg?=
 =?us-ascii?Q?041nAozXoT/biJGDIR/y5mZdMJ/oYrYB3Ltz9jcJVx7YjHTT6KoW2quKG/Ic?=
 =?us-ascii?Q?lB6iUCxBR+qfn1Ipe4j+jS5RsZwiah7xO7YVGneVm0VvOh/fzliULT4rqDTT?=
 =?us-ascii?Q?FgpINPcVRFIyMnrGTTRejvvWdU9gQPEmpM1XPX+lDx6AzU3/x7UfJC/NtC6X?=
 =?us-ascii?Q?vt0P7NWrwmxV9LFJ2jn8ebSje7eHRVw2izhZ6L5I4YMELS/5cPsZwnAg2k7z?=
 =?us-ascii?Q?jm8Kc500Td4ZitAGtuBsObBM9j6sNqnM/TLKYO4QYMjU2Q8VcG6/ISX4Zj3i?=
 =?us-ascii?Q?y57rpPufwLW8vOZ6fMXDLPcZPfTEgFcq7KFlgfpr4bOfnyzSe+Y/kDmG5cYV?=
 =?us-ascii?Q?xV/XRgm9DA4lyzNxutehfBQe5D/ar2qk0XZ26Yf7mNcFcPL76TKxAbUyDPbp?=
 =?us-ascii?Q?2E97aXB1SmecH57gbuEJtXB2Ha4EyZoxI1h0/Q73bi6rzzEGBwAvj7FwRfwy?=
 =?us-ascii?Q?4t+Ij2zTBnJjrCbJYCce/ucC1jhgTzw0RzGXRKs6i/bYedA5dID8/wqYxYRx?=
 =?us-ascii?Q?++Wk34PG/5unx3MqRWrilTGg9MZZfBoPx7nQn5dAvhCngdDuhiBUFNAscky3?=
 =?us-ascii?Q?1hS1PsLn2HSjiBL35CkjyYs3qkUeJZxKkcUOroBnNcMkjOFdx6BXOxQ0wwhW?=
 =?us-ascii?Q?L01zBVvjGL0LR/jY0sXqWaAo+v5spL5bDj2tvTr2jro1CRbX5TFgCI/ANZ67?=
 =?us-ascii?Q?AU0bY7bZZnhaUokc+5VKtimosLq5VFsF97J9s8hlbaQiCelT9Q+L1D4OeKD0?=
 =?us-ascii?Q?t3o+xBfzWw++4+mUp+/hpV5A4IXYJNfj7lwiQtmcSrRbkGGjAaLzzOGRlmAD?=
 =?us-ascii?Q?aiO5NS/+Q2hyIfDg4v8kKWtdwYFgT8fmnxLBRQ9k3FXn0OSjhAbfBlm0yJmr?=
 =?us-ascii?Q?ZGoKAS31PXkR5GVOwCu0JiHzMEIgxupBFVm6UwmXujU/Awz2vH/4OXnd12dG?=
 =?us-ascii?Q?mzH1fJxIfL/JbmA1JSARaGPD1nKnagmsUShmw+BlCIEIE0GwaptI5GTiLyLF?=
 =?us-ascii?Q?VLF1nGt5MnBFabuTVQ8TgfZMChnnMf7hpX7v4Lzhb0MOjWlJ8iuh/S6E95dU?=
 =?us-ascii?Q?XI9h2yBg5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1d4060-f420-486b-2bb3-08de84c1507e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 07:38:14.6731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JNCTDnsu8cv7BGxTKdxxzPh+HqpBuWqQqLOzXERQa5fFPGP7CHQq2eMAWYdMMjTZYe+eJnY5cMXAvD90qLtLAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7360
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 07:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233367

If I remember correctly, this commit brings significant (breaking) change h=
ow ignored CVEs are reported.
Before, only ignored CVEs matching NVD DB are reported, after, all ignored =
CVEs are reported.

Therefore it would also need a change in common cve includes (like https://=
git.openembedded.org/openembedded-core/commit/?id=3De1bf43561093b3b9215cde9=
e9f7d80b4ffcdc64e).
And change all such files in user layers, so updating migration notes (whic=
h was unfortunately not done for new releases, however this patch is trying=
 to do this in mid of LTS release).

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Wednesday, March 18, 2026 6:39
> To: openembedded-core@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; vchavda@cisco.com
> Subject: [OE-core] [scarthgap] [PATCH v1 2/4] cve-check: annotate CVEs du=
ring
> analysis
>=20
> From: Marta Rybczynska <rybczynska@gmail.com>
>=20
> Add status information for each CVE under analysis.
>=20
> Previously the information passed between different function of the
> cve-check class included only tables of patched, unpatched, ignored
> vulnerabilities and the general status of the recipe.
>=20
> The VEX work requires more information, and we need to pass them
> between different functions, so that it can be enriched as the
> analysis progresses. Instead of multiple tables, use a single one
> with annotations for each CVE encountered. For example, a patched
> CVE will have:
>=20
> {"abbrev-status": "Patched", "status": "version-not-in-range"}
>=20
> abbrev-status contains the general status (Patched, Unpatched,
> Ignored and Unknown that will be added in the VEX code)
> status contains more detailed information that can come from
> CVE_STATUS and the analysis.
>=20
> Additional fields of the annotation include for example the name
> of the patch file fixing a given CVE.
>=20
> We also use the annotation in CVE_STATUS to filter out entries
> that do not apply to the given recipe
>=20
> Backport Changes:
> - Cherry-picking this patch, which precedes commit [358dbfcd80ae] in
> master. Since commit [358dbfcd80ae] was already cherry-picked earlier
> in scarthgap, adjusted the changes accordingly to avoid conflicts.
>=20
> Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 452e605b55ad61c08f4af7089a5a9c576ca28f7d)
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta/classes/cve-check.bbclass | 214 +++++++++++++++++----------------
>  meta/lib/oe/cve_check.py       |  35 +++++-
>  2 files changed, 142 insertions(+), 107 deletions(-)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
> index de5ddf6f04..32fb9e8a5c 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -176,10 +176,10 @@ python do_cve_check () {
>                  patched_cves =3D get_patched_cves(d)
>              except FileNotFoundError:
>                  bb.fatal("Failure in searching patches")
> -            ignored, patched, unpatched, status =3D check_cves(d, patche=
d_cves)
> -            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE") =
=3D=3D "1"
> and status):
> -                cve_data =3D get_cve_info(d, patched + unpatched + ignor=
ed)
> -                cve_write_data(d, patched, unpatched, ignored, cve_data,=
 status)
> +            cve_data, status =3D check_cves(d, patched_cves)
> +            if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "=
1" and
> status):
> +                get_cve_info(d, cve_data)
> +                cve_write_data(d, cve_data, status)
>          else:
>              bb.note("No CVE database found, skipping CVE check")
>=20
> @@ -287,7 +287,51 @@ ROOTFS_POSTPROCESS_COMMAND:prepend =3D
> "${@'cve_check_write_rootfs_manifest ' if d
>  do_rootfs[recrdeptask] +=3D "${@'do_cve_check' if
> d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
>  do_populate_sdk[recrdeptask] +=3D "${@'do_cve_check' if
> d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
>=20
> -def check_cves(d, patched_cves):
> +def cve_is_ignored(d, cve_data, cve):
> +    if cve not in cve_data:
> +        return False
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
> +        return True
> +    return False
> +
> +def cve_is_patched(d, cve_data, cve):
> +    if cve not in cve_data:
> +        return False
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Patched":
> +        return True
> +    return False
> +
> +def cve_update(d, cve_data, cve, entry):
> +    # If no entry, just add it
> +    if cve not in cve_data:
> +        cve_data[cve] =3D entry
> +        return
> +    # If we are updating, there might be change in the status
> +    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve,
> cve_data[cve]['abbrev-status'], entry['abbrev-status']))
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Unknown":
> +        cve_data[cve] =3D entry
> +        return
> +    if cve_data[cve]['abbrev-status'] =3D=3D entry['abbrev-status']:
> +        return
> +    # Update like in {'abbrev-status': 'Patched', 'status': 'version-not=
-in-range'} to
> {'abbrev-status': 'Unpatched', 'status': 'version-in-range'}
> +    if entry['abbrev-status'] =3D=3D "Unpatched" and cve_data[cve]['abbr=
ev-status'] =3D=3D
> "Patched":
> +        if entry['status'] =3D=3D "version-in-range" and cve_data[cve]['=
status'] =3D=3D
> "version-not-in-range":
> +            # New result from the scan, vulnerable
> +            cve_data[cve] =3D entry
> +            bb.debug("CVE entry %s update from Patched to Unpatched from=
 the
> scan result" % cve)
> +            return
> +    if entry['abbrev-status'] =3D=3D "Patched" and cve_data[cve]['abbrev=
-status'] =3D=3D
> "Unpatched":
> +        if entry['status'] =3D=3D "version-not-in-range" and cve_data[cv=
e]['status'] =3D=3D
> "version-in-range":
> +            # Range does not match the scan, but we already have a vulne=
rable
> match, ignore
> +            bb.debug("CVE entry %s update from Patched to Unpatched from=
 the
> scan result - not applying" % cve)
> +            return
> +    # If we have an "Ignored", it has a priority
> +    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
> +        bb.debug("CVE %s not updating because Ignored" % cve)
> +        return
> +    bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve,
> cve_data[cve], entry))
> +
> +def check_cves(d, cve_data):
>      """
>      Connect to the NVD database and find unpatched cves.
>      """
> @@ -297,28 +341,19 @@ def check_cves(d, patched_cves):
>      real_pv =3D d.getVar("PV")
>      suffix =3D d.getVar("CVE_VERSION_SUFFIX")
>=20
> -    cves_unpatched =3D []
> -    cves_ignored =3D []
>      cves_status =3D []
>      cves_in_recipe =3D False
>      # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
>      products =3D d.getVar("CVE_PRODUCT").split()
>      # If this has been unset then we're not scanning for CVEs here (for =
example,
> image recipes)
>      if not products:
> -        return ([], [], [], [])
> +        return ([], [])
>      pv =3D d.getVar("CVE_VERSION").split("+git")[0]
>=20
>      # If the recipe has been skipped/ignored we return empty lists
>      if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
>          bb.note("Recipe has been skipped by cve-check")
> -        return ([], [], [], [])
> -
> -    # Convert CVE_STATUS into ignored CVEs and check validity
> -    cve_ignore =3D []
> -    for cve in (d.getVarFlags("CVE_STATUS") or {}):
> -        decoded_status =3D decode_cve_status(d, cve)
> -        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Ignored":
> -            cve_ignore.append(cve)
> +        return ([], [])
>=20
>      import sqlite3
>      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
> @@ -337,11 +372,10 @@ def check_cves(d, patched_cves):
>          for cverow in cve_cursor:
>              cve =3D cverow[0]
>=20
> -            if cve in cve_ignore:
> +            if cve_is_ignored(d, cve_data, cve):
>                  bb.note("%s-%s ignores %s" % (product, pv, cve))
> -                cves_ignored.append(cve)
>                  continue
> -            elif cve in patched_cves:
> +            elif cve_is_patched(d, cve_data, cve):
>                  bb.note("%s has been patched" % (cve))
>                  continue
>              # Write status once only for each product
> @@ -357,7 +391,7 @@ def check_cves(d, patched_cves):
>              for row in product_cursor:
>                  (_, _, _, version_start, operator_start, version_end, op=
erator_end) =3D row
>                  #bb.debug(2, "Evaluating row " + str(row))
> -                if cve in cve_ignore:
> +                if cve_is_ignored(d, cve_data, cve):
>                      ignored =3D True
>=20
>                  version_start =3D convert_cve_version(version_start)
> @@ -396,16 +430,16 @@ def check_cves(d, patched_cves):
>                  if vulnerable:
>                      if ignored:
>                          bb.note("%s is ignored in %s-%s" % (cve, pn, rea=
l_pv))
> -                        cves_ignored.append(cve)
> +                        cve_update(d, cve_data, cve, {"abbrev-status": "=
Ignored"})
>                      else:
>                          bb.note("%s-%s is vulnerable to %s" % (pn, real_=
pv, cve))
> -                        cves_unpatched.append(cve)
> +                        cve_update(d, cve_data, cve, {"abbrev-status": "=
Unpatched",
> "status": "version-in-range"})
>                      break
>              product_cursor.close()
>=20
>              if not vulnerable:
>                  bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, =
cve))
> -                patched_cves.add(cve)
> +                cve_update(d, cve_data, cve, {"abbrev-status": "Patched"=
, "status":
> "version-not-in-range"})
>          cve_cursor.close()
>=20
>          if not cves_in_product:
> @@ -413,49 +447,46 @@ def check_cves(d, patched_cves):
>              cves_status.append([product, False])
>=20
>      conn.close()
> -    diff_ignore =3D list(set(cve_ignore) - set(cves_ignored))
> -    if diff_ignore:
> -        oe.qa.handle_error("cve_status_not_in_db", "Found CVE (%s) with
> CVE_STATUS set that are not found in database for this component" % "
> ".join(diff_ignore), d)
>=20
>      if not cves_in_recipe:
>          bb.note("No CVE records for products in recipe %s" % (pn))
>=20
> -    return (list(cves_ignored), list(patched_cves), cves_unpatched, cves=
_status)
> +    return (cve_data, cves_status)
>=20
> -def get_cve_info(d, cves):
> +def get_cve_info(d, cve_data):
>      """
>      Get CVE information from the database.
>      """
>=20
>      import sqlite3
>=20
> -    cve_data =3D {}
>      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
>      conn =3D sqlite3.connect(db_file, uri=3DTrue)
>=20
> -    for cve in cves:
> +    for cve in cve_data:
>          cursor =3D conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,=
))
>          for row in cursor:
> -            cve_data[row[0]] =3D {}
> -            cve_data[row[0]]["summary"] =3D row[1]
> -            cve_data[row[0]]["scorev2"] =3D row[2]
> -            cve_data[row[0]]["scorev3"] =3D row[3]
> -            cve_data[row[0]]["scorev4"] =3D row[4]
> -            cve_data[row[0]]["modified"] =3D row[5]
> -            cve_data[row[0]]["vector"] =3D row[6]
> -            cve_data[row[0]]["vectorString"] =3D row[7]
> +            # The CVE itdelf has been added already
> +            if row[0] not in cve_data:
> +                bb.note("CVE record %s not present" % row[0])
> +                continue
> +            #cve_data[row[0]] =3D {}
> +            cve_data[row[0]]["NVD-summary"] =3D row[1]
> +            cve_data[row[0]]["NVD-scorev2"] =3D row[2]
> +            cve_data[row[0]]["NVD-scorev3"] =3D row[3]
> +            cve_data[row[0]]["NVD-scorev4"] =3D row[4]
> +            cve_data[row[0]]["NVD-modified"] =3D row[5]
> +            cve_data[row[0]]["NVD-vector"] =3D row[6]
> +            cve_data[row[0]]["NVD-vectorString"] =3D row[7]
>          cursor.close()
>      conn.close()
> -    return cve_data
>=20
> -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
> +def cve_write_data_text(d, cve_data):
>      """
>      Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>      CVE manifest if enabled.
>      """
>=20
> -    from oe.cve_check import decode_cve_status
> -
>      cve_file =3D d.getVar("CVE_CHECK_LOG")
>      fdir_name  =3D d.getVar("FILE_DIRNAME")
>      layer =3D fdir_name.split("/")[-3]
> @@ -472,7 +503,7 @@ def cve_write_data_text(d, patched, unpatched, ignore=
d,
> cve_data):
>          return
>=20
>      # Early exit, the text format does not report packages without CVEs
> -    if not patched+unpatched+ignored:
> +    if not len(cve_data):
>          return
>=20
>      nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
> @@ -481,37 +512,30 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
>      bb.utils.mkdirhier(os.path.dirname(cve_file))
>=20
>      for cve in sorted(cve_data):
> -        is_patched =3D cve in patched
> -        is_ignored =3D cve in ignored
> -
> -        status =3D "Unpatched"
> -        if (is_patched or is_ignored) and not report_all:
> +        if not report_all and (cve_data[cve]["abbrev-status"] =3D=3D "Pa=
tched" or
> cve_data[cve]["abbrev-status"] =3D=3D "Ignored"):
>              continue
> -        if is_ignored:
> -            status =3D "Ignored"
> -        elif is_patched:
> -            status =3D "Patched"
> -        else:
> -            # default value of status is Unpatched
> -            unpatched_cves.append(cve)
> -
>          write_string +=3D "LAYER: %s\n" % layer
>          write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN")
>          write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDP=
E"),
> d.getVar("PV"))
>          write_string +=3D "CVE: %s\n" % cve
> -        write_string +=3D "CVE STATUS: %s\n" % status
> -        status_details =3D decode_cve_status(d, cve)
> -        if 'detail' in status_details:
> -            write_string +=3D "CVE DETAIL: %s\n" % status_details['detai=
l']
> -        if 'description' in status_details:
> -            write_string +=3D "CVE DESCRIPTION: %s\n" % status_details['=
description']
> -        write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
> -        write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev2"]
> -        write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev3"]
> -        write_string +=3D "CVSS v4 BASE SCORE: %s\n" % cve_data[cve]["sc=
orev4"]
> -        write_string +=3D "VECTOR: %s\n" % cve_data[cve]["vector"]
> -        write_string +=3D "VECTORSTRING: %s\n" % cve_data[cve]["vectorSt=
ring"]
> +        write_string +=3D "CVE STATUS: %s\n" % cve_data[cve]["abbrev-sta=
tus"]
> +
> +        if 'status' in cve_data[cve]:
> +            write_string +=3D "CVE DETAIL: %s\n" % cve_data[cve]["status=
"]
> +        if 'justification' in cve_data[cve]:
> +            write_string +=3D "CVE DESCRIPTION: %s\n" %
> cve_data[cve]["justification"]
> +
> +        if "NVD-summary" in cve_data[cve]:
> +            write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["NVD-
> summary"]
> +            write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]=
["NVD-
> scorev2"]
> +            write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]=
["NVD-
> scorev3"]
> +            write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]=
["NVD-
> scorev4"]
> +            write_string +=3D "VECTOR: %s\n" % cve_data[cve]["NVD-vector=
"]
> +            write_string +=3D "VECTORSTRING: %s\n" % cve_data[cve]["NVD-
> vectorString"]
> +
>          write_string +=3D "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
> +        if cve_data[cve]["abbrev-status"] =3D=3D "Unpatched":
> +            unpatched_cves.append(cve)
>=20
>      if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1"=
:
>          bb.warn("Found unpatched CVE (%s), for more information check %s=
" % ("
> ".join(unpatched_cves),cve_file))
> @@ -563,13 +587,11 @@ def cve_check_write_json_output(d, output, direct_f=
ile,
> deploy_file, manifest_fi
>          with open(index_path, "a+") as f:
>              f.write("%s\n" % fragment_path)
>=20
> -def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_st=
atus):
> +def cve_write_data_json(d, cve_data, cve_status):
>      """
>      Prepare CVE data for the JSON format, then write it.
>      """
>=20
> -    from oe.cve_check import decode_cve_status
> -
>      output =3D {"version":"1", "package": []}
>      nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
>=20
> @@ -587,8 +609,6 @@ def cve_write_data_json(d, patched, unpatched, ignore=
d,
> cve_data, cve_status):
>      if include_layers and layer not in include_layers:
>          return
>=20
> -    unpatched_cves =3D []
> -
>      product_data =3D []
>      for s in cve_status:
>          p =3D {"product": s[0], "cvesInRecord": "Yes"}
> @@ -603,40 +623,32 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
>          "version" : package_version,
>          "products": product_data
>      }
> +
>      cve_list =3D []
>=20
>      for cve in sorted(cve_data):
> -        is_patched =3D cve in patched
> -        is_ignored =3D cve in ignored
> -        status =3D "Unpatched"
> -        if (is_patched or is_ignored) and not report_all:
> +        if not report_all and (cve_data[cve]["abbrev-status"] =3D=3D "Pa=
tched" or
> cve_data[cve]["abbrev-status"] =3D=3D "Ignored"):
>              continue
> -        if is_ignored:
> -            status =3D "Ignored"
> -        elif is_patched:
> -            status =3D "Patched"
> -        else:
> -            # default value of status is Unpatched
> -            unpatched_cves.append(cve)
> -
>          issue_link =3D "%s%s" % (nvd_link, cve)
>=20
>          cve_item =3D {
>              "id" : cve,
> -            "summary" : cve_data[cve]["summary"],
> -            "scorev2" : cve_data[cve]["scorev2"],
> -            "scorev3" : cve_data[cve]["scorev3"],
> -            "scorev4" : cve_data[cve]["scorev4"],
> -            "vector" : cve_data[cve]["vector"],
> -            "vectorString" : cve_data[cve]["vectorString"],
> -            "status" : status,
> -            "link": issue_link
> +            "status" : cve_data[cve]["abbrev-status"],
> +            "link": issue_link,
>          }
> -        status_details =3D decode_cve_status(d, cve)
> -        if 'detail' in status_details:
> -            cve_item["detail"] =3D status_details['detail']
> -        if 'description' in status_details:
> -            cve_item["description"] =3D status_details['description']
> +        if 'NVD-summary' in cve_data[cve]:
> +            cve_item["summary"] =3D cve_data[cve]["NVD-summary"]
> +            cve_item["scorev2"] =3D cve_data[cve]["NVD-scorev2"]
> +            cve_item["scorev3"] =3D cve_data[cve]["NVD-scorev3"]
> +            cve_item["scorev4"] =3D cve_data[cve]["NVD-scorev4"]
> +            cve_item["vector"] =3D cve_data[cve]["NVD-vector"]
> +            cve_item["vectorString"] =3D cve_data[cve]["NVD-vectorString=
"]
> +        if 'status' in cve_data[cve]:
> +            cve_item["detail"] =3D cve_data[cve]["status"]
> +        if 'justification' in cve_data[cve]:
> +            cve_item["description"] =3D cve_data[cve]["justification"]
> +        if 'resource' in cve_data[cve]:
> +            cve_item["patch-file"] =3D cve_data[cve]["resource"]
>          cve_list.append(cve_item)
>=20
>      package_data["issue"] =3D cve_list
> @@ -648,12 +660,12 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
>=20
>      cve_check_write_json_output(d, output, direct_file, deploy_file, man=
ifest_file)
>=20
> -def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
> +def cve_write_data(d, cve_data, status):
>      """
>      Write CVE data in each enabled format.
>      """
>=20
>      if d.getVar("CVE_CHECK_FORMAT_TEXT") =3D=3D "1":
> -        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
> +        cve_write_data_text(d, cve_data)
>      if d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1":
> -        cve_write_data_json(d, patched, unpatched, ignored, cve_data, st=
atus)
> +        cve_write_data_json(d, cve_data, status)
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index 767d1a6750..37230b7957 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -88,7 +88,7 @@ def get_patched_cves(d):
>      # (cve_match regular expression)
>      cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECA=
SE)
>=20
> -    patched_cves =3D set()
> +    patched_cves =3D {}
>      patches =3D oe.patch.src_patches(d)
>      bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
>      for url in patches:
> @@ -98,7 +98,7 @@ def get_patched_cves(d):
>          fname_match =3D cve_file_name_match.search(patch_file)
>          if fname_match:
>              cve =3D fname_match.group(1).upper()
> -            patched_cves.add(cve)
> +            patched_cves[cve] =3D {"abbrev-status": "Patched", "status":=
 "fix-file-
> included", "resource": patch_file}
>              bb.debug(2, "Found %s from patch file name %s" % (cve, patch=
_file))
>=20
>          # Remote patches won't be present and compressed patches won't b=
e
> @@ -124,7 +124,7 @@ def get_patched_cves(d):
>              cves =3D patch_text[match.start()+5:match.end()]
>              for cve in cves.split():
>                  bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
> -                patched_cves.add(cve)
> +                patched_cves[cve] =3D {"abbrev-status": "Patched", "stat=
us": "fix-file-
> included", "resource": patch_file}
>                  text_match =3D True
>=20
>          if not fname_match and not text_match:
> @@ -133,9 +133,15 @@ def get_patched_cves(d):
>      # Search for additional patched CVEs
>      for cve in (d.getVarFlags("CVE_STATUS") or {}):
>          decoded_status =3D decode_cve_status(d, cve)
> -        if 'mapping' in decoded_status and decoded_status['mapping'] =3D=
=3D
> "Patched":
> -            bb.debug(2, "CVE %s is additionally patched" % cve)
> -            patched_cves.add(cve)
> +        products =3D d.getVar("CVE_PRODUCT")
> +        if has_cve_product_match(decoded_status, products) =3D=3D True:
> +            patched_cves[cve] =3D {
> +                "abbrev-status": decoded_status["mapping"],
> +                "status": decoded_status["detail"],
> +                "justification": decoded_status["description"],
> +                "affected-vendor": decoded_status["vendor"],
> +                "affected-product": decoded_status["product"]
> +            }
>=20
>      return patched_cves
>=20
> @@ -286,3 +292,20 @@ def extend_cve_status(d):
>                  d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_=
group,
> "status"))
>          else:
>              bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" %
> cve_status_group)
> +
> +def has_cve_product_match(detailed_status, products):
> +    """
> +    Check product/vendor match between detailed_status from
> decode_cve_status and a string of
> +    products (like from CVE_PRODUCT)
> +    """
> +    for product in products.split():
> +        vendor =3D "*"
> +        if ":" in product:
> +            vendor, product =3D product.split(":", 1)
> +
> +        if (vendor =3D=3D detailed_status["vendor"] or detailed_status["=
vendor"] =3D=3D "*")
> and \
> +            (product =3D=3D detailed_status["product"] or detailed_statu=
s["product"] =3D=3D
> "*"):
> +            return True
> +
> +    #if no match, return False
> +    return False

