Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1S0LwH-0004hk-NB
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 00:49:38 +0100
Received: by pbbjt11 with SMTP id jt11so68592pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 15:41:16 -0800 (PST)
Received-SPF: pass (google.com: domain of kergoth@gmail.com designates
	10.68.131.98 as permitted sender) client-ip=10.68.131.98; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of kergoth@gmail.com
	designates 10.68.131.98 as permitted sender)
	smtp.mail=kergoth@gmail.com;
	dkim=pass header.i=kergoth@gmail.com
Received: from mr.google.com ([10.68.131.98])
	by 10.68.131.98 with SMTP id ol2mr86717796pbb.138.1329954076389
	(num_hops = 1); Wed, 22 Feb 2012 15:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type;
	bh=de+obIAlFMOFf1ggfAApQlvYxoDi0SKWXPZX95stJFg=;
	b=pyGgdpKGlhZCK+E70O+ZAPQpZeahRoU5gKn3iLUXB8eRraCoge+kDWbRooRhXD9sIW
	fufLnfOGpojK3RqW8FlUvuuRgKzAZViItIk7spjAYiDmv1/UWMsQTpUBV229ixo56Zmc
	mQb3cTtkHEiBdgR5thJLFtU4Fe83JNoL2KgBA=
Received: by 10.68.131.98 with SMTP id ol2mr71741800pbb.138.1329954076294;
	Wed, 22 Feb 2012 15:41:16 -0800 (PST)
Received: from frey.local (ip24-251-167-38.ph.ph.cox.net. [24.251.167.38])
	by mx.google.com with ESMTPS id q10sm31754284pbb.10.2012.02.22.15.41.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Feb 2012 15:41:14 -0800 (PST)
Date: Wed, 22 Feb 2012 16:41:11 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <E9FAD6E1E68141CCA2CF166F1762B320@gmail.com>
In-Reply-To: <CAHQecY7-=cwCA7PXYhf3xes+SMsWo6qffwkQk6ckzRsP5ys7oA@mail.gmail.com>
References: <4F457B4B.4000507@palm.com>
	<CAHQecY7-=cwCA7PXYhf3xes+SMsWo6qffwkQk6ckzRsP5ys7oA@mail.gmail.com>
X-Mailer: sparrow 1.5 (build 1043.1)
MIME-Version: 1.0
Subject: Re: sharing DL_DIR?
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
X-List-Received-Date: Wed, 22 Feb 2012 23:49:38 -0000
Content-Type: multipart/alternative; boundary="4f457d17_507ed7ab_1049f"

--4f457d17_507ed7ab_1049f
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I share it as well. I don't see locks being a big issue for most things, as the worst case is a re-download, not use of a corrupt or incomplete file, due to the completion stamps.

-- 
Christopher Larson


On Wednesday, February 22, 2012 at 4:39 PM, Tom King wrote:

> I have a single downloads directory with symlinks for every target build I have to that directory.  As long as I have the source already in there I don't fetch  it again
> 
> Tom
> 
> On Wed, Feb 22, 2012 at 1:33 PM, Rich Pixley <rich.pixley@palm.com (mailto:rich.pixley@palm.com)> wrote:
> > Is it reasonable to expect to share DL_DIR between multiple builds?
> > 
> > That is, are downloads properly locked so that multiple concurrent downloads of the same file won't collide?  And if so, are they NFS safe locks?
> > 
> > Or must each build download it's own copies of every component?
> > 
> > I ask because our, (Palm), branch has been, but it's a bit of a nuisance to pick a suitable locking mechanism that is both functional and performant.
> > Flock/lockf aren't reliably supported in heterogeneous environments. 
> > The old lockfiles don't work over NFS. Lock directories apparently do, but trying to clean these up after interruptions or failures is a losing battle so if we do use these, we end up with orphan locks periodically.
> > With NFS as a possibility, we can't assume any kernel local IPC mechanism, so sysV ipc is out.
> > It seems like a pretty huge overhead to try to create any sort of zeroconf overhead.
> > 
> > Our solution so far has been to use NFS lock directories for multiple machine builds and flock/lockf for single machine builds.  This mostly works, though it's not ideal, and it's significantly faster than downloading/copying all of the component source multiple times even over local mirrors.
> > --rich
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> > 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4f457d17_507ed7ab_1049f
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


                <div style=3D=22font-family: Helvetica; font-size: 13px; =
