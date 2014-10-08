Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D722871547
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 08:13:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s988DhWp001465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Oct 2014 01:13:43 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 01:13:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Oct 2014 01:13:41 -0700
Message-ID: <77997b348b8303409e9649c7c3c67e86247b0078.1412755931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412755931.git.liezhi.yang@windriver.com>
References: <cover.1412755931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] sstate.bbclass: the second bb.fatal not work
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
X-List-Received-Date: Wed, 08 Oct 2014 08:13:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The code:
bb.fatal("foo1")
bb.fatal("foo2")

Would make the second one not work, use bb.error for first one to fix
the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 403d6a0..f0f1731 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -188,7 +188,7 @@ def sstate_install(ss, d):
                 if search_output !=3D "":
                     match.append("Matched in %s" % search_output.rstrip())
     if match:
-        bb.fatal("The recipe %s is trying to install files into a shared a=
rea when those files already exist. Those files and their manifest location=
 are:\n   %s\nPlease verify which recipe should provide the above files.\nT=
he build has stopped as continuing in this scenario WILL break things, if n=
ot now, possibly in the future (we've seen builds fail several months later=
). If the system knew how to recover from this automatically it would howev=
er there are several different scenarios which can result in this and we do=
n't know which one this is. It may be you have switched providers of someth=
ing like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in that=
 case you need to execute the clean task for both recipes and it will resol=
ve this error. It may be you changed DISTRO_FEATURES from systemd to udev o=
r vice versa. Cleaning those recipes should again resolve this error howeve=
r switching DISTRO_FEATURES on an existing build directory is not supported=
, you should really clean out tmp and rebuild (reusing sstate should be saf=
e). It could be the overlapping files detected are harmless in which case a=
dding them to SSTATE_DUPWHITELIST may be the correct solution. It could als=
o be your build is including two different conflicting versions of things (=
e.g. bluez 4 and bluez 5 and the correct solution for that would be to reso=
lve the conflict. If in doubt, please ask on the mailing list, sharing the =
error and filelist above." % (d.getVar('PN', True), "\n   ".join(match)))
+        bb.error("The recipe %s is trying to install files into a shared a=
rea when those files already exist. Those files and their manifest location=
 are:\n   %s\nPlease verify which recipe should provide the above files.\nT=
he build has stopped as continuing in this scenario WILL break things, if n=
ot now, possibly in the future (we've seen builds fail several months later=
). If the system knew how to recover from this automatically it would howev=
er there are several different scenarios which can result in this and we do=
n't know which one this is. It may be you have switched providers of someth=
ing like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in that=
 case you need to execute the clean task for both recipes and it will resol=
ve this error. It may be you changed DISTRO_FEATURES from systemd to udev o=
r vice versa. Cleaning those recipes should again resolve this error howeve=
r switching DISTRO_FEATURES on an existing build directory is not supported=
, you should really clean out tmp and rebuild (reusing sstate should be saf=
e). It could be the overlapping files detected are harmless in which case a=
dding them to SSTATE_DUPWHITELIST may be the correct solution. It could als=
o be your build is including two different conflicting versions of things (=
e.g. bluez 4 and bluez 5 and the correct solution for that would be to reso=
lve the conflict. If in doubt, please ask on the mailing list, sharing the =
error and filelist above." % (d.getVar('PN', True), "\n   ".join(match)))
         bb.fatal("If the above message is too much, the simpler version is=
 you're advised to wipe out tmp and rebuild (reusing sstate is fine). That =
will likely fix things in most (but not all) cases.")
=20
     # Write out the manifest
--=20
1.7.9.5


