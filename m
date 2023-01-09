Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC7DC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 07:02:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.65659.1673247750682457958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 23:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aCvXi02D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03738d4724=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3096t2Ok026138
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jan 2023 23:02:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=DRWA4NuWjparJhzp0hA9DQWwxDPdZ3TjBzQxqaRjuSw=;
 b=aCvXi02DDjYfatGWUevKZEIfonYhPFBoOxygMBOhI+qmW/q4LhR408S30j/1CjGix+g5
 ZtPGtdYOz3XhnQOfq58CmM+YjNAOsQPD4bhKTmefmH5suWSKTMwu3Fi9QUY6bL9cJPZk
 8UsdsQA20IGBAVNwq0IHCzkxI6YNcRmf8VBVamOLeUWY6oeQwpy5uTBikWDPmWuJl1ny
 OFToYyAS5yw09rkksxW8gGnUOg2//lt1EhwH6VX0pqRVUSfMnN+SUBmSz3AXetsGzfO2
 WvmbYa4dWc16hZ4gpUSG9JxGMv6g/jnCyAwO2bU/ltSiqYD4eQOgDD2v5n+uz7H6S/g2 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my4w8sf47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 23:02:30 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30972Ttq011570
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jan 2023 23:02:29 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3my4w8sf46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jan 2023 23:02:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHceZea8hVffCDcPqnsnjn/5MXNJO5JjFqBF6A8a8nE6/LcQNrmeJD/5QN3qdwrYnKovkZ7c+EebECGBnfipMSePCq9ToKDFnBUgLcSekLQ4yaSPXwzVbUtP9IuuiOZwrjTorGLQaWhT36UAs7ycBDAYNv9+7A64RCl0ScyQOFbMVK2mTBL8nQWG9BRN1G6j63b9vs70q/UaUq1Phq3i1FzlAjZvPYK2281gpkEHqSXNOR+3R+YZCeznMngbP1I+0QtXx+xf1BLVEx9sElYJmf2sE7AmAZgq/LPXMH6sILjpsUmkResetmPWPb/xtMdOvVMa6WOtGPPL4rP1BBWnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRWA4NuWjparJhzp0hA9DQWwxDPdZ3TjBzQxqaRjuSw=;
 b=hJDrbsXR0VQG+RGLiTaJZ3VqgGcAJqkciP/HeRb7GIlbfOMwdTVdedxMZRrUDgkLZY88FG0XUDT/z03wZxRj56heQuesZXIS7DjfuErKfLNYcusD1vD9fElm/8LBcbQKL/5ZGfOrNBZI8zYhYdeoeyU17SjtcQNBATO/ZOL+rvpILg/wBlsDolam0ittflrBpql0SDf/EtkJtUpuuDJ0MK9VES+H83kAaVN41+oMz1iZ9JAo1hegQYF0aYoSkjhQ17ZtfFtcRVu2JFOK+G6Kye29Ay0AYq+v1Ozv8NBFO1OLEESUPc/qKHaBLDwMe8RWyWZlEfi3vVEcyibVv54dIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 9 Jan
 2023 07:02:27 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::2932:217e:2751:2357]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::2932:217e:2751:2357%4]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 07:02:27 +0000
From: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
To: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>,
        OE-core
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Fw: Bug 14875 - reproducibility issue queries
Thread-Topic: Bug 14875 - reproducibility issue queries
Thread-Index: AQHZHz0hIBNvHmkf70a0+i+ni67lYa6VrhCogAADzHk=
Date: Mon, 9 Jan 2023 07:02:27 +0000
Message-ID: 
 <CH2PR11MB44707F27A41F7EC82078CDF689FE9@CH2PR11MB4470.namprd11.prod.outlook.com>
References: 
 <CH2PR11MB447005CD0919C22171E2EC4189F49@CH2PR11MB4470.namprd11.prod.outlook.com>
 <CH2PR11MB447038A3B16A1413A72859C489FE9@CH2PR11MB4470.namprd11.prod.outlook.com>
In-Reply-To: 
 <CH2PR11MB447038A3B16A1413A72859C489FE9@CH2PR11MB4470.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR11MB4470:EE_|DS0PR11MB8229:EE_
