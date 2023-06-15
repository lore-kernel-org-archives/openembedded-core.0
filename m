Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF24AC0015E
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:44:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.15965.1686829456977208882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=dFThjLP8;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f8c65020dfso19129925e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686829455; x=1689421455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkyB1q3oemdoRhfPq33taB4GxAmDmAqUh+hV72+zXFs=;
        b=dFThjLP8hTCJeEWIlgAPmeGCYBfUjS+EjgM8t4U0ELfLamNGxBcDGr/yijx8fa2/2m
         2uSlD45QLibOXpsVhh71F9U7wn505Vic3h6dhju6Bf3h8JNTdqJfxApeqLyJLn0y+Zt3
         3ohsEy2ZY6jnN7lEc8hhDZ+dYC1aq90AZs5uG6b+dXT8VFHVSNwxkT6NLseoMK+2dS/h
         8Bnp1rdtZILIu0BC1PPm4PMWqCeVPhG2rcHrIMlP36MUxYg874ocbfTCpt+6+34NJMof
         /cXZ/H8snP3aEp+LvAlCpttJfpOn17lDDnhocg8I75UFdB0d5nXfZ1Az1WTbAAek0MBN
         HLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686829455; x=1689421455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkyB1q3oemdoRhfPq33taB4GxAmDmAqUh+hV72+zXFs=;
        b=YVOnnq2TaYA6PFnUzd1LETio3JV2FECTUaGtRLktDmxPsUoiYwdCsmKBRktb9jXLrv
         0uHdtgLVwlJjD6s9BwsRQU4LWYGfFEOPUtxjdYAapU8S/bBC963/qOjvRbvJLOKaeUZt
         aQsY60SHIIejEhsVso0F+YJ9QGTZ4UaiG9lV1TCXg4OiD0eermUvBtKfbQV3fulqwNhO
         jlx9WGB3WAFeapI0AOcQX5mbPvaV6WThKEUPj25uGAbRBhpp5GjOstbKgBJ2RTXhd2oz
         Bx1UqwjouijM4JOLBU8t6ltEg8iGXrG5c/znp3F2HEHyiCmtrwdCNWNl53huXnpi7SKG
         aeaA==
X-Gm-Message-State: AC+VfDyibsc5k/3pNMr6WOy7f6rs3yofQQVtMFqSXdpRK9Ls7zbUNmkS
	1kgazDOiQ5Sgm2Osf0fo5DQvg3Ng8CxIBTntdHA=
X-Google-Smtp-Source: ACHHUZ4JgTWPRKiPzKECIzL+pdrPFThE4KDtbzuuA9vJ4v0E/4E2pSAtGgkBUj61vb3lQaEi3M0oBA==
X-Received: by 2002:a5d:4406:0:b0:30f:c21c:b9b5 with SMTP id z6-20020a5d4406000000b0030fc21cb9b5mr9032317wrq.50.1686829455053;
        Thu, 15 Jun 2023 04:44:15 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b0030fae360f14sm15429154wru.68.2023.06.15.04.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:44:14 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
Date: Thu, 15 Jun 2023 13:43:53 +0200
Subject: [PATCH 1/3] rootfs-postcommands: change sysusers.d command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230613-sysusersd-v1-1-eaddf3179773@baylibre.com>
References: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
In-Reply-To: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <lrannou@baylibre.com>, anuj.mittal@intel.com
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686829453; l=8618;
 i=lrannou@baylibre.com; s=20230614; h=from:subject:message-id;
 bh=8WGQIzyev+bL5neaYQyqs3q4EWu4+PZIKwlcqrqFgmg=;
 b=Kky71Li3Zk3oYQCXQC/ORYI6mGVDHJQIz9mcwzRQ0vCFwQZSlhOzzOGfc7d0YKwjx3nC42Bfj
 Wy71ZVUrKmVCSRC8VhgjmE+VDL8oMWIylWGAZHDroAgazOQflXfA6Jt
X-Developer-Key: i=lrannou@baylibre.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 11:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182848

The configuration in sysusers.d used to be parsed to create users/groups at
build time instead at runtime. This was leading to several conflicts with
users/groups defined in base-passwd recipe and specific definitions in recipes
inheriting the useradd class. Some of those conflicts raised unseen errors in
the do_rootfs command's logs.

As an example, the root home directory is set by default to `/home/root` but
systemd expects it as `/root`.

The new command `systemd_sysusers_check` checks each configuration for
users/groups and compare their properties to what is actually defined in the
`/etc/passwd` and `/etc/group` of the target rootfs.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 133 +++++++++++++++++++-----
 1 file changed, 109 insertions(+), 24 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 690fa976aa..652601b95f 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -43,7 +43,7 @@ ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
 SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ], "graphical.target", "multi-user.target", d)}'
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_create_users;", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; systemd_sysusers_check;", "", d)}'
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
@@ -69,29 +69,114 @@ python () {
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
 }
 
