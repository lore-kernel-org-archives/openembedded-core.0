Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCCEC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 19:17:28 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.43])
 by mx.groups.io with SMTP id smtpd.web10.54973.1674674246050578529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 11:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=uEbBC0p1;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.43, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFbtV3tQv6UjoXWkXJmlQyDLADRZRaQIpWb0vbGmku9Fp7pbmMcCMbo4tXpgergtOxbEBU3CLDPjuJRUbsnK6fCza5+AmYNa7S2gyx9hbv+TnO1tHV+R8NYC+bFVYQh108bpIjb2HHHXV91wDksNI6Yn9wnN68ihmN2jbI3Lfh6UbQf8/IgMQtnmigglkMDkOl/U+8gFlytgM17c6XBW9gYK9Xnq+cdSnCZMuHd3mGz/b8MYuGJX4LHQLg0BeY/lCby24S2Z8Aw+/FlX4P9GDgCHn20cSybb+ZDLYQ60fUy4/+ceqFVnlZs+D3A6E4cKuc7tAE7IKWw7o9O3b1sL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bjvZNxHINbCQiuM48liTM11u7mYEU1y9b3n3cegEm0=;
 b=bj1wF8S8IPEh8F+76peG9OKvnDU06OMYMOl4si/HHi9TlxKCk9v8XcXikV7Kv1IXlFlgOGcr82lkOLNvheaiWXEKWWtuvZLgOZBeN7vYaqr/nEreYC2aFLJ+KRzau+5rIp6Y+TGoPr0ny41HtXBHSVFXHnkqf4VBMaU+VpTQaUaKW4PmEtwBRwe95wvA4UQDBwwLwY5u3PZyjt4GCzCRNXCRZKEZsb2SmfwNvjEUFHLTSokoKaR8oENOYWZCX8+ex8bZBlBI38hw1NX8CgNRqXZ62J9Lo0m3bmK5She6sNPPSdjfUdFnlK5lAIA/JrnLxsR8auDHZHqvHNDZhHWb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bjvZNxHINbCQiuM48liTM11u7mYEU1y9b3n3cegEm0=;
 b=uEbBC0p1REY5VGd56pH0h5SqK5EFzt/pOpGMX/jt/e6+2fmWdlTRLszBEOSUvheNk/ukt/FuTJYu5UqMZm9lxbbpJXEyDGWzfRDifzDkdfhAHRjzffxt89+7Gy5ZEMXXr/o2ZyLMAC41F3KevFfrbs2nCXPgh9lG/hLLeymBG5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 19:17:23 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::675a:ba6d:12bc:752%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 19:17:23 +0000