x-ms-office365-filtering-correlation-id: 93b23fbe-36d6-4db7-8721-08daf20f77c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HimE3j3FUeoq+kNZ4gjInHoGdtWK0SEw/3ZSKRUU9MuyB+m96QcDqPnx+hBGuvGMl6knpZpM2W3cnr5ZCMva3ztsZWiXII4rCQbLWJz5RmM1gqaD5EYC1uTN9gUBEygv8DWDowUEHgTeb7V7+wLBE98/7tZsxBBdNfAdSid4ksU0/LBxPouddTxv2uPBpQL7C0F+G5+MpevVc/9s87WkdOq6n5UO7NVSyhHkqoMQnTWERQPSwci3sHQTuZVJY0pXbF5ovybnZeVkrB91kSMU0qaRAl7TzOpOVov+J50GMEIIkZIgXOiQ5YWznjJHJBmUIAYyegjq7w4CevxaDXDiDFvP0LQmXvKD0YXPOsVQBPk4vjUauQS3fTar7rqXWehe3SiE8ZvqewfiTDM746Csp4WE+YcMVNgQzwTD21hE1wIiaqkaxGWUiGlf9m7uS28iHjt06PQ6rDyNn9a3RNCrAbD4ezgvAQ3iaeUuQkKRAVh7VdzxPmaNASy8mHcU3qdpdLcJz0B8SZ0riySwzfs+1DqW4r0JAgH1HgXAtVExM2FSIeJDCNnBon2q36XH8wRUY9zo0IX0seZ62gMeViChkTdfRYrpdc+O0EM+Wx7tg5wqE8oah0tjlhaOTCp3tXaHY/3tptZA2Rw13wtZyBrXOaAax9SVYiyptTWk7sWHIQWBwltnY148o8ECav+rKTxY/norFpVs8DD5nvA92yQzjw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(451199015)(2940100002)(38100700002)(26005)(186003)(53546011)(9686003)(38070700005)(86362001)(55016003)(99936003)(122000001)(19627405001)(107886003)(66556008)(8936002)(316002)(76116006)(41300700001)(64756008)(4326008)(91956017)(5660300002)(8676002)(66446008)(66476007)(66946007)(19627235002)(478600001)(7696005)(6506007)(52536014)(71200400001)(2906002)(33656002)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?R1qb12+pCY5Ux+oHtTS31p6N99VWTm1iBf7JpCE2qs4HjERA2IC6uSyOPq?=
 =?iso-8859-1?Q?/C34qtP2vY5kSFH+vaRkSU3XkZwldbXHucRbQJoM3dm3BJzAp6PQa3o8c8?=
 =?iso-8859-1?Q?bg+MCBMdfsTC/S3G5eJqi2kATm+u+qlhCUiGBHDXBWd0KoZTlXF2dBQ4x+?=
 =?iso-8859-1?Q?ebddD/8c9tMzcEvgx400YeoGgD/ftzLtd0mfURyYfZoIZ9MSWcGhReFNht?=
 =?iso-8859-1?Q?mIkEyQZs6GzAz/3t8GR++K4nlgHOwmEr2Z5+pE9KpDXOAA7r+9OWIoN7qO?=
 =?iso-8859-1?Q?u2fZi9j5DQIWvGtDd1S6h8nN9yy8xcuU2hvmHSgF6EapoUms2RKYor1qFt?=
 =?iso-8859-1?Q?p6HWIS1WTMqDgjZYrzPzjoEJHutKj2pf5rF4mJcoM0J2s8l+CN///6PLsd?=
 =?iso-8859-1?Q?Joy4NVw5GwZ5o6TOXo6f6edWaXjt+GA7RSiAs+5HouEaFu4fKKGI+WdH/G?=
 =?iso-8859-1?Q?6HORNvmOKCPccuAeUgMwkakfmlCIJw3vnsV6ACJOWsYbY88sfGgYiJDHMO?=
 =?iso-8859-1?Q?7edz58POoo5HVZA4fENY2151dKLXNd/zQRR2Lu/UkjrXAOH/rJcMZtqaMa?=
 =?iso-8859-1?Q?k/iQPoEn09JvrNlL4HnA6AfEOwKI9KP/0dLKfW6wRxtiz8rTlvR6RGF2YK?=
 =?iso-8859-1?Q?DsZFmbXyi3YMBWquq6/JsTeED/XXqMKTzDnY9NrHJNTuiMc5lMIk8lrm6S?=
 =?iso-8859-1?Q?w9LaZLS5+xJM+hvNm/aanKJvFEe/TXoqIr7OSMiK5tSKCzvexsqKbqgw3Q?=
 =?iso-8859-1?Q?UsjYKtdkkiFi0em7wTRSEHLcE0PO8InWfjdEo1eN66TAtrwC/qXf0zQnYd?=
 =?iso-8859-1?Q?R+bCYRJN8Viojxoa5iKxJfFbI024t8ix0j6tfVV/Duy86+X4o4tmKDciAL?=
 =?iso-8859-1?Q?snHXxpa50tgHYBJScBEHO/b5/M4XZbD0b/Ra5yELeHeOc4PWpB0MVHpfio?=
 =?iso-8859-1?Q?I47aslQTFxX2blg91FWkFwECvDLVRg4oKIdV1Y12RLqM6oHSwIsJ/sS5Es?=
 =?iso-8859-1?Q?QvFFsrzMl+SlCTU5nPC9chYyPJNLzclr7CBGiOaqSMJjBkIO2OGMtINOYO?=
 =?iso-8859-1?Q?0vltPNTUn1Uq4mR//2C43zXu4fw4bJfnuYruTIUmPtc5qvxGNz6zgkzzc/?=
 =?iso-8859-1?Q?+qZuIsgzdclmaUH4I0kvROoFGOgki+/PBXqozWIVY9RikRaWO67sdOLaUM?=
 =?iso-8859-1?Q?69tElQb3agpW90OcDvnjOHMLoGqdJ94b3kJEmURtjyjHivdswBCluDJqmD?=
 =?iso-8859-1?Q?ROEmNOhKlBlci4KETQE1ppIeSC+IZJsUKpYakWtI2GIZKB/wtOB0ot0PDO?=
 =?iso-8859-1?Q?7LM+9zc/R8c6F52dvkqVmq017pKxDt5CsGEyrX2/cG5tisFAtCwKpq8zid?=
 =?iso-8859-1?Q?fWCtmtC8QgTfSV6YCULqHN/F6yNyL39HdBHx1w0nYJ81Y54qH5KeDkwqPS?=
 =?iso-8859-1?Q?smDguy5cM1js+0HrZNrk/ePdxQiOH71/1Y0yENLgHXas8aQZpxH3irGO+A?=
 =?iso-8859-1?Q?/Maw/OunM2QVkp8K1YdmCLGY6JWKra83MwfXI8M0i+pPC+t+K1cgAvH3NK?=
 =?iso-8859-1?Q?S5ihrGYhUVIh/OxPznDdtqoWB/wstOAWxBYEJVy31EGAiRSycGGdVUDusd?=
 =?iso-8859-1?Q?GBRJo0eDWcFTXeI5MRwB2GDwrpM/26nPXpMbbaENgGu50k0Phc59TIeg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_004_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b23fbe-36d6-4db7-8721-08daf20f77c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 07:02:27.3702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RUagP/QwpLzW5lzZqs/TshBafhQrZcFngJ5Vrmyny65Imhdeagk8QNy9qoY0x5nCvyhFh+/zeeykIfSSF1JFY8BsrDk0A0/HfXNRCSM6w30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
