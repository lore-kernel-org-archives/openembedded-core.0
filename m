Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QIM2W-0004kp-Lp
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 16:29:56 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QILzu-00024e-IJ from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 07:27:14 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 6 May 2011 07:25:51 -0700
Received: from [172.30.0.24] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1; Fri, 6 May 2011
	07:27:14 -0700
Message-ID: <4DC40535.6060102@mentor.com>
Date: Fri, 6 May 2011 07:27:01 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1302936483.git.sgw@linux.intel.com>	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>	<1303102414.5518.30.camel@rex>	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>	<1303109647.5518.54.camel@rex>	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex>
In-Reply-To: <1304634851.30391.54.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 06 May 2011 14:25:51.0594 (UTC)
	FILETIME=[8067A4A0:01CC0BF9]
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Fri, 06 May 2011 14:29:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/05/2011 03:34 PM, Richard Purdie wrote:
> On Thu, 2011-05-05 at 22:18 +0800, Cui, Dexuan wrote:
>> (Sorry for my delay for the task as I was working on other bugs...)
>> Recently I have been looking into it and I've made some commits (the
>> top 5 small commits) in
>> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/log/?h=dcui/master_perl-native 
>> BTW: the work is not done completely as some recipes don't build
>> with the changes. Please have a look anyway to see if I'm in the correct direction.
>>
>> However, I've got some difficulties and hope to get your help:
>> 1)  As you said, after we install perl-native into its own directory,
>> any recipe not depending on perl-native doesn't see
>> ${STAGING_BINDIR_NATIVE}/perl-native/perl unnecessarily.
>> However, if we keep the current code, what's the bad consequence if
>> the recipe not depending on perl-native does see perl of perl-native?
>> looks no?
> 
> We have an assumption that perl is already on the system we're building
> on. Perl is a relatively stable language with defined compatibility and
> interoperability. Most recipes are therefore fine using perl from the
> build system directly and don't need perl-native. I think we defined a
> special name for the build system perl (perl-native-runtime?). Better
> names are welcome but we should ensure we use the right dependency in
> the right places.
> 
> The time to use perl-native instead of perl-native-runtime is where any
> perl module is being built, perl itself is being built or anything that
> has an explicit dependency on the perl version present.

The problem that follows up is that once we have built any sort of
perl-native we then have to go and be really really really careful that
nothing that's not (a) target perl (b) some perl module we built and
need to run uses it.  Otherwise we run into the problems I think that've
been hit here.  Problems like this are why for OE I just made
perl-native be the perl we rely on for everything.

I know we talked about this before and you had a strong desire to try
and do something else but I think this shows maybe we need to try going
down the perl-native everywhere path first and then see if we can't do
something different.

-- 
Tom Rini
Mentor Graphics Corporation


