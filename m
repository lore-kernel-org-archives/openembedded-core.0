Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7586D6F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 15:44:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2FFiALW013067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 08:44:10 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.22.17) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Fri, 15 Mar 2019 08:44:09 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 15 Mar 2019 11:44:09 -0400
Message-ID: <4551918.WFr7QzWy3N@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <1934985.lny8BXKYyr@yow-masselst-lx1>
References: <1552593854-14059-1-git-send-email-mark.asselstine@windriver.com>
	<CAJ86T=WWWxg3aLGWUQtFn+CD7ruoBh9HFoBWebafQm4MK+2RbA@mail.gmail.com>
	<1934985.lny8BXKYyr@yow-masselst-lx1>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [v2][PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for valid cortexa* targets
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
X-List-Received-Date: Fri, 15 Mar 2019 15:44:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, March 15, 2019 9:28:16 AM EDT Mark Asselstine wrote:
> On Thursday, March 14, 2019 7:44:36 PM EDT Andre McCurdy wrote:
> > On Thu, Mar 14, 2019 at 1:05 PM Mark Asselstine
> > 
> > <mark.asselstine@windriver.com> wrote:
> > > Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
> > > building for ARMv5, ARMv6 and ARMv7. The current code in go_map_arm()
> > > does not account for the Cortex* TUNINGs and as such misses several
> > > Cortex variants which implement ARMv7. Here we add an additional check
> > > that will include Cortex-A5 through Cortex-A17 as ARMv7 variants
> > > (ie. GOARM='7'). The Cortex-R and Cortex-M variants are also captured
> > > even though there are no tunings for these currently (lack MMU support
> > > so not supported).
> > > 
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > > 
> > > V2
> > > * Cover all ARMv7 Cortex* variants
> > 
> > Still worried this might not be complete. It's basically fixing the
> > fallout from Khem's patches to remove -march options from the CPU
> > specific ARM machine includes, right?
> 
> Although this came in via meta-virtualization, which I usually review most
> changes, I wasn't involved in the original implementation or discussion of
> go_map_arm() and since I was simply extending the existing framework I
> didn't go back and look into the history.
> 
> Looking now I don't see any specific discussions as to why TUNE_FEATURES
> were used instead of something else, such as the overrides. My guess is it
> had to be something and the original implementation was incorrectly
> oversimplified so the level of complexity was equivalent to any other
> choice.
> 
> At any rate I will review if changing to something else such as overrides
> would simplify the now more complex logic but until I investigate I would
> hesitate to say that the approach will be any less prone to breaking.
> 
> > If so then any ARM machine with
> > CPU specific tuning (other than cortex) is still going to be affected.
> > 
> > What's the reason for parsing TUNE_FEATURES to detect the ARM
> > architecture level?
> 
> That's just what was in place when I started to work on this.
> 
> > Couldn't GOARM be set correctly just by using of
> > the _armv5, _armv6, _armv7a and _armv7ve over-rides?
> 
> At a quick glance I would say yes, but again I need to poke around to see if
> this is just swapping one thing for another with no real gains.

The MACHINEOVERRIDES do already distill down the TUNE_FEATURES so yes we could 
potentially use this to the logic from getting more complex. After digging 
around the various tuning/maching/arch files I don't see any exceptions (at 
least none are immediately visible). Would you be happier with the following:

---
 HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
-HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('BASE_GOARM'), d)}"
 HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOMIPS = "${@go_map_mips(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
 TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
 TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
-TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('BASE_GOARM'), d)}"
 TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
+# Use the MACHINEOVERRIDES to map ARM CPU architecture passed to GO via GOARM.
+# This is combined with *_ARCH to set HOST_GOARM and TARGET_GOARM.
+BASE_GOARM = ''
+BASE_GOARM_armv7ve = '7'
+BASE_GOARM_armv7a = '7'
+BASE_GOARM_armv6 = '6'
+BASE_GOARM_armv5 = '5'
+
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
 GO_DYNLINK = ""
@@ -74,12 +82,7 @@ def go_map_arch(a, d):
 def go_map_arm(a, f, d):
     import re
     if re.match('arm.*', a):
-        if 'armv7' in f:
-            return '7'
-        elif 'armv6' in f:
-            return '6'
-        elif 'armv5' in f:
-            return '5'
+        return f
     return ''
---

Before I send out a V3 can you comment if the above would be
inline with your expectations?

Thanks
MarkA

> 
> >   https://github.com/golang/go/wiki/GoArm
> 
> I already reference this in my commit log. Is there a reason you are
> highlighting this again?
> 
> MarkA
> 
> > >  meta/classes/goarch.bbclass | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > > index 39fea5e..84977a5 100644
> > > --- a/meta/classes/goarch.bbclass
> > > +++ b/meta/classes/goarch.bbclass
> > > 
> > > @@ -74,6 +74,10 @@ def go_map_arch(a, d):
> > >  def go_map_arm(a, f, d):
> > >      import re
> > > 
> > >      if re.match('arm.*', a):
> > > +        for el in f.split():
> > > +            m = re.match("cortex[arm](\d.*)", el)
> > > +            if m and int(m.group(1)) < 32:
> > > +               return '7'
> > > 
> > >          if 'armv7' in f:
> > >              return '7'
> > >          
> > >          elif 'armv6' in f:
> > > --
> > > 2.7.4
> > > 
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core





