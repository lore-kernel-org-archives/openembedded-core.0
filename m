Return-Path: <jan.kircher@leica-microsystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC6AC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:26:43 +0000 (UTC)
Received: from mx0b-001d2f03.pphosted.com (mx0b-001d2f03.pphosted.com [148.163.140.40])
 by mx.groups.io with SMTP id smtpd.web10.10728.1672835195302906347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-microsystems.com header.s=s1pps20200728 header.b=Bfm92mb6;
 spf=pass (domain: leica-microsystems.com, ip: 148.163.140.40, mailfrom: prvs=536801cd08=jan.kircher@leica-microsystems.com)
Received: from pps.filterd (m0161805.ppops.net [127.0.0.1])
	by mx0b-001d2f03.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304CMIGw025148
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 12:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-microsystems.com; h=from : to
 : cc : subject : date : message-id : mime-version :
 content-transfer-encoding : content-type; s=s1pps20200728;
 bh=3+eyETR5UYrNqUaAaD0Ec0EUF/LDDzvX6nEng9Ckgx0=;
 b=Bfm92mb6wY65VsxLYm+iDxjqMWi7jq9yMefhz1bds0PHXNliJjqRsFVFY4ctfbPoy+il
 TyFwlbVu8ddKZW9KGVdw5uYt4CUMJJmaadJrqzw3YT7WUBJXkBPkNrjjWj57jcN+3EEu
 hwa6IVvwd6Vk14xPAs7wNiDGa0dcnDZ5xHy0AMHf4kuBKOySYelFyZGtDn74piHLLMm+
 nCGSRv/UGpS+ZMuady+W4JGctxjYWLsVNtZ07ynFw/4kLNbtRpzkGbHM7ojNmOj3leRo
 su8QYuUaz2NDdiKA1ifN6rflv02Nb2VZxlKhdg1KCXpup4i11l5stf5j/qZOfY40WREx YA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0b-001d2f03.pphosted.com (PPS) with ESMTPS id 3mtbm8w06v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:26:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxcwZtw1ed/LbNH+H3GqlMs8zrC+6bPafy6hhmQRnzMtNELzzEMtgNTarKYTo0VUMgpAfoctOF1guAOpP4W9gsupsUcM1ST7cdI2ZJOzu0XRFGj6JPY9YBGYcDJn6QvQIPM/JSMbRHv6gkL3F5EyN0QEmARhTKRXUzxmbX+RhK6uquNUwfWAspwlUFwHBI7c+P+cm4Dy0FJShaBB1mKUF95hVaD5hUREpZUUgoETcbryRapj3OSwReLxPFR2sdDNhlkPyWkmRLzyMfeVF6DwVYcOvDXIq/1V65CNrvFyqbEL7/91VSlNXLZnMeBvivdt6dtCYKx+/XaGLzZDgGSevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+eyETR5UYrNqUaAaD0Ec0EUF/LDDzvX6nEng9Ckgx0=;
 b=DohwUkGzKRdvTurl+yWbGkU9ZjwTalCE5Rin3timtAEnXlesU//qZJIqE0oLR3C9krcJEQImZAXF0mdQ06qHxDLfsdUvJUUGoBQcRJOS6EhYIEW6p6gCwUTaStRYJm9Vx3I3oqVhMgdrM/QSTZTonTVFo5lU/YPUKqbgGkZGxFSltadftKZZzZRSEG9IO4dUc8YfEUCgCP0WIhYEUGrQ5JH6cex2MRVKl0d0+JLALns20e/WNmJ84Rf8O2KMPpy77pVl2reaBElV6SnzEuTfSordQ4zz4G77nTpAAcB4El5wn2zCtkyUMduDVkmq/vHSmZFbcwnD+jfEeRn/F3ZsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 64.90.115.24) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-microsystems.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=leica-microsystems.com; dkim=none (message not
 signed); arc=none
Received: from MW4PR03CA0284.namprd03.prod.outlook.com (2603:10b6:303:b5::19)
 by SA1P222MB0247.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1fb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 12:26:32 +0000
Received: from MW2NAM10FT035.eop-nam10.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::b7) by MW4PR03CA0284.outlook.office365.com
 (2603:10b6:303:b5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Wed, 4 Jan 2023 12:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 64.90.115.24)
 smtp.mailfrom=leica-microsystems.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=leica-microsystems.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 leica-microsystems.com discourages use of 64.90.115.24 as permitted sender)
