Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1Q7Fhf-0000uV-Ja
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 01:30:32 +0200
Received: by iwn10 with SMTP id 10so949419iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 16:28:24 -0700 (PDT)
Received: by 10.231.141.141 with SMTP id m13mr264774ibu.148.1302046104724;
	Tue, 05 Apr 2011 16:28:24 -0700 (PDT)
Received: from [192.168.1.4] (c-67-187-147-135.hsd1.ca.comcast.net
	[67.187.147.135])
	by mx.google.com with ESMTPS id g16sm4763264ibb.54.2011.04.05.16.28.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 16:28:23 -0700 (PDT)
Message-ID: <4D9BA594.3030005@mvista.com>
Date: Tue, 05 Apr 2011 16:28:20 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
	ThunderBrowse/3.3.4
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1302001365.24596.459.camel@rex>
In-Reply-To: <1302001365.24596.459.camel@rex>
X-Enigmail-Version: 1.1.1
Cc: poky <poky@yoctoproject.org>
Subject: Re: Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Tue, 05 Apr 2011 23:30:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> 
> To do this I'm thinking of a new set of include files of the form
> conf/machine/include/multilib-xxxx.inc, similar in nature to the
> tune-xxx.inc files. A given setup would include each of the multilibs it
> requred. Each multilib include file would look something like:
> 
> conf/machine/include/multilib-x86-lib32.inc:
> 
> MULTILIBS += "lib32"
> 
> BASE_PACKAGE_ARCH_virtclass-multilib-lib32 = "core2-lib32"
> TARGET_CC_ARCH_virtclass-multilib-lib32 = "-m32 -march=core2"
> PACKAGE_EXTRA_ARCHS += "core2-lib32"
> 
> libdir_virtclass-multilib-lib32 = "${exec_prefix}/lib32"
> base_libdir_virtclass-multilib-lib32 = "${base_prefix}/lib32"
> 
> i.e. use overrides to change the target cc architecture specifying the
> required flags to the compiler and also alter the library paths as
> required.
> 
> I'm envisaging passing an optional new parameter to classes in
> BBCLASSEXTEND so for example the definition of a multilib could look
> something like:
> 
> BBCLASSEXTEND_append = " multilib:x86-lib32"
> 
> and all the multilib class would need to do is to manipulation of
> variables including OVERRIDES in a similar way to native.bbclass with
> the complication of handling the parameter.

It is possible to do it with out changes to bitbake, but adding
parametrization to BBCLASSEXTEND would be useful in a number of ways,
and much more elegant then doing it with out it, and cleaner for that
matter. Unrelated to multilib, would the full path to the sub parameters
be configurable via the extended class? i.e. "conf/machine/include/" be
a configurable value from the multilib class?

> 
> For opkg there are multiple levels we can take the integration to. It
> should be possible for example to install the "weaker" multilibs first,
> then just install the stronger ones over the top, assuming any file
> overwriting is ok and can be ignored. 

If there isn't any kind of compartmentalization of binaries(i.e. the
alternate abi having a set of packages that only contian runtime libs),
wouldn't this render the package management on opkg based systems post
install largely useless other then just adding new components? Most
applications are getting better about it(openssl comes to mind), but
some may still place arch specific headers in common locations. Many
like openssl started switching over to arch wrapper headers, but there
may be some stuff still lurking out there. Could probably be handled on
a case by case basis.

> So to summarise the steps needed are:
> 
> a) bitbake enhancement for BBCLASSEXTEND parameter support
> b) Add simple multilib build configuration
> c) Update toolchain bootstrap with multilibs support
> d) Add RPM multilib packaging
> e) Look at opkg multilib integration
> 
> 
> Does this make sense to everyone, are there any questions/ objections/
> concerns/ things I've missed?
> 

I have been kicking around a still broken POC implementation to this for
a bit, but this is basically the line of thought(minus the
parametrization of BBCLASSEXTEND) for a while on the subject. This looks
mostly right to me.

Jeremy Puhlman
MontaVista Software, LLC.


