Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55854C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12516.1787621620225866077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kMfo0poG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P09qJL214504
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=62IHnpQNRbx2sB4LCjcUhQw3CCtY6UzT63yjHpoCrD4=; b=
	kMfo0poGBnbRZL3Up4nKJKVmuvGJ8phl1Qz8iO09O+m2QTdP5M3jgmRVGhtxZzzS
	gF/jjIp9LJN8pziAOeECrvAsHSz20jet6xC4dDJQxC7SdIq1ONxDaeh0pS8oHFvO
	Oh1YhePQFnRDeFlyg3NeWVj5ACXuJEWgOl8RCByHKJzgHfPhC5CZi5pQjt/vJaNd
	5lef3fKFHSIg1+E51GBQY0b04zld7iEoMr0EiDwqMauARtCQ+s6fZrPpHeWkirVQ
	t74a3wj567H0ZDOt7a01WtyWiiepgrhmfrbE8ph4mBgvHCNGEVleBCWtMxKseO20
	iy4AsqYhWBmvc67s9T/bVA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022103.outbound.protection.outlook.com [40.107.209.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkg11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ305/lWlDJsg9h5ypXYehZmZhudXl60UObzxk+Mv0JXLuaEuKxmcUy35Qdk7GJPYDg8ZiEYhTlnLVfW4xMRrORB3H/Kybt101m3XDh4c2CfXU1SkhJM+kDsoatnw/axuWeaduK6qFzz6hnVl+8N/o8vr3NkV3kb5CJyP0gnV4cRtFNMj9T8rRRC2I1w+lsA+mB7nBoCXtY1u4gsvFHIJJr8wWzEgp9LSd8uq2qxBz+M5WoqtIQzwkRN3Ir73K/HlXuCCO29NRVY8gKDHiCsV73/09x534t/7QVcCSYOTJ04Nkgh/wRoE6WhOpA/hNNNCgPquvX1Zi2sdvxEuSmsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62IHnpQNRbx2sB4LCjcUhQw3CCtY6UzT63yjHpoCrD4=;
 b=PU+eMGEjUS6VX1jKcMNHi3mLTz18I81viSbKeAuvH53c8o5ge1LyDUiWyNb3V3ZLkYirSfVpMljPDrFiwy3+sXuES9WuqZknSN6+remvg4qcJlJQalXNbdnCtGDi7Mi/W0vhEbeWHp9JVPl/xkj3rQMtItqoXFORvI6kAQoMeIhoET8VtLQnI8e7uIn0Km6iCaNaUYJ6qTc4C7y0PwZKFz/phrluMGRtpYV+mjhFcIaOnI9xMV41POiaSanf2uHeE4OBiAthXctxeooxGBnPx7gF59/fp4pz/3sCQP9r3oDsxjoV3iI8+un/vEhZtoefS363DJreyg1BVKAfRHWdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:37 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:37 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 13/14] package_rpm.bbclass: suppress RPM 6 fileattr dependency generators
