Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D237C36005
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 10:39:22 +0000 (UTC)
Received: from FR4P281CU032.outbound.protection.outlook.com (FR4P281CU032.outbound.protection.outlook.com [40.107.149.93])
 by mx.groups.io with SMTP id smtpd.web11.36065.1742812759077030480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 03:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=0mJQbyUl;
 spf=pass (domain: iris-sensing.com, ip: 40.107.149.93, mailfrom: mario.schuknecht@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8WGE4lnBc5b6THmVVGDD3Z2HNKoQ22Swdxf8WEESbpb6elNQHbRetp41L5vXFetE6PfbeSDvQDUjlxpQsuKJE/7tqU6B24qvWoQRNlSOuXnyz9p1MiQxv5HU2VTP6aCcmuUg/07FRx7QYPOzae689CmRG5kk/iwjg/3LlUQ9YTB5ykJFdC+iz7akGpcupRbBl3d+vPGsADXC9dxnn7tO6ohMf55Fq2Gh7+5WETJ1Nu5/Cyi2UIG65gDr76zrGS1QqPIa8MbQ55qhno5TwAmw7XyB1JaXW6VWG+AfOeUsrpp+Zy0CxdIka2mHSJryavE1JakM6neIL7iHFE/VDYOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pOgzKVi1iNqjNdkFpbKilib34lnr5HMhSMnXr8vcYM=;
 b=L6608JlELAHabyfudoOb9BLNfOug9YvY/y5BXNIpydGZY73HfuPeTXk9JlLeUZsZIySLF6ZxkRfnWaS4/T42qGhOXHttIaC7nph/dcweGdhXtgKZMWzlXWDKmbNJby92123N0vUohlgXgD3Z0BW1sjyNmlhZReT5diE2UEnm8YWIbOXJzCFf4EOsaBrJDl7fwCFDNrOa3ymdwgSoNyB8x3GahO9XUs3YLlQ/cBUYRJn+0krHgmtGY7pMwFZrf5whPW2Pb4CLCGN0tgKcCHttMU2Kb1d92qtea57eBI4FS6CNxQZefQ5pPjqSfkTipa4yNCMmlHtHL/GQYnLD7daBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pOgzKVi1iNqjNdkFpbKilib34lnr5HMhSMnXr8vcYM=;
 b=0mJQbyUl9mvHvCgNNaCYIQNOfDuxHC0Y2hxP0Z4OXE0gcYiXPBnbMw+7hS+XfRYTLr4X8GN5t0svlzUrQEWZoOF/WZROEvywDy1DHbargaimXuYdkSgPUyGLYmUYmyz43C8rOrLM5CL+JExuHrwTlra1hkjcfKydsO9W9Blm/TzE14G11hstg4JP0efcxGDtunK4J8I8H+4x+mhJ1BaNrhM6ZsR/tn4+LVXMY8SihmTSIBKe0qiP/cSCifusMUEqm5LV2Aoj+1Al2BALDDXi60iYOMllKvB+HLrEo47T65vm9AB9pAmB1RSXwf8yY+vI0rpcp1vMTcs16w32winqng==
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:34::8) by
 BEZP281MB1991.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:57::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Mon, 24 Mar 2025 10:39:15 +0000
Received: from FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b]) by FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6715:31c1:c53c:270b%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 10:39:15 +0000
From: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: AW: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_package
Thread-Topic: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit
 lib_package
Thread-Index: AQHbmnPP0QBf95+sukinf7d01CDLErOBAZGAgAEZvy0=
Date: Mon, 24 Mar 2025 10:39:15 +0000
Message-ID: 
 <FR3P281MB19170866636FFF96C26464B8B6A42@FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM>
References: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
 <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
