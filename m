Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1587EC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 21:59:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.856.1660946364835263449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 14:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f6FxiHpT;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5230d6c6ac=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27JGG66q001106
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 14:59:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=UB0C9Kp2B3+6a+qf0Kq+k4hzpZlELtLglFknwRegw7k=;
 b=f6FxiHpTTvdUYi6XmOBujtQp2xRU9nrKUPoHMG8Q5AGYft9Zu3TyOGcNx4BzcQ9qdTa3
 7REqvqvkvhanDXkZ+iylQy1y8cDXzQScBw/6x8a33MEFHU9cflNQf5vMfHFY6taKoZ6u
 xebClg+Po/Eg6Ja+iCm8vAKv6wRG78G99GJZujxspmqJdB0Qpzgf/IhEOfnTVqZqbNcx
 AsgmyZnJdzB8HPz/0sBFAUvWvn5vJIm4AFWr7/mtJsCDYPQG/pfPmdtfMSoQGfeWT0Jp
 rPWQJ/7CRRUSMlLi6+LjCU+xcTbr3KORbmO+S+jWZo02OvYtOGjcJznUdATMItsuC07a CA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjnj3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 14:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpME/GifQkYZqUqg54/pKcYjTB24jesHPAgrWXhEZrYB6Gj36ExM46EA18+PKweuoGyL9yXsFAg1h8MNOVqIOwRsOWEKZRHmC7llD81YD+ae+NHM5sYrgWk1DrROCwGKux9s1Tq9bND1/WGlE0T9Bde6BLvmZQJOugO9IunAi0SfHZdqUgZcicgO34Ndi3/3zKxVjryXgklnrHDJbG78/xTXd9lkW116L7FZUOxAypJYB32krMZtxXROhchxuNiYY0Ycz/iGW2gpGOlr87zVpKoLNqspYCq/D0D8ZOb1ld5B6yc89zbYgF4jJeWiHYHZgfHsjdGIVYvkMotY1rCKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB0C9Kp2B3+6a+qf0Kq+k4hzpZlELtLglFknwRegw7k=;
 b=eceLp1+FT/Wr5234XCfGjYamsWdSFI8RWOCZSYhrQlRj3KbuF/j3AfUCK5hAggG4makqV3giWYa3diXBBMY/+Bln9U80l4+ApzknnjE0fH4606HFZ6k+23F6nRxU6UyRJ3E4wXI9vS3QLWx4bKewz6LIXP6Qea+F03DARf9ks8DUzX5itMv571TGZbvVXlQFVBqn6o+X35WAXsfxmwlWRrE8zY3pIwS2BpuEGXEGQgxhAFLVwsMT+BPLUHb/TPx9vjKMQt94RD+2neVbPuKi5JIHsUhSZQVBVQOWiG6MFzuanoyoQfQBcQmNYBfeybxIQwLV6DB27qK7P6LwKQmGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MN2PR11MB4534.namprd11.prod.outlook.com (2603:10b6:208:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 21:59:20 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.027; Fri, 19 Aug 2022
 21:59:20 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] u-boot: fix CVE-2022-30552