Date: Mon, 24 Aug 2026 18:33:11 -0700
Message-ID: <20260825013312.2695028-14-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d0392a-bf60-4213-fad7-08df0248e2c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|23010399003|366016|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	H2kZd8aS+MAq2znzf1VGcHEUMRkBcm6pp/3qDdIR2E8jU1Bq1RTrGvznmDFB1SQtcyP7zdnmFchfhQ/eoGbW+PrugV8jL22kjgjzDibD0kFdnb+g52YpXc0E88az559T20FdOSN3da6EJUyV4KdJPc/IBfLv2AeYIkBlbdv9qQHsPvmA9Mpi3XAJJKR1Scs1Rev7IjE4RGLb2THkyjqprD21i/BcQU96YVkcRHnRGzAIrbZqYP4ml6HRq3pdY34nFg8MqHY5Sw3LR4Xpe22t9g/2zKqPIGbz1g8uPZJvOkEH8JvzF1mJYwCkAJmIvBKHInuYPrcv7Lp/tjBhhSNbIhgOfi3gZFlrAIkkGk9vaRUCRh8LRTuL0R3WeNe8NAYBz2G32Fa3fRV4EgTTi0QSwbFV1oVlQ9kwEzVCksZ5CNZiuuIu7DCIwHbqkzQexLvOsNQk9JiVFRa/Uc4TbbstGiHBsWykl7gPEO8kToyQ3aK1rMQ6RlOMcgt32r9SGg5rBG7lHQWo1hBI3bDlJIoRH1YaDzWAcdUzmx2yubtoKeQ7mkKKyRJL59sdk9YaaGzCYHQDfIjkz8RRPou1kwpA3sPX++4iB9U9Iiw5onlaGhs99M/MMwA6yk0tTy4QNgcfIVe95UjWYmNCGqWzLv8kMfDlAFQqOqUHUz/kuJkFhGOMFqvHKnxJHlNM2cIBK6HMfhXn4QS4q3rgqeXNns2/hxHjyYCKqe7dpJ7s+txof4Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(23010399003)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cmF/V+IHshSKLAb6uIGC2iBYsv0vLPSSoToawRHVOWhXXMTPm990uG4gbdcR?=
 =?us-ascii?Q?AQJfACjtyCPyUfXC01e239sCLbwu4H9aEykyGa0yDHeRjpDTtWB6EZ4fKDoC?=
 =?us-ascii?Q?DRytaVpBiWskILa1ZYE1ITqD6IUYzBldlIBHgHyibkOTuNEGmHDT7tSuU1iR?=
 =?us-ascii?Q?dCB9rXzteijrcyawc4pMTOag+NIjN8d7QKTD+t5+CfX3NS+5Som4lzgWxBZl?=
 =?us-ascii?Q?OdtgcuHMPMHyxDzMhLtPJZHuxQGTH+3DPUeguMXJvI0/4JWLtlSVL1WQNHka?=
 =?us-ascii?Q?bt54m0NChQt66VVBIIfWCYJgiisc6GVaHIv54LyjbZMLl1KwxyZ+TTQBD5pc?=
 =?us-ascii?Q?gnV4BGpBZ56AflE0KNCukkmIIKxpIZfiBNXXW/1VnqKwkZ5damTqOauS6100?=
 =?us-ascii?Q?wRiAdSZI/qa2ZcoKgniQkDmSGR2tv79WiDZa4BV9x6WjDsnfELEX4BgCpHlf?=
 =?us-ascii?Q?07iPI71V0P5pRqK/NQui69nMV5WhzdmMo8zbDRORX9WCHv+oBMELZ4TW3sut?=
 =?us-ascii?Q?G6PCvm3kA8M/HPQcRhsfckuvSf4PK80sOvkd6akwbkZiIsaVd7DiFtHyh+9r?=
 =?us-ascii?Q?PDo6DswVNVOcU3yPfZRAEcYf1pOBDj/AY0J5K/u14bpOq5rW7erZRTMoveUJ?=
 =?us-ascii?Q?JA8iWMBZ8Ol9aLzQNruI9j6djIweKejevQkxr/SZVYX7eh1/MmJr9CrLRbvH?=
 =?us-ascii?Q?/cctYkBW+iiWb115qpx/8lzq+3/IQC9yowj+UxhhAIUaiW3yhSVPhdVvPY61?=
 =?us-ascii?Q?FoixwJliGIv+AlFIJGT0WgO2Qb6MhP/TM1cpwXVxSJCNzsI3ME56kRCOkjrR?=
 =?us-ascii?Q?YPLINVchlKI+4/2NKgwMIzJ/0m2N26FMqLTe9gazo6nMz8rdf5ZLYqGV38Cg?=
 =?us-ascii?Q?J4DDzz3TrFfSqJzdkdaUExtkpligrEaWc1ELIyqFUBNjFCFyBkzdMn8cbxf0?=
 =?us-ascii?Q?YDLG9dVNewZQ/jjjF1AHo4iOPxSpZdEn6aCmd8vBmWU0BkXebibdpba3k4HO?=
 =?us-ascii?Q?xCdAEJqRF20+PfkmLTJz+MWcLg559LW7yWeQ0k4NDQJ5A9wbA5+V9brphNFe?=
 =?us-ascii?Q?TMpnVZl3vBzJMv7GWpomFBGlVuMVWebO6tKz3V3qzDcGpnCTMfiTyqlglQyg?=
 =?us-ascii?Q?GXHPmA+JTEqd1ovei52rgVlDYl5NS0xUlOPYSVdNnVOUwX3YSPMD7cONSbuU?=
 =?us-ascii?Q?tT2RFlJql+cpVTNJvmqfEm3UPeDAPBh/cSFD5VdIYyJIsIQPDDVpNr1e4mw0?=
 =?us-ascii?Q?eE6tyIH4TBuCMxYQBUuFSVIJOtZ08vqATjMgTnKAAxKY0BbVqbBx/IV9W1WU?=
 =?us-ascii?Q?dlGW/npEHkrCkudnJdSQNgB7OsqCyvdvVLXqbNgRz7BBq22HEjqQPj/MvAvT?=
 =?us-ascii?Q?ggTms898SpF1fMf6rmUwsxk0+Ipu6DMl8yl3L+nk4Bp3ZTf2t1sQOSwiDvkg?=
 =?us-ascii?Q?j5dBbsdg4HKxquFFjrN2XeN8n4RPK7KRq4knpXM4iq7rRaTUmqD2rn8yWEEK?=
 =?us-ascii?Q?8FWJsXahB0v9nr/7pwZfi/Yao/ZAotp/yGPl714qDkQ7yk8uADc55i5Ex0JI?=
 =?us-ascii?Q?5B29BE7TeLb+34TaD6x0SSuOBK+0drwh0skrKkbUuOBhg/Y0t7YKHb4d/DxO?=
 =?us-ascii?Q?abR8t2JChEaaNJT4V14sh4/dsujSSEDZRDu1ydPLP6HOY8jyWErqIBozYs5e?=
 =?us-ascii?Q?plXUz1DIaMsiQtyOrYUltTb9Az8ybphuUAHJ6gtBuZKXYTD6yRQhe+hwK2Bp?=
 =?us-ascii?Q?MWNq9jrvC3XywoNNLjS7R2RhzqR5YYk=3D?=
