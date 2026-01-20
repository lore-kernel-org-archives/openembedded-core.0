Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3617ACA5FC6
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12458.1768931655553091516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EKAlE8Zq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6EmTC3752498
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lp8X9dwHiozu4Bxx5qaVifLh/nASEsFAxTgUbPHJ4/c=; b=
	EKAlE8Zq2ie/hTPWqeeotOBuviwwjwJc6yOKAShfI4s+65HX/xa4oeBaf4H7Oho7
	lbSpx1Rf5+xhE4OMUHWhmW5Chvkw8eAAUZSq/GZVvKMgnFcD+l1kADbBCd9sOH6O
	CfxpmnHtyJW0INnw9FYk/Fsx23TxCR21RW2WPvKBPa7KV1UOHadBu1xxp+wkkmTf
	KXfaeaT9Sl2xNz4Os72PQQiFCW4rBaq26EkK0Sq4Ywo/NSW/O4AJIyVeiAdpwx+7
	AAqARmOilvs0VUlu3VBvAsAPLYsk1s9s/PmIoLWR6GQJJCKtRJIt2R/c0WGMfLRt
	pgyFNtpJbW20swjDifWJQw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu23j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2qcEE61mc6ArIaPrHbuBf3H0y9k2qOutSpVFyNgA0ENT0BBuxi2tp2oUhu2lCnP62jtjzVl+xSYgorhnjebXdqvsgfhCUAEziA/lzHF2TM/kDQeNoNfSAtfXygmzwa8rLBwG6Bzg+aA+kQBZSwTNfNvrbisFxSGCmJGE3/SMH2IvBW7VGUvMTDR96vhS8ZXsrc4NRO4Saa9nE4pkKlDNzVvkxYRE0wO8RfxJC+Kc12b3/blCTO0vcAFcLKDV+ATjnvLIJzWh1sVfwn4dvUBnnA/vhRD9eBgE18Z7h9Hr0GyFrScxN6yi5Zh2ex4viDyMlNdW3GhT/sPdBlUctgf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp8X9dwHiozu4Bxx5qaVifLh/nASEsFAxTgUbPHJ4/c=;
 b=Fw2X95XTk3uES+KgySGP2nUVLEn/4sFC5mWvadg3JdURf1ooaNFAVsKq7XThuNn12rO5ZPvdomDGnaLX0vz6hMvvp8AYoYswelHnhsEe8hLmt4OBjiT7BblMcNvRH5FAazSMOEiwR8M07lbwjj0DnqvDOyCooOv11UEfy0YnFe3wa5C4lPMxo3fl6fczgh/QWlTyCYhoFQr+1bSYV7t7dbkFsrBA6uB1kHBOu+dntOQcyYHK9W5c7cMh9Zw29UwVuYkS6juK8fTMsIkQqMuZ1nOHFRLGishlJWh9EBbmjOOlLbL/Nvf/4k4h2nSDLILUWJ1wk70JdG6XgUSHeVgIxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 02/16] rust: Install the Rust source
