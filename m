Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECE2C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 19:33:02 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.94])
 by mx.groups.io with SMTP id smtpd.web11.12026.1684870372510924936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 12:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mysnt.onmicrosoft.com header.s=selector2-mysnt-onmicrosoft-com header.b=RyCgPIPx;
 spf=pass (domain: kontron.de, ip: 40.107.8.94, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6b8B8PY3073ax4SGNVpNy6xW7np+REZ6SAFjoyDeNSWkP4NRNtN9UAPXj3GiXfYm14aXVRV19tHQcCJ0OgNjDNxPOOPJdcXpqmkZC5NFK797o3MzquiQe4Tts3SPCnmi2jDze+u0blnwANiW2RvjDdUeJ9zyoeupmNdOTWFjWV7mmGM7zLIKY7BZQdpKwkOAFj+SHb0tZKPzTJKDW7AjsHb1BzlDEAYEF93mFji/lFb9qLOyogkM2ySP/S7UzIY4oRmJirDT7W8Hjkakn1+4HjsCqxcmcO8sZbFdpG4zweCFdJbh4LzC2om/xm9vAn3knw0rsIT0SM73brugLdHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25wUO/Ir2CvkNYirjX2lvA+8/afRC3c6yxDR/itKheo=;
 b=NtHgRIj6U3BVrvWYKleII/hTeb8lGSFGPmpCEmtSaCDMVOJshCWO+Y5l2jPy8t0ZtH7T60VdVeXd+fihRtdZ3l7XEJeOf1sFfX2k8WSexWyY54ZkDAJ8RSKiGb0CQgqoOM2EQvSE/yYqvJHFPzJ6kNhsWx2uLaiBxJbAq7mXIp8EUxgdh3+f98D4i04fgHykA8m9ZSWvnxH+k7X8ss4LvyHZp0YVvFBMj3St8B9DvPOK8oxazceSVF2J93MLrFl+xDt5ag6hvY1tpyoC/9upbxOWhaWYUuJTYldrRxT63eLdlNqAG2lqyvUoAjTqwcS80WXeBGs2p7/2UXzFVPCSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25wUO/Ir2CvkNYirjX2lvA+8/afRC3c6yxDR/itKheo=;
 b=RyCgPIPxCWEM3FfKV/199YUGvby/JPhNkFR9jF3lygwByj+1mPioZltlhKIAFjEulKwWcrfOP2CC2qIaK1lWBhv4diLN5cyXW6fwWAgXVp9aAEMzGZ/wB/jXiydFhBSK1H5ilImRLE9awLDOqL8i8ncDzWWxOjkWAjJIQPh/kxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS2PR10MB7298.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:606::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 19:32:48 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fe53:f0e3:72f4:6c80]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fe53:f0e3:72f4:6c80%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 19:32:48 +0000
Message-ID: <14d5fe1d-f7d3-fce5-a954-d414ec16992a@kontron.de>
Date: Tue, 23 May 2023 21:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] psmisc: Set ALTERNATIVE for pstree to resolve
 conflict with busybox
