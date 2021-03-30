Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.646.1617141584157783128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 14:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8E56140C16;
	Tue, 30 Mar 2021 21:59:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTxJ_LOHaw8u; Tue, 30 Mar 2021 21:59:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 647D140BA9;
	Tue, 30 Mar 2021 21:59:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 29D83174568; Tue, 30 Mar 2021 17:59:41 -0400 (EDT)
Date: Tue, 30 Mar 2021 17:59:41 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Message-ID: <20210330215941.GD23013@denix.org>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <CADkTA4NsocrBk0aRdqKqorWAuePMJd4O3g+K40j0J8zLrt7sLQ@mail.gmail.com>
 <AM9PR09MB464265DE482819EB7D2B92C7A87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <BB675BE1-5F64-495F-98DA-8A2A3D857691@gmail.com>
 <70419FA6-9CA2-4B42-B4A2-6CC264DE163E@gmail.com>
MIME-Version: 1.0
In-Reply-To: <70419FA6-9CA2-4B42-B4A2-6CC264DE163E@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The link is for a 10-year old bug, probably not what you wanted.
Also, if a patch fixes existing bug in bugzilla, it needs to reference it in 
commit message as well - [YOCTO#1234567]


On Mon, Mar 29, 2021 at 12:37:45PM -0300, Devendra Tewari wrote:
> Also, this is due to https://bugzilla.yoctoproject.org/show_bug.cgi?id=1430.
> 
> > On 29 Mar 2021, at 12:35, Devendra Tewari <devendra.tewari@gmail.com> wrote:
> > 
> > Sure.
> > 
> > Would the following commit message be sufficient?
> > 
> >    Use shutil.move when os.rename fails
> > 
> >    Incremental build in Docker fails with
> > 
> >    OSError: [Errno 18] Invalid cross-device link
> > 
> >    When source and destination are on different overlay filesystems.
> > 
> >    This change handles the error with os.rename and retries with shutil.move.
> > 
> > Thanks,
> > Devendra
> > 
> >> On 29 Mar 2021, at 12:23, Konrad Weihmann <kweihmann@outlook.com> wrote:
> >> 
> >> Yes please quote a bit from the python manpage [1] - I certainly see the difference (and the edge cases where os.rename might fail), but that should be documented as part of the commit message
> >> 
> >> [1] https://docs.python.org/3/library/shutil.html#shutil.move
> >> 
> >> On 29.03.21 17:21, Bruce Ashfield wrote:
> >>> Can you document the cases that os.rename() is failing ? And also why
> >>> would we expect the shutil.move() to work in those cases ?
> >>> If a change like this cases issues in the future, we need that extra
> >>> information in the commit head for proper triage.
> >>> Bruce
> >>> On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari
> >>> <devendra.tewari@gmail.com> wrote:
> >>>> 
> >>>> ---
> >>>> meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
> >>>> 1 file changed, 22 insertions(+), 4 deletions(-)
> >>>> 
> >>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> >>>> index f579168162..f94aa96d70 100644
> >>>> --- a/meta/classes/sstate.bbclass
> >>>> +++ b/meta/classes/sstate.bbclass
> >>>> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
> >>>> def sstate_installpkgdir(ss, d):
> >>>>     import oe.path
> >>>>     import subprocess
> >>>> +    import shutil
> >>>> 
> >>>>     sstateinst = d.getVar("SSTATE_INSTDIR")
> >>>>     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
> >>>> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
> >>>> 
> >>>>     for state in ss['dirs']:
> >>>>         prepdir(state[1])
> >>>> -        os.rename(sstateinst + state[0], state[1])
> >>>> +        try:
> >>>> +            os.rename(sstateinst + state[0], state[1])
> >>>> +            break
> >>>> +        except OSError:
> >>>> +            shutil.move(sstateinst + state[0], state[1])
> >>>>     sstate_install(ss, d)
> >>>> 
> >>>>     for plain in ss['plaindirs']:
> >>>> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
> >>>>         dest = plain
> >>>>         bb.utils.mkdirhier(src)
> >>>>         prepdir(dest)
> >>>> -        os.rename(src, dest)
> >>>> +        try:
> >>>> +            os.rename(src, dest)
> >>>> +            break
> >>>> +        except OSError:
> >>>> +            shutil.move(src, dest)
> >>>> 
> >>>>     return True
> >>>> 
> >>>> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
> >>>> 
> >>>> def sstate_package(ss, d):
> >>>>     import oe.path
> >>>> +    import shutil
> >>>> 
> >>>>     tmpdir = d.getVar('TMPDIR')
> >>>> 
> >>>> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
> >>>>                     continue
> >>>>                 bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
> >>>>         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
> >>>> -        os.rename(state[1], sstatebuild + state[0])
> >>>> +        try:
> >>>> +            os.rename(state[1], sstatebuild + state[0])
> >>>> +            break
> >>>> +        except OSError:
> >>>> +            shutil.move(state[1], sstatebuild + state[0])
> >>>> 
> >>>>     workdir = d.getVar('WORKDIR')
> >>>>     sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
> >>>> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
> >>>>             pdir = plain.replace(sharedworkdir, sstatebuild)
> >>>>         bb.utils.mkdirhier(plain)
> >>>>         bb.utils.mkdirhier(pdir)
> >>>> -        os.rename(plain, pdir)
> >>>> +        try:
> >>>> +            os.rename(plain, pdir)
> >>>> +            break
> >>>> +        except OSError:
> >>>> +            shutil.move(plain, pdir)
> >>>> 
> >>>>     d.setVar('SSTATE_BUILDDIR', sstatebuild)
> >>>>     d.setVar('SSTATE_INSTDIR', sstatebuild)
> >>>> --
> >>>> 2.29.2
> >>>> 
> >>>> 
> >>>> 
> >>>> 
> >>> 
> > 
> 
