Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R22oS-0007H8-F3
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 17:16:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Sep 2011 08:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,356,1312182000"; d="scan'208";a="51127346"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2011 08:11:10 -0700
Message-ID: <4E6A2C8E.4020604@linux.intel.com>
Date: Fri, 09 Sep 2011 08:11:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: "Zhai, Edwin" <edwin.zhai@intel.com>
References: <cover.1315536041.git.edwin.zhai@intel.com>
	<e7bb01a01d1fdf5262436e16b118583b5956e4b9.1315536041.git.edwin.zhai@intel.com>
	<4E699AD2.9070602@linux.intel.com> <4E6A1FDA.2060601@intel.com>
In-Reply-To: <4E6A1FDA.2060601@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opensp: Fix hard path in native nsgmls.
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
X-List-Received-Date: Fri, 09 Sep 2011 15:16:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2011 07:16 AM, Zhai, Edwin wrote:
> On 2011/9/9 12:49, Saul Wold wrote:
>> On 09/08/2011 07:53 PM, edwin.zhai@intel.com wrote:
>>> From: Zhai Edwin<edwin.zhai@intel.com>
>>>
>>> This relocation issues caused following bug and introduce one partial
>>> fix bb024d:
>>> [YOCTO #1440]
>>>
>>> But the environment val hacking is not working all the time, as
>>> nsgmsl may
>>> append wrong path in some case. This fix use search directory "-D" as
>>> solution.
>>> It's better if got fixed from opensp side when next upgrade.
>>>
>>> Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
>>> CC: Saul Would<sgw@linux.intel.com>
>>> ---
>>> meta/recipes-devtools/opensp/opensp_1.5.bb | 4 ++--
>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/opensp/opensp_1.5.bb
>>> b/meta/recipes-devtools/opensp/opensp_1.5.bb
>>> index 0269c87..d692137 100644
>>> --- a/meta/recipes-devtools/opensp/opensp_1.5.bb
>>> +++ b/meta/recipes-devtools/opensp/opensp_1.5.bb
>>> @@ -44,8 +44,8 @@ do_install_append() {
>>>
>>> do_install_append_virtclass-native() {
>>> for util in nsgmls sgmlnorm spam spcat spent sx; do
>>> - create_wrapper ${D}/${bindir}/$util \
>>> - SGML_CATALOG_FILES=${sysconfdir}/sgml/catalog
>>> + create_cmdline_wrapper ${D}/${bindir}/$util \
>>> + -D ${sysconfdir}/sgml
>>> done
>>> }
>>>
>> Have you tested this with iputils? When I tried this, it did not work
>> correctly for me, can you give me more of idea of how you tested this.
>
> Sorry, I forgot to rename the tmp to make sysroot unavailable:( After
> renaming, the bug still exist.
> Upgrading to 1.5.2 doesn't help. After debug with strace, I found nsgmls
> append ".." to other paths when inputting "../index.db" as you said.
> It's reasonable for entity such as ping.sgml, as they usually sit in
> same dir as index.db. But catalog should not do this.
>
> I have tried "-c" to specify catalog path, and found it works. Could you
> pls. have a try on the same contrib tree?
> contrib/gzhai/master2
>
Edwin,

Did you try the -c with the linuxdoc-tools-native recipe also?  I found 
that when I used -c option with that recipe I then get a failure, so as 
I have mentioned before I think the problem maybe in the opensp code 
itself and it should not append the ".." to the catalog search patch.

Sau!

> Thanks,
> Edwin
>
>>
>> Sau!
>>
>
>


