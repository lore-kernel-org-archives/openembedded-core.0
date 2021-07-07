Received: from avasout03.plus.net (avasout03.plus.net [84.93.230.244])
 by mx.groups.io with SMTP id smtpd.web11.175.1625676922630800244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 09:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=QQB1OlC2;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.244, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id 1ApNmjsJ78qI11ApOmO8mc; Wed, 07 Jul 2021 17:55:21 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=OJS8IRSB c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8nJEP1OIZ-IA:10 a=e_q4qTt1xDgA:10 a=Q4-j1AaZAAAA:8 a=epP1kASBF2aL1VB3dlQA:9
 a=wPNLvfGTeEIA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description;
	bh=n6wApfIIit7Gv4P9zkxh+XE+89cwM0oBxz+RXRkFUos=; b=QQB1OlC2JOk1te4RMPH6ECEjKE
	GmNajPTpEM6xF/AP/qk/WdjdTTGGHhynfMwkEr6Xy4x5+5PtAIWD1xJSSPlHcX8ip8IZyqAOcYtNL
	ydi7AUeHx7UQNFsFb8ggwuTjSqddLDnJqHjCwl6mqTP/NdoA5lML/eenpc6tKwV45ZRZMiQ2yKJKf
	H4mQLkIgALykD4AXWXKky68lSgGp0JcpgvegUJHqhiZOT67fAJRfapx4wSZ1VGx2Ld3/cFDdyFuIT
	lzftLV0CwBOLjcuB0e9oUWNkjiGOgzVMNAu34Ccfc9/Rzj3n9w9r2YpFuyaygJt+kyNebLWej7xUX
	u56/PlEA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1m1ApN-00047Y-6z; Wed, 07 Jul 2021 17:55:13 +0100
Date: Wed, 7 Jul 2021 17:55:13 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] license.bbclass does not add recommends to dynamic packages
Message-ID: <20210707165513.GA12044@mcrowe.com>
References: <20210707115334.GA498@mcrowe.com>
 <f78a557b2ce4df340b55194f551e599bffbe21ae.camel@linuxfoundation.org>
 <20210707130521.GA4032@mcrowe.com>
 <168F8FE5ADDC556E.30794@lists.openembedded.org>
 <303e003d518d15ee79997873f0c8dbac439a25a8.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <303e003d518d15ee79997873f0c8dbac439a25a8.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfNb0LguT5IxoId9Uw+rgHROC/I9tKGHNrz1R/Bt7dGG1NMAe3Eri58cvmGlo8ys4BSGX4pYr3xOijHPQtU046E1aWyfSdumMNCKEZdDPX9gTJa7zI6mU
 tBVJdJUmFAJoq8cbt+U7U8yG2Eo+pkMc9IsmsowVv1ioAcky5HfH1H96ANVLX8xe5wW+FdcFau3e4A==
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wednesday 07 July 2021 at 17:48:20 +0100, Richard Purdie wrote:
> On Wed, 2021-07-07 at 17:43 +0100, Richard Purdie via lists.openembedded.org wrote:
> > On Wed, 2021-07-07 at 14:05 +0100, Mike Crowe wrote:
> > > On Wednesday 07 July 2021 at 13:25:17 +0100, Richard Purdie wrote:
> > > > On Wed, 2021-07-07 at 12:53 +0100, Mike Crowe via lists.openembedded.org wrote:
> > > > > We're using LICENSE_CREATE_PACKAGE to create ${PN}-lic package files and
> > > > > relying on the automatically generated recommends to cause them to be
> > > > > installed in the image. This works well for most packages, but fails for
> > > > > packages where we only install package created using PACKAGES_DYNAMIC.
> > > > > 
> > > > > For example, liborc is being installed in our image but that package lacks
> > > > > a recommends for orc-lic, so the licences that apply to it are not being
> > > > > installed. This is because license.bbclass:add_package_and_files iterates
> > > > > only over the packages listed in PACKAGES.
> > > > > 
> > > > > Steps to reproduce on current master:
> > > > > 
> > > > > $ echo 'LICENSE_CREATE_PACKAGE = "1"' >> conf/local.conf
> > > > > $ bitbake orc
> > > > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/orc_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > > > >  Recommends: orc-lic
> > > > > $ dpkg-deb -I tmp-glibc/deploy/ipk/armv7vet2hf-neon/liborc-0.4-0_0.4.32-r0_armv7vet2hf-neon.ipk|grep Recommends
> > > > > $
> > > > > 
> > > > > (I would have expected the last command to produce the same output as the
> > > > > penultimate one.)
> > > > > 
> > > > > Even if I could fathom out how to fix orc and any other recipes so that they
> > > > > did add the ${PN}-lic dependency, I'd be worried about not noticing that
> > > > > the problem affected other recipes in the future.
> > > > > 
> > > > > Is there a way to teach license.bbclass:add_package_and_files to add the
> > > > > ${PN}-lic recommends for dynamic packages, or would it be necessary to
> > > > > teach package.bbclass to do so?
> > > > 
> > > > That all sounds rather horrible :/.
> > > > 
> > > > Would IMAGE_INSTALL_COMPLEMENTARY += "*-lic" work instead?
> > > 
> > > That seems to have worked well.
> > > 
> > > I wonder whether this means that it would be better to stop adding the
> > > recommends automatically and tell users that need this to use
> > > IMAGE_INSTALL_COMPLEMENTARY instead (either directly, or by teaching
> > > license_image.bbclass to modify it based on another variable.)
> > 
> > That would seem the better option to me at least...
> 
> To be clear, I'd definitely support dropping that existing RRECOMMENDS code,
> I think there are better ways to handle this now. I may even write that patch :)

I was thinking of something like the following untested patch:

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f7978e266b..c87473cbb8 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -63,14 +63,6 @@ def add_package_and_files(d):
         # first in PACKAGES to be sure that nothing else gets LICENSE_FILES_DIRECTORY
         d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
         d.setVar('FILES_' + pn_lic, files)
-    for pn in packages.split():
-        if pn == pn_lic:
-            continue
-        rrecommends_pn = d.getVar('RRECOMMENDS_' + pn)
-        if rrecommends_pn:
-            d.setVar('RRECOMMENDS_' + pn, "%s %s" % (pn_lic, rrecommends_pn))
-        else:
-            d.setVar('RRECOMMENDS_' + pn, "%s" % (pn_lic))

 def copy_license_files(lic_files_paths, destdir):
     import shutil
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 73cebb4d55..293a033855 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -279,3 +279,6 @@ python license_qa_dead_symlink() {
                 bb.error("broken symlink: " + full_path)
 }
 IMAGE_QA_COMMANDS += "license_qa_dead_symlink"
+
+IMAGE_INSTALL_LICENSES ??= "${LICENSE_CREATE_PACKAGE}"
+IMAGE_INSTALL_COMPLEMENTARY += "${oe.utils.conditional("IMAGE_INSTALL_LICENSES", "0", "", "*-lic", d)}"

I'm not sure whether it's safe to += an empty string onto the end of
IMAGE_INSTALL_COMPLEMENTARY, but I'm trying to avoid adding yet more
anonymous Python. :-)

Is that the sort of thing you meant?

Thanks.

Mike.