Content-Language: en-US, de-DE
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230523153608.119800-1-frieder@fris.de>
 <0F0935A6-1757-4CAA-B9E9-F61C90D95DDF@arm.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <0F0935A6-1757-4CAA-B9E9-F61C90D95DDF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS2PR10MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d85ead4-f366-4beb-8ae5-08db5bc47d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0rjsCjF/B6YAemR0mze/yAwGkdUyFXJ/FPZLCqjRa1V5V476K+cFmq1Rcpvxkm4Kxah5KUgsi32B3mHk/jRGxSG2HR3ZoDTDUZdEFZ+evwIMtgXDwT2vIfHMjaaXMzwGGfL/MJBiAM/XAocfn2Ewl2Haw+qhjpph5I1NCMUUnyoa19QX/4gTNAnjG2W6guzKbzBtcCSj90qkx+qtkXkg4OQb1JYOcrQFnFkL3LpNnPgo3r91WOpFAI8kJSZX5/SzP01PyuBgBJwZeNe3rNFwD6rdWXccvm1igt5rFn8eiyE36adwtC/i6YVMPbBz52uFjQJZb7wCyepFmbziieZZpgGp8udlm2HxPGK3W8QupgfJmAg7Q835tfxMb2Dy1pwAZtA++6VcRPNzuEmOGx56y4Gjevo+WIDld96peJCl57k3TZKsWYnYXz/v/bu8vjC6LZ3gTnVlT40wyaaNrdySYBzTh4K8rXOBDoMDGJIkbb2Hw8qF5fP3WVecaS6vzF5Idd/FhndYCi/7F1dnnKHRZGNE1ep8DS8614g9z/KbwfzGVoXf1tIKDGaI0p/e0oTfk06WP8tOL+qpEnYOP7eralL0/3pNMVwtRs7cGfcWF8ofVns1FJ5PrQBjaxmabgk776bV5/WcqnfKi67tHYannQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(31686004)(2906002)(4744005)(5660300002)(8676002)(8936002)(44832011)(41300700001)(66476007)(66556008)(66946007)(316002)(478600001)(6916009)(4326008)(36756003)(6666004)(6486002)(26005)(53546011)(6512007)(6506007)(38100700002)(2616005)(31696002)(86362001)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OVL9CNd1MCMh3vE2vbQqAgFRWxZ5NvatOrTboQf7hgtNp2Lg/8O84El4xH8O?=
 =?us-ascii?Q?gSBlucCF4R1062wfQe4NCS+r6n718iqSPZWoQTYnM1Qtxdc6/9HpNEo2FSbM?=
 =?us-ascii?Q?YjqxR3ctsrEt4vf27ma/QyDG7sBHqhLaCGlSvbdhZJeF3pGS/eNySxrWwHr0?=
 =?us-ascii?Q?IkFpXTg8wBiUlxzQIwaqQYsd7clfsPxHUMHc6hE+1r/PmcVFOB6YXQxxT6IX?=
 =?us-ascii?Q?SLOIW0C+r9EqnD1cQS28SZIv2LRzIGTUJEI34besS19TsqAZjvOAsI/L3sxh?=
 =?us-ascii?Q?2vfuhoQWL1yA2qVKrH+njOBugYm+YHgxjBHWqgKRUvpGxX4Cq7BriJJjK5Rr?=
 =?us-ascii?Q?T8HE1vBqsBv4LBt1SHL6RrQB+8D+M0bwOIzkz+pv1+u6FsHuTw+C2ZiFxWB/?=
 =?us-ascii?Q?SwIMeqNjDaRe/+pnAkI0HtsoO1Ab0f32GS8pUJR3/5PeN5RAFFuqAb45nnN6?=
 =?us-ascii?Q?IOTH16BOw2tQmXDPZVJfbaYkk0n47teJloBxB5ueunZE0Znn9VEAJ2/Ku6X7?=
 =?us-ascii?Q?19RMQjiCH9xESI+iqZLhU4ZGBJ4oPD9et9SqwOzpACeB+NfY5VDW3ed/Jdwa?=
 =?us-ascii?Q?9y3WxvNbVUZg69XdxG2LDgbQuDNt01AKas0xjzP+9RcPc+EZIXNIEMxKT/cm?=
 =?us-ascii?Q?UGEVYhGNplT2XH8SE1yKEkAi1kFBT8MdBXku7/sre532lWHQpOlEZSiwzsvK?=
 =?us-ascii?Q?Donh1A1LQIOSV/i3R2qyEYuq48aK8eguI8MUH4qJzKu2HFqYJIRhJIhzeLQZ?=
 =?us-ascii?Q?uAK3ulz2e+QJmoLMGe96pIPEVDXs7IHnQKpbXhBgQ5rPPb/kRacNvwhI6RWV?=
 =?us-ascii?Q?s4NGjSEMnFRQ5Jc7LMGRRJE77pO9tTGj/8mjTqCJbQALyhfTmZfXyPK8rIpt?=
 =?us-ascii?Q?Eo6w7XJwkcJDfNX5y+vFpUs7LJ5PJv5oH0QDibbNmcNdRC8zHS+LyD9DbPuS?=
 =?us-ascii?Q?YuEfyMvafHvS862YtKIZ0upvVGClDT5ZtHga0P+K95DmGTzBR8czMXYUwE2F?=
 =?us-ascii?Q?l9Q7tooCCsla0AqCD3U05TWBHBHw7opikaBAeSDhj81wEIPcgU66RYT/js4R?=
 =?us-ascii?Q?5pq8YrmFAxgAo+hYq/fFIH4jESPbwePtY3Sv1rkvW7nsBFjZfoG1neOfc3/g?=
 =?us-ascii?Q?DhVhVvBZk2i300yEVng0vet8oZeMH8J63IiW6nh/rmdK3zwMkDLHGQTiIjhC?=
 =?us-ascii?Q?1FYOhQy5nFqi+Bzf0WIqGpDzvu+iVzaKxbwu/lSex8/G+dCB+yBt/FRVjNJ2?=
 =?us-ascii?Q?KzIgtb77jPPB1G3OQKv0rGBu4vtud8stiu8rjo4tCEY2uzf2rCer0VRCySMZ?=
 =?us-ascii?Q?1xPROGqzp9t87Y2d6CcBeCa2hSggsSbNdlBT5djJc9iNOQE+gI+VXSFxFiNw?=
 =?us-ascii?Q?rFUqvcepMRG3En3qVyttiLHgLHcoYhFZ3HUsKNnVnzCh3P704H3ad2SsHx/x?=
 =?us-ascii?Q?1PDRyR+tc+ZlztslLLPV8A8z152U6gocA0T/MF17DmsTc/FKi4V+3PwUxRbv?=
 =?us-ascii?Q?9XGoFbxPp59ArK5OAhZJC3C2vTSLiaiFb7yJXaW0/TYx14t0ayX+wGE7AoLu?=
 =?us-ascii?Q?8UWIzs0B4mxUjAev5zC7ANYlN0+iNKWfpYZihCMX0shaJ4VJ2cSElvZcCRqp?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d85ead4-f366-4beb-8ae5-08db5bc47d6f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 19:32:48.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWmnRCjqb2C9xvfwzAJh8O1J2XAS8Jcex5EoJJQyc616tQpXnPzWJHq78pYsgCEjfiCe+5MaAm84RR3zzrgRntKTJy5AqcygwtMlKWbLQfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7298
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 19:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181654

On 23.05.23 18:44, Ross Burton wrote:
>=20
>=20
>> On 23 May 2023, at 16:36, Frieder Schrempf via lists.openembedded.org <f=
rieder.schrempf=3Dkontron.de@lists.openembedded.org> wrote:
>> diff --git a/vscode-bitbake-build/executeBitBakeCmd.sh b/vscode-bitbake-=
build/executeBitBakeCmd.sh
>> new file mode 100755
>> index 0000000000..d7a4c5a5aa
>> --- /dev/null
>> +++ b/vscode-bitbake-build/executeBitBakeCmd.sh
>> @@ -0,0 +1,3 @@
>> +#!/bin/bash
>> +. ./oe-init-build-env vscode-bitbake-build > /dev/null
>> +bitbake-layers show-layers
>=20
> Pretty certain you didn=E2=80=99t want this in your commit.
>=20
> (you might want to add vscode-bitbake-build to your global git ignore)

Yeah, stupid mistake and not properly checking the patch before sending
it. But that's why I sent a v2 just few minutes after this. Sorry for
the noise.

