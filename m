Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 96DDB6E304
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:30:38 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u57so3129878wes.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 03:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lEjIP7V5z48LWFQMrtuXFSUKTj73WmaI7ju7eVQI4zo=;
	b=iGd4lPFzNbYd84T8VLldoOFj+ctTw9WG7pMxyciZkbCZMngpZM3cM/zTESzJPFWBW6
	hmzk6ywGrlXWc+EaR4i33V5hPcLjGvqaHpUkeUoVXdW5P8oGNmMCIAlK10CbzbB+uNiC
	xlaZy0xA0Q8+Hga+XtX8UkNThx9KTliMtzhfPPyd2z2VvrWcr9BPpESPKWkrR4Ew38MF
	O6fenRBOTTab/T6FirLAdyceTa/zHa9LKyzTpMeeS1S62cqRHms0WWerz4h+BKsz7RN6
	lmkwiOkwiKl4rCglxAHEmwEMPXFay380cdiDTuapiZdZMJhSFgzxpryvP2lJm9Bt1htF
	WgqA==
X-Gm-Message-State: ALoCoQmhLg5QewjHrT5enioVn3DoROu2tRS4ely+O4qk/9JROvGHcumUVA/OuCOtkNTHc7N67rUJ
X-Received: by 10.180.90.140 with SMTP id bw12mr3412277wib.18.1396607439214;
	Fri, 04 Apr 2014 03:30:39 -0700 (PDT)
Received: from ?IPv6:2001:610:612:0:2ad2:44ff:fe4b:bc17?
	([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	w12sm18594450eez.36.2014.04.04.03.30.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 03:30:38 -0700 (PDT)
Message-ID: <533E89CD.206@linaro.org>
Date: Fri, 04 Apr 2014 12:30:37 +0200
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
	<20140404101456.GI2132@jama>
In-Reply-To: <20140404101456.GI2132@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 10:30:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2014 12:14 PM, Martin Jansa wrote:
> On Fri, Apr 04, 2014 at 10:53:37AM +0200, Koen Kooi wrote:
>> When installing 'dbus-1' it will drag in X11 libs due to ${bindir}/dbus-launch being in ${PN}. Move it to a seperate package to be able to generate a small filesystem (e.g. initrd) without X11 libs without needed a seperate DISTRO.conf.
>>
>> There will be no functional changes for existing image and packagegroup recipes since ${PN} has 'dbus-launch' in RRECOMMENDS. So to filter out dbus-launch you need to add it to BAD_RECOMMENDATIONS in the image recipe.
>>
>> This is in essence a revert of:
>>
>> 	commit c02364f36e228835ea5d7fd4e1d347fd451f8544
>> 	Author: Radu Moisan <radu.moisan@intel.com>
>> 	Date:   Tue Jul 31 09:23:23 2012 +0300
>>
>> 	    dbus: include dbus-launch in the main dbus package
>>
>> But as pointed out above, ${bindir}/dbus-launch will end up in the rootfs as before, so the issue behind c02364f36e228835ea5d7fd4e1d347fd451f8544 of a missing ${bindir}/dbus-launch won't suddenly pop up.
>>
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>
>> I've boot tested this both with BAD_RECOMMENDATIONS and without and it seems to work as intended. The big question is how to address the dbus-x11 (R)PROVIDE entries. I feel 'dbus-launch' is a much better name than 'dbus-x11', but I don't mind respinning this patch with 'dbus-x11'.
>>
>>
>>   meta/recipes-core/dbus/dbus.inc | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> index 677ff78..28074be 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -37,7 +37,7 @@ CONFFILES_${PN} = "${sysconfdir}/dbus-1/system.conf ${sysconfdir}/dbus-1/session
>>
>>   DEBIANNAME_${PN} = "dbus-1"
>>
>> -PACKAGES =+ "${PN}-lib"
>> +PACKAGES =+ "${PN}-lib dbus-launch"
>>
>>   OLDPKGNAME = "dbus-x11"
>>   OLDPKGNAME_class-nativesdk = ""
>> @@ -51,15 +51,20 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>>                  ${bindir}/dbus-cleanup-sockets \
>>                  ${bindir}/dbus-send \
>>                  ${bindir}/dbus-monitor \
>> -               ${bindir}/dbus-launch \
>>                  ${libexecdir}/dbus* \
>>                  ${sysconfdir} \
>>                  ${localstatedir} \
>>                  ${datadir}/dbus-1/services \
>>                  ${datadir}/dbus-1/system-services \
>>                  ${systemd_unitdir}/system/"
>> +
>>   FILES_${PN}-lib = "${libdir}/lib*.so.*"
>>   RRECOMMENDS_${PN}-lib = "${PN}"
>> +
>> +FILES_dbus-launch = "${bindir}/dbus-launch"
>> +RDEPENDS__dbus-launch = "${PN}"
>> +RRECOMMENDS_${PN} += "dbus-launch"
>
> Is there special reason for not using ${PN}-launch?

PN is 'dbus-1', not 'dbus'

>
> There is extra underscore in RDEPENDS.

Good catch, thanks!

>
>> +
>>   FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
>>
>>   pkg_postinst_dbus() {
>> --
>> 1.9.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

