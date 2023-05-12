Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7361C77B75
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 12:27:42 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.23539.1683894457081844612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 05:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gO44ALav;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683894457;
  x=1715430457;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PhWDLnsrcX8383XwqgmZhXIoN1l7ImqJ5X8JGjhiD0Q=;
  b=gO44ALavzeWkzGbpnkmalMfvexoN5IDLxIqKK7UG0Mli3K1IcKzTwTRQ
   GvgwSFIxW5O8uD21zKvzyBVlIWSoTJuAvL2JXA5fGwAAzawQNelccbbw5
   uEjSuWlAo7j6RHMmXxeGJKL3Yb8xWy7WRHe+Lfl9V14T34jY/dVYXwPZu
   V1l0PgEBi8y/HygF2FpPg87uR6oza8pxIlls82UJ53H7MPw9PsbI0Q0Hh
   M5CRzgsgj0Ke8AfoV+NcZ+aS99qr4iSm01sr2XUW+sXdJDkuDkmGV0B9E
   Je7gxQ+sncMZbPw3kHpOlygwwaBg+FbNegjkc+KtqUbi2aoBzZNpCwEoR
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2V5+KoqCh30wtiCRVW2N8KnfxqZkxAZr0MzHG8U8DcPrw0R7s+jI7b5o7NmE2zI6H3X/s9MZKzYunRS4jsMQC6sJGMyGAonWUBl5ax0dYzOZO8cWX9tj1XPStuKDXrzj/Y6esInTMqhnq2uo5QK6jADQ+NeKNEiqQDJCipyd7YDX4/aeF5VT9tu9T3BWM1/Oesyvw1JMeG5PHbAwtVdaTTR8PZzrEzW3T/GOgKLqTEXDfTxuzN2vvtBr5EaPXQeFBgqrXaKWNbZw86ys0g+JMUcFCe7rWR7e4xUbKn2rp+WOOqSw5wJo85Y1d3KWJls/9NpFhImZmimYdTja1OtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhWDLnsrcX8383XwqgmZhXIoN1l7ImqJ5X8JGjhiD0Q=;
 b=FPFUTi9lCI5WwCh13T5ahs89I2rlSLo7kghU/0E11AY8vUxUleVNOEQLYSbiGJQ98TsUl1CxVmxCBlzl+iGzHkzGp0mkxffeZnGDb4SoYttOni0N0s1x1ESLYR55b6c6wIEYAvzuYUimXrwL6uYAWdL7UV7CFNKoo1/Yv7022n6rujaP1usUfVGUUtKYENdfYsnYjBnTBG7J2gpdb7Hb3UxjKGU9TcWmW4zvqUt8j48bK/j0zOPA8hFhOXhTZuUcZECle9Z/6SGZgqAxolrI4zR/GrHzR8cAMOI65rl1e38Y9E/eh3yLuR5Ec2Q05Np5qq0jb2GZLMW1QMJTE+5ekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhWDLnsrcX8383XwqgmZhXIoN1l7ImqJ5X8JGjhiD0Q=;
 b=rJpcoQJCK7VrVQQe291pzdGfPr+hW/z9nfsua6q8PCRlg5Z8P3I13zILjDZZ5C6ADimlpnewWfc6m97PpHwPVXlCrdMYce20ByU85ScXANdSoiZhrrFsf5f6SXt1efdXd3g1n/x4HQJF4bLrHS6LSgV1L3/lWS5ZyC3s1tY2L4U=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] oe-buildenv-internal: remove path from
 previous project
Thread-Topic: [OE-core][PATCH V2] oe-buildenv-internal: remove path from
 previous project
