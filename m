Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1Tr9ef-00028x-Ue
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 16:57:59 +0100
Received: from localhost (172.16.140.24) by smtp.enea.com (172.21.1.209) with
	Microsoft SMTP Server id 14.2.318.1; Fri, 4 Jan 2013 16:41:48 +0100
Date: Fri, 4 Jan 2013 16:41:33 +0100
From: "Maxin B. John" <Maxin.John@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130104154133.GA12178@ubuntu.ubuntu-domain>
References: <1357299055-56828-1-git-send-email-maxin.john@enea.com>
	<1357309662.28649.127.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1357309662.28649.127.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: Maxin.John@enea.com does not
	designate permitted sender hosts)
Cc: yocto@yoctoproject.org, scott.a.garman@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] latencytop: add sudo as runtime dependency
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
X-List-Received-Date: Fri, 04 Jan 2013 15:57:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Richard,
On Fri, Jan 04, 2013 at 02:27:42PM +0000, Richard Purdie wrote:
> On Fri, 2013-01-04 at 12:30 +0100, Maxin B. John wrote:
> > From: "Maxin B. John" <maxin.john@enea.com>
> > 
> > Latencytop needs superuser privileges. The latencytop plugin in
> > eclipse invokes it as 'sudo latencytop'. So, it will be good to
> > include sudo as a runtime dependency.
> > 
> > Signed-off-by: Maxin B. John <maxin.john@enea.com>
> > ---
> >  meta/recipes-kernel/latencytop/latencytop_0.5.bb |    3 +++
> >  1 files changed, 3 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> > index 3e35bf9..a148a47 100644
> > --- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> > +++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
> > @@ -7,6 +7,9 @@ LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a
> >  
> >  DEPENDS = "virtual/libintl ncurses glib-2.0  ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
> >  
> > +# latencytop and it's eclipse support need sudo
> > +RDEPENDS_${PN} = "sudo"
> > +
> >  PR = "r3"
> 
> Shouldn't the eclipse support RDEPEND on sudo, not latencytop? There are
> several ways you could run latencytop without sudo...

I agree. We can run latencytop without sudo. However, it is possible
to install the Eclipse Yocto Plug-in from the downloads.yoctoproject.org.
So, it may not be necessary to build the Eclipse Yocto Plug-in
support in-order to use it.

In that case, when we use the latencytop plugin from Eclipse by
connecting to a target board running linux, it will fail with the
following output:
# sudo : command not found

It is because of this line in 'LatencytopHandler.java':
private static String initCmd="export
PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin; cd; sudo latencytop\r"; 

This line 'assumes' that every target board with latencytop also have
sudo. Please correct me if I am wrong.
 
> Following this logic, we'd add an RDEPENDS on sudo for every app that
> could possibly need root privs.
I didn't mean that :) 
This is a special case for latencytop. Please let me know your comments.

> Cheers,
> 
> Richard
Best Regards,
Maxin


