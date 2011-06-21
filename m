Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZ2O4-0004nZ-DY
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:57:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5LErYJs023671
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 07:53:34 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Jun 2011 07:53:34 -0700
Message-ID: <4E00B06D.9060700@windriver.com>
Date: Tue, 21 Jun 2011 09:53:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20110621140419.GA8589@raven.pace.internal>
In-Reply-To: <20110621140419.GA8589@raven.pace.internal>
Subject: Re: Using TCLIBC = "uclibc" in oe-core
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
X-List-Received-Date: Tue, 21 Jun 2011 14:57:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/21/11 9:04 AM, Tom Parkin wrote:
> Hi list,
> 
> I'm trying to set up a working openembedded-core/uClibc mipsel
> environment.  I found that setting TCLIBC = "uclibc" in local.conf
> yielded the following:
> 
> ERROR: Nothing PROVIDES 'glib-2.0-native'
> 
> I traced this down to code in meta/recipes-core/glib-2.0/glib-2.0.inc,
> which raises a SkipPackage exception if USE_NLS = "no".

Sounds like this should behave differently for the glib-2.0-native and glib-2.0
target.  I don't know how to detect the package type in python code though,
someone else might know.

--Mark

> The reason that USE_NLS = "no" in this case is that
> meta/conf/distro/include/tclibc-uclibc.inc sets USE_NLS ?= "no".
> 
> Looking further at tclibc-uclibc.inc, though, it appears that there is
> some code attempting to work around this issue:
> 
> USE_NLS_glib-2.0 = "yes"
> 
> Sadly, this appears to get ignored.  Following this up on the #yocto
> IRC channel, it seems that a more appropriate formulation of the above
> would be:
> 
> USE_NLS_pn-glib-2.0-native = "yes"
> 
> The attached patch allows me to (at least) assemble the bitbake task
> list when TCLIBC = "uclibc".  I'm not sure whether this is the correct
> approach, though.
> 
> Any comments?
> 
> Many thanks,
> Tom
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



