Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58152C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 09:11:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.79604.1675761096333507155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 01:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bwmSPiMV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1402c42dc5=haitao.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3179BZCr031521
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Feb 2023 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=9swbSNFFeshvXO1x87yR+LE8LyBzHVmDTjFXxXdtw98=;
 b=bwmSPiMVD7t5cHXHj2jTT1caAQc9RDf1gYXVaJYFZA1tWJAk+JoUjjtR1z5HIe6BDBcn
 fKg+a39Uvt/IMPzPhrv2PHx8jCpp1TCVhBlRzQVeqW+jllGfZb4UyUi7wuHAOF2eYWhR
 5/QCYaQ15NqgY78XGCF4I1IbwpDVoEQSewAt1eljuxkYLGywdpzQ8FNKIlb8Z3HBRgPS
 idTUtcIXhN6mdZ6XiEPbPLvZ5IYDymigCbLV56i7L1uj0L2OlQ/uzjnzmS+tWBhEB3wL
 aa+YMfJn1wdGAOncdoEGiPYknEEFPZogQplvvHpUuSx8iaKTfxrEmZGaDNuewS3lJo5Y QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck32q5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 09:11:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3179BYsC031515
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Feb 2023 09:11:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck32q5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 09:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6H8Q1ndUxHySqS4dNeQ2yB2kUyEcVHnujn4FS5qcEb5lNjx5tUay1DDSc7l/lNSc+Ego2dx2mRCC5wrqkiQ/+8mnVan30DHDKpdbUZCw2/e1kmQ6Lrg8bCct1F4esLdPfwkM8q8A6UFr0t0Qm1o0w6vU00UWK+1Kofa8EQ5SJvtcydwwJO+7lNIA+FW6e5YgG9H5udWPYkFujxue5qyFBBQForLtHeoQ25GatA4m2K3UqD9j2G2iNvSK9UGD3lZhhb5dEHiNrl+yzBzfaAAWKLSeEZ7HXInaiMhYvmXc0ZWpAR0G65LdCU4Ejqq9hkqcAEhoTQXDF84QkDK20Zg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9swbSNFFeshvXO1x87yR+LE8LyBzHVmDTjFXxXdtw98=;
 b=dLxfA6J0lRh4pJTniHMO1cyw6NvMWvLH13VA3qaF3F7hcO0uynxbjbYi+zeJiMQfdh6GICdQkFlCxbdBNd+hUM5sfA/846dUoMFTu8jguhNKP2RZgR2haq4L/3rBXtQeZrok9AfdrynM6QlLxed1zPhD1D6856E+5yR8lpm+n26ClwsUpRe2I4RZkv6+I+HWkipFe/Gt0aDlJw+VatodrU0mAw+Jbz/1SYBAshx6Hx7UmK3lOvzrQwMIedOY5/tEyoiXLPfeuhxEC7ALaJPXzdQ0fbOxeNaJNrehI89C9UEaiGHBF15scjPpxXjtGZR10qSQ1MKlhe0TVLEEQog+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3944.namprd11.prod.outlook.com (2603:10b6:a03:18e::16)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 09:11:32 +0000
Received: from BY5PR11MB3944.namprd11.prod.outlook.com
 ([fe80::f9f9:f1ba:6fc6:3be1]) by BY5PR11MB3944.namprd11.prod.outlook.com
 ([fe80::f9f9:f1ba:6fc6:3be1%7]) with mapi id 15.20.6064.035; Tue, 7 Feb 2023
 09:11:32 +0000
From: "Liu, Haitao" <Haitao.Liu@windriver.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] libgit: add ptest for libgit2
Thread-Topic: [OE-core][PATCH] libgit: add ptest for libgit2
Thread-Index: AQHZOs45JuDLpzjYVUOGTas78Onb+a7DLtcg
Date: Tue, 7 Feb 2023 09:11:31 +0000
Message-ID: 
 <BY5PR11MB39448218D2A3A3EEF6AD6AD19FDB9@BY5PR11MB3944.namprd11.prod.outlook.com>
References: <20230206084401.2055798-1-haitao.liu@windriver.com>
 <20230207092859.63f15a0a@booty>
