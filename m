Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8E7CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 12:53:56 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5211.1791542616670672210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=Ftzba/v8;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.22, mailfrom: upstream_ip-ah@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4C2zEOZqR0QxH3JHQdI38+gKG/pwYjzF7GScrY4qha2BDSwHALxjRFXxD55zQxqfTZwx8jwzm9WEOP+pIQBPO8pDAOHH64OpbtTMpzZ2a/6ioxCf4Bf+gXkG7oUR6ICEndPEIjVmVcoOPqxkS9zkNzJTsn2V9LdBLx0bv1D5dXgk0oXGSZH7Fl1Eoy/x6AFscru6C6TsP+zrjC1SVhmKBlh4gSyKUfOE7oAXHiCKq2Ujiq55MYJmIGKLnoNAZHCiOpQ1hDQtPFhpK/AxmKeMQYHA/X3uOwRHqke/WO90hfKJDv1OFU2sksBUuw/hVCuTXXtqT9mxtcBvKijVlAKkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65ax97/pebR+MS86v50PBgE5KxWAK0KxjiLYVPLgJmM=;
 b=Ev1lxP7RSJdqF3Y+5LYb91d/es6/8Z4ld2qShp/xLC1TUNj4UMk3PCMT881bsURBV1shCblV451QKNeFBZ512Yrf3C79lMHO7FFNGLI1jJ6qAvLklA3Gn/JvrtrJoPqh2JgtQS5Nftt0jw0PCW5Tp0T3g2JctBsuPyXjrj5nkJFBz1mAkaUdBfHao5ozUPMsQaVVKd2/MBCDMVDnIuYjY/rEqXtLwwbb+2J2s8EKYCDKdjUm7DwnNTj9lxsDqLSoQyRJk/jo1wBzmY0+Px4BOuPQMadTsy2K7hv73lCvm0LA4x2q9LgbLgphFcp7Ns9glAz2uQ/eEHIcoVHiNJS4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65ax97/pebR+MS86v50PBgE5KxWAK0KxjiLYVPLgJmM=;
 b=Ftzba/v8Qsp6bVcnf9KZ79tQYwb7MIrYYkVmX0EEbHhsMJOR9xt0aHDoP0lTdy7p9ZntR6y+cIA6J0IxrJxYhjb6YQcUj+13+sWb8oHytjDQ3Eulak9ID6owL2t6T1iy1qzInJDLOK45yMjWjnw8ytW7go8LDx4ZATWC5sNxxfX8dG9KMvdHnJFZfYKIvCa/LKiXAzf65L+wceYojQOV6vhEzsRYOoj0/ID97edopilp/e6ldd39HlizK/9QaV8EDiM+pWhJtRqPEuNZGLXBW5FgGpx6YXiNCA0BpZgOg/6LvgNmArqx2ZIrimbe4xAsUmGJmS/fCu0lCYpK9k38mw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAXP287MB4201.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15c::8)
 by PN0P287MB0344.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 10:28:32 +0000
