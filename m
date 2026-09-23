Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3067C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:17:09 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2777.1790153896021527147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 01:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=agtMJQRV;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.0, mailfrom: upstream_ip-ah@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtqZhIWXnnd0+ei87C/zgGSZmBkuf67jysS/de+whnh8vCE1ymefFw4h+JGcjSXBtjZoN2qEr/a36R9dIhd45qhGHyRhoWVgHP6tHQfTIuE3VgVLsKXQM/nMStaDO8J5I0lLXMrRnPr9YB65VnYkuR+58D7wOJfltqDXGVL05L6ajWexf/czQYnjE7pby2bzMRlB785Pl3maekbEHyGpH/SZFYruhDhZcWQVg5zjvGkD/eapZMgJVMc1YvjsQBMnAg17O3cSKmdOLLq/Km8phNyJ+QPK37X3jI/Xj2n4fPpr4n6Up7LTi9v3NLUB9SnByBYluSeRs1/8aEcT6saMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KblVWKhGW8yOzGYGW72KYKmzVI45/6QhKslYurQW+1c=;
 b=wSYRIEjtmV6GGyoLdmyTkQm6/gsrrJ/kqPtjji+FXrnFmBsIvmuxe5PJvFFNdenGXCom9sozbWfBalsKUMMP3lvumqgSFK6L61qUJ5EZkMw0JK3RfO6+kbWYxoC7rM/sy9mWtQhHDYhmZ1+T01EmZfnke3mSfvePnkWwgyMUc+4I0J3wgbzGXuHq5onu4fCMYNlH4A2RefzarYweUsXo/WKRtfceGGzNiR1dsx13j9717c2AraC5/bEAwnD+iFfcPURAM7Mt2hu4UEHZJT1d7fYgab2d6mFvxpAtWXNVHoZGXev46UkUsbqWuQMXRF6vQtMFeUlh+DZgiqvL38jZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KblVWKhGW8yOzGYGW72KYKmzVI45/6QhKslYurQW+1c=;
 b=agtMJQRVi6vUZqJuuiA1eequkQD15IExTQ5pW83VgK+H8VORiJd3pBeixzXwMCcSlaw6UXtxGmLRT5p5PbiNX6lvLDXDZdQShuOeq+WESNMLYHrB+wNrPApFRE0KsdGy6BM0rMWG1SQtGvPqU1ftiEaKEG2D4FDr2UvAoID8xhK6XXtXDy0ePJgbwJQKJB0veBiroXNyhjyKUM8qcuJ1BBXvlB8paE8/04OkLAwHcQ3oT6QdrYCKzvVhFAetII86qFZ2xFEfORZfsIBT4crT8PT52mN0ZUjUV4QQ6HIqH5MJjg8IUpf4ge1yYJS7sSOZVFJOPy3Qernjkh9DVCTYBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAXP287MB4201.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15c::8)
 by MA5P287MB5964.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:233::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 08:42:25 +0000
