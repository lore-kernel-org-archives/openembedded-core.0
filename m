Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E72696076F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 06:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1R6hr23001178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 22:43:53 -0800 (PST)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Tue, 26 Feb 2019 22:43:52 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1541756554-194955-1-git-send-email-changqing.li@windriver.com>
	<1cde5575-80c7-eeb2-3d62-9d7231966247@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <33e03954-5a6e-4c78-0c22-ebd00003af09@windriver.com>
Date: Wed, 27 Feb 2019 14:43:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1cde5575-80c7-eeb2-3d62-9d7231966247@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] update-rc.d.bbclass: remove preinst and remove -f for postinst
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
X-List-Received-Date: Wed, 27 Feb 2019 06:43:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping

On 12/27/18 11:02 AM, Changqing Li wrote:
> ping
>
> On 11/9/18 5:42 PM, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> *preinst use "-f remove" to remove any links in the /etc/rcrunlevel.d
>>   but this will make user cannot keep previous config by default after
>>   upgrade
>>
>>   eg: user disable one service before upgrade, after upgrade, service
>>   could be started since during preinst, all link have been deleted, so
>>   postinst may create the link to start service.
>>
>>   remove preinst to keep previous links, so that after upgrade, if any
>>   link existed for the package, postinst will not create new start/stop
>>   links.
>>
>>   (note: patch of support enable/disable function of update-rc.d send
>>   to yocto mail list today)
>>
>> *remove -f for postinst, previously, recipe keepalived use remove during
>>   postinst, so need this -f, but remove in postinst is not proper, 
>> recipe
>>   keepalived have fixed this problem, so remove -f.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/classes/update-rc.d.bbclass | 28 ++++------------------------
>>   1 file changed, 4 insertions(+), 24 deletions(-)
>>
>> diff --git a/meta/classes/update-rc.d.bbclass 
>> b/meta/classes/update-rc.d.bbclass
>> index 265c4be..1366fee 100644
>> --- a/meta/classes/update-rc.d.bbclass
>> +++ b/meta/classes/update-rc.d.bbclass
>> @@ -20,28 +20,14 @@ def use_updatercd(d):
>>           return '[ -n "$D" -o ! -d /run/systemd/system ]'
>>       return 'true'
>>   -updatercd_preinst() {
>> -if ${@use_updatercd(d)} && [ -z "$D" -a -f 
>> "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
>> -    ${INIT_D_DIR}/${INITSCRIPT_NAME} stop || :
>> -fi
>> -if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; 
>> then
>> -    if [ -n "$D" ]; then
>> -        OPT="-f -r $D"
>> -    else
>> -        OPT="-f"
>> -    fi
>> -    update-rc.d $OPT ${INITSCRIPT_NAME} remove
>> -fi
>> -}
>> -
>>   PACKAGE_WRITE_DEPS += "update-rc.d-native"
>>     updatercd_postinst() {
>>   if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; 
>> then
>>       if [ -n "$D" ]; then
>> -        OPT="-f -r $D"
>> +        OPT="-r $D"
>>       else
>> -        OPT="-f -s"
>> +        OPT="-s"
>>       fi
>>       update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
>>   fi
>> @@ -79,7 +65,7 @@ python __anonymous() {
>>   PACKAGESPLITFUNCS_prepend = 
>> "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 
>> 'populate_packages_updatercd ', '', d)}"
>>   PACKAGESPLITFUNCS_remove_class-nativesdk = 
>> "populate_packages_updatercd "
>>   -populate_packages_updatercd[vardeps] += "updatercd_prerm 
>> updatercd_postrm updatercd_preinst updatercd_postinst"
>> +populate_packages_updatercd[vardeps] += "updatercd_prerm 
>> updatercd_postrm updatercd_postinst"
>>   populate_packages_updatercd[vardepsexclude] += "OVERRIDES"
>>     python populate_packages_updatercd () {
>> @@ -95,7 +81,7 @@ python populate_packages_updatercd () {
>>               d.appendVar('RDEPENDS_' + pkg, ' %sinitd-functions' % 
>> (mlprefix))
>>         def update_rcd_package(pkg):
>> -        bb.debug(1, 'adding update-rc.d calls to 
>> preinst/postinst/prerm/postrm for %s' % pkg)
>> +        bb.debug(1, 'adding update-rc.d calls to 
>> postinst/prerm/postrm for %s' % pkg)
>>             localdata = bb.data.createCopy(d)
>>           overrides = localdata.getVar("OVERRIDES")
>> @@ -103,12 +89,6 @@ python populate_packages_updatercd () {
>>             update_rcd_auto_depend(pkg)
>>   -        preinst = d.getVar('pkg_preinst_%s' % pkg)
>> -        if not preinst:
>> -            preinst = '#!/bin/sh\n'
>> -        preinst += localdata.getVar('updatercd_preinst')
>> -        d.setVar('pkg_preinst_%s' % pkg, preinst)
>> -
>>           postinst = d.getVar('pkg_postinst_%s' % pkg)
>>           if not postinst:
>>               postinst = '#!/bin/sh\n'
>
-- 
BRs

Sandy(Li Changqing)


