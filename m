Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535AAC46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:12:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40571.1702890728836977728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 01:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RrMQflmw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07166d5ec4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI5N1Ic027291
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 01:12:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=TyQMDtG8OGS/H5Cx76QCd7cahGZmHlHmtW8WnfQCX44=; b=
	RrMQflmwGVEXNUF0GIDy68vixMg8MnXW9fuCLVlFsx0MWqKzC7JeZkrGNDl4gpJE
	4sN0fjyDuHKIx71ZYCDJC4xZLz2j9b4TMzujppFXVF2VWEa7bjB7WHrgck884fEj
	Bz1/HZxGz6Yc5+XFeV6e4xxvGiTgnWUZZJEAQSx7tINr1NOhO7mnpaoDY2CwdBD7
	fe7OXc7vIDDPa7njW3yYXeZ7hBCcyWiq1gliCdXb1HR9ZQbc58P5H9bnvbmVKWVP
	7P2nh0IgSfb5vv0bMLZqZdj41p9kuhopeoeFrJ/d6u+UkbIgS7RBl7lleZyheliU
	fYnJJQYoWemgivcx3s7f+Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9khctk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 01:12:08 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BI9C78h024972;
	Mon, 18 Dec 2023 01:12:07 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9khctj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 01:12:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/+pHG0j7K4btCQ9d0e5n8L6mCjVXoSQskw85GaGkZ9bmhC33WYOycPBjQUMidTzXR9ynltSdc23xLSURljVi8mYspTni2EzX1IbZpbFATz2m3PYnGj9Y6uNZ7+ZCrzwyoeig+2ndlgkEUDS5lj9S7kiaTFBu8Z4DrozzQhCrVzUywP7SfOswTxzzb2i1LR2+xwP1v7TAlvaDe8Gwv0VzINQQkPA29s3u0GdCrlsw+cxR94nSihpHcBKkiNz2K4GjOpy0NrPsA5ttJGwvVFKbh8ZSbeSTSke9W9ClFGJ1fT2Kv803hA9fx53Xzaa/DDqlJrAXMDV5LRmPZ1/TJcqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyQMDtG8OGS/H5Cx76QCd7cahGZmHlHmtW8WnfQCX44=;
 b=OaJ9tj6Locun47Wkjy541WAgACuNh2l3B63G8dcLyB5Wg4qePTi4VySRyWVXpqfkqXvEl5X4dxA3aZZgIBAySLJOik0KqA+EL8yKhpX78n/f3d8qoOF+m3w9AngFwQPt31ZhtzItDhw9OoNmEA9O+khkjmTHzjMtDAvAPqzXkv1cgRPPwVXIsVmR4SMbFz/lBMextz97++yZJMPjMshpo64tUL31EbQhyAUPP55sBATo7YpWzvrUEWHeTNxDlNoIyoTlZqh1nlKdTENGM/nyCyRJ13vcy+skA3jedgqi5OieJL5MdP0OBxaOs4r4baOxxAJuJKxKdmrZY781U0oASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 09:12:05 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc%5]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 09:12:04 +0000