In-Reply-To: <20230207092859.63f15a0a@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3944:EE_|PH0PR11MB5927:EE_
x-ms-office365-filtering-correlation-id: 709b34b1-0f7c-4823-c438-08db08eb4dcb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Vv8d+i5LN/GpfqfQmefY/LHSgCMNJtSEglyX/y6299DDrRmwBvMTfuNCuM6CDMWEy84cUMKLfBXuntMMFT6r2ho6FLPFB+vz2iKtkYtumw/vxxTxUxfjXyPIi3FXeiF1dG1Cyx1zstwyfvKK5q83yE3bE+zfHCAbcy8XQ2FE8PdfYqTlgTgAEfwqsFGFBBlBmS/Jsg43qFz8Y0DLef31sYW59DyLkLEHNP+9J3bnyAUvSSQD7wRHzaQPxjZ969Z7RYiqk8x6liC/qFQ1/QFU0ygyWH2uMJUTqVW8Qw3pYt0FiO0KvHgbDZEzS7sVf1MIitdll5/qfzYbtR6pj1Oh98uhhhnXiB5lQy/M1V9VYcGocFV0VYDxO4tWGqQI0Z8/IOFvBMWZhmRstbiTsLW+hdNhS2Yj1wwpZqC/lS7zm139ipcbQOxmrewIQUT8HluCaJS7w2e8Opq/23hWcsM/enzR7veXHVLFC59czLYaYqi77nd20brmnYOcGZRfaWzsmai2bDmM3PE2r6tY2B80pP+EaanMeZ+Jh1nfEOe84rCRyVJMD1k7spAOzmDRNpmQ8Bh8uW1c2pzuJRHgHMUYAycdg2H+O2h2XeNAuuoxwBYMjmiAiLGRf2Tw2W63dnAPb6EWxJa4TRevC/wB7Fj2gQQ7t7Tj1zPm6JfC4ufog3X1K0+MJbi/tWzb22n5FJfttbix2aIiSIxhM3M9G9w84A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3944.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(376002)(136003)(396003)(366004)(451199018)(33656002)(86362001)(38100700002)(38070700005)(55016003)(122000001)(966005)(2906002)(316002)(7696005)(478600001)(41300700001)(52536014)(71200400001)(66446008)(6506007)(9686003)(76116006)(64756008)(8676002)(66476007)(6916009)(4326008)(8936002)(5660300002)(83380400001)(66946007)(66556008)(186003)(26005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VWEgEPDLUOLCtCOa71c5PU+mQ2AFwcmYKPQBaFwk23oCSF6f3826esu3Wqrs?=
 =?us-ascii?Q?kvnqsm9J07149zcFOZxB3RTsroULm4tQq+prseyxsT+2Tx8CpCLBQyPXbVJN?=
 =?us-ascii?Q?gO6zi8LxYOdfTttH9bj9UsVC/B7KlhHqU8llO+89zZ07gOX5WS0d18SGXzwg?=
 =?us-ascii?Q?l/86EhBODyUASyu0yt3hNy0ZKk/LfP12cbnDAu0grA1q5uTUc4tF3zy+wFdl?=
 =?us-ascii?Q?K2H4mHPr3CjGXJtQwUMWMz3VsNGjxYw0NAWF9au+r2FetKEozhcwHA4pNHks?=
 =?us-ascii?Q?BFzMQjV3CQHWZ0K8Ai6DnsVVT3PO1SocTL1kPuxGoREyH2/XJ6s63NJx2EPp?=
 =?us-ascii?Q?ejfhr7P3QSQBxlkbSY5RGO3jD/wnwiBm30pAgoEblpYNDzlNVUXIrIbEhhth?=
 =?us-ascii?Q?cSm+jkgmBOX+mKoP72Eq/yLSTTCPJooxIfdDCfODi5ke9lcv9hCAv0fx01Xi?=
 =?us-ascii?Q?DbNyPCbvoeZtqbI6eJTKJCwCecIj/ZMj6G2DMFe4EZtsc370Kcv4MwDrGjR8?=
 =?us-ascii?Q?GvM1DGwOWTdvEmi1ZqEzoGhpLK7nsi1e/mZ/l5Uda/oUJ9Jk9CAFEAG7Ah9w?=
 =?us-ascii?Q?XdZT3b1zGoX1COyBKdsoVhhFt25VNQH1wprgsruV96BUFDvYGWPuZeV2e6uT?=
 =?us-ascii?Q?aFAfcipVQ1CtrESPafK3d3fSJSrtoHVjLNW3lhj3cn6ozUydU5CVBQexdLlp?=
 =?us-ascii?Q?Po3n8NfvydQccZMUevZAMwCL5MNm0o0V9B8O1zhtxjJkURsIT3RNFcDmjfV6?=
 =?us-ascii?Q?prfJKNArDYy/W0r7sEBssRVbjseKOsVjqZSdEQvvTS+F0tvWNQed4EDfP9co?=
 =?us-ascii?Q?Xay69QAo4I3fI5f5V+Qi8DukLcsDEMConyfpOpEM71v4zRJg6H48KU/GAYot?=
 =?us-ascii?Q?E9aOxm6vsO5uBwI97EU/wF+0eyIVs62b/vZquJ62jepah1u8qAci1qyIhnXv?=
 =?us-ascii?Q?ex30SpXuWcPZFJPzMHLvDs7/kPLdiqLAcBoT3xvKaW/hFjKe2v9LsJ92izpk?=
 =?us-ascii?Q?iyRWEPNgnlFZDJtGOORPs/1CVWZASYI0s3YCiE5y6A4Z7iodBqqBoyMpX6DL?=
 =?us-ascii?Q?DiB5Bpqe5RbAI5OUuFV4rfvpwubefoZW4AFVNjIyFbgCAv9Uc0N15ZLTo5cH?=
 =?us-ascii?Q?OU6ScVQHi/uwHF1d/qmdaLNVJpq5tREF7tl48Y2Z0UF6oykG2Ejlah57urUt?=
 =?us-ascii?Q?akdfoj2GuftRpXNN2YJBLA+V+C4eCExR2f2vv2RK67NeNzjjgolJL/BbxtGG?=
 =?us-ascii?Q?I4pChUb6uy3Yf6cr7ecT1GTIpt0j3C91h9Ozfe09Nn9U7PwHKXgf7YiHXn49?=
 =?us-ascii?Q?J3nOtRKuRCHqv28D5Oec8qRfWMDjqqMge0KqX+DZSoxzEzPg/f2iI2ZvfoNx?=
 =?us-ascii?Q?TrT2GnR9jPr/ZFGysfAokv9JJczbJZ8f3dHn29A373QQ5yUjZWcdSMy0lopr?=
 =?us-ascii?Q?OwTUEWe6OQX3lFvJE8XmreKRfRgqY4jUsgS8WfgPJkUq3hDNQgn+6DBgy5V2?=
 =?us-ascii?Q?iGBMQrNc+AzVu7Pesn0+YI2EJ8KbNxdfRwsEaRkJEhwA5hSu1FYIyZDVA2SW?=
 =?us-ascii?Q?YdveR2szcNZZOB/RjyEz2XG3TJ5ytaNvOzvmZW78?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3944.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709b34b1-0f7c-4823-c438-08db08eb4dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 09:11:31.8124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eu7TgsrxbOzhcR5oLHiVFk62NRjev95i9xvjgzWzLw/Ov+1sIzktwqCCSezfl7Jc0aCNS6ZfcylgQwtWs3b75cvUh/fabwdpsw+/sxHNgCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
X-Proofpoint-ORIG-GUID: ZHMz22ZMRVZJpv2FeccTo0kT8AfdoYF-
X-Proofpoint-GUID: SbvPcrbTNRfWIhNhtOf7rPo7rlK__8Is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 09:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176805

HI Luca,

I have not encountered these failed ptests in my side.  Did you test it wit=
h qemu(runqemu) ?  Let's me check it again.=20

Thanks,
haitao

-----Original Message-----
From: Luca Ceresoli <luca.ceresoli@bootlin.com>=20
Sent: Tuesday, February 7, 2023 4:29 PM
To: Liu, Haitao <Haitao.Liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] libgit: add ptest for libgit2

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello Jason,

