Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F737C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 12:24:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.5466.1667391857948339919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 05:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=HOENp0YD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=830590c779=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A2CLhZP005261
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 05:24:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : from : subject : to : cc : mime-version;
 s=PPS06212021; bh=2o0wL7gsUj7YTqghs6+oTIPYV0BerInLSsIl3QUfK9I=;
 b=HOENp0YDYRskIbyzFjL0+JVxoSvdNiGvjfTwLYfmUXMtzVQrAQ6JYuG3sREZ8SyeKbMd
 mxsx6ncuRYCEL6ztPqlXjs4xC8lhRmfS/odeoO77YWl+8K+WAHwy/vBP+Y4aHrNdwSYH
 eCBlKoXdcn32fsd4fWcUtKVkP5WSXCQbAsseq72ebQ5FiZHnnUjT6KuQ+IPyYSB7gVZ+
 /lFYXTIK2HLWTBYPNrMjv8iJyym4Gccw+6vWaUX/8W+2fiCwQtKl8P9nXHJ659pdCLYa
 ncnfzctmc1uhr++rLPt504erCOB7Lp3W3uO4piVKNyjo1WkDthYjGBDqZr4Mfm0iN52u cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gsaahw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 05:24:17 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2COGQn010611
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 05:24:16 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gsaahv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 05:24:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTRFLbcP4pz+3Wcnomytu84bcPMzmoeAfgPqPDpQ92ITZd9HVYmqNxd8IB3mM1J10L/05TkymppCDxULkqV+Alk1vk5feYB0RlutM3+/BQpsV8y9RVxC9SM8Tt1O3EQJZ1xFuPnAnydf6o3vb5VoCaCt5pKpPUYgx62x4yYJmLmrVtPapUxRrNNftESMyhZ5+kWzrdR0s+74PMh4ZlGf4mEVJDE3FsW0/u8ODvZn341IceWCrvkE93mm3ONP5oEca2QWNaagEBCpFRfU4ULmFUB30v/Pd2laBA6o27/JQrDJ9oV5ZpidAvN03Gn07/jRzUxRBDARtiwVLt+VYlxrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2o0wL7gsUj7YTqghs6+oTIPYV0BerInLSsIl3QUfK9I=;
 b=YiodcrVdBxDSOavwIhZFYRGdKgE9vAbAKNRs7a9C04G5ThNiJ5eg0X3ubwg0fincGZ9MCmZxjQ8XlVHXrJyaS68s6uT2w+CeRABYnuqiMNLTfTbktRXOTv5eX3v+IgWxZJ9oO5AwJ+IKazqGFVbF5JB2Jt6rkNGV6qVZqIkISHiaiqQv9q27QVnnPGlXyAkZprTFRT2+TIjvg7prc3gl2UaIfHDBPLxcJzXSiF08h155GyI5a8oV+qSH2z1PsjrKlcfvHBgLy09hAjtdPE0FhhFKMH5d00Anqt2ZWro6iYvLN5ciyUmUVjmh2UvB1ND0x8byyxF21OpZAOF1jHHidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 2 Nov
 2022 12:24:15 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::daa9:a3d:d4ac:7043%6]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 12:24:14 +0000
