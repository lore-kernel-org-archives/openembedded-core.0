Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5950D6F013
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:48:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1I8mBG1020478; Tue, 18 Feb 2014 08:48:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JdRVNirel5rv; Tue, 18 Feb 2014 08:48:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1I8m6KK020464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 18 Feb 2014 08:48:08 GMT
Message-ID: <1392713280.14081.198.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Tue, 18 Feb 2014 08:48:00 +0000
In-Reply-To: <20140218083708.GQ10078@lpalcu-linux>
References: <cover.1392665521.git.raj.khem@gmail.com>
	<af841644dfc682e9774287331ef39c3cd1ede978.1392665521.git.raj.khem@gmail.com>
	<20140218083708.GQ10078@lpalcu-linux>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] rootfs.py: Check for LDCONFIGDEPEND being empty string
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
X-List-Received-Date: Tue, 18 Feb 2014 08:48:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-02-18 at 10:37 +0200, Laurentiu Palcu wrote:
> Hi Khem,
> 
> On Mon, Feb 17, 2014 at 11:34:15AM -0800, Khem Raj wrote:
> > We override LDCONFIGDEPEND to be empty string for uclibc
> > however the current check is for it being None as a result
> > the function is still executed but ldconfig-native is not
> > built as dependency for rootfs when building with uclibc
> > 
> > Fixes errors like below
> > 
> > File:
> > '/home/kraj/work/angstrom-repo/sources/openembedded-core/meta/lib/oe/rootfs.py',
> > lineno: 191, function: _run_ldconfig
> >      0187:    def _run_ldconfig(self):
> >      0188:        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
> >      0189:            bb.note("Executing: ldconfig -r" +
> > self.image_rootfs + "-c new -v")
> >      0190:            self._exec_shell_cmd(['ldconfig', '-r',
> > self.image_rootfs, '-c',
> >  *** 0191:                                  'new', '-v'])
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/lib/oe/rootfs.py |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> > index d149ca3..3bcb812 100644
> > --- a/meta/lib/oe/rootfs.py
> > +++ b/meta/lib/oe/rootfs.py
> > @@ -185,7 +185,7 @@ class Rootfs(object):
> >                          self._handle_intercept_failure(registered_pkgs)
> >  
> >      def _run_ldconfig(self):
> > -        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
> > +        if self.d.getVar('LDCONFIGDEPEND', True) != "":
> May I suggest:
>            if (self.d.getVar('LDCONFIGDEPEND', True) or "") != "":
> here? Otherwise, the condition will be true even if LDCONFIGDEPEND is
> None.

I think Bernhard's suggestion was the best one here so I've done that.
To be honest I thought Khem had updated the patch.

Cheers,

Richard