Message-ID: <cccfbf0c-5bb9-45f2-db6d-4d2692a7b729@amd.com>
Date: Wed, 25 Jan 2023 12:17:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Openembedded Core <openembedded-core@lists.openembedded.org>,
 "Hatle, Mark" <mark.hatle@amd.com>, ticotimo@gmail.com
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Subject: python3-bqplot build issues
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MW4PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:303:8f::26) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a9714b-5de3-4058-6603-08daff08c9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JwxFoBDVXxKSLbkNQIGBu+DMb4SeMUsI7CRs6O5nZ/kDWZwV2c7eABlDyhs0uFVwFWkivpPmPNwjR77q6AMrhq/lUAoiPxTziLUcebEjU+24E7bOQ/1EqkDCafV7OKN06KRMK1zrTiNdT4+yudBgftsH7seiAJWza0ncIeL2UqBJxJrF2vq0EiagJoij0aPlQrMExFbE/UljkW7gl4Hn/IGPs8Kk+PdDnG1WBw/uaccJmPzY3W+gS96/5NTkYLnxVNmclCwV1+5df8dbudoQn1VNFtNLu8JxOqeOO6HbyK6OmyL0XUWqqflNMuFn8CQe7VCce/7V4X7piczvv/VNTlerHDKCeJ4bSC4z4R4H86ORqWO0saNtwps5U+mGA7JRlyOuFMY7RUj8R3TtsYeWcZ4mIMfRmiYnqGDhXt+sFJW0X+Q0fgvJczGQFJvqpIL5WHPQ3H2Z/cBG3izARQDX/Ao0zJHxukMvP5m1NWmbpojsUJHudyWl1rDGh7RK4pOFOm6z2tgnXvVYl412mTnux5kN4BF/rjGdtLBgzQ9fFSfFtkwgGNOtPaoc5wYjrByavygDslEVoEcNsHb7z/OCP52AyavctvI2ThQGsud5NaftlR8R7gAeV91bNocyk4uFDOwg4/+EO5ReCRBB9iYDBWgr7a5ilBeJbDu9oIOaCn30sXXuqJ+ylTBDvE58z5S7rQ1AKVRjKpXwoAeNI4GAEpeWNao7j9Dh2T785KNfF4ivEHTGxholjfULLKLPl7b85UStt5Ti0INnCeHdpnex5+h2VSfuh4I2DLl/8cR+MiLNxl5TevngGFyABtVJEL6k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199018)(83380400001)(6486002)(31696002)(38100700002)(2906002)(966005)(8936002)(41300700001)(5660300002)(66476007)(110136005)(6506007)(53546011)(6512007)(8676002)(66556008)(186003)(2616005)(66946007)(6666004)(316002)(26005)(36756003)(86362001)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8iD7QQXVfkPb5JgPLZgsikUXn2N/S7m1v7CI12Xf7c7ssb7n7uuyxc1joT9H?=
 =?us-ascii?Q?95c/y3tJjSDXT2d2fpkgMe2BGI+tt9WOL+5ynIDRFGNR4wqojHlw3LIouO5k?=
 =?us-ascii?Q?9brXwGArrzSU0JU/eSzvtlqWHvzb9dXBFyFibCFR/ZeIli4nAr4u/kdvo1cG?=
 =?us-ascii?Q?4kLwT7T1hO3dYqtg8vksus4LLuWu9bxQNZyPqzs3qL6pzlqXO5SHII+w28fK?=
 =?us-ascii?Q?8IdCNtNTYh+KdFVjpkx6obeTmfdfj5DkKl3Uv/07EyYUt1YqSouCz6QUkB2k?=
 =?us-ascii?Q?NgKcw1WTX3FRCNT9hQkMlAHC476OT3sBRo5KBz6gcPhkk3H3CAjoCCnqux5t?=
 =?us-ascii?Q?oHXMrRFiREYb+llvU7oG9Tv79E2l4TqBF74+Q1iFUFijhXAfxRLKKowOhRpL?=
 =?us-ascii?Q?n60qn8d9RtKZEWnsCRmQWjXBHv79bs3b0EgldYe6+cw27wSntmoFjate9M91?=
 =?us-ascii?Q?2aBpZN5K73rvjDGDxALpkpdMRiAfP7xSHtuXi3u2RBCK7d3+JXn7/A/Ab/cl?=
 =?us-ascii?Q?CGpEOqqEjVauuYnO0piv3dsADwFY57SK4dk+C/hP10kQ2j7/2oeYrz6/jMHR?=
 =?us-ascii?Q?aqz6Mxl5EAw5gimg/gnbGyUnJSiP70yPKyCznzB8toQ370zTAkNHy0FwlSvS?=
 =?us-ascii?Q?BtvKfnFBfBqbJeAQfkBYpNxdDWcXkqsN89E0zg/VcIyC6flvoCdYQYSOv6aI?=
 =?us-ascii?Q?q9JhJQm9y6uC5CzqoQEm1iIgespyAlo5U9hnh78DjRBPZd72LQ+/hR1ZRNBj?=
 =?us-ascii?Q?W+g0UtlEWe8ImFnV2/VO2GNAWVEvo+FqtcGJzUTQql+JPNtge3Jex9lhFM+M?=
 =?us-ascii?Q?sCk4mlzx2cc3kklgiNfNhMyzkxE2ojtR5+wvvDNLtcF9RsOXGiu/GG2aVZ3F?=
 =?us-ascii?Q?LSL16h3NhSyCA2QyxUUIS0srtA9V8Zqc6DWt9YV4yWw2HkYlqrcO5bK0F5wf?=
 =?us-ascii?Q?dkk/rZXwzJG1NtRFkpX8adUaMdqBsfSRjwUVtfnQA/+TYuSouE/f85GdUwVW?=
 =?us-ascii?Q?jZ2U7qHikossr/VMtLQNsa0WltpUffJmD457YjPNNR8P2uWGt82zxUWczQU7?=
 =?us-ascii?Q?40uquKmsSyX27sGELLOPG3mr0LR2KpeOtC5onVAHgJt5bGiD51suq2CUScEx?=
 =?us-ascii?Q?Vx61ZpHg5wylVI9KlrrbZ770xVNLurqFpIpmazNCPVDqJdtMMZzNqDeQ0Ni7?=
 =?us-ascii?Q?MqyfM2HO+Rnfz9WdCXd2AW2wjjpliOAxMdgI/6aP7YvO5sl8pJkvD+F5+Gi+?=
 =?us-ascii?Q?cWb2ucJjnxvYWJTXe/eZUm3u6NrJhOo5jSpVBU6Oz4q3OPNliDSLdOwrC8Jh?=
 =?us-ascii?Q?KByjtv85BhXrU1CV/AYvkQOspb7i3epEtE9eS/v88F5IJm5h6IVraQpyn9aj?=
 =?us-ascii?Q?76exmPglXE9s29lWUFOq/MWm7j6lYxYFJxKB3yCp/s+XSAIJ+PXsZEIHJwyQ?=
 =?us-ascii?Q?No6GgOZ/hf+bgRE1Bt/cXUF1Zd32EKCm6ZFx8PKMZgDdRUJwBV9adsILFgi7?=
 =?us-ascii?Q?72TW22lqDQ/KDS6F9vHmaICXg/4XgJLPPipcM3S6/3y3RIiJESDuoAhSqexL?=
 =?us-ascii?Q?01w3nNp9myH19DajR7fZ5pE00qcUWBfHDP0LeXNh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a9714b-5de3-4058-6603-08daff08c9ba
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 19:17:23.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAo+hGOikeYzY8iXF3UKGL+zrOWm7c8ZBnj+sS2+kaTrXOnzXroGX6eG8RzocUQRZE2u7KCU0yj65EX4ycM6YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 19:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176375