Message-ID: <53d83da5-7690-1cf7-f0f8-199c9515142c@windriver.com>
Date: Mon, 18 Dec 2023 17:11:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] python3-license-expression: Fix the ptest failure
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Ross Burton <ross.burton@arm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CANNYZj8Up+UhiQo96T5OMxp+seYj6d8VyAGeF4vCCTj7mt764g@mail.gmail.com>
 <20231218061542.1845279-1-mingli.yu@windriver.com>
 <CANNYZj_DszK94DujKJ_a52HsAhW92nP0eVtitfuKueKeMNQ3QA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CANNYZj_DszK94DujKJ_a52HsAhW92nP0eVtitfuKueKeMNQ3QA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 70de6c26-b484-4c32-10ad-08dbffa966c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FX2W/tXG+oCzn0di0WE2Rzxv+oS+uaGJgAK6mzdhMPmDblURiLFU5ieGeQFK2iRNpRr6kM58O7gy0BrWvXqpXErWSVvHCQpf+d8YXPFJkAxpNu7n7uMxT3GQyRrXSwMRdAqarC+/LY/0R6ICYeTj+dQRXhJAlZidXtaG9csm4uUj5rTQm+/uZepfNDu2JYVVXqfkyns/zm1Mu01LpAqfQJgI+6qtedeMCfvaIlXaHGv+UQuxkBW8EXpVAUGdStIiDRyJsSSatRZUG7AXibFFC6pJVCJQbJMFrkIXs9YSgqOKoDz0VsedRLswUzcu+G/flvpjrP/RcuPmQymID3CiLBq9QscU8yP1pORo4fHBNBvlF6Fm4buF5h8buUTFy3LVN+YiQbqNED1ZCYwVzxZRFZF0FrEyeAJ13+ew13Gi5gOf7VXMaOZhJANTKzZ4cyDDDuRLHFYMipVhQNSt8yih3qWAhHzrLmikFxRQQ75YzIAdkY7FGxKdasZq2XTHodQfE7KZUmX9oPwSGe80IMwIRYPZPviElDIDUvJtLnrL9HSvgP75/3oE/0mAz3SttDRMezyYXk21ubPy+t2HGqx4sVCPxhi1odEoseyZWlSptcSpgGmhos+iPBsdl2CnJGRuttZPca3AYhgsG1uVTKAIkC/qVmyafPfB0ib+Bu4DiLgpngP6hFON8Rn/fXRCqfPB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(366004)(376002)(39850400004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(31686004)(38100700002)(2906002)(86362001)(31696002)(5660300002)(2616005)(26005)(83380400001)(6512007)(53546011)(6506007)(6666004)(6486002)(36756003)(41300700001)(6916009)(66476007)(54906003)(66946007)(316002)(478600001)(66556008)(4326008)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFNsTTVsakpXZTNwa25BNXI2dEkrNkhMUVRjazkxUUNrb2I5WHRtTmpyWHFn?=
 =?utf-8?B?RmVjZ3RpOE9VeTlHVVFoODRDekd1QXZpelJ1YVVpME9kSjVzMVdtV1QyRnZQ?=
 =?utf-8?B?YUVjREg4Tmt1ZUxidklQdCtuU1dla3dIdzIveUZwdDZjbGtabGsyRDFVLyt4?=
 =?utf-8?B?aHZxam5YdUVpSS9hR2ovell0SW9GS2R1bkJ5NWV6MzFXc2QxODRKSTR1T2t2?=
 =?utf-8?B?U25GM3dsN1J1cTRlZHVidko5V1IzQzRlcDVMbmR5UzhaMmo1dlpvb09PTis5?=
 =?utf-8?B?bVFscHBDVHU1Nkg5ODVEZmxmMnM1dlJQaXZuUzJ0NmliSllzTlAzQkVIdyt2?=
 =?utf-8?B?QU4yNXN6WTBhRWNlNlJrRnZtVS81OVZSZWVwWVVxdXNKWHRXaUE5TzQ1Szho?=
 =?utf-8?B?ZmxTdnlKaDNlRm5vVi84OEdZcDZ0Q3ovc0ZSTUphU3pUZjhKYWhqbXR2Lyt1?=
 =?utf-8?B?ZVlISDBHR1kwclRhVkNCMHEwSWlmQ1pqVTZTOEZnRm8vTDAwQTVUZWxFK1RK?=
 =?utf-8?B?Wmg5OUU1Unh5LzlrTXUwMTdlNkk5eDU5VDhDKzV0Mm1IVjVIczA1M005c3pO?=
 =?utf-8?B?WlFhbVFTTGN6NkhUM3hrQm13TC9aYWNKUXdmaWJpYUFjeTBSa1hYMFFNZFNH?=
 =?utf-8?B?Ry9SQTVRQkgxUW9GZ1pkNjllSzVxOWQ0MlNSOGNtRi9IM1BTVTNYVFVJZ0VR?=
 =?utf-8?B?NEpSZGdXdlkrbDRSTkVNczc5d0pqZnROQlZDZnk5VWx5a2MyeVBpOTd2L2FC?=
 =?utf-8?B?SFVqbzVsZkNHZXQwV1A4eEsrQ2dYbXo1VU5jaW9BeFRLbjYrMXcxY3Fwa2py?=
 =?utf-8?B?bTFQWHhkckVqWG5RWmE1SjVtanFyT1pxWDA4YW1xNE85cUtEWlpkY1o5SWlo?=
 =?utf-8?B?dTA4cUp1aFVwZE1XeTMzMWg5MjB5MDY1MjFYWmNXdk1MWjI5cEp5bzR6dHFt?=
 =?utf-8?B?b0V4WjUyN0QzeHZqSEdOWGJUOTdKNkhJVDJJSVlndjVmRDJ1QzNQZ1p6MUxQ?=
 =?utf-8?B?WkdHeldDcVdLUENVeW1HOHlnQ2w5MTQydktjeFVURGJ0Z2h2ZHZEU2xGa1Jq?=
 =?utf-8?B?cTRmWjV2YXBaSWo0WmRIbjdDSjRLSzlsUG5BWGpBSko1NlBUWEc3TjA4QU5v?=
 =?utf-8?B?MnUyUWtWREJWa2JPcjk4OExnSEVhUkxhVHBtTHlHNnVhZDVPVGJIRlk4YUlq?=
 =?utf-8?B?ajRTRE85a1kvbGo1aklQNTVtc0VBTS90b1VlbUVzbUFYOFUzRXpRRDl5Wjlu?=
 =?utf-8?B?bWhRd251eFlBWGxyaER6d2l5MDJZQUhvd2dpcXY0cS9VcTdiZHBScnZjdDBR?=
 =?utf-8?B?d1dMMHdUcndZaThCbkZES21GcG5XMGdJLzdkSUpKVWtLaUJvTHFBbUEzTHZ2?=
 =?utf-8?B?UURKNVJ6QTFuUC9MN0JMSDg0ZVNjNjNjODFGSXZ6THdEUmJjNXYzMlRza1Bz?=
 =?utf-8?B?OUkrZERkUXNKazJIdFlQNVExYkhOK3VmVC9lL1c5d08wNWdJVTdreS93Vmg2?=
 =?utf-8?B?TEYvVkcwRUYwejgxRDQzMDNrbW1xek15REd5aEdBdFVuYmRGU1ZOcUczcFd1?=
 =?utf-8?B?cE94a2ZweTZhNnI0WnVncy9tMjBvZ08yN2xJTHowNW5QYjNjQlBhZU1GOGt1?=
 =?utf-8?B?N0x1WUpDalpGTXRtVnNIcHpjVWpwTnRubkxWUlp0MGsyQ1pwRVFLRUc5TWN2?=
 =?utf-8?B?YVhPVmI2QTdsb0xKSUpDTThXd09UTE9qUjNkTWVEQ2JNcjU3dEovRWo4MW5S?=
 =?utf-8?B?cW5tckxnZVpNMHNTSktxZEZPaWxqSXNqR2NTMHpQdHp4cEdqMzdLL3VTeDE5?=
 =?utf-8?B?V0dscE1NemFreFVPY2djN3ZQazdwYWpUdE5JUWhQUFVGalNucnY3WG5ZRHpL?=
 =?utf-8?B?ZXhOT0dsVU5laGtnRC8wMk1xbmZvckFOY2tNSVFBcmVQMExoVG4rU2pZbjJD?=
 =?utf-8?B?cmVWK0RpQjhCQ0FTd3FDc29obUMyWVN3T2pFOFdLNWdRakpuNVBpbnhMaGRu?=
 =?utf-8?B?R2dLcmgyUTFrbkVMSzh0elRrbU9FczdIUHMwWVAwa0xvRndSSWlvcUdTcVdr?=
 =?utf-8?B?MHdiRXJIRE03by9rZW1JeWs0NE5WV21PTU52WENoWTJkTnJVbFo1YTErSmxl?=
 =?utf-8?Q?un3Wdq4jsNEZkFfaPqFQ89p8v?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70de6c26-b484-4c32-10ad-08dbffa966c1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 09:12:04.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scF24hB1K1tIDyqmn8PYpZxZkdxEmUZ8RC6yt2HESB8V8pyg0KyqXhFyJfoTk/EYZdiSjwYr+fFB8QbpiQ1U1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-Proofpoint-GUID: 3MBzos3vt_Be1ZScuEXAy2LUACFtE26x
X-Proofpoint-ORIG-GUID: U0qq9eo5RpeNRCWToooYJT6PdajwlIBq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BI5N1Ic027291
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192620

Hi Alex,

Please check the comments inline.

On 12/18/23 16:41, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> Wait. There were two specific review requests, and both remain
> unanswered. You are just resending the patch, and that is not
> acceptable.
>=20
> - (from Ross) can we use pytest =E2=80=94automake instead of unreadable
> sed/awk monster expression?

A: Will use pytest --automake in v3.

> - (from me) is ptest returning a non-zero error code when it fails
> like the commit says? If it does, why isn't the failure seen when
> running -c testimage, or in the autobuilder which does that?

Yes, the pytest command should return non-zero as below:
  # ./run-ptest
  [snip]

PASS:=20
tests/test_license_expression.py:CombineExpressionTest.test_combine_expre=
ssions_with_duplicated_elements
PASS:=20
tests/test_license_expression.py:CombineExpressionTest.test_combine_expre=
ssions_with_empty_input
PASS:=20
tests/test_license_expression.py:CombineExpressionTest.test_combine_expre=
ssions_with_or_relationship
PASS:=20
tests/test_license_expression.py:CombineExpressionTest.test_combine_expre=
ssions_with_regular

self =3D <test_skeleton_codestyle.BaseTests=20
testMethod=3Dtest_skeleton_codestyle>

     def test_skeleton_codestyle(self):
         """
         This test shouldn't run in proliferated repositories.
         """
         setup_cfg =3D configparser.ConfigParser()
         setup_cfg.read("setup.cfg")
 >       if setup_cfg["metadata"]["name"] !=3D "skeleton":

tests/test_skeleton_codestyle.py:22:
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _=20
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _=20
_ _ _ _

self =3D <configparser.ConfigParser object at 0x7f6e46e36e90>, key =3D=20
'metadata'

     def __getitem__(self, key):
         if key !=3D self.default_section and not self.has_section(key):
 >           raise KeyError(key)
E           KeyError: 'metadata'

../../python3.11/configparser.py:979: KeyError
FAIL: tests/test_skeleton_codestyle.py:BaseTests.test_skeleton_codestyle
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary
# TOTAL: 175
# PASS: 174
# SKIP: 0
# XFAIL: 0
# FAIL: 1
# XPASS: 0
# ERROR: 0

# echo $?
1

Thanks,

>=20
> Please do check these first, and please do pay attention to what people=
 ask.
>=20
> Alex
>=20
>=20
>=20
> On Mon, 18 Dec 2023 at 07:15, <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Fix the below ptest failure:
>>   self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skelet=
on_codestyle>
>>   def test_skeleton_codestyle(self):
>>   """
>>   This test shouldn't run in proliferated repositories.
>>   """
>>   setup_cfg =3D configparser.ConfigParser()
>>   setup_cfg.read("setup.cfg")
>>   > if setup_cfg["metadata"]["name"] !=3D "skeleton":
>>   tests/test_skeleton_codestyle.py:22:
>>   self =3D <configparser.ConfigParser object at 0x7fd87cf55110>, key =3D=
 'metadata'
>>   def _getitem_(self, key):
>>   if key !=3D self.default_section and not self.has_section(key):
>>   > raise KeyError(key)
>>   E KeyError: 'metadata'
>>
>> After the patch:
>>   # ./run-ptest
>>   [snip]
>>   PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_bad_syntax
>>   PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_exception_as_regular_key
>>   PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_exception_with_choice
>>   PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_invalid_license_exception
>>   PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_invalid_license_exception_strict_false
>>   PASS: tests/test_license_expression.py::LicensingValidateTest::test_=
validation_invalid_license_key
>>   PASS: tests/test_license_expression.py::UtilTest::test_build_licensi=
ng
>>   PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_li=
censing
>>   PASS: tests/test_license_expression.py::UtilTest::test_get_license_k=
ey_info
>>   PASS: tests/test_license_expression.py::UtilTest::test_get_license_k=
ey_info_vendored
>>   PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_duplicated_elements
>>   PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_empty_input
>>   PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_or_relationship
>>   PASS: tests/test_license_expression.py::CombineExpressionTest::test_=
combine_expressions_with_regular
>>   PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_cod=
estyle
>>
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D 175 passed in 10.36s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../python/python3-license-expression/run-ptest             | 6 ++++=
+-
>>   .../python/python3-license-expression_30.1.1.bb             | 1 +
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-license-expression/r=
un-ptest b/meta/recipes-devtools/python/python3-license-expression/run-pt=
est
>> index 5cec711696..07e2dd17ee 100644
>> --- a/meta/recipes-devtools/python/python3-license-expression/run-ptes=
t
>> +++ b/meta/recipes-devtools/python/python3-license-expression/run-ptes=
t
>> @@ -1,3 +1,7 @@
>>   #!/bin/sh
>>
>> -pytest
>> +rm -rf output.log
>> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO > output.log 2>&1
>> +exitcode=3D$?
>> +cat output.log | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| se=
d -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS=
" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"=
XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=3D=3D"PAS=
S" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D=
"XPASS") {$NF=3D"";print $0}else{print}}'
>> +exit $exitcode
>> diff --git a/meta/recipes-devtools/python/python3-license-expression_3=
0.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1=
.bb
>> index 31fb88d6e5..5d3923d487 100644
>> --- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.b=
b
>> +++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.b=
b
>> @@ -33,4 +33,5 @@ do_install_ptest() {
>>       install -d ${D}${PTEST_PATH}/src
>>       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>>       cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
>> +    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
>>   }
>> --
>> 2.25.1
>>