On Mon, 6 Feb 2023 00:44:01 -0800
"jason.lau" <Haitao.Liu@windriver.com> wrote:

> Add ptest for libgit2.
> ALl test passed on a trial run and it took around 21m56s to execute so=20
> added curl-ptest to PTESTS_SLOW.
>
> Signed-off-by: Liu Haitao <haitao.liu@windriver.com>

I have run this patch through the autobuilders and it shows a failed
ptest:

{'libgit2': ['submodule::modify::set_relative_url', 'worktree::worktree::pa=
th']}

Here are the build logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/4454/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4651/step=
s/12/logs/stdio

The ptest log shows:

FAIL: submodule::modify::set_relative_url
    ---
    reason: |
      String mismatch: expected_value !=3D buf.ptr
      '/tmp/libgit2_tests_xhUI5o/relative-url' !=3D '/var/volatile/tmp/libg=
it2_tests_xhUI5o/relative-url' (at byte 1)
    at:
      file: '/usr/src/debug/libgit2/1.5.0-r0/tests/libgit2/config/config_he=
lpers.c'
      line: 37
      function: 'assert_config_entry_value'
    ---

and:

FAIL: worktree::worktree::path
    ---
    reason: |
      String mismatch: git_worktree_path(wt) !=3D expected_path.ptr
      '/var/volatile/tmp/libgit2_tests_xhUI5o/testrepo-worktree' !=3D '/tmp=
/libgit2_tests_xhUI5o/testrepo-worktree' (at byte 1)
    at:
      file: '/usr/src/debug/libgit2/1.5.0-r0/tests/libgit2/worktree/worktre=
e.c'
      line: 417
      function: 'test_worktree_worktree__path'
    ---

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

