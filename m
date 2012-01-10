Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkPHL-0000jk-Qu
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 01:09:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 16:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105270175"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2012 16:01:53 -0800
Message-ID: <4F0B7FF0.9060904@linux.intel.com>
Date: Mon, 09 Jan 2012 16:01:52 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325903501.git.tom.zanussi@intel.com>
	<1d28eae1f497931d4a0a232a3390a9737a508aec.1325903501.git.tom.zanussi@intel.com>
	<4F07D3CA.4090807@linux.intel.com>
	<1325913187.15053.83.camel@elmorro>
In-Reply-To: <1325913187.15053.83.camel@elmorro>
Subject: Re: [PATCH 1/5] base.bbclass: add support for LICENSE_FLAGS
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
X-List-Received-Date: Tue, 10 Jan 2012 00:09:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 09:13 PM, Tom Zanussi wrote:
> On Fri, 2012-01-06 at 21:10 -0800, Saul Wold wrote:
>> On 01/06/2012 06:34 PM, tom.zanussi@intel.com wrote:
>>> From: Tom Zanussi<tom.zanussi@intel.com>
>>>
>>> LICENSE_FLAGS are a per-recipe replacement for the COMMERCIAL_LICENSE
>>> mechanism.
>>>
>>> In the COMMERCIAL_LICENSE mechanism, any package name mentioned in the
>>> global COMMERCIAL_LICENSE list is 'blacklisted' from being included in
>>> an image.  To allow the blacklisted package into the image, the
>>> corresponding packages need to be removed from the COMMERCIAL_LICENSE
>>> list.  This mechanism relies on a global list defined in
>>> default-distrovars.inc.
>>>
>>> The LICENSE_FLAGS mechanism essentially implements the same thing but
>>> turns the global blacklist into a per-recipe whitelist.  Any recipe
>>> can optionally define one or more 'license flags'; if defined, each of
>>> the license flags defined for a recipe must have matching entries in a
>>> global LICENSE_FLAGS_WHITELIST variable.  Typically a recipe will have
>>> a single license flag specific to itself, which allows it to be
>>> individually toggled on and off.  For example, a package named 'foo'
>>> might define a single license flag, 'commercial_foo':
>>>
>>> LICENSE_FLAGS = "commercial_foo"
>>>
>>> This says that in order for the foo package to be included in the
>>> image, the string 'commercial_foo' must appear in the
>>> LICENSE_FLAGS_WHITELIST variable:
>>>
>>> LICENSE_FLAGS_WHITELIST = "commercial_foo"
>>>
>>> Because the typical case is indeed to create LICENSE_FLAGS containing
>>> the package name, the LICENSE_FLAGS could just as well have been
>>> specified as:
>>>
>>> LICENSE_FLAGS = "commercial_${PN}
>>>
>>> which would pick up the package name automatically.
>>>
>>> The mechanism has the word 'flags' in the name because although the
>>> typical case is to specify a single string to match as above, the user
>>> can add additional strings that might be thought of additional
>>> 'attributes' of a license that also need to be matched.  This allows
>>> for the creation and specification of license categories that could be
>>> used to flexibly match sets of packages that match certain attributes
>>> without forcing them to all be specified individually.  For example, a
>>> particular set of recipes that are typically used together might all
>>> contain a 'commercial_video' flag.  Additionally, some of them might
>>> specify an additional 'binary' flag meaning that it's not possible to
>>> get the source for those packages.  Specifying both 'commercial_video
>>> and binary' in the LICENSE_FLAGS_WHITELIST would allow them all to be
>>> pulled in, but if 'binary' was missing, it would only allow those
>>> packages that had source to be allowed in to the image.
>>>
>>> The current behavior of COMMERCIAL_LICENSE is replicated as mentioned
>>> above by having the current set of COMMERCIAL_LICENSE flags implement
>>> their using LICENSE_FLAGS = "commercial_${PN}.
>>>
>>> That being the case, the current COMMERCIAL_LICENSE can equivalently
>>> be specified in the new scheme by putting the below in local.conf:
>>>
>>>    # This is a list of packages that require a commercial license to ship
>>>    # product. If shipped as part of an image these packages may have
>>>    # implications so they are disabled by default.  To enable them,
>>>    # un-comment the below as appropriate.
>>>    #LICENSE_FLAGS_WHITELIST = "commercial_gst-fluendo-mp3 \
>>>    #                           commercial_gst-openmax \
>>>    #                           commercial_gst-plugins-ugly \
>>>    #                           commercial_lame \
>>>    #                           commercial_libmad \
>>>    #                           commercial_libomxil \
>>>    #                           commercial_mpeg2dec \
>>>    #                           commercial_qmmp"
>>>
>> Would it not make sense to add this to local.conf.sample.extended in
>> meta-yocto?
>>
>
> Yes, I was going to do that, but didn't want to bother if it wasn't
> going anywhere.  I'll send a patch for it...
>
> Tom
>
>> This won't hold up this patch set.
>>
>> Sau!
>>
>>
>>> The above allows all of the current COMMERCIAL_LICENSE packages in -
>>> to disallow a particular package from appearing in the image, simply
>>> remove it from the whitelist.
>>>
>>> Signed-off-by: Tom Zanussi<tom.zanussi@intel.com>
>>> ---
>>>    meta/classes/base.bbclass |   19 +++++++++++++++++++
>>>    1 files changed, 19 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>>> index e65a722..4aeba1b 100644
>>> --- a/meta/classes/base.bbclass
>>> +++ b/meta/classes/base.bbclass
>>> @@ -349,6 +349,25 @@ python () {
>>>        if license == "INVALID":
>>>            bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)
>>>
>>> +    def skip_package(pn, flag):
>>> +        bb.debug(1, "Skipping %s because it has a restricted license (%s) not"
>>> +             " whitelisted in LICENSE_FLAGS_WHITELIST" % (pn, flag))
>>> +        raise bb.parse.SkipPackage("because it may require a special license"
>>> +            " to ship in a product (listed in LICENSE_FLAGS)")
>>> +
>>> +    def all_license_flags_match(flags, whitelist):
>>> +        for flag in flags.split():
>>> +            if not flag in whitelist.split():
>>> +                return False
>>> +        return True
>>> +
>>> +    license_flags = d.getVar('LICENSE_FLAGS', True)
>>> +    if license_flags:
>>> +        license_flags_whitelist = d.getVar('LICENSE_FLAGS_WHITELIST', True)
>>> +        if not license_flags_whitelist or not all_license_flags_match(
>>> +                license_flags, license_flags_whitelist):
>>> +            skip_package(pn, license_flags)
>>> +
>>>        commercial_license = " %s " % d.getVar('COMMERCIAL_LICENSE', 1)
>>>        import re
>>>        pnr = "[ \t]%s[ \t]" % pn.replace('+', "\+")
>>
With all the discussion about License related stuff on the list and IRC, 
I think we should be creating a bbclass to define and hold these flags. 
  Then there is just a call from base.bbclass into check_license_flags 
and return True/False for the skip_package().

And based on a comment from Chris L. on the IRC, will this handle 
package level LICENSE_FLAGS, this is recipe level currently, correct?

It could be you have some recipe with multiple binaries (for example) 
some are OK and some are not and they are packaged separately. Can the 
LICENSE_FLAGS handle this?

Sau!

>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


