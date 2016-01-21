Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id DE84B731F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 12:23:29 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id ik10so122407258igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 04:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=E2wtpqesDD7UdNmdv+hiyJjUOVtcwO31A7r0WGpSm4Q=;
	b=baV25jU4zKEZNaH3gmVjSil8jUC/tsu0ndpmeLE7/IHyOTVKInZ0tYyZgJ4t2SghPA
	uF6oS2s16v9mpxATGtHOaPBCIlwxikCUOPxpbEb/Kx7pj75JOwhICntpcscqZKMFrd82
	gLt40v+/PdgIfYQJBG3gA/WrRI0vPPs+WYiaGEerlveUxhI5etos5E56g4cxPkdEQqzz
	fi4/0pB76rJZorSKY5E5RbH9fU7e455ElAHZDWdC/bBPxtGQKDQ2F448qKzknMq+IiXz
	Msc9h16PVXVBTUymJhnJhbhFJ0aXmbZb13irczlKSU4u1JaAwR3KR4oegWapc/ucfGfR
	VXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E2wtpqesDD7UdNmdv+hiyJjUOVtcwO31A7r0WGpSm4Q=;
	b=bZSWRL/i1lwDGx7+RNAe/Ttlrs0Ei+lSVl9tt8emU/xL2fat4g6lzgsXkHLle1FO8q
	UidLToocGhAk9++I3JTJS2d1kBGh15pYFySm81nxVKCBFbVBBAv3VTj99TJp6cCN6cQw
	mzwV2nqJ41Lb2AYzdyvuqPNeUAJ5fYJ+stsBfYnuht6CmERICxq7tqL47KW4WQ+Od3tS
	4h4/Uhsxe6S4VTdVXzGTEJIlPDANMiFI4G8BuQYARJptretetHquGH23sCxvIllhGbxb
	lWxwIP06ScX2HQddkMhI4MS8E1GwUwKXqXf8mJU7DA1wMZJACsJtOo3Q7rsMrxEHIUTU
	a1SA==
X-Gm-Message-State: AG10YORaRiDpg2JWroxRmzIXayYYif++beU63hEuyHebTq4/E6gUpAZjlWMWFRsAKaObv+Yb
X-Received: by 10.50.155.43 with SMTP id vt11mr9186558igb.6.1453379010036;
	Thu, 21 Jan 2016 04:23:30 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8CCD1.dip0.t-ipconnect.de.
	[93.232.204.209]) by smtp.gmail.com with ESMTPSA id
	o80sm1051864ioe.15.2016.01.21.04.23.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 04:23:28 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 14:23:21 +0100
Message-Id: <1453382601-26628-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image.bbclass: support TMPDIR/DATETIME inside complex variables
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
X-List-Received-Date: Thu, 21 Jan 2016 12:23:30 -0000

Not replacing TMPDIR at all (from in OE-core:a8c377beadb85b0ff50)
led to an expansion error when INITRD needs to passed to the image command:
   ERROR: ExpansionError during parsing ....bb: Failure expanding variable INITRD, expression was ${@bb.utils.contains('MACHINE_FEATURES', 'intel-ucode', '${TMPDIR}/deploy/images/intel-corei7-64/microcode.cpio ', '', d)}

That's because the replacement of ${@ stops at the curly brackets after
TMPDIR, leading to an incomplete Python expression. The right solution
would be to enhance bitbake's data_smart.py such that it does not rely
on a regular expression to find the matching closing bracket.

But that is a performance sensitive area that will need good testing,
so as a temporary workaround for image creation, variable references
to DATETIME and TMPDIR get expanded to ___DATETIME___
resp. ___TMPDIR___ (special strings which are unlikely to be used but
are valid when inserted into a shell command; <<TMPDIR>> for example
did not work because the temporary image command was getting parsed as
shell script) and then turned back into the original variable
references, which is how the code worked before this change.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image.bbclass | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3870516..e5d1eb4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -348,6 +348,8 @@ python () {
 
     maskedtypes = (d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
 
+    import re
+    undovarset = re.compile(r'___(DATETIME|TMPDIR)___')
     for t in basetypes:
         vardeps = set()
         cmds = []
@@ -366,12 +368,18 @@ python () {
         localdata.setVar('OVERRIDES', '%s:%s' % (realt, old_overrides))
         bb.data.update_data(localdata)
         localdata.setVar('type', realt)
-        # Delete DATETIME so we don't expand any references to it now
+        # Expand DATETIME to a fixed value that we will replace with the
+        # real value later. In particular we have to get rid of the brackets,
+        # because keeping ${DATETIME} and ${TMPDIR} unchanged leads to parse
+        # errors when expanding the outer expression (like ${@ .... '${TMPDIR}/...' })
+        # variables are used inside more complex strings. The temporary
+        # replacement must be a valid path name, otherwise parsing
+        # the shell script where it gets embedded fails.
         # This means the task's hash can be stable rather than having hardcoded
         # date/time values. It will get expanded at execution time.
         # Similarly TMPDIR since otherwise we see QA stamp comparision problems
-        localdata.delVar('DATETIME')
-        localdata.delVar('TMPDIR')
+        localdata.setVar('DATETIME', '___DATETIME___')
+        localdata.setVar('TMPDIR', '___TMPDIR___')
 
         image_cmd = localdata.getVar("IMAGE_CMD", True)
         vardeps.add('IMAGE_CMD_' + realt)
@@ -399,7 +407,10 @@ python () {
 
         t = t.replace("-", "_")
 
-        d.setVar('do_image_%s' % t, '\n'.join(cmds))
+        # Undo the temporary replacement and insert the variable references again.
+        doimage = '\n'.join(cmds)
+        doimage = undovarset.sub(r'${\1}', doimage)
+        d.setVar('do_image_%s' % t, doimage)
         d.setVarFlag('do_image_%s' % t, 'func', '1')
         d.setVarFlag('do_image_%s' % t, 'fakeroot', '1')
         d.setVarFlag('do_image_%s' % t, 'prefuncs', debug + 'set_image_size')
-- 
2.1.4


