Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TDzyV-0001jQ-Kl
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 17:44:35 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so212224pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=AJ5F3rnJ/4vxAmYBNAE6gjm6ujpK1nfo2XS9myKrkkc=;
	b=KaDjrCdwypAWNNmXPIORQEw83CCLxfkgWflaavkzksac8o+wr59olco+wTBOhuKI1H
	EgnJoKH++iVUQBgDDwxcKlsTZmaXXTvG3+zwk5F2vsG2D8MTEX3fbgaOy94fX5GTEFDP
	GiaQisiAeEON6tQjNhykrWSrGSB+PAGmJH6sbnIn7rjZGXtq6cPcC58F8DI4xwIVU+N6
	Zs6VMzO2x2sC8wp91X8vz8IpM/2M4FgU1a2YrxSKLi0fOUwdz5hAtbh8QKJCXiaX80xo
	5XMsst+E1ErPIcssf9xV9pqAQb390aVDtO+PkgLSTGei7qicuityvUQSRNjaqcD57c+r
	IOiQ==
MIME-Version: 1.0
Received: by 10.66.78.195 with SMTP id d3mr306580pax.17.1347982317252; Tue, 18
	Sep 2012 08:31:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Tue, 18 Sep 2012 08:31:57 -0700 (PDT)
In-Reply-To: <20120918152216.GD3498@jama.jama.net>
References: <1347962498-756-1-git-send-email-constantinx.musca@intel.com>
	<4D914278-5082-4B59-9162-CE561159AAF7@dominion.thruhere.net>
	<20120918152216.GD3498@jama.jama.net>
Date: Tue, 18 Sep 2012 12:31:57 -0300
X-Google-Sender-Auth: ZpGpQgmU7aIlgXOrkugkBG8H6Y8
Message-ID: <CAP9ODKoDtFJF+m9h2YGEvgjCYGTir4xHgP==NZAB+sPgEiCJkg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Constantin Musca <constantinx.musca@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Tue, 18 Sep 2012 15:44:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 18, 2012 at 12:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Sep 18, 2012 at 02:40:04PM +0200, Koen Kooi wrote:
>>
>> Op 18 sep. 2012, om 12:01 heeft Constantin Musca <constantinx.musca@intel.com> het volgende geschreven:
>>
>> > - netbase should only include etc-rpc, etc-protocols, etc-services
>> > and the hosts file
>> > - the init script/configuration files should be in another package
>> > (init-ifupdown)
>> >
>> > [YOCTO #2486]
>> >
>> > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> >
>> > --- /dev/null
>> > +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
>> > @@ -0,0 +1,41 @@
>> > +SUMMARY = "Basic TCP/IP networking init scripts and configuration files"
>> > +DESCRIPTION = "This package provides high level tools to configure network interfaces"
>> > +HOMEPAGE = "http://packages.debian.org/ifupdown"
>> > +SECTION = "base"
>> > +LICENSE = "GPLv2"
>> > +LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
>> > +RDEPENDS_${PN} = "netbase"
>> > +RCONFLICTS_${PN} = "netbase (< 5.0-r1)"
>>
>> Since R* is for packaging they should live below do_install to mimic the order of task execution in the recipe
>
> And I guess that layers changing machine specific parts of netbase did
> that with PRINC so e.g. for me, I've
>
> SHR root@gjama ~ $ opkg info netbase
> Package: netbase
> Version: 5.0-r8
>
> So I guess I'll have to change this RCONFLICTS too in such layer, but
> problem is that in BSP you don't know how many other layers someone is
> using so PR of netbase (before this patch) is just lucky guess in this one.

It seems netbase needs to bump it's version so the RCONFLICTS can be like:

RCONFLICTS_${PN} = "netbase (< 5.0.1)

Regards

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


