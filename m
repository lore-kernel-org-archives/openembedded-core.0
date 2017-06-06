Return-Path: <jan.kiszka@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 95C5B780D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 10:31:07 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v56AV9g9003003
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 12:31:09 +0200
Received: from md1f2u6c.ww002.siemens.net ([146.254.78.13])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v56AV8u3026179
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 12:31:08 +0200
Resent-From: Jan Kiszka <jan.kiszka@siemens.com>
Resent-To: openembedded-core@lists.openembedded.org
Resent-Date: Tue, 6 Jun 2017 12:31:08 +0200
Resent-Message-ID: <a54f7524-ef65-7527-c862-412424bd6a24@siemens.com>
Resent-User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1
	Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
To: <openembedded-core@lists.openembedded.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
Date: Tue, 6 Jun 2017 12:17:56 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Fun with npm shrinkwrap
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
X-List-Received-Date: Tue, 06 Jun 2017 10:31:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

devtool add / recipetool create do not work properly /wrt shrinkwrap
when it comes to node-red-node-serialport. npm shrinkwrap finds a number
of extraneous packages and refuses to generate an output.

There are various workarounds discussed in [1]. For me this seems to
work:

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index cb8f338b8b..8ce952bb4c 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -68,6 +68,8 @@ class NpmRecipeHandler(RecipeHandler):
     def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before, d):
         try:
             runenv = dict(os.environ, PATH=d.getVar('PATH'))
+            bb.process.run('rm -rf node_modules', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
+            bb.process.run('npm install', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
             bb.process.run('npm shrinkwrap', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
         except bb.process.ExecutionError as e:
             logger.warn('npm shrinkwrap failed:\n%s' % e.stdout)


But it may have unwanted side effects. So, what would be the proper way
to address this issue?

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux

