Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 37079784E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:22:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBC9MWYH013011
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 12 Dec 2017 09:22:34 GMT
Message-ID: <1513070552.19417.153.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Bai, Haiqing" <Haiqing.Bai@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Dec 2017 09:22:32 +0000
In-Reply-To: <C2A454FDE6C23F41BD5011E2458C46C9CEF081F1@ALA-MBD.corp.ad.wrs.com>
References: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
	<1512946109.19417.136.camel@linuxfoundation.org>
	<C2A454FDE6C23F41BD5011E2458C46C9CEF081F1@ALA-MBD.corp.ad.wrs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] gmp: depends on flex-native to fix parallel building issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Dec 2017 09:22:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Let me make this simpler. Which release of the project did you see this
issue with?

I believe this issue would only occur with morty and early, pyro, rocko
and master are not affected.

Cheers,

Richard

On Tue, 2017-12-12 at 07:13 +0000, Bai, Haiqing wrote:
> Comments below. thanks
> 
> -----Original Message-----
> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org] 
> Sent: 2017年12月11日 6:48
> To: Bai, Haiqing; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] gmp: depends on flex-native to fix
> parallel building issue
> 
> On Wed, 2017-11-29 at 14:54 +0800, Haiqing Bai wrote:
> > 
> > fix below parallel building issue:
> > configure:27365: result: flex
> > configure:27403: flex conftest.l
> > .../sysroots/x86_64-linux/usr/bin/flex.real: No such file or
> > directory
> > configure:27407: $? = 127
> > configure:27409: checking lex output file root
> > configure:27420: error: cannot find output from flex; giving up
> > 
> > Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> > ---
> >  meta/recipes-support/gmp/gmp.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes- 
> > support/gmp/gmp.inc index abac8cf..1b35eaa 100644
> > --- a/meta/recipes-support/gmp/gmp.inc
> > +++ b/meta/recipes-support/gmp/gmp.inc
> > @@ -10,3 +10,5 @@ PACKAGECONFIG[readline] = "--with-readline=yes, 
> > --with-readline=no,readline"
> >  
> >  ARM_INSTRUCTION_SET_armv4 = "arm"
> >  ARM_INSTRUCTION_SET_armv5 = "arm"
> > +
> > +DEPENDS = "flex-native"
> With recipe specific sysroots this should now be deterministic. The
> log above suggests you were not using recipe specific sysroots? This
> would therefore only be applicable to morty and earlier?
> [This issue is founded on x86-64 building,  but it does not mean it
> is only related with x86.  Actually this is caused by the defect of
> the traditional probe mechanism of 'configure',  the package
> configure
> script try to probe whether has package 'flex' , then some optional
> actions will be done by it.  In this issue,  when this probe
> happens,   /usr/bin/flex exists but '/usr/bin/flex.real' has not
> created for the
> parallel building,  then configure reports the error and exits from
> building.   Since there are no atomic guarantee for the package
> output during parallel building, so here add this depends]
> 
> Cheers,
> 
> Richard
> 

