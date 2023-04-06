Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B86C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:03:06 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.162569.1680796983156235941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5YDbMapk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id ml21so15700882pjb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796982; x=1683388982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BOIsCvrubmQ5Nr8+XgfBhrE+9kVoI3A+E0fcqwPPQI=;
        b=5YDbMapkYaFA5X+yRjW7Gn2Ep5PC2qnrJCt8iCKxRu2fzqiC0w8BEazao1q4fFiQVq
         zK9RPKJuIblE+o5kar9TsDWs7CDscgGWr8nE7elff/wzR15wncL1mxoT974RWMRNhaid
         5znSDK47jGa6MrM6IFmn6yFKwlxyRfIkl1meDqwBnNfURVG/iz07BxqdiuE8Vz8gymHm
         KpRzFRjZzJfMrhuWmcImjzB6frStO6EQlQFYBlsduPXPpau+7VhLaqvlKm+XPXeLlLKW
         2FTz4gcRInAiIMaByM2pJx8s9kBdgEpxArHvjrpde0srZoCmN43yi/k9R3qU1Fc2FR8o
         re/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796982; x=1683388982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BOIsCvrubmQ5Nr8+XgfBhrE+9kVoI3A+E0fcqwPPQI=;
        b=doSox+ZbEw0O+MobLF3ej0ObtkAgrrYWYjV3tWzlu4Vg0Oq/A6cKW+xoPgO81cIxSo
         ok0DkB56qeVg05Vjat1zLAvZW800O/WxgRhcoHOYwEVaT9ME8EDKc+hBpl9s+4uAAjxH
         +bkx6b/MJbeLV85T5PaymU/Z8UZltb3uSAj4bq4tkKYxgNFBDXr9WAyOA/JMEvvZyU2F
         z1yoI7NTc7G8M0U1dkB8KWUaurEweGjL4fHDb1Naku2PKnqGhOXsnEZsCtKHIfNa40Zw
         bvqbTGt9CUbpGdt/ip3hyLsnm0QI6bRusk43+TczJmYWzck4JqfRzt2/HpJtpaVHFNql
         HWbA==
X-Gm-Message-State: AAQBX9dvAVfydyZWwvdUulHVx6yKNAfak+p9kHxKoG8Vv1cFbY9hu0jR
	Q2aAj7vKu8NYDj9AodIBb59VNuyr6kBRXflnpZA=
X-Google-Smtp-Source: AKy350bEZcvaRi4bckC1AsioDd7AqN/b/1+Y5S2518HWbnRMdxAg+qpr1Z19ezKGqFYpCfb9yMzAsg==
X-Received: by 2002:a05:6a20:7523:b0:d3:9c13:606 with SMTP id r35-20020a056a20752300b000d39c130606mr2786244pzd.47.1680796982100;
        Thu, 06 Apr 2023 09:03:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.03.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:03:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/26] oeqa/runtime: clean up deprecated backslash expansion
Date: Thu,  6 Apr 2023 06:01:50 -1000
Message-Id: <bed045277b835d38048021e7ad158f27dd3ae9bb.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179801

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 77085a05240c3f8226b9f2199c977f2555807789)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/apt.py       | 4 ++--
 meta/lib/oeqa/runtime/cases/buildcpio.py | 7 +++++--
 meta/lib/oeqa/runtime/cases/systemd.py   | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 4e09374add..8000645843 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -39,9 +39,9 @@ class AptRepoTest(AptTest):
         self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s/all ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
 
     def setup_source_config_for_package_install_signed(self):
-        apt_get_source_server = 'http:\/\/%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
+        apt_get_source_server = 'http://%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
         apt_get_sourceslist_dir = '/etc/apt/'
-        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's/\[trusted=yes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
+        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's|\[trusted=yes\] http://bogus_ip:bogus_port|%s|g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
 
     def cleanup_source_config_for_package_install(self):
         apt_get_sourceslist_dir = '/etc/apt/'
diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index bd3b46d9ef..3728855d24 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -29,7 +29,10 @@ class BuildCpioTest(OERuntimeTestCase):
     @OEHasPackage(['autoconf'])
     def test_cpio(self):
         self.project.download_archive()
-        self.project.run_configure('--disable-maintainer-mode',
-                                   'sed -i -e "/char \*program_name/d" src/global.c;')
+        self.project.run_configure('--disable-maintainer-mode')
+        # This sed is needed until
+        # https://git.savannah.gnu.org/cgit/cpio.git/commit/src/global.c?id=641d3f489cf6238bb916368d4ba0d9325a235afb
+        # is in a release.
+        self.project._run(r'sed -i -e "/char \*program_name/d" %s/src/global.c' % self.project.targetdir)
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 720b4b517a..37f295492d 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -154,7 +154,7 @@ class SystemdJournalTests(SystemdTest):
         """
 
         # The expression chain that uniquely identifies the time boot message.
-        expr_items=['Startup finished', 'kernel', 'userspace','\.$']
+        expr_items=['Startup finished', 'kernel', 'userspace', r'\.$']
         try:
             output = self.journalctl(args='-o cat --reverse')
         except AssertionError:
-- 
2.34.1


