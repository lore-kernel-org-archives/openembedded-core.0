Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaUDs-0007co-HV for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 19:01:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49Gk1Zu023553; Thu, 9 May 2013 17:46:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WbS-fpV9NwWi; Thu,  9 May 2013 17:46:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49GjuWb023543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 9 May 2013 17:45:58 +0100
Message-ID: <1368117801.27116.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 09 May 2013 17:43:21 +0100
In-Reply-To: <20130509161916.GF3188@jama>
References: <1368115558.27116.102.camel@ted> <20130509161916.GF3188@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] class/lib: Fix up various file access methods
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
X-List-Received-Date: Thu, 09 May 2013 17:02:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 18:19 +0200, Martin Jansa wrote:
> On Thu, May 09, 2013 at 05:05:58PM +0100, Richard Purdie wrote:
> > There are various bits of cruft that have built up around our file accesses. This patch
> > cleans some of them up, specifically:
> > 
> >  * Remove pointless "from __builtin__ import file"
> >  * Use open(), not file()
> >  * Wrap file usage in a with container to ensure files are closed
> >  * Add missing .close() calls in some cases
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
> > index 63ba087..c30d1cb 100644
> > --- a/meta/classes/imagetest-qemu.bbclass
> > +++ b/meta/classes/imagetest-qemu.bbclass
> > @@ -146,6 +146,7 @@ def qemuimagetest_main(d):
> >                         if not os.path.isfile(fulltestcase):
> >                              raise bb.build.FuncFailed("Testcase %s not found" % fulltestcase)
> >                         list.append((item, casefile, fulltestcase))
> > +                    f.close()
> 
> indentation looks wrong and the same a line above "raise.."

Its an existing issue with the file, this patch is correct but I've sent
out a separate patch fixing it.

Cheers,

Richard



