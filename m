Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FCFC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 03:35:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14256.1702524902486461264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 19:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=smu5ugPf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=071226f55b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE3Fnkp017122
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=2K2SoR2V8iOljfZs4J
	/zqOs/VuPt+cpEE63xPC7cEz0=; b=smu5ugPfn5vaJ7K/9AzZXViHmqYCJ1uF6V
	8kzGsa1/uFw97hIxUWxCoLNGp/cOjj9lWribffp4Gs0szUplhAbf1HAxWLEKWqS9
	9y9Mf91LyORR1zRnPHWUz5WqpK2UydpVUHsw2mXnbzxNoz/v/LdRlDMV5q5lHVKJ
	JpdbiziZCSU/S4zrLeBDQidartdtj93urbwDPV+RmdMAuFYvlqK/vcQn3RBpBl+h
	JJ8Dm9GdnwZ/U2MsAOPkEWXVt6eglhDKzJgo7JLDoizITc2F5JOZI+1wo3SSdvn3
	a4VqLRXB2hh1gMh+XxA84F2hRni+FsjdEaOKoWtW/nY3a2XuhukA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqr20v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:35:01 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BE3Z1Sp006547
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:35:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqr20t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 03:35:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKWgwW2WXywFb2KZrHLOKIscnBHSkZF51uqLzRYm2WkhzPrYOFiH3fZXXz8qFosiXMazAC0Dzf40zxSjfRW1N8wieFxeNPwvXhMatr4bt5kgzxC8p/JMmNQvM/Cva82SPSGiL7KL//bwzBiSAsH10ZZedHBeMJ8PFZqRDd1KnNMUZATjUzWT0ITBLF3WrhRSglw1y4SQcyB34FD9rimm2lU0LfAIiwVzScNa58uE6A7sVC1j+IS2mNSDwGBxW7abC1sJDMdKlUa/qyG1rXTHXDikYZCUFiLvXoPb5bmDFTnKWLQPE0SxvdUYDxbGOdRV3yiUICgDp3Dkjothd4+Wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K2SoR2V8iOljfZs4J/zqOs/VuPt+cpEE63xPC7cEz0=;
 b=UnO/b4u5a6XtqHyibmKI475hixS+0XG7AQMCd1e0lXB8o8u+qnVD0S5jIo+mDnLUL55N0sp83Bl1H/JxjMNwxB6AGv2jYyu2aMln7jWlXIleVSlvkg2aVWxuCuC7ZZhVd947fEkvoH074frIKJtfwv3IVk6Wo7CbhvRxncl59P3QYfkKZY5aIPIrWbxAy+25mcQVyh7Gl6WgZoayiJLVKAFZ9VYGoo7njzpXtTdtzRAM3Gk6K0DsxwDGFzhlnOrrwORkmc0ejBoZvBp3EJI6MXiXwzWh5NroeYOvLRJzy/dASLKiqEerEGJRaIAPOaCqZhLHIP1ssX2WFVPH+ky1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Thu, 14 Dec
 2023 03:34:58 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc%5]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 03:34:58 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest
 failure
Thread-Topic: [OE-core] [PATCH] python3-license-expression: Fix the ptest
 failure
Thread-Index: AQHaLeLX8Kt59d1HrES7uHsgWBRKhbCnahgAgAC2tBI=
Date: Thu, 14 Dec 2023 03:34:58 +0000
Message-ID: 
 <CO1PR11MB5009E6328640784502A94DDEF18CA@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <20231213102129.618430-1-mingli.yu@windriver.com>
 <CANNYZj-gPhJLyOiMrPib6QqqHiWpcakvb_bOxZXcbw5=-CeFGQ@mail.gmail.com>
 <CANNYZj_dMRQe9LfO3fnbRsgxBP5r24deRvTNoj-_U=mAK3bHqw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_dMRQe9LfO3fnbRsgxBP5r24deRvTNoj-_U=mAK3bHqw@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|SJ1PR11MB6131:EE_
