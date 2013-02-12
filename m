Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5NaU-0004ZV-BF for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 22:40:27 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CLTheD025965; Tue, 12 Feb 2013 21:30:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oQHiBHnAKXpo; Tue, 12 Feb 2013 21:30:18 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CLUEK4026038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Feb 2013 21:30:17 GMT
Message-ID: <1360704254.30425.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Feb 2013 21:24:14 +0000
In-Reply-To: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
References: <1360690970-9432-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: Introduce do_install_append and use systemd unitdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 21:40:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-12 at 09:42 -0800, Khem Raj wrote:
> systemd always uses /lib and /usr/lib to store unit files
> so using libdir and base_libdir is incorrect. It will work
> where libdir is usr/lib and base_libdir is /lib but wont work
> when say its /lib64
> 
> Additionally introduce the install append from meta-oe
> lot of recipe appends in meta-systemd depend on that
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/systemd.bbclass |   21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> index e0ea65c..32cc5c2 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -115,11 +115,9 @@ def systemd_populate_packages(d):
>  
>      # Check service-files and call systemd_add_files_and_parse for each entry
>      def systemd_check_services():
> -        base_libdir = d.getVar('base_libdir', True)
> -        searchpaths = [oe.path.join(d.getVar("sysconfdir", True), "systemd", "system"),]
> -        searchpaths.append(oe.path.join(d.getVar("base_libdir", True), "systemd", "system"))
> -        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "system"))
> -        searchpaths.append(oe.path.join(d.getVar("libdir", True), "systemd", "user"))
> +        searchpaths = '/etc/systemd/system/' + ' '

Why remove sysconfdir? 

Also, lets standardise on one variable please. We have
${nonarch_base_libdir} and ${systemd_unitdir} so do we need to
hardcode /lib and /usr/lib?

I'd suggest we add ${nonarch_libdir}, standardise on those and drop
systemd_unitdir. We use the nonarch for other non-systemd multilib work.

> +        searchpaths += '/lib/systemd/system/' + ' '
> +        searchpaths += '/usr/lib/systemd/system/' + ' '
>          systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
>          has_exactly_one_service = len(systemd_packages.split()) == 1
>          if has_exactly_one_service:
> @@ -133,7 +131,7 @@ def systemd_populate_packages(d):
>          for pkg_systemd in systemd_packages.split():
>              for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
>                  path_found = ''
> -                for path in searchpaths:
> +                for path in searchpaths.split():
>                      if os.path.exists(oe.path.join(d.getVar("D", True), path, service)):
>                          path_found = path
>                          break
> @@ -156,3 +154,14 @@ python populate_packages_prepend () {
>      if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
>          systemd_populate_packages (d)
>  }
> +# automatically install all *.service and *.socket supplied in recipe's SRC_URI
> +do_install_append() {
> +	for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
> +	# ensure installing systemd-files only (e.g not avahi *.service)
> +		if grep -q '\[Unit\]' $service ; then
> +			install -d ${D}${systemd_unitdir}/system
> +			install -m 644 $service ${D}${systemd_unitdir}/system
> +		fi
> +	done
> +}
> +

Please no. We have this kind of mess from the binconfig class and its
horrible to maintain. I'm looking forward to ripping that class out
someday.

Lets just write proper do_install functions in the recipes and make them
conditional on systemd being enabled.

Cheers,

Richard