X-Proofpoint-ORIG-GUID: 0CU02GOLjqVrIGgCHgTlBlOSdlX10DdN
X-Proofpoint-GUID: 2sLWw8FICroA7Ap-AbhuhuHdFgNQPDxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_02,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 07:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175668

--_004_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_
Content-Type: multipart/alternative;
	boundary="_000_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_"

--_000_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

I found a few below listed deviations in Yocto's (with rust recipe) build e=
nvironment w.r.t 'rust' (rust cloned from github) build environment. Do you=
 know why these deviations in Yocto's rust linker?


Thanks,
Sundeep K.
________________________________
From: Kokkonda, Sundeep
Sent: 03 January 2023 21:29
To: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Moodalappa, Shivaprasad <=
Shivaprasad.Moodalappa@windriver.com>
Subject: Bug 14875 - reproducibility issue queries

Hello Richard,

On the rust reproducibility issue, as we discussed I tried to compile the l=
ibs outside of Yocto to generate the lib.

  *   I took the compiler command of a crate from the 'bitbake -vv rust' lo=
g (refer attached file), but the compilation shows several errors...
     *   (Eg. missing ofenv variables RUSTC_STAGE, RUSTC_SYSROOT, RUSTC_SNA=
PSHOT, RUSTC_SNAPSHOT_LIBDIR, RUSTC_REAL, RUSTC_LIBDIR... I read all env va=
rs during Yocto rust execution but the env list doesn't show any of these v=
ars. Somehow, I exported these vars but the build shows other errors from *=
.rs source files).
     *   Is it the way you want me to do?

Since the --remap-path-prefix cmd is passed during compilation, I suspect t=
he issue is not with compiler and tried below alternate methods to find the=
 issue and have some queries... It'll be helpful if you've any inputs on be=
low points...

  *   Since the librustc_driver*.so binary differed in '.rustc' linker sect=
ion, I disassembled all generated objects (including the objects in .rlib l=
ibraries) to identify from which object the assembly difference is coming. =
But, in any of these disassembled files the '.rustc' section is not present=
. Could not find any linker script which groups some input sections to .rus=
tc output section. I suspect there is 'link.rs' file which is making this l=
inker section, going through the code...

  *
  *   I found a difference in linking of libs in Yocto project when compare=
d to normal rust environment. In rust, there is no linker flag '-C linker' =
is passed,  but Yocto uses below extra linker parameters. Maybe we are link=
ing objects differently than rust used linker?
-C linker=3D/home/skokkonda/yocto/poky/buildA/tmp/work/core2-64-poky-linux/=
rust/1.66.0-r0/wrapper/build-rust-ccld
-L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/core2-64-poky-linux/=
rust/1.66.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib
-L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/x86_64-linux/rust-ll=
vm-native/1.66.0-r0/recipe-sysroot-native/usr/lib
-L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/x86_64-linux/rust-ll=
vm-native/1.66.0-r0/recipe-sysroot-native/lib

  *   In rust, the librustc_driver*.so is generated during stage-0 and the =
