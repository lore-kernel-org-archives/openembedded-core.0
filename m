Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A86C160889
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 04:10:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2013 21:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,791,1363158000"; d="scan'208";a="343857769"
Received: from unknown (HELO [10.255.12.158]) ([10.255.12.158])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2013 21:11:17 -0700
Message-ID: <51AC1753.6010905@linux.intel.com>
Date: Sun, 02 Jun 2013 21:10:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>
References: <cover.1369895527.git.Qi.Chen@windriver.com>
	<61b6db5766ad5f6690aa059ffd26f0b00834e433.1369895527.git.Qi.Chen@windriver.com>
	<51A74576.6020604@linux.intel.com> <51ABFD47.80205@windriver.com>
In-Reply-To: <51ABFD47.80205@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: fix to support FEATURE_INDIVIDUAL
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
X-List-Received-Date: Mon, 03 Jun 2013 04:10:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2013 07:19 PM, ChenQi wrote:
> On 05/30/2013 08:26 PM, Saul Wold wrote:
>> On 05/30/2013 05:51 PM, Qi.Chen@windriver.com wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> Previously, if CONFIG_FEATURE_INDIVIDUAL was enabled for busybox,
>>> yocto-based systems could start correctly.
>>>
>>> This is because if busybox is built as individual apps, '/bin/busybox'
>>> may not be present, so setting the default ALTERNATIVE_TARGET to
>>> '/bin/busybox' is not appropriate and could lead to errors.
>>>
>>> This patch fixes this problem by checking the existence of
>>> '/bin/busybox'
>>> before setting the ALTERNATIVE_TARGET to '/bin/busybox'.
>>>
>>> After this change, if busybox is built as individual apps, we'll have
>>> links like '/bin/ls -> /bin/ls.busybox', otherwise, we'll have links
>>> like '/bin/ls -> /bin/busybox'.
>>>
>> Does this add size to the image?  In this example does ls.busybox link
>> to something else or is it a binary on it's own?
>>
>> Sau!
>>
>>
> It increases about 1M of the whole image size.
> ls.busybox, for example, is a binary.
>
That's NOT ok, we are looking to reduce the image size especially for 
core-image-minimal, I believe the static test I did with building a 
busybox with only a tinylogin config was actually smaller that the 
current tinylogin binary!

Please investigate this route, we also need to understand what other 
parts of busybox are using SetUID.

Thanks
	Sau!


> Best Regards,
> Chen Qi
>
>>> Besides, this patch removes the pkg_postinst part in the busybox recipe,
>>> because it's redundant.
>>>
>>> [YOCTO #4570]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   meta/recipes-core/busybox/busybox.inc |   16 +++++-----------
>>>   1 file changed, 5 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/busybox/busybox.inc
>>> b/meta/recipes-core/busybox/busybox.inc
>>> index c8908b0..6abe167 100644
>>> --- a/meta/recipes-core/busybox/busybox.inc
>>> +++ b/meta/recipes-core/busybox/busybox.inc
>>> @@ -171,7 +171,7 @@ do_install () {
>>>               install -m 0755 "0_lib/$NAME" "${D}$FILE.${BPN}"
>>>           done
>>>           # add suid bit where needed
>>> -        for i in `grep -E "APPLET.*_BB_SUID_((MAYBE|REQUIRE))"
>>> include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | cut -f
>>> 1 -d ','`; do
>>> +        for i in `grep -E "APPLET.*BB_SUID_((MAYBE|REQUIRE))"
>>> include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | cut -f
>>> 1 -d ','`; do
>>>               find ${D} -name $i.${BPN} -exec chmod a+s {} \;
>>>           done
>>>           install -m 0755 0_lib/libbusybox.so.${PV}
>>> ${D}${libdir}/libbusybox.so.${PV}
>>> @@ -242,14 +242,16 @@ ALTERNATIVE_TARGET[syslog-init] =
>>> "${sysconfdir}/init.d/syslog.${BPN}"
>>>   ALTERNATIVE_LINK_NAME[syslog-startup-conf] =
>>> "${sysconfdir}/syslog-startup.conf"
>>>   ALTERNATIVE_TARGET[syslog-startup-conf] =
>>> "${sysconfdir}/syslog-startup.conf.${BPN}"
>>>
>>> -ALTERNATIVE_TARGET = "/bin/busybox"
>>> -
>>>   python do_package_prepend () {
>>>       # We need to load the full set of busybox provides from the
>>> /etc/busybox.links
>>>       # Use this to see the update-alternatives with the right
>>> information
>>>
>>>       dvar = d.getVar('D', True)
>>>       pn = d.getVar('PN', True)
>>> +
>>> +    if os.path.exists('%s/bin/busybox' % (dvar)):
>>> +        d.setVar('ALTERNATIVE_TARGET', "/bin/busybox")
>>> +
>>>       f = open('%s/etc/busybox.links' % (dvar), 'r')
>>>
>>>       for alt_link_name in f:
>>> @@ -265,14 +267,6 @@ python do_package_prepend () {
>>>       f.close()
>>>   }
>>>
>>> -pkg_postinst_${PN} () {
>>> -    # If we are not making an image we create links for the
>>> utilities that doesn't exist
>>> -    # so the update-alternatives script will get the utilities it needs
>>> -    # (update-alternatives have no problem replacing links later
>>> anyway)
>>> -    test -n 2> /dev/null || alias test='busybox test'
>>> -    if test "x$D" = "x"; then while read link; do if test ! -h
>>> "$link"; then case "$link" in /*/*/*) to="../../bin/busybox";;
>>> /bin/*) to="busybox";; /*/*) to="../bin/busybox";; esac; busybox ln
>>> -s $to $link; fi; done </etc/busybox.links; fi
>>> -}
>>> -
>>>   pkg_prerm_${PN} () {
>>>       # This is so you can make busybox commit suicide - removing
>>> busybox with no other packages
>>>       # providing its files, this will make update-alternatives work,
>>> but the update-rc.d part
>>>
>>
>>
>
>
>

