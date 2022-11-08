Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D53C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:27:11 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web09.10270.1667924825975898809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@amd.com header.s=selector1 header.b=uJ0WeAR9;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.41, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evPhpEymVfnzZxf4r419/B/r4j4zcJRIBKOuNRt5pqr1N1oY5nog5Bsts7EEFPb84mN0zbPsbif3/IAOXDyHN1fEB9GMaN2ZbpIBPkw4850Lp6qDbZ9hlq3hP3fga0BoK1B7St9/VZ5oY0Y+XX+vgtKqMBIZju/Kf95EOz0da+vbl8qNMeh5RyEi9KRm0Wnujk8/WGTxvJmRMk86/Cak/5ul5QqQ+mJOBF8Qv31JWvtrnB19jp3RxziRU30Z/ChkfmernZEJUBaKFKD11pAFG3QwAfv4L35RdQZpqL+XWGRF9eVKTYk6RlllxsQJhIe04txmRwWGfTVxrzEpH4jf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozPVvj7WBOHJWvY3P7F4CR4/ULCFGXhAsKNLVj86GE4=;
 b=I5gYUBdCtj/ZIEWlee5NJrnkjY3dGxi75IA/vrvcjsS5MEjNxm9anNiyT3oQjJdd2adII+9eHvNgLmdUeGvNFkGYv8875AYVc7VQkOysvJLWjDSfI7E9fNDTVX01ca/HWFeVSKaHz4Qwwuj+z2/t4SvoBoLkV401QfvJjRFTGxy7XNjWjw3LRxhP4dkbnrV5iK2E6d8Jiwk7YnszXnqMxkMcirLjIZ1lnBawdUg/kW5rj1xe67+zpDv5/pbyqEKtHOSmrQMYpek1J6oK+F7kv+f75PwT/CNCjiFds1e+SuFVP9SmxIpOyviO3v4wLsyR5WxOxbNRiQqENFX+Dwq0BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozPVvj7WBOHJWvY3P7F4CR4/ULCFGXhAsKNLVj86GE4=;
 b=uJ0WeAR9F/rcQDRdQ5cIlXOxxPE91JTkRK4cBc3f7udXPM0qI9/9QUWYhuOVegi0dFmZQv+FqtQXxJh3MJXE/x9wBcY47OK+sbTWLVlktrmKF9iEFO6436hJ05pHWdm/QhBC+sVqwxGlbxbfr4NtY7YmbiX1uxdeS7X1v78TV2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DM4PR12MB6421.namprd12.prod.outlook.com (2603:10b6:8:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Tue, 8 Nov
 2022 16:27:03 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::cd00:ca6:8cb4:e913]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::cd00:ca6:8cb4:e913%8]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 16:27:03 +0000
