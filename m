Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BB9C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 10:11:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4218.1678875101490348168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 03:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Ry5+SKNK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=243843133b=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F8YX5s010186
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=ir0khC8D7bW0OAWoDc+mLNKIsO/TGHYuw0330AR2LeY=;
 b=Ry5+SKNKch9FFn353RMxzui6uEQoEdQJSTlRXYJN7vXxIvpeC5OzL39ad12r3ygzrqKH
 cCXPWHUrUJtYNA/1k//6V6sR/6Uzc/1W1rBonNTtXRUdTvTOrknID+vfsx1Us2pBmii5
 1o2hWCnKtKXt+C4VDeXIRx2VMkgreURBF5quSxSNOKzr+3lyoy1QVc/Uki3Idm6fYjxv
 9w8805a0LyCyRQhjyukjcoM1suPiXuoTA4ekulnU/WnhKEBItXNKKobuyTJbcgz7brLw
 NoD/F/514O9ylqvFvv1RaIE0myd+veUhhsRY33dkvwpZSw7Fe5SICfxD5YoFgum5C/BW tw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2as0dae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:11:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hnjkr2TOhia+NG2MDTU0T3h+G67CZwAGUv3fYwQiEAdGqmsJJGsz9OTMPasPrrwv+ui1pAwtoPCdtnKN+f5F4R7Mhr2KX3Pbw+Waeb0BfZFvrHtpf3NMD9/81m9rZkJLaFRdKfullW1jLlEOdTR2Y15MoMZMZ3rSdENDF7XjZcrkjU/IlpJ5l8wwr25k97SkmtMdD83HjyFX5AdtiIHtsPwtUbl4GajycfbtRS1dNkPpx7ZVcURD/P3otffIM231puHMHQeWukNj/2d+jzV6UgLZDtyj99S93FLBbIAOw3feUpiIFiH9OrNDu3p/+ku8tdpZMV5Ys2kFAeyh9NATgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir0khC8D7bW0OAWoDc+mLNKIsO/TGHYuw0330AR2LeY=;
 b=HX3m+5oCWOFbhq6fVkWz/ayVYHl9Ei+BL53BHpJsX9PM/Pfg/D1KNjYhOjsIPhgcumpQep08Y5j4ISSNPGGM0BxstNG+bydEC9YTqUd113ecOZc307fujWQQMGG20qycVcKSzf85QbRLfjRIooBAiXqI7D93yx8jnIXuNWHAw2+LMeJ4xjNlU2KLoc1zfazJuSbFndK/scrTT/ZnM/zYcRVsVvRE9JZzMCJAXHSmQsuSJpUYfYEHr7fbqxnocpDNTCf7gzIOfRcpMeeaoubdyfL1fdQcgN7VyXiIYUaatYgey56xJy8hH/owhKsVStAjDuDbME3fJME1yJJvBZ21Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 10:11:39 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%5]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 10:11:38 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] Revert "systemd-systemctl: Create machine-id with "uninitialized" text in it"
