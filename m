Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TzlLm-0005tX-CB
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:50:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jan 2013 01:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="282979582"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2013 01:34:21 -0800
Message-ID: <510647BF.5070408@intel.com>
Date: Mon, 28 Jan 2013 11:41:19 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<1359126654.13917.13.camel@ted>
In-Reply-To: <1359126654.13917.13.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Mon, 28 Jan 2013 09:50:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01/25/2013 05:10 PM, Richard Purdie wrote:
> On Fri, 2013-01-25 at 15:04 +0000, Burton, Ross wrote:
>> On 25 January 2013 14:59, Radu Moisan <radu.moisan@intel.com> wrote:
>>> +# "multi-user" vs "graphical"
>>> +SYSTEMD_DEFAULT_TARGET ?= "multi-user"
>> Default to "graphical", so we're not regressing and just introducing a
>> warning if someone doesn't set this and doesn't have X.
>>
>>> @@ -95,6 +95,11 @@ do_install() {
>>>          install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
>>>
>>>          install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
>>> +
>>> +
>>> +       if [ -n ${SYSTEMD_DEFAULT_TARGET} ]; then
>>> +               ln -s ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET}.target ${D}${sysconfdir}/systemd/system/default.target
>>> +       fi
>> This will have to happen at image construction time and not package
>> generation time, as different images may have different targets but
>> share the same systemd package.
>>
>> A rootfs-time postinstall script would work, but isn't very nice.  I
>> wonder if there's a better solution, hooking into the image creation
>> should work.
>>
>> (thinks)
> The point here is that images shouldn't give errors at runtime. Nothing
> above does anything to address that.

I don't understand what you mean. The patch addresses exactly that, 
warning at runtime, to be more specific the warning about 
display-manager.service
However though, I understand the issues with this approach, so I'll dig 
a little more into Martin's approach with update-alternatives.

Radu


