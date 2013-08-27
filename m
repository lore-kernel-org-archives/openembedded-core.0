Return-Path: <Mikhail_Durnev@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A71AD6ABA5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 06:36:09 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VECsr-0004lc-6E from Mikhail_Durnev@mentor.com ;
	Mon, 26 Aug 2013 23:36:09 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 26 Aug 2013 23:36:08 -0700
Received: from [172.30.176.89] (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server (TLS) id 14.2.247.3;
	Mon, 26 Aug 2013 23:36:08 -0700
Message-ID: <521C48D3.3010901@mentor.com>
Date: Tue, 27 Aug 2013 17:36:03 +1100
From: Mikhail Durnev <Mikhail_Durnev@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <paul.eggleton@linux.intel.com>
X-OriginalArrivalTime: 27 Aug 2013 06:36:08.0856 (UTC)
	FILETIME=[B6D41980:01CEA2EF]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: classes/insane: add check for PN in OVERRIDES
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
X-List-Received-Date: Tue, 27 Aug 2013 06:36:09 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello Paul,

I have a question about your commit c331f0a:

-------------------------------------------
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4d2392e..fb18022 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -907,6 +907,11 @@ python () {
      if d.getVar('do_stage', True) is not None:
          bb.fatal("Legacy staging found for %s as it has a do_stage 
function. This will need conversion to a do_install or often simply 
removal to work with OE-core" % d.getVar("FILE", True))

+    overrides = d.getVar('OVERRIDES', True).split(':')
+    pn = d.getVar('PN', True)
+    if pn in overrides:
+        bb.warn('Recipe %s has PN of "%s" which is in OVERRIDES, this 
can result in unexpected behaviour.' % (d.getVar("FILE", True), pn))
+
      issues = []
      if (d.getVar('PACKAGES', True) or "").split():
          for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 
'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 
'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
----------------------------------------------

A recipe (lets say linux_git.bb) has its PN in OVERRIDES with prefix 
'pn-' (pn-linux). So, if we have 'linux' in OVERRIDES then it cannot 
interfere. Should we search for pn-${PN} instead? E.g.:

     overrides = d.getVar('OVERRIDES', True).split(':')
     pn = d.getVar('PN', True)
     if ("pn-%s" % pn) in overrides:
         bb.warn('Recipe %s has PN of "%s" which is in OVERRIDES, this 
can result in unexpected behaviour.' % (d.getVar("FILE", True), pn))

Thanks,
Mikhail

