Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4255065CED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 01:43:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAD1hdQI012828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 17:43:40 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 12 Nov 2014 17:43:39 -0800
Message-ID: <54640CC9.1080509@windriver.com>
Date: Thu, 13 Nov 2014 09:43:37 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1415699201.git.hongxu.jia@windriver.com>	<37d7153a864b4dee5748a3a30054c0c62e243f02.1415699201.git.hongxu.jia@windriver.com>	<FB878F6E-62D1-49FB-A373-EF554D0A274D@dominion.thruhere.net>
	<54640951.3040005@windriver.com>
In-Reply-To: <54640951.3040005@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] avahi.inc: rename package to use avahi to instead of avahi-daemon
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
X-List-Received-Date: Thu, 13 Nov 2014 01:43:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2014 09:28 AM, Hongxu Jia wrote:
> On 11/12/2014 06:27 PM, Koen Kooi wrote:
>>> Op 11 nov. 2014, om 11:52 heeft Hongxu Jia 
>>> <hongxu.jia@windriver.com> het volgende geschreven:
>>>
>>> The package avahi does not exist, as SUMMARY said, we should
>>> use avahi-daemon to instead. It avoids the do_rootfs failure
>>> while IMAGE_INSTALL += "avahi"
>>>
>>> For compatibility, let avahi to provide avahi-daemon.
>> As stated before:
>>
>> 1) Fix your IMAGE_INSTALL
>
> Could you describe what's wrong with IMAGE_INSTALL?
> I have no idea about it.
>
>> 2) This breaks upgrade paths
>>
>> Do you *really* want to break existing installs just so you can 
>> pretend that your recipename==package name assumption isn't wrong?
>
> What does *upgrade paths* means?
>

Do you mean use package management to upgrade the
package, such as "smart upgrade". If yes, I think you are right,
we could drop patch 1/3 and 2/3.

//Hongxu


> //Hongxu
>
>>
>>> [YOCTO #6937]
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>> meta/recipes-connectivity/avahi/avahi.inc | 29 
>>> ++++++++++++++---------------
>>> 1 file changed, 14 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/avahi/avahi.inc 
>>> b/meta/recipes-connectivity/avahi/avahi.inc
>>> index b060437..581d51b 100644
>>> --- a/meta/recipes-connectivity/avahi/avahi.inc
>>> +++ b/meta/recipes-connectivity/avahi/avahi.inc
>>> @@ -29,8 +29,8 @@ SRC_URI = 
>>> "http://avahi.org/download/avahi-${PV}.tar.gz \
>>>            file://reuseport-check.patch \
>>>            "
>>>
>>> -USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
>>> -USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
>>> +USERADD_PACKAGES = "avahi avahi-autoipd"
>>> +USERADD_PARAM_avahi = "--system --home /var/run/avahi-daemon \
>>>                                --no-create-home --shell /bin/false \
>>>                                --user-group avahi"
>>>
>>> @@ -71,11 +71,10 @@ do_configure_prepend() {
>>> }
>>>
>>>
>>> -PACKAGES =+ "avahi-daemon libavahi-common libavahi-core 
>>> libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui 
>>> avahi-autoipd avahi-utils"
>>> +PACKAGES =+ "libavahi-common libavahi-core libavahi-client 
>>> avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
>>>
>>> -# As avahi doesn't put any files into PN, clear the files list to 
>>> avoid problems
>>> -# if extra libraries appear.
>>> -FILES_avahi = ""
>>> +# For compatibility, let avahi to provide avahi-daemon
>>> +RPROVIDES_${PN} = "${PN}-daemon"
>>> FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
>>> ${sysconfdir}/avahi/avahi-autoipd.action \
>>>                         ${sysconfdir}/dhcp/*/avahi-autoipd \
>>> @@ -83,7 +82,7 @@ FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
>>> ${sysconfdir}/udhcpc.d/99avahi-autoipd"
>>> FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
>>> FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
>>> -FILES_avahi-daemon = "${sbindir}/avahi-daemon \
>>> +FILES_${PN} = "${sbindir}/avahi-daemon \
>>>                        ${sysconfdir}/avahi/avahi-daemon.conf \
>>>                        ${sysconfdir}/avahi/hosts \
>>>                        ${sysconfdir}/avahi/services \
>>> @@ -102,10 +101,10 @@ FILES_libavahi-glib = 
>>> "${libdir}/libavahi-glib.so.*"
>>> FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
>>> FILES_avahi-utils = "${bindir}/avahi-*"
>>>
>>> -RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core 
>>> (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
>>> +RDEPENDS_${PN}-dev = "avahi (= ${EXTENDPKGV}) libavahi-core (= 
>>> ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
>>>
>>> # uclibc has no nss
>>> -RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
>>> +RRECOMMENDS_avahi_append_libc-glibc = " libnss-mdns"
>>> RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
>>>
>>> RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev 
>>> glib-2.0-dev update-rc.d-dev"
>>> @@ -113,11 +112,11 @@ RRECOMMENDS_avahi-dev_append_libc-glibc = " 
>>> gettext-dev"
>>>
>>> RRECOMMENDS_avahi-dev[nodeprrecs] = "1"
>>>
>>> -CONFFILES_avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
>>> +CONFFILES_avahi = "${sysconfdir}/avahi/avahi-daemon.conf"
>>>
>>> -INITSCRIPT_PACKAGES = "avahi-daemon avahi-dnsconfd"
>>> -INITSCRIPT_NAME_avahi-daemon = "avahi-daemon"
>>> -INITSCRIPT_PARAMS_avahi-daemon = "defaults 21 19"
>>> +INITSCRIPT_PACKAGES = "avahi avahi-dnsconfd"
>>> +INITSCRIPT_NAME_avahi = "avahi-daemon"
>>> +INITSCRIPT_PARAMS_avahi = "defaults 21 19"
>>> INITSCRIPT_NAME_avahi-dnsconfd = "avahi-dnsconfd"
>>> INITSCRIPT_PARAMS_avahi-dnsconfd = "defaults 22 19"
>>>
>>> @@ -141,13 +140,13 @@ do_install() {
>>> # At the time the postinst runs, dbus might not be setup so only 
>>> restart if running
>>> # Don't exit early, because update-rc.d needs to run subsequently.
>>>
>>> -pkg_postinst_avahi-daemon () {
>>> +pkg_postinst_avahi () {
>>> if [ -z "$D" ]; then
>>>     killall -q -HUP dbus-daemon || true
>>> fi
>>> }
>>>
>>> -pkg_postrm_avahi-daemon () {
>>> +pkg_postrm_avahi () {
>>>     deluser avahi || true
>>>     delgroup avahi || true
>>> }
>>> -- 
>>> 1.9.1
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>