x-ms-office365-filtering-correlation-id: 3951724f-1696-436e-1f8f-08dbfc55a586
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 q3WwU4hYeFo4e+Lw4In1ImFIVVVcizZMPTDkAfPz2lb9gNJe+MMayc2XfrzGKAZCbROB0ndZ/kO5OaQh4cMiSJNLylnom9uRep+l/iJAS2Qk+b/EJxBOAhrnrxuTzH+T520lr3MMmgM92PauIpC4OpdDkXvs7DWhqSIO0E1Kqu+cxyWcVpyqkPG5E6zAEWe0nqBp8gxsOy5gJgIdysmnVM3HmkGzP4lPXkUpjD4pyCofXUmYVdrLfyrxTWQyaOsYyEh/z1H9IwQaelRSqWrCCYbb39bO1JXO21u+6K/j3hDXw75UMBWG/im8QWlDPGR3EiQT+mvrt79gtO06TuJx5jhoN7JPzfKiJGeP018+zB3U4IlDJILOakq0JyfunSiwvRExMSpFclhWro1/bJlQAhLaSCw8m481ZL5/dtLGTTMFrAjLcNgIMToJ0W8yzxtCD3+NYGHDIqUw/eHcxSIJMIrbwY0pl8AapWQW7R2YPH2MRmnTQMHFrRjGD0aMvfSYHZLByefu5h3oUCL09Q2W/udbCZgR3/mDkONl7P/almS8srNQptA+qm5cdk8fKMIalqjbnY43HLrtjo7D8C03SuOjhssdsZ4e5DdlJ0B9A3NJhe1Ma9JDTPNQZ1L9eebHAsed4H5ePPXMi8mfJIG4tkeokuiJEXYJBgU1NBqQdaq90mE1Hm8ggq7O7nM+g78v
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(136003)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(19627405001)(55016003)(66899024)(26005)(33656002)(38100700002)(38070700009)(86362001)(166002)(122000001)(71200400001)(83380400001)(52536014)(4326008)(5660300002)(7696005)(53546011)(9686003)(91956017)(76116006)(8936002)(966005)(316002)(66556008)(64756008)(66946007)(6916009)(66476007)(66446008)(41300700001)(2906002)(478600001)(8676002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5+dAPakBDOZ0wt2uziO/iZ9LmTb8o13yMbS8jZQL8SNXz9081g4RjFb269I1?=
 =?us-ascii?Q?t3V09fP1mqT2sifI6qwnDNPCq1zApnCu6xYbmCreEc6MJx8EUegzOP0IVEIC?=
 =?us-ascii?Q?xUBUUmeHc+oiJhWw0edAHXc4HxWOSezjaQClRwP+2gIZtAndquOwikRknl5u?=
 =?us-ascii?Q?t9UM/9LlNpyIWHNr7rdKCMzbeYBKpXU3U0TFTuvTSVxMvu+bN0dar1q24H5i?=
 =?us-ascii?Q?KjFcQDm/60I6UsVTDz34glH9DRhIrYQ6ec2NodOnNch/j8YYieYwdtY61gU8?=
 =?us-ascii?Q?hM3kQWfYrIVlvyHPXCrDMY+QNy11NyoIwRa6aR89H1beY+rXh15cY+b/Hvgy?=
 =?us-ascii?Q?SQW1dTcWhuFmIFGrw/B83k2j2KABbkhPGVYGn6HCiTO9VJc00qT22wrDlvY2?=
 =?us-ascii?Q?7y9kseIP8Az9ZDgTYuto2S7qL9ZAv7AKdCOO5ECJpGQ/tJJtEAxa/g8c+ybT?=
 =?us-ascii?Q?Y18lGD+X2hOmooHlqHmkd1FZX1Gc9UPjDJU6Z+8puxxDb8QDJ+zSVhAvH4i/?=
 =?us-ascii?Q?3sni3bpfakGa238oyIOVdO6c6D14Yd9GuOqPEIKnMglPzROZr62SmtwcwlFb?=
 =?us-ascii?Q?+5xcUBfNmaJqHCe1zNwwTAqrR3RI/8XhxYuXT5uj2AkzLiwd/N/YnGUbJINe?=
 =?us-ascii?Q?16UliNC1NIQw4nL/LF1gWh5bZe94RODWR9iAT7WW16hpVYE0LN+oyctEs/Re?=
 =?us-ascii?Q?m1Ra/mTRt94TyF6MjZEgjAw5Mt+sP11f53mWVWbFkK+5Hy1AlpezBDDfpccC?=
 =?us-ascii?Q?O5MwDMCDRvOs+s6lqx4fBW4Zn+3gxxBRv48zzHad8hilsAHNdn3JK0lz3/ka?=
 =?us-ascii?Q?XqYm5u+ge9+cZhUkGbKQ1FylPHDTmk44vQ7+qUHFIyvG7wHNMIJwcB4kFB7r?=
 =?us-ascii?Q?sCQxcDVPrR+SEUcReWuj3cixh7Gr4Dz8KdU6DyFIH0nw3PKBrPffdUNHeLz+?=
 =?us-ascii?Q?PTdVygtJIjYjDPaY0eNE0qvr81P1QTSqpsyFGcAXGGVYrV2nLetUthikvyWZ?=
 =?us-ascii?Q?Tspvl3UwFCw9C3zgFBpwJbBTYtgBjLmkVfPaYQRysAmHwBmynvd5ixSHzG+y?=
 =?us-ascii?Q?9vFYyri0wlP8F81Qu+I8J8lPq3GoDuDyaPlu+fXX9OBBsz5tDfqlfO66NkoK?=
 =?us-ascii?Q?NIcp+XmZU8blJFtK5EEVgTaYTGybNiZuu6S0B0lyLmnKQuL8kSNlwPNwK3F+?=
 =?us-ascii?Q?sHQNjFk6s8obqh9QHYjvXBWs48xljfzKb9MEIsraAka8GMOGbxbqFVakuiGi?=
 =?us-ascii?Q?l+ZlwRHT9tBUzBpSd9n1eHKNuVUQRoF4vsBp0vSo36BO2SSkNk0s8tMWZvBl?=
 =?us-ascii?Q?m9uqLoQZqJt8bEvh/16j3xWOFUby4dy52TtCm3hRQo4nlykMzYEsLyO58Kz/?=
 =?us-ascii?Q?RE+to16cb/4dMn5RE2gDrrJPPIhx0KX3oxxYarYRwPlRqvVg84ZTDLxrBHvV?=
 =?us-ascii?Q?uimWfDL//wVrm3xYCmCWhBZDnvxb+12m1/vELfmOW8qrwJck7ovtXjbuBvsc?=
 =?us-ascii?Q?iPb/YcWqhkNWSAsFZGO0HwUXgdqp6lc+AR1BgyK87nBWv3hZOY0hzW+/Z3M0?=
 =?us-ascii?Q?8aSF9rotrvsTTih9O4UMpI0bLIV8DBfxj2Flzhzf?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009E6328640784502A94DDEF18CACO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3951724f-1696-436e-1f8f-08dbfc55a586
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 03:34:58.1947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tm4ehVg9di9N4tEo/jvW26YG9ec3rtFyii6DTnHIgfjojJPEvOl2ClWPQr4AA7e4P6K4FrGsjEn90J8wE0rCGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-Proofpoint-ORIG-GUID: PCdqvReoe0N_ftKbyp1VUEhuG-NSiTTY
X-Proofpoint-GUID: i8UQvvdKVEaFc7mGdt02bFRjt5F6dnz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 03:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192335

--_000_CO1PR11MB5009E6328640784502A94DDEF18CACO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

The single command is enough to indicate the build failure such as:
 root@qemux86-64:/usr/lib64/python3-license-expression/ptest# ./run-ptest
[snip]
PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine=
_expressions_with_empty_input
PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine=
_expressions_with_or_relationship
PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine=
_expressions_with_regular
FAIL: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyle

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D FAILURES =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
______________________ BaseTests.test_skeleton_codestyle __________________=
_____

self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton_code=
style>

    def test_skeleton_codestyle(self):
        """
        This test shouldn't run in proliferated repositories.
        """
        setup_cfg =3D configparser.ConfigParser()
        setup_cfg.read("setup.cfg")
>       if setup_cfg["metadata"]["name"] !=3D "skeleton":

tests/test_skeleton_codestyle.py:22:
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _=
 _ _

self =3D <configparser.ConfigParser object at 0x7f04c0473610>, key =3D 'met=
adata'

    def __getitem__(self, key):
        if key !=3D self.default_section and not self.has_section(key):
>           raise KeyError(key)
E           KeyError: 'metadata'

../../python3.11/configparser.py:979: KeyError
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D short test summary info =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyle
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 1 =
failed, 174 passed in 7.08s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Thanks,
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, December 14, 2023 00:39
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH] python3-license-expression: Fix the ptest fa=
ilure

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