Date: Fri, 19 Aug 2022 17:59:06 -0400
Message-Id: <20220819215906.20231-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0143.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::16) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0171eafe-4ea7-45a5-67a7-08da822e118e
X-MS-TrafficTypeDiagnostic: MN2PR11MB4534:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WmIW5JN3KsWOS92SmsV5YeH8IIgPrw9N7/wcRieh9GxYRJj8edqdQFd60HajxU9cr05Y3ewWDiCx9wtr5rJdhPz1l4Cs/fdQcoiRMfo0Qc/DQmo0sgHwKj4hdQc4/8YHfzFbM9oTiCNk2HtNqDFc1jj2NNhMRL/qF4EYDG+tHDTaSjTNwnMJXswK8cjOCFh2FFwZ0IPp5XbARHgyCrjywD7JmaI628qRoUC741NcgE33nzi93FHat/3S4RzCDyFry45tj2cRbyq9tmEob+MIzHr7Fly6qxuMT6WGeEZx6VuXpB8XENuHXUQ/RAGWrzL/0aFAX4uzFNcYjfta5ois6TTQNwS8Fut1yJ5EG/wE9QTbbgjADmp35t8WU426qjijjfaXqsTWHPGKujEIvxp7H1uq1am9W7r4+rM3JTTVMHJytu0HRVcjVzD47eltsN4m6/l455NwSL3lhFQ04XnTfDQ4Iz8MNwf2jA5tr4UlADFJMSV2h6xmAzhzFSA+9KYWrq/v0XzdnmyOAOCfZb9WYJhiye2+yb/gd2CwCt1KDN2jVxpx/JI5rekgi/myDLCBmOBAUFPW1++fUm+E6eEIeqj++Qo/mgDlauuyWF1lojVenIxRZJU1cwz+8IXg0xdJ7+HAyuAoGpktpBrDy2KpXgVOvOpqjmKvZu8nuhpY7IxiTpkHZVVEAFnE5dWSX11u9T/39+INYqXjsGwwufYrXj0HsWzKZsj9QI/+qk6aY8mTGwSPm74R5T7SaXBy9pLReBiPL0pUINqwOuu+l6NajQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(8676002)(66556008)(66946007)(66476007)(44832011)(316002)(6916009)(5660300002)(36756003)(8936002)(2906002)(478600001)(6486002)(41300700001)(6506007)(6666004)(26005)(52116002)(6512007)(86362001)(2616005)(83380400001)(1076003)(38350700002)(38100700002)(66574015)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QkOe+WKy8GBYAGN8J8fPBdT/9B5EJ+KsmjVa3euZW5fg5ZasDu4BGEsNKku6?=
 =?us-ascii?Q?v7g+SruJQYy2QLVj2vYXJjeuQHf+FFKlOQ4bWn4M20DNx4Cq8j/Pib3KYRGw?=
 =?us-ascii?Q?kxSduMcyJO0AIzUfnaM1+uDWt6pUi21x7GpZWAFHbuAcRQedxhwHyTCbvKvH?=
 =?us-ascii?Q?TiBKlzohUZTNcDsyNte7VoTrld/ZINQSFP8LUBoXq1cDXISVOrgJPTm97rZt?=
 =?us-ascii?Q?Dsw2gAJ826SYFXstJBzza9GEl0GsKlwRLcWBqfmOkzoUnSCauUI0IlaBPXCS?=
 =?us-ascii?Q?v1pkwtIuDFBF0sDrkCKM6MRiW3TZbwIR+BEY2c6a6wvDCg1UNS3lk7fju96o?=
 =?us-ascii?Q?EN5h2wzGLt7A6Ns6Fgm8ExnGNUU7KFHwPdpDZ9v5X2vTATO1Gl9JFmIbZiq2?=
 =?us-ascii?Q?1WaSwY4RQB661jh87gjWvYak5BpfZDldDuiav3NpodLQYW6lW8+Ovl6+yzyM?=
 =?us-ascii?Q?3mrfzDJxzTA2c8JT4B/iErWcsjcz4AaNZJNH3KOjDjFFTn7g1miHKI4cPXHX?=
 =?us-ascii?Q?hs/mOkZzzfysTQ4simRZ+UXyxZKgMnRrrQjaKh9TMOSN/MvIlVPOdWlUyb29?=
 =?us-ascii?Q?byVdBbvjn4PbId5dRBfEEK3rSmuX/HpVmNqVBmxh+8mYFnUEAGwbJrh478JS?=
 =?us-ascii?Q?mEmQRFTuIhfkkNhaCmuzCiQCZTryhNy1h6Vc++DFj9Nh4obXSNQnNGWS3uOX?=
 =?us-ascii?Q?RJMmHzP/i6PSiU2Iwl17jz6oy+w9XBFOLpO4uOErjCQdEVtz92f7l3vMFIhs?=
 =?us-ascii?Q?GwYXIrKiXyvELh1qQoRZLnWRb42MgjXhazyjV6OzocXWYjO0DQnS9kjh/067?=
 =?us-ascii?Q?JZjxQxOLk2FjzydVRmVRAS4M0e46SqW10Vczm74KYrY01HzqEWseHDM5Fkrp?=
 =?us-ascii?Q?tiY8OrYeX8xi2KQIlpCWHOn4GqJ0p2tn8qjS681K+sALUAEK29lLI3JvsN4E?=
 =?us-ascii?Q?A4mAannD7Y9s+vd142mHUoQJNi1vU0nIc88qvdX37xIDk5mjQF+bCQ8+lATZ?=
 =?us-ascii?Q?5FBZzCafPLUWXhwN7Faf0fC85gQVh49QdTNqNVXtMk0Df2zptMtMRVzJVxB3?=
 =?us-ascii?Q?J2VNIfWbYskbaf2naZxSE+sPWBnISOCnKTyFYI5zKvL34KBZHWUyrD56x7gI?=
 =?us-ascii?Q?gemFutkP9Cx31CIJF8MMxMfe7dojZ2DWZhLAR+1q9KC0uUkGT7pzg+HMdNDI?=
 =?us-ascii?Q?hF+8EaXy2PQdmeYnDdJ6Mi1twsyyv96lwet/CIvWcjPtkrm35yA1TpodzhYs?=
 =?us-ascii?Q?QSBflw/rjJKLaAbjy71ZjFgn+LJjBphg7BwcpFgDYVjA2HJ1Dq88NO/Qg56R?=
 =?us-ascii?Q?SL0qjNptAq8Oe1CZhqka6ZiEbBihzh3BMSUxpq/soPC/BGZeRcAT1ZTYsnoF?=
 =?us-ascii?Q?DjzxkG744ygEH4RIhFBGPkfzF0mQBJ5oSWYZezUrCuuNYyrRV8M/iDwzC/+X?=
 =?us-ascii?Q?BJksXrz4cvF0QpNp0kl/T7lhhieptcK0DTI4Lm/jxXuYyaCelSMwr+JLDTMR?=
 =?us-ascii?Q?XTf9pjVOfTcQtHHwOPtPxACK+2878djxc5VrYjjn1fFUWYM5roPTouSRf6sv?=
 =?us-ascii?Q?Cbtswf5i9NuGNcjhNOD82hbzfG1GX+YXVoUSDiOMK+GypDyHfTF3ay0ArFZa?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0171eafe-4ea7-45a5-67a7-08da822e118e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 21:59:20.2560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WrXSVS8wCVZJtf9mhdTl5GeiLFOr8VL1ODYBk46Lf9tD7kTwMZLjIdAijLGF5hGQDTvQSjI/sRfnKinlp9+ttdLvFZ4cxlFQP8rGWe12uag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4534
