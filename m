Return-Path: <ian.ray@ge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E232C77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 18:17:58 +0000 (UTC)
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.149.52])
 by mx.groups.io with SMTP id smtpd.web11.41668.1686507471612602209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 11:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: ge.com, ip: 67.231.149.52, mailfrom: ian.ray@ge.com)
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
	by m0048274.ppops.net-00176a03. (8.17.1.19/8.17.1.19) with ESMTP id 35BIHpld044151
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 14:17:51 -0400
From: Ian Ray <ian.ray@ge.com>
To: openembedded-core@lists.openembedded.org
Cc: ian.ray@ge.com
Subject: [PATCH] systemd-systemctl: support instance expansion in WantedBy
Date: Sun, 11 Jun 2023 21:17:47 +0300
Message-Id: <20230611181747.30970-1-ian.ray@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-GUID: CHF6aQbCOFUIUvXPr7u2xRQi9TIjeA_l
X-Proofpoint-ORIG-GUID: CHF6aQbCOFUIUvXPr7u2xRQi9TIjeA_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-11_14,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306110169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 18:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182637

Refactor _process_deps to expand systemd instance specifier "%i" to the
template instance.

This change expands on prior commit e510222b57 ("systemd-systemctl: fix
instance template WantedBy symlink construction") by substituting every
"%i" pattern-match with the instance name.

The regexp handles the following cases:

* svc-wants@%i.service

* sys-subsystem-net-devices-%i.device

Signed-off-by: Ian Ray <ian.ray@ge.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index b45a2dc..514f747 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -201,13 +201,8 @@ class SystemdUnit():
         target = ROOT / location.relative_to(self.root)
         try:
             for dependent in config.get('Install', prop):
-                # determine whether or not dependent is a template with an actual
-                # instance (i.e. a '@%i')
-                dependent_is_template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", dependent)
-                if dependent_is_template:
-                    # if so, replace with the actual instance to achieve
-                    # svc-wants@a.service.wants/svc-wanted-by@a.service
-                    dependent = re.sub(dependent_is_template.group('instance'), instance, dependent, 1)
+                # expand any %i to instance (ignoring escape sequence %%)
+                dependent = re.sub("([^%](%%)*)%i", "\\1{}".format(instance), dependent)
                 wants = systemdir / "{}.{}".format(dependent, dirstem) / service
                 add_link(wants, target)
 
-- 
2.10.1


