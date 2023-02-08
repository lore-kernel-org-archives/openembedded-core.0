Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F06C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:14:04 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.3059.1675840433859299209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kCi1/g7a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2023020807135034e53e6d088f8b5a47-rq2wme@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2023020807135034e53e6d088f8b5a47
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Feb 2023 08:13:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=p4izaTwuO7bb3QLhVToMyZz5CxYnhYzhugrV3sQ4NPk=;
 b=kCi1/g7aUi0+q5OuoEzy4S/Cm7WPa5VWXdt25e70XMZLnAZRNkQmDD1Fx+9ZxtmsRtlyWd
 bkKrwNhDiMAnGOhn2Ert36gZyyTV3eqgKafwbwPbWjzmyHZqkCDresE/FHYLNWHv2WDckE+k
 yCQw/Y1YemRCEq2TzGLC/9f+YONcY=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/3] systemd.bbclass: add non-recursive service packaging
Date: Wed,  8 Feb 2023 08:12:50 +0100
Message-Id: <20230208071251.5412-3-peter.marko@siemens.com>
In-Reply-To: <20230208071251.5412-1-peter.marko@siemens.com>
References: <20230208071251.5412-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176838

When service is split to separate package, it will take
all services it depends on. It does not matter is the dependency
is strong or week or if there is rdepends/rrecommends which would
be the proper way to pull it.

New variable SYSTEMD_PACKAGES_DONT_RECURSE allows to
skip this recursion for packages which are extracted to a package.
It is mostly useful for catch-all main package and splitting
additional packages with PACKAGE_BEFORE_PN.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 meta/classes-recipe/systemd.bbclass    | 15 ++++++++-------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 725f5c54cc..910b99aed2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8271,6 +8271,16 @@ system and gives an overview of their function and contents.
       :term:`SYSTEMD_PACKAGES`. Overrides not included in :term:`SYSTEMD_PACKAGES`
       will be silently ignored.
 
+   :term:`SYSTEMD_PACKAGES_DONT_RECURSE`
+      By default service files declared in :term:`SYSTEMD_SERVICE` are scanned
+      and all related service files are added to parsed package recursively.
+
+      It allows more readable and future-proof recipes, however it does not work well
+      when services are split to separate packages. This variable prevents this behavior.
+      Here is an example from systemd recipe::
+
+         SYSTEMD_PACKAGES_DONT_RECURSE:${PN}-networkd = "1"
+
    :term:`SYSVINIT_ENABLED_GETTYS`
       When using
       :ref:`SysVinit <dev-manual/new-recipe:enabling system services>`,
diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index f9c92e6c2a..c8cee482fe 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -124,19 +124,19 @@ python systemd_populate_packages() {
         return appended
 
     # Add systemd files to FILES:*-systemd, parse for Also= and follow recursive
-    def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
+    def systemd_add_files_and_parse(pkg_systemd, path, service, keys, recurse):
         # avoid infinite recursion
-        if systemd_append_file(pkg_systemd, oe.path.join(path, service)):
+        if systemd_append_file(pkg_systemd, oe.path.join(path, service)) and recurse:
             fullpath = oe.path.join(d.getVar("D"), path, service)
             if service.find('.service') != -1:
                 # for *.service add *@.service
                 service_base = service.replace('.service', '')
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys, recurse)
             if service.find('.socket') != -1:
                 # for *.socket add *.service and *@.service
                 service_base = service.replace('.socket', '')
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys)
-                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys, recurse)
+                systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys, recurse)
             for key in keys.split():
                 # recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
                 cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, shlex.quote(fullpath), key)
@@ -144,7 +144,7 @@ python systemd_populate_packages() {
                 line = pipe.readline()
                 while line:
                     line = line.replace('\n', '')
-                    systemd_add_files_and_parse(pkg_systemd, path, line, keys)
+                    systemd_add_files_and_parse(pkg_systemd, path, line, keys, recurse)
                     line = pipe.readline()
                 pipe.close()
 
@@ -157,6 +157,7 @@ python systemd_populate_packages() {
         keys = 'Also'
         # scan for all in SYSTEMD_SERVICE[]
         for pkg_systemd in systemd_packages.split():
+            recurse = False if d.getVar('SYSTEMD_PACKAGES_DONT_RECURSE:' + pkg_systemd) else True
             for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
                 path_found = ''
 
@@ -178,7 +179,7 @@ python systemd_populate_packages() {
                             break
 
                 if path_found != '':
-                    systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
+                    systemd_add_files_and_parse(pkg_systemd, path_found, service, keys, recurse)
                 else:
                     bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE:{1}. {2}".format(
                         service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
-- 
2.30.2