Date: Tue, 20 Jan 2026 09:52:32 -0800
Message-ID: <20260120175246.2052341-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: f81e1b36-ff28-44f9-6914-08de584ceafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ky71CfDzAv27Ll2VKpGCWGMi4GC78TWJdEc6bxPCyLxRfEc1pUtJOjgN6mqv?=
 =?us-ascii?Q?vsoTjwK7MWTIMSYM2QrOhXr41DdRw5MFF+SG0iKr4CJrhPzw1rf8GPOhY5ph?=
 =?us-ascii?Q?3GR9mNr104yq3XXfDQs5LDqzhlGYeGVg6ZITddKXntiLOadO/DRxZQqpX/2N?=
 =?us-ascii?Q?+v4D7sYGIed7fCadZiN/bcGm0W1f/nvVsCVuGDF2jqjmZbD2Qhjk7Ey7OA0C?=
 =?us-ascii?Q?YVhrtyPqFOC0EkdQjSH/vFDoZCV61HT7NzC57bA43dlWqK3gX7sbgFB3VQEM?=
 =?us-ascii?Q?GqfoT4FiLUp/SFEGOwLlmM8wcEbg19WdtxxGbzeAKUeScZzFZbH/aMoFsuuF?=
 =?us-ascii?Q?QgTfQqTTY4io86HCsmxywCfgVMdbVFQbPStjbHTx3sIA9ZlfXmuHpldNoQlw?=
 =?us-ascii?Q?vmEox+JO81hhQr4n3fnRzrHdd0YIBAuLfVSH0stTlwo/b6OBXQk9mhg/SQq/?=
 =?us-ascii?Q?hlAFhN2t+3H7nXlBVeFjvZvt7imB+mhG4MMkpzRtwklLT08xxSpfOujhDZpk?=
 =?us-ascii?Q?76Ng1KANunrv3GtEFVqvXnrlrXIjMOvpTHZeV9wKPZ9D8QefGHa4IChUWoj/?=
 =?us-ascii?Q?0SvMobMEjoIh+bWbT5worD1dtmJ9IzlaUEgfH5n0XqZ9/k/8PvkkzKbEJABu?=
 =?us-ascii?Q?Vy0uQgTideKojZ4krXK0SaX76iV2me8trz/SupcQndl4o4mJLk3PUOhbdPj0?=
 =?us-ascii?Q?KqMcVnFMlVcSPN8ivS/M9QpjW0qbSqXUVYzdmsioXqJ5ejhPp5EHZD2uSYbm?=
 =?us-ascii?Q?rfteECN63fX/tQneEZjDJsMGMwPu9M7i72WViuggwf25noyzvYWioisyaCkC?=
 =?us-ascii?Q?+x5DDKne0r7GMw74aJgEPhg+LysJmx7DHCWWpVKSuzkoK7zESDRDxwLXB1fi?=
 =?us-ascii?Q?iSmFAZ/Arhht4etX/d6eu/aFwXgkIek16BBFfsZNW2yFfoK2XikzXaPbFkfv?=
 =?us-ascii?Q?eoWh5fjkQ13C0HtgznXp3pxWFoN50SAm3ZnH+R9h1hAq3swnCvezSQssR2Ss?=
 =?us-ascii?Q?PHHDDlferifARctOvuo2ojmVyIF4+u4Lx3Q+LJsYtmMqHAxD+ox48nux0rPe?=
 =?us-ascii?Q?kAlHvIp3oMCA7K6FLWzy2R24I3XWjNB1oDs8Y0Hm5anp89/KSKo5QD8qUi8m?=
 =?us-ascii?Q?/6BSRpdKqDQ0G9EyYkjr/oF/Li0RhCFGuqZNh3JyGKJR/GxnPIWK3TttR4U/?=
 =?us-ascii?Q?SKuXb3XIA0sWK4sJ5l2QpoVlfNJvfQF8sACuvntNJFTFiJsLYysLEOeNh+MI?=
 =?us-ascii?Q?QhK2C6hRJTeBKTT3tEhShCIYQgcn/zxPmsRfktZ9lTlPgKKnDwx3QLS8mPAq?=
 =?us-ascii?Q?nUUf1Qmtcc9AJ4oYZ9dETXXHxrmSS+d1Nybhs3fcGRqWLGs6xx4nTJ4487hI?=
 =?us-ascii?Q?kjWPEwVjICmM0Xz05hXzbFNWAzTnx/3kjuzYL6nxKz7DkzsscOaOE2FjECNW?=
 =?us-ascii?Q?J2+toipyPcRnHK1Np6QqbBK4D59z5oUAaDktjTH0oUqXMj0Lu2u81kGwnAoo?=
 =?us-ascii?Q?fgRebyB6iiMfR5vuFrRN++644zbrxlx5XCMi88JRDmUHM4+XFOMSN74CNeHK?=
 =?us-ascii?Q?juBfDtr+iA14qOijgo8NKpxBiDE6eEfUDliv+tvOBxWzKQDVbnCf9W3G/GSZ?=
 =?us-ascii?Q?A6c4IuC5/KbWeCdTtstEAf0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ur+KXRuThynyjT2ldxZcb5rY2xXOcGMqBK1B/0GMTGpheuORWL6oSzxlcCWb?=
 =?us-ascii?Q?nNckvcInuCs1i/q3WP3EzfoadRQJ+Ex1SVuhw2N8KdoPB4voQF1JsmuZy9qC?=
 =?us-ascii?Q?Dt8qBuloMBtkZZWY/lYDvXfdZfmUM/y1XsW/kS55PekLE5uy0t2XNgF0rMB4?=
 =?us-ascii?Q?+d4GvnLw0O0katZY1kC/CuHib35JKGg/YJUjoj5HfvYDZJscflfCG062LNlC?=
 =?us-ascii?Q?0Jxm6VJqotE5LCEYaUaE5zOzX2ieFwrbp4yNfBdt44pgrCUpxzrH3euk7Uyw?=
 =?us-ascii?Q?OFRATssU+T4bFDKHmn6z1cSfLaFu60H/2L1geYfrq7Z98w11mMNG87R7BffS?=
 =?us-ascii?Q?ZUrmeiGI9ad3+X8kzFlvtfYRdiK3ks6gYsyPHGGUYxYIKxJXdw/nJG1dKtpO?=
 =?us-ascii?Q?t4cQYTop9ZCJlSBWzXU906J+BgGXjrr5/lk4WWXL11naqwkikyT/rusT67fd?=
 =?us-ascii?Q?KqpSMnHvq+KNXJ4q+PIbqew6knOUlEJ+2wVbVVztH7EyLpnTjZc7LIA0iEjd?=
 =?us-ascii?Q?S84NsMMNwCxh5nzrc83HvBKl/lRONwh82tHlrW/IPfwGU6WyBnOmewvdWuQP?=
 =?us-ascii?Q?LoKSvK+I29SC6dL7TQhDaa2eU+O+F/9kBlVvH4hwe0kbeR2ZcreGMfs1p94Z?=
 =?us-ascii?Q?I1MtNFBypb0EQo1EL6Gx7B1Xb5cWio8rDyOSgSYKpPzcQisVR8BQ98p5l0ik?=
 =?us-ascii?Q?5vc7QtA3t6m2XuKzmzTAuOKhU4FWlNQS0kcTr2bDWps2P2x0DQ/JmJYTHk9z?=
 =?us-ascii?Q?VrBsEp61iZxuyqQN32VRgEEsuz/Cz2QgQ5WHHTiLdQRJZNhYJEm2D9x1rw7x?=
 =?us-ascii?Q?KbPTSCK2fNAY74SfCn8VPmSCg98trbv0Usf23SNHQvl8vCHXy9cqUytMeY52?=
 =?us-ascii?Q?pmyB8gtpma02R/zRN4UqSp8ao2pHYbVzt9ujNH2aBTxtyEOQtDlmdEpSMxNE?=
 =?us-ascii?Q?sfeWbeHDule/XC+Z3Uuus2tl5gxNisHUZqqFM+0vZoAQfi58urjIWeDS4gv/?=
 =?us-ascii?Q?R5ypCVJ3u8cXJVe5J66urch2pSvLSJLk7I5sA37Oehl1uLAfdpMRZ9z6+d8V?=
 =?us-ascii?Q?mW7zewvUZtnOey1D/5mXCDzd9EWGr5aW4ILv+a7GdOHf3ELMqCyI1yefiDNs?=
 =?us-ascii?Q?7FSMYiD/bdO0p/kKPsmWi3nQmzJGTTeXI+aOtn5exV9mim9vq85YKhohegaN?=
 =?us-ascii?Q?aVlRCngnY4snZVlHZq9Mi6FbCeXJbjn3Z44CX8dCi4+zmsb05Bb0g+bSRC6A?=
 =?us-ascii?Q?bGMFUyyzmWlD9s9n225SOnC73DazxBBMaFayG/8lg9iD/sPm6UfomvQj/A+C?=
 =?us-ascii?Q?NJxfWNzMoo7huH8g3ATbeAdZHrw+AY0VdrYzovgAtAsOWxQ5GKit+g2SCHRc?=
 =?us-ascii?Q?24/o9yNorX53Zdxed2lEmA+RyZ1EOJTaSwMrUxlhTpkpXJ+cuRW6O1J+vN9Z?=
 =?us-ascii?Q?GryY+kyWvr7iv+iPprya1G06UmIRKTa1xSMoK0ywLtWa3ZvXAt58iO8/RYNp?=
 =?us-ascii?Q?unPX/Gv/Dt41v+cDw3NtMncn5QXAvgtNlhl1jEKGEMu/ZyPwK32Zhb0diyGX?=
 =?us-ascii?Q?PJ1OgKgsx19voG+OJDFb1ETTbtQXyCpPM9do1f8PPxNooR87TFLrx4Zr9F62?=
 =?us-ascii?Q?yMgGxA8SH6FFFtFd8xZ89s3b4bG0pc6C4EVM7schTPJ44RXB5fYSzVw5PfU6?=
 =?us-ascii?Q?c7pFDolXTYEAwRVa/z7kCgVnz4O6E6N/zuNq+s5UFy+firKi/LoCFZzfLINY?=
 =?us-ascii?Q?NMzmYM4kstOLOmMJWHTpDVN4mHMKJBw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81e1b36-ff28-44f9-6914-08de584ceafd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:11.7930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjBsevx7Nu2cAet8v3R35wnIx6EHZjxX0kiD24o9RCeuD1+WJoMmUqWIY88wuMZ23h4urdRiVVOF6wiVmex1hkYn8NZVkuAYv31psJw8tqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Pth4TkT1terrhaMQ1pAXtLvISxROj4uC
