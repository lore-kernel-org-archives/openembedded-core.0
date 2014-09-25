Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5FC60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8PBNrRY016575 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:23:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WgxU8MnW-RjL
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:23:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8PBNmNj016572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:23:49 +0100
Message-ID: <1411644230.4189.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Sep 2014 12:23:50 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] sstate: Change overlapping files warning to a fatal error
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
X-List-Received-Date: Thu, 25 Sep 2014 11:23:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When files overlap in the sysroot, something bad usually happened. We've ha=
d
two independent cases recently where a couple of months after one of these
warnings was shown, builds failed due to corruption.

This change moves the warning to become a fatal error. The complaint I've h=
ad
about this is that we need to tell the user what happened and more importan=
tly
how to recover from it. If we could recover from it, great but the trouble =
is
we simply don't know what happened.

As a compromise, we can document several of the possible scenarios in the e=
rror
message. We don't normally go to this level of detail however in this case,=
 I'm
lacking other viable alternatives.

I do believe it is important to stop as corruption occurs rather than letti=
ng the
build continue into territory that is not deterministic amongst other thing=
s.

The complex message is followed by a simpler one in case the long message i=
s too
much for the user.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4057c8c..72ac882 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -187,7 +187,8 @@ def sstate_install(ss, d):
                 if search_output !=3D "":
                     match.append("Matched in %s" % search_output.rstrip())
     if match:
-        bb.warn("The recipe %s is trying to install files into a shared ar=
ea when those files already exist. Those files and their manifest location =
are:\n   %s\nPlease verify which package should provide the above files." %=
 (d.getVar('PN', True), "\n   ".join(match)))
+        bb.fatal("The recipe %s is trying to install files into a shared a=
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
+        bb.fatal("If the above message is too much, the simpler version is=
 you're advised to wipe out tmp and rebuild (reusing sstate is fine). That =
will likely fix things in most (but not all) cases.")
=20
     # Write out the manifest
     f =3D open(manifest, "w")