Thread-Index: AQHZhIAdSAT3T+Y49EKlg/gO7irQgK9WhDEQ
Date: Fri, 12 May 2023 12:27:29 +0000
Message-ID: <DB5PR02MB1021377099AD45EEFECFF51E6EF759@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230512031550.1715288-1-Qi.Chen@windriver.com>
In-Reply-To: <20230512031550.1715288-1-Qi.Chen@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAVPR02MB10011:EE_
x-ms-office365-filtering-correlation-id: bcf2fc56-dfdc-4236-f2a3-08db52e440e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7fAjw5vx7lNInUEnM5OQJQtimCkDX72bk/FaHedKIlTQ11baRolEazySquSZJKiP5GtgF+QyFwbyS48huzJCmM/gYNGb0/NPZPd11+DY31etcTbH9AXCVueFNPV4h+hQYx216cxKMXi+/ongGN9AedcfXhFhvBRShi66jXbszHh7ecx3+4hVNVYWtpOAQMUenrrx2ngwIh7iohDHq8lcA3xPWlo8WCzarA6wx/bkV66QZ3xQyDJmYNX8YtK1jvGUZE1pNCM05MWw35vpziXs14zhpyTzWQqdivJ1a+1hrEJS4YOYigDo9UjP8mOpoImvHrU2MTEslke7buuqSQ5SytVDXypyxFc1RRXEB20rSxoJGjkl2SYaUBVI4T+ddiiqS5m7gTrQT6keUtnL+3E5NFn1x5MLi+8COBZjj9HoWkpPJcy9kqFdK3B7i3QEl2+aUOKurWuZJW3RGcWdfEUSxkmV675FkTJyLHDyS4uMUHMzMf5lK+UTPAeA326u1BBNI29tSUb+EWMu9VYzAQOZNA5Jd+mijMxxu3CvRM5Z2bqvdrHe8PqN0R4pUthGNns3Ys3GIYfTHLAiLNlnflbpsVmJvjBLpuMUD19X1Xyd5oN+c+K426UCjeyXLdhIPhR4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(86362001)(38100700002)(38070700005)(122000001)(33656002)(41300700001)(44832011)(8936002)(8676002)(7696005)(52536014)(26005)(5660300002)(6506007)(55016003)(53546011)(2906002)(478600001)(83380400001)(71200400001)(66446008)(64756008)(66476007)(76116006)(66946007)(316002)(186003)(110136005)(66556008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rfelzHXNtTPy/Jwklt0ynDXMMzO2+YMzm35f/gucXNXFswBRTug28i7L7q0v?=
 =?us-ascii?Q?qXyGEuo/Mw92RJN26awWYre5rZ2AAs0HHWMkARLYOGtD0KT4j2WBAwm2oeGz?=
 =?us-ascii?Q?u2IlPpq5uvelGN8hgTnTk12VRGxvbTnwiKD0z/TRuy7EeLT+1slYqGvjvdU/?=
 =?us-ascii?Q?JTLQvGOSUcvoVeFwgFkjxu98e5R2T2kd8xKdtd0ctJgQekplqOT9KxZPEQPE?=
 =?us-ascii?Q?3iG+Tn61+PLzvDHwSyhNt7VipGumTKOSdREXSiwv9deS8ZUji98x2McdBrNb?=
 =?us-ascii?Q?nvUjjTZgshj4wexUjNlUJsqbuU8gRCdUpDW6SPpbRnfpSmXosvR2yN6dbLje?=
 =?us-ascii?Q?tiAMugrIDMcZVgzP3h0YdeCbqzpo27QzsHF4XsosiQcLPLhWvkcwp8O1ooCX?=
 =?us-ascii?Q?U+ZkMU+D/XvEYSQfs5f0o+FAOaahAumuf1UerHqVOhkXy3ZwMU1dkCBvfZ0g?=
 =?us-ascii?Q?jhDk/cDPaSk8yOvhuenw+aSrHviPzwi/YXAswVMh5uyRPoo0JZqMHIDNX3yF?=
 =?us-ascii?Q?rP16FDh+3sxjWWHUmCw/UYZ+WTqEBT3cl44BxLvL/2lwcTiY+YJdzmDOrdpm?=
 =?us-ascii?Q?x70FfM4JqboDkXlb54bVyPY0QQQ6r6GToXvZGsRN1R3zFARl6nqxW7J+Vd2O?=
 =?us-ascii?Q?A3ICVYsrqAyxJGbdyiviYf9MMLaBnIFDchC8SPm/FqZNrCYHRkM4KzS9wElW?=
 =?us-ascii?Q?SQWD2lKs2+yftTIhMKr+jRqlOP2BKrQ5I3M/iUaPYZoz5j5ic6nbPipYtgf9?=
 =?us-ascii?Q?dvX1/WWruwckBab6l9Expwapoeq0R1fLDp/ipHuSsLU46QxKazp3F15BMije?=
 =?us-ascii?Q?sOWO+H2F5wWsp/aruNT3ghDIOqk4n/L6c0ZG1oeXJA/NmkTnP6VRIxXWk2Ck?=
 =?us-ascii?Q?Ldg80+Z/+6lAWDWaD16hRWNyO2Enw3L+Ds0wshX+8w18ixyX/RbI6I0k8Uut?=
 =?us-ascii?Q?8pJPzYEc0Yr458Z5TVoBPzFZd5sMiOChn+0SHz0CVdXLLG5c7SUO575yCc+/?=
 =?us-ascii?Q?KEVal0IDwvUeYxxaCFHVkabI/nKzMN0HiSfFY3UIyml+rClObAJ1uNsXRAVR?=
 =?us-ascii?Q?a824jaGPaZ9er5ZAVA9uoU9R7SFH08hLIuVtDFjB0Kn2QlFIU7ugWEV6XLav?=
 =?us-ascii?Q?D+VnhY/BxRzvufdjkaQdcft5hCqo5Ln5yGNUfIzd03ZdlTCkPtjmpNuzgdXk?=
 =?us-ascii?Q?kr1GkRw1FhcIoVXaE0sKAjklFHt/TwUdIwAdLKkhWeQi+nE/Mmkr2pk8UI4x?=
 =?us-ascii?Q?2EgFGbd5Plg+vY1dInw4AzsVMBV6wudLYvKmZm/TpGQFIy2pxwwYxyElqukA?=
 =?us-ascii?Q?fNeWKg3ktxHrLFZ1ztEBJHha2gt07MadqZB0dL8zTv4iUVIiH2aSJHSciaZf?=
 =?us-ascii?Q?XbjtXkNuBK50EqlDMXc4nJqy1RDQ89RWhFxAmpu4RW4v3t+s4N71YTa4eGDo?=
 =?us-ascii?Q?dZEKnh3g/aJs+LdqlU/rLdj310YBuUK2OVN5PWYnZB9y8XL9RJL6c+AQsCIm?=
 =?us-ascii?Q?6ytcu1GQbWltjqryKPZp5GZjtFEBXd7IHMNvYq8WYprfTVIfXBCzrWlQALsS?=
 =?us-ascii?Q?pXjPNjFxT0kdbyxHoI8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf2fc56-dfdc-4236-f2a3-08db52e440e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 12:27:29.7156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvPcVjKr25DSD9wr+mLYibVSwPg2ZuFh+qDcKvVAfUhYMPDY3GlNu/KEGjbzuDsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB10011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 12:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181182

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Chen Qi via
> lists.openembedded.org
> Sent: den 12 maj 2023 05:16
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][PATCH V2] oe-buildenv-internal: remove path from previ=
ous project
>=20
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> For now, only that paths added from current project are removed