Content-Type: multipart/mixed; boundary="------------QMqnMF1z01rj18IXO0t9NStt"
Message-ID: <4af9fc74-3b02-57ca-7aa1-d02a90f0f621@windriver.com>
Date: Wed, 2 Nov 2022 08:24:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: Dunfell toolchain update analysis
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "steve@sakoman.com" <steve@sakoman.com>
Cc: "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Language: en-CA
X-ClientProxiedBy: BYAPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:a03:80::19) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS7PR11MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e8dbe6-ed06-4da2-054d-08dabccd27c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IAod1vYbg6Ncip4Luq3P1DkkyZQ35JvBT9St3lc47KI3Nyd6/EtWTOP67BrxDDmkOMA6ZZTXm9mDeJJFXdjCDSWLjxq9YWh8VVX4TgwjVtlLJi5TUhJQT1P1IBGKm1wD8h7/8QCV6AuxWgv014MjLR7A5WEz0AytBdYy++H+64bGtgeY2GLxdfdJlhSYnH89TbDTK7HM0Zeg9HE9LyV3x1hekwW9GG72G/weme1Kmf6+7ergEtrcmo1Y+P2VdYot/wdZ3EBqJJ2iXNt7csJVAb1Fmkl9eBdBjvPiduJXg0vK6x+4hj7/dOGrqBGhqhpnTqpXi327V3Ha2U3QgIMn1iY4z711dYTxPXG6IZdCWTXo9OCIVuyVFJOyEl0JB+9xQ7iTgNJG6BF4eaMZjCaz0o+sudJF6RPo4gniPWo+1rK+4n+4+wSyColS7LNWHGoVXt7nJ84ydpW1AnC9ghxomWerBqCFDurHC+MoFVJAivO0cKF8wcCwxSuRRCZrPuKVaml5E7GbMejWjHzED4qDQDV/OjBo3xk8hr+7D5YUiIH0d5c2m5ovVrDHVt94JArE3lixATlgKRl/nQQRVtWDA9Eoy9+0YStuT+uMB1nQF2p915M9byc6eXh6l29BzXorZCfvX5O7Ptd/FCeUjBvqKNK9FXGnzD0ySMcl/P1QBNLPyFZPx4L5oLukYpDQSJqyl3YbY9oiOLlbybUUufe4L0Rh5HXC87PxpjdkP9VxQAr2y8cNWJiLvSdfIwcNukAZIRtRezK3sVn/zLC5py8uiw7EsuZOY/6o+wbMKuwA2EA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(451199015)(33964004)(38100700002)(5660300002)(478600001)(66476007)(66556008)(235185007)(6486002)(66946007)(31696002)(41300700001)(4326008)(36756003)(8936002)(86362001)(316002)(110136005)(19627405001)(54906003)(21480400003)(31686004)(8676002)(2616005)(2906002)(15650500001)(186003)(6512007)(3480700007)(6666004)(6506007)(83380400001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NitKTlRLeXNONzNObmlSSFNwNU9CWlA0elg5S1o2NFhqbGRicnNISklyVHBD?=
 =?utf-8?B?cC9VUU9VaWFEelh5aW9wVEEyalZaSEEyL1dyclVjaVU0WHF4RkhWMjBGcGZ3?=
 =?utf-8?B?Q01IZXAremV0c094QnJySlVrRndTZkdPbHFqR05UNGpjRSt2Zis2anFHaTNH?=
 =?utf-8?B?OVZhWmlEVFNaWGNleGJQSTl6aG1WUGhnNW5xZUJ6UWhEZTRtclZIaFJDdlFY?=
 =?utf-8?B?VHpsWGhpYTJYMFhiMjhHWXZjenBtYWtZTmE3WXEwb2NhSmJndGNPTWxrZ2xz?=
 =?utf-8?B?TWQ3RTZWUWxSTlhnbVRIaHNvUW1veUErSDBHN1lIaUlScHAzNVNjR3NSTlV3?=
 =?utf-8?B?eTkxTVRSZFBtVG9wMi80dGZqWW83cHJWdStlQ2E2b28rTk5CcG83YkUvUEln?=
 =?utf-8?B?QkVlb2wrNzJwcTVRdnZvK21jTzdEV3JWeFN3cnhhM3JaTm5EUDdGVHBTcmRP?=
 =?utf-8?B?enpyTU10YjU5WmkvOHRNNGZpZzUrSWNEMFNCbERCQ0IybXcwdEQ0TVdnNm9J?=
 =?utf-8?B?UkFITGp6Ky92MThiZWM3U2hGemxNZ2JtVitHRmhXczZDOFJFMFNjK3NQVkN0?=
 =?utf-8?B?TGJwRGVFWlNzTDRpc2x3a3VNWnpSTGxWd3RvRzZ0VXhST2o2VG1URnQza0s5?=
 =?utf-8?B?S0VvaDVFZHpJYUlLeUIvc0VvV0k5WTFyeWZQSlhzYStseFZxeTgzOG9Tay9M?=
 =?utf-8?B?WE5FN1JaTU4xcGx5Tnl2YzVLa05yY1NjSCtmbDYrcEdvWkM5M3VsQi9DTVZ6?=
 =?utf-8?B?ZlVTUTF3TDUwTXFOZnFkOTNtVUFaQzMwdEZ3UnVFKy9XR1RLblVyVkZxNDNl?=
 =?utf-8?B?ZzNSRDB5dFpHZ2pYbmVsNHhzcVFDSGZYK0FQMXNwQjRzZStzMEp2RzB0dHZz?=
 =?utf-8?B?RGZZbVErNnZUSEkrVnBTa0RnV0diZTFkendOOEFwUDZBOVVTRDRNUzNmMjUz?=
 =?utf-8?B?WGJWYkVBM3Q3ekE2clA3elNZcDgrdlJ6OEk2eHdKMUNpM0JraURZNEFQRlk4?=
 =?utf-8?B?RmV6RXprRkRPQUJDRHp0ci9uMUZBbFdYRnN1NWtkUUVLZmkrM2hPaDhUUVUz?=
 =?utf-8?B?NkFyS3dIa25QZlFnRXBaN2NQVm9abkdsQlcySDJSNlJ3MUlzR3JGWGYzYm84?=
 =?utf-8?B?SGlxM08waTZaVVF1NW1ZSDdJYlVaQmlwQThGMkdOZFl1b2JBbGtxelFIVWs4?=
 =?utf-8?B?NWorQ1BFUThqdmZPUldWMUtWMjhWeTlvSVhPQll5U21ZRkMvTTVuYndYakFV?=
 =?utf-8?B?ZDVTbE0weUEvNjgzN2VTeGFsU3ZRSUZ4aXAxMTRHQlp2UzkybFRZTjZBZ2JN?=
 =?utf-8?B?Mk82d0VmUHl2cWlxb1NqcmFiem5DSjkzNTZKTUd2bGk3YkhaUFJPK3BMK1RN?=
 =?utf-8?B?MzlYdHFCY3BEbk5ZYmh2QzRnL3ZKWm45N3JOWTBDMjZudjdSdHR5SUgvbEJ1?=
 =?utf-8?B?RlNuWmRzd21KenRjbnpWa2N6WnNqN2orbDJNT0I0aFpUNmFHQzdaeDdEMStR?=
 =?utf-8?B?TGtYRmU3USthWjZLRmU1R2Y3MnVnb2xvc1pLbFhFeGJyaDBqTGRIMDVoTW8r?=
 =?utf-8?B?L3pyK3h5aGxhYmg2c2dFOUw4b3pONGszOUFoTDlPUExxSDNyTTZ1aWY2RHlq?=
 =?utf-8?B?dTZESDh0dmVZd3YvSHlsMFZFWHVjMUtBVTlaSG5uZDJMSzBWL3hEMDQ4L3h3?=
 =?utf-8?B?SDQwMUdIVmNlZVBGWDZQSkVjalZVZjg5ZXdjRlh4YVVzL3dha2xFb0lRWG5L?=
 =?utf-8?B?TXEzamUrUWROdlBTbGU0Vk4yNTJzS1k2R0RYVENBVldIQzl6SFZlei9XUDBQ?=
 =?utf-8?B?SkkrR0oyOTI1VHBEdEQxRW9Xa3MyRkNZYS94NHJSVGhTcWU3MXZwTXBMdzdi?=
 =?utf-8?B?SVJlN3FIRHFXMi94NFlFVEFLdUVmKy85RFYrNEs2V0dNbDZIMldZdUtNdzJF?=
 =?utf-8?B?bXROVnVabjFkMFpMeWozOWtxeTdPUkR2WUtidjRSQk8rME9YSFBoSUxRVkdE?=
 =?utf-8?B?QWdjaFoxdDFCLzB1RVJMNmtTK0pTV1Evd054QmxWQS84V3BoMG8rN1ExYWh6?=
 =?utf-8?B?Mm5wWjY1V055MTVWeEZaa1N0NStzMkpQTkRhVmN2NjhuK1laTDFBeWtxWGF0?=
 =?utf-8?B?c1pKc29LR1ZsU2ZuV3ZkeTBsVDJPUGw3Q0hzcHEyNytyS2V4WVV0Qnp2S0JD?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e8dbe6-ed06-4da2-054d-08dabccd27c1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 12:24:14.8562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqV/lzKLu4/zW6cUSqSYdmO5BL4pX1C3wUaayTOsYpivMMl+JXEnjTJ0F+GvtRuAzOZX5xZVWzU3DL3Li7bkAtjRC5u06XLQ0DnmvY1aQA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
X-Proofpoint-GUID: vVL3LtHAgW711BZaopnJRMKk4R0WuR-c
X-Proofpoint-ORIG-GUID: vLiwKDzRJ5Z2TiljI0MoIgBsjXVm2k0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_08,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=863 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 12:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172586

--------------QMqnMF1z01rj18IXO0t9NStt
Content-Type: multipart/alternative;
 boundary="------------mTT9Rk9V7DQrxqdPdz3Kluvr"

--------------mTT9Rk9V7DQrxqdPdz3Kluvr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2A2CLhZP005261

Thanks for the info I requested Sundeep.


Steve or anyone using dunfell,

Do you have any concerns with the updates shown below?

../Randy


---

Hello Randy,

I checked the /Dunfell /branch for gcc, glibc & binutils updates.

 1. gcc-9.3 is currently used in Dunfell and gcc-9.5 was released by gcc.
 2. glibc-2.31 is used by Dunfell and latest commits in this branch are
    listed in attached file 'glibc.log'
 3. binutils-2.34 is used by Dunfell and latest commits in this branch
    are listed in attached file=C2=A0'binutils-gdb.log'

Can I update all these 3 modules as mentioned above?


Thanks,
Sundeep K.
--------------mTT9Rk9V7DQrxqdPdz3Kluvr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
  </head>
  <body dir="ltr">
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">Thanks for the info I requested
      Sundeep.</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof"><br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof"><br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">Steve or anyone using dunfell,<br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof"><br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">Do you have any concerns with
      the updates shown below?</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof"><br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">../Randy</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof"><br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof"><br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">---</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof"><br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">Hello Randy,</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      <br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      I checked the <i>Dunfell </i>branch for gcc, glibc &amp;
      binutils updates.</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      <ol>
        <li><span>gcc-9.3 is currently used in Dunfell and gcc-9.5 was
            released by gcc.</span></li>
        <li><span>glibc-2.31 is used by Dunfell and latest commits in
            this branch are listed in attached file 'glibc.log'</span></li>
        <li><span>binutils-2.34&nbsp;<span style="background-color:rgb(255,
              255, 255);display:inline !important" class="ContentPasted0">is used by Dunfell and latest
              commits in this branch are listed in attached file<span class="ContentPasted0">&nbsp;'binutils-gdb.log'</span></span></span></li>
      </ol>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      Can I update all these 3 modules as mentioned above?</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      <br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      <br>
    </div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      Thanks,</div>
    <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
      font-size: 12pt; color: rgb(0, 0, 0); background-color: rgb(255,
      255, 255);" class="elementToProof">
      Sundeep K.</div>
  </body>