I see that run-ptest consists of a single pytest command; does that
command return a zero exit code even it fails?

Alex

On Wed, 13 Dec 2023 at 17:38, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
>
> Why isn't the ptest failure reported by the autobuilder? Shouldn't we
> first fix the ptest so that the failure is reported correctly, if it
> starts occurring again?
>
> Alex
>
> On Wed, 13 Dec 2023 at 11:21, Yu, Mingli <mingli.yu@eng.windriver.com> wr=
ote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Fix the below ptest failure:
> >  self =3D <test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton=
_codestyle>
> >  def test_skeleton_codestyle(self):
> >  """
> >  This test shouldn't run in proliferated repositories.
> >  """
> >  setup_cfg =3D configparser.ConfigParser()
> >  setup_cfg.read("setup.cfg")
> >  > if setup_cfg["metadata"]["name"] !=3D "skeleton":
> >  tests/test_skeleton_codestyle.py:22:
> >  self =3D <configparser.ConfigParser object at 0x7fd87cf55110>, key =3D=
 'metadata'
> >  def _getitem_(self, key):
> >  if key !=3D self.default_section and not self.has_section(key):
> >  > raise KeyError(key)
> >  E KeyError: 'metadata'
> >
> > After the patch:
> >  # ./run-ptest
> >  [snip]
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_bad_syntax
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_exception_as_regular_key
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_exception_with_choice
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_invalid_license_exception
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_invalid_license_exception_strict_false
> >  PASS: tests/test_license_expression.py::LicensingValidateTest::test_va=
lidation_invalid_license_key
> >  PASS: tests/test_license_expression.py::UtilTest::test_build_licensing
> >  PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_lice=
nsing
> >  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key=
_info
> >  PASS: tests/test_license_expression.py::UtilTest::test_get_license_key=
_info_vendored
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_duplicated_elements
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_empty_input
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_or_relationship
> >  PASS: tests/test_license_expression.py::CombineExpressionTest::test_co=
mbine_expressions_with_regular
> >  PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codes=
tyle
> >
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D 175 passed in 10.36s =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  .../python/python3-license-expression/run-ptest                 | 2 +-
> >  .../python/python3-license-expression_30.1.1.bb                 | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/python/python3-license-expression/ru=
n-ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> > index 5cec711696..3385d68939 100644
> > --- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
> > +++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
> > @@ -1,3 +1,3 @@
> >  #!/bin/sh
> >
> > -pytest
> > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]/=
/g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $=
NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}=
}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > diff --git a/meta/recipes-devtools/python/python3-license-expression_30=
.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> > index 31fb88d6e5..5d3923d487 100644
> > --- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> > +++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
> > @@ -33,4 +33,5 @@ do_install_ptest() {
> >      install -d ${D}${PTEST_PATH}/src
> >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> >      cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
> > +    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
> >  }
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192278): https://lists.openembedded.org/g/openembed=
ded-core/message/192278
> > Mute This Topic: https://lists.openembedded.org/mt/103146950/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

