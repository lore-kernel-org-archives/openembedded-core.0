Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Ssaf9-000131-BQ
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 16:28:07 +0200
Received: by qcad10 with SMTP id d10so2485553qca.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2012 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+b66R+noe60HTZQI174okSy081UYFRPO4kxHUs7Kzlg=;
	b=wDGN2t1OPRqvN0UsVOkGFp1Jq/4nseCsrxuhSsfUMBuV0VR9lpolHnjkHjK6NlqFkQ
	Q+psfu3NT8p1zvF2LqF9ud8FD3QQqFYSMyex4s8DWbjEOAeM3/5S1pVPMLuDD0hk61Bx
	z5C2Z5FtWgsDeugSt18tugOlQ6MBQK7DV4c0WYQGytzGMOuj0J9H+ldS+FDTDvirc3Rf
	wljFFj4I4LNs/hkC9N28dXwltt8LqlRRZkehuYoV66U0rvimkS317dLDvUSKYhqUxxPV
	ibOaEH/OBWhuj9T9TFqYCuiPnFnvAm0sFK5seTuM2JNVRA6CtpM9noBC4yxYXC2uil2p
	83dw==
MIME-Version: 1.0
Received: by 10.224.208.194 with SMTP id gd2mr15296216qab.96.1342880202585;
	Sat, 21 Jul 2012 07:16:42 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 21 Jul 2012 07:16:42 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207211007310.12925@oneiric>
References: <alpine.DEB.2.02.1207210937520.12672@oneiric>
	<CADkTA4OwDUL7juQdSyPZ=vH0geQ6Ses2_ePLPPzq2_FEnH94zg@mail.gmail.com>
	<alpine.DEB.2.02.1207211007310.12925@oneiric>
Date: Sat, 21 Jul 2012 10:16:42 -0400
Message-ID: <CADkTA4NhrmdWfkeHUQRmpDBQcpLFyC19HkAAq0Fr_xJnN9rgUA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: what's the point of the "defconfig" arg to check_branch?
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
X-List-Received-Date: Sat, 21 Jul 2012 14:28:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 21, 2012 at 10:10 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> On Sat, 21 Jul 2012, Bruce Ashfield wrote:
>
>> On Sat, Jul 21, 2012 at 9:44 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>> >
>> >   in the createme() kern-tools utility:
>> >
>> > # checks and creates the branch that was indicated when creatme was
>> > # called. This branch is what is expected to contain the kernel content
>> > # being built
>> > check_branch() {
>> >         branch=$1
>> >         defconfig=$2   <-- ??????
>> >
>> >         ktgt=$branch
>> >
>> >         old_pwd=`pwd`
>> >         git show-ref --quiet --verify -- "refs/heads/$ktgt"
>> >         if [ $? -eq 1 ]; then
>> >                 if [ "$repo" == "external" ]; then
>> >                         git checkout -b $ktgt
>> >                 fi
>> >                 mkdir -p $meta_dir/cfg/scratch/obj
>> >         else
>> >                 # branch exists. Are we an 'external repo' ?
>> >                 if [ "$repo" == "external" ]; then
>> >                         git checkout $ktgt
>> >                 fi
>> >         fi
>> >
>> >         cd $old_pwd
>> > }
>> >
>> >   it doesn't seem like that second argument is being used, and i don't
>> > see anything in the log that explains it, but perhaps i just missed
>> > it.
>>
>> It used to be used to propagate a defconfig into the build, but not
>> anymore. Just a leftover at this point. A patch to remove it would
>> be accepted :)
>
>   ok, but once that reference is gone, doesn't that make *all*
> reference to "defconfig" in createme superfluous?  it would seem that
> the shell function check_defconfig() becomes unnecessary as well.
> again, unless i'm missing something.

At the moment it would be, but I'd keep that around, since it is a useful
sanity check on the tree (i.e if it can't find any defconfig, something
horrible is wrong with the tree).

Cheers,

Bruce

>
>   if you want to clarify that, i'll whip up a patch.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


