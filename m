Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0qcJ-0002lF-JR
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 09:35:03 +0100
Received: by pbbrp12 with SMTP id rp12so402422pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 00:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.129.228 as permitted sender) client-ip=10.68.129.228; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.129.228 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.129.228])
	by 10.68.129.228 with SMTP id nz4mr4546728pbb.91.1330072000546
	(num_hops = 1); Fri, 24 Feb 2012 00:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IIaEXJALiW9HD9k7Yja4Cu8XQMs0BRJaoQoU+ZgM4rs=;
	b=EbaLVOfGvEdU0Omowsah3/sdROxefOYPPM4Gnad0xN48g7FP3jhbDGpuzO7V2uFqDt
	sJddz61y9jWb0q4+h631YzsjWsfr3zCDt4rSMQQfUIX8rFxBfqnro9d+5J5bERw6qDkY
	DcbihoocUQoOYGt+jQ1aWoO+GfhKnsavuyuOE=
Received: by 10.68.129.228 with SMTP id nz4mr3786615pbb.91.1330072000447;
	Fri, 24 Feb 2012 00:26:40 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id p2sm3784626pbb.14.2012.02.24.00.26.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 00:26:39 -0800 (PST)
Date: Fri, 24 Feb 2012 00:27:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120224082730.GB2519@sakrah.homelinux.org>
References: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Linker error while cross compiling, (Qt issue?)
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
X-List-Received-Date: Fri, 24 Feb 2012 08:35:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/02/12 16:53), Samuel Stirtzel wrote:
> Hi,
> although building libdbusmenu-qt [1] for kdelibs succeeds, linking the
> library will fail with "undefined reference to
> DBusMenuExporter::~DBusMenuExporter" and similar errors.
> The library is there and nothing in the configure / compile log of
> both recipes seems to state any sort misconfiguration for this case.
> 
> For libdbusmenu-qt the settings were double checked, according to the
> configuration it "should" export the symbols, however for some very
> odd reasons it doesn't export any useful symbols at all.
> See  http://pastebin.com/z9QfsCTc  for the list of exported symbols
> (U=required symbols, T=provided symbols, for others see "man nm").
> 
> This error really puzzles me, usually I would assume that a library
> has no problems to export symbols.
> (Posted this to the core list as chances are good that it might be Qt related)
> 
> It seems to only occur when cross compiling.
> 
> Anyone has an idea if this is gcc ld / Qt related, or how to resolve it?
> Help would be appreciated.

keep in mind when you use g++ in OE the default is to use hidden
visibility

like below

meta/conf/distro/include/tclibc-eglibc.inc:CXXFLAGS +=
"-fvisibility-inlines-hidden"

and my guess is thats whats causing this

So you need to nullify that effect.