X-Proofpoint-ORIG-GUID: xQeJnATlkhCC26BSj7UoOsSsr0F6-CwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfX5kWWWQYkWUQ9
 HXT9kCisDajITkgpC/jIrPnuRl0mPrK+PECeNsyK+lq0EOLISQIochclEDv2tRiogjkW4ZrZxXJ
 26dVBOP5P1WFgGKlXX8dIwOhj4jbWr6umz0g5YvajB54Jxb1itLw4Svrx+Vc/NvAfhOpfUBtFvB
 4VnIVh7WUo+RhJjBi6T0CHhVPRCLqOikLxIXDV5YIedT5aejnyqN/JuYDEiU65VT2XUQcZEwtC5
 wP4eqM37M8MXX8PJlKMbFtYbEZYtNI6hVagPHxG5020zG/FjeQKKQFUDdgIa+3FJ6ksyEHM7XEP
 RHpqF3W6rVtDQRISUfT2LkPdLlTI5MMvlTMTAwIYCfhbL98wzGvFOpBJpOxTM6xaTzDs6EU5WA3
 +ThVqDEF100XFBcZOVdm53NWXXekOcI6rLBPGHSUSFK5l/A4PR+mQmnPPkWhhLWJKL39mjNhaUa
 LABdSv1iH42LHBrR1EQ==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc146 cx=c_pps
 a=F2A7jaVQFOduNxX/8CKReg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=JF9118EUAAAA:8 a=t7CeM3EgAAAA:8
 a=ryPSEeu4gNSlMp8fOSAA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=xVlTc564ipvMDusKsbsT:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229749