Received: from MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
 ([fe80::e287:463a:b296:eddf]) by MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
 ([fe80::e287:463a:b296:eddf%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 10:28:32 +0000
From: Akash Hadke <UpStream_IP-AH@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Akash Hadke <Akash.Hadke@bmwtechworks.in>,
	Akash Hadke <UpStream_IP-AH@bmwtechworks.in>
Subject: [scarthgap][PATCHv2] systemd: backport networkd route readiness fix from upstream
Date: Fri,  9 Oct 2026 15:58:05 +0530
Message-ID: <20261009102805.83893-1-UpStream_IP-AH@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN5P287CA0045.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::16) To MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:15c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXP287MB4201:EE_|PN0P287MB0344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0115bc00-de12-4235-4b92-08df25f01100
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|38350700014|6133799003|55112099003|10067099003|18002099003|3023799007|11063799006|260925022911599003|260925021911599003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	J76ULY1BHKyJsm7vrRxCMsiYCTDZeaONPOgYwej84+NkvLq8b2zQARlWNhTSijLQ4ma62Blb3wku9OAbyf9cFddwOsXhqYfBMF4r9sVRp1ov/xXNK1iGA3KHWnp5+UmyMTLwTDAwhcRhNCF5cwpW97kVpNJ++H0ECyjsEQNF/wlyIvSTAfV/Ap4cxZyAFlObWePXO0dAo4ocM8s2pMgImqSm37FK/9773igax57f9h3E/h2ZS/+GJaRCHDwyy50elvn2dBx1TyGZ5Bcov/7BatC5BsRPj7Soo7kiFcasHKrpxcTVm3PT2wAtmXo3bTUi9GI3w8tNJkMwoG8rSN7Fuzicq7/M/Fl2EYhlw7tb+eeM9uVEIqstEPqIH3h5enUMGeD9Sx2AjiCFG7WCX/NgM910vry6CDx/ehmRtgZGgMcOpMvOKF99Zf/wP2wNZVv629X45BS8KDxcYo9izBEujSmx19cGOBaboh+j7SU8efLgwP2cPXYQpMr/Q+3y+/PC7+TAcWCWcPNa/N71ELDtAs26wGcxCm8DZA6qTXsgb2MCfAMzGJq8LOUoXZupSbBzdyntA4w58LererbSU9Fi5oywGYY6sYPrWAJ9w+DDE5vrs5UQ+n8C6ppYdIOAyZG4xNaT9VHcIoTYrZwyzZ+VrXFEh2bQxxWytlbSUZv2osQIxf5eqIPuTg5PQl+QLxdb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4201.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(38350700014)(6133799003)(55112099003)(10067099003)(18002099003)(3023799007)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KMPs+T1TRgPrBpuiqTqO9aMHE97INRKT2P4U0gv89F6d1fRI//HrKzvuwPTs?=
 =?us-ascii?Q?m0SVUpdLos7PjV3VnUjm8MM8qmZFMh8ofwSuBaM1Q+RV1Pq7snvAZmnPuzAC?=
 =?us-ascii?Q?n5jSifmB14gidlSN1UPt3Tysj0JH3hy7/TXdCy1XGQ9ckAXlJypoTHD+wPhr?=
 =?us-ascii?Q?nzXRfJb91kM8WoR6nCrEBpPCGwRvBKPwKkzOB8I0+F6UAmOmLybocmcCNX25?=
 =?us-ascii?Q?LBtpqPD4lI44heYnUHWWdPpT0WQiSOvLkqcCiApJavdc/ivS675AiEViDB5s?=
 =?us-ascii?Q?8tr8GLkFtiqD4n3h/D2zvY5kWIXYUbNagdbOhdw9Q13OVy4D3lTZIIGeHOWV?=
 =?us-ascii?Q?Q3VB9roCKbDoXBjP+v+fq8Ff85ZLNHcn81VfYjbZPIgztlcsdBPKZLHyhVTd?=
 =?us-ascii?Q?N0aCEQO4qjAUKJ/XnrsTBbqeLxUfkr6bs+7YTP+2xfsS23vEiz6KM86RUpuN?=
 =?us-ascii?Q?DRPNZyziiBurz0OhN95/WY93X/PMYSr9ZQAjn5WtzHNtOMhB3Gz2EHg2crzt?=
 =?us-ascii?Q?hswrVRYHNWIL3IfjmD55sv95jSRTNRqnh5sjayj4An3XdsalPMiHd9m/DVxI?=
 =?us-ascii?Q?Nm1BVNqNJVBW09gC9SzbWH4YoDOJ2Qzrp7YNRZDxMiIPgsCVv+TeU9LeI30G?=
 =?us-ascii?Q?OxlHyiVB3sHo95q9oq5f5vB7FXqen3wilnrqc507mv0TJtu9qvp+blaAT6Zv?=
 =?us-ascii?Q?9p0CITyZ+L3zOpVRpGiRcHXFuc+OKN0gfIt9W+Rr9zN0e1+iMpYngaJccQ67?=
 =?us-ascii?Q?8cBG+VZ1KNjYRxvTeE34M78a3ZO/Wt4cUEMg1Mr2n7QmolWSuNQnr8Zz2dfj?=
 =?us-ascii?Q?Ciaf8SQcdj5eLHtENwYSDBXvN4kqsqJrxGnmbj4bVIfcqVj/eIF8MUsFVd1c?=
 =?us-ascii?Q?B4syO/5B7evh1lE8u+DztgoN943C82glU2qQnO9wXmiJwz9bkPCtyLvpkHRK?=
 =?us-ascii?Q?73NznRBzLmZnVWFLucnzQiCdaXArGbRTJQfkz4WsQ1Wj+W/E0a6zKncF2Yi1?=
 =?us-ascii?Q?YOozDRjZEV/YK1O62yv1nUCqjVUCPdNfOtCo50GckeXL8wCsT+xp+0rk3qPU?=
 =?us-ascii?Q?M4mYTBaZUcDLT0lf3PWbOAKyFLaqp49FDYlu6azCmAULg6GsRG+0Svvwb9Sw?=
 =?us-ascii?Q?jn3qB35z0fjGJE3pYdVvcYI9wJdwcav/kuhiiIdf5dnBjKD/8d8A2PhhsWq9?=
 =?us-ascii?Q?JzRfIHAn0nY/lx/l+yTAgmgvxicI9ZIkxe676t/9p91Zg2R6kAVj+oSK4+5n?=
 =?us-ascii?Q?HSYULZvAhUrjpxby5sv8sAaEodUfKaLVzSH3bx5LUQJSnpp+u3nizHAvtuSz?=
 =?us-ascii?Q?rdGEE7AJLdxoY5WBdRcIllMjhTVOmLRe0qM3vHaHqz35kd2+YQWpueuvhEmo?=
 =?us-ascii?Q?c3o1V1CrNSNadk63wz5KVxn6pNzb4XcuPWgehGxbhq0jZcyYJIWoLg6xUNlA?=
 =?us-ascii?Q?7l1G99WWC9z461wjMTA/Z9mpYtBFUG7fkQH9l0XrvRJunLUu1U9PIYkGCOiJ?=
 =?us-ascii?Q?YlTQT1EXjDDN0C+aSEgSztAL/9nncq4nJ9FO5d1NVy1ouNx2eyKJXpBRFIZA?=
 =?us-ascii?Q?uPhLYsUR5UJYqj7XP4ah9AANexd8ctKGDvO4qnME6m8NB4IB4BxlP5BrLXEy?=
 =?us-ascii?Q?3/a83s9RvDOEmQg7KQIcixAzhABxxW/1xVqAeyc9f1JLyX+WhjRDqQVoQBzV?=
 =?us-ascii?Q?1N3HO0OQ3jpGZODZizD+ES7QFqxEkWdqcWdEZfai8rrbl/WrFtAifZlNpuoA?=
 =?us-ascii?Q?9RdTqITzziYcl25M9MHOWICJNT+ltCI=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 0115bc00-de12-4235-4b92-08df25f01100
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4201.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 10:28:31.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6gw0Q5LoarczndDT1IBY18iPrr7vyh36ZNF2Zn5Q2r9X9dhu3UawuwrGpVpBJJVMrVYnBb00nfZq0N3sZVD+qCf+H/Iys8w3TM30Q0a4ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0344
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 12:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247474

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
 ...introduce-link_is_up-helper-function.patch | 167 ++++++++++++++++++
 ...-gateway-is-ready-only-when-the-next.patch |  74 ++++++++
 ...und-to-a-link-requires-the-link-is-u.patch |  59 +++++++
 ...etwork-add-test-case-for-issue-40106.patch | 120 +++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |   4 +
 5 files changed, 424 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-network-introduc=
e-link_is_up-helper-function.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0024-network-check-if=
-gateway-is-ready-only-when-the-next.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0025-network-route-bo=
und-to-a-link-requires-the-link-is-u.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0026-test-network-add=
-test-case-for-issue-40106.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-network-introduce-link_=
is_up-helper-function.patch b/meta/recipes-core/systemd/systemd/0023-networ=
k-introduce-link_is_up-helper-function.patch
new file mode 100644
index 0000000000..45f2733b50
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-network-introduce-link_is_up-h=
elper-function.patch
@@ -0,0 +1,167 @@
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
+ src/network/networkd-nexthop.c |  2 +-
+ src/network/networkd-setlink.c |  9 ++++-----
+ 4 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
+index b0e416710e..c0481251c7 100644
+--- a/src/network/networkd-link.c
++++ b/src/network/networkd-link.c
+@@ -726,7 +726,6 @@ int link_ipv6ll_gained(Link *link) {
+=20
+ int link_handle_bound_to_list(Link *link) {
+         bool required_up =3D false;
+-        bool link_is_up =3D false;
+         Link *l;
+=20
+         assert(link);
+@@ -737,18 +736,15 @@ int link_handle_bound_to_list(Link *link) {
+         if (hashmap_isempty(link->bound_to_links))
+                 return 0;
+=20
+-        if (link->flags & IFF_UP)
+-                link_is_up =3D true;
+-
+         HASHMAP_FOREACH(l, link->bound_to_links)
+                 if (link_has_carrier(l)) {
+                         required_up =3D true;
+                         break;
+                 }
+=20
+-        if (!required_up && link_is_up)
++        if (!required_up && link_is_up(link))
+                 return link_request_to_bring_up_or_down(link, /* up =3D *=
/ false);
+-        if (required_up && !link_is_up)
++        if (required_up && !link_is_up(link))
+                 return link_request_to_bring_up_or_down(link, /* up =3D *=
/ true);
+=20
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
+=20
++bool link_is_up(Link *link) {
++        assert(link);
++        return FLAGS_SET(link->flags, IFF_UP);
++}
++
+ static int link_update_flags(Link *link, sd_netlink_message *message) {
+         bool link_was_admin_up, had_carrier;
+         uint8_t operstate;
+@@ -1930,7 +1931,7 @@ static int link_update_flags(Link *link, sd_netlink_=
message *message) {
+                         log_link_debug(link, "Unknown link flags lost, ig=
noring: %#.5x", unknown_flags_removed);
+         }
+=20
+-        link_was_admin_up =3D link->flags & IFF_UP;
++        link_was_admin_up =3D link_is_up(link);
+         had_carrier =3D link_has_carrier(link);
+=20
+         link->flags =3D flags;
+@@ -1938,13 +1939,13 @@ static int link_update_flags(Link *link, sd_netlin=
k_message *message) {
+=20
+         link_update_operstate(link, true);
+=20
+-        if (!link_was_admin_up && (link->flags & IFF_UP)) {
++        if (!link_was_admin_up && link_is_up(link)) {
+                 log_link_info(link, "Link UP");
+=20
+                 r =3D link_admin_state_up(link);
+                 if (r < 0)
+                         return r;
+-        } else if (link_was_admin_up && !(link->flags & IFF_UP)) {
++        } else if (link_was_admin_up && !link_is_up(link)) {
+                 log_link_info(link, "Link DOWN");
+=20
+                 r =3D link_admin_state_down(link);
+diff --git a/src/network/networkd-link.h b/src/network/networkd-link.h
+index 938bbf482e..b0bce5b044 100644
+--- a/src/network/networkd-link.h
++++ b/src/network/networkd-link.h
+@@ -234,6 +234,7 @@ static inline bool link_has_carrier(Link *link) {
+         return netif_has_carrier(link->kernel_operstate, link->flags);
+ }
+=20
++bool link_is_up(Link *link);
+ bool link_ipv6_enabled(Link *link);
+ int link_ipv6ll_gained(Link *link);
+ bool link_has_ipv6_connectivity(Link *link);
+diff --git a/src/network/networkd-nexthop.c b/src/network/networkd-nexthop=
.c
+index e2ded28197..7f4dbfe75d 100644
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -526,7 +526,7 @@ static bool nexthop_is_ready_to_configure(Link *link, =
const NextHop *nexthop) {
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
+index 011ea1fe6e..e6562b9ad2 100644
+--- a/src/network/networkd-setlink.c
++++ b/src/network/networkd-setlink.c
+@@ -486,7 +486,7 @@ static int link_is_ready_to_set_link(Link *link, Reque=
st *req) {
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
+@@ -550,7 +550,7 @@ static int link_is_ready_to_set_link(Link *link, Reque=
st *req) {
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
+@@ -649,8 +649,7 @@ int link_request_to_set_addrgen_mode(Link *link) {
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
+@@ -1142,7 +1141,7 @@ static bool link_is_ready_to_bring_up_or_down(Link *=
link, bool up) {
+                 if (link_get_by_index(link->manager, link->dsa_master_ifi=
ndex, &master) < 0)
+                         return false;
+=20
+-                if (!FLAGS_SET(master->flags, IFF_UP))
++                if (!link_is_up(master))
+                         return false;
+         }
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd/0024-network-check-if-gatewa=
y-is-ready-only-when-the-next.patch b/meta/recipes-core/systemd/systemd/002=
4-network-check-if-gateway-is-ready-only-when-the-next.patch
new file mode 100644
index 0000000000..e749b7c723
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-network-check-if-gateway-is-re=
ady-only-when-the-next.patch
@@ -0,0 +1,74 @@
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
+ src/network/networkd-nexthop.c | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/src/network/networkd-nexthop.c b/src/network/networkd-nexthop=
.c
+index 7f4dbfe75d..4f6847a2e8 100644
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -520,17 +520,28 @@ static bool nexthop_is_ready_to_configure(Link *link=
, const NextHop *nexthop) {
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
+@@ -552,7 +563,7 @@ static bool nexthop_is_ready_to_configure(Link *link, =
const NextHop *nexthop) {
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
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd/0025-network-route-bound-to-=
a-link-requires-the-link-is-u.patch b/meta/recipes-core/systemd/systemd/002=
5-network-route-bound-to-a-link-requires-the-link-is-u.patch
new file mode 100644
index 0000000000..d33ec51f78
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0025-network-route-bound-to-a-link-=
requires-the-link-is-u.patch
@@ -0,0 +1,59 @@
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
+ src/network/networkd-nexthop.c    | 4 ----
+ src/network/networkd-route-util.c | 6 ++++++
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/network/networkd-nexthop.c b/src/network/networkd-nexthop=
.c
+index 4f6847a2e8..2e84dc9a43 100644
+--- a/src/network/networkd-nexthop.c
++++ b/src/network/networkd-nexthop.c
+@@ -530,10 +530,6 @@ static bool nexthop_is_ready_to_configure(Link *link,=
 const NextHop *nexthop) {
+=20
+         /* Simple nexthop */
+         if (nexthop_owned_by_link(nexthop)) {
+-                if (link->set_flags_messages > 0)
+-                        return false;
+-                if (!link_is_up(link))
+-                        return false;
+                 return gateway_is_ready(link, FLAGS_SET(nexthop->flags, R=
TNH_F_ONLINK), nexthop->family, &nexthop->gw);
+         }
+=20
+diff --git a/src/network/networkd-route-util.c b/src/network/networkd-rout=
e-util.c
+index d49a0b9512..7369237770 100644
+--- a/src/network/networkd-route-util.c
++++ b/src/network/networkd-route-util.c
+@@ -128,6 +128,12 @@ bool gateway_is_ready(Link *link, bool onlink, int fa=
mily, const union in_addr_u
+         assert(link);
+         assert(link->manager);
+=20
++        if (link->set_flags_messages > 0)
++                return false;
++
++        if (!link_is_up(link))
++                return false;
++
+         if (onlink)
+                 return true;
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd/0026-test-network-add-test-c=
ase-for-issue-40106.patch b/meta/recipes-core/systemd/systemd/0026-test-net=
work-add-test-case-for-issue-40106.patch
new file mode 100644
index 0000000000..9ef3e89c48
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0026-test-network-add-test-case-for=
-issue-40106.patch
@@ -0,0 +1,120 @@
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
+index 0000000000..08553b97f5
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
+index 0000000000..c40e7b755a
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
+index 0000000000..442cf480fb
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
+index 2a92af123b..e3b691e684 100755
+--- a/test/test-network/systemd-networkd-tests.py
++++ b/test/test-network/systemd-networkd-tests.py
+@@ -3402,6 +3402,47 @@ class NetworkdNetworkTests(unittest.TestCase, Utili=
ties):
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
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-cor=
e/systemd/systemd_255.22.bb
index e5a0fd9170..ad55acdbb6 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -37,6 +37,10 @@ SRC_URI +=3D " \
            file://CVE-2026-29111-02.patch \
            file://CVE-2026-29111-03.patch \
            file://CVE-2026-29111-04.patch \
+           file://0023-network-introduce-link_is_up-helper-function.patch =
\
+           file://0024-network-check-if-gateway-is-ready-only-when-the-nex=
t.patch \
+           file://0025-network-route-bound-to-a-link-requires-the-link-is-=
u.patch \
+           file://0026-test-network-add-test-case-for-issue-40106.patch \
            "
=20
 # patches needed by musl
--=20
2.43.0