Received: from dhramssvdzpa01.danahermail.com (64.90.115.24) by
 MW2NAM10FT035.mail.protection.outlook.com (10.13.154.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17 via Frontend Transport; Wed, 4 Jan 2023 12:26:31 +0000
Received: from pps.filterd (dhramssvdzpa01.danahermail.com [127.0.0.1])
	by dhramssvdzpa01.danahermail.com (8.17.1.19/8.17.1.5) with ESMTP id 3049kIWM027386
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 12:26:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by dhramssvdzpa01.danahermail.com (PPS) with ESMTPS id 3mtcq7w8w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:26:30 +0000
Received: from dhramssvdzpa01.danahermail.com (dhramssvdzpa01.danahermail.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 304CQTL8032058
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 12:26:29 GMT
Received: from dhramssvpaob01.danaher.org ([172.28.19.211])
	by dhramssvdzpa01.danahermail.com (PPS) with ESMTPS id 3mtcq7w8w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 12:26:29 +0000
Received: from lmsman-rndws01.europe.leicams.com ([10.221.25.5])
	by dhramssvpaob01.danaher.org (8.16.1.2/8.16.1.2) with ESMTP id 304CQTrf022735;
	Wed, 4 Jan 2023 12:26:29 GMT
From: Jan Kircher <jan.kircher@leica-microsystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Kircher <jan.kircher@leica-microsystems.com>
Subject: [PATCH] toolchain-scripts: compatibility with unbound variable protection
Date: Wed,  4 Jan 2023 13:26:26 +0100
Message-Id: <20230104122626.3472721-1-jan.kircher@leica-microsystems.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.545,18.0.923
 definitions=2023-01-04_06:2023-01-04,2023-01-04 signatures=0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_06,2023-01-04_02,2022-06-22_01
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM10FT035:EE_|SA1P222MB0247:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 143d5fda-4b2b-42f0-2ae9-08daee4ee98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hLuYovhtgRu0SKPz386zsAq++twhJiIQ5Tq7qWd4jR8ntq+9QUgsi/Ri5YSjnZp0XGkqeHwLSHF9Rkj9ibZVMEm4TXobe+1zRsUSdDFBUXPZHAwkk+zb8PbVKY8d3A/Av3sJj1KjbfQ+EJc4JR5/Qm4OdaWeJBf/WV+TQdK1zrBRsbb6cksUZn0toSs6wsNySR82F1qU86JK+kCvZZ34rHXR6MYO8EvsIpqGTipFFy29kSexQmw/JLPzQmsP3Z/PNYN4KPUGb65Kv8HIKyVGMtfsCBdceJJ8obj4ud6W2Dws7d8/KIIVSBH0JiL5f1wMH7dhel7GzFAWvwaGuwGyeaRd+91AWCNGyJjhEkP9NnKphgnLYT7pnXam4CwcyR3sPEmUAViMllu+m/+KcBTVmQ4NATbIWMX5tiw2fQ7UPoxx9azpko4Eb697PKv9LsqtxwzH1VfgEQmx4emye52RT9Cloy8FZ00YaG/MKxytNVLpJ0u8LpLLgxh39OyEPgsXDfXQ4ujvUBcGnS7I+RdBNNDp+pJ2MLUwCWV6SKJdMGwWB5CVtbcsa3WJfB63Wwq66DyywroL/wZ4UyVGRM34YJvBqRkbIwifXMcJKqAeaAAxzNPY5Php6Z+62c75yMUUv6UKhxoUYtEW4isNK8rn246GVaiFQgbYZoP78UgEkzb4TC0FW9EdCcstM/NaV3mYy9fJXa1t/jSrNd5hA4ax5mBQVwIV5pL6VpMFMUp5hfo=
X-Forefront-Antispam-Report: 
	CIP:64.90.115.24;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:dhramssvdzpa01.danahermail.com;PTR:eu-access.danahermail.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(209900001)(451199015)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(8936002)(44832011)(4326008)(8676002)(66899015)(41300700001)(70206006)(6916009)(316002)(966005)(478600001)(186003)(82310400005)(26005)(107886003)(336012)(6666004)(40480700001)(83380400001)(47076005)(2616005)(82740400003)(7636003)(356005)(1076003)(86362001)(40460700003)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	96Ig/E6/Oapd4FT+6eUlxn/sV9l57AQ1Dmx7a/YqDIgH5IgSAuAcXpdP5ByOXSQYSe6/gWojcQZDgWy1pCJSvg2/Gp16KGJXoqKVAJ+LrOo37eIEHz7mmx690rtoTEyOkThloQlty8zThAPAv6GFntprW+FLvpnOXUuaZfttwL4NVl+xTCTkUmJcCiJy1zS1ImNJ41wu0OEJ+ZoIlRoRzFARRGWNT46jDarCG8TMGR/sUjqsmzcYnWBPADXsmyTjmD/8F9mBqiY63hU+qj8mtzEJk7t7Kf40lU79vQJLhaqb2Xf43lIIy2J2SpdRLGN36mg/uuYPJhBRIfEV/i6wrVrCycDvAro+epgwQ6amn1uVgssQioqhj/1Z9CJ7zZ/fTIvEouz7ZlXNtK95zvTquio4glIfoWCgCa0asWAR9wGnQdtsy6hsv6garrtlH620EqjT6HOHEIWIpKGf1q1nmHRKr1/BtEm+zhXMx24qfXppLdOmdk5qv3ztFnVcISDQ2ZVvBgU0CjBcowwSpXucRjdjZ7vUn7uY40loq1vUAidR0faZZws4SFPgrPxwkCFZbgop+k4pEmJ+k4xQJmjghgIUjrdOM2deoHiKVjCKz0vZtqOtCuXLPhCEBT/5nySUJq+dd9851LaBi/p6kjykI+Ebanjj3ifFMepB7/5zAop0heET3/AVtlpwre6CMWydYZ+IXdDIXH047OUwGyBNYIT5K7F447x7DYDWDpUGniQxj0a3eQpeUsubEr1RpbKgN/uWOBB+J5TQLVAL5a3pNf8Cjo8iln1hr+I+HUqT/MODmyPj/JFh91LLDiaUahZKsP3g33H7v5z25jcELULsrg==
X-OriginatorOrg: leica-microsystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 12:26:31.6449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143d5fda-4b2b-42f0-2ae9-08daee4ee98b
X-MS-Exchange-CrossTenant-Id: 771c9c47-7f24-44dc-958e-34f8713a8394
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=771c9c47-7f24-44dc-958e-34f8713a8394;Ip=[64.90.115.24];Helo=[dhramssvdzpa01.danahermail.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2NAM10FT035.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1P222MB0247
X-Proofpoint-GUID: v8go6qibK9a2UnzpLaZqE8-kb09JsfF_
X-Proofpoint-ORIG-GUID: v8go6qibK9a2UnzpLaZqE8-kb09JsfF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_06,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 mlxlogscore=664 clxscore=1011 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301040105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175473

Fixed an error when Bash's unbound variable protection is enabled (set -u) =
and variable LD_LIBRARY_PATH does not exist.

Signed-off-by: Jan Kircher <jan.kircher@leica-microsystems.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index 3cc823fe63..fa658a6596 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -37,7 +37,7 @@ toolchain_create_sdk_env_script () {
        echo '# http://tldp.org/HOWTO/Program-Library-HOWTO/shared-librarie=
s.html#AEN80' >> $script
        echo '# http://xahlee.info/UnixResource_dir/_/ldpath.html' >> $scri=
pt
        echo '# Only disable this check if you are absolutely know what you=
 are doing!' >> $script
-       echo 'if [ ! -z "$LD_LIBRARY_PATH" ]; then' >> $script
+       echo 'if [ ! -z "${LD_LIBRARY_PATH:-}" ]; then' >> $script
        echo "    echo \"Your environment is misconfigured, you probably ne=
ed to 'unset LD_LIBRARY_PATH'\"" >> $script
        echo "    echo \"but please check why this was set in the first pla=
ce and that it's safe to unset.\"" >> $script
        echo '    echo "The SDK will not operate correctly in most cases wh=
en LD_LIBRARY_PATH is set."' >> $script
--
2.38.1

Please be advised that this email may contain confidential information. If =
you are not the intended recipient, please notify us by email by replying t=
o the sender and delete this message. The sender disclaims that the content=
 of this email constitutes an offer to enter into, or the acceptance of, an=
y agreement; provided that the foregoing does not invalidate the binding ef=
fect of any digital or other electronic reproduction of a manual signature =
that is included in any attachment.

