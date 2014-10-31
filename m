Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0C2065CED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 09:30:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9V9UZrZ006185
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Oct 2014 02:30:36 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 31 Oct 2014 02:30:35 -0700
Message-ID: <545356B8.3070800@windriver.com>
Date: Fri, 31 Oct 2014 17:30:32 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1414738674.git.hongxu.jia@windriver.com>
	<1fa40bddf992a49a28c52f18d723bd4b76a36fa0.1414738674.git.hongxu.jia@windriver.com>
	<20141031085008.GB3482@lpalcu-linux>
In-Reply-To: <20141031085008.GB3482@lpalcu-linux>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] package_manager.py: fix rpm based do_rootfs failed while IMAGE_INSTALL_append = " python3"
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
X-List-Received-Date: Fri, 31 Oct 2014 09:30:41 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2014 04:50 PM, Laurentiu Palcu wrote:
> On Fri, Oct 31, 2014 at 03:05:58PM +0800, Hongxu Jia wrote:
>> While a pkg name (such as python3) not existed in variable
>> PACKAGES, but provided by another pkg (such as python-core),
>> in this situation, rpm based do_rootfs could not search it in
>> the feeds.
>>
>> The fix is to invoke 'smart query --provides' to do the search
>> if the feeds search failed. We don't drop the feeds search,
>> because the smart query search is too slow, and the feeds
>> search is fast and could work well with most pkgs.
>>
>> [YOCTO #6918]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/lib/oe/package_manager.py | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
>> index ffb83b2..d5704e6 100644
>> --- a/meta/lib/oe/package_manager.py
>> +++ b/meta/lib/oe/package_manager.py
>> @@ -671,6 +671,23 @@ class RpmPM(PackageManager):
>>   
>>           return ""
>>   
>> +    def _search_pkg_provider_in_smart(self, pkg, feed_archs):
>> +        output = self._invoke_smart('query  --provides %s' % pkg) or ""
>> +        for provider in output.split('\n'):
>> +            # Filter out the line which is empty or start with space
>> +            if provider.strip() == '' or provider[0] == ' ':
>> +                continue
>> +
>> +            for arch in feed_archs:
>> +                arch = '@' + arch.replace('-', '_')
>> +                if arch in provider:
>> +                    # First found is best match
>> +                    # bb.note("%s -> %s" % (pkg, provider))
> Why not remove the bb.note above since it's commented out?

The commented out line is left for debug purpose, it is helpful
to trace what changed when you debug.

If it caused confusion, I will remove it.

>
>> +                    return provider
>> +
>> +        return ''
>> +
>> +
>>       '''
>>       Translate the OE multilib format names to the RPM/Smart format names
>>       It searched the RPM/Smart format names in probable multilib feeds first,
>> @@ -693,6 +710,8 @@ class RpmPM(PackageManager):
>>                       feed_archs = self.ml_prefix_list[mlib]
>>                       new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs)
>>                       if not new_pkg:
>> +                        new_pkg = self._search_pkg_provider_in_smart(subst, feed_archs)
>> +                    if not new_pkg:
> This entire construct:
> ...
> new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs)
> if not new_pkg:
> 	new_pkg = self._search_pkg_provider_in_smart(subst, feed_archs)
> if not new_pkg:
> ...
>
> could be replaced with:
> ...
> new_pkg = self._search_pkg_name_in_feeds(subst, feed_archs) or \
> 	self._search_pkg_provider_in_smart(subst, feed_archs)
> if not new_pkg:
> ...
>
> I'd say it looks cleaner but it's a matter of personal taste. :)

Fine, I will improve it.

V2 incoming

//Hongxu



>
>>                           # Failed to translate, package not found!
>>                           err_msg = '%s not found in the %s feeds (%s).\n' % \
>>                                     (pkg, mlib, " ".join(feed_archs))
>> @@ -711,6 +730,8 @@ class RpmPM(PackageManager):
>>                   default_archs = self.ml_prefix_list['default']
>>                   new_pkg = self._search_pkg_name_in_feeds(pkg, default_archs)
>>                   if not new_pkg:
>> +                    new_pkg = self._search_pkg_provider_in_smart(pkg, default_archs)
>> +                if not new_pkg:
> ditto
>
> laurentiu


