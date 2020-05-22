Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web10.21003.1590178369470178121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 13:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=JMH32iTn;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb ([80.229.24.9])
	by smtp with ESMTP
	id cE27jj1MSkvt5cE28jIqb0; Fri, 22 May 2020 21:12:47 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ENCdL2RC c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=sTwFKg_x9MkA:10 a=Q4-j1AaZAAAA:8 a=ceLnqgCdCAG6UBNEmBcA:9
 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=k+E25i0dPC21/NUmQVsjCmT+4RBj2Fd99T4tP4ckzuA=; b=JMH32
	iTnj1J3IrOy8b7Kq7jRuHHHeZ4P3bJeNcfHVoj2joFgVnQSClv1fjDAYyEbcUU9RCItJtAsHWNXeh
	I87N530wRouwVCOK6Qoolboi8IXR1VLdLw3yIYv0Q1jAik1S7KJzkqAipuniEfnUQVmh9DbAx/z+J
	x3//Dag8dsgbiGbw7forLAcOMMAOVVo9HGah9bxEXMI3HkwAe9a2ow+t0vouijb3HaH5LRBVrMZjl
	aDqtjQ4eioamRM7gNh48NRbPvghgBHiP6IHFs41ZGbutG24M423alDrTwogWwjJ4xKP+lKb8biJVg
	YejJoJbI3zfYa56Au69gb3ff88Uvg==;
Received: from mac by deneb with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1jcE27-0006Gv-NH; Fri, 22 May 2020 21:12:43 +0100
Date: Fri, 22 May 2020 21:12:43 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] rm_work causes image tasks to re-run
Message-ID: <20200522201243.GB21451@mcrowe.com>
References: <20200522081359.GA1428@mcrowe.com>
 <b1fcf4c9-9d0a-742b-fa36-1325b09457a1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b1fcf4c9-9d0a-742b-fa36-1325b09457a1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfFrrwxYENVLKaCgap1md7zN+iCoYod7dceqfj5BpgIGBk2mKF6LGV172DEO6B9vF4qGZHdrBQfcUft4t6H1lvX+iIvUHil0oVWhe5WggYgoL17RnAIhN
 Uex8ZiNU4kQLJ5WEpoTUzo8UNirkK63PlyLaqN9M/ouS4VXUwLb1BU6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 22 May 2020 at 19:02:47 +0200, Jacob Kroon wrote:
> Hi Mike,
> 
> On 5/22/20 10:13 AM, Mike Crowe via lists.openembedded.org wrote:
> > When we have rm_work enabled all image tasks are built every time. This has
> > been happening since at least warrior and is still happening as of master
> > today (8fc19639f47b959a141dae231395bbababa644e1).
> > 
> > Steps to reproduce:
> > 
> >   bitbake core-image-minimal
> >   bitbake core-image-minimal
> >   echo 'INHERIT += "rm_work"' >> conf/local.conf
> >   bitbake core-image-minimal
> >   bitbake core-image-minimal
> > 
> > The second invocation of bitbake doesn't build anything at all (as would be
> > expected.)
> > 
> > The fourth invocation of bitbake always builds:
> > 
> >   Sstate summary: Wanted 43 Found 43 Missed 0 Current 436 (100% match, 100% complete)
> >   NOTE: Executing Tasks
> >   NOTE: Setscene tasks completed
> >   NOTE: Running noexec task 1750 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_rm_work_all)
> >   NOTE: Running task 1998 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_populate_lic_deploy)
> >   NOTE: recipe core-image-minimal-1.0-r0: task do_populate_lic_deploy: Started
> >   NOTE: recipe core-image-minimal-1.0-r0: task do_populate_lic_deploy: Succeeded
> >   NOTE: Running task 1999 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_rm_work)
> >   NOTE: recipe core-image-minimal-1.0-r0: task do_rm_work: Started
> >   NOTE: recipe core-image-minimal-1.0-r0: task do_rm_work: Succeeded
> >   NOTE: Running noexec task 2000 of 2000 (/fast2/mac/git/oe-core/meta/recipes-core/images/core-image-minimal.bb:do_build)
> >   NOTE: Tasks Summary: Attempted 2000 tasks of which 1996 didn't need to be rerun and all succeeded.
> > 
> > If I teach rm_work.bbclass to also skip files matching
> > "*do_populate_lic_deploy*" then this problem goes away. However, I have
> > form for breaking things in rm_work so I suspect that this isn't the
> > correct fix. Is there a better one?
> > 
> > Thanks.
> > 
> > Mike.
> > 
> 
> Since I'm the last guy touching rm_work.bbclass ...
> 
> I don't see the rebuilds in my images. Although I do see
> 
> core-image-minimal.bb:do_populate_lic_deploy
> 
> being run, there is no regeneration of the rootfs images.

I was originally investigating on warrior where the do_rootfs task does run
unnecessarily. It turns out that if I cherry-pick the three subsequent
rm_work changes from master back to warrior then it behaves the same as
master. I shall do that in our tree.

Is it possible to avoid the do_populate_lic_deploy task running
unnecessarily on master too?

Thanks.

Mike.
