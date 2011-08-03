Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qocha-0006B5-6Q
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:45:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p73EfIAM006693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 07:41:18 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 3 Aug 2011 07:41:17 -0700
Message-ID: <4E395E0C.8010308@windriver.com>
Date: Wed, 3 Aug 2011 09:41:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312243899.git.mark.hatle@windriver.com>
	<d97dcf096a3a72a2a087b2dbbcdd74c853f7e940.1312243899.git.mark.hatle@windriver.com>
	<1312292802.4325.33.camel@phil-desktop>
	<4E380E7E.9050803@windriver.com> <1312374036.2344.658.camel@rex>
In-Reply-To: <1312374036.2344.658.camel@rex>
Subject: Re: [PATCH 5/5] update-alternatives: Add alternatives as a runtime provide
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
X-List-Received-Date: Wed, 03 Aug 2011 14:45:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/3/11 7:20 AM, Richard Purdie wrote:
> On Tue, 2011-08-02 at 09:49 -0500, Mark Hatle wrote:
>> On 8/2/11 8:46 AM, Phil Blundell wrote:
>>> On Mon, 2011-08-01 at 19:17 -0500, Mark Hatle wrote:
>>>> The following allows RPM to generate the SDK image, however without it
>>>> we get a failure because the system has nothing that provides /bin/sh.
>>>>
>>>> Unfortunately the patch causes failures with ipk and deb packages because
>>>> they can not have filenames within their RPROVIDES.  I'm looking for some
>>>> type of a resolution to the issue, the only thing I can think of is to
>>>> add a way to manually add a FILERPROVIDE for the items.  This will require
>>>> changes to the way FILERPROVIDE is currently generated... but I'm not sure
>>>> how we can automatically generate the FILERPROVIDE values without the use of
>>>> python...
>>>>
>>>> Any suggestions?
>>>
>>> It's never really been the intent that update-alternatives should put
>>> the name of the link being provided into RPROVIDES.  If you want to
>>> solve the specific problem with /bin/sh then just adding RPROVIDES_${PN}
>>> += "virtual-bourne-shell" or something to bash and busybox is probably
>>> the easiest way of doing that.
>>>
>>> I wouldn't be entirely opposed to the concept of what you're proposing
>>> here, though.  Something like:
>>>
>>> RPROVIDES_${PN} += "${@' '.join(map(lambda x:
>>> legitimize_package_name("virtual-path-" + x), filter(lambda x: x != '',
>>> [ d.getVar('ALTERNATIVE_LINK', True) or '' ] +
>>> (d.getVar('ALTERNATIVE_LINKS', True) or '').split())))}"
>>>
>>> might be what you want, perhaps.  I'm not sure that the resulting
>>> virtual names will be very pretty though.
>>
>> Hmm.. Coming from the RPM world, the virtual-path- because we can't just
>> "provide" a file in the system seems a bit wonky to me.  But it should be able
>> to work.  For RPM at least, we'd want a reversing function to turn virtual paths
>> back into real paths.
>>
>> If I have time today, I'll try to implement a proof of concept and see if I can
>> get it to work reasonably well.
> 
> Just to be clear for Phil's benefit, RPM natively supports file based
> dependencies, so a dependency of "/bin/sh" is automatically fulfilled by
> a package which contains "/bin/sh". Some dependencies such as the
> shebang in scripts are automatically added to packages and resolved by
> rpm.
> 
> I did chase down this bug a bit and it seems that if you "bitbake
> meta-toolchain-game" you hit an error about /bin/sh being missing but if
> you "bitbake busybox; bitbake meta-toolchain-gmae" it will work. This is
> due to busybox shipping a /bin/sh.
> 
> The question is therefore how to handle this on the deb/ipk side and
> ensure we get consistency between the behaviours of the different
> backends. I thought with the rpm filedeps code in do_package, we were
> adding things like /bin/sh dependencies to the other package formats but
> now I'm not so sure. 

Due to deb/ipk not handling file based dependencies, they are filtered out on
the creation of the deb/ipk packages.  The original intention was to use them,
but it wasn't possible at the time.  Simply adding a ton of file-based
dependencies seemed like a huge mistake as well.  (We'd have to add virtual
provides for all of the virtual requirements....)

We could certainly select a few specific requirements and scan for and use those
to catch obvious issues, such as perl, sh, bash, env/python... but it's still
only a partial solution to the real issue.

--Mark

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



