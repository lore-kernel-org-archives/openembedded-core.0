Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50F8C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 06:59:46 +0000 (UTC)
Received: from webmail.gomspace.com (webmail.gomspace.com [79.171.149.170])
 by mx.groups.io with SMTP id smtpd.web11.13569.1682665182316127508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 23:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gomspace.com, ip: 79.171.149.170, mailfrom: mns@gomspace.com)
Received: from DK-AAL-EX02.gomspace.lan (10.0.1.86) by
 DK-AAL-EX02.gomspace.lan (10.0.1.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Apr 2023 08:59:40 +0200
Received: from mns-T460s.gomspace.lan (10.0.8.155) by DK-AAL-EX02.gomspace.lan
 (10.0.1.86) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 28 Apr 2023 08:59:40 +0200
From: Martin Siegumfeldt <mns@gomspace.com>
To: <openembedded-core@lists.openembedded.org>
CC: Martin Siegumfeldt <mns@gomspace.com>
Subject: [oe-core][master][PATCH 1/1] systemd-systemctl: fix instance template WantedBy symlink construction
Date: Fri, 28 Apr 2023 08:59:33 +0200
Message-ID: <20230428065933.3166992-2-mns@gomspace.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428065933.3166992-1-mns@gomspace.com>
References: <20230428065933.3166992-1-mns@gomspace.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EndpointSecurity-0xde81-EV: v:7.8.4.270, d:out, a:y, w:t, t:6, sv:1682623358, ts:1682665180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 06:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180507

Fix issue of the below instance template systemd service dependency

[Install]
WantedBy=3Dsvc-wants@%i.service

creating the symlink (instance "a" example)

/etc/systemd/system/svc-wants@%i.service.wants/svc-wanted-by@a.service

which should be

/etc/systemd/system/svc-wants@a.service.wants/svc-wanted-by@a.service

as implemented by this change.

The functionality appears regressed just after "thud" baseline when the
logic was refactored from shell script into python (commit
925e30cb104ece7bfa48b78144e758a46dc9ec3f)

Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
---
 .../systemd/systemd-systemctl/systemctl             | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/r=
ecipes-core/systemd/systemd-systemctl/systemctl
index cddae75a06..b45a2dc2f7 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -195,12 +195,19 @@ class SystemdUnit():
=20
         raise SystemdUnitNotFoundError(self.root, unit)
=20
-    def _process_deps(self, config, service, location, prop, dirstem):
+    def _process_deps(self, config, service, location, prop, dirstem, inst=
ance):
         systemdir =3D self.root / SYSCONFDIR / "systemd" / "system"
=20
         target =3D ROOT / location.relative_to(self.root)
         try:
             for dependent in config.get('Install', prop):
+                # determine whether or not dependent is a template with an=
 actual
+                # instance (i.e. a '@%i')
+                dependent_is_template =3D re.match(r"[^@]+@(?P<instance>[^=
\.]*)\.", dependent)
+                if dependent_is_template:
+                    # if so, replace with the actual instance to achieve
+                    # svc-wants@a.service.wants/svc-wanted-by@a.service
+                    dependent =3D re.sub(dependent_is_template.group('inst=
ance'), instance, dependent, 1)
                 wants =3D systemdir / "{}.{}".format(dependent, dirstem) /=
 service
                 add_link(wants, target)
=20
@@ -240,8 +247,8 @@ class SystemdUnit():
         else:
             service =3D self.unit
=20
-        self._process_deps(config, service, path, 'WantedBy', 'wants')
-        self._process_deps(config, service, path, 'RequiredBy', 'requires'=
)
+        self._process_deps(config, service, path, 'WantedBy', 'wants', ins=
tance)
+        self._process_deps(config, service, path, 'RequiredBy', 'requires'=
, instance)
=20
         try:
             for also in config.get('Install', 'Also'):
--=20
2.25.1


________________________
This email was scanned by Bitdefender