=22>I share it as well. I don't see locks being a big issue for most thin=
gs, as the worst case is a re-download, not use of a corrupt or incomplet=
e file, due to the completion stamps.<br></div>
                <div><div><br></div><div>--&nbsp;</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D=22color: =23A0A0A8;=22>On Wednesday, =46ebrua=
ry 22, 2012 at 4:39 PM, Tom King wrote:</p>
                <blockquote type=3D=22cite=22 style=3D=22border-left-styl=
e:solid;border-width:1px;margin-left:0px;padding-left:10px;=22>
                    <span><div><div>I have a single downloads directory w=
ith symlinks for every target build I have to that directory. &nbsp;As lo=
ng as I have the source already in there I don't fetch &nbsp;it again<div=
><br></div><div>Tom<br><br><div>
On Wed, =46eb 22, 2012 at 1:33 PM, Rich Pixley <span dir=3D=22ltr=22>&lt;=
<a href=3D=22mailto:rich.pixley=40palm.com=22>rich.pixley=40palm.com</a>&=
gt;</span> wrote:<br><blockquote type=3D=22cite=22><div>

  =20

    =20
  =20
  <div bgcolor=3D=22=23=46=46=46=46=46=46=22 text=3D=22=23000000=22>
    Is it reasonable to expect to share DL=5FDIR between multiple builds=3F=
<br>
    <br>
    That is, are downloads properly locked so that multiple concurrent
    downloads of the same file won't collide=3F&nbsp; And if so, are they=
 N=46S
    safe locks=3F<br>
    <br>
    Or must each build download it's own copies of every component=3F<br>=

    <br>
    I ask because our, (Palm), branch has been, but it's a bit of a
    nuisance to pick a suitable locking mechanism that is both
    functional and performant.<br>
    <ul>
      <li>=46lock/lockf aren't reliably supported in heterogeneous
        environments.</li>
      <li>The old lockfiles don't work over N=46S. Lock directories
        apparently do, but trying to clean these up after interruptions
        or failures is a losing battle so if we do use these, we end up
        with orphan locks periodically.</li>
      <li>With N=46S as a possibility, we can't assume any kernel local
        IPC mechanism, so sysV ipc is out.</li>
      <li>It seems like a pretty huge overhead to try to create any sort
        of zeroconf overhead.</li>
    </ul>
    <p>Our solution so far has been to use N=46S lock directories for
      multiple machine builds and flock/lockf for single machine
      builds.&nbsp; This mostly works, though it's not ideal, and it's
      significantly faster than downloading/copying all of the component
      source multiple times even over local mirrors.<span><font color=3D=22=
=23888888=22><br>
    </font></span></p><span><font color=3D=22=23888888=22>
    --rich<br>
  </font></span></div>

<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<=
br>
Openembedded-core mailing list<br>
<a href=3D=22mailto:Openembedded-core=40lists.openembedded.org=22>Openemb=
edded-core=40lists.openembedded.org</a><br>
<a href=3D=22http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-core=22 target=3D=22=5Fblank=22>http://lists.linuxtogo.org/cgi-bin/m=
ailman/listinfo/openembedded-core</a><br>
<br></div></blockquote></div><br></div>
</div><div><div>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F</div><div>Openembedded-core mailing list</div><div><a href=3D=22=
mailto:Openembedded-core=40lists.openembedded.org=22>Openembedded-core=40=
lists.openembedded.org</a></div><div><a href=3D=22http://lists.linuxtogo.=
org/cgi-bin/mailman/listinfo/openembedded-core=22>http://lists.linuxtogo.=
org/cgi-bin/mailman/listinfo/openembedded-core</a></div></div></div></spa=
n>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            

--4f457d17_507ed7ab_1049f--
