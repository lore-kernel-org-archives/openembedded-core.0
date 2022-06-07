Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F10C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 23:24:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.309.1654644256014711952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 16:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Fn9PN0k+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=31575483aa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 257Mumgl008767
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Jun 2022 16:24:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=7hlKmOFYEF7uIdemqQU2T5jIojLt67APyf75PG/+F1o=;
 b=Fn9PN0k+svfW0cqfDjq3wF3bnKE2R+02J07tE87pS8I9UgWvVgVO7Q1DE+q6PI2BfFKR
 678i2+XuPMEpMYWTeVCyxDNc7nzYxHZrbS8fK1Dwkd2R3f0HYGPk1bJk8g1XlP4N1Gjf
 Ecu6URHtiwO1jxwIsvUpT3E1N9be05ScezTzzy4kod5l8Wr4/6qoRUL/ie8s38Ozranz
 va50+mExayA0KRZwtSBbdhZdpP+jV1yHLTUGhZ0SBX9H2P4Rc1IKa0bIyHF067oCRIEF
 QkuUa+/5jbmBd8GZHvl9r2GDhaJP7buPwQvTqxzZyvzHZgxb0iCO4FcAOk87htpDF7yI bQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gg6wmadn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 16:24:15 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 257NOEdQ000603
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Jun 2022 16:24:14 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gg6wmadn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 16:24:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1p9C6s1hkq3jgyXfgTd8srvmtt1gq/X0RDp9ZueWHZDagfjKrJhpsnalWWOafivptuskCUr9UMdwUxcVDfdaMa30uJH14MQzRvWmDDWYuMI9ruaYUG0vseVH+snNLpxvjjRM7dsbIOA0BrQxAEhOWQgUa74J+j03qUMzK9A/Oi4fdC0RNyqBN2FMfpKHYZfH4JbedIr95fv+lIrliMSVxx5HJb6csQGGszCnWTKt1FSDf1d1AjylqVAVApxhotnOmfOzJ6kqsEY+JZNiJJmIet9/5C4HPi89ymLJ4chkVKbgs/BSwPrQmM1U01lpIAtPnYMtif3zvObX6eLCMGbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hlKmOFYEF7uIdemqQU2T5jIojLt67APyf75PG/+F1o=;
 b=fqFFf9UjVKZC1Lx5+Yo4HMoYWdhq4y7iJfIssKTMR7+O7Um+R4KcGwoIFju+kuTA801qSwojot0yjK+TRmVhMJKSlDlvBwvJarJzRXa54Xvq1k0MIAQFc+QTg4w+BiVVhkRJK4E/BfE+i0EFlc0AuzjvbJ3yqUFukv6O7HB+uOfU3R0x+3L/PgUc+W+D3DN/z3xm8l0SmYSeXu45LDxE6WhLqxzq/794qwkYcEO25zrSJsqBzhbUlYLdYcDcuORX1TfSKhpAcSIbTk33iwrsY5Ee2JO4vhZo1wzYXpevQONZgsuFyJabq3Xv+gGchSzG9tEvRvCna8NeYldVc0uP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL1PR11MB6028.namprd11.prod.outlook.com (2603:10b6:208:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 23:24:12 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::a996:ba9f:332:de3%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 23:24:12 +0000
Message-ID: <2964701f-1022-07e1-12b5-5ce8c4f178ea@windriver.com>
Date: Tue, 7 Jun 2022 19:24:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [dunfell][PATCH] systemd: Whitelist CVE-2018-21029
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>,
        Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220602122005.17173-1-anolgajbhiye99@gmail.com>
 <22204.1654618205983575596@lists.openembedded.org>
 <CAOSpxdYoYPS0Fjgfyt8uug8ozGdrU2qKSq2DaYY6P3oW_H75CQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <CAOSpxdYoYPS0Fjgfyt8uug8ozGdrU2qKSq2DaYY6P3oW_H75CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 560b9c24-a585-4dad-85c5-08da48dcd49a
X-MS-TrafficTypeDiagnostic: BL1PR11MB6028:EE_
X-Microsoft-Antispam-PRVS: 
	<BL1PR11MB60288778E5F3C41F6ACD20CCF8A59@BL1PR11MB6028.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/o9yhFVOKhzd6RMv6pYmSvGAeNjZ2BMtfqBKqGClH0vzrYTPLCwRj0QdRPw2L+rllaJLQSIxgdFCWHRKO8rbX356+BZxKkgEzKpj336ItYLs/O5i6249NQuC9R5WEuHgo5dqTalgy6H4oIRLknqWGRQ70QRu/4ynbwPat6tClEws5V8CkCXiBUQnc5GCPwnPMGkmcHLbKZhikIGg3ppRvNxVmeoOM/msCkz3jdHD2zoYsAeAzMy5CMwSVwASCYC0TWyLx4eBlSfhguorrcvhgR70vg3e54n0XtHl73VovVV093LlFrOcdXQlU3dXK3BwPuOo6/YubwAfsq1fJRPEHJPIcxD5s9nfPh0Muu4uenlIMKL4wLG3nosIoBCjL778BGFTtywhB9xaTKrZDB3X1k0T0T8JeYZKWsMHPUhC4epGWtG2o/KiQTdNkzjHTLZJsFKqSBBpeMqqYPCm8R97odtS2e4AIflffutiK/+2GOrPLoLbIGJu15bkVM4RmxSzpyUQxLC08yxiVbxEvSI9GR3YSVgkOiqOjM/K27jvRanmhQEsMeJfl3gz/TU9+7XtSm6wyEqSyMUWh7b0hX7wpy9+2nmVtoYQAtvuu65rH9Knf4fKIpg1MZVhJea9kz+AAWGS41k3UJdLGj5z0q7cIAGjAgZo9Yx8Lf1qpEz4tHt8EVBmhuZjhvaY1PgFfNdg1m2HoRYQxoar97k7jSmiN/qCZtHJrh76eC8RrAo3UwJYhTC5Fy7eBFqhSPcdnoNaHq7gixihr+biXiG5lzJ3iOdcdroUI7W/u48Pmt1xscxIXSf2uKKIknAK2XoZmPSyHrmiuGFkDec+CkD5Dn7ta+2kfB2FfkDg8U0djLp7QC6faR+ulp7+l4emPaX2OgliRQGQacbLoafxRkjueiuzJg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(316002)(8936002)(31696002)(966005)(6486002)(186003)(2616005)(38350700002)(86362001)(2906002)(6506007)(38100700002)(4326008)(66556008)(53546011)(36756003)(6666004)(8676002)(66946007)(5660300002)(66476007)(31686004)(110136005)(508600001)(52116002)(26005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzhFOVNIc0ZiMVdSMmtFSlErcnpRdXR3bU42bW43bTFTcWJOZnU5WTE2SUpl?=
 =?utf-8?B?YVI1Wk9RSlQ3UlNzb0VjejJOWENjbTR1c0NrM0xtUjRtYjVVN2lRbXZINk5N?=
 =?utf-8?B?TzZoaWc5cThDb1RjYUVEdU1NMjBGZ1k2TXV5RXk3bnhzbExDaWxDTkxQcnh6?=
 =?utf-8?B?aWVDbFdxaHlWSjVGUEhUQWRWSm9hTUxSakd3ZFdhN2l4cXNSRWFmTG5BWUdQ?=
 =?utf-8?B?Y2syY1FSeGt0RkJ0NGJLN0VNb2ZDUzBaSHN4MVI5aWhHL3lWTDhxUzY0WG9T?=
 =?utf-8?B?c0t1ekYvakpRZFdBN2pVbmVUMzQxQ0VCak9hQTVjcnhvWWlPWWRpeDkySEJs?=
 =?utf-8?B?ODZsZ2ljeCtPaTdianhjd1ZHb1VTWjVQNWdDbUZYdCtmelg4QWlIa0xmWWVp?=
 =?utf-8?B?VDBVclRncVo0KzVOSDhwbHNlOEgvNVlpaUVyWWQrZnRvYmdHM2JnejFET2dy?=
 =?utf-8?B?QWNsRTVwY1hMZHQzU0FkdDNscHJKMHBsTXAvMjV4cS9kVnk5b1hnQ1lqM2Q1?=
 =?utf-8?B?R0NmbVIwMEhTdmxPRTJCdituMFk2SFFzRzk2dVZRT0ZqWWRSRThoUFJSOEY0?=
 =?utf-8?B?NnViTFFaTHYraDdjVGxEcExVZDh5cHlscTA3OS94czFLNmhhV2QxSm5ZbnlT?=
 =?utf-8?B?L1NCdWJhYWZ4SkQwbU9xeFJaVVFmNWZUNWpoU2Z1YXFKSmd6UWxDblNWT2NW?=
 =?utf-8?B?N1Frb1JaOVJtd0lRSExoSFNmU1JWT3FQb3VqVjFtclVYaDZoRkxZNDBlUjVr?=
 =?utf-8?B?Vmx5aUVkeW1UcTJYUWZ1d1BzR3pyOGNDS2hjYkpDRy95ODZCcWNlemYrMWVv?=
 =?utf-8?B?UkkxWHo4Nk5hL3VXeTl2MURBcmZZNlN3UkRJa1BxellJUklnZWVhUWk3QmNE?=
 =?utf-8?B?N0R5cUc5MXpRL3o3UUlUTGpQQmdvd3NnMDBoL1lhb0FvbXEyQVJsYXBBVDcz?=
 =?utf-8?B?cGE5MVJmSmx3ZWZYR2NzUE5PK2lZY2FkWlVaZjAvOVpFVVNwbDJnRHBLOHZN?=
 =?utf-8?B?OW81VEo4TlpuWGJXTUppTkhkN3NXbkNlRWcycmdHYkZROHBFMDRxLytVa3NP?=
 =?utf-8?B?b0Y0YjJkNThBT3pjM1dpOUgwWCtXcUF1QitSOGlSc04vdnIvY0M4ODF2YXlJ?=
 =?utf-8?B?VzNGZGE3a1BhVDc2dTZWMUo2bnlQcEdtblVPSXE1VWtDTmJ1VEJxSE5nZkR3?=
 =?utf-8?B?M0NZc1NxTmlRRGcrNU1TVC9PVy8vQzVOQkFJZkV0cjNXR0NrNGxreXVqeXdr?=
 =?utf-8?B?VWEzZklIdFNmSHlnUmtPU2ZYaFAxUjRhV01iYXlWN2FxWDFnTVdCY25zellz?=
 =?utf-8?B?YjhUVWVtaFNMZ0NFK09WNFI4ZW5relI4QVBKZVR6dlQyVFA1Q3psVXMvOU5s?=
 =?utf-8?B?dThRN3E1ZmdqK3A1aDQybDkrRTVsTFB4dFg0eTQxR3F2VG53MFFqWk9FcWVR?=
 =?utf-8?B?WlpmYnNSL2Z1Y3FvaVNvT0lSZmp2NTc4QUxNRHRRY2ZXUWdGYy9pRGVuZ08v?=
 =?utf-8?B?MnIwUjNQNVQ1elRVMTBzd00zU2cvUGxDQVRTOHY2MG1jbFEzUnlBRXYrcERS?=
 =?utf-8?B?QkRLYUNDS2ZFQk80MVQ0YU1UZ1A0RHB0M3Z2M0ZlbEc3R3J2K0ZNSzE4ZVRJ?=
 =?utf-8?B?bGJDL2ZmQ3YyQ2JzMG9FK01IbkY2VjkwVGpxbVhlVXZiT29tYjRZU2hERFBh?=
 =?utf-8?B?dlM1dUdWUmVaZ1RhSkR4SForeTZ6d0hMa1IxTFQ4bEREemNYL1FoZEhhNDc2?=
 =?utf-8?B?blZvbG5BVW9CQ053V0xWb05Rc0FlSnVHSXJwVFE5YXVmQzZVKzhnMzlYSVlT?=
 =?utf-8?B?VDMwQzg4eVEwQlFBRFFWNkpoMEF2K0g0THVZbUVRbEVQc1ZVajFmSkVUMVcw?=
 =?utf-8?B?b1gwL3NaR1F2Mk03bGdsRm44MjJTZTE3M1h6MWMvZUkwOVFGUkJLU1VRUGt6?=
 =?utf-8?B?OGVJa090ckdBWjB4ZWhUQmhBdzBkVnl6UDdWSVE1MVRHYmp6ekh1V0todFJr?=
 =?utf-8?B?RW02a1hDSWlQQ1VqYmdYUFhDRW15aG9qUmhSWWZzczNCa3o0UGsrNGJBN0M3?=
 =?utf-8?B?S1BzM1hMYWxCZjJ0bnN4TGx6MksyQ0FkUGd4YnYxaGRqOXNPVEw3N2IrcW5k?=
 =?utf-8?B?OGNhcGtmcFhpZ280ZWdrZm5CN2FNdW5WL0EvcS83cXptNnI1Y2JQcFU1VXRH?=
 =?utf-8?B?d0NHRTNwTlUzSGJQWWtka29XaG1oQ29STlJVNkFXdC9wN1VzTUV6c3Y2eUph?=
 =?utf-8?B?QStZaUI1eGF3ekw4YnA5SjdHMXNJbURRRzFYUHA2TGl3Y3AxY25JRkhGSktE?=
 =?utf-8?B?dHpLdlI5dU16UTlsS1dxeU9UbktqTjNVQ1BTVnRTeGFhOFJqc3p3ejlGZGE5?=
 =?utf-8?Q?cVD67nONJypsBobfMkxHRhGt18cTj7HstZNMV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 560b9c24-a585-4dad-85c5-08da48dcd49a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 23:24:12.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RAf7gMGMWEzPbaejtcsqKgIjGTz35S4vRHa7oyrSJ58ayCxy3QMU/OXu4Hnf1urSLKQrnOZaA0Fyk3sbr3CfgqzhtWzQIls6NY4KYUthcTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
X-Proofpoint-ORIG-GUID: _vAk6LSMVRplYRCs2pvz4orjS6ka0-mG
X-Proofpoint-GUID: RFfybMEiWhlMbW0mvMn2hJl5Ug-LeU0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_11,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=619 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070094
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 257Mumgl008767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 23:24:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166689

On 2022-06-07 12:18, Steve Sakoman wrote:
> On Tue, Jun 7, 2022 at 6:10 AM Ranjitsinh Rathod
> <ranjitsinhrathod1991@gmail.com> wrote:
>
>> Is there any reason to not take this?
> I'm puzzled by this question! A patch with this subject line hasn't
> been submitted to the list for dunfell.
I see the original patch, with a timestamp of 2022-06-02, 08:20 ET.
Do you need it to be resent?
>   Also, the referenced CVE
> doesn't show up on the CVE report for dunfell.
That's odd. Are you looking into that or is
the CVE report ignoring it since only version:
 =C2=A0=C2=A0 systemd 239 <=3D v < 243 are vulnerable and dunfell has 245=
.5:

http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/sys=
temd/systemd_244.5.bb?h=3Ddunfell

I'm woefully ignorant of the YP CVE report. Yet another thing to make=20
time for...

>
> Steve
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166678): https://lists.openembedded.org/g/openembed=
ded-core/message/166678
> Mute This Topic: https://lists.openembedded.org/mt/91497880/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


