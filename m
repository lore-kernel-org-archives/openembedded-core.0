Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id D6B4172F59
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 12:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3353F31C6619;
	Wed,  1 Mar 2017 13:44:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BC02KKq9lYZQ; Wed,  1 Mar 2017 13:44:46 +0100 (CET)
Received: from t510.zcs.saftware.de (p57A618F1.dip0.t-ipconnect.de
	[87.166.24.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1425131C64BE;
	Wed,  1 Mar 2017 13:44:46 +0100 (CET)
Date: Wed, 1 Mar 2017 13:44:45 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: <Hugo.Jacob@bmw.de>
Message-ID: <20170301134445.4b1fd1f6@t510.zcs.saftware.de>
In-Reply-To: <1488275461449.17365@bmw.de>
References: <1488275461449.17365@bmw.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] buildhistory.bbclass: Add license declaration to packages and recipes
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
X-List-Received-Date: Wed, 01 Mar 2017 12:44:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Hugo,

On Tue, 28 Feb 2017 09:51:00 +0000
<Hugo.Jacob@bmw.de> wrote:

> Having the license declaration in the buildhistory is useful to track
> licenses changes, licenses going to a given image and etc. This change
> adds the license declaration for recipes and packages to its
> buildhistory data.
> 
> Upstream-status: Submitted

patches for metadata shouldn't contain Upstream-status tags.

> 
> Signed-off-by: Hugo Jacob <Hugo.Jacob@bmw.de>
> ---
>  meta/classes/buildhistory.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 3a5bc2c3e3..f6525dfd72 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -83,6 +83,7 @@ python buildhistory_emit_pkghistory() {
>              self.pe = "0"
>              self.pv = "0"
>              self.pr = "r0"
> +            self.license = ""
>              self.depends = ""
>              self.packages = ""
>              self.srcrev = ""
> @@ -94,6 +95,7 @@ python buildhistory_emit_pkghistory() {
>              self.pe = "0"
>              self.pv = "0"
>              self.pr = "r0"
> +            self.license = ""
>              # pkg/pkge/pkgv/pkgr should be empty because we want to be able to default them
>              self.pkg = ""
>              self.pkge = ""
> @@ -186,6 +188,7 @@ python buildhistory_emit_pkghistory() {
>      pe = d.getVar('PE', True) or "0"
>      pv = d.getVar('PV', True)
>      pr = d.getVar('PR', True)
> +    license = d.getVar('LICENSE', True)
> 
>      pkgdata_dir = d.getVar('PKGDATA_DIR', True)
>      packages = ""
> @@ -223,6 +226,7 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.pe = pe
>      rcpinfo.pv = pv
>      rcpinfo.pr = pr
> +    rcpinfo.license = license
>      rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS', True) or ""))
>      rcpinfo.packages = packages
>      write_recipehistory(rcpinfo, d)
> @@ -241,6 +245,7 @@ python buildhistory_emit_pkghistory() {
>          pkge = pkgdata.get('PKGE', '0')
>          pkgv = pkgdata['PKGV']
>          pkgr = pkgdata['PKGR']
> +        pkg_license = d.getVar('LICENSE_%s' % (pkg,), True) or license

Please use 'LICENSE_%s' % pkg.

Regards,
Andreas

>          #
>          # Find out what the last version was
>          # Make sure the version did not decrease
> @@ -261,6 +266,7 @@ python buildhistory_emit_pkghistory() {
>          pkginfo.pv = pkgdata['PV']
>          pkginfo.pr = pkgdata['PR']
>          pkginfo.pkg = pkgdata['PKG']
> +        pkginfo.license = pkg_license
>          pkginfo.pkge = pkge
>          pkginfo.pkgv = pkgv
>          pkginfo.pkgr = pkgr
> @@ -301,6 +307,7 @@ def write_recipehistory(rcpinfo, d):
>              f.write(u"PE = %s\n" %  rcpinfo.pe)
>          f.write(u"PV = %s\n" %  rcpinfo.pv)
>          f.write(u"PR = %s\n" %  rcpinfo.pr)
> +        f.write(u"LICENSE = %s\n" %  rcpinfo.license)
>          f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
>          f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
> 
> @@ -320,6 +327,7 @@ def write_pkghistory(pkginfo, d):
>              f.write(u"PE = %s\n" %  pkginfo.pe)
>          f.write(u"PV = %s\n" %  pkginfo.pv)
>          f.write(u"PR = %s\n" %  pkginfo.pr)
> +        f.write(u"LICENSE = %s\n" %  pkginfo.license)
> 
>          if pkginfo.pkg != pkginfo.name:
>              f.write(u"PKG = %s\n" % pkginfo.pkg)
> --
> 2.11.0


