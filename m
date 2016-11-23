Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id DE9F171A8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:47:19 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id f82so10031924wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ppTmI/zi49O5hi/HYvififvHF3CBzpC1QaRKarorsIU=;
	b=FfexVA5UUV44cbZItxxjZKQic/LUi/hISescJBhpmnHPDo/68Tfl/xNlu7z7FtcMdW
	0F+rKrWLKBdjxEwZAo9Z2gYbYfjXWW/zh+xEYWnNYciAKTUe1vx8LKHTNI4jVjDQEXoB
	kpCs8kvv1B+MzrpySXetMMAtmwZ1Gzq1VgGvmQ2nHPiaEkLWUReAdJO8Wngs40qoHvmZ
	EDRvqnezyEsZXlqaq0PhZ522OIdcgSSY6UDfhCvtLdK6zi+XppGo9ZW9nhi4Osxh4pTK
	kPtOT3c6sGlhustE2CsELrxqVy5MQ6IS33M+ERs3wwZne2VSDSR+71tKknQZ2yYXd9nG
	XLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ppTmI/zi49O5hi/HYvififvHF3CBzpC1QaRKarorsIU=;
	b=Or74t8dKoMOBpmNJYep3DALcLXhtqt4EYzEWpg/L5zd7OHsjuOJ+yvn2qaRL76wcKb
	U7e5ZkVTaHTJ7PrDOX/lQb9BNCeVagQkRc47mU65MAM2fFiY5KPzZPbXnWjXCN2gRQzZ
	SsP29sjxngqJqBMgw0pHmQXH0+Bn3q0UfJ9GfKotrS7hQ9g71A4PpMHrIBouGF7AibMD
	+ZcZnVVjSK2v6hrTmNyEZ8Ah6hTMpzADZIkOzBudwq6NGNU12R8HHCqlg3lVSDljkFH8
	m8wYWEfPrmL3EhCwDIkqzT5EVNEhthHn/Qw2rHAxF74knmBRSrPgA+NUlNnV2hKUG07O
	sevA==
X-Gm-Message-State: AKaTC00ALSPNPK2Or1Q19bsCQUhnPvk307qTJH1EVz7zkZCR3Eq/7pMcRM1aCmJL0CBrTw==
X-Received: by 10.25.162.79 with SMTP id l76mr404858lfe.14.1479887240689;
	Tue, 22 Nov 2016 23:47:20 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	f25sm6988635lji.47.2016.11.22.23.47.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:47:20 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 08:46:28 +0100
Message-Id: <b2eab9f7415c66ae0e2b297a3875cdf75f281d43.1479887010.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 2/7] oeqa/utils/commands.py: allow use of binaries from native sysroot
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
X-List-Received-Date: Wed, 23 Nov 2016 07:47:20 -0000

Tests may need to run a native tool that is not available on the host
filesystem, but can be built using one of the *-native recipes. In such case,
the tool will be available in native sysroot, and running in from that location
will require adjustments to PATH.

runCmd() can now take a path to native sysroot as one of its arguments and
setup PATH accordingly.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/utils/commands.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 5cd0f7477baa5bb45f2b2b5b93fb1ff0efd02923..657c9dba34ea9d42aa416f3b889f4b04129e8da9 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -97,9 +97,16 @@ class Result(object):
     pass
 
 
-def runCmd(command, ignore_status=False, timeout=None, assert_error=True, **options):
+def runCmd(command, ignore_status=False, timeout=None, assert_error=True, native_sysroot=None, **options):
     result = Result()
 
+    if native_sysroot:
+        extra_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin" % \
+                      (native_sysroot, native_sysroot, native_sysroot)
+        nenv = dict(options.get('env', os.environ))
+        nenv['PATH'] = extra_paths + ':' + nenv.get('PATH', '')
+        options['env'] = nenv
+
     cmd = Command(command, timeout=timeout, **options)
     cmd.run()
 
-- 
2.5.0