X-Exchange-RoutingPolicyChecked: 
	wfERO/g9/rEhxtw43MTamX8QmY3aWgThR8SL0ZV4Mg2wPFZji11aCsOxxsf5kcw+YfzocKfjXRt3CkAM5g0Epu3McmTH84nnlKfZ3kbi4KcIzOPxdXSWTV2lCIe6OGAZejj93x30T5xk8JEOR0SRgDxhgupCcGJzpIJdimEEOAbzWyM7nUJTe9+JyEm4LPDiemTqzDXGKqrhD7moVVdC4ACLxHw3vKP2Q5dOjQxhWNLW991l4mEfmLd7WvEkj9L0rA4GXjhPOCqEJBmzwlS6V5j9wsuZ8m2JYFlMhR9ppDzWTfj878gUM6gKvHZHsMk7ra8tiwDhqaWYP7SejhIRUA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d0392a-bf60-4213-fad7-08df0248e2c8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:37.6536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O91Z6hQ3dDvX4oxeS3YS39gJuzlK3HVwLVR6Z4Gf9gVh2j307t/2yc1zyAJDXI87ujR0chPZghMj0LQHKY+GmDVBQGg53dq+9p/2uQGS73A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 0chLOMneuByzYxGerN7dPejwNS85ia68
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX6DAymu+KJ2hF
 XFKaLoKe0efMFsia5z9GCWhj5N+Inxwf1WvUAW5toy7kH8JXuKbRXRAN6BXc2ckNAyvqbmbdalO
 VBHUj/NnxU/T9IXB8fWrIbCwBPJebZrEFb+fl21YRU5amZE5u6j1oKK0GxVCwHmFd5jXSYOyI7B
 /YxJvoOrVrT6bLorApI+4dIQLIA1dhRt4coJ62kpU/ULYtFYS4R0AWvTCWXFzi9xLl8VA1l5Sek
 UIGreYLJydJaAV4VWq4Pd8oDqU16Ud9H7W2ogO8lzfo4Uyz7N+UN7cbMpx1hIoi0NXwda12yJoC
 Frmuur/uo4CfePDMgjbiWaiBENIuw4L17XVOA0r/vD8iztZZ8jMD6IKRcgI+7jqujyG2wP7vBKn
 HxSP1HXqXjCs6G1d2cJdoKzjaQwsi3bLYYunwKgKaT/SU7Q0c5BCxXlgBZ5QwNQ69qxwEpQP96q
 oV9wKHbRa0/bf6DBmXA==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8cf0f3 cx=c_pps
 a=xj9m5St4rme5bLz9Jope3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=bFbyjWf9jMRZ4lLZV1MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JoKNrck4ICz3osxs8XNgLk6Ik49Juj2j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXzXE5Ol1eQptu
 K/a+P92ftZLQ42mA3ktSoPJajTjeN/MOg0yodRE1HcnatVzw4Li1XQvFBnYYraTW0hKw9leZE6O
 9ErLOFVnQ1awfwNUi7uICBmj+239dVz2lmPp5nVXBGj059z83qnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244184

