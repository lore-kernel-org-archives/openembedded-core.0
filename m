Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6F45D6116C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 13:22:38 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so5278924wgh.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 06:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=scvBbbdNkGiDj2miXza9Wp8wtP+6+yKHL6ZBk/sNXg8=;
	b=AGxkxS5EYMewkvwfPmCvpplviauNtjvOYdgpUKo/saj42E9+ojhsz5M7+43f58zD1K
	gIu4nFJSVVZbtoxFfA/HWKY/sHChy4qsvMjotHg2vb/akZEHWDJsE/lMoBj3UO9vVlqE
	wkgbkjTnsausZkJ7TjxxSWC+tOZsbUFpG6eELpSRTvAAzcB3AkfYcLIDnFI4sbh8+c8t
	FIlxUA9FbFYc3gZnf6jBWqpyUd9QjwOTiK4Z4TbN1OhGw62cZXBlxLej5TYDVSKWmDbx
	2QbaF6D2l5FoKGfEdLe05B/HxcnXxT8twB429Fhg3EU1nkqqgbJDsV7Fh11v+xlOHybR
	GIDA==
X-Gm-Message-State: ALoCoQlgWv8uh3eaP2Oxz155KOXE7ugkR0pS+maFnWRmeTTetVoLtZ0ya4XfqGBRJlw19fYyW5xz
X-Received: by 10.194.121.232 with SMTP id ln8mr8035370wjb.65.1411564959772;
	Wed, 24 Sep 2014 06:22:39 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id pm2sm5782591wic.13.2014.09.24.06.22.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 06:22:38 -0700 (PDT)
Message-ID: <5422C59E.4090107@dresearch-fe.de>
Date: Wed, 24 Sep 2014 15:22:38 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <54216293.4040907@dresearch-fe.de>	 <1411478501.15825.40.camel@ted>
	<542188F7.3080007@dresearch-fe.de> <1411489011.15825.47.camel@ted>
In-Reply-To: <1411489011.15825.47.camel@ted>
Cc: Lianhao Lu <lianhao.lu@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: hash generation/PR service problem with xuser-account and other packages
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
X-List-Received-Date: Wed, 24 Sep 2014 13:22:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 23.09.2014 18:16, Richard Purdie wrote:
> On Tue, 2014-09-23 at 16:51 +0200, Steffen Sledz wrote:
>> Hi Richard, thanx for this detailled explanation. It is another step on my way to understand all this. ;-)
>>
>>> The other recipes will need investigating since I doubt its this issue
>>> for them.
>>
>> Is there someone who can do this work in a similar brightening way Richard did?
> 
> I had a look at run-postinsts:
> 
> MACHINE=qemux86 bitbake run-postinsts
> MACHINE=qemuarm bitbake run-postinsts
> 
> ls tmp/stamps/all-poky-linux/run-postinsts/
> 
> Hmm, two different sigdata files for do_package.
> 
> bitbake-diffsigs tmp/stamps/all-poky-linux/run-postinsts/1.0-r9.do_package.sigdata.*
> (assumes only two sigdata files there, idea is to compare them)
> 
> Difference is the OVERRIDES variable. We therefore dump one of the files:
> 
> bitbake-diffsigs tmp/stamps/all-poky-linux/run-postinsts/1.0-r9.do_package.sigdata.X | grep OVERRIDES
> 
> and see that OVERRIDES is depended on in two places:
> 
> List of dependencies for variable systemd_populate_packages is set(['systemd_prerm', 'D', 'exec_prefix', 'OVERRIDES', 'sysconfdir', 'SYSTEMD_PACKAGES', 'systemd_postinst', 'nonarch_base_libdir', 'PACKAGES'])
> List of dependencies for variable populate_packages_updatercd is set(['D', 'updatercd_postrm', 'OVERRIDES', 'INITSCRIPT_NAME', 'INHIBIT_UPDATERCD_BBCLASS', 'MLPREFIX', 'updatercd_postinst', 'updatercd_preinst', 'updatercd_prerm', 'INIT_D_DIR', 'PACKAGES', 'INITSCRIPT_PACKAGES', 'UPDATERCPN'])
> 
> So the patch to fix this is:
> 
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index a6ad723..708ba89 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -55,6 +55,8 @@ fi
>  
>  
>  systemd_populate_packages[vardeps] += "systemd_prerm systemd_postinst"
> +systemd_populate_packages[vardepsexclude] += "OVERRIDES"
> +
>  
>  python systemd_populate_packages() {
>      if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
> index 3c5414b..bc1aa7d 100644
> --- a/meta/classes/update-rc.d.bbclass
> +++ b/meta/classes/update-rc.d.bbclass
> @@ -72,6 +72,7 @@ PACKAGESPLITFUNCS_prepend = "populate_packages_updatercd "
>  PACKAGESPLITFUNCS_remove_class-nativesdk = "populate_packages_updatercd "
>  
>  populate_packages_updatercd[vardeps] += "updatercd_prerm updatercd_postrm updatercd_preinst updatercd_postinst"
> +populate_packages_updatercd[vardepsexclude] += "OVERRIDES"
>  
>  python populate_packages_updatercd () {
>      def update_rcd_auto_depend(pkg):
> 
> 
> since OVERRIDES isn't a needed dependency here, its effect is all that matters, not its contents.

This patch fixes the cpufreq-tweaks (from meta-angstrom) problem too. :)

So there's still linux-firmware pending from the packages i mentioned.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

