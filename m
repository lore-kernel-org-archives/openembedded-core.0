Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sxf6B-0004Oh-QH
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 16:12:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2012 07:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="202247945"
Received: from unknown (HELO [10.252.121.37]) ([10.252.121.37])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2012 07:01:16 -0700
Message-ID: <501D2B2B.6070806@intel.com>
Date: Sat, 04 Aug 2012 17:01:15 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
	<CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
	<501CD3EE.3080100@intel.com>
	<CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
In-Reply-To: <CALbNGRTJM5=Xt4NqoEuEQa2U-eMtmQzy42HmwRK0zvkq-zK-3Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Sat, 04 Aug 2012 14:13:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit



On 08/04/2012 12:29 PM, Andreas Müller wrote:
> On Sat, Aug 4, 2012 at 9:49 AM, Laurentiu Palcu
> <laurentiu.palcu@intel.com> wrote:
>>
>>
>> On 08/04/2012 02:22 AM, Andreas Müller wrote:
>>> On Fri, Aug 3, 2012 at 10:19 PM, Laurentiu Palcu
>>> <laurentiu.palcu@intel.com> wrote:
>>>> This will improve first boot time because building the icon cache is
>>>> done on host, with more processing power than the target.
>>>>
>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>> ---
>>>>  meta/classes/gtk-icon-cache.bbclass |   10 ++--------
>>>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
>>>> index 01fb2f3..2d82c54 100644
>>>> --- a/meta/classes/gtk-icon-cache.bbclass
>>>> +++ b/meta/classes/gtk-icon-cache.bbclass
>>>> @@ -1,18 +1,12 @@
>>>>  FILES_${PN} += "${datadir}/icons/hicolor"
>>>>
>>>> -DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
>>>> +DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+-native"
>>>>
>>>> -# This could run on the host as icon cache files are architecture independent,
>>>> -# but there is no gtk-update-icon-cache built natively.
>>>>  gtk_icon_cache_postinst() {
>>>> -if [ "x$D" != "x" ]; then
>>>> -        exit 1
>>>> -fi
>>>> -
>>>>  # Update the pixbuf loaders in case they haven't been registered yet
>>>>  GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
>>>>
>>>> -for icondir in /usr/share/icons/* ; do
>>>> +for icondir in $D/usr/share/icons/* ; do
>>>>      if [ -d $icondir ] ; then
>>>>          gtk-update-icon-cache -fqt  $icondir
>>>>      fi
>>>> --
>>>> 1.7.9.5
>>>>
>>> Long time ago there was a patch introducing gtk-icon-cache to be only
>>> run once on the machine [1] and I am still using that. At that time I
>>> was asked for a more generic approach. Now I ask:
>>>
>>> 1. Wouldn't it be better to have gtk-icon-cache run once even on host
>> But this is what these patches do. Make gtk-update-icon-cache run on
>> host, when the target rootfs is constructed, rather than running it on
>> target, at first boot.
> As far as I can see gtk-icon-cache is run for each package - how much
> extra build time at do_rootfs is to expect?
I didn't measure it. But I didn't notice do_roofts task taking a lot
more than it took previously. However, host machines these days have
lots of MHz under the hood, multiple cores and quite a lot of RAM,
compared to target machines. So, I do believe that waiting for some
extra tens of seconds at build time is a trade-off we can live with,
compared to waiting entire minutes for the target's first boot.

Thanks,
Laurentiu
> 
> Andreas
>>
>> Thanks,
>> Laurentiu
>>
>>> 2. Or better: How about a postinst 'runonce' framework for host/machine?
>>>
>>> Andreas
>>>
>>> [1] http://patches.openembedded.org/patch/24179/
>>>
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 


