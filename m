Return-Path: <jan.kircher@leica-microsystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C354C5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:52:23 +0000 (UTC)
Received: from mx0b-001d2f03.pphosted.com (mx0b-001d2f03.pphosted.com [148.163.140.40])
 by mx.groups.io with SMTP id smtpd.web11.11153.1672836736444843234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-microsystems.com header.s=s1pps20200728 header.b=UUtkFiNg;
 spf=pass (domain: leica-microsystems.com, ip: 148.163.140.40, mailfrom: prvs=536801cd08=jan.kircher@leica-microsystems.com)
Received: from pps.filterd (m0161804.ppops.net [127.0.0.1])
	by mx0b-001d2f03.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304CbBTe001793
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 12:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-microsystems.com; h=from : to
 : cc : subject : date : message-id : mime-version :
 content-transfer-encoding : content-type; s=s1pps20200728;
 bh=3+eyETR5UYrNqUaAaD0Ec0EUF/LDDzvX6nEng9Ckgx0=;
 b=UUtkFiNgo7GX79/mCWmX5rFA30iLp5AV1yXAM2oWNCuMGjLayT0SI8plEj/pjPkXUJP2
 0FUdrvIItVWfzYYdVJtPkKG9ohRgeX23zXD25UJ61rmv7VsVsVjFh2r1uRR4Hy7u/ixI
 Mzf0A4fVnXQZa/K7CdC92Mu5K58uCfZ9+jStTkp8VaetbESqjxtj+tkGrM2dG0J+qfQv
 gGfRE0wS540I0uAVfz0UzPG0W+rZelJEY8BrN433KchwXYIUZa5sX7+mdRWrB4wn0SWZ
 QNW9Ovr1oayT9L/WxnYSSBgrki+3+wrINBt6vPsP2oa9tMCIsrXzqYAI0UdGeHha15Qg Gg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0b-001d2f03.pphosted.com (PPS) with ESMTPS id 3mu9aym5gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:52:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbKhGTWXaPhheNRgedDItS+cKFdJPWKaC77NmXhFjedQjtMWT3EZQj5WqAsYfNk83xyvIkAHGSUsxMKPkzzbfZxzKWzDTCcIRNmmusj+uo9jV+HEC6U3TzDEja87e0djJ6eHk47QrAdfoQomy0BdrHopKHrCFqyc7mt1DFjSNqOKMlqtA0MbZK6kfF/kqpXYswnug7RXN+yy/l5FOpYuIehDeXAhM8YlVZ34t93G29YJgBCIrlqStAD0LahXTID7iySCrejo+JRr7jW7G/oLjMah5FS6KHrsRqUf/+4A4Z+7x0XI2HJVSfv/StCrFK9Mpj2apnsmr09aMhE+RJZsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+eyETR5UYrNqUaAaD0Ec0EUF/LDDzvX6nEng9Ckgx0=;
 b=V9HGfmRR6yxgNxHBKp36Z+tqG9oE3W+eHxvfzLrDFeuvoYDnTkXe3xUeShRxicycFMHDDStuBsA8cQDOzyAnM4wkkf0DQrz1mwEYiF6XwSdmbfGucaYrCOwPxl7WY2cazZyfWV9cfXnlQV8mrGqywqvkdxIZG+wzBgWKnD2mix2Y0I+dHsPxSQoT56lLwecGnuU6OrbOKCaVP52w7r2tmVowBnM7BaX5plgNgxRKNe1br9MYE0Ld/qTPUuVrtVAnEA7MKL3GYoY0JNVN2nesZmFhpO2+umpAg/xUxPSbdXMUWYxeWWu6NhoXsO2jlTMqdJByvjQoOdIMbhJPitVRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 64.90.113.24) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-microsystems.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=leica-microsystems.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:d4::28)
 by PH0P222MB0223.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 12:52:13 +0000
Received: from BN7NAM10FT076.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::9c) by BN8PR04CA0054.outlook.office365.com
 (2603:10b6:408:d4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Wed, 4 Jan 2023 12:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 64.90.113.24)
 smtp.mailfrom=leica-microsystems.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=leica-microsystems.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 leica-microsystems.com discourages use of 64.90.113.24 as permitted sender)