same lib copied to stage-2 output. But, as per Yocto build log shows librus=
tc_driver*.so is re-generated at every build stage.


Thanks,
Sundeep K.

--_000_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"color: rgb(0, 0, 0); font-fami=
ly: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">Hello Alex,</s=
pan><br>
</div>
<div dir=3D"ltr">
<div class=3D"x_elementToProof"><span style=3D"font-family:Calibri,Arial,He=
lvetica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(=
255,255,255)"><br>
</span></div>
<div class=3D"x_elementToProof"><span style=3D"font-family:Calibri,Arial,He=
lvetica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(=
255,255,255)">I found a few below listed deviations in Yocto's (with rust r=
ecipe) build environment w.r.t 'rust'
 (rust cloned from github) build environment. Do you know why these deviati=
ons in Yocto's rust linker?</span></div>
<div class=3D"x_elementToProof"><span style=3D"font-family:Calibri,Arial,He=
lvetica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(=
255,255,255)"><br>
</span></div>
<div class=3D"x_elementToProof"><span style=3D"font-family:Calibri,Arial,He=
lvetica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(=
255,255,255)"><br>
</span></div>
<div class=3D"x_elementToProof"><span style=3D"font-family:Calibri,Arial,He=
lvetica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(=
255,255,255)">Thanks,</span></div>
<div class=3D"x_elementToProof"><span style=3D"font-family:Calibri,Arial,He=
lvetica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(=
255,255,255)">Sundeep K.</span></div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Kokkonda, Sundeep<b=
r>
<b>Sent:</b> 03 January 2023 21:29<br>
<b>To:</b> richard.purdie@linuxfoundation.org &lt;richard.purdie@linuxfound=
ation.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Moodalappa, =
Shivaprasad &lt;Shivaprasad.Moodalappa@windriver.com&gt;<br>
<b>Subject:</b> Bug 14875 - reproducibility issue queries</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,=
255,255)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgb(255,255,255)">Hello Richard,</sp=
an></div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,=
255,255)">
<br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,=
255,255)">
On the rust reproducibility issue, as we discussed I tried to compile the l=
ibs outside of Yocto to generate the lib.</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,=
255,255)">
<ul>
<li><span>I took the compiler command of a crate from the 'bitbake -vv rust=
' log (refer attached file), b<span style=3D"color:rgb(0,0,0); font-family:=
Calibri,Arial,Helvetica,sans-serif; font-size:12pt">ut the compilation show=
s several errors...</span></span></li><ul style=3D"list-style-type:circle">
<li>(Eg. missing ofenv variables RUSTC_STAGE,&nbsp;RUSTC_SYSROOT,&nbsp;RUST=
C_SNAPSHOT,&nbsp;RUSTC_SNAPSHOT_LIBDIR,&nbsp;RUSTC_REAL,&nbsp;RUSTC_LIBDIR.=
.. I read all env vars during Yocto rust execution but the env list doesn't=
 show any of these vars. Somehow, I exported these vars but
 the build shows other errors from *.rs source files).</li><li>Is it the wa=
y you want me to do?</li></ul>
</ul>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Calibri,Arial,Helvet=
ica,sans-serif; font-size:12pt; color:rgb(0,0,0); background-color:rgb(255,=
255,255)">
Since the <i>--remap-path-prefix</i> cmd is passed during compilation, I su=
spect the issue is not with compiler and tried below alternate methods to f=
ind the issue and have some queries... It'll be helpful if you've any input=
s on below points...</div>
<div class=3D"x_x_elementToProof x_x_ContentPasted0 x_x_ContentPasted1 x_x_=
ContentPasted2 x_x_ContentPasted3 x_x_ContentPasted4 x_x_ContentPasted5" st=
yle=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0); background-color:rgb(255,255,255)">
<div>
<ul>
<li>Since the <i>librustc_driver*.so</i> binary differed in '<i>.rustc</i>'=
 linker section, I disassembled all generated objects (including the object=
s in .rlib libraries) to identify from which object the assembly difference=
 is coming. But, in any of these
 disassembled files the '<i>.rustc</i>' section is not present. Could not f=
ind any linker script which groups some input sections to
<i>.rustc</i> output section. I suspect there is '<i>link.rs</i>' file whic=
h is making this linker section, going through the code...<br>
</li></ul>
</div>
<ul>
<li class=3D"x_x_ContentPasted6" style=3D"display:block"></li><li class=3D"=
x_x_ContentPasted6 x_x_ContentPasted7">I found a difference in linking of l=
ibs in Yocto project when compared to normal rust environment. In rust, the=
re is no linker flag '-C linker' is passed,&nbsp; but Yocto uses below extr=
a linker parameters. Maybe
 we are linking objects differently than rust used linker?
