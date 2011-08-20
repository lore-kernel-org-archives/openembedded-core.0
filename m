Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Quo7x-0000sv-Ab
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 18:10:29 +0200
Received: by gxk3 with SMTP id 3so2669282gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2011 09:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ZwHiukINWo49e7gfqPwDbindf2XNJVnSNJv9KZLxIn4=;
	b=jsULGtZuUzylmLnnicY22ZxE+xmXR12ny26SVGJF5ZdcMN+JxQls3+K86+76cRLX+q
	83db7di2XTAd997JfpEPgcAOvElU4QMfVyPV0oKejEO7AGGS1I8vVtVLwDLIeoJang7E
	mwwKJ2q1DMm4GIc0xPRhzABzCdUUPOJLbHk+E=
Received: by 10.42.155.198 with SMTP id v6mr561966icw.380.1313856346661;
	Sat, 20 Aug 2011 09:05:46 -0700 (PDT)
Received: from [172.23.5.198] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id g21sm2248088ibl.58.2011.08.20.09.05.45
	(version=SSLv3 cipher=OTHER); Sat, 20 Aug 2011 09:05:45 -0700 (PDT)
Message-ID: <4E4FDB65.1010306@gmail.com>
Date: Sat, 20 Aug 2011 09:05:57 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1313826618.git.wenzong.fan@windriver.com>
	<fc4770ac723a1fa69bc53a8a887b5892cfb99968.1313826618.git.wenzong.fan@windriver.com>
In-Reply-To: <fc4770ac723a1fa69bc53a8a887b5892cfb99968.1313826618.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 1/1] libpam: Setting suid bit for unix_chkpwd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Aug 2011 16:10:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/2011 12:58 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> [YOCTO #1252]
>
> While pam_unix.so required by an application on lsb image, it will need to
> call the unix_chkpwd to get userinfo from shadow file. This fix get a normal
> user could read shadow file via unix_chkpwd.
>
> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
> ---
>   meta/recipes-extended/pam/libpam_1.1.4.bb |    8 +++++++-
>   1 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.1.4.bb b/meta/recipes-extended/pam/libpam_1.1.4.bb
> index ae20a97..ca54bd8 100644
> --- a/meta/recipes-extended/pam/libpam_1.1.4.bb
> +++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
> @@ -9,7 +9,7 @@ SECTION = "base"
>   LICENSE = "GPLv2+ | BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
>
> -PR = "r1"
> +PR = "r2"
>
>   DEPENDS = "bison flex cracklib"
>   RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
> @@ -85,3 +85,9 @@ do_install() {
>   	install -d ${D}${sysconfdir}/pam.d/
>   	install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
>   }
> +
> +pkg_postinst_pam-plugin-unix () {
> +    # below is necessary to allow unix_chkpwd get user info from shadow file
> +    # on lsb images
> +    chmod 4755 /usr/sbin/unix_chkpwd

may be its better to use corresponding metadata variables instead of 
hardcoding /usr/sbin here

> +}