-systemd_create_users () {
-	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/*.conf; do
-		[ -e $conffile ] || continue
-		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
-		if [ "$type" = "u" ]; then
-			useradd_params="--shell /sbin/nologin"
-			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
-			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
-			useradd_params="$useradd_params --system $name"
-			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
-		elif [ "$type" = "g" ]; then
-			groupadd_params=""
-			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
-			groupadd_params="$groupadd_params --system $name"
-			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
-		elif [ "$type" = "m" ]; then
-			group=$id
-			eval groupadd --root ${IMAGE_ROOTFS} --system $group || true
-			eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system $name --no-user-group || true
-			eval usermod --root ${IMAGE_ROOTFS} -a -G $group $name
-		fi
-		done
-	done
+# Resolve the ID as described in the sysusers.d(5) manual: ID can be a numeric
+# uid, a couple uid:gid or uid:groupname or it is '-' meaning leaving it
+# automatic or it can be a path. In the latter, the uid/gid matches the
+# user/group owner of that file.
+def resolve_sysusers_id(d, sid):
+    # If the id is a path, the uid/gid matchs to the target's uid/gid in the
+    # rootfs.
+    if '/' in sid:
+        try:
+            osstat = os.stat(os.path.join(d.getVar('IMAGE_ROOTFS'), sid))
+        except FileNotFoundError:
+            bb.error('sysusers.d: file %s is required but it does not exist in the rootfs', sid)
+            return ('-', '-')
+        return (osstat.st_uid, osstat.st_gid)
+    # Else it is a uid:gid or uid:groupname syntax
+    if ':' in sid:
+        return sid.split(':')
+    else:
+        return (sid, '-')
+
+# Check a user exists in the rootfs password file and return its properties
+def check_user_exists(d, uname=None, uid=None):
+    with open(os.path.join(d.getVar('IMAGE_ROOTFS'), 'etc/passwd'), 'r') as pwfile:
+        for line in pwfile:
+            (name, _, u_id, gid, comment, homedir, ushell) = line.strip().split(':')
+            if uname == name or uid == u_id:
+                return (name, u_id, gid, comment or '-', homedir or '/', ushell or '-')
+    return None
+
+# Check a group exists in the rootfs group file and return its properties
+def check_group_exists(d, gname=None, gid=None):
+    with open(os.path.join(d.getVar('IMAGE_ROOTFS'), 'etc/group'), 'r') as gfile:
+        for line in gfile:
+            (name, _, g_id, _) = line.strip().split(':')
+            if name == gname or g_id == gid:
+                return (name, g_id)
+    return None
+
+def compare_users(user, e_user):
+    # user and e_user must not have None values. Unset values must be '-'.
+    (name, uid, gid, comment, homedir, ushell) = user
+    (e_name, e_uid, e_gid, e_comment, e_homedir, e_ushell) = e_user
+    # Ignore 'uid', 'gid' or 'comment' if they are not set
+    # Ignore 'shell' and 'ushell' if one is not set
+    return name == e_name \
+        and (uid == '-' or uid == e_uid) \
+        and (gid == '-' or gid == e_gid) \
+        and (comment == '-' or e_comment == '-' or comment.lower() == e_comment.lower()) \
+        and (homedir == '-' or e_homedir == '-' or homedir == e_homedir) \
+        and (ushell == '-' or e_ushell == '-' or ushell == e_ushell)
+
+# Open sysusers.d configuration files and parse each line to check the users and
+# groups are already defined in /etc/passwd and /etc/groups with similar
+# properties. Refer to the sysusers.d(5) manual for its syntax.
+python systemd_sysusers_check() {
+    import glob
+    import re
+
+    pattern_comment = r'(-|\"[^:\"]+\")'
+    pattern_word    = r'[^\s]+'
+    pattern_line   = r'(' + pattern_word + r')\s+(' + pattern_word + r')\s+(' + pattern_word + r')(\s+' \
+        + pattern_comment + r')?' + r'(\s+(' + pattern_word + r'))?' + r'(\s+(' + pattern_word + r'))?'
+
+    for conffile in glob.glob(os.path.join(d.getVar('IMAGE_ROOTFS'), 'usr/lib/sysusers.d/*.conf')):
+        with open(conffile, 'r') as f:
+            for line in f:
+                line = line.strip()
+                if not len(line) or line[0] == '#': continue
+                ret = re.fullmatch(pattern_line, line.strip())
+                if not ret: continue
+                (stype, sname, sid, _, scomment, _, shomedir, _, sshell) = ret.groups()
+                if stype == 'u':
+                    if sid:
+                        (suid, sgid) = resolve_sysusers_id(d, sid)
+                        if sgid.isalpha():
+                            sgid = check_group_exists(d, gname=sgid)
+                        elif sgid.isdigit():
+                            check_group_exists(d, gid=sgid)
+                        else:
+                            sgid = '-'
+                    else:
+                        suid = '-'
+                        sgid = '-'
+                    scomment = scomment.replace('"', '') if scomment else '-'
+                    shomedir = shomedir or '-'
+                    sshell = sshell or '-'
+                    e_user = check_user_exists(d, uname=sname)
+                    if not e_user:
+                        bb.warn('User %s has never been defined' % sname)
+                    elif not compare_users((sname, suid, sgid, scomment, shomedir, sshell), e_user):
+                        bb.warn('User %s has been defined as (%s) but sysusers.d expects it as (%s)'
+                                % (sname, ', '.join(e_user),
+                                ', '.join((sname, suid, sgid, scomment, shomedir, sshell))))
+                elif stype == 'g':
+                    gid = sid or '-'
+                    if '/' in gid:
+                        (_, gid) = resolve_sysusers_id(d, sid)
+                    e_group = check_group_exists(d, gname=sname)
+                    if not e_group:
+                        bb.warn('Group %s has never been defined' % sname)
+                    elif gid != '-':
+                        (_, e_gid) = e_group
+                        if gid != e_gid:
+                            bb.warn('Group %s has been defined with id (%s) but sysusers.d expects gid (%s)'
+                                    % (sname, e_gid, gid))
+                elif stype == 'm':
+                    check_user_exists(d, sname)
+                    check_group_exists(d, sid)
 }
 
 #

-- 
2.41.0