Hello,

I'm upgrading python3-bqplot from honister to langdale in meta-jupyter,=20
I've migrated the recipe version from 0.12.31 ->0.12.36 but I'm running=20
into build missing dependencies issues. Even if I use 0.12.31 issues=20
exists in kirkstone and langdale.

Any help from community will be much appreciated.

https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/python3=
-bqplot_0.12.31.bb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Source repo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://github.com/bqplot/bqplot/tree/0.12.36

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17 00:00:00 2001
From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Date: Tue, 13 Dec 2022 15:41:18 -0700
Subject: [PATCH] pyproject.toml: Allow jupyter packaging to be greater than
 =C2=A00.7

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
---
 =C2=A0pyproject.toml | 2 +-
 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pyproject.toml b/pyproject.toml
index ba04c53f..7a3cc3a9 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -1,3 +1,3 @@
 =C2=A0[build-system]
-requires =3D ["jupyter_packaging~=3D0.7.9", "jupyterlab~=3D3.0",=20
"setuptools>=3D40.8.0", "wheel"]
+requires =3D ["jupyter_packaging~=3D0.9,<2", "jupyterlab~=3D3.0,<4",=20
"setuptools", "wheel"]
 =C2=A0build-backend =3D "setuptools.build_meta"
--=20
2.17.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

python3-bqplot_0.12.36.bb recipe:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

SUMMARY =3D "Interactive plotting for the Jupyter notebook, using d3.js and=
 \
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ipywidgets."
LICENSE =3D "Apache-2.0"
LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D822b4ff4dd277d70fc2b796617ae1bf7=
"

PYPI_PACKAGE =3D "bqplot"
inherit pypi python_setuptools_build_meta

SRC_URI[sha256sum] =3D=20
"6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af"
SRC_URI +=3D "\
file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch \
 =C2=A0=C2=A0=C2=A0 "

RDEPENDS:${PN} +=3D " \
 =C2=A0=C2=A0 =C2=A0${PYTHON_PN}-jupyter-packaging \
 =C2=A0=C2=A0 =C2=A0${PYTHON_PN}-jupyterlab \
 =C2=A0=C2=A0 =C2=A0${PYTHON_PN}-ipywidgets \
 =C2=A0=C2=A0 =C2=A0${PYTHON_PN}-traitlets \
 =C2=A0=C2=A0 =C2=A0${PYTHON_PN}-traittypes \
 =C2=A0=C2=A0 =C2=A0${PYTHON_PN}-numpy \
 =C2=A0=C2=A0 =C2=A0${PYTHON_PN}-pandas \
 =C2=A0=C2=A0 =C2=A0"

do_install:append() {
 =C2=A0=C2=A0 =C2=A0# this files will be installed by python3-json5
 =C2=A0=C2=A0 =C2=A0rm -f=20
${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
}

FILES:${PN} +=3D "${datadir}/*"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Build error logs:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

NOTE: Executing Tasks
ERROR: python3-bqplot-0.12.36-r0 do_compile:=20
ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa=
72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.377=
7058',=20
1, None, None)
ERROR: Logfile of failure stored in:=20
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3777058
Log data follows:
| DEBUG: Executing shell function do_compile
| Missing build dependencies:
| - jupyter_packaging~=3D0.9,<2
| - jupyterlab~=3D3.0,<4
| WARNING:=20
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157=20
exit 1 from 'nativepython3 -m picobuild --source=20
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36=20
--dest=20
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/dist=20
--wheel'
| WARNING: Backtrace (BB generated script):
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1: python_pep517_do_compile,=20
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,=20
line 157
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2: do_compile,=20
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,=20
line 152
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #3: main,=20
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,=20
line 161
ERROR: Task=20
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/re=
cipes-python/python3-bqplot_0.12.36.bb:do_compile)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2249 tasks of which 2241 didn't need to=20
be rerun and 1 failed.

Summary: 1 task failed:
/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/rec=
ipes-python/python3-bqplot_0.12.36.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

Thanks,

Sandeep