In-Reply-To: <D8NTZA6A6JBD.5NEFFO2SQS5Q@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1917:EE_|BEZP281MB1991:EE_
x-ms-office365-filtering-correlation-id: 71f1c865-6a12-4101-afc4-08dd6ac01fd8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?MkdIiLjOFNjIrKRp8t5lY6gX4qPU+odh+w70EYOo35V4HZv+dnnu92oCX0?=
 =?iso-8859-1?Q?ILGkqOX99F1okxgeirKDBMaF62q38ieGH06V3974S+venNHq9y0z8hJezW?=
 =?iso-8859-1?Q?9gKQZ6d5Aj20xxyHOHlisU/veEyBtnLseDV2bxFPQoeVcAA4RzF3RlGUBC?=
 =?iso-8859-1?Q?QkOPjV+m1tjHRVt0z7P/fiA6wssSBxB9ScGK5K8jHQstU8LGIEFd+f1HKO?=
 =?iso-8859-1?Q?sDhjhg3lBivQq6WURP0W1T0cDZ9KpbUKFcHCSY7t1dEzzj9f4IcC+/Vk73?=
 =?iso-8859-1?Q?vIkLynwnxH3o/F/WMGEMx+LX8jZcF8WsxTsQVZUISQfCx7Tyi/QD9Y5/vG?=
 =?iso-8859-1?Q?9Y30hcr/RPZvZIiMQLAASTvKpvXPQ5yNYNj1BS/ABG+5HvSTiXRspajJA9?=
 =?iso-8859-1?Q?XC64zIBoBm0Ss7vmeJdy9t45JiA0DqRTCn7YO62t9jLUrU88SiC1ftVt6r?=
 =?iso-8859-1?Q?Df/eHQdRwnZyJKBrsmrV+YeMqi/cuhaHJTc1az+wwmCOkOQcKZ7J9ih6a5?=
 =?iso-8859-1?Q?9v986DNiEEwgLgLvRBFE5IURVbPRO3FkT2V58Mid+Ao8kndYU6u3OcDHZk?=
 =?iso-8859-1?Q?VzLHmSVXQS9+c3B0UkDz7Mmu8C3l5zzprBV1QmTFRg2LRFoA8E6uuXFhx6?=
 =?iso-8859-1?Q?MqE02JQge7yoMj7nhn221pnxLb1egR58nLFjC7lrmRO7aGsuqQUwh8I4fO?=
 =?iso-8859-1?Q?3Cnt48AJHMFLV6OnBhTI4mahEQ+WLsH4ZlB2jd+RhvEnEBH6lV+Z8t6CxU?=
 =?iso-8859-1?Q?XT++fa+rjonv/Chz4bSXs79aAf209eQEoA49rdDITYY8SuJbsWtlWuB8Vr?=
 =?iso-8859-1?Q?Hp/2HkawwX0ZAcKZhENDViUXdZognXZFzG0qyGfaTixUzuYNDP++qApMqW?=
 =?iso-8859-1?Q?+AAOyTDagFIrIRwxSgYK4RUQocJ4in5DNoAgv2FkpRzCw4egCN8SJxf6qP?=
 =?iso-8859-1?Q?+LL1S+4idHk9MVwqX/MLN0pWcKOzfsT0lAZcbf4avg5O+j5LSVNB0hVLON?=
 =?iso-8859-1?Q?PyIu2YY0U3hX6pmM9eu3g0JheOPwuNXXdYpNr9AaMSLswJbXM4cDtsoFlS?=
 =?iso-8859-1?Q?cisMdzpVStfrm2i2bDpds/sEAjIBT5Genv/pW9sNZ2iynGBnhUfrL4KNTb?=
 =?iso-8859-1?Q?h1zpz5OpsZv6ztfTzSEPX3wcvBn5sdXpxyTK+UhICB93LSok2xRg2WZ9DI?=
 =?iso-8859-1?Q?/yfzTykJq+SthQODi99d3eQ93jj5gr/bqYXucLm4TNMIQJcrsVkYITxn7z?=
 =?iso-8859-1?Q?rDGiApNYc5Vy5B2Id4jTbXYZhn4+zrAYspcebxzOyH5Kf+WycWQESvaXaD?=
 =?iso-8859-1?Q?wMTZr5tkaIGx+CBFGlJOjIAhIipC5JSVPcHPs3KlqwhDu5VR256enBzseD?=
 =?iso-8859-1?Q?Cbg9zRlaeTrazsqrnSiw33T30X2KQoCd07kYeu+Nr0kqgX/xaXRTSNMAaQ?=
 =?iso-8859-1?Q?OHw+m7OrdkwWEEN/2DZWTDvZBryfQOAItpz7K4Do4ZCnUx9HhTiByq8uuW?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?RbFKjH+kWEknAE80iUBoWVW5Lt+ZLHr8aiiho8ZHSuEqC0OV6Ptit+w65L?=
 =?iso-8859-1?Q?eWVDR/8mZcYi1iqnKqmcCBtI0wSH1sTVJtcJRnCYuV+zD4wTzGUcIDP7TA?=
 =?iso-8859-1?Q?0OJhrvKHHsJLvQgXRKWilha1qkSRq+iPkElxJIX8nH7RJqXacK1RJD/ILT?=
 =?iso-8859-1?Q?q/gOUPnlGko6U1x2w+jllF1Si6CPf8DKgxXlHs1NrfpRs2GtphHDDK69m3?=
 =?iso-8859-1?Q?Rd9m5MI8bx+pomNIhy7+aBIGg79V91MyllRR7cGjRZ49ERaxiy3ZAWjtKf?=
 =?iso-8859-1?Q?plXsrF6J/jHxfFgLKyDQL0RkhtNNAG0wRm4Hvj/NAB7oPkD03m9Iwaen68?=
 =?iso-8859-1?Q?rSJIEq0YMUibbWECuNtBhyOJY3RizQCbxWpKou+4xQ+HCj+RpeQcUHf2LJ?=
 =?iso-8859-1?Q?9vQvzGaA6pT8lxIGJiOzjXATsdql6nqgWbkpWxh9wE0tUs1Pj/O4fsK5WE?=
 =?iso-8859-1?Q?zar5w+WesT2TLxGomub91PJwLA3qQkB/3Th8QFbzbQBw48zYLz/BjV3b2T?=
 =?iso-8859-1?Q?dv8eziYrLWnz3JAgsEVE7OQlyahEA1FuL5JeHHKYX5kzdNZ/58f+rYyCO/?=
 =?iso-8859-1?Q?RLryEZA8ysXrE8ZHiSEpBDjvgl16QKKxihjryCykrUrOcdNwRHPhNM1Tpi?=
 =?iso-8859-1?Q?4T5h2NmYe+JxPWMrG+xogwAWfhHsHu3vkamzOSaksQxkkxPtVMxiinfPeu?=
 =?iso-8859-1?Q?Opj5yjwPKrP1yQpIF+kKqIphBST+W28FSck07HoZUrykk5idhk4CsJ5SFX?=
 =?iso-8859-1?Q?2WwZJBYzaN8myYMJDCb/yfkM+Bq4vgLX829gVBbnC2ZQzRFtxCTFJf4aXF?=
 =?iso-8859-1?Q?LhQKfTV0rs5WMVpvrNOI4dVTP7wAYl7diIqq+G92ZTW3tLc9WqC65+sQZU?=
 =?iso-8859-1?Q?sbq4sjp1Gjq6EtCNMHZyEBNEINzDjqxxbGgmwIyv+ZvB4rydUliFPzlM13?=
 =?iso-8859-1?Q?KfG00DYAvKhRUWryzim/VLTsBow2XpisxxfTrYfP47mVZFu8rv7nLowVmz?=
 =?iso-8859-1?Q?PP8lXuIrZc07AKihAjJAnLuaYnyLoMO7vdeGGz7ZisnhSlA85t4CwsyhEa?=
 =?iso-8859-1?Q?nsTqZ2jQx/xDVfYECEsbbXdByeTqnfOvtSvbid6gPoXbExRg7aBDWWEqqe?=
 =?iso-8859-1?Q?WbppLWDtCX/iVZxkk++ayW8l17zDpE/Vozwjg4utNPk+9GOgiXgTbhqOMP?=
 =?iso-8859-1?Q?nsBtugQ3gKf6K3RBJQcwB9TqNvWCcX4tEWOiybZ75UxeeLwzsxx1k6Phqp?=
 =?iso-8859-1?Q?NrAB88Tj1uHNEF0zmnNfqxFJGNAMXPt8LN+H/lqR0NXQKpG1qyLWrexPF4?=
 =?iso-8859-1?Q?NdSIrvux7m66dnYwEHI3QN1z8T2LVC7kZ2VOZaR2QpwQ1WCeKWlZ6BpDDO?=
 =?iso-8859-1?Q?2p3UdFnIKpRVsf2jKao51zW0GIRP3W4kjp8og85WY+O3y6q385Dz2emy03?=
 =?iso-8859-1?Q?ejXspwdpaKG25ZTuiwJvrgUzbkGDNvSECbwPJCJQWFH9EhOJlcU0L+yRIJ?=
 =?iso-8859-1?Q?CvR0EZvRBjp/uvlBnDZn/+Z9ZMCv7CR1d01Pb9Ixxd205oGFTwUK/Ym0LO?=
 =?iso-8859-1?Q?VLmmxmqk8csWQYU5xQyQA8FrmfZosWtYvrXy7jl08buahTmi3BZOYPcul1?=
 =?iso-8859-1?Q?XO5gcZIcD7awodBx52ZaUjH0tR3I0jEB9a/G0/fa9h0CgEQce+9zCQRA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1917.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f1c865-6a12-4101-afc4-08dd6ac01fd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 10:39:15.6638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+elzTDBivlmFbfVX2vF17uut+x5U/xmPIADUnKuxTO3LLcHLpUQFrjEAVIxL6t7mezLqNY2s5CxqMOzwOqsEwPEBrjItCnu7e+RPK9a7T/6kgFRx2723Hl9411oboIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1991
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213524

