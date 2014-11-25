Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9FDF0722C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:58:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2014 09:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="421371586"
Received: from justinda-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.255.13.149])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2014 09:48:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 25 Nov 2014 17:58:32 +0000
Message-ID: <354237917.MY19O5VeQW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CANyK_8eHmuktc=tzdJOkWqzeUm2XLWxSToj51yC=5xhew5yYgQ@mail.gmail.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<34bc6edfa0a43ee42f91fab28d009a8c3814b44a.1416934753.git.paul.eggleton@linux.intel.com>
	<CANyK_8eHmuktc=tzdJOkWqzeUm2XLWxSToj51yC=5xhew5yYgQ@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/7] lib/oe/patch: fall back to patch if git apply fails
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
X-List-Received-Date: Tue, 25 Nov 2014 17:58:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul,

On Tuesday 25 November 2014 17:40:24 Paul Barker wrote:
> On 25 November 2014 at 17:28, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > When PATCHTOOL = "git", git apply doesn't support fuzzy application, so
> > if a patch requires that it's better to be able to apply it rather than
> > just failing.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/lib/oe/patch.py | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > index b085c9d..788f465 100644
> > --- a/meta/lib/oe/patch.py
> > +++ b/meta/lib/oe/patch.py
> > 
> > @@ -219,7 +219,11 @@ class GitApplyTree(PatchTree):
> >              return _applypatchhelper(shellcmd, patch, force, reverse,
> >              run)
> >          
> >          except CmdError:
> >              shellcmd = ["git", "--git-dir=.", "apply", "-p%s" %
> >              patch['strippath']]
> > 
> > -            return _applypatchhelper(shellcmd, patch, force, reverse,
> > run)
> > +            try:
> > +                output = _applypatchhelper(shellcmd, patch, force,
> > reverse, run) +            except CmdError:
> > +                output = PatchTree._applypatch(self, patch, force,
> > reverse, run) +            return output
> 
> Would this give a warning or other notification if the fallback to
> 'patch' is used? When developing patches it'd probably be good to know
> whether they're exactly correct or not.

In the context I'm attempting to use it I'd want it not to warn in this case, 
but I can see that in normal usage if you've explicitly elected to use 
PATCHTOOL = "git" it could be that you do expect all patches for the recipe to 
apply that way and want to see a warning if they don't.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