<div class=3D"x_x_ContentPasted6 x_x_ContentPasted7 x_x_ContentPasted9" sty=
le=3D""><i>-C linker=3D/home/skokkonda/yocto/poky/buildA/tmp/work/core2-64-=
poky-linux/rust/1.66.0-r0/wrapper/build-rust-ccld
<br>
</i></div>
<div class=3D"x_x_ContentPasted6 x_x_ContentPasted7 x_x_ContentPasted8" sty=
le=3D""><i>-L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/core2-64-=
poky-linux/rust/1.66.0-r0/recipe-sysroot-native/usr/lib/llvm-rust/lib
</i>
<div class=3D"x_x_FluidPluginCopy x_x_ContentPasted8"><i>-L native=3D/home/=
skokkonda/yocto/poky/buildA/tmp/work/x86_64-linux/rust-llvm-native/1.66.0-r=
0/recipe-sysroot-native/usr/lib
</i></div>
<div><i>-L native=3D/home/skokkonda/yocto/poky/buildA/tmp/work/x86_64-linux=
/rust-llvm-native/1.66.0-r0/recipe-sysroot-native/lib</i></div>
</div>
</li></ul>
<div>
<ul>
<li>In rust, the&nbsp;<i class=3D"x_x_FluidPluginCopy x_x_ContentPasted10" =
style=3D"background-color:rgb(255,255,255)">librustc_driver*.so
</i><span class=3D"x_x_FluidPluginCopy x_x_ContentPasted10" style=3D"backgr=
ound-color:rgb(255,255,255)">is generated during stage-0 and the same lib c=
opied to stage-2 output. But, as per Yocto build log shows&nbsp;<i class=3D=
"x_x_FluidPluginCopy x_x_ContentPasted10 x_x_ContentPasted11" style=3D"back=
ground-color:rgb(255,255,255)">librustc_driver*.so
</i><span class=3D"x_x_FluidPluginCopy x_x_ContentPasted10 x_x_ContentPaste=
d11" style=3D"background-color:rgb(255,255,255)">is re-generated at every b=
uild stage.</span></span></li></ul>
</div>
<div><span><br>
</span></div>
<div><span><br>
</span></div>
<div>Thanks,</div>
<div>Sundeep K.</div>
<div></div>
</div>
</div>
</div>
</body>
</html>

--_000_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_--

--_004_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_
Content-Type: text/plain; name="rustc_driver.txt"
Content-Description: rustc_driver.txt
Content-Disposition: attachment; filename="rustc_driver.txt"; size=7912;
	creation-date="Tue, 03 Jan 2023 11:34:15 GMT";
	modification-date="Mon, 09 Jan 2023 07:01:17 GMT"
Content-Transfer-Encoding: base64

