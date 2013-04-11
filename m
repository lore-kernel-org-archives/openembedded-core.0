Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UQDNm-00048N-Fu
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 11:01:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Apr 2013 01:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,454,1363158000"; d="scan'208";a="317611166"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2013 01:44:01 -0700
Message-ID: <516677D0.6070802@intel.com>
Date: Thu, 11 Apr 2013 11:44:00 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1365662568-24980-1-git-send-email-laurentiu.palcu@intel.com>
	<1365665593.16702.31.camel@ted>
In-Reply-To: <1365665593.16702.31.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dpkg, opkg, rpm-postinst: fix overwriting the run-postinstall script
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
X-List-Received-Date: Thu, 11 Apr 2013 09:01:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/11/2013 10:33 AM, Richard Purdie wrote:
> On Thu, 2013-04-11 at 09:42 +0300, Laurentiu Palcu wrote:
>> If multiple package managers are installed in the image, they will
>> overwrite each other's run-postinsts script, resulting in postinstalls
>> not beeing run at all at first boot.
>>
>> What this patch does:
>>  * checks whether opkg/dpks/rpm is actually used to install
>>    the packages and, only after, creates the run-postinsts script;
>>  * brings dpkg recipe in sync with opkg: moves the script creation from
>>    do_install to postinstall;
>>  * move creation of run-postinsts script (rpm-postinsts recipe) to the
>>    postinstall scriptlet in order to better control the creation of the
>>    script according to the package manager used;
>>
>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> ---
>>  meta/recipes-devtools/dpkg/dpkg.inc        |   23 ++++++++++++++---------
>>  meta/recipes-devtools/opkg/opkg.inc        |    3 ++-
>>  meta/recipes-devtools/rpm/rpm-postinsts.bb |   19 ++++++++++++-------
>>  3 files changed, 28 insertions(+), 17 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
>> index 6bb1e16..f7f7b01 100644
>> --- a/meta/recipes-devtools/dpkg/dpkg.inc
>> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
>> @@ -39,15 +39,6 @@ POSTLOG ?= "/var/log/postinstall.log"
>>  REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
>>  
>>  DPKG_INIT_POSITION ?= "98"
>> -do_install_prepend () {
>> -	install -d ${D}/${sysconfdir}/rcS.d
>> -	# this happens at S98 where our good 'ole packages script used to run
>> -	echo "#!/bin/sh
>> -dpkg --configure -a ${REDIRECT_CMD}
>> -rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
>> -" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
>> -	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
>> -}
>>  
>>  do_install_append () {
>>  	if [ "${PN}" = "dpkg-native" ]; then
>> @@ -67,6 +58,20 @@ do_install_append_class-native () {
>>  	done
>>  }
>>  
>> +pkg_postinst_${PN} () {
>> +#!/bin/sh
>> +if [ "x$D" != "x" ] && [ "deb" = "${IMAGE_PKGTYPE}" ]; then
> 
> This is the right direction but this check will mean that rpm/dpkg/opkg
> rebuilt each time IMAGE_PKGTYPE changes. Rather than hardcode this in,
> can we test on something else which would be in the final runtime image
> e.g. /var/lib/dpkg/status, the opkg status file and find some rpm
> runtime file too?
Hmm, my original solution was to check for the existence of status file
but for some reason, it doesn't work for deb (maybe the status file is
not created by the time dpkg package is installed, but I'm not sure)...
Also, this seemed like a consistent solution for all package managers.
I'll try to see what other options I can find.

Thanks,
Laurentiu

> 
> Cheers,
> 
> Richard
> 
> 
>> +	install -d ${D}/${sysconfdir}/rcS.d
>> +
>> +	# this happens at S98 where our good 'ole packages script used to run
>> +	echo "#!/bin/sh
>> +dpkg --configure -a ${REDIRECT_CMD}
>> +rm -f ${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
>> +" > ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
>> +	chmod 0755 ${D}/${sysconfdir}/rcS.d/S${DPKG_INIT_POSITION}run-postinsts
>> +fi
>> +}
>> +
>>  PROV = "virtual/update-alternatives"
>>  PROV_class-native = ""
>>  
>> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
>> index f9c1202..d400dcd 100644
>> --- a/meta/recipes-devtools/opkg/opkg.inc
>> +++ b/meta/recipes-devtools/opkg/opkg.inc
>> @@ -62,8 +62,9 @@ REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG}
>>  
>>  pkg_postinst_${PN} () {
>>  #!/bin/sh
>> -if [ "x$D" != "x" ]; then
>> +if [ "x$D" != "x" ] && [ "ipk" = "${IMAGE_PKGTYPE}" ]; then
>>  	install -d $D${sysconfdir}/rcS.d
>> +
>>  	# this happens at S98 where our good 'ole packages script used to run
>>  	echo "#!/bin/sh
>>  opkg-cl configure ${REDIRECT_CMD}
>> diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> index fb05ad6..281cb14 100644
>> --- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> +++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> @@ -27,15 +27,17 @@ do_compile() {
>>  }
>>  
>>  do_install() {
>> -	install -d ${D}/${sysconfdir}/rcS.d
>> -	# Stop $i getting expanded below...
>> -	i=\$i
>> -	cat > ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
>> -#!/bin/sh
>> +	:
>> +}
>>  
>> +pkg_postinst_${PN} () {
>> +if [ "x$D" != "x" ] && [ "rpm" = "${IMAGE_PKGTYPE}" ]; then
>> +	install -d $D/${sysconfdir}/rcS.d
>> +	cat > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
>> +#!/bin/sh
>>  . /etc/default/rcS
>>  
>> -[ -d /etc/rpm-postinsts ] && for i in \`ls /etc/rpm-postinsts/ \`; do
>> +[ -d /etc/rpm-postinsts ] && for i in `ls /etc/rpm-postinsts/`; do
>>  	i=/etc/rpm-postinsts/$i
>>  	echo "Running postinst $i..."
>>  	if [ -f $i ] && $i ${REDIRECT_CMD}; then
>> @@ -46,5 +48,8 @@ do_install() {
>>  done
>>  rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts 2>/dev/null
>>  EOF
>> -	chmod 0755 ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
>> +	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
>> +fi
>>  }
>> +
>> +ALLOW_EMPTY_${PN} = "1"
> 
> 