Message-ID: <34e26020-b14c-e5b2-d397-0d0715b67e4c@amd.com>
Date: Tue, 8 Nov 2022 09:27:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
CC: "Hatle, Mark" <mark.hatle@amd.com>, ross.burton@arm.com
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Subject: python3-picobuild build issues
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DM4PR12MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de0b388-c3df-4787-6d6a-08dac1a611b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ovE4OFCnNbIfEotFJOLDlPxxUcxqXmGEQHEDydguQnHM5qWwSvug7DsvY3+LnxlUEpuFky+O/iXk/vwO3zFbw51CpfEUcpNOC8Dc8bFAb6V1p0NNmP4u7kJtpthBkU5L4UtVL3h0Ch+JqkFOM0StSa9ISlykKnOkiWKUQf1KyRWEi2xYLlaaVFwc+/SRwwvxd3SGqloqIHiyktGb20ZJ6Ge7X/SveymKgg26IjyfIrSAEjqt8o10Sksvnp8fDWv12gOxTZm+7oy9CVdSqp7P0rKOhCXwQhcc+h9U1WiHFCIf85IyfqMtgN1TOcOgOcMVvBIA2I3S+2bQOs1g2kjtBm/fSveRDZnCxeBcQNVY6PoxTHICb1iIttsZCiiH8kpa2Ejke9vTlZ15x9HgYqEo7yVQi5Jfosoq9jZiiMDMSlr07ugzgohG7jMkb0lBxMJzrLx3qfKRlu1pDBA+P82dxhHvOP7GSHysbVQljfYGctqsgSx+BT7DAwnroAtv8WyScP4AhnIfRukQ4JhngJoA2JV/VEYkAygpEYqL/pUENtrmYGiClNEolCbhdVSd4HujCoYZ+8k+aDMF6IAv4jZn9EHtLe5ysEJCYauHw3RaIAAfAZvb6L4+tI/cA7AyBX2tqMEu6IMtu3lBjz2sMDCk07a/9ynVYkJksiGQWbx6MXxhXXOeFBvZ/zaaGmf/QbfnbEtA7PpTfEhy5lt0uvo+rVq7+fiAqTLThaX4RT1C4ew0fRSy6Dzzs+jjofr+OGHuIDWvRKoGlEzAIKXUG7PXQW1Vhcs9eT70SrtmhBu/9nc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199015)(8676002)(316002)(66556008)(66476007)(41300700001)(6916009)(66946007)(2906002)(4326008)(8936002)(5660300002)(83380400001)(478600001)(6506007)(6512007)(26005)(186003)(38100700002)(2616005)(6486002)(31686004)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K8BJ3m+w2aAAmYsWfUeLJ6lMFfwi5Pd8X8K597lmdUVMrprIMZ0slNrU2UZO?=
 =?us-ascii?Q?blBrnaIHLxKugDbLvdgftELoZkdmA4F2d0w8X/x9JVAYsEXsdtNF7QEiGs7r?=
 =?us-ascii?Q?I1kfLyl9tQfXuN5HtQDLD9iJGrJYyXEuISFbqZCKtXYI70r96wku/LosyPF/?=
 =?us-ascii?Q?x1NrYeAa8HFXidOzCpfNBzVs6WzoH4XqlDzRuWjAco2z3ML4hGW0kEIIwkmA?=
 =?us-ascii?Q?eGuVu+8o3vtSuB/8La6yB5uB64V0H/xwbALMT19z+P7VH1+XgtR+GJqYiT53?=
 =?us-ascii?Q?d+y2YGatnHXTCXMjKdppsBlKFj+eVg/whojrdE2TbtpqKKTVtFp2jDK+NGCu?=
 =?us-ascii?Q?4BshKEUjK7Ku5f3ymCZnqmLV7i2IDntfBeYULElOXVJRlmiUt38FXsd6ogHX?=
 =?us-ascii?Q?NnJc/f2NsPbvsFMOwAYwwhuMoDvlTUu/V+ks5myOavOrJGT+xM4mZ0b97Ivl?=
 =?us-ascii?Q?QMXXWmfERdoS1uoSaAQv/QkVd2wIPZBPJ+VCchsZO2SXi+gS7NKqyRBy1UZA?=
 =?us-ascii?Q?QisZPNQB6pVz3/5ujdXQ/FP/mG/TNTxcg2x3LMIEbBo0/TbRdiSGrYqobw5W?=
 =?us-ascii?Q?QnmdHkHAC3KiIiFlgBculHPYdkIKS0CIm4QnTPpoQO4xczWEyThwS9g+cADt?=
 =?us-ascii?Q?7okUH8zfxNATutfUli0SMioGdEk5/RxcSVKaZWMNSioAOoE7tTkM/gASgISC?=
 =?us-ascii?Q?6YpmLIY0AYc/o7bX/0bHK4rKn5Ebo/iSNRg/1+X2UM7mirIl69pNLy+hE4zL?=
 =?us-ascii?Q?A7FIl9i7uixi/gBluFQViRqUzinaY9h3I+nGFmOMqv7d+h0ErQkRWmo6k7uN?=
 =?us-ascii?Q?Hd1gBmLt2AT7aBpFzHZ1KD8DFuAY904cVp0Mg//n8NqDLzdHOogoj31kvZjr?=
 =?us-ascii?Q?a+2fR/ph6D436qNbI6uo1NDgzX0yFnuWF3/QlTq886reeavJIz7zk7kpEyMG?=
 =?us-ascii?Q?7Odcf0UYYyDoHLibJ334BzetMyMiYjGr5UZSe+lFHLOsIC86QmMzVFq50cIy?=
 =?us-ascii?Q?0MrFy+3hA/gasDgUbiaQYSNVatuQ5p06/1TCirryRwm1bkAu83peP9Js03yL?=
 =?us-ascii?Q?+EVfq4Dmr4C4jGRs9jRnvQZIWbKyeadkVre8RtcMrWdCnWrZLrYztjPWgQyz?=
 =?us-ascii?Q?WhsW0ZLaGzHtiIeulzFj3Ke9NHGu4hJl2zGHzXeD3jGdxaxjiP8wNKYIowwA?=
 =?us-ascii?Q?bo/b/vF/lIuPv1Mp/HzJrlwmviFGwz6+e3Mmksx08/MzU91bBVVgHVHOYQhg?=
 =?us-ascii?Q?7hHCCN0gU/GXPoDBBssYCjTiU0cnZAC4X/EsRamtgsMeEj5sZznU0HDpJvhV?=
 =?us-ascii?Q?LgVRyb69vkvVPm6Fe95AOSINftq/5ks02ySxmI9Qo9+bkm4ujXhq5Kc76PeL?=
 =?us-ascii?Q?WGBMeRW+aqdPda05ja9KKrKZy9tWO4B1791vxFketQ4bljXiJoJCFlzfprb0?=
 =?us-ascii?Q?GThut82qWQhWljSsc1ZBFLFk0H00/1ETlGE7J+03gK4yVhC03sRzsxBMfQoo?=
 =?us-ascii?Q?He9ZeTZX/AMoSf88SMRCuuqYnpCgYRfQLi1bPxTKRJ4Bz9y47/9SP0KANwQB?=
 =?us-ascii?Q?7ZlcDAK097zM12klbqazDcgNxUEcVdaEX1dOMtHZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de0b388-c3df-4787-6d6a-08dac1a611b3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:27:03.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrnfbjnZ8GDGIkh1wgHtUKmTCFkHdpfM2M/iRFu7BxMba1JbRRETytXm5yUQQkY9mKpYIZsczunDgf8CRnDhiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6421
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172976