L3Bva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuNjYuMC1yMC9y
dXN0Yy0xLjY2LjAtc3JjL2J1aWxkL2Jvb3RzdHJhcC9kZWJ1Zy9ydXN0YyAtLWNyYXRlLW5hbWUg
cnVzdGNfZHJpdmVyIC0tZWRpdGlvbj0yMDIxIGNvbXBpbGVyL3J1c3RjX2RyaXZlci9zcmMvbGli
LnJzIC0tZXJyb3ItZm9ybWF0PWpzb24gLS1qc29uPWRpYWdub3N0aWMtcmVuZGVyZWQtYW5zaSxh
cnRpZmFjdHMsZnV0dXJlLWluY29tcGF0IC0tY3JhdGUtdHlwZSBkeWxpYiAtLWVtaXQ9ZGVwLWlu
Zm8sbGluayAtQyBwcmVmZXItZHluYW1pYyAtQyBvcHQtbGV2ZWw9MyAtQyBlbWJlZC1iaXRjb2Rl
PW5vIC1DIGRlYnVnaW5mbz0wIC0tY2ZnICdmZWF0dXJlPSJsbHZtIicgLS1jZmcgJ2ZlYXR1cmU9
Im1heF9sZXZlbF9pbmZvIicgLVp1bnN0YWJsZS1vcHRpb25zIC0tY2hlY2stY2ZnICd2YWx1ZXMo
ZmVhdHVyZSwgImxsdm0iLCAibWF4X2xldmVsX2luZm8iLCAicnVzdGNfdXNlX3BhcmFsbGVsX2Nv
bXBpbGVyIiknIC0tY2hlY2stY2ZnICduYW1lcygpJyAtLWNoZWNrLWNmZyAndmFsdWVzKCknIC1D
IG1ldGFkYXRhPTU3ZTBlOGVkYzQzODQzZmYgLUMgZXh0cmEtZmlsZW5hbWU9LTU3ZTBlOGVkYzQz
ODQzZmYgLS1vdXQtZGlyIC9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgv
cnVzdC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93bi1saW51
eC1nbnUvc3RhZ2UwLXJ1c3RjL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9yZWxlYXNlL2RlcHMg
LS10YXJnZXQgeDg2XzY0LXVua25vd24tbGludXgtZ251IC1DIGxpbmtlcj0vcG9reS9idWlsZC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3dyYXBwZXIvYnVpbGQt
cnVzdC1jY2xkIC1MIGRlcGVuZGVuY3k9L3Bva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC9ydXN0LzEuNjYuMC1yMC9ydXN0Yy0xLjY2LjAtc3JjL2J1aWxkL3g4Nl82NC11bmtu
b3duLWxpbnV4LWdudS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGludXgtZ251L3JlbGVh
c2UvZGVwcyAtTCBkZXBlbmRlbmN5PS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgvcnVzdC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93
bi1saW51eC1nbnUvc3RhZ2UwLXJ1c3RjL3JlbGVhc2UvZGVwcyAtLWV4dGVybiBsaWJjPS9wb2t5
L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnVzdC8xLjY2LjAtcjAvcnVzdGMt
MS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvc3RhZ2UwLXJ1c3RjL3g4
Nl82NC11bmtub3duLWxpbnV4LWdudS9yZWxlYXNlL2RlcHMvbGlibGliYy02ZDc1NWMyZjg3NTQ0
NjYzLnJsaWIgLS1leHRlcm4gcnVzdGNfYXN0PS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgvcnVzdC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQt
dW5rbm93bi1saW51eC1nbnUvc3RhZ2UwLXJ1c3RjL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9y
ZWxlYXNlL2RlcHMvbGlicnVzdGNfYXN0LTI4NTk5ZjA1OTRmNmEwMzEucmxpYiAtLWV4dGVybiBy
dXN0Y19hc3RfcHJldHR5PS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgv
cnVzdC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93bi1saW51
eC1nbnUvc3RhZ2UwLXJ1c3RjL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9yZWxlYXNlL2RlcHMv
bGlicnVzdGNfYXN0X3ByZXR0eS0zZjBiMzcwM2RjMjRhMWEyLnJsaWIgLS1leHRlcm4gcnVzdGNf
Y29kZWdlbl9zc2E9L3Bva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0
LzEuNjYuMC1yMC9ydXN0Yy0xLjY2LjAtc3JjL2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4LWdu
dS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGludXgtZ251L3JlbGVhc2UvZGVwcy9saWJy
dXN0Y19jb2RlZ2VuX3NzYS0zYzZlYmQxYmU2ZjRkNmRmLnJsaWIgLS1leHRlcm4gcnVzdGNfZGF0
YV9zdHJ1Y3R1cmVzPS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnVz
dC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93bi1saW51eC1n
bnUvc3RhZ2UwLXJ1c3RjL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9yZWxlYXNlL2RlcHMvbGli
cnVzdGNfZGF0YV9zdHJ1Y3R1cmVzLWY3ZDZjNDMzMDg4Y2QwMjUucmxpYiAtLWV4dGVybiBydXN0
Y19lcnJvcl9jb2Rlcz0vcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J1
c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGludXgt
Z251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9kZXBzL2xp
YnJ1c3RjX2Vycm9yX2NvZGVzLTFiZmRhYThmMWE0ZDE5ODcucmxpYiAtLWV4dGVybiBydXN0Y19l
cnJvcnM9L3Bva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuNjYu
MC1yMC9ydXN0Yy0xLjY2LjAtc3JjL2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9zdGFn
ZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGludXgtZ251L3JlbGVhc2UvZGVwcy9saWJydXN0Y19l
cnJvcnMtOGMwNmExMTc3OWU4Yzc1YS5ybGliIC0tZXh0ZXJuIHJ1c3RjX2ZlYXR1cmU9L3Bva3kv
YnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuNjYuMC1yMC9ydXN0Yy0x
LjY2LjAtc3JjL2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9zdGFnZTAtcnVzdGMveDg2
XzY0LXVua25vd24tbGludXgtZ251L3JlbGVhc2UvZGVwcy9saWJydXN0Y19mZWF0dXJlLTJiMmU1
ZGE1YjgwNTg3ZDUucmxpYiAtLWV4dGVybiBydXN0Y19oaXI9L3Bva3kvYnVpbGQvdG1wL3dvcmsv
Y29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuNjYuMC1yMC9ydXN0Yy0xLjY2LjAtc3JjL2J1aWxk
L3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGlu
dXgtZ251L3JlbGVhc2UvZGVwcy9saWJydXN0Y19oaXItMjQwNWJhMjgxZjg3M2RjOC5ybGliIC0t
ZXh0ZXJuIHJ1c3RjX2hpcl9hbmFseXNpcz0vcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1w
b2t5LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQveDg2XzY0LXVu
a25vd24tbGludXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVs
ZWFzZS9kZXBzL2xpYnJ1c3RjX2hpcl9hbmFseXNpcy1hZDEwZTY2NDk5YjYxNmRmLnJsaWIgLS1l
eHRlcm4gcnVzdGNfaGlyX3ByZXR0eT0vcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5
LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQveDg2XzY0LXVua25v
d24tbGludXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFz
ZS9kZXBzL2xpYnJ1c3RjX2hpcl9wcmV0dHktYmNjNmVhNDc3ODJkZDkzMS5ybGliIC0tZXh0ZXJu
IHJ1c3RjX2ludGVyZmFjZT0vcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGlu
dXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9kZXBz
L2xpYnJ1c3RjX2ludGVyZmFjZS04ZGUxNmE3ZWI5ODQ4ZGExLnJsaWIgLS1leHRlcm4gcnVzdGNf
bGludD0vcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4w
LXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGludXgtZ251L3N0YWdl
MC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9kZXBzL2xpYnJ1c3RjX2xp
bnQtYmMxMGU4Y2U5MzZhMWJkZS5ybGliIC0tZXh0ZXJuIHJ1c3RjX2xvZz0vcG9reS9idWlsZC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYuMC1z
cmMvYnVpbGQveDg2XzY0LXVua25vd24tbGludXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5r
bm93bi1saW51eC1nbnUvcmVsZWFzZS9kZXBzL2xpYnJ1c3RjX2xvZy03MDE1MGNiZmQxNjgzZDk3
LnJsaWIgLS1leHRlcm4gcnVzdGNfbWFjcm9zPS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgvcnVzdC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQt
dW5rbm93bi1saW51eC1nbnUvc3RhZ2UwLXJ1c3RjL3JlbGVhc2UvZGVwcy9saWJydXN0Y19tYWNy
b3MtYTQ4NDdmYzljM2Q4OTVjNS5zbyAtLWV4dGVybiBydXN0Y19tZXRhZGF0YT0vcG9reS9idWls
ZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYu
MC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGludXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQt
dW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9kZXBzL2xpYnJ1c3RjX21ldGFkYXRhLTE2MDgwZjM3
ZDFmZmY4YmYucmxpYiAtLWV4dGVybiBydXN0Y19taWRkbGU9L3Bva3kvYnVpbGQvdG1wL3dvcmsv
Y29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuNjYuMC1yMC9ydXN0Yy0xLjY2LjAtc3JjL2J1aWxk
L3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGlu
dXgtZ251L3JlbGVhc2UvZGVwcy9saWJydXN0Y19taWRkbGUtODA2NTdlODg2NzU3YjMyNS5ybGli
IC0tZXh0ZXJuIHJ1c3RjX3BhcnNlPS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3kt
bGludXgvcnVzdC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93
bi1saW51eC1nbnUvc3RhZ2UwLXJ1c3RjL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9yZWxlYXNl
L2RlcHMvbGlicnVzdGNfcGFyc2UtNzkyYzUwMDdkZjFkZTAwMS5ybGliIC0tZXh0ZXJuIHJ1c3Rj
X3BsdWdpbl9pbXBsPS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnVz
dC8xLjY2LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93bi1saW51eC1n
bnUvc3RhZ2UwLXJ1c3RjL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9yZWxlYXNlL2RlcHMvbGli
cnVzdGNfcGx1Z2luX2ltcGwtODQyYTQ3YjFiYzRkM2VmNS5ybGliIC0tZXh0ZXJuIHJ1c3RjX3Nh
dmVfYW5hbHlzaXM9L3Bva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0
LzEuNjYuMC1yMC9ydXN0Yy0xLjY2LjAtc3JjL2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4LWdu
dS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25vd24tbGludXgtZ251L3JlbGVhc2UvZGVwcy9saWJy
dXN0Y19zYXZlX2FuYWx5c2lzLTgyM2UyMWI0ZTU5OTJmNzcucmxpYiAtLWV4dGVybiBydXN0Y19z
ZXNzaW9uPS9wb2t5L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnVzdC8xLjY2
LjAtcjAvcnVzdGMtMS42Ni4wLXNyYy9idWlsZC94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvc3Rh
Z2UwLXJ1c3RjL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9yZWxlYXNlL2RlcHMvbGlicnVzdGNf
c2Vzc2lvbi00MzQ2Y2Y5ZmY2MDAyMjUwLnJsaWIgLS1leHRlcm4gcnVzdGNfc3Bhbj0vcG9reS9i
dWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEu
NjYuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGludXgtZ251L3N0YWdlMC1ydXN0Yy94ODZf
NjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9kZXBzL2xpYnJ1c3RjX3NwYW4tMzY1NWI5MzY1
ZGI5YmQ1MC5ybGliIC0tZXh0ZXJuIHJ1c3RjX3RhcmdldD0vcG9reS9idWlsZC90bXAvd29yay9j
b3JlMi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQv
eDg2XzY0LXVua25vd24tbGludXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51
eC1nbnUvcmVsZWFzZS9kZXBzL2xpYnJ1c3RjX3RhcmdldC03YTUyOTVkMzM3NzRkOTY0LnJsaWIg
LS1leHRlcm4gc2VyZGVfanNvbj0vcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxp
bnV4L3J1c3QvMS42Ni4wLXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24t
bGludXgtZ251L3N0YWdlMC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9k
ZXBzL2xpYnNlcmRlX2pzb24tOTljZDgwM2JkMjQ4NWI0OS5ybGliIC0tZXh0ZXJuIHRyYWNpbmc9
L3Bva3kvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuNjYuMC1yMC9y
dXN0Yy0xLjY2LjAtc3JjL2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9zdGFnZTAtcnVz
dGMveDg2XzY0LXVua25vd24tbGludXgtZ251L3JlbGVhc2UvZGVwcy9saWJ0cmFjaW5nLTRhY2Mz
NWE3NmRhYWRlYzcucmxpYiAtLXJlbWFwLXBhdGgtcHJlZml4PS9wb2t5L2J1aWxkL3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgvcnVzdC8xLjY2LjAtcjA9L3Vzci9zcmMvZGVidWcvcnVzdC8x
LjY2LjAtcjAgLS1jZmc9Ym9vdHN0cmFwIC1Dc3ltYm9sLW1hbmdsaW5nLXZlcnNpb249djAgLVp1
bnN0YWJsZS1vcHRpb25zICctLWNoZWNrLWNmZz12YWx1ZXMoYm9vdHN0cmFwKScgJy0tY2hlY2st
Y2ZnPXZhbHVlcyhwYXJhbGxlbF9jb21waWxlciknICctLWNoZWNrLWNmZz12YWx1ZXMobm9fYnRy
ZWVtYXBfcmVtb3ZlX2VudHJ5KScgJy0tY2hlY2stY2ZnPXZhbHVlcyhjcm9zc2JlYW1fbG9vbSkn
ICctLWNoZWNrLWNmZz12YWx1ZXMoc3Bhbl9sb2NhdGlvbnMpJyAnLS1jaGVjay1jZmc9dmFsdWVz
KHJ1c3RpeF91c2VfbGliYyknIC1abWFjcm8tYmFja3RyYWNlIC1DbGluay1hcmdzPS1XbCwteixv
cmlnaW4gJy1DbGluay1hcmdzPS1XbCwtcnBhdGgsJE9SSUdJTi8uLi9saWInIC1Dc3BsaXQtZGVi
dWdpbmZvPW9mZiAtWnVuc3RhYmxlLW9wdGlvbnMgJy1XcnVzdGM6OmludGVybmFsJyAtQ3ByZWZl
ci1keW5hbWljIC1aIGJpbmFyeS1kZXAtZGVwaW5mbyAtTCBuYXRpdmU9L3Bva3kvYnVpbGQvdG1w
L3dvcmsvY29yZTItNjQtcG9reS1saW51eC9ydXN0LzEuNjYuMC1yMC9ydXN0Yy0xLjY2LjAtc3Jj
L2J1aWxkL3g4Nl82NC11bmtub3duLWxpbnV4LWdudS9zdGFnZTAtcnVzdGMveDg2XzY0LXVua25v
d24tbGludXgtZ251L3JlbGVhc2UvYnVpbGQvcHNtLWU5MGI0MTM4YTljOTg3NGUvb3V0IC1MIG5h
dGl2ZT0vcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4w
LXIwL3J1c3RjLTEuNjYuMC1zcmMvYnVpbGQveDg2XzY0LXVua25vd24tbGludXgtZ251L3N0YWdl
MC1ydXN0Yy94ODZfNjQtdW5rbm93bi1saW51eC1nbnUvcmVsZWFzZS9idWlsZC9ydXN0Y19sbHZt
LTUxYzdlN2JmNzQ3YzRlNzYvb3V0IC1MIG5hdGl2ZT0vcG9reS9idWlsZC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3J1c3QvMS42Ni4wLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
bGliL2xsdm0tcnVzdC9saWIgLUwgbmF0aXZlPS9wb2t5L2J1aWxkL3RtcC93b3JrL3g4Nl82NC1s
aW51eC9ydXN0LWxsdm0tbmF0aXZlLzEuNjYuMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNy
L2xpYiAtTCBuYXRpdmU9L3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3J1c3QtbGx2
bS1uYXRpdmUvMS42Ni4wLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWINCg==

--_004_CH2PR11MB44707F27A41F7EC82078CDF689FE9CH2PR11MB4470namp_--