--_000_CO1PR11MB5009E6328640784502A94DDEF18CACO1PR11MB5009namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Alex,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The single command is enough to indicate the build failure such as:</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">&nbsp;root@qemux86-64:/usr/lib64/python3-license=
-expression/ptest# ./run-ptest</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">[snip]</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">PASS: tests/test_license_expression.py::CombineE=
xpressionTest::test_combine_expressions_with_empty_input</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">PASS: tests/test_license_expression.py::CombineExpressionTest::test_combi=
ne_expressions_with_or_relationship</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">PASS: tests/test_license_expression.py::CombineExpressionTest::test_combi=
ne_expressions_with_regular</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">FAIL: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyl=
e</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D FAILURES =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">______________________ BaseTests.test_skeleton_codestyle ________________=
_______</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">self =3D &lt;test_skeleton_codestyle.BaseTests testMethod=3Dtest_skeleton=
_codestyle&gt;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; def test_skeleton_codestyle(self):</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; &nbsp; &nbsp; &quot;&quot;&quot;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; &nbsp; &nbsp; This test shouldn't run in proliferated repos=
itories.</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; &nbsp; &nbsp; &quot;&quot;&quot;</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; &nbsp; &nbsp; setup_cfg =3D configparser.ConfigParser()</sp=
an></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; &nbsp; &nbsp; setup_cfg.read(&quot;setup.cfg&quot;)</span><=
/div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&gt; &nbsp; &nbsp; &nbsp; if setup_cfg[&quot;metadata&quot;][&quot;name&q=
uot;] !=3D &quot;skeleton&quot;:</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">tests/test_skeleton_codestyle.py:22:</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _=
 _ _ _</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">self =3D &lt;configparser.ConfigParser object at 0x7f04c0473610&gt;, key =