Received: from dhriadsvdzpa01.danahermail.com (64.90.113.24) by
 BN7NAM10FT076.mail.protection.outlook.com (10.13.157.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Wed, 4 Jan 2023 12:52:13 +0000
Received: from pps.filterd (dhriadsvdzpa01.danahermail.com [127.0.0.1])
	by dhriadsvdzpa01.danahermail.com (8.17.1.19/8.17.1.5) with ESMTP id 3049b7tI016788
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 12:22:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by dhriadsvdzpa01.danahermail.com (PPS) with ESMTPS id 3mvy4wun2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:22:38 +0000
Received: from dhriadsvdzpa01.danahermail.com (dhriadsvdzpa01.danahermail.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 304CMcT7028446
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jan 2023 12:22:38 GMT
Received: from dhriadsvpaob01.danaher.org ([172.28.3.211])
	by dhriadsvdzpa01.danahermail.com (PPS) with ESMTPS id 3mvy4wun2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 12:22:38 +0000
Received: from lmsman-rndws01.europe.leicams.com ([10.221.25.5])
	by dhriadsvpaob01.danaher.org (8.16.1.2/8.16.1.2) with ESMTP id 304CMaSt016266;
	Wed, 4 Jan 2023 12:22:37 GMT
From: Jan Kircher <jan.kircher@leica-microsystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Kircher <jan.kircher@leica-microsystems.com>
Subject: [PATCH] toolchain-scripts: compatibility with unbound variable protection
Date: Wed,  4 Jan 2023 13:21:11 +0100
Message-Id: <20230104122110.3469042-1-jan.kircher@leica-microsystems.com>
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
X-MS-TrafficTypeDiagnostic: BN7NAM10FT076:EE_|PH0P222MB0223:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ca23daf-c65b-44e9-6c28-08daee528029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zYExhTh5eN1BDQ21tVVoncVuanKXHuzMi/uDjHqKXDeTTwKiFutE5xUky7Ed6amrhn8FkxTSfFPyN7WcyLnfMVE2GvylH7b1ew0sUFPv2dU7cXLPg+NnDNvTJTncMeZmuKfVX9ewuoJpDG/bQHCvwRzGRzT4n52525uSlGQvVqdMN+ShUlLB2vAdaBmAXyKhNkFGDUVc+JSSj8kKYhk7tdgNcUg8ehZ8IJNJHr4Btr9tgGdRoFPI2xVks2gAKkt/QW6j0TI5KeNCnGD4AVX9UXxjsb4xohpq1G89Vllai0nVXah+p3q8ihD6Qa8ZmviGX1o6nFB8Ox+VbDn4SXQFSAMXd0VJ2Gvcw+T3hGkG2ftm80eMdVhi+5o5bJH/vdvo6LIUKYEfsYhWXSRr+udEq510KJ+eYp8KEnnaHrdxIed5TZzl7DqYcNO5SI6bp/FZjPBSdzgjhmmItvRtMkmbxp4/rP0V5eAfUzcUUPKRJUJqXwtRzecv1xxBWJBvoNiUEmClcj1veXJq+GYPQG92rry9oNhecMdNxLrvmWe3bTmc9zKmZydK5gKwiEwMrfzN4HCa0vs6pUAdQ1vyfKpRi51nw/2fqssZkWvhVyOehQnty8OA/eex/BQiJxNfgwRo73Tt+HImQ/66A68DHK/PBdxcCPSePnX7O/nxdApMS99i22LTser0VpkKA5Mib/BEmVKl1dJ3Ooo7ini8P2Zghz/Pz/fZa633tVal3mAXZL4=
X-Forefront-Antispam-Report: 
	CIP:64.90.113.24;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:dhriadsvdzpa01.danahermail.com;PTR:na-access.danahermail.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(209900001)(451199015)(40470700004)(46966006)(36840700001)(966005)(107886003)(6666004)(478600001)(26005)(186003)(66899015)(4326008)(2616005)(1076003)(86362001)(40480700001)(316002)(70206006)(8676002)(6916009)(41300700001)(82740400003)(47076005)(336012)(36860700001)(83380400001)(8936002)(44832011)(5660300002)(40460700003)(36756003)(82310400005)(356005)(2906002)(7636003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	eQmuukyTv8zRnImyyuCUaevnY94ficgXU3e8+gPxdurQopRErzxrFw7JNYcvabHdEANr/8wgR9CSlW3xUg2XPw0YIlsY4u4hNPvO8QCOPRC7WiSnmp6jH5zTxu6F8sD0lNIJ+0y1xjhXqnBvujGO2lYtoyGSOhFnQDKxIBAHtn7P2cxbfI3qcsqQ5ux2HjY47wUZl+JKzpI76KytljngKInDbS9FhBYkDJzkCNxUxMDmw9qxi+ir1AugnWvz7xv72Huv92phyRbb+foll6gMnCgFKOf1QA9BN+ZEBWeUn1QUSUoq0gTByEkLjjQOp92IO/0k17ncM45lqDTBhCftyvnxLuINmA14V6kj4nKV/n99dLnF6GsZdumJSWqMUv1Q3JbiW9saTTgLPGvIIo+xblCtl127EBCr067PhXPjEmjkU/86ca7kaOyL1U6sLUoeHu9aNzB1JHa80OP184D2nF5YNVjlKocXasGA9akCBCkQO+n27Kb+0OtQKEoI1yDTLLNTgC2Gyd9ROyPLEeijpiumnphcIUPUJGNhpSraNINEHz1j3q5eKhJEFH1UI2IAK29Zbb7WC3g+DHhfJ1AgKFIbwFyjFZzumk7wx0kj3Qr+5c/n5AGa8v11KDROUG/WNX7i3TTbwtuInm0N232xpkmeX5jVfI8/zrZX+xMLN2zmx5Qk04YOLOYQ/cjtuOrYyfKB8NLM4Q5cUUkDe1yQ5oLyRW/Zq1Cy7S+S2PJsDKaS40YZUkwHrwEtbldeGANsO7R7XlQ00W9oEW9iVzQQjF+IMIQ1pQcSBrwapgZIULvQ/6UFi3OU2NNeWmv8LRbZM0iNQhz86S6Uek0vdEx7jQ==
X-OriginatorOrg: leica-microsystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 12:52:13.1117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca23daf-c65b-44e9-6c28-08daee528029
X-MS-Exchange-CrossTenant-Id: 771c9c47-7f24-44dc-958e-34f8713a8394
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=771c9c47-7f24-44dc-958e-34f8713a8394;Ip=[64.90.113.24];Helo=[dhriadsvdzpa01.danahermail.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7NAM10FT076.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P222MB0223
X-Proofpoint-ORIG-GUID: ASOW-1u3qwDDSPmpIp_K92NXHG8LWjQ3
X-Proofpoint-GUID: ASOW-1u3qwDDSPmpIp_K92NXHG8LWjQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=664 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301040108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175477

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