From: Alistair Francis <alistair.francis@wdc.com>

When building the Linux kernel with Rust support enabled the kernel
expects to find the Rust source as the kernel build system will cross
compile the core library.

This patch uses the Rust tooling to install the Rust source (of size ~50MB)
when we install the compiller as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 ...-host-documentation-is-built-before-.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.92.0.bb     |  2 +
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch

diff --git a/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch
new file mode 100644
index 0000000000..3638e6078a
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation-is-built-before-.patch
@@ -0,0 +1,60 @@
+From 2e89bf7969ac6d77b7c6a38265b1eabc8ec6df7a Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@...>
+Date: Fri, 9 Jan 2026 08:35:43 +1000
+Subject: [PATCH] bootstrap: Ensure host documentation is built before tarball
+ is created
+
+`run_default_doc_steps()` is called to ensure the documentation is built
+by `Docs::run()` and it should build the documentation if it isn't
+already built.
+
+When running the `install src` command I'm seeing failures as the
+`builder.doc_out(host)` directory does not exist. This is because
+`match_paths_to_steps_and_run()` doesn't actually build any
+documentation as the `paths.is_empty()` causes an early return. This
+results in install failures as the `*/doc` src directory doesn't exist.
+
+This patch passes the paths to `run_host_step_descriptions()` when building
+documentation to ensure it is correctly built.
+
+This fixes installing the Rust source code in OpenEmbedded.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/150845]
+Signed-off-by: Alistair Francis <alistair.francis@...>
+---
+ src/bootstrap/src/core/build_steps/dist.rs | 2 +-
+ src/bootstrap/src/core/builder/mod.rs      | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootstrap/src/core/build_steps/dist.rs b/src/bootstrap/src/core/build_steps/dist.rs
+index f47b0c0b007..2fbb068632e 100644
+--- a/src/bootstrap/src/core/build_steps/dist.rs
++++ b/src/bootstrap/src/core/build_steps/dist.rs
+@@ -83,7 +83,7 @@ fn run(self, builder: &Builder<'_>) -> Option<GeneratedTarball> {
+         // FIXME: explicitly enumerate the steps that should be executed here, and gather their
+         // documentation, rather than running all default steps and then read their output
+         // from a shared directory.
+-        builder.run_default_doc_steps();
++        builder.run_host_default_doc_steps();
+ 
+         let dest = "share/doc/rust/html";
+ 
+diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/src/core/builder/mod.rs
+index 4a04b97c549..16c1c324be0 100644
+--- a/src/bootstrap/src/core/builder/mod.rs
++++ b/src/bootstrap/src/core/builder/mod.rs
+@@ -1117,6 +1117,11 @@ pub fn execute_cli(&self) {
+         self.run_step_descriptions(&Builder::get_step_descriptions(self.kind), &self.paths);
+     }
+ 
++    /// Run all default documentation steps to build documentation.
++    pub fn run_host_default_doc_steps(&self) {
++        self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc), &self.paths);
++    }
++
+     /// Run all default documentation steps to build documentation.
+     pub fn run_default_doc_steps(&self) {
+         self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc), &[]);
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index d7d44510e4..2c1caed858 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
+	    file://0001-bootstrap-Ensure-host-documentation-is-built-before-.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "ebee170bfe4c4dfc59521a101de651e5534f4dae889756a5c97ca9ea40d0c307"
 
diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
index a25f65f674..af739df88a 100644
--- a/meta/recipes-devtools/rust/rust_1.92.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 
 inherit rust
 inherit cargo_common
+inherit pkgconfig
 
 DEPENDS += "llvm"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
@@ -282,6 +283,7 @@ do_install () {
 
 rust_do_install() {
     rust_runx install
+    rust_runx install src
 }
 
 rust_do_install:class-nativesdk() {
-- 
2.49.0