</html>

--------------mTT9Rk9V7DQrxqdPdz3Kluvr--

--------------QMqnMF1z01rj18IXO0t9NStt
Content-Type: application/octet-stream; name="glibc.log"
Content-Disposition: attachment; filename="glibc.log"
Content-Transfer-Encoding: base64

Z2l0IGxvZyAtLW9uZWxpbmUgM2VmOGJlOWI4OWVmOTgzMDA5NTE3NDFmMzgxZWI3OTEyNmFjMDI5
Zi4uZDRiNzU1OTQ1NzRhYjhhOWMyYzQxMjA5Y2Q4YzYyYWFjNzZiNWEwNCA+IGdsaWJjLmxvZwoK
ZDRiNzU1OTQ1NyB4ODYtNjQ6IFJlcXVpcmUgQk1JMiBmb3IgYXZ4MiBmdW5jdGlvbnMgW0JaICMy
OTYxMV0KYjhiYjQ4YTE4ZCB4ODYtNjQ6IFJlcXVpcmUgQk1JMiBmb3Igc3RyY2hyLWF2eDIuUyBb
QlogIzI5NjExXQpjOGYyYTNlODAzIEFkZCB0ZXN0IGZvciBidWcgMjk1MzAKZTZhZTViMjVjZCBG
aXggbWVtbW92ZSBjYWxsIGluIHZmcHJpbnRmLWludGVybmFsLmM6Z3JvdXBfbnVtYmVyCjFkYmU4
NDFhNjcgUmVtb3ZlIG1vc3QgdmZwcmludGYgd2lkdGgvcHJlY2lzaW9uLWRlcGVuZGVudCBhbGxv
Y2F0aW9ucyAoYnVnIDE0MjMxLCBidWcgMjYyMTEpLgo1YTgwMjcyM2RiIHN0ZGlvOiBBZGQgdGVz
dHMgZm9yIHByaW50ZiBtdWx0aWJ5dGUgY29udmVydGlvbiBsZWFrIFtCWiMyNTY5MV0KYWU3NzQ4
ZTY3ZiBzdGRpbzogUmVtb3ZlIG1lbW9yeSBsZWFrIGZyb20gbXVsdGlieXRlIGNvbnZlcnRpb24g
W0JaIzI1NjkxXQoxNzRkMGI2MWM3IExpbnV4OiBSZXF1aXJlIHByb3Blcmx5IGNvbmZpZ3VyZWQg
L2Rldi9wdHMgZm9yIFBUWXMKMGExNjczNzRmZCBMaW51eDogRGV0ZWN0IHVzZXIgbmFtZXNwYWNl
IHN1cHBvcnQgaW4gaW8vdHN0LWdldGN3ZC1zbWFsbGJ1ZmYKNGFkMTY1OWQ4YyBnZXRjd2Q6IFNl
dCBlcnJubyB0byBFUkFOR0UgZm9yIHNpemUgPT0gMSAoQ1ZFLTIwMjEtMzk5OSkKMzMxOWNlYTk5
ZSBzdXBwb3J0OiBBZGQgaGVscGVycyB0byBjcmVhdGUgcGF0aHMgbG9uZ2VyIHRoYW4gUEFUSF9N
QVgKZjczM2UyOTFiYiBzdXBwb3J0OiBGaXggeGNsb25lIGJ1aWxkIGZhaWx1cmVzIG9uIGlhNjQg
YW5kIGhwcGEKNDM3NTdjNzBlZSBzdXBwb3J0OiBBZGQgeGNsb25lCjI5ZDNhZWIwZTggQWRkIHhj
aGRpciB0byBsaWJzdXBwb3J0LgoyZDc3MjBmMzE2IHN1cHBvcnQ6IEFkZCBjcmVhdGVfdGVtcF9m
aWxlX2luX2RpcgoxODM3MDk5ODNkIE5FV1M6IEFkZCBhIGJ1ZyBmaXggZW50cnkgZm9yIEJaICMy
ODg5NgpkMzg1MDc5YmQ1IHg4NjogRml4IFRFU1RfTkFNRSB0byBtYWtlIGl0IGEgc3RyaW5nIGlu
IHRzdC1zdHJuY21wLXJ0bS5jCjdkZjNhZDY1NjAgeDg2OiBUZXN0IHdjc2NtcCBSVE0gaW4gdGhl
IHdjc25jbXAgb3ZlcmZsb3cgY2FzZSBbQlogIzI4ODk2XQpmYzEzM2ZjZjQ5IHg4NjogRmFsbGJh
Y2sge3N0cnx3Y3N9Y21wIFJUTSBpbiB0aGUgbmNtcCBvdmVyZmxvdyBjYXNlIFtCWiAjMjg4OTZd
Cjc3NWMwNWIyOGMgc3RyaW5nOiBBZGQgYSB0ZXN0Y2FzZSBmb3Igd2NzbmNtcCB3aXRoIFNJWkVf
TUFYIFtCWiAjMjg3NTVdCmM2YjM0NmVjNTUgeDg2LTY0OiBUZXN0IHN0cmxlbiBhbmQgd2NzbGVu
IHdpdGggMCBpbiB0aGUgUlNJIHJlZ2lzdGVyIFtCWiAjMjgwNjRdCjA2NzUxODU5MjMgeDg2OiBS
ZW1vdmUgd2Nzbmxlbi1zc2U0XzEgZnJvbSB3Y3NsZW4gaWZ1bmMtaW1wbC1saXN0IFtCWiAjMjgw
NjRdCjVkYjMyMzliYWYgeDg2OiBCbGFjayBsaXN0IG1vcmUgSW50ZWwgQ1BVcyBmb3IgVFNYIFtC
WiAjMjczOThdCjViOTlmMTcyYjggeDg2OiBDaGVjayBSVE1fQUxXQVlTX0FCT1JUIGZvciBSVE0g
W0JaICMyODAzM10KNzBkMjkzYTE1OCBORVdTOiBBZGQgYSBidWcgZml4IGVudHJ5IGZvciBCWiAj
Mjc5NzQKYTJiZTJjMGY1ZCBTdHJpbmc6IEFkZCBvdmVyZmxvdyB0ZXN0cyBmb3Igc3Rybmxlbiwg
bWVtY2hyLCBhbmQgc3RybmNhdCBbQlogIzI3OTc0XQo0ODkwMDZjM2M1IHg4NjogT3B0aW1pemUg
c3RybGVuLWV2ZXguUwo5MzdmMmM3ODNhIHg4NjogRml4IG92ZXJmbG93IGJ1ZyBpbiB3Y3NubGVu
LXNzZTRfMSBhbmQgd2Nzbmxlbi1hdngyIFtCWiAjMjc5NzRdCjAwNThjNzNkMTEgeDg2LTY0OiBB
ZGQgd2NzbGVuIG9wdGltaXplIGZvciBzc2U0LjEKNjY1ZDAyNTJmMSB4ODYtNjQ6IE1vdmUgc3Ry
bGVuLlMgdG8gbXVsdGlhcmNoL3N0cmxlbi12ZWMuUwo4MmZmMTNlMmNjIHg4Ni02NDogRml4IGFu
IHVua25vd24gdmVjdG9yIG9wZXJhdGlvbiBpbiBtZW1jaHItZXZleC5TCjUzOWI1OTNhMWQgeDg2
OiBPcHRpbWl6ZSBtZW1jaHItZXZleC5TCjdiMzdhZTYwYzYgeDg2OiBPcHRpbWl6ZSBzdHJsZW4t
YXZ4Mi5TCjAzODFjMWMxMGQgeDg2OiBGaXggb3ZlcmZsb3cgYnVnIHdpdGggd21lbWNoci1zc2Uy
IGFuZCB3bWVtY2hyLWF2eDIgW0JaICMyNzk3NF0KMTAzNjhjYjc2YiB4ODY6IE9wdGltaXplIG1l
bWNoci1hdngyLlMKNjZjYTQwNTgyZSB0ZXN0LXN0cm5sZW4uYzogQ2hlY2sgdGhhdCBzdHJubGVu
IHdvbid0IGdvIGJleW9uZCB0aGUgbWF4aW11bSBsZW5ndGgKOTI3YmNhZjg5MiB0ZXN0LXN0cm5s
ZW4uYzogSW5pdGlhbGl6ZSB3Y2hhcl90IHN0cmluZyB3aXRoIHdtZW1zZXQgW0JaICMyNzY1NV0K
MGQ0MTU5YzM2YyB4ODYtNjQ6IFJlcXVpcmUgQk1JMiBmb3IgX19zdHJsZW5fZXZleCBhbmQgX19z
dHJubGVuX2V2ZXgKYzBjYmI5MzQ1ZSBORVdTOiBBZGQgYSBidWcgZml4IGVudHJ5IGZvciBCWiAj
Mjc0NTcKZTgxYjk3NWZjYyB4ODYtNjQ6IEZpeCBpZmRlZiBpbmRlbnRhdGlvbiBpbiBzdHJsZW4t
ZXZleC5TCmFhNGU0OGU3M2MgeDg2LTY0OiBVc2UgWk1NMTYtWk1NMzEgaW4gQVZYNTEyIG1lbW1v
dmUgZmFtaWx5IGZ1bmN0aW9ucwphYzkxMWQzYjU3IHg4Ni02NDogVXNlIFpNTTE2LVpNTTMxIGlu
IEFWWDUxMiBtZW1zZXQgZmFtaWx5IGZ1bmN0aW9ucwoyMGQzN2RlNTMzIHg4NjogQWRkIHN0cmlu
Zy9tZW1vcnkgZnVuY3Rpb24gdGVzdHMgaW4gUlRNIHJlZ2lvbgpmYmFhOTllZDQxIHg4Ni02NDog
QWRkIEFWWCBvcHRpbWl6ZWQgc3RyaW5nL21lbW9yeSBmdW5jdGlvbnMgZm9yIFJUTQowOTZlMTRm
NjMyIHg4Ni02NDogQWRkIG1lbWNtcCBmYW1pbHkgZnVuY3Rpb25zIHdpdGggMjU2LWJpdCBFVkVY
CmYwMGZhZDRlNGMgeDg2LTY0OiBBZGQgbWVtc2V0IGZhbWlseSBmdW5jdGlvbnMgd2l0aCAyNTYt
Yml0IEVWRVgKY2YyMzlkZGQyZSB4ODYtNjQ6IEFkZCBtZW1tb3ZlIGZhbWlseSBmdW5jdGlvbnMg
d2l0aCAyNTYtYml0IEVWRVgKNzI1N2JhN2JmMiB4ODYtNjQ6IEFkZCBzdHJjcHkgZmFtaWx5IGZ1
bmN0aW9ucyB3aXRoIDI1Ni1iaXQgRVZFWApkYjkwNzFjMGY2IHg4Ni02NDogQWRkIGlmdW5jLWF2
eDIuaCBmdW5jdGlvbnMgd2l0aCAyNTYtYml0IEVWRVgKMmQ2MTJiMmM1ZiB4ODY6IFNldCBQcmVm
ZXJfTm9fVlpFUk9VUFBFUiBhbmQgYWRkIFByZWZlcl9BVlgyX1NUUkNNUAo1YjEzNjUxMDg1IE5F
V1M6IEFkZCBhIGJ1ZyBmaXggZW50cnkgZm9yIEJaICMyODc1NQo1ZWU4YTQzNmFiIHg4NjogRml4
IF9fd2NzbmNtcF9hdngyIGluIHN0cmNtcC1hdngyLlMgW0JaIyAyODc1NV0K

