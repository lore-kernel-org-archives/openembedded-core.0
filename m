Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T9gIn-0008DA-UC
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 19:55:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86HhGNV007563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Sep 2012 10:43:16 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 6 Sep 2012 10:43:16 -0700
Message-ID: <5048E0B3.60604@windriver.com>
Date: Thu, 6 Sep 2012 12:43:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CALbNGRR0tpkqGtN6szJc5dLqYKPRFnyeaD2tyRAk6nV50aOT8w@mail.gmail.com>
	<1346928461.2673.186.camel@phil-desktop>
	<CALbNGRRpab2YJWZbVJvLyXV8npxGW9Gv4vajTmDQ_dJOzJXqiQ@mail.gmail.com>
In-Reply-To: <CALbNGRRpab2YJWZbVJvLyXV8npxGW9Gv4vajTmDQ_dJOzJXqiQ@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q86HhGNV007563
Subject: Re: PREFERRED_VERSION_virtual/..
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
X-List-Received-Date: Thu, 06 Sep 2012 17:55:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 9/6/12 6:14 AM, Andreas M=FCller wrote:
> On Thu, Sep 6, 2012 at 12:47 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Thu, 2012-09-06 at 12:45 +0200, Andreas M=FCller wrote:
>>> In meta-gumstix I am working on a central include-file where I can
>>> switch kernel-sources/-versions at one single place.
>>>
>>> For this I need PREFERRED_VERSION_virtual/... working.
>>>
>>> Is there a specific reason why this is not implemented or would it
>>> cause huge efforts to implement?
>>
>> Well, it's inherently meaningless: virtuals don't have any version
>> number, only concrete packages do, and it's entirely possible that the
>> different providers for a given virtual might have unrelated (whether =
or
>> not intersecting) version numbering schemes.
>>
>> Why exactly do you want this?
>>
>> p.
>>
>>
> Since I spend lot of time testing different kernels, I would like to
> have a single location where I can setup which kernel-source/-version
> is compiled [1] simply (this file is included by my machine
> configuration [2]). Alongside I want to ensure that the
> linux-glibc-headers share same version as the kernel [3].
>
> So for my case: I have
>
> * linux-mainline_3.2.bbappend (3.2.19)
> * linux-omap_3.5.bb (3.5.0)
> * linux-omap_3.6.bb (3.6.0-rc3)
> * linux-sakoman_3.2.bb (3.2.0)
>
> Without PREFERRED_VERSION_virtual/.. I cannot select between
> linux-omap_3.5.bb and linux-omap_3.6.bb. OK I can use
> PREFERRED_VERSION_linux-omap (as I am doing in [2] currently) but if I
> select to build linux-mainline, I get complaints that there is no
> linux-omap-3.2.9.

This is where preferred provider is used, and then the preferred version =
can be=20
used to select the right version of a given provider.

PREFERRED_PROVIDER_virtual/kernel =3D "linux-foo"
PREFERRED_VERSION_linux-foo =3D "3.4"

> Hope that explains what I would like to have this feature...
>
> Andreas
>
> [1] http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix/blobs/maste=
r/recipes-kernel/linux/linux-versions-overo.inc
> [2] http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix/blobs/maste=
r/conf/machine/overo.conf
> [3] http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix/blobs/maste=
r/recipes-kernel/linux-libc-headers/linux-libc-headers_git.bb
> Repl
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



