Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id CB9537388F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4249F3151424;
	Thu,  5 Mar 2015 15:09:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Mzh5iajfFYCR; Thu,  5 Mar 2015 15:09:49 +0100 (CET)
Received: from [172.22.22.61] (55d44e54.access.ecotel.net [85.212.78.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 48CDE3151414;
	Thu,  5 Mar 2015 15:09:49 +0100 (CET)
Message-ID: <54F863AC.1050204@opendreambox.org>
Date: Thu, 05 Mar 2015 15:09:48 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>	
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>	
	<1425504462-6979-2-git-send-email-bruno.bottazzini@intel.com>	
	<54F83775.5040604@opendreambox.org>
	<1425561390.2707.29.camel@bottazzini-ThinkPad-T430>
In-Reply-To: <1425561390.2707.29.camel@bottazzini-ThinkPad-T430>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus: split tools package.
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
X-List-Received-Date: Thu, 05 Mar 2015 14:09:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 05.03.2015 14:16, Bottazzini, Bruno wrote:
> On Qui, 2015-03-05 at 12:01 +0100, Andreas Oberritter wrote:
>> Hello Gustavo,
>>
>> On 04.03.2015 22:27, Bruno Bottazzini wrote:
>>> From: Gustavo Sverzut Barbieri <gustavo.barbieri@intel.com>
>>>
>>> Most tools are not required if one is launching a simple daemon.
>>> The user will be able to exclude dbus-tool and save some space in his
>>> build
>>>
>>> Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
>>> ---
>>>  meta/recipes-core/dbus/dbus.inc | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>>> index fb5d017..f975dc9 100644
>>> --- a/meta/recipes-core/dbus/dbus.inc
>>> +++ b/meta/recipes-core/dbus/dbus.inc
>>> @@ -39,13 +39,13 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>>>  
>>>  DEBIANNAME_${PN} = "dbus-1"
>>>  
>>> -PACKAGES =+ "${PN}-lib"
>>> +PACKAGES =+ "${PN}-lib ${PN}-tools"
>>>  
>>>  OLDPKGNAME = "dbus-x11"
>>>  OLDPKGNAME_class-nativesdk = ""
>>>  
>>>  # for compatibility
>>> -RPROVIDES_${PN} = "${OLDPKGNAME}"
>>> +RPROVIDES_${PN} = "${OLDPKGNAME} ${PN}-native-tools-native"
>>
>> this line seems to be wrong. What are you trying to solve with it?
>>
>> Regards,
>> Andreas
> 
> Hello Andreas, 
> 
> Could you be more specific what is wrong with this line ?
> 
> Have you tried removing it and compile it ?

No, I haven't. What kind of problem will it raise?

It looks wrong, because the package dbus doesn't provide dbus-tools, but
dbus-tools is instead provided by dbus-tools itself (with your patch
applied).

Furthermore, having "native" twice in a package name seems odd, but
there's no reason for target packages to provide anything "native" in
the first place.

Regards,
Andreas

> Try compiling this patch and see what it provides.
> 
> If you want to exclude the dbus-tools just add the following at your 
> local conf file: 
> PACKAGE_EXCLUDE = "dbus-tools".
> 
> Best Regards,
> 
> Bruno Bottazzini
> 
>>
>>>  RREPLACES_${PN} += "${OLDPKGNAME}"
>>>  
>>>  FILES_${PN} = "${bindir}/dbus-daemon* \
>>> @@ -64,6 +64,12 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>>>  FILES_${PN}-lib = "${libdir}/lib*.so.*"
>>>  RRECOMMENDS_${PN}-lib = "${PN}"
>>>  FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
>>> +FILES_${PN}-tools += "${bindir}/dbus-uuidgen \
>>> +                      ${bindir}/dbus-cleanup-sockets \
>>> +                      ${bindir}/dbus-monitor \
>>> +                      ${bindir}/dbus-launch \
>>> +                      ${bindir}/dbus-run-session"
>>> +RRECOMMENDS_${PN} = "${PN}-tools"
>>>  
>>>  pkg_postinst_dbus() {
>>>  	# If both systemd and sysvinit are enabled, mask the dbus-1 init script
>>>
>>
> 
> 


