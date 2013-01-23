Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Txvqk-0005jh-2t
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 09:38:26 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jan 2013 00:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,520,1355126400"; d="scan'208";a="281039497"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2013 00:22:52 -0800
Message-ID: <50FF9DDB.7040807@intel.com>
Date: Wed, 23 Jan 2013 10:22:51 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
	<81a1810d4c60fe2648c4e34d64c63ced7e0a7296.1358432402.git.laurentiu.palcu@intel.com>
	<50FEFB12.5060905@linux.intel.com>
In-Reply-To: <50FEFB12.5060905@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] kernel.bbclass: remove references to update-modules
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
X-List-Received-Date: Wed, 23 Jan 2013 08:38:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/22/2013 10:48 PM, Darren Hart wrote:
>> -    use_update_modules = oe.utils.contains('DISTRO_FEATURES', 'update-modules', True, False, d)
>> > -    if use_update_modules:
>> > -        postinst = d.getVar('pkg_postinst_modules', True)
>> > -        postrm = d.getVar('pkg_postrm_modules', True)
>> > -    else:
>> > -        postinst = None
>> > -        postrm = None
>> > +    postinst = d.getVar('pkg_postinst_modules', True)
>> > +    postrm = d.getVar('pkg_postrm_modules', True)
> This seems to be inverted logic from the original. If update-modules is
> removed, then use_update_modules should be false right? Which would have
> previously set postinst and postrm to None.
I believe both the previous and current logic are right:
  * Before, the update-modules script was called in the postinst/postrm.
So, when the update-modules package was not part of the build, the
postinst/postrm could not call update-modules anymore. As a consequence,
they were set to none.
  * After update-modules has been removed, we are not constrained by
calling update-modules anymore in postinst/postrm but we can safely call
depmod to have the dependencies computed.

So, is there anything wrong with the current logic?

Thanks,
Laurentiu