RPM 6 replaced the monolithic __find_requires/__find_provides scripts
(RPM 4) with per-filetype fileattr dependency generators. Each file type
now has its own macro pair:

  __elf_requires / __elf_provides     (ELF binaries)
  __script_requires                   (shell scripts)
  __pkgconfig_provides                (pkg-config .pc files)
  __desktop_provides                  (freedesktop .desktop files)
  __debuginfo_provides                (debuginfo packages)
  __metainfo_provides                 (AppStream metainfo)
  __ocaml_requires / __ocaml_provides (OCaml modules)
  __rpm_lua_provides                  (Lua RPM macros)
  __rpm_macro_provides                (RPM macro files)
  __usergroup_provides                (user/group entries)

None of these are appropriate for cross-compiled embedded packages:
- ELF deps are target-arch specific and would resolve against wrong
  sysroot libraries
- pkg-config, OCaml, Lua and macro provides are host tooling concepts
  not applicable in an embedded rootfs
- OE already handles its own dependency tracking via perfiledeps scripts

Suppress all of them with %{nil} to restore the RPM 4 behaviour where
OE's perfiledeps scripts have full control over what gets generated.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 1e016971f5..71d5c5dee3 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -600,6 +600,18 @@ python do_package_rpm () {
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
     cmd = cmd + " --define '__pkgconfig_requires %{nil}'"
+    cmd = cmd + " --define '__elf_requires %{nil}'"
+    cmd = cmd + " --define '__elf_provides %{nil}'"
+    cmd = cmd + " --define '__script_requires %{nil}'"
+    cmd = cmd + " --define '__pkgconfig_provides %{nil}'"
+    cmd = cmd + " --define '__desktop_provides %{nil}'"
+    cmd = cmd + " --define '__debuginfo_provides %{nil}'"
+    cmd = cmd + " --define '__metainfo_provides %{nil}'"
+    cmd = cmd + " --define '__ocaml_requires %{nil}'"
+    cmd = cmd + " --define '__ocaml_provides %{nil}'"
+    cmd = cmd + " --define '__rpm_lua_provides %{nil}'"
+    cmd = cmd + " --define '__rpm_macro_provides %{nil}'"
+    cmd = cmd + " --define '__usergroup_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

