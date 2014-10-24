Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 742236AC08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 06:16:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O6Gdxa010355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Oct 2014 23:16:40 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 23 Oct 2014 23:16:39 -0700
Message-ID: <5449EEC4.4070303@windriver.com>
Date: Fri, 24 Oct 2014 14:16:36 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1413960370.git.Chong.Lu@windriver.com>
	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
	<73178E47-C311-4EA8-9B4C-6691A7E6B82A@dominion.thruhere.net>
In-Reply-To: <73178E47-C311-4EA8-9B4C-6691A7E6B82A@dominion.thruhere.net>
X-Originating-IP: [128.224.162.204]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Fri, 24 Oct 2014 06:16:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/24/2014 02:10 PM, Koen Kooi wrote:
>> Op 22 okt. 2014, om 09:09 heeft Chong Lu <Chong.Lu@windriver.com> het volgende geschreven:
>>
>> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
>> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
>> in the sdk:
>> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
>> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
>> gconf-3.2.6-r0.0.x86_64
>>
>> Move org.gnome.GConf.service to ${libdir}, then the conflict was fixed.
> And I suspect its dbus service won't work anymore after moving the files. How have you tested this change?

I just focus on the conflicts, not to test dbus service.
Or do you have any suggestion to fix this conflicts?

Best Regards
Chong

>
>> Add split out the client libraries into a separate package.
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>> ---
>> meta/recipes-gnome/gnome/gconf_3.2.6.bb | 10 ++++++++--
>> 1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
>> index 17fdafa..bbb13b2 100644
>> --- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
>> +++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
>> @@ -19,6 +19,8 @@ SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
>>
>> S = "${WORKDIR}/GConf-${PV}"
>>
>> +PACKAGES =+ "libgconf"
>> +
>> EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
>>                  --disable-introspection --disable-orbit --with-openldap=no --disable-gtk"
>>
>> @@ -37,6 +39,8 @@ do_install_append() {
>> 	# this stuff is unusable
>> 	rm -f ${D}${libdir}/GConf/*/*.*a
>> 	rm -f ${D}${libdir}/gio/*/*.*a
>> +
>> +	mv ${D}${datadir}/dbus-1 ${D}${libdir}/
>> }
>>
>> do_install_append_class-native() {
>> @@ -47,13 +51,15 @@ do_install_append_class-native() {
>> # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
>> RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
>> RDEPENDS_${PN}_class-native = ""
>> +RDEPENDS_${PN} += "libgconf"
>>
>> FILES_${PN} += "${libdir}/GConf/* \
>> -                ${libdir}/gio/*/*.so \
>>                  ${datadir}/polkit* \
>> -                ${datadir}/dbus-1/services/*.service \
>>                  ${datadir}/dbus-1/system-services/*.service \
>>                 "
>> +FILES_libgconf = "${libdir}/lib*${SOLIBS} ${libdir}/gio/modules/*.so \
>> +                  ${libdir}/dbus-1/services/*.service"
>> +
>> FILES_${PN}-dbg += "${libdir}/*/*/.debug"
>> FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
>>
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>