=3D 'metadata'</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; def __getitem__(self, key):</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&nbsp; &nbsp; &nbsp; &nbsp; if key !=3D self.default_section and not self=
.has_section(key):</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; raise KeyError(key)</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">E &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; KeyError: 'metadata'</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
"><br>
</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">../../python3.11/configparser.py:979: KeyError</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D short test summary info =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);=
">FAIL tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyle=
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D 1 failed, 174 passed in 7.08s =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Thanks,</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Thursday, December 14, 2023 00:39<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] python3-license-expression: Fix the p=
test failure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
I see that run-ptest consists of a single pytest command; does that<br>
command return a zero exit code even it fails?<br>
<br>
Alex<br>
<br>
On Wed, 13 Dec 2023 at 17:38, Alexander Kanavin &lt;alex.kanavin@gmail.com&=
gt; wrote:<br>
&gt;<br>
&gt; Why isn't the ptest failure reported by the autobuilder? Shouldn't we<=
br>
&gt; first fix the ptest so that the failure is reported correctly, if it<b=
r>
&gt; starts occurring again?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed, 13 Dec 2023 at 11:21, Yu, Mingli &lt;mingli.yu@eng.windriver.c=
om&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; Fix the below ptest failure:<br>
&gt; &gt;&nbsp; self =3D &lt;test_skeleton_codestyle.BaseTests testMethod=
=3Dtest_skeleton_codestyle&gt;<br>
&gt; &gt;&nbsp; def test_skeleton_codestyle(self):<br>
&gt; &gt;&nbsp; &quot;&quot;&quot;<br>
&gt; &gt;&nbsp; This test shouldn't run in proliferated repositories.<br>
&gt; &gt;&nbsp; &quot;&quot;&quot;<br>
&gt; &gt;&nbsp; setup_cfg =3D configparser.ConfigParser()<br>
&gt; &gt;&nbsp; setup_cfg.read(&quot;setup.cfg&quot;)<br>
&gt; &gt;&nbsp; &gt; if setup_cfg[&quot;metadata&quot;][&quot;name&quot;] !=
=3D &quot;skeleton&quot;:<br>
&gt; &gt;&nbsp; tests/test_skeleton_codestyle.py:22:<br>
&gt; &gt;&nbsp; self =3D &lt;configparser.ConfigParser object at 0x7fd87cf5=
5110&gt;, key =3D 'metadata'<br>
&gt; &gt;&nbsp; def _getitem_(self, key):<br>
&gt; &gt;&nbsp; if key !=3D self.default_section and not self.has_section(k=
ey):<br>
&gt; &gt;&nbsp; &gt; raise KeyError(key)<br>
&gt; &gt;&nbsp; E KeyError: 'metadata'<br>
&gt; &gt;<br>
&gt; &gt; After the patch:<br>
&gt; &gt;&nbsp; # ./run-ptest<br>
&gt; &gt;&nbsp; [snip]<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::LicensingValidateTe=
st::test_validation_bad_syntax<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::LicensingValidateTe=
st::test_validation_exception_as_regular_key<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::LicensingValidateTe=
st::test_validation_exception_with_choice<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::LicensingValidateTe=
st::test_validation_invalid_license_exception<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::LicensingValidateTe=
st::test_validation_invalid_license_exception_strict_false<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::LicensingValidateTe=
st::test_validation_invalid_license_key<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::UtilTest::test_buil=
d_licensing<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::UtilTest::test_buil=
d_spdx_licensing<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::UtilTest::test_get_=
license_key_info<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::UtilTest::test_get_=
license_key_info_vendored<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::CombineExpressionTe=
st::test_combine_expressions_with_duplicated_elements<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::CombineExpressionTe=
st::test_combine_expressions_with_empty_input<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::CombineExpressionTe=
st::test_combine_expressions_with_or_relationship<br>
&gt; &gt;&nbsp; PASS: tests/test_license_expression.py::CombineExpressionTe=
st::test_combine_expressions_with_regular<br>
&gt; &gt;&nbsp; PASS: tests/test_skeleton_codestyle.py::BaseTests::test_ske=
leton_codestyle<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 175 passed in 10.36s =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; .../python/python3-license-expression/run-ptest&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 2 +-<br>
&gt; &gt;&nbsp; .../python/python3-license-expression_30.1.1.bb&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; | 1 +<br>
&gt; &gt;&nbsp; 2 files changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python/python3-license-express=
ion/run-ptest b/meta/recipes-devtools/python/python3-license-expression/run=
-ptest<br>
&gt; &gt; index 5cec711696..3385d68939 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/python/python3-license-expression/run=
-ptest<br>
&gt; &gt; +++ b/meta/recipes-devtools/python/python3-license-expression/run=
-ptest<br>
&gt; &gt; @@ -1,3 +1,3 @@<br>
&gt; &gt;&nbsp; #!/bin/sh<br>
&gt; &gt;<br>
&gt; &gt; -pytest<br>
&gt; &gt; +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[.=
..%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKI=
PED/SKIP/g'| awk '{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=3D&quot;FAIL&quo=
t; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&quot; || $NF=3D=3D&=
quot;XPASS&quot;){printf &quot;%s: %s\n&quot;,
 $NF, $0}else{print}}'| awk '{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=3D&qu=
ot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&quot; ||=
 $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else{print}}'<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python/python3-license-express=
ion_30.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.=
1.1.bb<br>
&gt; &gt; index 31fb88d6e5..5d3923d487 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/python/python3-license-expression_30.=
1.1.bb<br>
&gt; &gt; +++ b/meta/recipes-devtools/python/python3-license-expression_30.=
1.1.bb<br>
&gt; &gt; @@ -33,4 +33,5 @@ do_install_ptest() {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${PTEST_PATH}/src<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -rf ${S}/tests/* ${D}${PTEST_PAT=
H}/tests/<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -rf ${S}/src/* ${D}${PTEST_PATH}=
/src/<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/<br>
&gt; &gt;&nbsp; }<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#192278): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/192278">
https://lists.openembedded.org/g/openembedded-core/message/192278</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103=
146950/1686489">
https://lists.openembedded.org/mt/103146950/1686489</a><br>
&gt; &gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB5009E6328640784502A94DDEF18CACO1PR11MB5009namp_--