Change to:

Until now, only paths added for the current project were removed

> to avoid PATH growing unnecessarily. This is to handle the case
> of sourcing the init script into different build directories.
>=20
> However, if we source the init script from different projects into
> different build directories, the paths added by previous projects
> are not cleaned up.
>=20
> To avoid this, we record the paths added into OE_ADDED_PATH, and
> remove it in the next sourcing.
>=20
> Note that the paths, "$OEROOT/scripts:$BITBAKEDIR/bin:", are added
> as a whole. A previous commit, "oe-buildenv-internal: Add paths to $PATH =
individually",
> made the change to treat these two paths separately, the reason was
> not "assuming the path to the scripts directory always is in $PATH
> directly before the bitbake directory". But this is exactly the effect
> of the codes. I see no reason why we should complicate things.

And now I have to try to remember why I changed this seven years ago...
Unfortunately, time has taken its toll on my memory and I do not=20
remember why I changed this. It may have been as simple as to make the=20
code more generic and possibly handle more paths being added, or to take=20
into account that other things may modify PATH after oe-init-build-env=20
has been sourced. I guess I will just have to wait and see if anything=20
breaks after this change is applied...

>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  scripts/oe-buildenv-internal | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 485d4c52e1..598120a86d 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -92,15 +92,13 @@ fi
>  PYTHONPATH=3D$BITBAKEDIR/lib:$PYTHONPATH
>  export PYTHONPATH
>=20
> +# Remove old added path
> +[ -n "$OE_ADDED_PATH" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDED_PAT=
H##") || PATH=3D$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##=
")

Change to:

# Remove any paths added by sourcing this script before=20
[ "$OE_ADDED_PATHS" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDED_PATHS##"=
) ||
    PATH=3D$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##")

and rename `OE_ADDED_PATH` to `OE_ADDED_PATHS` below.

> +OE_ADDED_PATH=3D"$OEROOT/scripts:$BITBAKEDIR/bin:"

Move the above line to after the comment below.

>  # Make sure our paths are at the beginning of $PATH
> -for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
> -    # Remove any existences of $newpath from $PATH
> -    PATH=3D$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
> -
> -    # Add $newpath to $PATH
> -    PATH=3D"$newpath:$PATH"
> -done
> -unset BITBAKEDIR newpath
> +PATH=3D"$OE_ADDED_PATH$PATH"
> +export OE_ADDED_PATH

Remove `export OE_ADDED_PATH`. This is a sourced script and the=20
variable should not be needed by anything else.

> +unset BITBAKEDIR

All in all, this is how I would like it to look in the end:

# Remove any paths added by sourcing this script before=20
[ "$OE_ADDED_PATHS" ] && PATH=3D$(echo $PATH | sed -e "s#$OE_ADDED_PATHS##"=
) ||
    PATH=3D$(echo $PATH | sed -e "s#$OEROOT/scripts:$BITBAKEDIR/bin:##")

# Make sure our paths are at the beginning of $PATH
OE_ADDED_PATHS=3D"$OEROOT/scripts:$BITBAKEDIR/bin:"
PATH=3D"$OE_ADDED_PATHS$PATH"

# This is not needed any more
unset BITBAKEDIR

>=20
>  # Used by the runqemu script
>  export BUILDDIR

You may as well remove `export PATH` on the next line too. It is=20
not needed.

> --
> 2.34.1

//Peter


