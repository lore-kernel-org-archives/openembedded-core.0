Return-Path: <dev@codyps.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id C2BDA65C98
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Oct 2014 16:10:47 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id o8so204883qcw.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Oct 2014 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=R5OyJgmPnm3+obEW+HH7kmNjnj5E1LrflfSuGFfLiBs=;
	b=PSGRzemg58yybfkk4KBN4aBq15CEciVph+F5OfoYPYHl3vKk72EzAbbhB3z6INhLTE
	Fm/KHiFjQdDgpNzDa1kSI0vDeGTBrHS43aTveahIK5wPX089kvjcgBk5c0Mz6N/00c69
	gcO44ZPOEktm6sECkJq2mykWoOd5k1M3BY+Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R5OyJgmPnm3+obEW+HH7kmNjnj5E1LrflfSuGFfLiBs=;
	b=XgJeMIeSvhBeMpukYu2NqpBkUxlGFlRV9yzcpirWWqVNGIGNyv0J7A7QDVox1ryTOU
	p/MhvPRbFZ8AG/rel0/7oF2VuKXUV5CHOog2ywvEn62LXfRp0z7GYEfeDFLUmw2VVDxW
	6DwIUojopbYq4DhqrA0kfWeKJXx6oKVlVIeSuG+gNOd0jxvFHZZ00G4ylCKa7YCo+aQI
	/u3dmCyfMeJJHqtETlOQfXTPzZPDnZTZt1CxN8rCdglSjd5RsgXrV78KOXfU9IiEfkNs
	gzcqeRXkZ3xOFRJJckXHMqbUeNe4t0eILBvPXrvH3xVSUzFPbP1GOkpfGxbaqeq/NwJq
	cyoA==
X-Gm-Message-State: ALoCoQmKMSWB+6AoShwoBm+qgezwHHrcdQiEJJmWetStkfz/YZjPKPVnuViUbFNx2VDcUpc8C3BX
X-Received: by 10.224.4.72 with SMTP id 8mr17130659qaq.4.1414253447993;
	Sat, 25 Oct 2014 09:10:47 -0700 (PDT)
Received: from localhost ([2601:6:6b00:f9::fd8])
	by mx.google.com with ESMTPSA id u3sm6942045qat.27.2014.10.25.09.10.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Oct 2014 09:10:46 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Oct 2014 12:10:43 -0400
Message-Id: <1414253443-23679-1-git-send-email-dev@codyps.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] Avoid crashing if getgrnam() cannont find a group by the given name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Oct 2014 16:10:53 -0000

Without this, we get (on systems without a 'mail' group):

	ERROR: Error executing a python function in /home/x/g/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb:

	The stack trace of python calls that resulted in this exception/failure was:
	File: 'fixup_perms', lineno: 231, function: <module>
	     0227:                    each_file = os.path.join(root, f)
	     0228:                    fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
	     0229:
	     0230:
	 *** 0231:fixup_perms(d)
	     0232:
	File: 'fixup_perms', lineno: 173, function: fixup_perms
	     0169:                if len(lsplit) != 8 and not (len(lsplit) == 3 and lsplit[1].lower() == "link"):
	     0170:                    msg = "Fixup perms: %s invalid line: %s" % (conf, line)
	     0171:                    package_qa_handle_error("perm-line", msg, d)
	     0172:                    continue
	 *** 0173:                entry = fs_perms_entry(d.expand(line))
	     0174:                if entry and entry.path:
	     0175:                    fs_perms_table[entry.path] = entry
	     0176:            f.close()
	     0177:
	File: 'fixup_perms', lineno: 32, function: __init__
	  File "fixup_perms", line 32, in __init__

	File: 'fixup_perms', lineno: 44, function: _setdir
	  File "fixup_perms", line 44, in _setdir

	File: 'fixup_perms', lineno: 75, function: _procgid
	  File "fixup_perms", line 75, in _procgid

	Exception: KeyError: 'getgrnam(): name not found: mail'

	ERROR: Function failed: fixup_perms
	ERROR: Logfile of failure stored in: /home/x/obj/y/tmp/work/i586-poky-linux/linux-libc-headers/3.16-r0/temp/log.do_package.15841
	ERROR: Task 400 (/home/x/g/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.16.bb, do_package) failed with exit code '1'

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/classes/package.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2aec3e6..d7c970b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -568,7 +568,10 @@ python fixup_perms () {
             elif gid.isdigit():
                 return int(gid)
             else:
-                return grp.getgrnam(gid).gr_gid
+                try:
+                    return grp.getgrnam(gid).gr_gid
+                except Exception:
+                   return -1
 
         # Use for debugging the entries
         def __str__(self):
-- 
2.0.4


