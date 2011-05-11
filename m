Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKCwv-00084q-9a
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 19:11:49 +0200
Received: by eye27 with SMTP id 27so211490eye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=b5FfhaECNgUSetb91v8PWYAXZjkae3fwUGge9tdgDAw=;
	b=Hj6d1F2KW3k3JYykAS7DRPM4W+s4qVkvrBYJEdM8BIL6cm2NVBpSt1MJ3W7LJJSY4f
	Zj8MgTb1o7VcslmaUqt/7iLILo/S/yzY2xGelbdiIOtgmctNwERCdyK/koMmsOqhsDa8
	W35Z0YLW5MKlcEE6dscx/tCBCOz63PQKGaWac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=KNj/iZwylVxzSWDVUkKMQBYHGmikp3lGKvzhj5beOHc/J1Ah+hAmGwoaco12gj985O
	RYJMd1hvoLLahtCFnUoVrCaFx6Or2xaSUeYyV+qZH+85ezR2AXXTqYP1mTakDWM55qPc
	t6IG4qyqTTKNY7qYWuw2Bu1TQ9U4fTjtsd1pU=
Received: by 10.14.15.78 with SMTP id e54mr4369331eee.80.1305133741249; Wed,
	11 May 2011 10:09:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Wed, 11 May 2011 10:01:15 -0700 (PDT)
In-Reply-To: <4DCAB609.8030601@linux.intel.com>
References: <4DCAB609.8030601@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2011 10:01:15 -0700
Message-ID: <BANLkTintvgFGKUUUdvq2M7Q=m+gYuzs2-A@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Wed, 11 May 2011 17:11:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 9:15 AM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> Between myself and others, there are several outstanding proposals to
> modify the pull-request scripts. Patches have been sent, but nothing has
> been merged due to a lack of consensus. I thought I would summarize what
> I see to be the current weaknesses of the scripts and my proposal to
> address them. I would like your feedback to ensure we have tools that
> meet the needs of a broad user base. Once we agree, I'll be happy to
> write up the patches or help review those written by others.
>
> 1) send-pull-request is too aggressive with the auto-cc feature (Khem
> =C2=A0 Raj)
>
> =C2=A0 One of the reasons I wrote these scripts was out of frustration wi=
th
> =C2=A0 git-send-email which allowed for a cover letter, but didn't includ=
e
> =C2=A0 all the collected addresses on it. The current script sends every
> =C2=A0 message to all the collected addresses. Khem (and others) have fou=
nd
> =C2=A0 this behavior to be sub-optimal, if not down right annoying.
>
> =C2=A0 I propose it be modified to only use the addresses local to each
> =C2=A0 patch for the patches and all the collected addresses only for the
> =C2=A0 cover letter.
>
> =C2=A0 a) Do people agree with this policy? If not, and people prefer the
> =C2=A0 =C2=A0 =C2=A0cover-letter only be sent to the recipients specified=
 on the
> =C2=A0 =C2=A0 =C2=A0command line, then this script doesn't add any real v=
alue over
> =C2=A0 =C2=A0 =C2=A0'git request-pull' and 'git send-email', and users ca=
n easily
> =C2=A0 =C2=A0 =C2=A0wrap those on their own.
>
> 2) create-pull-request needs to facilitate the use of multiple
> =C2=A0 repositories (Tom Rini)
>
> =C2=A0 Some folks find gitorious or github work best for their use. It is
> =C2=A0 also reasonable to want to use this script with independent layers=
.
> =C2=A0 Tom proposed a -l option to specify the PULL_URL leaving some
> =C2=A0 boiler-plate text in the cover-letter for the user to populate.
>
> =C2=A0 This dovetails with something I've been considering. Rather than
> =C2=A0 duplicate the generation of a pull request cover letter, I'd like =
to
> =C2=A0 see us re-use the output of 'git request-pull'. This has the added
> =C2=A0 benefit of sanity checking the URL and commits. It does however
> =C2=A0 remove the concept of the BROWSE_URL. We could add the BROWSE_URL
> =C2=A0 back for recognized locations (git.yoctoproject.org, gitorious, an=
d
> =C2=A0 github I believe).
>
> =C2=A0 Some have expressed a desire for the URL to be automatically
> =C2=A0 discoverable. We could try and extract this information from the
> =C2=A0 current branch and a remote of a specific name, with some URL
> =C2=A0 rewrites to convert ssh access to generic git access. Unfortunatel=
y,
> =C2=A0 this approach breaks under several conditions. I would prefer that
> =C2=A0 these scripts not be tied to any particular naming conventions for
> =C2=A0 the git branches or remotes.
>
> =C2=A0 I propose we go with something very similar to Tom's -l PULL_URL
> =C2=A0 proposal and replace the cover letter generation with the output o=
f
> =C2=A0 'git request-pull'. The PULL_URL should also be able to be specifi=
ed
> =C2=A0 via an environment variable. Now that we are sending patches for
> =C2=A0 review and not just the pull request itself, I feel we can drop th=
e
> =C2=A0 BROWSE_URL.
>
> 3) Rely on git-send-email exclusively (Darren Hart)
>
> =C2=A0 When I originally wrote these scripts, not all the users were
> =C2=A0 particularly familiar with git and others may have already had
> =C2=A0 a local sendmail client configured. At the time I thought it prude=
nt
> =C2=A0 to decouple the mail process from git. In retrospect, this serves
> =C2=A0 only to unnecessarily complicate the send script as users must all
> =C2=A0 learn git to effectively work within the OE and Yocto environments=
.
> =C2=A0 If a local MTA is available, git can be configured to use that. Th=
ere
> =C2=A0 is no advantage that I can see to maintain both sending mechanisms
> =C2=A0 in the scripts. They add complexity and complicate debugging and
> =C2=A0 maintenance.
>
> =C2=A0 I propose the local sendmail mechanism be removed from send-pull-
> =C2=A0 request and that it rely exclusively on 'git send-email'.
>
> 3) Rewrite the scripts in python (Tom)
>
> =C2=A0 While I agree that anything of any significant complexity is bette=
r
> =C2=A0 written in python than bash, I feel that with the above changes, t=
he
> =C2=A0 current scripts will be smaller and remain simple enough for bash =
to
> =C2=A0 be a viable option.
>
> =C2=A0 I propose we leave the scripts in bash for the time being, leaving
> =C2=A0 the door open to rewrite them at a later date should their complex=
ity
> =C2=A0 increase to merit the effort.
>
>
> Thoughts/Comments?
>

I would suggest to alter the process a bit and get rid of the scripts
completely. Patches are sent to mailing list for review once reviewed
the final patches are
sent as git pull-request. It would simplify things.

> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>