Hi Ross,

I'm using langdale release and build host is Ubuntu-18.04.3, Any=20
pointers on below build issues.

ERROR: python3-picobuild-native-0.2+gitAUTOINC+ed3b16ce48-r0 do_install:=20
ExecutionError('/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/p=
ython3-picobuild-native/0.2+gitAUTOINC+ed3b16ce48-r0/temp/run.do_install.32=
652',=20
2, None, None)
ERROR: Logfile of failure stored in:=20
/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/python3-picobuild=
-native/0.2+gitAUTOINC+ed3b16ce48-r0/temp/log.do_install.32652
Log data follows:
| DEBUG: Executing shell function do_install
| usage: python -m installer [-h] [--destdir path] [--compile-bytecode=20
level]
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 [--no-compile-bytecode]
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 wheel
| python -m installer: error: unrecognized arguments: --interpreter=20
/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/python3-picobuild=
-native/0.2+gitAUTOINC+ed3b16ce48-r0/dist/picobuild-0.2-py2.py3-none-any.wh=
l
| WARNING:=20
/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/python3-picobuild=
-native/0.2+gitAUTOINC+ed3b16ce48-r0/temp/run.do_install.32652:166=20
exit 2 from 'nativepython3 -m installer --compile-bytecode=3D0=20
--interpreter "/usr/bin/env nativepython3"=20
--destdir=3D/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/pytho=
n3-picobuild-native/0.2+gitAUTOINC+ed3b16ce48-r0/image=20
/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/python3-picobuild=
-native/0.2+gitAUTOINC+ed3b16ce48-r0/dist/*.whl'=20

| WARNING: Backtrace (BB generated script):
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1: python_pep517_do_install,=20
/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/python3-picobuild=
-native/0.2+gitAUTOINC+ed3b16ce48-r0/temp/run.do_install.32652,=20
line 166
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2: do_install,=20
/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/python3-picobuild=
-native/0.2+gitAUTOINC+ed3b16ce48-r0/temp/run.do_install.32652,=20
line 154
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #3: main,=20
/tmp/sandeepg/yocto/2023.1/build-zcu102/work/x86_64-linux/python3-picobuild=
-native/0.2+gitAUTOINC+ed3b16ce48-r0/temp/run.do_install.32652,=20
line 180
ERROR: Task=20
(virtual:native:/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/core/met=
a/recipes-devtools/python/python3-picobuild_0.2.bb:do_install)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2261 tasks of which 1610 didn't need to=20
be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 58 seconds

Summary: 1 task failed:
virtual:native:/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/core/meta=
/recipes-devtools/python/python3-picobuild_0.2.bb:do_install=20

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.


Thanks,

Sandeep