Hi Mathieu,

thanks for your reply.

I have tried to reproduce the error but without success.

How do you set up the environment and what command do you run?

Regards,
Mario

________________________________________
Von: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Gesendet: Sonntag, 23. M=E4rz 2025 18:44
An: Mario Schuknecht <Mario.Schuknecht@iris-sensing.com>; openembedded-core=
@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
Betreff: Re: [OE-core] [meta-core][PATCH v2] libgpg-error: inherit lib_pack=
age

On Fri Mar 21, 2025 at 4:12 PM CET, Mario Schuknecht via lists.openembedded=
.org wrote:
> Inherit lib_package to create an extra libgpg-error-bin package for
> executables. As a result, the gpg-error and yat2m executables are now in
> this libgpg-error-bin package, and no longer in the libgpg-error
> package.
>
> Signed-off-by: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
> ---

Hi Mario,

Thanks for the v2, but it looks like we still have a build error:

ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Unable to install packages=
. Command '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-11=
48269/tmp/work/qemux86_64-poky-linux/core-image-full-cmdline/1.0/recipe-sys=
root-native/usr/bin/apt-get  install --allow-downgrades --allow-remove-esse=
ntial --allow-change-held-packages --allow-unauthenticated --no-remove  apt=
 dpkg gnupg packagegroup-core-boot packagegroup-core-full-cmdline packagegr=
oup-core-ssh-openssh psplash run-postinsts signing-keys-packagefeed ssh-pre=
gen-hostkeys' returned 100:
Reading package lists...
Building dependency tree...
Reading state information...
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 gnupg : Depends: gnupg-gpg but it is not going to be installed
         Depends: libgpg-error (>=3D 1.51)
         Recommends: pinentry but it is not going to be installed
E: Unable to correct problems, you have held broken packages.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/54/builds/1247
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1159

Best regards,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com/

