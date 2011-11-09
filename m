Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RODP2-0004oc-Kn
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 20:01:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA9ItMHi026027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 10:55:22 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 Nov 2011 10:55:22 -0800
Message-ID: <4EBACC99.6040507@windriver.com>
Date: Wed, 9 Nov 2011 12:55:21 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1320839130.git.paul.eggleton@linux.intel.com>
	<80a2356434387648ef7903c88fbfa64edfeca880.1320839130.git.paul.eggleton@linux.intel.com>
In-Reply-To: <80a2356434387648ef7903c88fbfa64edfeca880.1320839130.git.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] classes/package_rpm: disable uninstall scripts for upgrades
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
X-List-Received-Date: Wed, 09 Nov 2011 19:01:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 11/9/11 6:05 AM, Paul Eggleton wrote:
> Our current assumption (based on the behaviour of opkg) when writing
> recipes is that prerm and postrm do not get called during an upgrade.
> When using rpm however, these are mapped to the rpm "preun" and "postun"
> events which occur after postinst for upgrades, and when these contain
> removal type operations (such as update-alternatives --remove) this
> causes problems.
> 
> This patch wraps each preun and postun script for rpm in a check that
> determines whether or not the script is being called during an upgrade,
> and skips the entire script if it is, which mimics the behaviour of opkg
> under the same conditions.
> 
> Fixes [YOCTO #1760]
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Looks like the right solution to me.  (Paul and I previously discussed how to
correct this.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>  meta/classes/package_rpm.bbclass |   18 ++++++++++++++++--
>  1 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index df5a2db..2679e9f 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -471,6 +471,16 @@ python write_specfile () {
>  				else:
>  					target.append(path + "/" + file)
>  
> +	# Prevent the prerm/postrm scripts from being run during an upgrade
> +	def wrap_uninstall(scriptvar):
> +		scr = scriptvar.strip()
> +		if scr.startswith("#!"):
> +			pos = scr.find("\n") + 1
> +		else:
> +			pos = 0
> +		scr = scr[:pos] + 'if [ "$1" = "0" ] ; then\n' + scr[pos:] + '\nfi'
> +		return scr
> +
>  	packages = bb.data.getVar('PACKAGES', d, True)
>  	if not packages or packages == '':
>  		bb.debug(1, "No packages; nothing to do")
> @@ -671,8 +681,10 @@ python write_specfile () {
>  				spec_scriptlets_bottom.append('%%post -n %s' % splitname)
>  			elif script == 'prerm':
>  				spec_scriptlets_bottom.append('%%preun -n %s' % splitname)
> +				scriptvar = wrap_uninstall(scriptvar)
>  			elif script == 'postrm':
>  				spec_scriptlets_bottom.append('%%postun -n %s' % splitname)
> +				scriptvar = wrap_uninstall(scriptvar)
>  			spec_scriptlets_bottom.append(scriptvar)
>  			spec_scriptlets_bottom.append('')
>  
> @@ -758,11 +770,13 @@ python write_specfile () {
>  		spec_scriptlets_top.append('')
>  	if srcprerm:
>  		spec_scriptlets_top.append('%preun')
> -		spec_scriptlets_top.append(srcprerm)
> +		scriptvar = wrap_uninstall(srcprerm)
> +		spec_scriptlets_top.append(scriptvar)
>  		spec_scriptlets_top.append('')
>  	if srcpostrm:
>  		spec_scriptlets_top.append('%postun')
> -		spec_scriptlets_top.append(srcpostrm)
> +		scriptvar = wrap_uninstall(srcpostrm)
> +		spec_scriptlets_top.append(scriptvar)
>  		spec_scriptlets_top.append('')
>  
>  	# Write the SPEC file