--------------QMqnMF1z01rj18IXO0t9NStt
Content-Type: application/octet-stream; name="binutils-gdb.log"
Content-Disposition: attachment; filename="binutils-gdb.log"
Content-Transfer-Encoding: base64

Z2l0IGxvZyAtLW9uZWxpbmUgZDRiNTA5OTliM2IyODdiNWY5ODRhZGUyZjg3MzRhYThjOTM1OTQ0
MC4uYzRlNzhjMDg2OGEyMjk3MTY4MDIxN2E0MWZkYjczNTE2YTI2ODEzZCA+IGJpbnV0aWxzLWdk
Yi5sb2cKCmM0ZTc4YzA4NjhhIFBSMjc3NTUsIHBvd2VycGMtbGQgaW5maW5pdGUgbG9vcAozMzk3
M2QyMjhjOSBnYXMsIGFybTogUFIyNjg1OCBGaXggYXZhaWxhYmlsaXR5IG9mIHNpbmdsZSBwcmVj
aXNpb24gdm11bC92bWxhIGluIGFybSBtb2RlCjBjODY1MmZlMjg4IHg4NjogVXBkYXRlIEdOVSBw
cm9wZXJ0eSB0ZXN0cwo1YzFiZDNmNTJjNiB4ODY6IFByb3Blcmx5IG1lcmdlIC16IGlidCBhbmQg
LXogc2hzdGsKOTNiOWJmMTY1MWEgUG93ZXJQQyBUUFJFTF9IQS9MTyBvcHRpbWlzYXRpb24KNTg5
NTBhM2JmZDQgRGF0ZSB1cGRhdGUKZTNiMzE0ZDNhNjEgYWFyY2g2NDogc2V0IHNoX2VudHNpemUg
b2YgLnBsdCB0byAwCjI2YjZhYjdhMGU0IFMvMzkwOiB6MTM6IEFjY2VwdCB2ZWN0b3IgYWxpZ25t
ZW50IGhpbnRzCjczMjQyOTJjZDk0IGdhczogRml4IGNoZWNraW5nIGZvciBiYWNrd2FyZHMgLm9y
ZyB3aXRoIG5lZ2F0aXZlIG9mZnNldAo0NjNlYzE4OWZlOSBQcmV2ZW50IGEgcG90ZW50aWFsIHVz
ZS1hZnRlci1mZWUgbWVtb3J5IGNvcnJ1cHRpb24gYnVnIGluIHRoZSBsaW5rZXIgKGZvciBQRSBm
b3JtYXQgZmlsZXMpLgplZjI4MjZjMGZkYiBGaXggdGhlIEFSTSBhc3NlbWJsZXIgdG8gZ2VuZXJh
dGUgYSBSZWFsdGltZSBwcm9maWxlIGZvciBhcm12OC1yLgo4NTI0YmI1YmQyOCBSZTogRml4IHRp
Z2h0IGxvb3Agb24gcmVjdXJzaXZlbHktZGVmaW5lZCBzeW1ib2xzCjU3Njg0NjAwMjJiIEZpeCB0
aWdodCBsb29wIG9uIHJlY3Vyc2l2ZWx5LWRlZmluZWQgc3ltYm9scwphNzI0MjdiMWFlMCBnYXM6
IFBSIDI1ODYzOiBGaXggc2NhbGFyIHZtdWwgaW5zaWRlIGl0IGJsb2NrIHdoZW4gYXNzZW1ibGlu
ZyBmb3IgTVZFCjlmNTdhYjQ5YjMyIEJGRDogRXhjbHVkZSBzZWN0aW9ucyB3aXRoIG5vIGNvbnRl
bnQgZnJvbSBjb21wcmVzcyBjaGVjay4KYWFmM2YwNTk5YTIgQXJtOiBGaXggTFNCIG9mIEdPVCBm
b3IgVGh1bWIyIG9ubHkgUExULgo5N2Y5MmIzZTkwYSBBcm06IEZpeCB0aHVtYjIgUExUIGJyYW5j
aCBvZmZzZXRzLgozMDUzZDdhMTYzYyBpbmNsdWRlOiBTeW5jIHBsdWdpbi1hcGkuaCB3aXRoIEdD
QwpmN2FlYzJiOGUwOSBQUjI1NzQ1LCBwb3dlcnBjNjQtbGQgb3ZlcmZsb3dzIHN0cmluZyBidWZm
ZXIgaW4gLS1zdGF0cyBtb2RlCjFiMmJmMGY2NWMxIGluY2x1ZGU6IFN5bmMgcGx1Z2luLWFwaS5o
IHdpdGggR0NDCjVlODYxOWI5NTk3IGluY2x1ZGU6IFN5bmMgbHRvLXN5bXRhYi5oIGFuZCBwbHVn
aW4tYXBpLmggd2l0aCBHQ0MKMjM4MjAxMDljZWQgcGx1Z2luOiBEb24ndCBpbnZva2UgTFRPLXdy
YXBwZXIKNjRmNWMwYWZjYzQgcGx1Z2luOiBVc2UgTERQVF9BRERfU1lNQk9MU19WMiB0byBnZXQg
c3ltYm9sIHR5cGUKYWFhMWUxNjAwNDAgU2lsZW5jZSB3YXJuaW5ncyBkdWUgdG8gcGx1Z2luIEFQ
SSBjaGFuZ2UKZTdjMGVlNTExMGMgSW5jbHVkZTogU3luYyBsdG8tc3ltdGFiLmggYW5kIHBsdWdp
bi1hcGkuaCB3aXRoIEdDQwpiNjUyMGJlMzdmZCBGaXggZHdhcmYuYyBidWlsZCB3aXRoIEdDQyAx
MAphNTYwYzI5Y2E1YSBiZmQ6IENoYW5nZSBudW1fZ3JvdXAgdG8gdW5zaWduZWQgaW50CjNjYTRj
ZDFlYmRlIGdhcywgYXJtOiBGaXggYmFkIGJhY2twb3J0CmIzMTc0ODU5YzRiIGdhcywgYXJtOiBQ
UjI1NjYwTCBGaXggdmFkZC92c3ViIHdpdGggbHQgYW5kIGxlIGNvbmRpdGlvbiBjb2RlcyBmb3Ig
TVZFCmRlOWMxYjdjZmU2IHBvd2VycGM2NC1sZCBpbmZpbml0ZSBsb29wCjAzMThmYzRlMThlIEFk
anVzdCBQUjI1MzU1IHRlc3RjYXNlCjQwYmZiOTc2Mjc0IFJlOiBQUjI0NTExLCBubSBzaG91bGQg
bm90IG1hcmsgc3ltYm9scyBpbiAuaW5pdF9hcnJheSBhcyAidCIKNDJiMjM4MGNkY2UgRG9uJ3Qg
Y2FsbCBsdG8td3JhcHBlciBmb3IgYXIgYW5kIHJhbmxpYgphY2M0YThiOGFjOCBQUjI1NTg1LCBQ
SERSIHNlZ21lbnQgbm90IGNvdmVyZWQgYnkgTE9BRCBzZWdtZW50

--------------QMqnMF1z01rj18IXO0t9NStt--