X-Proofpoint-GUID: GTO3z6ZS8PeLvkRBXmQtry4qhtCmSDKv
X-Proofpoint-ORIG-GUID: GTO3z6ZS8PeLvkRBXmQtry4qhtCmSDKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_12,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208190081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 21:59:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169644

Backport patch to fix CVE-2022-30552.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...e-minimum-IP-fragmented-datagram-siz.patch | 207 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 2 files changed, 208 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch b/meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch
new file mode 100644
index 0000000000..3f9cc7776b
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch
@@ -0,0 +1,207 @@
+From c7cab39de5e4b22620248a190b3d2ee46cff38c2 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Thu, 26 May 2022 11:14:37 -0300
+Subject: [PATCH] net: Check for the minimum IP fragmented datagram size
+
+Nicolas Bidron and Nicolas Guigo reported the two bugs below:
+
+"
+----------BUG 1----------
+
+In compiled versions of U-Boot that define CONFIG_IP_DEFRAG, a value of
+`ip->ip_len` (IP packet header's Total Length) higher than `IP_HDR_SIZE`
+and strictly lower than `IP_HDR_SIZE+8` will lead to a value for `len`
+comprised between `0` and `7`. This will ultimately result in a
+truncated division by `8` resulting value of `0` forcing the hole
+metadata and fragment to point to the same location. The subsequent
+memcopy will overwrite the hole metadata with the fragment data. Through
+a second fragment, this can be exploited to write to an arbitrary offset
+controlled by that overwritten hole metadata value.
+
+This bug is only exploitable locally as it requires crafting two packets
+the first of which would most likely be dropped through routing due to
+its unexpectedly low Total Length. However, this bug can potentially be
+exploited to root linux based embedded devices locally.
+
+```C
+static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+{
+     static uchar pkt_buff[IP_PKTSIZE] __aligned(PKTALIGN);
+     static u16 first_hole, total_len;
+     struct hole *payload, *thisfrag, *h, *newh;
+     struct ip_udp_hdr *localip = (struct ip_udp_hdr *)pkt_buff;
+     uchar *indata = (uchar *)ip;
+     int offset8, start, len, done = 0;
+     u16 ip_off = ntohs(ip->ip_off);
+
+     /* payload starts after IP header, this fragment is in there */
+     payload = (struct hole *)(pkt_buff + IP_HDR_SIZE);
+     offset8 =  (ip_off & IP_OFFS);
+     thisfrag = payload + offset8;
+     start = offset8 * 8;
+     len = ntohs(ip->ip_len) - IP_HDR_SIZE;
+```
+
+The last line of the previous excerpt from `u-boot/net/net.c` shows how
+the attacker can control the value of `len` to be strictly lower than
+`8` by issuing a packet with `ip_len` between `21` and `27`
+(`IP_HDR_SIZE` has a value of `20`).
+
+Also note that `offset8` here is `0` which leads to `thisfrag = payload`.
+
+```C
+     } else if (h >= thisfrag) {
+         /* overlaps with initial part of the hole: move this hole */
+         newh = thisfrag + (len / 8);
+         *newh = *h;
+         h = newh;
+         if (h->next_hole)
+             payload[h->next_hole].prev_hole = (h - payload);
+         if (h->prev_hole)
+             payload[h->prev_hole].next_hole = (h - payload);
+         else
+             first_hole = (h - payload);
+
+     } else {
+```
+
+Lower down the same function, execution reaches the above code path.
+Here, `len / 8` evaluates to `0` leading to `newh = thisfrag`. Also note
+that `first_hole` here is `0` since `h` and `payload` point to the same
+location.
+
+```C
+     /* finally copy this fragment and possibly return whole packet */
+     memcpy((uchar *)thisfrag, indata + IP_HDR_SIZE, len);
+```
+
+Finally, in the above excerpt the `memcpy` overwrites the hole metadata
+since `thisfrag` and `h` both point to the same location. The hole
+metadata is effectively overwritten with arbitrary data from the
+fragmented IP packet data. If `len` was crafted to be `6`, `last_byte`,
+`next_hole`, and `prev_hole` of the `first_hole` can be controlled by
+the attacker.
+
+Finally the arbitrary offset write occurs through a second fragment that
+only needs to be crafted to write data in the hole pointed to by the
+previously controlled hole metadata (`next_hole`) from the first packet.
+
+ ### Recommendation
+
+Handle cases where `len` is strictly lower than 8 by preventing the
+overwrite of the hole metadata during the memcpy of the fragment. This
+could be achieved by either:
+* Moving the location where the hole metadata is stored when `len` is
+lower than `8`.
+* Or outright rejecting fragmented IP datagram with a Total Length
+(`ip_len`) lower than 28 bytes which is the minimum valid fragmented IP
+datagram size (as defined as the minimum fragment of 8 octets in the IP
+Specification Document:
+[RFC791](https://datatracker.ietf.org/doc/html/rfc791) page 25).
+
+----------BUG 2----------
+
+In compiled versions of U-Boot that define CONFIG_IP_DEFRAG, a value of
+`ip->ip_len` (IP packet header's Total Length) lower than `IP_HDR_SIZE`
+will lead to a negative value for `len` which will ultimately result in
+a buffer overflow during the subsequent `memcpy` that uses `len` as it's
+`count` parameter.
+
+This bug is only exploitable on local ethernet as it requires crafting
+an invalid packet to include an unexpected `ip_len` value in the IP UDP
+header that's lower than the minimum accepted Total Length of a packet
+(21 as defined in the IP Specification Document:
+[RFC791](https://datatracker.ietf.org/doc/html/rfc791)). Such packet
+would in all likelihood be dropped while being routed to its final
+destination through most routing equipment and as such requires the
+attacker to be in a local position in order to be exploited.
+
+```C
+static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+{
+     static uchar pkt_buff[IP_PKTSIZE] __aligned(PKTALIGN);
+     static u16 first_hole, total_len;
+     struct hole *payload, *thisfrag, *h, *newh;
+     struct ip_udp_hdr *localip = (struct ip_udp_hdr *)pkt_buff;
+     uchar *indata = (uchar *)ip;
+     int offset8, start, len, done = 0;
+     u16 ip_off = ntohs(ip->ip_off);
+
+     /* payload starts after IP header, this fragment is in there */
+     payload = (struct hole *)(pkt_buff + IP_HDR_SIZE);
+     offset8 =  (ip_off & IP_OFFS);
+     thisfrag = payload + offset8;
+     start = offset8 * 8;
+     len = ntohs(ip->ip_len) - IP_HDR_SIZE;
+```
+
+The last line of the previous excerpt from `u-boot/net/net.c` shows
+where the underflow to a negative `len` value occurs if `ip_len` is set
+to a value strictly lower than 20 (`IP_HDR_SIZE` being 20). Also note
+that in the above excerpt the `pkt_buff` buffer has a size of
+`CONFIG_NET_MAXDEFRAG` which defaults to 16 KB but can range from 1KB to
+64 KB depending on configurations.
+
+```C
+     /* finally copy this fragment and possibly return whole packet */
+     memcpy((uchar *)thisfrag, indata + IP_HDR_SIZE, len);
+```
+
+In the above excerpt the `memcpy` overflows the destination by
+attempting to make a copy of nearly 4 gigabytes in a buffer that's
+designed to hold `CONFIG_NET_MAXDEFRAG` bytes at most which leads to a DoS.
+
+ ### Recommendation
+
+Stop processing of the packet if `ip_len` is lower than 21 (as defined
+by the minimum length of a data carrying datagram in the IP
+Specification Document:
+[RFC791](https://datatracker.ietf.org/doc/html/rfc791) page 34)."
+
+Add a check for ip_len lesser than 28 and stop processing the packet
+in this case.
+
+Such a check covers the two reported bugs.
+
+Reported-by: Nicolas Bidron <nicolas.bidron@nccgroup.com>
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+
+Upstream-Status: Backport [b85d130ea0cac152c21ec38ac9417b31d41b5552]
+CVE: CVE-2022-30552
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ include/net.h | 2 ++
+ net/net.c     | 3 +++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/include/net.h b/include/net.h
+index cec8c98618..09d7e9b9e8 100644
+--- a/include/net.h
++++ b/include/net.h
+@@ -397,6 +397,8 @@ struct ip_hdr {
+ 
+ #define IP_HDR_SIZE		(sizeof(struct ip_hdr))
+ 
++#define IP_MIN_FRAG_DATAGRAM_SIZE	(IP_HDR_SIZE + 8)
++
+ /*
+  *	Internet Protocol (IP) + UDP header.
+  */
+diff --git a/net/net.c b/net/net.c
+index c2992a0908..f5400e6dbc 100644
+--- a/net/net.c
++++ b/net/net.c
+@@ -907,6 +907,9 @@ static struct ip_udp_hdr *__net_defragment(struct ip_udp_hdr *ip, int *lenp)
+ 	int offset8, start, len, done = 0;
+ 	u16 ip_off = ntohs(ip->ip_off);
+ 
++	if (ip->ip_len < IP_MIN_FRAG_DATAGRAM_SIZE)
++		return NULL;
++
+ 	/* payload starts after IP header, this fragment is in there */
+ 	payload = (struct hole *)(pkt_buff + IP_HDR_SIZE);
+ 	offset8 =  (ip_off & IP_OFFS);
+-- 
+2.33.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index f2443723e2..147f6e8183 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -4,6 +4,7 @@ require u-boot.inc
 SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
                    file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
+                   file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.33.0


