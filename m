Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QzAbY-0003Jo-9O
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 18:59:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p81Gs5T3001114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2011 09:54:05 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 1 Sep 2011 09:54:05 -0700
Message-ID: <4E5FB8AC.1070007@windriver.com>
Date: Thu, 1 Sep 2011 11:54:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
In-Reply-To: <1314895291.19905.197.camel@phil-desktop>
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 01 Sep 2011 16:59:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/1/11 11:41 AM, Phil Blundell wrote:
> On Thu, 2011-09-01 at 15:46 +0100, Phil Blundell wrote:
>> I just tried using useradd.bbclass for the first time (in an effort to
>> make dbus installable on a readonly-rootfs) and it doesn't seem to be
>> working very well for me.
>>
>> The root of my problem seems to be the code below.  As far as I can
>> tell, what's happening is that process_root_flag() consumes all the
>> command line arguments to useradd, which means that the subsequent call
>> to getopt() in process_flags() just returns immediately because there is
>> nothing left for it to do.  The upshot of all this is that the switches
>> on the command line are simply ignored and useradd doesn't do what I
>> wanted.
>>
>> Is anybody else using this code successfully in oe-core with a
>> nontrivial USERADD_PARAM?
> 
> So, I added a strategic "optind = 1" to useradd.c and the situation
> seems to have improved a bit.  However, I've encountered a couple of
> other issues which are slightly annoying:
> 
> a) with the attached patch, dbus itself no longer requires a postinst to
> be run at boot time.  Which is cool.  Unfortunately, inheriting useradd
> causes it to now depend on shadow (which wasn't previously in my image)
> and shadow itself isn't currently amenable to read-only-rootfs either so
> my image build still fails.  I guess the answer to this is to have
> shadow excluded (by some or other mechanism) during rootfs construction
> for non-package-management-enabled images.

What is it depending on for the target?  Is the shadow-utils or something now
required?  That doesn't seem to make sense to me -- other then we need a
passwd/group/shadow/gshadow file to work with.  As long as something can provide
those, we should be ok.

> b) the useradd.bbclass stuff seems to try to apply itself to
> virtclass-native packages as well, which was causing an error during
> do_install() for dbus-native.  I worked around this by adding
> 
> USERADD_PARAM_${PN}_virtclass-native = ""
> GROUPADD_PARAM_${PN}_virtclass-native = ""

Yup, definitely a bug and should be fixed.  native and cross cases should not do
anything with useradd.

--Mark

> to the recipe, but it seems as though the class should probably be
> sorting this out for itself.
> 
> p.
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