Date: Wed, 15 Mar 2023 18:11:04 +0800
Message-Id: <20230315101104.4460-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a44a69-b530-4f75-1f09-08db253daa12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NcsG2rIr7la+58/NgMUc7P1VmEs/rNZ7wXEv2MkGy3dbb7PoTL9zotujYgptp+xZuXa0qw3JTzn9GumFnChFduOtCdmRw4Hj1CcceoqBA0LA5vAemHf7CwodZpDWB/cTSxwshdFAowiN/vkfDmyvhRbVc4C7MpbeVQqECCwIDH2+8D27e7CxabW9wmz+dVvCzkC9oC0nnFk1gyDnU5MSnrIf+kGAXmWCk1vozLBJ+hjYFZsCPrz01B+HW4GRzWetTW9H4hTrhKQf3flDfdpb73qMG9M6zHUzsr7xUpJPDGozfwGcvO2M2ira9B0wINndx+1GmCS7g4y77msGhyRFayI6vZ3YPj84MoJgtFgzwfHX0tXTb5maOf1d4jeLRbuZJ1AZqviQkVHyl0z4grHcR6Iel6htUrY7/0zqVsl8ot3Y4BtuiO8OTlEUZ99ffI1u/Vsn1FailoRtSHvojBzg8c71w9g0lImdkoF9klmdKJyUFLHBC6y5QPaMLRyBs9qNhXd9ZBe3O0Zii73wh74ekX5kc3Vn7BajHEhJArYMkcUuLXj3YWBKu3Ro6eoqG6DdcW4BkX8ot3RSPVBk5Y0E5gaXFblFYEkKZeenpBmCx4qC7kb9wmwoxSTO5sZe28BomTRouAqTLcHoghqHnFIA/rCIalfBCoL+43bHHyGjMnZ0fO4W/ijA61cj8NeHheuR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(451199018)(38350700002)(66476007)(66946007)(66556008)(6916009)(38100700002)(41300700001)(8936002)(316002)(83380400001)(5660300002)(478600001)(8676002)(86362001)(6486002)(6666004)(6512007)(2616005)(186003)(36756003)(1076003)(6506007)(26005)(2906002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FEjCkm9xY+8cB5NP1PwwVYBn95BTst4UYTV/ce1NvRZZybQG9IvzxVmT8kbO?=
 =?us-ascii?Q?e91KL9ldB7WOQrVRb0QlOcaHtbb9vGiSDB8XY5OqqGQgVa4G+O98ZRefHfk9?=
 =?us-ascii?Q?j8oCYSdX/Ubm5Uv2/GOQ7GJ67JpnNHFhWsX7myif1JGSxioYxlsOyTQ1XiYq?=
 =?us-ascii?Q?gzPaog8d2gMUMLATOIXr64h7erDKybwvPeWPTjBVdgGsTjPYD3AMqHHahfy3?=
 =?us-ascii?Q?nT3+Td7DTqaeGsVgRf85gdHSUNBnLRnp/CdhcXoHW2J915xSi0qe549pwOh/?=
 =?us-ascii?Q?zpFkzMQ+h0ho65osiGXimkv73NL8vanNc5TctGEnHzQby3li/0X8tCS9ke2j?=
 =?us-ascii?Q?xGUe73YL3U4aUiakpDZVO1W1Qb8CLpT1jgxULPbXNsEKQ10nabqLYltGNs0Q?=
 =?us-ascii?Q?p5b3xzX8pWczH8pLIAmk0fvBwFGGA2jBgLI6QhQL7UwXnN13iJHLfA2qyh+r?=
 =?us-ascii?Q?JZbkzz3RqKSkSfASGcXssaJvxBv/rAc5KK6CUN29Y48yLutBnN2CxbPPh97p?=
 =?us-ascii?Q?IMEFKI3vU4aKtbGcqe7jPhcve0BkV2I7VuZ4fvvI0CeZLnxnWscgUt/tLWBQ?=
 =?us-ascii?Q?3mWitbpRIYqrlR9lrwvsOrvYZtLWyb971eHGjEniqfTDflC9h7VfyawnAj1R?=
 =?us-ascii?Q?9fiJLwuQW2GyOdJYWoW+/jE74qM/UBbTHgd+EllIR/gM91lOdb4uJYA9xZkX?=
 =?us-ascii?Q?2O4YLMOKpWCxcf7yf9uBX+IkbOTCnvSfKdRwBkaEKpD8uGRqj6nqFNsUbfmF?=
 =?us-ascii?Q?g7mHZpHCXntEdSLbC2RmNpLDhLsQmZ+NvK8KhyDNDkvl7MRpvgSO0zh787mL?=
 =?us-ascii?Q?jj6egumgX7XbyCQv/XcuWDAVTCn8vFxgcf+U/b/nf7pdVOrfYMiyflovVwF/?=
 =?us-ascii?Q?ROcqsh9VFsM7QOYlx8qM9IdlFgMpO7cCGl+HOvJuPtkts4hoQ0g/iY6SbfO1?=
 =?us-ascii?Q?GK17oX1TkP0n/Fyo31wvAdGVQceNiQ9Z8QopsZtJQyooI2WdqfhVdp8Shgfz?=
 =?us-ascii?Q?rBe6zhA9PUVig3VLgSsei0MrSgTaPBFnyJw9sVlzO0qI5F5+3fswfoDzMUIo?=
 =?us-ascii?Q?H7/IVxvQx8t8GAtOIH6Kpy/ERPrlRAbqKYqWvTf6linV/5DR9sur9CeTaHPP?=
 =?us-ascii?Q?mKvZrOEmuIPQ6GplBaHereuNzkO1hvOqtrzVyBCCz5+Z0M5EsDi/1uHY8Tqs?=
 =?us-ascii?Q?a3r2BDeGFMLE615QEbUZw4yP5CWaN1AzwuQgW+k2iQ2RgCgQaR7vfQFgaRky?=
 =?us-ascii?Q?pN/tHxiU2xYRhwpA/ZJuDU67LQQE7tfy3T/YLg7OEfmFd1y9gAYc+B5UZVOH?=
 =?us-ascii?Q?avC6Zy8m+hbSIlUHzdr9teKMXZzaLkIIohE5OtYo7KtxEmi/6ahqm0cpwcii?=
 =?us-ascii?Q?X/TQWN7dRoApSVYWtYF2ane3VZMvQjkXkqL1IJXKUcdDwSaTnly+BymtT3Xe?=
 =?us-ascii?Q?1N7Oiw3f8/6gjxk9es/0mt/pIUd/v3Ty767ZkWHMfL/7RvUaZvsNZWQ8OMES?=
 =?us-ascii?Q?uUeb74eAAUTCNBRbaMRpq+aeXrX0etR428Pmw885Bb6PCz9geqZiOt+pX0JR?=
 =?us-ascii?Q?BtC9oQobnPDMIvGSKSWK3Z532PQdcWHohjBJ9pabu5u9ivvi85AZOZhqpLNd?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a44a69-b530-4f75-1f09-08db253daa12
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 10:11:38.9289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkAU0X/vT6R5rlIW2o+gAYdxnVztSLyLdCI2raNYZWuZSRJOuK8RTrDg7j2frw165Ccyru0jINPqa4xhWvU6yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-Proofpoint-GUID: dMZzBGcWnSkmCJeUx8PpI_sUUVlOrQW4
X-Proofpoint-ORIG-GUID: dMZzBGcWnSkmCJeUx8PpI_sUUVlOrQW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=640 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2302240000
 definitions=main-2303150085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178534

This reverts commit 33d9b3a8ed186c2d212acb83f715367912010e7f.

The reverted patch was forcing systemd to do preset-all at boot time (first boot)
in a function that simuilates 'preset-all' at rootfs time. This is not right.

To force a first boot, just do not run this function, as said in the comment:
"""
    # If we populate the systemd links we also create /etc/machine-id, which
    # allows systemd to boot with the filesystem read-only before generating
    # a real value and then committing it back.
    #
    # For the stateless configuration, where /etc is generated at runtime
    # (for example on a tmpfs), this script shouldn't run at all and we
    # allow systemd to completely populate /etc.
"""

For example, removing 'systemd_preset_all;' from IMAGE_PREPROCESS_COMMAND in some
distro conf file will achieve the same effect of the original patch.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 45b29671ee..cddae75a06 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -302,7 +302,7 @@ def preset_all(root):
     # For the stateless configuration, where /etc is generated at runtime
     # (for example on a tmpfs), this script shouldn't run at all and we
     # allow systemd to completely populate /etc.
-    (root / SYSCONFDIR / "machine-id").write_text("uninitialized")
+    (root / SYSCONFDIR / "machine-id").touch()
 
 
 def main():
-- 
2.17.1


