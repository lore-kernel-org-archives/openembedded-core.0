Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8386A687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 06:46:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5D6kF2W000709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Jun 2013 23:46:15 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 12 Jun 2013 23:46:14 -0700
Message-ID: <51B96ADF.90208@windriver.com>
Date: Thu, 13 Jun 2013 14:46:55 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<1760eefec11e9a25b4fb20375105c64c82b82227.1370585547.git.Qi.Chen@windriver.com>
	<20130611202607.GA22231@mx.loc>
In-Reply-To: <20130611202607.GA22231@mx.loc>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, Denys Vlasenko <vda.linux@googlemail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] busybox: add the ability to split the busybox binary
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
X-List-Received-Date: Thu, 13 Jun 2013 06:46:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2013 04:26 AM, Bernhard Reutner-Fischer wrote:
> On Fri, Jun 07, 2013 at 02:13:58PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> This patch enables us to split the busybox into two binaries, one
>> containing suid applications, and the other containing nosuid apps.
>>
>> Add a variable, BUSYBOX_SPLIT_SUID, to control whether to split the
>> busybox binary into two parts. We default it to "1" to enable the
>> splitting, but users could still override it to disable the splitting.
>> After all, busybox has no internal support for this suid apps splitting,
>> so there might be users out there who want just one busybox binary.
>>
>> Add a configuration file, suid_config_list, to control which applications
>> should be splitted into the suid binary. The list is first obtained from
>> the information in include/applets.h. Some extra config items are also
>> added to the list as they are related to the suid apps. I choose to use
>> a configuration file here because if some config item is missed, we could
>> add it to the list easily.
>>
>> [YOCTO #4207]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>> .../busybox/busybox-1.20.2/suid_config_list        |   48 +++++++++
>> meta/recipes-core/busybox/busybox.inc              |  104 +++++++++++++++-----
>> meta/recipes-core/busybox/busybox_1.20.2.bb        |    3 +-
>> 3 files changed, 127 insertions(+), 28 deletions(-)
>> create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/suid_config_list
>>
>> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/suid_config_list b/meta/recipes-core/busybox/busybox-1.20.2/suid_config_list
>> new file mode 100644
>> index 0000000..16a0b76
>> --- /dev/null
>> +++ b/meta/recipes-core/busybox/busybox-1.20.2/suid_config_list
>> @@ -0,0 +1,48 @@
>> +# This file lists all config items which are related to suid apps in busybox.
>> +# The following list is obtained with the command below (splitted into two lines for readability).
>> +# for i in `grep -E "APPLET.*BB_SUID_((MAYBE|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP |
>> +# cut -f 3 -d '(' | cut -f 1 -d ','`; do grep -i -E "config_(feature_|)$i(_| )" .config; done | cut -d' ' -f2
>> +CONFIG_PING
>> +CONFIG_PING6
>> +CONFIG_CRONTAB
>> +CONFIG_FINDFS
>> +CONFIG_LOGIN
>> +CONFIG_LOGIN_SESSION_AS_CHILD
>> +CONFIG_LOGIN_SCRIPTS
>> +CONFIG_MOUNT
>> +CONFIG_FEATURE_MOUNT_FAKE
>> +CONFIG_FEATURE_MOUNT_VERBOSE
>> +CONFIG_FEATURE_MOUNT_HELPERS
>> +CONFIG_FEATURE_MOUNT_LABEL
>> +CONFIG_FEATURE_MOUNT_NFS
>> +CONFIG_FEATURE_MOUNT_CIFS
>> +CONFIG_FEATURE_MOUNT_FLAGS
>> +CONFIG_FEATURE_MOUNT_FSTAB
>> +CONFIG_FEATURE_MOUNT_LOOP
>> +CONFIG_FEATURE_MOUNT_LOOP_CREATE
>> +CONFIG_PASSWD
>> +CONFIG_FEATURE_PASSWD_WEAK_CHECK
>> +CONFIG_SU
>> +CONFIG_FEATURE_SU_SYSLOG
>> +CONFIG_FEATURE_SU_CHECKS_SHELLS
>> +CONFIG_TRACEROUTE
>> +CONFIG_FEATURE_TRACEROUTE_VERBOSE
>> +CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE
>> +CONFIG_FEATURE_TRACEROUTE_USE_ICMP
>> +CONFIG_TRACEROUTE6
>> +CONFIG_VLOCK
>> +CONFIG_WALL
>> +
>> +# The following list is obtained by examining the Config.in file in busybox manually.
>> +# These config items are also related to suid apps.
>> +CONFIG_FEATURE_FANCY_PING
>> +CONFIG_FEATURE_SHADOWPASSWDS
>> +CONFIG_USE_BB_PWD_GRP
>> +CONFIG_USE_BB_SHADOW
>> +CONFIG_USE_BB_CRYPT
>> +CONFIG_USE_BB_CRYPT_SHA
>> +CONFIG_PAM
>> +CONFIG_FEATURE_NOLOGIN
>> +CONFIG_FEATURE_SECURETTY
>> +CONFIG_CRYPTPW
>> +CONFIG_CHPASSWD
>> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
>> index 99d4e99..9984c5a 100644
>> --- a/meta/recipes-core/busybox/busybox.inc
>> +++ b/meta/recipes-core/busybox/busybox.inc
>> @@ -12,6 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
>>
>> SECTION = "base"
>>
>> +# Whether to split the suid apps into a seperate binary
>> +BUSYBOX_SPLIT_SUID ?= "1"
>> +
>> export EXTRA_CFLAGS = "${CFLAGS}"
>> export EXTRA_LDFLAGS = "${LDFLAGS}"
>>
>> @@ -136,19 +139,52 @@ do_configure () {
>>
>> do_compile() {
>> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> -	oe_runmake busybox_unstripped
>> -	cp busybox_unstripped busybox
>> +	if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
>> +	# split the .config into two parts, and make two busybox binaries
Hi Bernhard,

Thank you very much for your review and suggestions!
I went through your methods below very carefully and I tried your patch out.

Here are two problems.

1) The config_list.suid could be derived by renaming the `original 
suid_config_list' file, but what about the config_list.nosuid? We have a 
suid_config_list, because compared with the non-suid apps, the amount of 
config items for suid apps or related to suid apps are relatively small. 
It seems that config_list.nosuid will be a very long list.

2) Your patch in the attachment worked out well. `make 
busybox.applets.suid' generates a file named busybox.applets.suid which 
contains the following config items.
CONFIG_LOGIN
CONFIG_PASSWD
CONFIG_FEATURE_PASSWD_WEAK_CHECK
CONFIG_SU
CONFIG_FEATURE_SU_SYSLOG
CONFIG_FEATURE_SU_CHECKS_SHELLS
CONFIG_VLOCK
CONFIG_FINDFS
CONFIG_MOUNT
CONFIG_FEATURE_MOUNT_FAKE
CONFIG_FEATURE_MOUNT_VERBOSE
CONFIG_FEATURE_MOUNT_LABEL
CONFIG_FEATURE_MOUNT_CIFS
CONFIG_FEATURE_MOUNT_FLAGS
CONFIG_FEATURE_MOUNT_FSTAB
CONFIG_FEATURE_MOUNT_LOOP
CONFIG_FEATURE_MOUNT_LOOP_CREATE
CONFIG_CRONTAB
CONFIG_WALL
CONFIG_PING
CONFIG_PING6
CONFIG_TRACEROUTE
CONFIG_TRACEROUTE6
CONFIG_FEATURE_TRACEROUTE_VERBOSE

You see, this is a subset of the suid_config_list. As stated in the 
file's comments, part of the list is obtained from a command, and part 
of it is obtained by manually examine the Config.in files to find out 
the config items that are related to suid apps.

Best Regards,
Chen Qi
> cat .config > .config-oe-full
> # it would be nice to 'for s in suid nosuid'
> # but that would mean operating on ${s}_config_list which bitbake (IIRC)
> # ruins. Better rename the files to config_list.suid to be able to loop.
> #
> for s in suid nosuid; do
>    egrep ^CONFIG_ ${WORKDIR}/config_list.$s | while read i; do
>      grep -w "$i" .config
>    done > .config.$s
>
>    # populate the config, default everything else to no
>    KCONFIG_ALLCONFIG=config.$s make allnoconfig
>    oe_runmake busybox_unstripped busybox.links
>    mv busybox_unstripped busybox.$s
>    mv busybox.links busybox.links.$s
> done
> cat .config-oe-full > .config
>
> I would much prefer to make the generation of the suid cfg stuff more
> robust. Could you live with the attached helper thing (untested)?
> That would make it a prepended oe_runmake busybox.applets.suid to
> generate the list busybox.applets.suid. If that suits your needs we can
> apply it to busybox for general use..
> The other possibility is, obviously, to fit all this in busybox' build
> itself, but given that we do have a seemingly working, bugless suid
> handling this might be better suited to be dealt with by the user as you
> suggest here.
>
> Thoughts?
> thanks,
>> +		cp .config .config.orig
>> +		oe_runmake allnoconfig
>> +		cp .config .config.allno
>> +		for item in `grep 'CONFIG_' ${WORKDIR}/suid_config_list`; do
>> +			echo "# $item is not set" >> .config.nosuid.tmp
>> +			grep -w "$item" .config.orig >> .config.suid.tmp
>> +		done
>> +		merge_config.sh -m .config.orig .config.nosuid.tmp
>> +		cp .config .config.nosuid
>> +		merge_config.sh -m .config.allno .config.suid.tmp
>> +		cp .config .config.suid
>> +
>> +		# compile with no suid apps
>> +		cp .config.nosuid .config
>> +		oe_runmake busybox_unstripped
>> +		cp busybox_unstripped busybox.nosuid
>> +		oe_runmake busybox.links
>> +		cp busybox.links busybox.links.nosuid
>> +
>> +		# compile with suid apps
>> +		cp .config.suid .config
>> +		oe_runmake busybox_unstripped
>> +		cp busybox_unstripped busybox.suid
>> +		oe_runmake busybox.links
>> +		cp busybox.links busybox.links.suid
>> +
>> +		# copy .config.orig back to .config, because the install process may check this file
>> +		cp .config.orig .config
>> +
>> +		# cleanup
>> +		rm .config.orig .config.nosuid.tmp .config.allno .config.suid.tmp .config.nosuid .config.suid
>> +	else
>> +		oe_runmake busybox_unstripped
>> +		cp busybox_unstripped busybox
>> +		oe_runmake busybox.links
>> +	fi
>> }
>>
>> do_install () {
>> -	oe_runmake busybox.links
>> 	if [ "${prefix}" != "/usr" ]; then
>> -		sed "s:^/usr/:${prefix}/:" busybox.links > busybox.links.new
>> -		mv busybox.links.new busybox.links
>> +		sed -i "s:^/usr/:${prefix}/:" busybox.links*
>> 	fi
>> 	if [ "${base_sbindir}" != "/sbin" ]; then
>> -		sed "s:^/sbin/:${base_sbindir}/:" busybox.links > busybox.links.new
>> -		mv busybox.links.new busybox.links
>> +		sed "s:^/sbin/:${base_sbindir}/:" busybox.links*
>> 	fi
>>
>> 	install -d ${D}${sysconfdir}/init.d
>> @@ -157,12 +193,21 @@ do_install () {
>> 		# Install /bin/busybox, and the /bin/sh link so the postinst script
>> 		# can run. Let update-alternatives handle the rest.
>> 		install -d ${D}${base_bindir}
>> -		if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
>> -			install -m 4755 ${B}/busybox ${D}${base_bindir}
>> +		if [ "${BUSYBOX_SPLIT_SUID}" = "1" ]; then
>> +			install -m 4755 ${B}/busybox.suid ${D}${base_bindir}
>> +			install -m 0755 ${B}/busybox.nosuid ${D}${base_bindir}
>> +			install -m 0644 ${S}/busybox.links.suid ${D}${sysconfdir}
>> +			install -m 0644 ${S}/busybox.links.nosuid ${D}${sysconfdir}
>> +			ln -sf busybox.nosuid ${D}${base_bindir}/sh
>> 		else
>> -			install -m 0755 ${B}/busybox ${D}${base_bindir}
>> +			if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
>> +				install -m 4755 ${B}/busybox ${D}${base_bindir}
>> +			else
>> +				install -m 0755 ${B}/busybox ${D}${base_bindir}
>> +			fi
>> +			install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>> +			ln -sf busybox ${D}${base_bindir}/sh
>> 		fi
>> -		ln -sf busybox ${D}${base_bindir}/sh
>> 	else
>> 		install -d ${D}${base_bindir} ${D}${base_sbindir}
>> 		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
>> @@ -181,6 +226,7 @@ do_install () {
>> 		if [ -f ${D}/linuxrc.${BPN} ]; then
>> 			mv ${D}/linuxrc.${BPN} ${D}/linuxrc
>> 		fi
>> +		install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>> 	fi
>>
>> 	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
>> @@ -217,7 +263,6 @@ do_install () {
>>                         install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
>>                 fi
>> 	fi
>> -	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
>>
>>      if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>>          install -d ${D}${systemd_unitdir}/system
>> @@ -248,22 +293,27 @@ python do_package_prepend () {
>>
>>      dvar = d.getVar('D', True)
>>      pn = d.getVar('PN', True)
>> -    f = open('%s/etc/busybox.links' % (dvar), 'r')
>> -
>> -    if os.path.exists('%s/bin/busybox' % (dvar)):
>> -        d.setVar('ALTERNATIVE_TARGET', "/bin/busybox")
>> -
>> -    for alt_link_name in f:
>> -        alt_link_name = alt_link_name.strip()
>> -        alt_name = os.path.basename(alt_link_name)
>> -
>> -        # Match coreutils
>> -        if alt_name == '[':
>> -            alt_name = 'lbracket'
>>
>> -        d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
>> -        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
>> -    f.close()
>> +    def set_alternative_vars(links, target):
>> +        f = open('%s%s' % (dvar, links), 'r')
>> +        for alt_link_name in f:
>> +            alt_link_name = alt_link_name.strip()
>> +            alt_name = os.path.basename(alt_link_name)
>> +            # Match coreutils
>> +            if alt_name == '[':
>> +                alt_name = 'lbracket'
>> +            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
>> +            d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
>> +            if os.path.exists('%s%s' % (dvar, target)):
>> +                d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
>> +        f.close()
>> +        return
>> +
>> +    if os.path.exists('%s/etc/busybox.links' % (dvar)):
>> +        set_alternative_vars("/etc/busybox.links", "/bin/busybox")
>> +    else:
>> +        set_alternative_vars("/etc/busybox.links.nosuid", "/bin/busybox.nosuid")
>> +        set_alternative_vars("/etc/busybox.links.suid", "/bin/busybox.suid")
>> }
>>
>> pkg_prerm_${PN} () {
>> diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
>> index 3ff8a88..511f1f8 100644
>> --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
>> +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
>> @@ -36,7 +36,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>>             file://busybox-sulogin-empty-root-password.patch \
>>             file://inetd.conf \
>>             file://inetd \
>> -           file://login-utilities.cfg"
>> +           file://login-utilities.cfg \
>> +           file://suid_config_list"
>>
>> SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
>> SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


