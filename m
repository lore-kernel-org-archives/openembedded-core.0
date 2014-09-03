Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC74713DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 10:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s83AP3bE006756; Wed, 3 Sep 2014 11:25:03 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KELZ2m0_r5Cx; Wed,  3 Sep 2014 11:25:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s83AOxk1006752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 3 Sep 2014 11:25:01 +0100
Message-ID: <1409739900.12482.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Wed, 03 Sep 2014 11:25:00 +0100
In-Reply-To: <b4a68ca960394f346025bb47035efa6b9e8e52a4.1409736914.git.Chong.Lu@windriver.com>
References: <cover.1409736914.git.Chong.Lu@windriver.com>
	<b4a68ca960394f346025bb47035efa6b9e8e52a4.1409736914.git.Chong.Lu@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] i2c-tools: create i2c-tools-misc package for perl scripts
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
X-List-Received-Date: Wed, 03 Sep 2014 10:25:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-03 at 17:36 +0800, Chong Lu wrote:
> We don't want to install perl on small file systems by default.
> 
> The solution is to split those perl scripts from the main package, installing
> them only when perl is available. We use PACKAGECONFIG to create and enable a
> new feature "misc".
> 
> Add perl to RDEPENDS_i2c-tools-misc.
> 
> Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
> index 4605414..854d180 100644
> --- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
> +++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
> @@ -3,8 +3,6 @@ SECTION = "base"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  
> -RDEPENDS_${PN} += "perl"
> -
>  SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2 \
>             file://Module.mk \
>  "
> @@ -24,3 +22,15 @@ do_install_append() {
>      install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
>      rm -f ${D}${includedir}/linux/i2c-dev.h
>  }
> +
> +PACKAGES =+ "${PN}-misc"
> +RDEPENDS_${PN}-misc += "perl"
> +FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
> +                        ${bindir}/ddcmon \
> +                        ${bindir}/decode-edid \
> +                        ${bindir}/decode-dimms \
> +                        ${bindir}/decode-vaio \
> +                       "
> +
> +PACKAGECONFIG ??= "misc"
> +PACKAGECONFIG[misc] = ",,, ${PN}-misc perl"

As far as I can tell, these PACKAGECONFIG lines do nothing. Putting the
perl utils into a separate package is fine but the PACKAGECONFIG does
nothing...

Cheers,

Richard