Received: from MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
 ([fe80::e287:463a:b296:eddf]) by MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
 ([fe80::e287:463a:b296:eddf%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:42:25 +0000
From: Akash Hadke <UpStream_IP-AH@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Akash Hadke <Akash.Hadke@bmwtechworks.in>,
	Akash Hadke <UpStream_IP-AH@bmwtechworks.in>
Subject: [scarthgap][PATCH] systemd: backport networkd route readiness fix from upstream
Date: Wed, 23 Sep 2026 14:09:14 +0530
Message-ID: <20260923083914.712852-1-UpStream_IP-AH@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:263::7) To MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:15c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXP287MB4201:EE_|MA5P287MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cefdeb2-a2d9-47b9-944a-08df194e979c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|56012099006|11063799006|10067099003|55112099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	jsEQlTh15uWrDOadFdnPjM/ygR5GTM0KbO6n/2figUW2GPBl8YOL7jSMQAzf1yZQ30uqDMHexzk3WHtg/o7WIKCFFs5UrvSJmvM3P7bXfWVq2CXa2hGbA3WbqX/peNDrqsaOHwStuIQu4Q0AEuP9Aso6SCao4aveneer973P09L+NzE7D5ubSV1u4VXxKcaezH5Xzn8workH1CJOn1b+FZXn50G2rn78VB509x9LE02u5evHyafFKsQh2VrzUZkLrmUk+wuqiHM03J8Exx8ef3+N0DCxV751PEZMYJZCCOX42HqB/gvVq72HJTfFmn7KbJHoTPNKPe/F3QAHbFoBWsacy+nLpYxYbLqZ1laheGA0RYBQ8iHS+1JMZXBRC7xGDEl8PwHD5/bU8oBW1cciPnx9rhGpGo9q/CmVBUDGuVCa8ogtkJ+WPtqgsnDcJ05iUwEfpKlDSzD8UJJZUv6ZBFwSgjCiNe3wBBzgZBFSe4TZseoNUrAglzpyTBtD9VNKYzEDYOd7UUluL3qq0f0wK5NpHi02GtL7M/r7Xuwj+APn8Ql1ifiSDWQQqY32SMVX4yYzw9bYGqFe12P05en79PbF1dZXNvqvJW3HTD35a80REvdGSQQ/YLp/+eP8T28UUEFAZeRgEV7Im7I7GuYBM8Nwk8snJh3pepK6nN2k/xnnN6YkYt/RUYLJBUYpjXz8yr7UDRguKxVRokx71PMGgn4Hv1xzlOBE09kUiWaPOEE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4201.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(55112099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6IoedDOg23ojQpgdmYFAIu18yI67/mirIn0Yxyt6ugpS1f+z6YkXxzR45gX2?=
 =?us-ascii?Q?qSDMGEIEGmp401wxcuoBqrPbiQrjSPpM5jinWETOO26UPMyyzrzM0yTSushM?=
 =?us-ascii?Q?tMLz6f+DJevGIzENFZUjbXrmTL9keWVXLot3mmos5hfswIFXBveM8+XzbAq5?=
 =?us-ascii?Q?M5UfkKm5Z0C1IWSqjk+RKGtDIfTXbqqAA8Vhk3BQWVbXbpNGPD8G11QDtvqT?=
 =?us-ascii?Q?CFwim1PNT0FyBZtUYTYH2Q9LFxUzUD2HilAxntBQBCXzobZA8VthV5XYLSm8?=
 =?us-ascii?Q?w5DXEOR328WfoO5ZkuxM+L8X1diaGIe0wIC1RDNJcoPmzYipWgYHdxpCNDhS?=
 =?us-ascii?Q?zWaWe4g7OMFpEb2S89DkyQH3rJMbrM5Hr5JwQQ7hgP6VSs0JYmnwONO6nHzH?=
 =?us-ascii?Q?9XBRidUDCV9usoPcmR04iLwtwudtn2qI70Zrlc2pEdp1Q5V6RpMVBUTXC3rO?=
 =?us-ascii?Q?MRMcjoS/eidYlmubsP+z4FPWCF7+r7p2njIJpsak9ujmKCkgkpBU541+LdKG?=
 =?us-ascii?Q?NZsu3LOmLMfRVKvKTusLxfXosvFrzqeUTHT5b3V/V8/5Qsk4MbS5t4ThfyIG?=
 =?us-ascii?Q?pprlq6X5n35bdwC+MyCCwvuv9vI60sSwoWpqlrcACGRUywJ/2N5FviIKbiKU?=
 =?us-ascii?Q?LmIyONT1dnjwxmH09ykeSs9maVxDpGch+4M5Eiu9zd0anBCXhJ4Cb3ImdGaN?=
 =?us-ascii?Q?d2Qh8No99mFj7Meudsv0WD1KNZkY7iM3YCrs7Ueyuz2DllblLXta0xNSpzW/?=
 =?us-ascii?Q?AA2DKBSwTbq29iADvLUhoL9f9uXd2EJZKZw9AQBQb891s1ZQG23wmeTlUUYX?=
 =?us-ascii?Q?+DDznAMpmtkkpiLVMtG6UxRvrxvmjdiF1LnknkSZ/wkJ8m9WpnAj21jZUD8b?=
 =?us-ascii?Q?0MYo1CYymjBXU9KkwmK2C5T06io15XmUKquy6bq6XUyiEZKApHRFn1jjE1Cj?=
 =?us-ascii?Q?S55VoTa1IYh1WrfW3GwbkSnBgRMCK807jn5y79OatbWaUZi1Qx+4zCy74JBc?=
 =?us-ascii?Q?37AHrnJ/HIt7JNLZ8pXekjXDWS9QLAb2ICK2m94ga6s49YWaGcPDQc92mEJK?=
 =?us-ascii?Q?J5fq1pR1Wy+7VlD87nyddwl58oKV6Hl9ys5pc68Kw7qLXWvMhS2FeGSxXd1s?=
 =?us-ascii?Q?8U7xilAx449eR9SULFLYAEkhy40Ppw7W6xXyzCBt3DFY1W97OSaWQn1SWffd?=
 =?us-ascii?Q?knlP/tgkU1jt+o4rZycbZRjSZDasOCOw4ggNuwacdFlYnlro23SabE2qQXqW?=
 =?us-ascii?Q?HJzVtjJLRj3vA+9ewLIMgGWu7ICATDdMlFq5BuBEjuiSOLvVAbXaZ6swT81Q?=
 =?us-ascii?Q?7rFMzn3AHfCM5IHMBr7g6TKJQPvX307BuuRo+tXjcCrRrJ8KQrO3N1knH2bw?=
 =?us-ascii?Q?k+f1On1+BuYVRH0Gyisxu52W2rMoW/aAqdeSSh7Qi/v8f8EfTnYa2/8R47V/?=
 =?us-ascii?Q?kxfIQE4nkIjaE+C3xnrLh0yygocHslCBsgAbQy6rsChGCuG1S9A9IwpxTn/O?=
 =?us-ascii?Q?lY0i8GDlG+Kl4k0mkoznLDLVNb2nHIqC+/j/JQ4cicKAtvJNyhAJIdjvLEGD?=
 =?us-ascii?Q?eC3Vtx5DWtfAaJLWtvJlahXCc7ea3IsIZVXaW4Mde6cerfpwCj5z3c5aVg9W?=
 =?us-ascii?Q?3EarkSWcXCpferMyJ8KKqXgzyTirsTzcQSjjJEKdTUsAb9tF1+sxxLDv2MXC?=
 =?us-ascii?Q?YWp+/c0cTTbfT0DbmQGh4oY7bg8pC2Vy9/oCMf1Cj7c+dfPhZBei9jSvJ0MT?=
 =?us-ascii?Q?+f7In+Ia5MIZD3Aoty+aptdizCxSsFU=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cefdeb2-a2d9-47b9-944a-08df194e979c
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:42:25.3250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neOhDBURevZXkI7TP9csWF9AtmaLRYjocBuLs1cgxV6KBVdPCEAK1W1KCBPQl3JXYXjs5PKJszTnjKc08v+a21jimiJ9kBo4Lgq/ta1F1sE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5964
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246511

From: Akash Hadke <Akash.Hadke@bmwtechworks.in>

Backport upstream systemd PR #41000 to v255.22 to fix route handling
in systemd-networkd when routes are configured on links that are not
yet up.

In 255.21, networkd only checks link readiness when configuring
explicit nexthops. Routes using an implicit nexthop can therefore
be processed while the bound link is still down, which breaks setups
using ConfigureWithoutCarrier=3D and BindCarrier=3D. One visible symptom
is that static multicast routes are not installed until much later,
or are missed entirely, even though the address configuration succeeds.

The upstream fix makes the readiness checks consistent by introducing
a common link_is_up() helper, limiting gateway readiness checks to
nexthops that are actually bound to a link, and moving the
"link must be up" check into the shared gateway readiness path so both
explicit and implicit nexthops follow the same logic. Upstream also
adds a regression test for issue #40106.

This backport is needed to keep route configuration reliable on
carrier-dependent interfaces in our 255.22-based systemd.

Ref: https://github.com/systemd/systemd/pull/41000
https://github.com/systemd/systemd/issues/40106

Tested:
- Built core-image-minimal with INIT_MANAGER =3D "systemd" on qemux86-64.
- Verified functional test case in QEMU:
  * Setup dummy parent (carrier off) and VLAN child with BindCarrier=3D.
  * Verified multicast route remains deferred while carrier is down.
  * Verified multicast route installs immediately upon carrier up.
  * Verified clean route recovery across carrier toggles.

Signed-off-by: Akash Hadke <UpStream_IP-AH@bmwtechworks.in>
Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>
---
 ...introduce-link_is_up-helper-function.patch | 166 ++++++++++++++++++
 ...ly-when-the-nexthop-is-bound-to-link.patch |  72 ++++++++
 ...nd-to-a-link-requires-the-link-is-up.patch |  57 ++++++
 ...etwork-add-test-case-for-issue-40106.patch | 117 ++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |   4 +
 5 files changed, 416 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-network-introduc=
e-link_is_up-helper-function.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-network-check-if=
-gateway-is-ready-only-when-the-nexthop-is-bound-to-link.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0025-network-route-bo=
und-to-a-link-requires-the-link-is-up.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-test-network-add=
-test-case-for-issue-40106.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-network-introduce-link_=
is_up-helper-function.patch b/meta/recipes-core/systemd/systemd/0023-networ=
k-introduce-link_is_up-helper-function.patch
new file mode 100644
index 0000000000..04f7963a8a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-network-introduce-link_is_up-h=
elper-function.patch
@@ -0,0 +1,166 @@
+From ec4f646759d6625bbafcd4ce67224fb63b99a96c Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 9 Mar 2026 10:57:06 +0900
+Subject: [PATCH] network: introduce link_is_up() helper function
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41000/c=
ommits/ec4f646759d6625bbafcd4ce67224fb63b99a96c]
+Comment: Patch is refreshed based on the 255.22 codebase
+Did not pick changes from the below files as it is not matches to our code=
 base.
+src/network/netdev/bond.c
+src/network/networkd-route.c
+
+Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>
+---
+ src/network/networkd-link.c    | 21 +++++++++++----------
+ src/network/networkd-link.h    |  1 +
+ src/network/networkd-nexthop.c |  4 ++--
+ src/network/networkd-route.c   |  2 +-
+ src/network/networkd-setlink.c | 11 +++++------
+ 6 files changed, 21 insertions(+), 20 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index e49d5946aa67d..c77b02b8e0192 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -726,7 +726,6 @@ int link_ipv6ll_gained(Link *link) {
+
+ int link_handle_bound_to_list(Link *link) {
+         bool required_up =3D false;
+-        bool link_is_up =3D false;
+         Link *l;
+
+         assert(link);
+@@ -737,18 +736,15 @@ int link_handle_bound_to_list(Link *link) {
+         if (hashmap_isempty(link->bound_to_links))
+                 return 0;
+
+-        if (link->flags & IFF_UP)
+-                link_is_up =3D true;
+-
+         HASHMAP_FOREACH(l, link->bound_to_links)
+                 if (link_has_carrier(l)) {
+                         required_up =3D true;
+                         break;
+                 }
+
+-        if (!required_up && link_is_up)
++        if (!required_up && link_is_up(link))
+                 return link_request_to_bring_up_or_down(link, /* up =3D *=
/ false);
+-        if (required_up && !link_is_up)
++        if (required_up && !link_is_up(link))
+                 return link_request_to_bring_up_or_down(link, /* up =3D *=
/ true);
+
+         return 0;
+@@ -1736,7 +1732,7 @@ void link_update_operstate(Link *link, bool also_upd=
ate_master) {
+                         carrier_state =3D LINK_CARRIER_STATE_ENSLAVED;
+                 else
+                         carrier_state =3D LINK_CARRIER_STATE_CARRIER;
+-        } else if (link->flags & IFF_UP)
++        } else if (link_is_up(link))
+                 carrier_state =3D LINK_CARRIER_STATE_NO_CARRIER;
+         else
+                 carrier_state =3D LINK_CARRIER_STATE_OFF;
+@@ -1867,6 +1863,11 @@ void link_update_operstate(Link *link, bool also_up=
date_master) {
+          ? ((old & flag) ? (" -" string) : (" +" string))        \
+          : "")
+
++bool link_is_up(Link *link) {
++        assert(link);
++        return FLAGS_SET(link->flags, IFF_UP);
++}
++
+ static int link_update_flags(Link *link, sd_netlink_message *message) {
+         bool link_was_admin_up, had_carrier;
+         uint8_t operstate;
+@@ -1930,21 +1931,21 @@ static int link_update_flags(Link *link, sd_netlin=
k_message *message) {
+                         log_link_debug(link, "Unknown link flags lost, ig=
noring: %#.5x", unknown_flags_removed);
+         }
+
+-        link_was_admin_up =3D link->flags & IFF_UP;
++        link_was_admin_up =3D link_is_up(link);
+         had_carrier =3D link_has_carrier(link);
+
+         link->flags =3D flags;
+         link->kernel_operstate =3D operstate;
+
+         link_update_operstate(link, true);
+-
+-        if (!link_was_admin_up && (link->flags & IFF_UP)) {
++=09
++        if (!link_was_admin_up && link_is_up(link)) {
+                 log_link_info(link, "Link UP");
+
+                 r =3D link_admin_state_up(link);
+                 if (r < 0)
+                         return r;
+-        } else if (link_was_admin_up && !(link->flags & IFF_UP)) {
++        } else if (link_was_admin_up && !link_is_up(link)) {
+                 log_link_info(link, "Link DOWN");
+
+                 r =3D link_admin_state_down(link);
+diff --git a/src/network/networkd-link.h b/src/network/networkd-link.h
+index c5b9421bc0b2b..9c641fad39bdb 100644
+--- a/src/network/networkd-link.h
++++ b/src/network/networkd-link.h
+@@ -233,6 +233,7 @@ static inline bool link_has_carrier(Link *link) {
+         assert(link);
+         return netif_has_carrier(link->kernel_operstate, link->flags);
+ }
++bool link_is_up(Link *link);
+
+ bool link_ipv6_enabled(Link *link);
+ int link_ipv6ll_gained(Link *link);
+diff --git a/src/network/networkd-nexthop.c b/src/network/networkd-nexthop=
.c
+index 5e5f0d0e6858b..23941527cfdcf 100644
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -526,7 +526,7 @@ static bool nexthop_is_ready_to_configur
+                  * kernel. */
+                 if (link->set_flags_messages > 0)
+                         return false;
+-                if (!FLAGS_SET(link->flags, IFF_UP))
++                if (!link_is_up(link))
+                         return false;
+         }
+=20
+diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink=
.c
+index 7069b101f9f55..f5a43788ef792 100644
+--- a/src/network/networkd-setlink.c
++++ b/src/network/networkd-setlink.c
+@@ -486,7 +486,7 @@ static int link_is_ready_to_set_link(Lin
+         case REQUEST_TYPE_SET_LINK_CAN:
+                 /* Do not check link->set_flags_messages here, as it is o=
k even if link->flags
+                  * is outdated, and checking the counter causes a deadloc=
k. */
+-                if (FLAGS_SET(link->flags, IFF_UP)) {
++                if (link_is_up(link)) {
+                         /* The CAN interface must be down to configure bi=
trate, etc... */
+                         r =3D link_down_now(link);
+                         if (r < 0)
+@@ -550,7 +550,7 @@ static int link_is_ready_to_set_link(Lin
+=20
+                 /* Do not check link->set_flags_messages here, as it is o=
k even if link->flags is outdated,
+                  * and checking the counter causes a deadlock. */
+-                if (link->network->bond && FLAGS_SET(link->flags, IFF_UP)=
) {
++                if (link->network->bond && link_is_up(link)) {
+                         /* link must be down when joining to bond master.=
 */
+                         r =3D link_down_now(link);
+                         if (r < 0)
+@@ -649,8 +649,7 @@ int link_request_to_set_addrgen_mode(Lin
+          * link goes down. Hence, we need to reset the interface. However=
, setting the mode by sysctl
+          * does not need that. Let's use the sysctl interface when the li=
nk is already up.
+          * See also issue #22424. */
+-        if (mode !=3D IPV6_LINK_LOCAL_ADDRESSS_GEN_MODE_NONE &&
+-            FLAGS_SET(link->flags, IFF_UP)) {
++        if (mode !=3D IPV6_LINK_LOCAL_ADDRESSS_GEN_MODE_NONE && link_is_u=
p(link)) {
+                 r =3D link_set_ipv6ll_addrgen_mode(link, mode);
+                 if (r < 0)
+                         log_link_warning_errno(link, r, "Cannot set IPv6 =
address generation mode, ignoring: %m");
+@@ -1142,7 +1141,7 @@ static bool link_is_ready_to_bring_up_or
+                 if (link_get_by_index(link->manager, link->dsa_master_ifi=
ndex, &master) < 0)
+                         return false;
+=20
+-                if (!FLAGS_SET(master->flags, IFF_UP))
++                if (!link_is_up(master))=20
+                         return false;
+         }
+=20
diff --git a/meta/recipes-core/systemd/systemd/0024-network-check-if-gatewa=
y-is-ready-only-when-the-nexthop-is-bound-to-link.patch b/meta/recipes-core=
/systemd/systemd/0024-network-check-if-gateway-is-ready-only-when-the-nexth=
op-is-bound-to-link.patch
new file mode 100644
index 0000000000..148a3c2d07
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-network-check-if-gateway-is-re=
ady-only-when-the-nexthop-is-bound-to-link.patch
@@ -0,0 +1,72 @@
+From 43989de6427954f0755e2667bda1cf3839d27964 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 9 Mar 2026 11:30:54 +0900
+Subject: [PATCH] network: check if gateway is ready only when the nexthop =
is
+ bound to link
+
+Currently, we support three types of nexthop:
+1. simple nexthop, which is bound to link, may have specific gateway
+   address,
+2. blackhole nexthop, which is global configuration and is not bound to
+   any links,
+3. group nexthop, which is also global configuration and is not bound to
+   any links.
+
+Thus, gateway_is_ready() is only necessary to call for simple nexthop
+case. Let's make the logic simpler.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/43989=
de6427954f0755e2667bda1cf3839d27964]
+Comment: Patch is refreshed based on 255.22 codebase
+
+Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>
+---
+ src/network/networkd-nexthop.c | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/src/network/networkd-nexthop.c b/src/network/networkd-nexthop=
.c
+index 23941527cfdcf..81eb85b4a06c1 100644
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -520,17 +520,29 @@ static bool nexthop_is_ready_to_configur
+         if (!link_is_ready_to_configure(link, false))
+                 return false;
+=20
++        /* Currently, we support the following three types of nexthops:
++         * 1. Simple nexthop - bound to the link, requires the underlying=
 link is up.
++         * 2. Blackhole nexthop - not bound to the link.
++         * 3. Group nexthop - not bound to the link, but all group member=
s must be configured first.
++         *
++         * Note, the kernel also supports fdb nexthop, but currently we d=
o not support it. Note, fdb nexthop
++         * does not require IFF_UP. See rtm_to_nh_config() in net/ipv4/ne=
xthop.c of kernel. */
++
++        /* Simple nexthop */
+         if (nexthop_owned_by_link(nexthop)) {
+-                /* TODO: fdb nexthop does not require IFF_UP. The conditi=
ons below needs to be updated
+-                 * when fdb nexthop support is added. See rtm_to_nh_confi=
g() in net/ipv4/nexthop.c of
+-                 * kernel. */
+                 if (link->set_flags_messages > 0)
+                         return false;
+                 if (!link_is_up(link))
+                         return false;
++
++                return gateway_is_ready(link, FLAGS_SET(nexthop->flags, R=
TNH_F_ONLINK), nexthop->family, &nexthop->gw);
+         }
+=20
+-        /* All group members must be configured first. */
++        /* Blackhole nexthop */
++        if (nexthop->blackhole)
++                return true;
++
++        /* Group nexthop */
+         HASHMAP_FOREACH(nhg, nexthop->group) {
+                 NextHop *g;
+=20
+@@ -552,7 +564,7 @@ static bool nexthop_is_ready_to_configur
+                 }
+         }
+=20
+-        return gateway_is_ready(link, FLAGS_SET(nexthop->flags, RTNH_F_ON=
LINK), nexthop->family, &nexthop->gw);
++        return true;
+ }
+=20
+ static int nexthop_process_request(Request *req, Link *link, NextHop *nex=
thop) {
diff --git a/meta/recipes-core/systemd/systemd/0025-network-route-bound-to-=
a-link-requires-the-link-is-up.patch b/meta/recipes-core/systemd/systemd/00=
25-network-route-bound-to-a-link-requires-the-link-is-up.patch
new file mode 100644
index 0000000000..cf4f786645
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-network-route-bound-to-a-link-=
requires-the-link-is-up.patch
@@ -0,0 +1,57 @@
+From ed54648b47779d2ba24ceffd16b7b63ec0845043 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 9 Mar 2026 11:46:01 +0900
+Subject: [PATCH] network: route bound to a link requires the link is up
+
+We checked if the link is up only when configuring (explicit) nexthop,
+but we did not checked that when configuring route which has (implicit)
+nexthop.
+
+Let's move the checks from nexthop_is_ready_to_configure() to
+gateway_is_ready(), which is called for both implicit and explict
+nexthops.
+
+Fixes #40106.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/ed546=
48b47779d2ba24ceffd16b7b63ec0845043]
+Comment: Patch is refreshed based on 255.22 codebase
+
+Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>
+---
+ src/network/networkd-nexthop.c    | 5 -----
+ src/network/networkd-route-util.c | 6 ++++++
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/network/networkd-nexthop.c b/src/network/networkd-nexthop=
.c
+index 81eb85b4a06c1..0e453e159748a 100644
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -530,11 +530,6 @@ static bool nexthop_is_ready_to_configur
+=20
+         /* Simple nexthop */
+         if (nexthop_owned_by_link(nexthop)) {
+-                if (link->set_flags_messages > 0)
+-                        return false;
+-                if (!link_is_up(link))
+-                        return false;
+-
+                 return gateway_is_ready(link, FLAGS_SET(nexthop->flags, R=
TNH_F_ONLINK), nexthop->family, &nexthop->gw);
+         }
+=20
+diff --git a/src/network/networkd-route-util.c b/src/network/networkd-rout=
e-util.c
+index 37ace2d335c60..3a7156fc4129f 100644
+--- a/src/network/networkd-route-util.c
++++ b/src/network/networkd-route-util.c
+@@ -128,6 +128,12 @@ bool gateway_is_ready(Link *link, bool o
+         assert(link);
+         assert(link->manager);
+=20
++       if (link->set_flags_messages > 0)
++                return false;
++
++        if (!link_is_up(link))
++                return false;
++
+         if (onlink)
+                 return true;
+=20
diff --git a/meta/recipes-core/systemd/systemd/0026-test-network-add-test-c=
ase-for-issue-40106.patch b/meta/recipes-core/systemd/systemd/0026-test-net=
work-add-test-case-for-issue-40106.patch
new file mode 100644
index 0000000000..1bef2cbbed
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0026-test-network-add-test-case-for=
-issue-40106.patch
@@ -0,0 +1,117 @@
+From f47d180b855dd4eb0a11d44d001c99f475dda56b Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Mon, 9 Mar 2026 12:31:41 +0900
+Subject: [PATCH] test-network: add test case for issue #40106
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/f47d1=
80b855dd4eb0a11d44d001c99f475dda56b]
+
+Signed-off-by: Akash Hadke <Akash.Hadke@bmwtechworks.in>
+---
+ .../25-route-static-issue-40106-dummy.network |  7 ++++
+ .../25-route-static-issue-40106-vlan.netdev   |  7 ++++
+ .../25-route-static-issue-40106-vlan.network  | 15 +++++++
+ test/test-network/systemd-networkd-tests.py   | 41 +++++++++++++++++++
+ 4 files changed, 70 insertions(+)
+ create mode 100644 test/test-network/conf/25-route-static-issue-40106-dum=
my.network
+ create mode 100644 test/test-network/conf/25-route-static-issue-40106-vla=
n.netdev
+ create mode 100644 test/test-network/conf/25-route-static-issue-40106-vla=
n.network
+
+diff --git a/test/test-network/conf/25-route-static-issue-40106-dummy.netw=
ork b/test/test-network/conf/25-route-static-issue-40106-dummy.network
+new file mode 100644
+index 0000000000000..08553b97f5f19
+--- /dev/null
++++ b/test/test-network/conf/25-route-static-issue-40106-dummy.network
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: LGPL-2.1-or-later
++[Match]
++Name=3Ddummy99
++
++[Network]
++ConfigureWithoutCarrier=3Dtrue
++VLAN=3Dvlan99
+diff --git a/test/test-network/conf/25-route-static-issue-40106-vlan.netde=
v b/test/test-network/conf/25-route-static-issue-40106-vlan.netdev
+new file mode 100644
+index 0000000000000..c40e7b755aefa
+--- /dev/null
++++ b/test/test-network/conf/25-route-static-issue-40106-vlan.netdev
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: LGPL-2.1-or-later
++[NetDev]
++Kind=3Dvlan
++Name=3Dvlan99
++
++[VLAN]
++Id=3D99
+diff --git a/test/test-network/conf/25-route-static-issue-40106-vlan.netwo=
rk b/test/test-network/conf/25-route-static-issue-40106-vlan.network
+new file mode 100644
+index 0000000000000..442cf480fbc51
+--- /dev/null
++++ b/test/test-network/conf/25-route-static-issue-40106-vlan.network
+@@ -0,0 +1,15 @@
++# SPDX-License-Identifier: LGPL-2.1-or-later
++[Match]
++Name=3Dvlan99
++
++[Network]
++ConfigureWithoutCarrier=3Dtrue
++BindCarrier=3Ddummy99
++
++[Address]
++Address=3D192.0.2.1/24
++
++[Route]
++Destination=3D198.51.100.1
++Type=3Dmulticast
++Scope=3Dlink
+diff --git a/test/test-network/systemd-networkd-tests.py b/test/test-netwo=
rk/systemd-networkd-tests.py
+index bbbab8e3fe636..6f2fe1b9eb65c 100755
+--- a/test/test-network/systemd-networkd-tests.py
++++ b/test/test-network/systemd-networkd-tests.py
+@@ -4603,6 +4603,47 @@ def test_route_via_ipv6(self):
+         self.assertRegex(output, '149.10.124.48/28 proto kernel scope lin=
k src 149.10.124.58')
+         self.assertRegex(output, '149.10.124.66 via inet6 2001:1234:5:8ff=
f:ff:ff:ff:ff proto static')
+=20
++    def test_route_static_issue_40106(self):
++        check_output('ip link add dummy99 type dummy')
++        check_output('ip link set dummy99 up carrier off')
++        copy_network_unit(
++            '25-route-static-issue-40106-dummy.network',
++            '25-route-static-issue-40106-vlan.netdev',
++            '25-route-static-issue-40106-vlan.network',
++        )
++        start_networkd()
++        self.wait_online('dummy99:no-carrier')
++        self.wait_operstate('vlan99', operstate=3D'off', setup_state=3D'c=
onfiguring')
++
++        # address can be configured even when the interface is down.
++        self.wait_address('vlan99', '192.0.2.1/24', ipv=3D'-4', timeout_s=
ec=3D10)
++        print('### ip -4 address show dev vlan99')
++        output =3D check_output('ip -4 address show dev vlan99')
++        print(output)
++        self.assertIn('inet 192.0.2.1/24 brd 192.0.2.255 scope global vla=
n99', output)
++
++        # route cannot be configured when the interface is down.
++        print('### ip -4 route show dev vlan99')
++        output =3D check_output('ip -4 route show dev vlan99')
++        print(output)
++        self.assertEqual(output, '')
++
++        # When cable is connected, the vlan becomes up by BindCarrier=3D,=
 then
++        # the pending route is also configured.
++        check_output('ip link set dummy99 carrier on')
++        self.wait_online('dummy99:degraded', 'vlan99:routable')
++
++        print('### ip -4 address show dev vlan99')
++        output =3D check_output('ip -4 address show dev vlan99')
++        print(output)
++        self.assertIn('inet 192.0.2.1/24 brd 192.0.2.255 scope global vla=
n99', output)
++
++        print('### ip -4 route show dev vlan99')
++        output =3D check_output('ip -4 route show dev vlan99')
++        print(output)
++        self.assertIn('192.0.2.0/24 proto kernel scope link src 192.0.2.1=
', output)
++        self.assertIn('multicast 198.51.100.1 proto static scope link', o=
utput)
++
+     @expectedFailureIfModuleIsNotAvailable('tcp_dctcp')
+     def test_route_congctl(self):
+         copy_network_unit('25-route-congctl.network', '12-dummy.netdev')
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-cor=
e/systemd/systemd_255.22.bb
index e5a0fd9170..f5e0618def 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -37,6 +37,10 @@ SRC_URI +=3D " \
            file://CVE-2026-29111-02.patch \
            file://CVE-2026-29111-03.patch \
            file://CVE-2026-29111-04.patch \
+           file://0023-network-introduce-link_is_up-helper-function.patch =
\
+           file://0024-network-check-if-gateway-is-ready-only-when-the-nex=
thop-is-bound-to-link.patch \
+           file://0025-network-route-bound-to-a-link-requires-the-link-is-=
up.patch \
+           file://0026-test-network-add-test-case-for-issue-40106.patch \
            "
=20
 # patches needed by musl
--=20
2.43.0


