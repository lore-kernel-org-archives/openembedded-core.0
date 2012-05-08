Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SRhLj-0003eg-I2
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 12:08:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q489wvq5027576
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 May 2012 02:58:57 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 8 May 2012 02:58:56 -0700
Message-ID: <4FA8EE5F.1030607@windriver.com>
Date: Tue, 8 May 2012 17:58:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336445265.git.liezhi.yang@windriver.com>
	<228b3adfffa660477cc65e00fc32c95f2bf976fd.1336445265.git.liezhi.yang@windriver.com>
	<1336461271.3181.93.camel@x121e.pbcl.net>
In-Reply-To: <1336461271.3181.93.camel@x121e.pbcl.net>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: check TMPDIR is not too long
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
X-List-Received-Date: Tue, 08 May 2012 10:08:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phil,

Thanks for your reply, please see my comments inline ...

On 05/08/2012 03:14 PM, Phil Blundell wrote:
> On Tue, 2012-05-08 at 10:50 +0800, Robert Yang wrote:
>> When the length of TMPDIR is longer than a threshold, there would be an
>> "Argument list too long" error when building gcc-cross, this is the
>> error from the exec(), the maximum length of argument is defined in
>> /usr/include/linux/limits.h:
>>
>>    #define ARG_MAX       131072    /* # bytes of args + environ for exec() */
>>
>> It's hard to determine the threshold of the TMPDIR, here is the
>> experimental value:
>> len(TMPDIR) = 182	Success
>> len(TMPDIR) = 192	Failed
>>
>> So set the maximum length of TMPDIR to 180 seems proper.
>
> It seems a bit lame for paths to be restricted to such a short length.
> How does a 192-byte TMPDIR end up causing more than 131072 bytes of
> arguments and environment?  Can anything be done to reduce that?  For
> example, can you use "gcc @..." to remove common options from the

It doesn't error at the compile stage, but at the install stage, this is
caused by:

gcc-cross-4.6.3+svnr184847-r24/gcc-4_6-branch/build.x86_64-linux.arm-poky-linux-gnueabi/gcc/Makefile:

install-plugin: installdirs lang.install-plugin s-header-vars
# We keep the directory structure for files in config and .def files. All
# other files are flattened to a single directory.
         $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
         headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`; \
         srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
         for file in $$headers; do \
	...

The error will happen at the "for" loop when there are many files in $headers,
we can fix the Makefile, but if we don't limit the length of TMPDIR, the similar
error would come out sooner or later since other pkgs may have the similar
issue, so I think that limit the length of TMPDIR may be a better choice.
It seems that seldom people will use a TMPDIR longer than 180 characters,
this is just a prevention.

// Robert

> command line?  Can you eliminate garbage from the environment that
> doesn't need to be there?
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


